Return-Path: <linux-media+bounces-49512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11CCDD1A7
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 23:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2456B3001E36
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 22:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5F22FF16C;
	Wed, 24 Dec 2025 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRjj2arn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31B30171A
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766613617; cv=none; b=KABAgnhTPb1ol3kYC7FDKVq6ROnk6Ecc/mTsEQsJZnjuyR2DFVSBOLDsmoI7WUlvh9wyV14zTlpWs9osw7P8bnhFksbg+1gwXA4Ex1W+gCfmEQ0fGuXRgp38cdAV9zVzP2fsPUiYANVi3FG/fCmEvkpucnEzm0zz3OtG2rrXnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766613617; c=relaxed/simple;
	bh=aKWT1s5XXurLtC43G3pL5aSf28bI9FrnmYBjxMP+Ydw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEdOFnVeYJPKFs54ha/auiaRwgTKuOD9Mfv3VMdimT+3TiMAF6nIukUwAjgzdTu/eAOE4FNw7RhpMXVCetzrNUoh/Jn5UIY092AEkXM4jmXJq/+JusRxIQujt5Z6yl7LReb4R3QRCA1hG9wCBOwJAgy0g7+t45NItso7YDVl3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRjj2arn; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ae24015dc0so6423746eec.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 14:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766613615; x=1767218415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bi3r/lddmRdZ339dbw+mk/Ac8K1qVhYyB6AaKyzY7U=;
        b=cRjj2arna7SGUg1ago1e92R6ENdqUVD5aFYfe90S/aDNmaxewwPVT55zUh+oYFJPze
         rglqfPC20aR7d+Fd4q/syDMbn4LmWzm1OnWlWP/cE7EVxgVrwIOjndFbvuaiAJliRN27
         cvbkAONpoCXpIIm5hMGb3IgFCLNZZJXGQQZ3lbQfweIJ5qDb06O9NGipiqsLg7/gN+Uu
         ggxw9RVEyhiwFS3IbfGKyL6F1jxDntXrWcHGY9SPVU4YK00rY2K67vKW+wCcqwejhcSL
         AfzDeHrDq7IpImNE6h5Ph61So91Vd+JjOBypK2+8hl4Obztvf/ydbwZ4XYLMkUaq/7GJ
         +7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766613615; x=1767218415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3bi3r/lddmRdZ339dbw+mk/Ac8K1qVhYyB6AaKyzY7U=;
        b=uy9+Kp+Zx9ELGRGGvomRvZKjDho1zOgTzJl3+R7f67zJ/Z/ZwukJ1CzlI3bVGWBckI
         +wRvyVlqSU3pwQapDSJLIzWlx6TnXWe/113XNRUmLPgEzQHjGBCxGhp0j2qSn+OTEvOb
         Hg6b+d5Lx99Z6319w+o33oa4aLLlZeOTFenYBCNDauwX9cQ2oNeoDNK1FI7/w/lt4MDO
         eAzex83+nePyoMPyW7noQEWIwBFoYWwrTM9ywJmyAUmsZczrANNhSq/E93b0xm0r1vV+
         QkXDa6sOaC1QsDPLNl/qhFuWKdUZU2zDkPUmqNKfxaJmqoN5UQj9uTjzk+1vi4WHXGIE
         loSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5ve/oXPl2XyYzEE1ka5SQDkaoQiBtay1FLrg/MBQSIOIzv2spqVg6MmLp0/gmVQEbezPdPCgqZMfnrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFU+ipYw9/390gAEbInb/gnL3Sj1wFUvl/aFBmpcV3XsfGVVb
	4gzN1D1iJOgb6AESjE+DAyu2Ho+lX02WPN5IPX6azY1S/Wq2FYsn31fC
