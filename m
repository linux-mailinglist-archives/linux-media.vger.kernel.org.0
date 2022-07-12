Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA16572105
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 18:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiGLQeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 12:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiGLQeV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 12:34:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5382559C
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 09:34:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o4so11957403wrh.3
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=klIuiYkZWbRMkCmGujIVKAt0cLr/WkyvgD6JQ+6Oul0=;
        b=UHGrVJVDRRTIjuwhoxPgsyuXY178AvoBZAt8tYmvGNAt3wUNp2eGbzAjSUO5CtIYWd
         v4k2Asy2bsfkKrfan8fTUdNaMHi1NErgamwFN98Y6IazN/uQYn7LWxYZENDlDSo0BCVN
         IGQifg6kLGBLEcl5SaOkTTQWGIPCoL9vbJ998=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=klIuiYkZWbRMkCmGujIVKAt0cLr/WkyvgD6JQ+6Oul0=;
        b=muCdBV6s9o7xSNhqAW190hVoxDPQ7VLAwrlWb/TK/aDl9xHGn6Mg28oVbkzSM/16GV
         50tdMj7q9iZWYtm+CZdlDRoev9RVhIJd/OCxRsLYXypcAL3hUOLL9y38yUh1EQFOntR6
         l9P5UywCkub/sNSrJX9anY4fcGiUatcY9+W/Gk2Kt81AFrF5SffQDATkK8kbFE3vaxCi
         SxSGWlMOcPF12vx2QYK7Q/07Z+GIGHYMvgqGn9RkriIGL45K3Lub0f4MQLYD8H4NH+c9
         KTn056TBt6u6O+2NxxbRsjoICq5uKdKzUaY8EYOe/hXB7aGJvtJFkkOJoAyqC87h7Sh7
         XNLA==
X-Gm-Message-State: AJIora+vTGRLpUQ891/i5RTT01fgRPRJmQJzV7vnX4WAOPsYQFFwvUXU
        hhOvSRHxeKOSSZw1c5GvBdS9lA==
X-Google-Smtp-Source: AGRyM1vgTK7sBIJDryunUP/xvoLs0aUC4aUgVkdYn/ZM/piu/xJB+SrFhOF0Vl4fRurfobrElcfxFA==
X-Received: by 2002:a5d:5087:0:b0:21d:9925:e15a with SMTP id a7-20020a5d5087000000b0021d9925e15amr16372612wrt.43.1657643659728;
        Tue, 12 Jul 2022 09:34:19 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-53-214.cust.vodafonedsl.it. [188.217.53.214])
        by smtp.gmail.com with ESMTPSA id j16-20020a5d6050000000b0021db2dcd0aasm2321052wrt.108.2022.07.12.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:34:19 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] media: dt-bindings: ov5693: document YAML binding
Date:   Tue, 12 Jul 2022 18:33:48 +0200
Message-Id: <20220712163349.1308540-6-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712163349.1308540-1-tommaso.merciai@amarulasolutions.com>
References: <20220712163349.1308540-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation of device tree in YAML schema for the OV5693
CMOS image sensor from Omnivision

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
 - Fix allOf position as suggested by Krzysztof
 - Remove port description as suggested by Krzysztof
 - Fix EOF as suggested by Krzysztof

Changes since v2:
 - Fix commit body as suggested by Krzysztof

Changes since v3:
 - Add reviewed-by tags, suggested by Jacopo, Krzysztof

Changes since v4:
 - Remove wrong Sakari reviewed-by tag, suggested by Krzysztof, Sakari

Changes since v5:
 - Remove dovdd-supply, avdd-supply, dvdd-supply from required properties
as suggested by Jacopo

 .../bindings/media/i2c/ovti,ov5693.yaml       | 103 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
new file mode 100644
index 000000000000..8974a2c746a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2022 Amarulasolutions
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5693.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV5693 CMOS Sensor
+
+maintainers:
+  - Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
+
+description: |
+  The Omnivision OV5693 is a high performance, 1/4-inch, 5 megapixel, CMOS
+  image sensor that delivers 2592x1944 at 30fps. It provides full-frame,
+  sub-sampled, and windowed 10-bit MIPI images in various formats via the
+  Serial Camera Control Bus (SCCB) interface.
+
+  OV5693 is controlled via I2C and two-wire Serial Camera Control Bus (SCCB).
+  The sensor output is available via CSI-2 serial data output (up to 2-lane).
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov5693
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      System input clock (aka XVCLK). From 6 to 27 MHz.
+    maxItems: 1
+
+  dovdd-supply:
+    description:
+      Digital I/O voltage supply, 1.8V.
+
+  avdd-supply:
+    description:
+      Analog voltage supply, 2.8V.
+
+  dvdd-supply:
+    description:
+      Digital core voltage supply, 1.2V.
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+      This corresponds to the hardware pin XSHUTDN which is physically
+      active low.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov5693: camera@36 {
+            compatible = "ovti,ov5693";
+            reg = <0x36>;
+
+            reset-gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cif_clkout_m0>;
+
+            clocks = <&cru SCLK_CIF_OUT>;
+            assigned-clocks = <&cru SCLK_CIF_OUT>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vcc_1v8>;
+            dvdd-supply = <&vcc_1v2>;
+            dovdd-supply = <&vcc_2v8>;
+
+            rotation = <90>;
+            orientation = <0>;
+
+            port {
+                ucam_out: endpoint {
+                    remote-endpoint = <&mipi_in_ucam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <450000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 66bffb24a348..5a7881ee15e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14767,6 +14767,7 @@ M:	Daniel Scally <djrscally@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
 F:	drivers/media/i2c/ov5693.c
 
 OMNIVISION OV5695 SENSOR DRIVER
-- 
2.25.1

