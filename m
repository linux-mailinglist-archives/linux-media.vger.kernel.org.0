Return-Path: <linux-media+bounces-20532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F49B4B1D
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 14:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E2D51C20EA4
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E2F206518;
	Tue, 29 Oct 2024 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tT3ZBBwD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD787205ACF
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209491; cv=none; b=i1REsHnZ4sr4/IZ1hVkOrKGAv9zH0tIBAMRoJQirJsBEYOW1uZHdVHgZF07VI24xNYuwocOb8XFh+2L7sH9QccwCAQg6oOUMr+NBGnqpuQnTmGplcWPDid/xdTW27WqfY/1khtpEwXIOvPa3xke2o+m15x3pcNVunqRhwgr/uRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209491; c=relaxed/simple;
	bh=Cl6yKtIrMqwFX31VzUc3nCh1DF3ekW0wrnkOLP3ye+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ea6MehU7gwzxTmp69Ocf4koh3QNi0KnQQXj0mC6A6w9hJ/s3VWgCV6FOznAuLBdkBl8iSdcw/CvVdrz3/gkPnVfrKtlbq2YjNBiEqyXVKPK5zIYSlC0SPup4rTLI5btTb3JaLecRQKwKpfOHzu62bllF4j0cFlMV2CKFQYuNfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tT3ZBBwD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so52406335e9.2
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730209487; x=1730814287; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUJkphEStzwJO4O1NIR8Po6mdkROYaBayKSF41nasT0=;
        b=tT3ZBBwDhsYe6cdAhc1G/R3c7knaNNVT1q2o8AQg1zmXF0Ra6Jb5IqJfvH2R/SBhrI
         AOVf1gYISknXtMQ15EmcrXnGzY4i+G2rMj8wpXs0BXQfU3dA6RGueQrzo/mV9RjJGDYa
         xH4vMN+zIIE17XE8mXeUiMWaIPJSpc22zkkg034cmgdCrvvg7kDP/tf9QhEzrmZxHU2o
         xM9ymCZ1yze+V08uf0nlcjGhEFObUtBIiSIhmhu4zxgKnI4msW0QuhGnXfXuRnMlk7WJ
         2cD3S+iTulL3KkSs6iryEdDsWRe3cuU62TbYCjSBKJhnxnpNLc7KpxBtK7mH2mhFCPwx
         iX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730209487; x=1730814287;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUJkphEStzwJO4O1NIR8Po6mdkROYaBayKSF41nasT0=;
        b=HvLkICMy2xoedXbyt4osNs4k5hLDRn5pfN9gzwFowmZ4z3Nkmk+E4aOO1bc4nUMgKK
         A91VfqFMGb8hnvpk/zoGYR3gaNwMRieUcHPxkvl2Owo2s7L1unGPUQNnsHNa3qeUriay
         4ffLxcJgVYjYnoxd82rp/cJBLJt4kP9M/W9XTGZre+UzktC3YxErz/vlBhDpovMQNpp5
         oYESeQJiZIm63TzUmyhH0uGKxXlnSm4vrCivduq8UBPCgrodoFFhgzJfBSeWL6lMPXF9
         PO91mgvPWmFAZTXN0wbZtkcu790qGyWCN58Y5gcUHmUC33HqrIy/+xzHchYCmvtr/sM1
         Ix7w==
X-Forwarded-Encrypted: i=1; AJvYcCWwIdUcoT7+OniV3ThDMkf+2i62GK6Gaq6k8LtGVn/pmQA7epGECiu36tUc0pV72Tkg9aX0alZN9wXDmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+CIaLvPaFTfOM1mABhQQTmgC82sfaK7kdRQdpanJ/ZP2Vo4ru
	txe3WVrUhNpzdt/99xsaJaMsejLp81zs1bEWPwd4zUfbv+SHvnPyni8AxfoN81E=
