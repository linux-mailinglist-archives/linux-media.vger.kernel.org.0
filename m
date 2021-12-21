Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6123C47C38F
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 17:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239580AbhLUQMr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 11:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239555AbhLUQMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 11:12:46 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D65CC06173F
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 08:12:46 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bu9so8917869lfb.7
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 08:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yfv5aXMU9TYpLkiQK9aoGDrbvJw2B5NWyCkCE7qVn0k=;
        b=li1ReLybOkP08XdCuVSUKkhKFh1tsynEzrShPG9tZVG77RW9mAiWDi4AALJYfzNdE3
         LPEM9MZpsgQ9nij1CHvG9nCSG0Okwi1oRSMbA/aPRvK5ThBYQ5gxdrIvuI78xHPYOR6i
         h2L46+0MQxhX1hxzR4RthfzbMtFSpbxbVzRTlBwv4MH1pyfYxW+x/RVhws1OwZI2IrII
         sgHNWzl2ovqTZ404wyQBl8D2ZNMUmIfQNLSIUM/dJ5GkZ2jJmBSGqCR18KoxdL5q6+13
         eBZPSqoREQ8LdWM4/qNzxjb76VGzROfJ5pnHTrS4/RMjR7FyoD9XqEiXdMxcg0ua3oxI
         /92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yfv5aXMU9TYpLkiQK9aoGDrbvJw2B5NWyCkCE7qVn0k=;
        b=qH2xPGOzVmYHZDZl6pf2+2xFE18Zrwlgo9Qon8R+cAPU9JRQRpxl3pithLq/7b9z9+
         Dgrd3s5O5ZNmmJc5Ho0YkR7eUUjQbFsq9upE77yfk4lx+/whyStaEQ+6k3mIg/c//3Nl
         rozT2NcglT8+9QM50BsreCKm82qPkI0m1vYJRDI5jnMuaCOlQNh2iEp7ym1OdwkpM911
         raDZqPPGGhXA0AESci1c7983hdECxxQcz1yj0PUnJUQBchlY9sXk/l9GYcufn0js/qS/
         y+2kn4+EXZ7vJ6HhddRCuyePe6Ad67s3gO0ck/CtQb0uRBf2k3XCIoJfnDw8b8AGn537
         MhDg==
X-Gm-Message-State: AOAM533zAkSwqOeeJKc+a/f1eks26A2Pfsse2D3H7ECqMZPRfM6BRB35
        tsitSJbjgn6CLsgFbIgcWaN56Q==
X-Google-Smtp-Source: ABdhPJzhXuDTLbz5gDatMJq/3hpbsOBVVVeUDBRwYbAJyehpIqanF6bH0mE5vifofMRxd8aMsXQifw==
X-Received: by 2002:a05:6512:374a:: with SMTP id a10mr3552988lfs.103.1640103164654;
        Tue, 21 Dec 2021 08:12:44 -0800 (PST)
Received: from localhost.localdomain (host-78-79-238-21.mobileonline.telia.com. [78.79.238.21])
        by smtp.googlemail.com with ESMTPSA id s10sm550708lfr.45.2021.12.21.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 08:12:44 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2] dt-bindings: i2c: maxim,max96712: Add bindings for Maxim Integrated MAX96712
Date:   Tue, 21 Dec 2021 17:12:24 +0100
Message-Id: <20211221161224.71258-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
* Changes since v1
- Fixed spelling in binding description.
- Drop 'staging' per Rob's suggestion.
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
new file mode 100644
index 0000000000000000..b303f7a891169a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
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
+  forward direction and 187.5Mbps in the reverse direction. In GMSL1 mode, the
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
2.34.1

