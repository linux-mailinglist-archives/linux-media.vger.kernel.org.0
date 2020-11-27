Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981532C6D40
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 23:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731890AbgK0WeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 17:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731734AbgK0Wb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 17:31:27 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3FEC0613D4;
        Fri, 27 Nov 2020 14:31:05 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id g14so6988681wrm.13;
        Fri, 27 Nov 2020 14:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bnX8gip6olEGxTU0CImVzbRNpUPuqlbrUuQePl1Uw9Y=;
        b=C4RIvnLYI/y4vgM/5+TWTmQyI3QdovYwfx4C2Dc8M7QOh8tEq1hYH/bSJ7vUwUGkeT
         lKRpG7C9o49m5w9z7/l65gn1UlPQgSOyRayrk4KFfnBPsdzXYcu0tXWZuDcLT1wPm+g2
         xbblc+c/Zk6756IwbnMOkH1sDZ2atYjfB2lPgsSahOpgf+CJd5h/KA3rSr2gBd7w7GAe
         Jk+7a8/1bNCACdKajy2cr+3qeE3hpDEZdZEut2SxAQakPjQ+2GKA1R7jBzYqjTZGDKQC
         J3lqEFu3noMx9DImcCvwGky3KuK50Bv1GBnJeCdI+a8m4FoF/gh0qAS4f5sMKurd2T4y
         caAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bnX8gip6olEGxTU0CImVzbRNpUPuqlbrUuQePl1Uw9Y=;
        b=WxLiwAVsyitnQO5h4WUh6ea2qrGqVhs9aDjayNtzqLmL/0f0YGpmMfZ06hNqCUugGq
         oOjuIOJmz4opDdTR7UDGuqUy4Q6N1riXi2BnO2lhZdYs+ty2ijTy203glK8SDawKzCbT
         QTRWqqBtdlGqmJj9JhmyBY70/5QWZtCd654Z54lOeseFMKFjgvikbrIKU4Ke6vsBomMw
         OJkyB64lVRjmjomPJlwTVs7izPfQ5zIDOOb9rqxNBjWjEba3cuSR2q2Nd7OCqxdCIVKp
         w5YJzoxmTBNySkUuGz1uyxHOWeGj4ocF0vg+Q7tNrIBQSmVDStIgIlKXv6zwxFeXmJ1T
         El8A==
X-Gm-Message-State: AOAM530ZQhzh5uCFquXVGoZhCWJm7iSa7siWNbHpSq7JPJF8EJ0hVcVk
        tmjZpln7eC1spPw1ncVxHa4=
X-Google-Smtp-Source: ABdhPJzdt7PehhenOpoMSc/Yn7LHNC8QcgZIqxbToLXoSP6kBaOhX6+PaTEn0f2f9B8XV93oM0L8dQ==
X-Received: by 2002:adf:f98a:: with SMTP id f10mr13659524wrr.154.1606516264184;
        Fri, 27 Nov 2020 14:31:04 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id v188sm3308696wmb.20.2020.11.27.14.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 14:31:03 -0800 (PST)
From:   kholk11@gmail.com
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, marijn.suijten@somainline.org,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@iki.fi, andrey.konovalov@linaro.org,
        angelogioacchino.delregno@somainline.org, kholk11@gmail.com
Subject: [PATCH v3 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding
Date:   Fri, 27 Nov 2020 23:30:47 +0100
Message-Id: <20201127223047.2764643-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127223047.2764643-1-kholk11@gmail.com>
References: <20201127223047.2764643-1-kholk11@gmail.com>
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
 .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
new file mode 100644
index 000000000000..388297fcc358
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.3-Inch 25Mpixel Stacked CMOS Digital Image Sensor
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
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.15-1.20 volts
+
+  vana-supply:
+    description:
+      Analog voltage supply, 2.2 volts
+
+  vddl-supply:
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
+
+        properties:
+          data-lanes:
+            description: |-
+              The driver only supports four-lane operation.
+            items:
+              - const: 0
+              - const: 1
+              - const: 2
+              - const: 3
+
+          clock-noncontinuous: true
+
+          link-frequencies:
+            $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies. The driver currently needs
+              to switch between 780000000 and 480000000 Hz in order to
+              guarantee functionality of all modes.
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vana-supply
+  - vdig-supply
+  - vddl-supply
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
+            vana-supply = <&imx300_vana>;   /* 2.2v */
+            vdig-supply = <&imx300_vdig>;   /* 1.2v */
+            vddl-supply = <&imx300_vddl>;   /* 1.8v */
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
index c66710dd7e0a..21ba41db0063 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16279,6 +16279,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
 F:	drivers/media/i2c/imx290.c
 
+SONY IMX300 SENSOR DRIVER
+M:	AngeloGioacchino Del Regno <kholk11@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
+F:	drivers/media/i2c/imx300.c
+
 SONY IMX319 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.29.2