X-Google-Smtp-Source: AGHT+IEpQAtL43zFwgfi4A77StpEjcj+SqwLbhpPLDV4ePBgEgPNwUCUrxojCxlDLVwcaj06TFFy4Q==
X-Received: by 2002:a05:600c:3512:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-4319ac9ad1bmr117291015e9.14.1730209487142;
        Tue, 29 Oct 2024 06:44:47 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193594fffsm143668855e9.13.2024.10.29.06.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 06:44:46 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 29 Oct 2024 13:44:45 +0000
Subject: [PATCH v3] media: dt-bindings: Remove assigned-clock-* from
 various schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-b4-linux-next-202041004-i2c-media-yaml-fixes-v3-1-f2eb07615f30@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMzmIGcC/5WPSw7CMAxEr1JljVHsJvxW3AOxSFMXLJUWJSVqh
 Xp3UsQClixnrHlPfqrIQTiqQ/FUgZNE6bscylWh/NV1Fwapc1akyaDWFioDrXSPEToeB8i1Xno
 DQh5uXIuDyd1aaGTkCI1vrNceWe9qlZH3wO9DJp7OOV8lDn2Y3vaES/sRIf0nSggaHFUVksPtf
 lMf89aFft2Hi1pMib7o9OcbiQABK2NLi1vjrPuhz/P8AilP6M9HAQAA
