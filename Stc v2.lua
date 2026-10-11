<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>STC Hub - Text Style Generator</title>
  <style>
    :root{
      --bg-dark: #0b0f0f;
      --bg-deep: #080b0d;
      --panel: #1b0d0c;
      --panel-2: #2a100d;
      --panel-soft: rgba(76, 29, 26, 0.9);
      --red: #ff2b2b;
      --red-dark: #a31818;
      --green: #1dfc59;
      --green-dark: #0e9f45;
      --text: #f1d8d2;
      --muted: rgba(255,255,255,0.72);
      --line: rgba(255,255,255,0.08);
      --shadow: rgba(0,0,0,0.45);
      --sidebg: rgba(20, 20, 20, 0.85);
      --panel-header: #250d0d;
      --target-bg: #2c1110;
      --input-bg: #2e100d;
      --chip: #8a2a1e;
      --highlight: #ff4c4c;
      --green-soft: #40ff72;
      --btn-text: #fffaf7;
    }

    * { box-sizing: border-box; }

    html, body {
      margin: 0;
      width: 100%;
      height: 100%;
      font-family: Arial, Helvetica, sans-serif;
      background: #3c3f3b;
      overflow: hidden;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 12px;
    }

    .scene {
      position: relative;
      width: 100%;
      max-width: 1460px;
      height: 820px;
      background:
        linear-gradient(180deg, rgba(0,0,0,0.15), rgba(0,0,0,0.15)),
        linear-gradient(135deg, #8d8f8d 0%, #7d7f7a 26%, #a5a8a0 28%, #4ea744 29%, #0f6d18 50%, #0c5a1a 100%);
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 14px 28px rgba(0,0,0,0.35);
    }

    .scene::before {
      content: "";
      position: absolute;
      inset: 0;
      background:
        linear-gradient(120deg, rgba(255,255,255,0.12), transparent 30%, transparent 70%, rgba(255,255,255,0.08)),
        linear-gradient(90deg, rgba(27,34,25,0.08) 0 18%, transparent 18% 100%);
      pointer-events: none;
    }

    .left-float {
      position: absolute;
      left: 26px;
      top: 215px;
      width: 120px;
      height: 250px;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      color: white;
      z-index: 6;
      opacity: 0.95;
    }

    .left-float .badge {
      width: 82px;
      height: 82px;
      border-radius: 50%;
      background: #0d0d0d;
      border: 3px solid rgba(255,255,255,0.2);
      box-shadow: inset 0 0 12px rgba(255,255,255,0.05);
      position: relative;
      margin-bottom: 18px;
    }

    .left-float .badge::before {
      content: "";
      position: absolute;
      width: 28px;
      height: 28px;
      left: 27px;
      top: 28px;
      background: rgba(255,255,255,0.9);
      border-radius: 8px;
      transform: skewY(-8deg);
    }

    .left-float .badge::after {
      content: "";
      position: absolute;
      width: 12px;
      height: 12px;
      left: 46px;
      top: 18px;
      background: rgba(255,255,255,0.9);
      border-radius: 4px;
      box-shadow: -10px 4px 0 rgba(255,255,255,0.9);
    }

    .mini-btn {
      width: 72px;
      height: 48px;
      border-radius: 12px;
      background: rgba(255,255,255,0.1);
      border: 2px solid rgba(255,255,255,0.16);
      position: relative;
      margin-bottom: 16px;
      box-shadow: inset 0 0 12px rgba(255,255,255,0.03);
    }

    .mini-btn.menu::before,
    .mini-btn.menu::after {
      content: "";
      position: absolute;
      left: 18px;
      right: 18px;
      height: 3px;
      background: rgba(255,255,255,0.9);
      border-radius: 4px;
    }

    .mini-btn.menu::before { top: 16px; }
    .mini-btn.menu::after { top: 28px; }

    .mini-btn.chat {
      position: relative;
      width: 70px;
      height: 54px;
    }

    .mini-btn.chat::before {
      content: "";
      position: absolute;
      left: 16px;
      top: 16px;
      width: 38px;
      height: 22px;
      border: 4px solid rgba(255,255,255,0.88);
      border-radius: 8px;
      border-bottom-left-radius: 2px;
      background: rgba(255,255,255,0.05);
    }

    .mini-btn.chat::after {
      content: "";
      position: absolute;
      left: 32px;
      top: 34px;
      width: 10px;
      height: 10px;
      background: rgba(255,255,255,0.88);
      transform: rotate(45deg);
      clip-path: polygon(0 0, 100% 0, 0 100%);
    }

    .side-tools {
      position: absolute;
      right: 18px;
      top: 120px;
      width: 116px;
      height: 670px;
      z-index: 5;
    }

    .side-tools .tool {
      width: 94px;
      height: 94px;
      margin: 10px auto;
      border-radius: 13px;
      border: 2px solid rgba(255,255,255,0.08);
      background: rgba(255,255,255,0.06);
      position: relative;
      box-shadow: inset 0 0 14px rgba(255,255,255,0.02);
      overflow: hidden;
    }

    .tool.selected {
      border: 2px solid #4db4ff;
      box-shadow: 0 0 0 2px rgba(77,180,255,0.4);
    }

    .tool.mask::before {
      content: "";
      position: absolute;
      inset: 18px 16px 20px 16px;
      border-radius: 12px;
      background: rgba(255,255,255,0.7);
      clip-path: polygon(50% 0%, 100% 22%, 100% 76%, 50% 100%, 0 76%, 0 22%);
    }

    .tool.mask::after {
      content: "";
      position: absolute;
      width: 18px;
      height: 18px;
      left: 38px;
      top: 34px;
      border-radius: 50%;
      background: rgba(15,15,15,0.7);
      box-shadow: 0 0 0 8px rgba(255,255,255,0.85);
    }

    .tool.smile::before {
      content: "";
      position: absolute;
      width: 38px;
      height: 38px;
      left: 28px;
      top: 28px;
      border: 5px solid rgba(255,255,255,0.8);
      border-radius: 50%;
    }

    .tool.smile::after {
      content: "";
      position: absolute;
      left: 36px;
      bottom: 26px;
      width: 20px;
      height: 10px;
      border-bottom: 4px solid rgba(255,255,255,0.8);
      border-radius: 0 0 12px 12px;
    }

    .tool.boy::before {
      content: "";
      position: absolute;
      width: 18px;
      height: 18px;
      left: 38px;
      top: 20px;
      border-radius: 50%;
      background: rgba(255,255,255,0.8);
      box-shadow: 0 18px 0 5px rgba(255,255,255,0.8);
    }

    .tool.boy::after {
      content: "";
      position: absolute;
      left: 24px;
      top: 48px;
      width: 46px;
      height: 26px;
      border-radius: 8px 8px 12px 12px;
      background: rgba(255,255,255,0.7);
    }

    .tool.arrow {
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(255,255,255,0.05);
    }

    .tool.arrow::before {
      content: "";
      width: 52px;
      height: 52px;
      border: 5px solid rgba(255,255,255,0.75);
      border-left: 0;
      border-bottom: 0;
      transform: rotate(-45deg);
      border-radius: 8px;
      display: block;
      opacity: 0.9;
    }

    .tool.vehicle::before {
      content: "";
      position: absolute;
      width: 52px;
      height: 22px;
      left: 20px;
      top: 38px;
      border-radius: 12px 18px 10px 12px;
      background: rgba(255,255,255,0.7);
    }

    .tool.vehicle::after {
      content: "";
      position: absolute;
      width: 10px;
      height: 10px;
      left: 22px;
      top: 58px;
      border-radius: 50%;
      background: #1f1f1f;
      box-shadow: 24px 0 0 #1f1f1f, 46px 0 0 #1f1f1f;
    }

    .tool.home::before {
      content: "";
      position: absolute;
      left: 24px;
      top: 30px;
      width: 44px;
      height: 32px;
      background: rgba(255,255,255,0.7);
      clip-path: polygon(50% 0%, 100% 35%, 100% 100%, 0% 100%, 0% 35%);
    }

    .tool.home::after {
      content: "";
      position: absolute;
      left: 38px;
      top: 52px;
      width: 18px;
      height: 18px;
      background: rgba(255,255,255,0.7);
      border-radius: 2px;
    }

    .dock {
      position: absolute;
      left: 16px;
      bottom: 18px;
      width: 130px;
      height: 84px;
      background: rgba(0,0,0,0.18);
      border-radius: 10px;
      z-index: 7;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 1px solid rgba(255,255,255,0.12);
    }

    .dock .gear {
      position: relative;
      width: 42px;
      height: 42px;
      border-radius: 50%;
      background: rgba(255,255,255,0.18);
      border: 4px solid rgba(255,255,255,0.75);
    }

    .dock .gear::before,
    .dock .gear::after {
      content: "";
      position: absolute;
      inset: 0;
      border-radius: 50%;
    }

    .dock .gear::before {
      transform: scale(0.55);
      border: 2px solid rgba(255,255,255,0.75);
    }

    .dock .gear::after {
      transform: scale(0.22);
      background: rgba(255,255,255,0.8);
    }

    .main-shell {
      position: absolute;
      left: 50%;
      top: 58px;
      width: 760px;
      height: 700px;
      transform: translateX(-50%);
      background: rgba(22, 8, 7, 0.42);
      border-radius: 18px;
      border: 2px solid rgba(255,255,255,0.12);
      z-index: 4;
      overflow: hidden;
      box-shadow: inset 0 0 18px rgba(0,0,0,0.25);
    }

    .top-frame {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 86px;
      background: rgba(30, 11, 9, 0.96);
      border-bottom: 1px solid rgba(255,255,255,0.08);
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 18px 0 20px;
    }

    .top-left-box {
      width: 46px;
      height: 46px;
      border-radius: 14px;
      background: rgba(255,255,255,0.14);
      border: 2px solid rgba(255,255,255,0.12);
      position: relative;
      margin-right: 14px;
    }

    .top-left-box::before {
      content: "";
      position: absolute;
      width: 20px;
      height: 20px;
      left: 12px;
      top: 12px;
      border-radius: 4px;
      background: rgba(255,255,255,0.8);
      transform: rotate(45deg);
      box-shadow: 0 0 0 4px rgba(255,255,255,0.18);
    }

    .top-left-btn {
      display: flex;
      align-items: center;
      gap: 12px;
      flex: 1;
    }

    .icon-grid {
      position: relative;
      width: 40px;
      height: 40px;
      display: grid;
      place-items: center;
    }

    .icon-grid::before {
      content: "";
      width: 28px;
      height: 28px;
      border: 4px solid rgba(255,255,255,0.8);
      border-radius: 5px;
      display: block;
      position: absolute;
      left: 6px;
      top: 6px;
    }

    .icon-grid::after {
      content: "";
      position: absolute;
      width: 14px;
      height: 14px;
      border: 4px solid rgba(255,255,255,0.8);
      border-radius: 4px;
      left: 17px;
      top: 17px;
      background: rgba(255,255,255,0.1);
    }

    .brand {
      font-size: 22px;
      font-weight: 900;
      letter-spacing: 1px;
      color: #ff3a3a;
      text-transform: uppercase;
      position: relative;
      left: -8px;
    }

    .brand::after {
      content: "";
      width: 4px;
      height: 4px;
      background: rgba(255,255,255,0.8);
      border-radius: 50%;
      position: absolute;
      left: 52px;
      top: 16px;
      box-shadow: 0 0 0 2px rgba(255,255,255,0.2);
    }

    .toggle-box {
      display: flex;
      align-items: center;
      gap: 12px;
      margin-left: auto;
    }

    .mini-toggle {
      width: 82px;
      height: 42px;
      border-radius: 8px;
      background: linear-gradient(180deg, #d83a3a, #a71414);
      border: 2px solid rgba(255,255,255,0.1);
      position: relative;
      box-shadow: inset 0 0 12px rgba(0,0,0,0.18);
    }

    .mini-toggle::before {
      content: "-";
      position: absolute;
      inset: 0;
      display: grid;
      place-items: center;
      font-size: 38px;
      font-weight: 700;
      color: rgba(255,255,255,0.9);
      transform: translateY(-5px);
    }

    .mini-toggle.green {
      background: linear-gradient(180deg, #2fdb49, #1e8f35);
    }

    .mini-toggle.green::before {
      content: "";
      position: absolute;
      width: 24px;
      height: 24px;
      border-right: 4px solid rgba(255,255,255,0.95);
      border-bottom: 4px solid rgba(255,255,255,0.95);
      transform: rotate(45deg) translate(-1px, -1px);
      left: 26px;
      top: 9px;
      border-radius: 2px;
    }

    .avatar-mini {
      width: 44px;
      height: 44px;
      border-radius: 12px;
      border: 2px solid rgba(255,255,255,0.18);
      background: radial-gradient(circle at 30% 25%, #6b7a89, #1e1e1e 60%);
      position: relative;
      box-shadow: 0 0 0 3px rgba(87,183,255,0.35);
    }

    .avatar-mini::before {
      content: "";
      position: absolute;
      width: 16px;
      height: 16px;
      border-radius: 50%;
      background: rgba(255,255,255,0.9);
      top: 10px;
      left: 14px;
      box-shadow: 0 18px 0 4px rgba(255,255,255,0.8);
    }

    .main-body {
      position: absolute;
      left: 0;
      right: 0;
      top: 88px;
      bottom: 0;
      display: grid;
      grid-template-columns: 1.05fr 1.62fr;
      gap: 18px;
      padding: 16px 18px 18px 18px;
      z-index: 2;
    }

    .input-panel {
      background: rgba(40, 14, 10, 0.96);
      border: 1px solid rgba(255,255,255,0.06);
      border-radius: 10px;
      padding: 14px;
      display: flex;
      flex-direction: column;
      gap: 12px;
      min-height: 0;
    }

    .field {
      height: 54px;
      background: rgba(110, 22, 16, 0.4);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: rgba(255,255,255,0.78);
      font-weight: 600;
      letter-spacing: 0.4px;
      font-size: 18px;
      text-align: center;
      padding: 0 10px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .pattern-block {
      height: 62px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #ff4b4b;
      font-weight: 700;
      font-size: 18px;
      background: rgba(90, 19, 17, 0.46);
      border-radius: 8px;
      border: 1px solid rgba(255,255,255,0.06);
      overflow: hidden;
      letter-spacing: 0.9px;
      text-align: center;
      padding: 0 12px;
    }

    .pattern-block span {
      filter: drop-shadow(0 0 2px rgba(255,74,74,0.45));
      white-space: nowrap;
    }

    .pattern-block.small {
      height: 54px;
      font-size: 16px;
    }

    .pattern-block.nano {
      height: 60px;
      font-size: 15px;
    }

    .at-box {
      height: 52px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 26px;
      color: rgba(255,255,255,0.9);
      background: rgba(110,22,16,0.38);
      border: 1px solid rgba(255,255,255,0.06);
      border-radius: 8px;
    }

    .btn {
      width: 100%;
      height: 52px;
      border: none;
      border-radius: 8px;
      font-weight: 900;
      letter-spacing: 1px;
      font-size: 18px;
      cursor: pointer;
      transition: transform 0.18s ease, filter 0.2s ease;
      color: var(--btn-text);
      box-shadow: 0 4px 12px rgba(0,0,0,0.25);
    }

    .btn:hover { transform: translateY(-1px); filter: brightness(1.08); }

    .btn.red {
      background: linear-gradient(180deg, #ff4a4a, #d11919);
    }

    .btn-wrap {
      margin-top: 4px;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .targets-panel {
      background: rgba(35, 12, 10, 0.96);
      border: 1px solid rgba(255,255,255,0.06);
      border-radius: 10px;
      padding: 12px 14px 8px 14px;
      overflow: hidden;
      position: relative;
    }

    .targets-panel .title {
      text-align: center;
      color: #ff3b3b;
      font-weight: 900;
      letter-spacing: 1px;
      font-size: 18px;
      margin: 4px 0 14px 0;
      text-transform: uppercase;
      text-shadow: 0 0 8px rgba(255,80,80,0.26);
    }

    .targets {
      display: flex;
      flex-direction: column;
      gap: 12px;
      min-height: 0;
    }

    .target-item {
      height: 76px;
      border-radius: 9px;
      background: rgba(71, 19, 17, 0.7);
      border: 1px solid rgba(255,255,255,0.04);
      display: flex;
      align-items: center;
      justify-content: flex-start;
      padding: 0 18px 0 20px;
      position: relative;
      overflow: hidden;
      transition: all 0.2s ease;
      cursor: pointer;
    }

    .target-item:hover {
      transform: translateX(2px);
      background: rgba(90, 25, 21, 0.9);
    }

    .target-item.active {
      background: rgba(120, 27, 22, 0.8);
      border-color: rgba(255,255,255,0.06);
      box-shadow: inset 0 0 14px rgba(255,170,170,0.08);
    }

    .target-item .rank {
      color: #fff;
      font-size: 20px;
      font-weight: 900;
      min-width: 28px;
      margin-right: 14px;
      text-shadow: 0 0 6px rgba(255,255,255,0.15);
    }

    .target-item .name {
      color: #f9f1f0;
      font-size: 20px;
      font-weight: 700;
      letter-spacing: 0.2px;
      user-select: none;
    }

    .target-item .name .target {
      color: #ff3d3d;
      font-weight: 900;
      text-shadow: 0 0 6px rgba(255,60,60,0.25);
    }

    .target-item .name .dot {
      color: rgba(255,255,255,0.8);
      margin: 0 4px;
    }

    .camera-box {
      position: absolute;
      right: 16px;
      bottom: 30px;
      width: 110px;
      height: 110px;
      border-radius: 50%;
      background: rgba(10, 14, 14, 0.38);
      border: 2px solid rgba(255,255,255,0.2);
      box-shadow: inset 0 0 12px rgba(255,255,255,0.08);
      z-index: 8;
      display: grid;
      place-items: center;
    }

    .camera-box::before {
      content: "";
      width: 70px;
      height: 70px;
      border-radius: 50%;
      border: 3px solid rgba(255,255,255,0.7);
      display: block;
      position: relative;
      box-shadow: inset 0 0 0 12px rgba(255,255,255,0.06);
    }

    .camera-box::after {
      content: "";
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background: rgba(255,255,255,0.9);
      position: absolute;
      left: 46px;
      top: 46px;
      box-shadow: 0 0 0 12px rgba(255,255,255,0.08);
    }

    .footer-tag {
      position: absolute;
      right: 24px;
      bottom: 18px;
      color: rgba(255,255,255,0.82);
      font-size: 14px;
      font-weight: 700;
      display: flex;
      align-items: center;
      gap: 8px;
      z-index: 8;
    }

    .footer-tag .small {
      width: 8px;
      height: 8px;
      background: #2cff78;
      border-radius: 50%;
      box-shadow: 0 0 0 5px rgba(44,255,120,0.2);
    }

    .input-bubble {
      position: absolute;
      left: 0; right: 0;
      top: 110px;
      display: flex;
      justify-content: center;
      pointer-events: none;
      z-index: 9;
    }

    .text-box {
      width: 420px;
      height: 58px;
      background: rgba(41, 12, 10, 0.76);
      border: 1px solid rgba(255,255,255,0.06);
      border-radius: 10px;
      color: rgba(255,255,255,0.86);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 18px;
      letter-spacing: 0.4px;
      font-weight: 700;
      box-shadow: inset 0 0 10px rgba(0,0,0,0.18);
      pointer-events: auto;
      padding: 0 18px;
      text-align: center;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .styled-output {
      margin-top: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      min-height: 54px;
      padding: 10px 12px;
      border-radius: 8px;
      background: rgba(110,22,16,0.35);
      border: 1px solid rgba(255,255,255,0.06);
      color: #ff5e5e;
      font-weight: 700;
      font-size: 16px;
      letter-spacing: 0.5px;
      white-space: pre-wrap;
    }

    @media (max-width: 1200px) {
      .scene {
        transform: scale(0.9);
      }
    }

    @media (max-width: 980px) {
      .scene { transform: scale(0.72); }
    }
  </style>
</head>
<body>
  <div class="scene">
    <div class="
