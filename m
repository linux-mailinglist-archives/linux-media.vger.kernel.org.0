Return-Path: <linux-media+bounces-49560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C1CDE1BC
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 22:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BC023001038
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 21:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C3827EFE3;
	Thu, 25 Dec 2025 21:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZt2ySP7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A235294A10
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766696607; cv=none; b=NxhHOGrPEPN0EBXvio4w/JJ6yylTNF04ma4fpP0FX3UGXXaFCXC4mjGY/wUdjj4Pc25HMMt3L+GzkxyYCfeCyRFArw4lBeL+vTNuoZFidvOUgCHTBjp1aw3yb1HHEfSrugO5ax679BrAFwfR3y40AqxABDo0kGXHV38AL4P0Sio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766696607; c=relaxed/simple;
	bh=/+lZcqPywT3eD3agzd50PrRYt5+R2R4TSYTVLvfWz/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDwv0YX5sV8UNQWYp+/0YQbdcggcFolnhMjboy0gx3KlvBVRl5agTEZxnLW9H5ulPywh5eSnJeIr3CLGchTFiQseeHRPNX8wwJU7HjQUTfnBlGSb+ESEElIEI9wXY6s+M1qSBrxDTiLg1LjhhRJKlHzAFWu/9fIdbmtzyaG0TYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZt2ySP7; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae24015dc0so6809042eec.1
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 13:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766696605; x=1767301405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgTLElFuvb05dCGmTgzWC9Muq2FxtnuH04aRURL+kRg=;
        b=PZt2ySP7D+OaKPXeqnSHroJm1tNKIDr2XOYtd5JTI3lYR0zz1gmVypDl917a5HMe0R
         e1LkcudoQRIJSlwxGXK8m6U8p0Js31Nu5MGkFSkFd8bB7Gt1jLIZO6TWu1qq4cjzFH85
         i8ogD04l+qT3DHL+Zr9D3/0NIP4vphts4F1cxSIqSN9uQE3kydmPhnOgboWGKYExp0GD
         x9lkUo0TvUPEJ5SmGkEhmvQZlgd0CJvdNa7JQ5RGK6SKP/x9MWCMhl/CKavuzo+LkQSF
         ejoIe2Im0s2xMLMCvsklssySa/FjOF3YD2ueEyRAik3/oruY/4Zi4WPEvfBJXRKc+S6a
         FjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766696605; x=1767301405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgTLElFuvb05dCGmTgzWC9Muq2FxtnuH04aRURL+kRg=;
        b=wDnzlrHDjv7OSy+ywx4bIuYBv5+iJ3aq14SNCEEYhZ6+NVZeIn3KWdRC3pYBCIqVTR
         Ik9CmtXocXJZ0rHnUjb3pDGWgVbHw8KmiTfpNGLSp26HidW2eCSvtDrBHhZa+0u17T4K
         2aneGl4fk1oz37vHUbSEW2HEeSMp99p9i6yEBODiYEM30ScHGzJRIgLswuhMeIqo3wdU
         hTad+gnCH7vgcnBddBSdmJ9+EWoXcaUDFdymNtmzvT8FsotJdcYqWoB3LHs47zlUB7Ob
         B8q+2kc6LNll4HfBRwxN6LxxvrvYa2aT6nrrTtzi3unJG9EpP8jComG+WdpFF9dKwEH9
         KH/g==
X-Forwarded-Encrypted: i=1; AJvYcCVpWNbYxSanG/5MztlPoo1Uo/p+Ybj+IG/YVxpd28NXoRdacHn6o0MgV/CSw2mNNtVA6pnzNA9kOnt1IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGX2na3gWHYbm1rwlPNoXKMcW2q+OCWAEAapHNByzBGScTpqux
	3+iF3E8M0ejTTGnL21NyFJQL0uleHrFhFNNaFQppKPM6JAzLmTtpIFRu
X-Gm-Gg: AY/fxX7aF0ouNGLJy63ObYbxbxTOszfxoh8+VillD7bZDH5pkhgbrpqL9cqT6BjjW8h
	zYRoMmVVWidep5FOvIfiJMiTkMOA+OyFd8inLJRWzt3Szi5Cw49l95atdBZA3pF8uDRiXPs0EPS
	5oeyUw1a0lOixYXQIAsmZ3cfuwMCjNMYKg9xnb+mhljXUFUsRqVVeGDBHnHnTazD/a+Z/hFj8iI
	7SgvaY5uEUPUJDkBuRDJSL2tFZgp91ZD4H7x/tZY7/Tm9D4wMTMEDeEG1HBNNquOyLvW0YKdJF5
	o5t2gb1pvg9sIsU57c7BDJ9sceMPkvex58DBsmGCrNatd+itIrMZjifIG5caA69Ff3EruhHZTuk
	C6UiJ0ifjzduoxz5r1bdZMQWtnU5+zgQjMcgcivikKFO+nvF3O84f36sZfgPSyB31ygg0FjhD4g
	RHaiXlTOuMUhgAvnWlok3EaQ==
X-Google-Smtp-Source: AGHT+IHaRAAm6zTU8WaDLCgIm8cn0gIN1vyirvlhsK7UY7lq5OMBlSx01baipq209Z4NtI+4xI6i5w==
X-Received: by 2002:a05:7022:526:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-12171ae9239mr20726406c88.20.1766696604981;
        Thu, 25 Dec 2025 13:03:24 -0800 (PST)
