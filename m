Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3DFC5746DC
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 10:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbiGNIfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 04:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235862AbiGNIfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 04:35:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272343DBF6
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:35:06 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id bk26so1536195wrb.11
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Gd2E18qea0jsuZWlZBoiwbOMQRzeAYLshox6JxmwQw=;
        b=CHvFyFJyEBlz9BFCOBDATb2cgJxjkUq5xx54n4jkPDbtvICECpxGetnkrCuuDX/9mZ
         QmN8Bh1b40z+kF4MGibJN1V46mfXG0wwP8CcGVGQa+GavOjYW0gSWSamzfLFyjG65tDU
         QPIO8Wbm9tpkpmBihEncL1AGlHcdd9b3Cv1q73QpdkHdAwjBadEQuS2cl2zQRN1KcDUT
         +8Od3fp0uFK8ZCexg9bcwuogq4IwkhyyaxfAFhuAHAsU+b+SLsIVLIoY22CTC77uV8zK
         4k4ucL+QQY3PzACuaG+sUfjkFABQyJ3g0PQS8tx3VfKaedJPWA4Fi7GahE4z6rAdAj0s
         fMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Gd2E18qea0jsuZWlZBoiwbOMQRzeAYLshox6JxmwQw=;
        b=HGf5Puk9Po1fM9qavKC9imGCE7E4wuC7EY3ZseFTvuGMyqCoEpSwZvFnQ9okzI6lyL
         AJ39lne3/58xUQJGGa0DVOAM4IzrBZxb9U/UCfIOz5fw5CjAewBU7WbJgyPZatFc6Wu5
         ofiJ9x2u7kEujdsJWlNknnxsq3pKmPPO5VlYknuVyBsI+LPHjH2qCO+DZ/RQmJuzXiS2
         rI6lUaY/57y6wpo1lIK0K9iHfjtq5YArHI1JLLVibLB3hSUkr4Y2JKbaSywaK7POmuih
         3xUDnRRit/psa4gYRN5fKVS83zQyo2Qb07MRmxpWYXajnaoQ3eJZk765EdXTpQJZx5Lh
         vsmA==
X-Gm-Message-State: AJIora/lmioUJHOiP64sCGVSLyg0JrU5TPBDVZrpEIp+BCGKPfRSzYA9
        TPtBoAtsdsgs+dl9MVhb2HkRWR0JvV9NBwwuSlsytblmFMhvCx4ni51Xmjvd59+731Ft8dTmpaQ
        Tim7zmv/DcwCQ4zsKbG9eeE8rLOxwfH56F7h6o9V1fZaaEvrjsAnpdj1qMu8AEFxBO2577sOe
X-Google-Smtp-Source: AGRyM1tO6m5P8XnuWotmn32oBRoY1jJuOEbgH7KVbcBypbsQApWQ/+a1vhExfPQvvodtLROi4ErhZA==
X-Received: by 2002:a5d:620f:0:b0:20c:c1ba:cf8e with SMTP id y15-20020a5d620f000000b0020cc1bacf8emr6856442wru.426.1657787704592;
        Thu, 14 Jul 2022 01:35:04 -0700 (PDT)
Received: from melexis ([194.44.50.167])
        by smtp.gmail.com with ESMTPSA id j17-20020adfd211000000b002185631adf0sm844031wrh.23.2022.07.14.01.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 01:35:04 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org
Cc:     Volodymyr Kharuk <vkh@melexis.com>,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x camera sensor binding
Date:   Thu, 14 Jul 2022 11:34:47 +0300
Message-Id: <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657786765.git.vkh@melexis.com>
References: <cover.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device tree binding of the mlx7502x and update MAINTAINERS

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
new file mode 100644
index 000000000000..4ac91f7a26b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Melexis ToF 7502x MIPI CSI-2 Sensor
+
+maintainers:
+  - Volodymyr Kharuk <vkh@melexis.com>
+
+description: |-
+  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
+  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
+  Sensor 75026 is QVGA, while 75027 is VGA sensor.
+  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - melexis,mlx7502x
+          - melexis,mlx75026
+          - melexis,mlx75027
+
+  reg:
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency 8MHz
+    maxItems: 1
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as analog power supply(2.7V).
+
+  vddif-supply:
+    description:
+      Definition of the regulator used as interface power supply(1.8V).
+
+  vddd-supply:
+    description:
+      Definition of the regulator used as digital power supply(1.2V).
+
+  vdmix-supply:
+    description:
+      Definition of the regulator used as mixed driver power supply(1.2V).
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Sensor GPIO Control (active low)
+
+  melexis,trig-gpios:
+    maxItems: 1
+    description:
+      Hardware Trigger GPIO Control (active low)
+      When the hardware trigger mode is enabled, this GPIO is used to generate
+      a low level impulse for about 100us. The impulse triggers a new
+      measurement cycle.
+
+  melexis,leden-gpios:
+    maxItems: 1
+    description:
+      Led driver enable GPIO Control (active high)
+      This GPIO notifies the illumination driver when it is safe to use led
+      signals from the sensor.
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          clock-noncontinuous: true
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
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
+        mlx7502x: camera@57 {
+            compatible = "melexis,mlx7502x";
+            reg = <0x57>;
+            clocks = <&mlx7502x_clk>;
+
+            assigned-clocks = <&mlx7502x_clk>;
+            assigned-clock-parents = <&mlx7502x_clk_parent>;
+            assigned-clock-rates = <8000000>;
+
+            vddd-supply = <&mlx_7502x_reg>;
+
+            reset-gpios = <&gpio_exp 6 GPIO_ACTIVE_HIGH>;
+            melexis,trig-gpios = <&gpio_exp 2 GPIO_ACTIVE_HIGH>;
+            melexis,leden-gpios = <&gpio_exp 7 GPIO_ACTIVE_HIGH>;
+
+            port {
+                mlx7502x_out_mipi_csi2: endpoint {
+                    remote-endpoint = <&mipi_csi2_from_mlx7502x>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 < 960000000
+                                                   904000000
+                                                   800000000
+                                                   704000000
+                                                   600000000
+                                                   300000000 >;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1a68d888ee14..b00a726bb3db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12678,6 +12678,7 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://www.melexis.com
+F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
 F:	include/uapi/linux/mlx7502x.h
 
 MELFAS MIP4 TOUCHSCREEN DRIVER
-- 
BR,
Volodymyr Kharuk

