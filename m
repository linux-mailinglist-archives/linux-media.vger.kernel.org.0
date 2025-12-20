Return-Path: <linux-media+bounces-49253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D6CD3808
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 23:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56A16301B2F5
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 22:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A622F3609;
	Sat, 20 Dec 2025 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMAKZgIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346FC2FC881
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766268219; cv=none; b=ChHlt0n5eY5N+xOf3kbPf2X6rELSN/JoBIPnH6tIoIcvW+kOirmzU34xSOvMWsVP0e5owGhQO+HAhzaHp0hJdSk2gVu2gY5RnU3bD2U6C3WtHpwnixWtxcw/9JvEPiW29jcocClujB5GyekylzoVx1sAUH6288RMRD4uE9zZexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766268219; c=relaxed/simple;
	bh=XeQz5/l3HlxHkhQp/zlzp/IlfIFRa1msrxz47AYFRK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0HGPivx668tMJrp0KGDWf8B+x2f/CLVHo/oJRqYY5EAdMbycMArhq0/zMyIYK8LlyZPhYnqC13XJXH3RLiLi6INkgjpDDRoj0SWNkZ5obeMz0WrdLKaVJ1sKYmYhBHkoaQ4jy8KfD8md8/G4EqOzx3NUA0VGpXrlJCHdS2w0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMAKZgIO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo3280344b3a.2
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 14:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766268217; x=1766873017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rICY1Fhpudv9OZIQ1xtxoji87Ec6uah1wEq45r1oWQ=;
        b=XMAKZgIOB2sLiF2sIB+Y5jRDav52rgN9j19AH7V2FVpJayDrNh5fEDxtok9Pa2WrOO
         ku6sMw1pqAwU9aNsdmvKY9UzkHvEcltQzStgbCjp2R7ksBfompJSIwf1mCCEPNIn/3Qv
         JsPRCR5TX+xEYzZ5smFDxtPlWT4PzFP2MF8gwWTSF9jtQ/wqGVeTvvfGyAwk/p4avgUP
         taxbg4IrOr2xGt3TqO0UJ38UL+VduC4BHAEFqa3K2a7M4sYgV5bUFAb6nllQErMiPqkl
         jpkM7hzt+kgTOjpgqanbHDqbONoAa+Q3R0SAubyzd6nodDoenkRSAV+IBcaubWhL1A2o
         9/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766268217; x=1766873017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3rICY1Fhpudv9OZIQ1xtxoji87Ec6uah1wEq45r1oWQ=;
        b=rrGShFuY8n4VmXBk8Dmt/2cN9xuUMtBxZ28HEm6aodqPGVzMcO/vy233JmyEEMuyoo
         karp80O1C97mbUfOqKN5BHGDR6br8Amw6vStoK32gPkzOc836k1EWbxq/Y16bUFyh9dL
         sTSKSoaclFjye/279TwVgJ5o5lahImYIhzE3t7UbSia/vLgMPrVuR5TxGQyQvXRCxxuO
         oaej9CCpcM6LLxewpIadM1zGvZDTCea1o8leBmx8G1/8NjzlqTIZLJMpXC3w65E1cRiC
         4Z4vz82nifNIkTe4ZKnH2KIP8MgzNxBD3zpKzNly4WFDaa7nz9vcI5C0eDNSn7GQ1+nT
         WI1A==
X-Forwarded-Encrypted: i=1; AJvYcCXc4SYJepWOP4vHNg6zuelibp+v8tWptj1ZsmatLXGakRNLXlFi+pRkBG+w5F8uiIWUd5i2mf1KCjEb0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFrR9L+s1TSAbnxOHpoWPWHi7BAjOSMrw1B7Ez2ooh3ZNz5Jn
	zcLOlx5ho3/aNhvH5U/2J9gyAoGUKk34CiDjSixmu6tHz1RHXKtWTlNQ
X-Gm-Gg: AY/fxX4seDx8lN0FVohZBBB9gagtJUeKZAri/zZhRN24Bw2L4YwsZwuFvfnai2o2fOy
	NvEO8BSGxAJ6eZW9J0NXlTA+TZoXvOHMDo1mqsFB4uxisDdiy301A9X7dTxuZNMXMqN46ZCS3Gn
	6cFrOXkVnLiS45zobzSl32Ke+UFO6Tt7fgr+PA4D1PUHa+9QAevKXHmEdSbO7de9GDVMLcR3cpc
	jQYI6Lz49HEPowzgzj72Btv2ezsvFV85hVNZR/J0Gu2FXIuydrMQ8BDz4Sn5F6WR4LyVKVts97A
	/mz1iqauxGPLtHNJlrna1T493bsrd73H/+6+2mSilY2bBaa6iS3x3Vzw7VeStvrb+er8siRBkfM
	h09haW3mSnarkMRVTdyWwp8sECCUthBPYDMLFOapJOfStFYMY+2484o4BsYQx6IqEmwKasMYCF/
	cCL3SwNyVrzVY=
X-Google-Smtp-Source: AGHT+IFrJ5P9UnBTKtA2lgtVNG5e6XfaPOR7fvP14/7jkIZvsB9Heckugmw7rTZyPRS5c+2zYErztQ==
X-Received: by 2002:a05:7022:f401:b0:11b:9386:a3c0 with SMTP id a92af1059eb24-121722fd5cfmr7534721c88.43.1766268217274;
        Sat, 20 Dec 2025 14:03:37 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm25010164c88.14.2025.12.20.14.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 14:03:37 -0800 (PST)
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
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
Date: Sat, 20 Dec 2025 14:03:24 -0800
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


