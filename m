Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256F47B7894
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241506AbjJDHUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241504AbjJDHUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:20:17 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC84BB
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:20:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99de884ad25so317401366b.3
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696404012; x=1697008812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTpsAPBi5GKu/J1Fc/6++nPykYaaAvbzc3zwdXb4wDg=;
        b=pqMVwO9Zp+hquPo4VkRW1t87EKzJ2jjJu27JTgi/oMKr/Cbd03x6tE/PM2R+ZNG6R3
         wdAbx1vkBh5zUsGdeABbIatwQnsTti1dCQPG2pA/1UTnUVsrkwd7TqbMOqbBkMIyeDX0
         iA+FPMrJLfgpJdZa4uH8N52cCIqfeJ1mFtsil5+PpDm5p0ia0WADG2fqiZLLPJYxFWj7
         fAsH4o09YUB2WPGdnxhNsg3zXxYRVQgpZJoEwspD5iSQ7N7FsGL7Aj9GA/hHCvo2K2Ri
         qifTjlBM9obtIUjT4CABfWk3isWmcHclKwUDoJvSidzWWsSK55QbNZNwhH//8sZtyUDC
         znEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404012; x=1697008812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTpsAPBi5GKu/J1Fc/6++nPykYaaAvbzc3zwdXb4wDg=;
        b=q8l1rRTreA02N6quxsa9GTNpflB/NWzKl1KvITngxOF0NwNc+nA69Z4NocJcADm/5k
         pUG7FV3LZdfBg/TAGPmBSV0l9DHTzzmmSiizZDZ+XrTPU/nL3LhTF1yh/h66CtWkX5JJ
         b429MeHVR7Bm8ORNKypLedNuaLcah9tGKzyFUHnlDe4bgc/oFNEH7Et0JZqstx/4UHrE
         lP43orWxyH1+icawFu59iuMi6Ph/aktyGgoMJw3IE3CmtU50QDnBu5VpDNv+WpHbqObI
         9tOS/JIP/KnwImZBIoaAeFN0M2OcnWUnG3pE7OOga2JnpHHYZD+0DirsZNAAYFj78ISB
         pBbA==
X-Gm-Message-State: AOJu0YyPF+z1EtN7YV6dsHZCHHgIweFbDe0UjMGaMSid5LvrE3aGR3hO
        JZb6SbIB9H7VVWqo9kn9yUfkvQp7qYJho+ERzf/DLuWkAgOZdFdWXztT7cZZXOf/o1TkzGLvguO
        fQWRwFcxmejVT259Fe16N0iLwtBaPcUkJreRTOAeKVAP5Anq4WpmHWYeDF+pr4pmw7cakyYbyv1
        E4HA==
X-Google-Smtp-Source: AGHT+IFhzJQFUC8Ywe5pnbymojVwOeQD6C6f3/FA8U+MP7KdSZHH+Cb1O6x8LO6gixC/otHBghhk2w==
X-Received: by 2002:a17:906:8b:b0:9b2:b149:b81a with SMTP id 11-20020a170906008b00b009b2b149b81amr1684846ejc.64.1696404012705;
        Wed, 04 Oct 2023 00:20:12 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id o13-20020a170906358d00b0099bc8db97bcsm2265910ejb.131.2023.10.04.00.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:20:12 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 7/8] media: dt-bindings: Add mlx7502x camera sensor
Date:   Wed,  4 Oct 2023 10:19:46 +0300
Message-Id: <f46aac5e44fcf2ea94fa9d4ed883a6e397f66686.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1696347109.git.vkh@melexis.com>
References: <cover.1696347109.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device tree binding of the mlx7502x and update MAINTAINERS

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/melexis,mlx7502x.yaml  | 126 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
new file mode 100644
index 000000000000..7b86b6c5b151
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
@@ -0,0 +1,126 @@
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
+
+properties:
+  compatible:
+    enum:
+      - melexis,mlx75026
+      - melexis,mlx75027
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Clock frequency 8MHz
+    maxItems: 1
+
+  vdda-supply:
+    description:
+      Analog power supply(2.7V).
+
+  vddif-supply:
+    description:
+      Interface power supply(1.8V).
+
+  vddd-supply:
+    description:
+      Digital power supply(1.2V).
+
+  vdmix-supply:
+    description:
+      Mixed driver power supply(1.2V).
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Sensor GPIO Control (active low)
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
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+  - vdda-supply
+  - vddif-supply
+  - vddd-supply
+  - vdmix-supply
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
+            compatible = "melexis,mlx75027";
+            reg = <0x57>;
+            clocks = <&mlx7502x_clk>;
+
+            assigned-clocks = <&mlx7502x_clk>;
+            assigned-clock-parents = <&mlx7502x_clk_parent>;
+            assigned-clock-rates = <8000000>;
+
+            vdda-supply = <&reg_2v7>;
+            vddif-supply = <&reg_1v8>;
+            vddd-supply = <&reg_1v2>;
+            vdmix-supply = <&reg_1v2>;
+
+            reset-gpios = <&gpio_exp 6 GPIO_ACTIVE_HIGH>;
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
index 49cc44fe8ec4..c9da47ff2652 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13562,6 +13562,7 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://www.melexis.com
+F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
 F:	Documentation/userspace-api/media/drivers/mlx7502x.rst
 F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
 F:	include/uapi/linux/mlx7502x.h
-- 
BR,
Volodymyr Kharuk

