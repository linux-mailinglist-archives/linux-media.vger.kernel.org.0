Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3C112B485
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 13:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfL0MW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 07:22:29 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37555 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfL0MW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 07:22:29 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so20561279lfc.4
        for <linux-media@vger.kernel.org>; Fri, 27 Dec 2019 04:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yKIokAbQuU1ailYx+NXH0oQkr+kd6CzFZR9MUvZVdpY=;
        b=rEwTufTFn3TCjQtNdM+cpbDK4wBkJ3R2rRr/L8kvXR3TNu7samHIV3Y+2JXGXnXFqh
         /HZphtnixcuV9cI7fnHJ6Z12M3+s636Hj42JljPTpy87X11nLw2r7HWudcY3QERU7O4i
         oo4LBnyk+D+rQU+VkXpMT016IiQ4/r7xiRr/r+9QRrtof9TTfYKy/gSmyCXNUL9lvuu/
         VlN4PhHiWn4VMTyUH3EdB7ZzFg5wn4MlY2sdMlIbIgxnY0xc2KYbiwJwdzjUdYWLHL/h
         R78QKH+hwuybUEWWmA9h+gFOe6YrXbsYOvSlamEcJlpU3bW+DGjHTAyLIU4niKasJIuE
         6C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yKIokAbQuU1ailYx+NXH0oQkr+kd6CzFZR9MUvZVdpY=;
        b=tylyNOtvKuSTg4fpLEkFVIG25PgtnzzfhUJxaaVst0Qz7RWJv9ZfTu+95iwavrtz/M
         HP62uwMtnK8KbH4dxZ5MPmIRUjhsZtQmN1ccETd4R4PWR66WB9VxjCdYHH+Zk+yWRQDp
         lbPkuG6j0dJtdc9ZhzyZmU3FqY/4Lybrh+1RQokqCVNUkT2n1lJDAlZLtHgLzxaUVDNr
         3qL678g6bT2pgKrv6WT4eMtjX/2D5TpfYADsQmH4Ori+iEqb/FfdahSpZZuQjynFu3yd
         Abv22SL9KsGXHJGLnZhBJmWQv6iuM6QQerJoSRzlT2ewozqWOZDdWaU2N3ct/pdL6ZOv
         66TQ==
X-Gm-Message-State: APjAAAUh3NfTnNUgqzgNTPLBSVl5MzJH0vzbBLK2FqtXGitm4a8qPWNt
        IdcADP17bYztQjClNTNoy1G/QA==
X-Google-Smtp-Source: APXvYqxOZKsTKmSupYLsYa8IqSDyPHNTQJzw9cc0I+GrcDsaGf+HrZE3HLELSKJS02xUIvfI5NUzUQ==
X-Received: by 2002:a19:ac43:: with SMTP id r3mr29397177lfc.156.1577449346128;
        Fri, 27 Dec 2019 04:22:26 -0800 (PST)
Received: from TM-8481.Dlink (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.googlemail.com with ESMTPSA id x21sm13523692ljd.2.2019.12.27.04.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2019 04:22:25 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, ezequiel@collabora.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
Date:   Fri, 27 Dec 2019 15:21:13 +0300
Message-Id: <20191227122114.23075-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191227122114.23075-1-andrey.konovalov@linaro.org>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add YAML device tree binding for IMX219 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../devicetree/bindings/media/i2c/imx219.yaml | 134 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
new file mode 100644
index 000000000000..b58aa49a7c03
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -0,0 +1,134 @@
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
+  clock-names:
+    items:
+      - const: xclk
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
+  xclr-gpios:
+    description: |-
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released (set high) after all supplies are applied.
+
+  camera-clk:
+    type: object
+
+    description: Clock source for imx219
+
+    properties:
+      clock-frequency: true
+
+    required:
+      - clock-frequency
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          clock-lanes:
+            const: 0
+
+          data-lanes:
+            description: |-
+              Should be <1 2> for two-lane operation, or <1 2 3 4> for
+              four-lane operation.
+            oneOf:
+              - const: [[ 1, 2 ]]
+              - const: [[ 1, 2, 3, 4 ]]
+
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              Presence of this boolean property decides whether the MIPI CSI-2
+              clock is continuous or non-continuous.
+
+        required:
+          - clock-lanes
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
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
+            clock-names = "xclk";
+            VANA-supply = <&imx219_vana>;   /* 2.8v */
+            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
+            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
+
+            imx219_clk: camera-clk {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <24000000>;
+            };
+
+            port {
+                imx219_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ffa3371bc750..f7b6c24ec081 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15350,6 +15350,14 @@ S:	Maintained
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

