Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD3B45AEAE
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 22:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhKWVwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 16:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhKWVww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 16:52:52 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921AAC061714
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 13:49:43 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j3so434846wrp.1
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 13:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cx/RxGowWJ+ARkenpaoiEAOOeuCHEYaUTm5UxAY6csM=;
        b=5x1Ij98oK/pne1Z9rEJboic7qMOUJIDV11ltFZCaPVP1z9MEwJZum4mUJNPzdcG9pr
         giiOp4XDBijKmh5kI+CORs9dyo7H0CcHTX/aL6hZpduR48u1yfwcbPZqji+9hFlLNPu1
         +yPzYtF/eoeHd/u8NyGN1xlvqdhK6XQCpajmPCKMN4eN/92FLWxa73lZTy+zcv7tbqqV
         I5NO2tMC+7gzIWN5sCVgQ1AWGltjQO9pAljWnE/HQF8uJGakdjWSCzKCn28zv1XaoRTH
         Ns0dwi1t2bjMBbjjtZtvfL/qAAcgos+FFzdHtklwrpCdM5OhG6pl/KBqF5ZIlpgwyfh/
         2TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cx/RxGowWJ+ARkenpaoiEAOOeuCHEYaUTm5UxAY6csM=;
        b=AYgMRmPziZIWhNZxYB6X8T6yBzoXI6626dTHlLlpb59tva6w2dtCrSOjrcmFkksxfQ
         5fAfbh1ELvQymgDkxOn66IkcHp2LcT0RBqK3yZP59Lj3V9vEwSvBhQkXT8EXQ/qus/Nx
         DypYas68XisHGQNBgLoG1y7CFH1WvzhNxUwFv2Mhwwi0og35iicuOJ0fRooqZegHfXme
         Xn9BmAx8K7NgGIl0eikJ8pApgdbbAie5+fNq6yce1L+bD5RKDp36xoXrl1xzgVaU/f+3
         UlflXQZS7iDyQsW5uhr1khYb0cHS285u35e4NFSy535h9An4SyBy9G2yyXhtu03Hr243
         SQfA==
X-Gm-Message-State: AOAM530pRykL/4/84Wm0JEbFtPhspH9eGopd0YJgrkPPYvA2Rf9vC8jI
        qtjOIP56jNcyLCjmQy4aD0iHmg==
X-Google-Smtp-Source: ABdhPJwDytN/PHntpYMCQvQoS2a7fQzgUQ5ar0i50ahvm5shKlLObQaC+93HYMhXE9RrjJT+fpaz+A==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr10905139wrt.122.1637704182162;
        Tue, 23 Nov 2021 13:49:42 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id l8sm2520877wmc.40.2021.11.23.13.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:49:41 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: staging: media: i2c: Add bindings for Maxim Integrated MAX96712
Date:   Tue, 23 Nov 2021 22:49:22 +0100
Message-Id: <20211123214922.3981616-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for Maxim Integrated MAX96712 deserializer. The MAX96712
deserializer converts GMSL2 or GMSL1 serial inputs into MIPI CSI-2 D-PHY
or C-PHY formatted outputs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../staging/media/i2c/maxim,max96712.yaml     | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/i2c/maxim,max96712.yaml

diff --git a/Documentation/devicetree/bindings/staging/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/staging/media/i2c/maxim,max96712.yaml
new file mode 100644
index 0000000000000000..978f2c0e5caef567
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/media/i2c/maxim,max96712.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/staging/media/i2c/maxim,max96712.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+
+description: |
+  The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
+  CSI-2 D-PHY or C-PHY formatted outputs. The device allows each link to
+  simultaneously transmit bidirectional control-channel data while forward
+  video transmissions are in progress. The MAX96712 can accommodate as many as
+  four remotely located sensors using industry-standard coax or STP
+  interconnects.
+
+  Each GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
+  forward direction and 187.5Mbps in the re- verse direction. In GMSL1 mode, the
+  MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
+  serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
+
+properties:
+  compatible:
+    const: maxim,max96712
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  enable-gpios: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 1
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 2
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 3
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+    required:
+      - port@4
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c@e6508000 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reg = <0 0xe6508000>;
+
+            gmsl0: gmsl-deserializer@49 {
+                    compatible = "maxim,max96712";
+                    reg = <0x49>;
+                    enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
+
+                    ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@4 {
+                                    reg = <4>;
+                                    max96712_out0: endpoint {
+                                            clock-lanes = <0>;
+                                            data-lanes = <1 2 3 4>;
+                                            remote-endpoint = <&csi40_in>;
+                                    };
+                            };
+                    };
+            };
+    };
-- 
2.34.0

