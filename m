Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE8C55223B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 18:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbiFTQ13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 12:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237807AbiFTQZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 12:25:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D761DA4E
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a29so18098479lfk.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=qo/WHXCojBRyOUaMRMNUSHBLXGqbqO8PlT55ozW2RqU=;
        b=f/D8mnj67vNnFHAk8M8tnC3KdUS1L/sENw56mg052aTmEvXQUxZ+neTgcH5NZ4iRb2
         DpQtZ003s35QkYG6KhUnS8g12Sr+dCL0BfsQrZR1ClUvjB1wP7h4Q7V8CwY9W9ZO7z19
         1EY2iOcLr6N+2w5LdDi61+V9KUmB1YOawmjSW6DVfUFMvxTIMuX/NEZGx7IToohoAwWY
         SPZGduBzqOLs13u0oZ+Ml2nAKmZhfMxgG+aNDzFQy3GlmCTgNV5QOkJ8xWY4UHJtW5o9
         fd55eds6z30FM8mVnhgqiuvspWfpupmCqT/0HiE05/EZow5OLI4gOaPs8uuGoxFz6/Ux
         +Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=qo/WHXCojBRyOUaMRMNUSHBLXGqbqO8PlT55ozW2RqU=;
        b=FeM4fKjeb94TY9kfDGniC+Y0Vx0p2zhL7Sxh90t0Af5Kna908IdpxQO80IUaFcIq9W
         Tq1jRo2VPgRLXEMSUUN8bIRxKoqmsQUFNUq0LrznLcSJE0ngBHRXGkumZLg8v5xKoGG9
         0xoKKKoQqFEGscts9Bnir/qnRf1aMywgZBRLsfkO7Qysi3q0dGI8MwGNVnZNlAanLb63
         2VVGdxH3UYZt9EwUNcQ2J4NVZHzNKc6HDIAlg7Gn6x5QjUXN0mz4xh1lqj5+5ilUrOHX
         xObXpf7AiHMtwYQkmEfVpEYx8vgJ8W8FBws8bxiZAMfQvuOKRIuZt1AehWUnbXbrdLU9
         8MyA==
X-Gm-Message-State: AJIora/Nzl3YXCMBX8K6LYxxWAg7AEBsdfs3F9OS0zBwy4uiCttTvWqP
        +XZxtSsUuwF4lDDICI2Qcr54TUiHF4fXkmFK2za2QvqdCKu/nZHsM//g7WxuGA3Gin780AYr7Dz
        Nqwmq90MI13D4bXXiKHeBlYLHBoppzEWGubI5zTDWeLZV8QWRwGdxAFipcsFbBnRxUvuWkN+q
X-Google-Smtp-Source: AGRyM1s+PE7cMcug3YPUS8LDO2CTxegDp5Hd8LKNdmayVayMPHWwaku8cfzzbHy9A3pTZjI5yy+vwg==
X-Received: by 2002:a05:6512:1693:b0:474:35c:8c11 with SMTP id bu19-20020a056512169300b00474035c8c11mr13400195lfb.19.1655742327277;
        Mon, 20 Jun 2022 09:25:27 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id j12-20020a056512344c00b0047f6d4a1ca7sm593498lfr.238.2022.06.20.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 09:25:26 -0700 (PDT)
Date:   Mon, 20 Jun 2022 19:25:25 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org, vkh@melexis.com, ays@melexis.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        kieran.bingham+renesas@ideasonboard.com, devicetree@vger.kernel.org
Subject: [PATCH 5/6] media: dt-bindings: media: i2c: Add mlx7502x camera
 sensor binding
Message-ID: <20220620162525.GA14062@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Volodymyr Kharuk <vkh@melexis.com>
To: linux-media@vger.kernel.org
Cc: Volodymyr Kharuk <vkh@melexis.com>,
	Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 5/6] media: dt-bindings: media: i2c: Add mlx7502x camera sensor binding
Date: Mon, 20 Jun 2022 19:24:36 +0300
Message-Id: <fde3ed603f2c605278ab8fe2c0aa03e96ce4fb33.1655738299.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655738299.git.vkh@melexis.com>
References: <cover.1655738299.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding of the mlx7502x and update MAINTAINERS

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 .../bindings/media/i2c/melexis,mlx7502x.yaml  | 106 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
new file mode 100644
index 000000000000..0cc6e425caec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Melexis ToF 7502x MIPI CSI-2 Sensor Device Tree Bindings
+
+maintainers:
+  - Volodymyr Kharuk <vkh@melexis.com>
+
+description: |-
+  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
+  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
+  Sensor 75026 is QVGA, while 75027 is VGA sensor.
+
+properties:
+  compatible:
+    const: melexis,mlx7502x
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: VCC supply phandle.
+
+  hw-trigger-gpio:
+    maxItems: 1
+    description: Hardware Trigger GPIO Control (active low)
+
+  reset-gpio:
+    maxItems: 1
+    description: Reset Sensor GPIO Control (active low)
+
+  leden-gpio:
+    maxItems: 1
+    description: Led driver enanle GPIO Control (active high)
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
+            anyOf:
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
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mlx7502x: camera@57 {
+            compatible = "melexis,mlx7502x";
+            reg = <0x57>;
+
+            vcc-supply = <&mlx_7502x_reg>;
+            hw-trigger-gpio = <&gpio_exp 2 GPIO_ACTIVE_HIGH>;
+            reset-gpio = <&gpio_exp 6 GPIO_ACTIVE_HIGH>;
+            leden-gpio = <&gpio_exp 7 GPIO_ACTIVE_HIGH>;
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
index 6b74de976e90..ce052a351fda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12676,6 +12676,7 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://www.melexis.com
+F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
 F:	include/uapi/linux/mlx7502x.h
 
 MELFAS MIP4 TOUCHSCREEN DRIVER
-- 
BR,
Volodymyr Kharuk

