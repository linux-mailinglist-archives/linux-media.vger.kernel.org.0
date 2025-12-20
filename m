Return-Path: <linux-media+bounces-49250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C936CD36BE
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 21:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FF2730022F2
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 20:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BD82F12C3;
	Sat, 20 Dec 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jW6y3wIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198F312814
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263367; cv=none; b=B9sudbYyDIrcsWhkF8wX+jUZIr+CdznDduNjtj1HpnTgZ6Dqu1vd+bALAE1yRFsn6LZbpvOetIU4fUMQPmVhOq4mfBkYpa7XZ2gHVpBN5yN1g/k3tT/o0zTsHWpW61L0RUjD9B54HQ/pJQ58iOo86fT3PQe/trRAWaDZvGjGBUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263367; c=relaxed/simple;
	bh=XeQz5/l3HlxHkhQp/zlzp/IlfIFRa1msrxz47AYFRK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qr4ivnkrDDjwxMyer9/7CKqZ/URSvq/L2+0b8sjp+hUbbNM1PSytZRTWg6UtUbPPNofVIqzFedN07FQSoKmETMRbkNjFp+izJxG1XTaIABAC+9KLGswhoMqn4M0B2tNmc6g19d0LjfTwVj0lmaL2VgedNoL2OrKOtd+9wyvmoNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jW6y3wIj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so2729857b3a.1
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 12:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766263364; x=1766868164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rICY1Fhpudv9OZIQ1xtxoji87Ec6uah1wEq45r1oWQ=;
        b=jW6y3wIjpI/lMsg7aXodjJj9wx/JvSpE2XZ6ufeKdVUJ1g7+aXZSr9+J5x1Ga0yz3p
         7W2IplMUzgEHywixMnXYSvBZwRa6XFjPdNXfGiP3EjjEICqTTsjXsOHWOLnW9AFSESqx
         4Ai31l8gXaVX9JZD/SwlzEwj14blAqVpOqEjGn0+Lp6elWKBNfrEMHAjCV7vUYiIThJ1
         F4FU64f6mswVcdU3sGRc6rC4EBqKGwVRRRNi/APwZBKHhGspejMZlXZ0VaKbhVKF59M5
         eCkE9+FRbP0hdu6aQGjxkEtH6eLPradiJvMjHc5ekKccZAhpSzLoh/Ur2Uue0qF+8Jkb
         osig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766263364; x=1766868164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3rICY1Fhpudv9OZIQ1xtxoji87Ec6uah1wEq45r1oWQ=;
        b=ZUxsXHe9vAZve0LCZwvgOqyH/VtyB1N9Bv7CFLNdQVtwKMeV6cJ2ev971XyKXqdlHn
         yEUp0BfSGrhZBQea3b534JvxxdNidjK6IMboylHna69R9T1vJYy4HnX5XkbGgJrlwam5
         23SAI7y0kuIa17aIer4YPQSzDWyMW6Z2trysIKr9HSCd3VkDLo/StSeZfA+GkXYgjPue
         2zqULq17VFijTKtAvGTsWw92lpET6mVmlZA+/ZrHobOOdKwA2DRHxwGSXg4hnv9nfIr1
         o8DgevI2iQTEDMlxVL/nvMnGWQreWBFUHrg/OZPccdZD+g8zprziMBntcY8668Vx8/tl
         pyAg==
X-Forwarded-Encrypted: i=1; AJvYcCUb3AF3xkoc6oUSLWYLeyC1Hf/4kdW38+EjSGIikATgxmNjgMnBMqAKz7oD9ijXY60iS8CrmtCJgjMPyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0C2A2ozmh5CQz1Uu8YZKwyA5oKTeBuLL1LanqIwc3wkVyQUQ
	/hflnWtrHe4SxFEqmCRnkl/X9j3+/t50vPRYB3shkgQCLbT2yRoEhnOI0lYISg==
X-Gm-Gg: AY/fxX7wWNAZL8T23gaRiqZIQMGt0VXVbUIotfMitTSr5nyTt7SfMURztsOL/KXd19V
	08bVMgS1VKVIvg25YwzW9K53bT0VOJUcLf9zzNl5NT1Rsw6f0AR9O8UXJaZaMTrkZjGNZz7wyf6
	rR3XuFiqh4eDM/UQgB8j85v+8TexuLzUhgtFaGyLwzVgdG1jFHNjwBUmf0tl+8553oRoJvqIqp0
	770YWUhKXQ7F17GxqAkZ6psFrOaAXSj8Aj6wDaVIB7jXJPWVsjqkFfZQAY9XeJER0ZB5eJDNHn2
	5Kt1x/reF0aPCWKfi+ciGZ3QRbJXRF6LiJ4jITYt6+PpVHX1pCvv32MfB6aUOqNjRIEBxNf5ZM+
	45NQ0hTMnqMZLFN9EpEayat9iiYOEGtnKhpZPLgjJ9OB1LHEvbpkQyYzEK9Lld31J4Gkmy3eEuP
	tFouPipbsCH4QuCYbR8H5+eQ==
X-Google-Smtp-Source: AGHT+IEda9dTV+Ka7ReXoJpzOA/D7IOWm+8jR+heWnR2DbZKWmtdup080TxfZR9Ivnrma4z3tcmZ1g==
X-Received: by 2002:a05:7023:883:b0:11d:f890:6751 with SMTP id a92af1059eb24-121721acc21mr8200641c88.10.1766263364432;
        Sat, 20 Dec 2025 12:42:44 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm25462571c88.12.2025.12.20.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 12:42:44 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pavel@kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	alex.t.tran@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
Date: Sat, 20 Dec 2025 12:42:22 -0800
Message-ID: <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1766123192.git.alex.t.tran@gmail.com>
References: <cover.1766123192.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert binding for toshiba,et8ek8 from TXT to YAML format.
Update MAINTAINERS file accordingly.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../bindings/media/i2c/toshiba,et8ek8.txt     | 55 -----------
 .../bindings/media/i2c/toshiba,et8ek8.yaml    | 91 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 92 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
deleted file mode 100644
index 8d8e40c56872..000000000000
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
index 000000000000..68a8134df8fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
@@ -0,0 +1,91 @@
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
+    description:
+      External clock to the sensor
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
+      is in hardware standby mode when the signal is in the low state.
+    maxItems: 1
+
+  flash-leds:
+    $ref: /schemas/media/video-interfaces.yaml#
+
+  lens-focus:
+    $ref: /schemas/media/video-interfaces.yaml#
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
+        properties:
+          remote-endpoint: true
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
+
+            port {
+                csi_cam1: endpoint {
+                    remote-endpoint = <&csi_out1>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..50722537d548 100644
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