X-Change-ID: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Remove extraneous assigned-clock* from media/i2c/* schemas.

assigned-clock and assigned-clock-parent assume that there is a clock that
can be assigned and/or a clock parent that similarly can be assigned by
firmware which may not always be the case.

The sensor properties themselves should not mandate assigned-clock* as a
result.

Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Changes in v3:
- Updates commit log with more description of why we are removing
  assigned-clock from the properties - Laurent
- Drops assigned-clocks from the examples too.
  assigned-clock in examples has the example quality as status="okay" - Laurent
- Link to v2: https://lore.kernel.org/r/20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org

v2:

- Changes series name was: media: i2c: Cleanup assigned-clocks and endpoint: properties: unevaluatedProperties: false
  Dropping the second patch in the series means the title changes too - bod
- Drops unevaluatedProperties -> additionalProperties change
  There is no clear consensus on this right now.
- Adds Reviewed-by and Acked-by as indicated to patch #1 Laurent, Krzysztof 
- Link to v1: https://lore.kernel.org/r/20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org

v1:

On a recent schema submission I did what most well adjusted schema writers
do and tried to find a base file to work from to copy/paste and forget.

Confusingly/predictably I received feedback to remove or alter several of
the properties included in my devious copy/paste plan.

The first bit of feedback was that assigned-clock-* was to be dropped.
Removing assigned-clock-* as assigned-clock-* is a core property which
doesn't need to be listed in a schema.

The second bit of feedback landed on use of additionalProperties:false
along with enumeration of all required endpoint properties instead of an
implied list of valid properties from unevaluatedProperties:false.

Link: https://lore.kernel.org/linux-media/20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org

This series removes the assigned-clock-* from upstream sensor property
schemas and applies additionalProperities:false to properties: endpoint:.

A few missing properties: or required: are added to the schemas based on
output of DT checkers.

The one new DT complaint I didn't fix with the move to
additionalProperties: false is:

/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/x1e80100-crd_qlt_integration/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: imx219@10: port:endpoint: 'remote-endpoint' is a required property

Since this appears to be some sort of temporary/commented thing upstream
which I don't know the provenance of.
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 10 ----------
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 11 -----------
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 10 ----------
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml |  8 --------
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml |  7 -------
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml |  8 --------
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml |  8 --------
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml |  8 --------
 8 files changed, 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..1a57f2aa198228dff784aad25c2c0e39b6c32a9a 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -28,12 +28,6 @@ properties:
     items:
       - description: Reference to the mclk clock.
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   reset-gpios:
     description: Reference to the GPIO connected to the RESETB pin. Active low.
     maxItems: 1
@@ -82,8 +76,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - vddio-supply
   - vdda-supply
   - vddd-supply
@@ -105,8 +97,6 @@ examples:
             pinctrl-names = "default";
             pinctrl-0 = <&pinctrl_csi1>;
             clocks = <&clk 0>;
-            assigned-clocks = <&clk 0>;
-            assigned-clock-rates = <25000000>;
             vdda-supply = <&reg_camera_vdda>;
             vddd-supply = <&reg_camera_vddd>;
             vddio-supply = <&reg_camera_vddio>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 1f497679168c8395a94b3867beb49b251ef621fc..8028c8b107c46cc69ebadac637904f9917fb0f0a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: XVCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - dovdd-supply
   - port
@@ -93,9 +85,6 @@ examples:
             avdd-supply = <&ov5648_avdd>;
             dovdd-supply = <&ov5648_dovdd>;
             clocks = <&ov5648_xvclk 0>;
-            assigned-clocks = <&ov5648_xvclk 0>;
-            assigned-clock-rates = <24000000>;
-
 
             ov5648_out: port {
                 ov5648_out_mipi_csi2: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 8a70e23ba6abed67d8b61c33bd7a261089bddda2..320b9aacbb8bf08e6d06c927ee198c468def4642 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: EXTCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - avdd-supply
   - dovdd-supply
@@ -94,8 +86,6 @@ examples:
             pinctrl-0 = <&csi_mclk_pin>;
 
             clocks = <&ccu CLK_CSI_MCLK>;
-            assigned-clocks = <&ccu CLK_CSI_MCLK>;
-            assigned-clock-rates = <24000000>;
 
             avdd-supply = <&reg_ov8865_avdd>;
             dovdd-supply = <&reg_ov8865_dovdd>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 79a7658f6d0547e4d6fb2267e5757eedf49fd416..401c8613f84038451b90d244021a1388f32c91da 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -27,10 +27,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27MHz
     maxItems: 1
@@ -87,10 +83,6 @@ examples:
             reg = <0x60>;
             clocks = <&ov9282_clk>;
 
-            assigned-clocks = <&ov9282_clk>;
-            assigned-clock-parents = <&ov9282_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             port {
                 ov9282: endpoint {
                     remote-endpoint = <&cam>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb35cfe2b85069946cf1be435a58cb8..975c1d77c8e5d24179e9cb8d92fe7b6798c4d2ec 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -24,10 +24,6 @@ properties:
       - sony,imx258
       - sony,imx258-pdaf
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description:
       Clock frequency from 6 to 27 MHz.
@@ -125,9 +121,6 @@ examples:
             reg = <0x6c>;
             clocks = <&imx258_clk>;
 
-            assigned-clocks = <&imx258_clk>;
-            assigned-clock-rates = <19200000>;
-
             port {
                 endpoint {
                     remote-endpoint = <&csi1_ep>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index bce57b22f7b63bd73f08d8831d9bb04858ef03e0..3842e5130463491e833cbadcdc3a07c55f766c27 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
@@ -74,10 +70,6 @@ examples:
             reg = <0x1a>;
             clocks = <&imx334_clk>;
 
-            assigned-clocks = <&imx334_clk>;
-            assigned-clock-parents = <&imx334_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             port {
                 imx334: endpoint {
                     remote-endpoint = <&cam>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 77bf3a4ee89db3b5d16149470c0380ef8f1aeac1..80f879b6bd01bf6ce81eb9b6c1451448509ca74e 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
@@ -86,10 +82,6 @@ examples:
             reg = <0x1a>;
             clocks = <&imx335_clk>;
 
-            assigned-clocks = <&imx335_clk>;
-            assigned-clock-parents = <&imx335_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             avdd-supply = <&camera_vdda_2v9>;
             ovdd-supply = <&camera_vddo_1v8>;
             dvdd-supply = <&camera_vddd_1v2>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index d9b7815650fdb890418fc96c828acc9147dfb6e8..5447ab0768a66afaf665f155d1f5bf90210eacc6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -26,10 +26,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1
@@ -86,10 +82,6 @@ examples:
             reg = <0x1a>;
             clocks = <&imx412_clk>;
 
-            assigned-clocks = <&imx412_clk>;
-            assigned-clock-parents = <&imx412_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             port {
                 imx412: endpoint {
                     remote-endpoint = <&cam>;

---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