Received: from [192.168.5.77] ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm83006203c88.13.2025.12.25.13.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 13:03:24 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
Date: Thu, 25 Dec 2025 13:03:07 -0800
Subject: [PATCH v3 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-dt-bindings-et8ek8-omap3isp-v3-1-b027e0db69a5@gmail.com>
References: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
In-Reply-To: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5131; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=/+lZcqPywT3eD3agzd50PrRYt5+R2R4TSYTVLvfWz/0=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBpTaaaNqcw7yB1ijDDPKb9bb171Hm2DRfYJryfW
 l8WhDUzpzOJAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCaU2mmgAKCRB0+X00RCbN
 yPbEEADDEpwm/D2yHvYx1AquF2X8hT1Xt3l5eI2NY9xNCHCgR7HRsAvyNaTbDDB+4ALeZdqJjMm
 aoxxfSvDzCFX+0hz2QhBiurcmtk2hVFYIa+murGCOJm57oZ4CNThBZGByI380VLXjGlIlj9/IUG
 HMUgn8PbhTR/JRnW/xUQnWXL8bCbgVtRNi6Rfh50/pttItQPpgjJcD8FkkMBFF43RNKAGsz85oX
 GQTdrO66kBIVOd3OMyizzmdCJaHz+Y6XX6/EkqsBFWLR4H9wRNsfiI03yFlP4ffxwZxq3pFfExn
 3lrk/CSTrA7Vl0qT6C6uQjtkqYZIB0g+cqp1JcJr70YLK2tMinN5QGhdUxVua1Uengua/qLPkVj
 eqj+CGYvg9v1DxXyOcPZSK3fHHgc9mQQrLAjVk6CkeEi+j07pldwPVcQlkOFaBMMSi5uNt+U0Xz
 AFKviM5DI9GHV810XHj8jHjeqUtdS13ORJ7BVM1QDZnSAkaBE+8y/sJ988Xim6gkvYc+9wHbmmG
 P8wyrpuy0fKIaqVxBEGrG3ZW8GBAvOeK9VUj0lZAIoaaeIX7osuVVn+aResj5af2rRyf8jDNOkD
 m2CGukrMUmtEssDr5D5/TMdyHYdTG7kS0Vif7svdlOr120MVto/p3FA0L0QYs64mr+OpoSxWgEN
 IWFLWcPaxr6l60g==
X-Developer-Key: i=alex.t.tran@gmail.com; a=openpgp;
 fpr=00A215621B4E12571515ADC774F97D344426CDC8

Convert binding for toshiba,et8ek8 from TXT to YAML format.
Update MAINTAINERS file accordingly. The binding references
video-interface-devices.yaml at top level to inherit flash-leds
property.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../bindings/media/i2c/toshiba,et8ek8.txt          | 55 --------------
 .../bindings/media/i2c/toshiba,et8ek8.yaml         | 87 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 88 insertions(+), 55 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
deleted file mode 100644
index 8d8e40c5687283d2f582895542cc9b765983d025..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Toshiba et8ek8 5MP sensor
-
-Toshiba et8ek8 5MP sensor is an image sensor found in Nokia N900 device
-
-More detailed documentation can be found in
-Documentation/devicetree/bindings/media/video-interfaces.txt .
-
-
-Mandatory properties
---------------------
-
-- compatible: "toshiba,et8ek8"
-- reg: I2C address (0x3e, or an alternative address)
-- vana-supply: Analogue voltage supply (VANA), 2.8 volts
-- clocks: External clock to the sensor
-- reset-gpios: XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
-  is in hardware standby mode when the signal is in the low state.
-
-
-Optional properties
--------------------
-
-- flash-leds: See ../video-interfaces.txt
-- lens-focus: See ../video-interfaces.txt
-
-
-Endpoint node mandatory properties
-----------------------------------
-
-- remote-endpoint: A phandle to the bus receiver's endpoint node.
-
-
-Example
--------
-
-&i2c3 {
-	clock-frequency = <400000>;
-
-	cam1: camera@3e {
-		compatible = "toshiba,et8ek8";
-		reg = <0x3e>;
-		vana-supply = <&vaux4>;
-
-		clocks = <&isp 0>;
-		assigned-clocks = <&isp 0>;
-		assigned-clock-rates = <9600000>;
-
-		reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
-		port {
-			csi_cam1: endpoint {
-				remote-endpoint = <&csi_out1>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f0186ae87de2d918f70ec6e0a48b46be9c5951b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba et8ek8 5MP sensor
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+  - Sakari Ailus <sakari.ailus@iki.fi>
+
+description:
+  Toshiba et8ek8 5MP sensor is an image sensor found in Nokia N900 device
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: toshiba,et8ek8
+
+  reg:
+    description:
+      I2C address (0x3e, or an alternative address)
+    maxItems: 1
+
+  vana-supply:
+    description:
+      Analogue voltage supply (VANA), 2.8 volts
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
+      is in hardware standby mode when the signal is in the low state.
+    maxItems: 1
+
+  flash-leds:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - vana-supply
+  - clocks
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3e {
+            compatible = "toshiba,et8ek8";
+            reg = <0x3e>;
+            vana-supply = <&vaux4>;
+            clocks = <&isp 0>;
+            assigned-clocks = <&isp 0>;
+            assigned-clock-rates = <9600000>;
+            reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+            flash-leds = <&led>;
+
+            port {
+                csi_cam1: endpoint {
+                    remote-endpoint = <&csi_out1>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8feeff25613c59fe9c929927dadaa7e..50722537d5483611eea3c8af6c68ae0ec5e4aee8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18582,6 +18582,7 @@ M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
+F:	Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
 F:	drivers/media/i2c/ad5820.c
 F:	drivers/media/i2c/et8ek8
 

-- 
2.51.0


