Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6FC481C1E
	for <lists+linux-media@lfdr.de>; Thu, 30 Dec 2021 13:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239331AbhL3Meu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Dec 2021 07:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239200AbhL3Met (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Dec 2021 07:34:49 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0A1C061574
        for <linux-media@vger.kernel.org>; Thu, 30 Dec 2021 04:34:49 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id j21so97479461edt.9
        for <linux-media@vger.kernel.org>; Thu, 30 Dec 2021 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7QMAbInQWbhdL1E+VTSWG9korXtCZ6MuxVQuJfwgF3c=;
        b=AkSItWLccvNn24tFuxlyVWyM4dznvns4GQO+o/s/573FIurTAJIjUpqAoe/dxcv+pC
         JB1sfAf0H4gLInAhKMcaXJ9sH54hgVea/Hd9oJsQSd3GhodvQXJ+6IytFAtBQwArmj6F
         suMg71uW2iGCmSHXYKZduEcQqfWHs53uDEgLFYNbCaDF5aUhDCImd+EiMGLgWpScDJLW
         MA7k3jJQ80Gp4FaN37Gw9ENiJu4PpA4Xfg655MfO/51dBWysla/+csS1EXC9MOEujkzC
         C3T9sVtwq4NhKWir7Abj0TEHYQYtNQNESy31c7q5a9SVzyHRolT1vYdth1RJ5NQR/n84
         lGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7QMAbInQWbhdL1E+VTSWG9korXtCZ6MuxVQuJfwgF3c=;
        b=W0IMIbRa9QthdF15H+kagksVybD12NdsCg7b44hWOlE27azVx1CcqVnXBA86qLFNPW
         MjzTZoSeMVaLTRsJ5s06WQT5Dxy0qDXAuVn6Lg54WNgRJLQa9FPCyNKOYzw5EP8TFLwG
         gnTLduL8CyTsuMvs4avsh+bjZqAlaAqo1PwBJZBitzG5U5nFsUk8Le0/751jdlCg5inV
         NoZsa27b3vrCVaxq+YcSAJh6RPCiKQsZ+bIU+2zlXjnFmvzEZZbNX0gsuXUSIsRrvsU8
         CEnnMwMD+oWVWRqEFEzKBLCJ/1qlGKk6GM+JFffm1g+n0j4PGRl4KK0gLNu6Bjf22Pfr
         B/Dw==
X-Gm-Message-State: AOAM531A6xRvLufE54Gh0hF9ENE6Db+n67vvgba1WNsXFsuebIUmRXNt
        LdYc/ZseWhKhS5EmCkEWvMF50A==
X-Google-Smtp-Source: ABdhPJzRFuexvkjov6vVpqH/XtDVbbJxBNRBucQxsWwpIGPZbl170Nm6YMPoQ0sTGu9dp+RMAd/wwQ==
X-Received: by 2002:a05:6402:42d5:: with SMTP id i21mr30081570edc.27.1640867687683;
        Thu, 30 Dec 2021 04:34:47 -0800 (PST)
Received: from localhost.localdomain ([185.224.57.161])
        by smtp.googlemail.com with ESMTPSA id sb10sm7593634ejc.121.2021.12.30.04.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 04:34:47 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3] dt-bindings: i2c: maxim,max96712: Add bindings for Maxim Integrated MAX96712
Date:   Thu, 30 Dec 2021 13:33:54 +0100
Message-Id: <20211230123354.623876-1-niklas.soderlund+renesas@ragnatech.se>
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

* Changes since v2
- Fix the $id file path.
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
new file mode 100644
index 0000000000000000..444f24838d3d8992
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96712.yaml#
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

