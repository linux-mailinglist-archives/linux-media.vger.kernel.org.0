Return-Path: <linux-media+bounces-48768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 739ECCBCE99
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55FB03020C69
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5D732ABF7;
	Mon, 15 Dec 2025 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZM2Fk8VT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D332A3C0
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785607; cv=none; b=S5jY4cU4OWXSucQDQGO37ZGibiiCEDp7KFv3Bs9Co/hmlsJSgkHXw3vu1KWS0q7+5Y6B/qbdW62GaAafOF8thlPlqb5I+NZlqt3bijcyxJ2KmKgNS3FhLC2qSj60BgWlchqCeVdh8S7YC3tYSyBqD76lpp2y3vzFQlfL71cbyk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785607; c=relaxed/simple;
	bh=MT6YvlTp/tym7jlAKKvWLPIyFq2L811XHmb/5S7F63A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HClZM/eQovKELmxRtgrwX8MHKgesRuW5kifOdRBa0sKG7LvcX9swE79k5UyTchhTD0LHJGzPQpp+4bXL6ZYP/H+wMcsPr2RR2rE33a8C9ryacPOwBKjY4e6KUPCX77lMobnEeG5Da4JOJG1hK/wFzuTqptMh4Ub3+CODzhMR7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZM2Fk8VT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b9387df58cso4779131b3a.3
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 00:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765785604; x=1766390404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB9GCG9Z4qz6LZxUZn1uvrlMkgDhqoAwRIBcW65zHlM=;
        b=ZM2Fk8VTa1KypiEMNVnkQGDXHhS478pVhlxIb/eBhichA0eJ66P2Grj4aIxYyUkhoW
         a4smlojo1X80BwRmvbxN1HLGpmjh9SzdPRXun7ytMn9NTXMd+eHues1HkrFKUz40Xhhf
         Awxjw4Vm1l25DApkEmNzPxDKoKnaaDRI2d+ma2nh+NnC1akuKlkX+35XWemYIOO8yzO9
         Hr4kYxl4oRpUbrP+2uQXYKIUsKL+NbS4QVyGPoihpLucex8OmVBkkJzHxNSC6tijwIsQ
         R1e34/C+BcEf9+DLGV1KB9m0D5dqf8t99hWMKHwO0rk8g3oD74wbVUb7cau37omybFyr
         Yglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765785604; x=1766390404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AB9GCG9Z4qz6LZxUZn1uvrlMkgDhqoAwRIBcW65zHlM=;
        b=TNDK+aPJx9pCgHwbk3/kzj5sNkczyOb9JhzlGoWMJCvcpDSu/Aqz7czv6dBzJ2G9Bn
         P3uM3Rtq73uJ/03XOCAlUKTylgC3zwqTHv6+CKdz+42VOu/IFN2nwRm/1FIiYUfEPsjv
         m/aclTWld6U1kZILEEtPabmUd2rqYBIq9FfLWS0F7F0aznpdg3tPzfDF+UhoGpwgC620
         rkXnzKLyjDlZAsGjkntU4eug9WVaWaq6aGQjUMA1jvOVrXYiRC4YbAlDE3z/Lm+eurrk
         okFVmJ0KXW6+QsvUa5C5CSDjVMwEhpxnkonr6h3eJHo48eNCQY6SiOlYcRJfyFI3tSE+
         fByw==
X-Forwarded-Encrypted: i=1; AJvYcCXItIuMOVEg8rSOFY9Gc9GMlRnd59+1exFD9i27CCGmbGeQOu3jFFse9IvIxdxKuiDLn4FhWIumDUMgng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkOAWuWmP/mzN46EvAUePJCIBQ1KszE/QLfo5PtT/BdbEdZ+k
	kCt02yMQp+MJrKFrln6KIe2arumoyE1wcPjzN/DM/Q2/6/YYiTaqPaDA
X-Gm-Gg: AY/fxX4yusp2Q5f/f1AcYmzZ/f/+jrMBRWDXLHySmWzW4x1tK58+LPItn6d51jUJsNr
	tB358/5eOBCbDjczJsAye5L2kNCtH4v0UL6qchiAWX884SD9+6upPiOeiWfUd8gkGOMFEg6Nn/N
	mraLq8z2zUYjzMj2h3/qLml0eE/XZegnXUn8ysd/a4iyyBveiy5WfVOec9rB+9vNVIL4+F4O+66
	XPhl8utzBSg3EC7xtqI1SNnn8ozISF8Q9ISdtoU717lM+J2yMpjXsPoGe4wolASF+Qw/wpdAniV
	l4n7ZumRNXdpYOKEbM9iqT0qWfhEATMG0n403LKk5msUxHZvVAmFiZAwryCVOrVGZYpylt0mpDW
	KLAggqPZGihU06XbB0OJX6HDVayVpIlULn5PD5PvKXyDuAiIjtFdjnEA79lZma0MjsB26x3sMKK
	Hsuxvq0xMAVzjMORfu/lFMnQ==
X-Google-Smtp-Source: AGHT+IHXq6U+vTIbQsfvkxrFr56SYRwXtblPn+sgeZM7nEKQ8GZt2Mzq2fuD3DcFlMA7ExQdoI6fJQ==
X-Received: by 2002:a05:701b:2719:b0:11d:c86c:652e with SMTP id a92af1059eb24-11f34ac540dmr6432564c88.5.1765785603490;
        Mon, 15 Dec 2025 00:00:03 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm43637473c88.12.2025.12.15.00.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:00:03 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: media: i2c: et8ek8: document missing crc as optional property
Date: Sun, 14 Dec 2025 23:58:33 -0800
Message-ID: <ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1765782992.git.alex.t.tran@gmail.com>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the et8ek8 sensor device tree binding from TXT to YAML format.
Add the optional crc property to the endpoint node for the et8ek8 sensor.
This property enables CRC checksums for the sensor bus and was added to
match the new driver support for reading it from the device tree.
Add documentation reference to MAINTAINERS file.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../bindings/media/i2c/toshiba,et8ek8.txt     | 55 -----------
 .../bindings/media/i2c/toshiba,et8ek8.yaml    | 99 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 100 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
deleted file mode 100644
index 8d8e40c56..000000000
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
index 000000000..6e7f60ee9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
@@ -0,0 +1,99 @@
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
+          crc:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+            default: 1
+            description:
+              Enable CRC checksums.
+
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
+                    crc = <1>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8aec054a6..6a9ce4d17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18308,6 +18308,7 @@ M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
+F:	Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
 F:	drivers/media/i2c/ad5820.c
 F:	drivers/media/i2c/et8ek8
 
-- 
2.51.0


