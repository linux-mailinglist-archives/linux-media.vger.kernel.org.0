Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131BE561384
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 09:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbiF3Hpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 03:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbiF3Hpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 03:45:40 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C575D3B2B8
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:45:38 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id n8so11440164eda.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2VoT8i8QeRks6MlNZX2wBTS/uT3kTm3TDTeb8DcOv84=;
        b=Cg9ldFAaThDM26guf461l+5hmf9AUk2f8wu5v9WUkPIRT1g2qexq3gpJpL+fr9Lyc9
         VA0WfJrfo8XlXEvlfJ5kk8uoVJmCBMgGWEzXG+Uuc1SZEOKzsvFQaO8pwnIkQSZhQPYB
         +QPhGBko/zn+LtGQbPbP5e3dKyuQQ+T0bj1ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2VoT8i8QeRks6MlNZX2wBTS/uT3kTm3TDTeb8DcOv84=;
        b=DL37z2Ckqy9f+hhTjSrRrkJ1qSdrKBRjaQuVpKQjC31c149bMcA/s0vWSiNfNIQiRu
         odhM59V7e7p2crG1tzQrD4aZuyMvVEUO3cLNx6NHjBeIANQutAZOsf6EJLRIe+hTsDNQ
         8V7d3Ud7QKR9uLXIR+PB4syjJEtTk6YG//L6dNzwqhgP5UA9OGD4Z499OoYZS5EJ+8a0
         J8nYj6nI5P85j+0gj4y6vo6XldBXDGeNf7jEW4DkC1gHWegWIWKr/YL7aEbvB3l41OlI
         ES3H4q0MQEePzkM6dK3GS63EjtFHKdlbfDK7NpHytvsLyYNsxG8nk3nTN6V8Y45Fryiw
         fg0A==
X-Gm-Message-State: AJIora9b4DuISYGopO7pkPlN8IQStNrh2JXbdAwWSVWsUdF8AGb3d7sm
        H3qste0GEWaAdJWUDrWH4jansA==
X-Google-Smtp-Source: AGRyM1tzmpExmPgVDkzSX2xg767f6uWXrRkq/o6zPDN/PQYKdNvvBvcAXHnBfwWXSwDagnWlMbeC5Q==
X-Received: by 2002:a05:6402:438a:b0:435:bc23:d615 with SMTP id o10-20020a056402438a00b00435bc23d615mr9597360edc.283.1656575137327;
        Thu, 30 Jun 2022 00:45:37 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7c90d000000b0043564320274sm12594731edt.19.2022.06.30.00.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 00:45:37 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] media: dt-bindings: ov5693: document YAML binding
Date:   Thu, 30 Jun 2022 09:45:24 +0200
Message-Id: <20220630074525.481790-6-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
References: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
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
Reviewed-by: Sakari Ailus <sakari.ailus@iki.fi>
---
Changes since v1:
 - Fix allOf position as suggested by Krzysztof
 - Remove port description as suggested by Krzysztof
 - Fix EOF as suggested by Krzysztof

Changes since v2:
 - Fix commit body as suggested by Krzysztof

Changes since v3:
 - Add reviewed-by tags, ssuggested by Jacopo, Krzysztof

 .../bindings/media/i2c/ovti,ov5693.yaml       | 106 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
new file mode 100644
index 000000000000..b83c9fc04023
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
@@ -0,0 +1,106 @@
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
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
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
index 1fc9ead83d2a..844307cb20c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14719,6 +14719,7 @@ M:	Daniel Scally <djrscally@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
 F:	drivers/media/i2c/ov5693.c
 
 OMNIVISION OV5695 SENSOR DRIVER
-- 
2.25.1

