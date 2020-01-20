Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79F291424DA
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 09:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgATIQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 03:16:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46729 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgATIQo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 03:16:44 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so32787737ljc.13
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2020 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DrTtuXqlFHgl6LFg4L3eQQ0BwLL0Pl04nTjQRXuEQl4=;
        b=vgC1ygBuWgN96JaLYJ5GEI440nRy3ZPDdJjlcIc3DwmrU18HkGsLx1oYadnVTgqsXZ
         R69HcPFYoo2ltDukSD3vXUTreDjGxcuAAGYwX8t6X0li/QXyZbXNH+T9WaKMozvBheQt
         bkgE8+q5dgRSKypMVz/HqSds4Jq7zT9TP5onbqx+wgwfDs41d8PJWCZ2svjvS3X/c6Xi
         CFUlFmkBAhihT3Z0Q410MR3OhIDwdv+TSt53pkerqo897WTqpN68laDbV+Q+ohJtsUyj
         44fkoVRwmdde7jinl/VRLeIcpSY3ka4khhW8bY2QgHe/r9g4nzA0mLcL+Z7iW4qlrxG7
         eOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DrTtuXqlFHgl6LFg4L3eQQ0BwLL0Pl04nTjQRXuEQl4=;
        b=BBJgXyEhvVwBfNKDtcqhMz/3YAWx6egtvxHtPCuSXv9Ji1GVsL/ZtzfaoGvs/2CtDZ
         FG8J4wGnS0xIL0/miK1NPGYlf3WBiH/51OHcSYvOyE6ynoO7j9jjknGVgP7i03xBXcbt
         FsmPAUOl//ktMDqWBl7+DCW10EqTQjOgkw0Y7nHWdKHkHvQste70fmMPLfhFORKGZEw+
         GY6NA8ePlz28HpcJZ/dq2q/AuRUGg6QSS3RQFq7bI/G3ghFfZDPDQ5hkvAeOPAL5rU71
         hb4R57vMM5w/lu6qp1yU3c/1fT+sOzvrWTmcgSso9OxQXJ1gJjedyVqGTmFXJrlOnFV5
         IGzQ==
X-Gm-Message-State: APjAAAVu+HL+TEvveB78W1wxuVG+1Wa8SEaYy1TtT4vAjfnIf5TYuNCu
        i0RBjy2MZKq/fWBt1XapSTum+w==
X-Google-Smtp-Source: APXvYqwr/9DxwLekBXvVLvBi0qFhyPKbrNdl7AwmoOp/XuLjKH5/EDC554HLl0TPEGiKMeG+3RwZmg==
X-Received: by 2002:a05:651c:8f:: with SMTP id 15mr13116337ljq.109.1579508201654;
        Mon, 20 Jan 2020 00:16:41 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id m21sm16261977lfh.53.2020.01.20.00.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:16:40 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@iki.fi, peter.griffin@linaro.org,
        dave.stevenson@raspberrypi.com, ezequiel@collabora.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
Date:   Mon, 20 Jan 2020 11:15:57 +0300
Message-Id: <20200120081558.25258-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120081558.25258-1-andrey.konovalov@linaro.org>
References: <20200120081558.25258-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add YAML device tree binding for IMX219 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../devicetree/bindings/media/i2c/imx219.yaml | 114 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
new file mode 100644
index 000000000000..32d6b693274f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+
+description: |-
+  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
+  with an active array size of 3280H x 2464V. It is programmable through
+  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx219
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  VDIG-supply:
+    description:
+      Digital I/O voltage supply, 1.8 volts
+
+  VANA-supply:
+    description:
+      Analog voltage supply, 2.8 volts
+
+  VDDL-supply:
+    description:
+      Digital core voltage supply, 1.2 volts
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released (set high) after all supplies are applied.
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          data-lanes:
+            description: |-
+              The sensor supports either two-lane, or four-lane operation.
+              If this property is omitted four-lane operation is assumed.
+              For two-lane operation the property must be set to <1 2>.
+            items:
+              - const: 1
+              - const: 2
+
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              MIPI CSI-2 clock is non-continuous if this property is present,
+              otherwise it's continuous.
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies.
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - VANA-supply
+  - VDIG-supply
+  - VDDL-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx219: sensor@10 {
+            compatible = "sony,imx219";
+            reg = <0x10>;
+            clocks = <&imx219_clk>;
+            VANA-supply = <&imx219_vana>;   /* 2.8v */
+            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
+            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
+
+            port {
+                imx219_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                    link-frequencies = /bits/ 64 <456000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cf6ccca6e61c..aae83699e146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15351,6 +15351,14 @@ S:	Maintained
 F:	drivers/media/i2c/imx214.c
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
 
+SONY IMX219 SENSOR DRIVER
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/imx219.c
+F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+
 SONY IMX258 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

