Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A76291759
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgJRMbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgJRMbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:31:14 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE60C0613CE;
        Sun, 18 Oct 2020 05:31:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j136so10010611wmj.2;
        Sun, 18 Oct 2020 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5krHm/bo+C26sgi9z1Mg3sNFoVSJVuUbTBE8mDuBFE=;
        b=cxUuY+q00E3MQiermTeSmkbZPW1mHZ/4dwqStrl7FHanVGucCuYaVglF7bF+F2qpma
         85ehto2JZXKMFEfuwKyYs45/H0fEZOHSp6cbTeaODm8lxk8VrrFcRDRAdRNk7dYBv3QO
         TuWhG67KppoBNTyVEd1+UFxaSVMc63TTzVk+Qt6Q++TM7Qkb7wmkT3P8Bq3E/P3X2Yp6
         njQfae2aDb6ER1WXo63d4gSgN47nV029nu9OWJNLG6VtFPCewrUBfgfi5GDSh3nR9HX9
         0Dc6K5szdqVbEUfN2iw7qYOxr1ZtDr5xFXjT3fT/rYjng9uUsEGDKpB9HykvpAxmnpJV
         ewjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5krHm/bo+C26sgi9z1Mg3sNFoVSJVuUbTBE8mDuBFE=;
        b=I++7w5DQl9XZ0w2Jlr8lcOS0HUttLp847ZDZiFNcE66yAbPRP7L1y+cVf7QWVgQQby
         zZX+KueU3dc2iUEu7VwmsPbi+0PMgj/LZqrU3Y5Dt7eA5rvzluyeje6x2h8FpMY8uZWC
         38jWssLEfXXVh7zrE5eqOgH9fJL4oKnfba9JtiEQssCMXzb1FxG6834TGzgv1sxdTRt4
         oTCMv5rFern3pQhNBc3Ll2GD3/dPwC5vq4VekhgLfYhYdEibdPiGmMdBxq6W4f64LkUh
         et7hpDSkWr6djQaIfyyM2wJdY3Zov6Pq0lE1AgCYA/BvtEoSd/MxsZgqXXo+w5ij4jWB
         KWtw==
X-Gm-Message-State: AOAM530dzZHDdv2MgJf/LMM0usix481Jpv7R7/uIu9KUxTMuYJYUbE3i
        74LgKtXj0YNTyB11ZfCgKOE=
X-Google-Smtp-Source: ABdhPJz5DmBiPThiLd9R0+6VBUTm7Qpg2ueKyNO4KvoNAz/9NtlrA3tgoWvoAjSYeYKZi0sk2ksSxA==
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr12309565wmc.114.1603024270977;
        Sun, 18 Oct 2020 05:31:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id q2sm13308568wrw.40.2020.10.18.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:31:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding
Date:   Sun, 18 Oct 2020 14:31:06 +0200
Message-Id: <20201018123106.14917-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018123106.14917-1-kholk11@gmail.com>
References: <20201018123106.14917-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add YAML device tree binding for IMX300 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/media/i2c/imx300.yaml | 115 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx300.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx300.yaml b/Documentation/devicetree/bindings/media/i2c/imx300.yaml
new file mode 100644
index 000000000000..82fb19c5018c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx300.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx300.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.3-Inch 8Mpixel Stacked CMOS Digital Image Sensor
+
+maintainers:
+  - AngeloGioacchino Del Regno <kholk11@gmail.com>
+
+description: |-
+  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
+  sensor with a pixel size of 1.08um and an active array size of
+  5948H x 4140V. It is programmable through I2C interface at address 0x10.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx300
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
+      Digital I/O voltage supply, 1.15-1.20 volts
+
+  VANA-supply:
+    description:
+      Analog voltage supply, 2.2 volts
+
+  VDDL-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
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
+              For four-lane operation the property must be set to <0 1 2 3>.
+            items:
+              - const: 0
+              - const: 1
+              - const: 2
+              - const: 3
+
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              MIPI CSI-2 clock is non-continuous if this property is present,
+              otherwise it's continuous.
+
+          link-frequencies:
+            $ref: /schemas/types.yaml#/definitions/uint64-array
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
+        imx300: sensor@10 {
+            compatible = "sony,imx300";
+            reg = <0x10>;
+            clocks = <&imx300_xclk>;
+            VANA-supply = <&imx300_vana>;   /* 2.2v */
+            VDIG-supply = <&imx300_vdig>;   /* 1.2v */
+            VDDL-supply = <&imx300_vddl>;   /* 1.8v */
+
+            port {
+                imx300_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <0 1 2 3>;
+                    clock-noncontinuous;
+                    link-frequencies = /bits/ 64 <780000000 480000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c66710dd7e0a..231937d9d16a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16279,6 +16279,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
 F:	drivers/media/i2c/imx290.c
 
+SONY IMX300 SENSOR DRIVER
+M:	AngeloGioacchino Del Regno <kholk11@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/imx300.yaml
+F:	drivers/media/i2c/imx300.c
+
 SONY IMX319 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.28.0