X-Gm-Gg: AY/fxX4pr1pMxIK8NmliD3uncfXqhZnWBJwRk7HgSwpTonXyJ9MdOc6f4chRBSBBoK8
	VdyahRa8p7BKP58xdrc/NP8sTIZI1xoXA21qhMbMpCWDhVc/4Lf3OP4qfSb1kQZ5FYL87m0IaK9
	IUxq+le02L4wl5Nm8uuRfp8cwuHIhD04ds8BGrLfCS5jZcTwHqyw0/onwfPoMU5pBfWSLPrGQ75
	YqCl5AT9M+P89SlPM1h3hBQp4WRBcu5hILLhva8cG5Z1uht0DUiCrrShgwfVh500s89sYQ8+bgN
	lWNcOPMjiJSfZhgEEPoPwxhdvI0E5E3kcJMoR+CYS8/1hJgqivt1x72ScyErVt3QHNYwVC1z92g
	U76M6E2lXR6BX5n90eM3D8M8QygU+QO77Z48b0d9Yc9HhS6DUJLkBJnK98U57hISONt24zx9Oan
	UEfP6c86B+IGZDFRCOKrPjpA==
X-Google-Smtp-Source: AGHT+IGoHlJZks2rdSFVjlZ+Z0yLSpEpVq1Zsq6IU0wJUUHPixPZen6GBXVpt5JBO3a5D0xfokl5VA==
X-Received: by 2002:a05:693c:8119:b0:2b0:4b17:c383 with SMTP id 5a478bee46e88-2b05e66bb9dmr11438936eec.11.1766613614625;
        Wed, 24 Dec 2025 14:00:14 -0800 (PST)
Received: from [192.168.5.77] ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm46610293eec.3.2025.12.24.14.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:00:14 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
Date: Wed, 24 Dec 2025 13:59:58 -0800
Subject: [PATCH v2 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-dt-bindings-et8ek8-omap3isp-v2-1-0728cc1fee27@gmail.com>
References: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
In-Reply-To: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5177; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=aKWT1s5XXurLtC43G3pL5aSf28bI9FrnmYBjxMP+Ydw=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBpTGJrHcinxiL2rav0CQURHPgpKJ23R2Jdrjr81
 mvtLDv8nVqJAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCaUxiawAKCRB0+X00RCbN
 yOkBEADDoSORKG/GWkzJZZvDxwtqt6VgYlbfhHTC6k4ORlKUqmT//b8XyIdUWl6LlKDuJ88CT3e
 g0rP1ak90i3eReHggVJMYXPmH1AsmzBa4Mw6HollHJ17rHr6fsbC+Htus6ZqHgMYStfiIpJStwi
 J1S4h5hs9TsYLWU4dDeLAvRub3b7imUBsWqUfwUxUXEZh8rBvaH4sP3bkY7HoRgMVXA7rZfsSmy
 GFnl+e0fUka3sCnERZlYPaIOxRLOOhzePWhKLYVnC01s/UaP5NHSPKk6CaKU+aiFPzhq7a4ECXF
 9bCnchR5uxFotfaFvjPdE6SsNPNRLWljzrQAFPDCRPy1hCqiBnIwWrNqaXZg7J48UJuHKbakzBk
 aZaqZWCb515Me6BWMqvd1N8Vd8kwE5zZFxfrL8M7A2UU2GZIpLxwpjVAOosmqhJk+IsyJaYWBtQ
 iUZLDGzER0aJfDYtFbF66JLprWa+6w67P/5ac1qW54UWUeoHJ4rqWqP6qe4THFmGe0FO0O03FQ6
 yB6FwMnSnXVr6oM/VW5VCxrgwsJpzisCgUfQQWw5FYqrYFxy2B1bspQQ77p0LpX0d+tBgrm/VwI
 Qt9igHUQKY3mrzOlsLIYiPPMwYX3pPDAzpNakaS3ECNFZmEOn3b8LRHOOrn66tLZhRptp1+JDH2
 ZJ8dfYoDsuTfYCQ==
X-Developer-Key: i=alex.t.tran@gmail.com; a=openpgp;
 fpr=00A215621B4E12571515ADC774F97D344426CDC8

Convert binding for toshiba,et8ek8 from TXT to YAML format.
Update MAINTAINERS file accordingly. The binding references
video-interface-devices.yaml to inherit flash-leds and
lens-focus properties.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../bindings/media/i2c/toshiba,et8ek8.txt          | 55 --------------
 .../bindings/media/i2c/toshiba,et8ek8.yaml         | 88 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 89 insertions(+), 55 deletions(-)

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
index 0000000000000000000000000000000000000000..78e07955a2ed75c97612259644593fee90235c64
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
@@ -0,0 +1,88 @@
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
+  flash-leds: true
+  lens-focus: true
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
+additionalProperties: false
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
+            lens-focus = <&vcm>;
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


