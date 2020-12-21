Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E04B2E02FE
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 00:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgLUXro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 18:47:44 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:43343 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgLUXro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 18:47:44 -0500
Received: by mail-oi1-f171.google.com with SMTP id q25so12997856oij.10;
        Mon, 21 Dec 2020 15:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvySv0CeCJTZyFCy7SQ0ADLfiwUPuGcaaIXJOcvnMEk=;
        b=KOSqErSfv3AWJTIWn60W/QWTiu+2zMofZ3p15UaGqpHUsVmL2kDQBxRIz3X3qZ7zQB
         Zt5qYbXmapY7TMAUdqwU95/EoPdGsW82z38N354VKyHQBpiotIgH14l3OLIe+IIgUET9
         //8KyAbIos+6U33P7ajFZsvNEFp37npgMPUtKMMwSSAzwMlIBS1cBvpT8YP+11DTzl5Z
         cbIbYb5AAo5bkbB9WcgV0PFdtU72r8r8h4rE3Y7/FQbgoqAFOJaBiVGhSAgePxIJ0r14
         AneVk79vT8VPKAxEt4ayPiB6SetwtVjeBZiMb/r3Xfc50uvmCYcDemB6/6qezwcKkAAh
         s15g==
X-Gm-Message-State: AOAM532PR4wy9/eGm6F5xwLvNvWPCRyZdgejTiM2+EqEesNkhG/bZoY1
        kYS6P2LZy2PI7voFaBeTFi7gOGieAA==
X-Google-Smtp-Source: ABdhPJyarx985mhH4El9moVWkvIPJ7HV4bVwwLQCH80HeMmIbZj0RWpFySptVkQxMny5xbyKsC62Qg==
X-Received: by 2002:aca:aa83:: with SMTP id t125mr12352816oie.103.1608594421968;
        Mon, 21 Dec 2020 15:47:01 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id j126sm3917671oib.13.2020.12.21.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 15:47:01 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: Drop unnecessary *-supply schemas properties
Date:   Mon, 21 Dec 2020 16:46:59 -0700
Message-Id: <20201221234659.824881-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

*-supply properties are always a single phandle, so binding schemas
don't need a type $ref nor 'maxItems'.

A meta-schema check for this is pending once these existing cases are
fixed.

Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/anx6345.yaml | 2 --
 .../devicetree/bindings/display/bridge/ite,it6505.yaml        | 2 --
 .../devicetree/bindings/display/bridge/lvds-codec.yaml        | 3 +--
 Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 2 --
 .../devicetree/bindings/display/bridge/simple-bridge.yaml     | 1 -
 .../bindings/display/bridge/thine,thc63lvd1024.yaml           | 1 -
 .../devicetree/bindings/display/bridge/toshiba,tc358775.yaml  | 2 --
 Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml   | 4 +---
 .../devicetree/bindings/iio/humidity/ti,hdc2010.yaml          | 3 +--
 .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml        | 3 +--
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml     | 3 +--
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml          | 1 -
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ---
 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml  | 3 ---
 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml  | 3 ---
 Documentation/devicetree/bindings/mfd/st,stmfx.yaml           | 3 +--
 .../devicetree/bindings/regulator/anatop-regulator.yaml       | 1 -
 17 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
index 8c0e4f285fbc..fccd63521a8c 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
@@ -26,11 +26,9 @@ properties:
     description: GPIO connected to active low reset
 
   dvdd12-supply:
-    maxItems: 1
     description: Regulator for 1.2V digital core power.
 
   dvdd25-supply:
-    maxItems: 1
     description: Regulator for 2.5V digital core power.
 
   ports:
diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index efbb3d0117dc..02cfc0a3b550 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -35,11 +35,9 @@ properties:
     maxItems: 1
 
   ovdd-supply:
-    maxItems: 1
     description: I/O voltage
 
   pwr18-supply:
-    maxItems: 1
     description: core voltage
 
   interrupts:
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index e5e3c72630cf..66a14d60ce1d 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -79,8 +79,7 @@ properties:
       The GPIO used to control the power down line of this device.
     maxItems: 1
 
-  power-supply:
-    maxItems: 1
+  power-supply: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
index 7e27cfcf770d..763c7909473e 100644
--- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -35,11 +35,9 @@ properties:
     description: GPIO connected to active low reset.
 
   vdd12-supply:
-    maxItems: 1
     description: Regulator for 1.2V digital core power.
 
   vdd33-supply:
-    maxItems: 1
     description: Regulator for 3.3V digital core power.
 
   ports:
diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 3ddb35fcf0a2..64e8a1c24b40 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -60,7 +60,6 @@ properties:
     description: GPIO controlling bridge enable
 
   vdd-supply:
-    maxItems: 1
     description: Power supply for the bridge
 
 required:
diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
index 469ac4a34273..3d5ce08a5792 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
@@ -74,7 +74,6 @@ properties:
     description: Power down GPIO signal, pin name "/PDWN", active low.
 
   vcc-supply:
-    maxItems: 1
     description:
       Power supply for the TTL output, TTL CLOCKOUT signal, LVDS input, PLL and
       digital circuitry.
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
index fd3113aa9ccd..b5959cc78b8d 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -28,11 +28,9 @@ properties:
     description: i2c address of the bridge, 0x0f
 
   vdd-supply:
-    maxItems: 1
     description: 1.2V LVDS Power Supply
 
   vddio-supply:
-    maxItems: 1
     description: 1.8V IO Power Supply
 
   stby-gpios:
diff --git a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml
index 6a991e9f78e2..f04084fae5e8 100644
--- a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml
@@ -16,9 +16,7 @@ properties:
     enum:
       - lltc,ltc2496
 
-  vref-supply:
-    description: phandle to an external regulator providing the reference voltage
-    $ref: /schemas/types.yaml#/definitions/phandle
+  vref-supply: true
 
   reg:
     description: spi chipselect number according to the usual spi bindings
diff --git a/Documentation/devicetree/bindings/iio/humidity/ti,hdc2010.yaml b/Documentation/devicetree/bindings/iio/humidity/ti,hdc2010.yaml
index 7037f82ec753..88384b69f917 100644
--- a/Documentation/devicetree/bindings/iio/humidity/ti,hdc2010.yaml
+++ b/Documentation/devicetree/bindings/iio/humidity/ti,hdc2010.yaml
@@ -22,8 +22,7 @@ properties:
       - ti,hdc2010
       - ti,hdc2080
 
-  vdd-supply:
-    maxItems: 1
+  vdd-supply: true
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
index 378a85c09d34..878464f128dc 100644
--- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -31,8 +31,7 @@ properties:
   interrupts:
     maxItems: 1
 
-  vdd-supply:
-    maxItems: 1
+  vdd-supply: true
 
   linux,keycodes:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 4ce109476a0e..bfc3a8b5e118 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -55,8 +55,7 @@ properties:
 
   wakeup-source: true
 
-  vcc-supply:
-    maxItems: 1
+  vcc-supply: true
 
   gain:
     description: Allows setting the sensitivity in the range from 0 to 31.
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 9ea827092fdd..68ee8c7d9e79 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -40,7 +40,6 @@ properties:
 
   poc-supply:
     description: Regulator providing Power over Coax to the cameras
-    maxItems: 1
 
   enable-gpios:
     description: GPIO connected to the \#PWDN pin with inverted polarity
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 0df0334d2d0d..bb3528315f20 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -39,15 +39,12 @@ properties:
 
   vana-supply:
     description: Analogue voltage supply (VANA), sensor dependent.
-    maxItems: 1
 
   vcore-supply:
     description: Core voltage supply (VCore), sensor dependent.
-    maxItems: 1
 
   vio-supply:
     description: I/O voltage supply (VIO), sensor dependent.
-    maxItems: 1
 
   clocks:
     description: External clock to the sensor.
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 1a3590dd0e98..eb12526a462f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -37,15 +37,12 @@ properties:
 
   vdddo-supply:
     description: Chip digital IO regulator (1.8V).
-    maxItems: 1
 
   vdda-supply:
     description: Chip analog regulator (2.7V).
-    maxItems: 1
 
   vddd-supply:
     description: Chip digital core regulator (1.12V).
-    maxItems: 1
 
   flash-leds:
     description: See ../video-interfaces.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
index f697e1a20beb..a66acb20d59b 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
@@ -33,15 +33,12 @@ properties:
 
   vana-supply:
     description: Sensor 2.8 V analog supply.
-    maxItems: 1
 
   vdig-supply:
     description: Sensor 1.8 V digital core supply.
-    maxItems: 1
 
   vddl-supply:
     description: Sensor digital IO 1.2 V supply.
-    maxItems: 1
 
   port:
     type: object
diff --git a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
index 888ab4b5df45..19e9afb385ac 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
@@ -26,8 +26,7 @@ properties:
 
   drive-open-drain: true
 
-  vdd-supply:
-    maxItems: 1
+  vdd-supply: true
 
   pinctrl:
     type: object
diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.yaml b/Documentation/devicetree/bindings/regulator/anatop-regulator.yaml
index e7b3abe30363..0a66338c7e5a 100644
--- a/Documentation/devicetree/bindings/regulator/anatop-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.yaml
@@ -59,7 +59,6 @@ properties:
     description: u32 value representing regulator enable bit offset.
 
   vin-supply:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
     description: input supply phandle.
 
 required:
-- 
2.27.0

