Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC6642D77D
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhJNKyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhJNKyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:54:52 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69D1C061753
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 03:52:47 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t2so18087161wrb.8
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MUFaHH4gg5sozbz20I6J7Qg54c+OLtg963wUCphPgGQ=;
        b=tq5Wkjl3q/Jtu0QAxrYPmQ0rvP76lyqZqJjUDk8T/CGxjmIEPswkJeWQN3gMAQuI8K
         54+BM/bY8oqcMAxfaJP4n3J1hAErPUN+lsvD4VxK1CxdtefDi0W1OR/nOOi3zdJ6K4vR
         PM2bX69hytedAX20Rdjx0rFv7+qtmFJG1R7BHMfGa/br442QkHtT3khUKPSf4KA3iaWO
         VNV6loNjdZZt7WJQIyQQVNZFuCRDvbd6xzjBBfqmn72aKJWx6JCfihc1btLQQSkMlvoI
         vo+8a2humDFh7qwSRQFilHUWuaZ1hoTJ3TUSdyMN4WtSmd/4DVZnnJDLTFzPARxwLd1W
         NHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MUFaHH4gg5sozbz20I6J7Qg54c+OLtg963wUCphPgGQ=;
        b=LZTMDAu0Bb03+HRVe8i838eAQzEDxnvFpxhbDbPJlLf7XqRNm3KLPBu4evo2rC9fsJ
         t/i3N0qWQ1f72RUGdvWbPBbCQxJT/kS/Th0P4k1eo5MIXtVqv9AhCTcPQaXU1+KhlR+z
         YXFnmUU1wGR1Wy5027whErn2nkgzYsNQ6ewU7Fw90eh0q7ePaYjUkWdsVYpHu8H+V6Mv
         gyV2iIYepziHOL4frXgm1BU3eCQ5t7CnVoR26U/g2/3m79jtrfEvp2KYVXTCmaJsmVik
         mvnctOfjriGTKRpF1EjEQ93yTVGWoW3Tl7z6jX3Q2FESYEn1xp41wtULdoH8b3V9N98H
         m3qw==
X-Gm-Message-State: AOAM531g25djwdnBOpezsQ6ZnshUqBTNYZt/JNEeshMyj5stwJzjaW07
        urh2O/x8dVmVwEPuaJe+VP75Tg==
X-Google-Smtp-Source: ABdhPJxc28Na7lOt55YnTSJbEizzROqxgVR8D05GCE61S91l3O3xkSMyytrBST00cj4PokOa5Aa9kQ==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr5139085wme.162.1634208765878;
        Thu, 14 Oct 2021 03:52:45 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h1sm1848072wmb.7.2021.10.14.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:52:45 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: adv748x: Convert bindings to json-schema
Date:   Thu, 14 Oct 2021 12:52:36 +0200
Message-Id: <20211014105236.1947798-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert ADV748X analog video decoder documentation to json-schema.

While converting the bindings extend it to enforce that all port@n nodes
shall be encapsulated inside a ports node. This change do not effect
drivers parsing the ports@n nodes.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Update commit message to mention the added ports node.

Hello,

This conversion revealed a problem with the Renesas DTSI files for the
adv7482 nodes. A fix for that have been submitted in a separate patch,

    [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes

Kind Regards,
Niklas Söderlund
---
 .../devicetree/bindings/media/i2c/adv748x.txt | 116 ----------
 .../bindings/media/i2c/adv748x.yaml           | 211 ++++++++++++++++++
 2 files changed, 211 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
deleted file mode 100644
index 4f91686e54a6b939..0000000000000000
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ /dev/null
@@ -1,116 +0,0 @@
-* Analog Devices ADV748X video decoder with HDMI receiver
-
-The ADV7481 and ADV7482 are multi format video decoders with an integrated
-HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
-from three input sources HDMI, analog and TTL.
-
-Required Properties:
-
-  - compatible: Must contain one of the following
-    - "adi,adv7481" for the ADV7481
-    - "adi,adv7482" for the ADV7482
-
-  - reg: I2C slave addresses
-    The ADV748x has up to twelve 256-byte maps that can be accessed via the
-    main I2C ports. Each map has it own I2C address and acts as a standard
-    slave device on the I2C bus. The main address is mandatory, others are
-    optional and remain at default values if not specified.
-
-Optional Properties:
-
-  - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
-		     "intrq3". All interrupts are optional. The "intrq3" interrupt
-		     is only available on the adv7481
-  - interrupts: Specify the interrupt lines for the ADV748x
-  - reg-names : Names of maps with programmable addresses.
-		It shall contain all maps needing a non-default address.
-		Possible map names are:
-		  "main", "dpll", "cp", "hdmi", "edid", "repeater",
-		  "infoframe", "cbus", "cec", "sdp", "txa", "txb"
-
-The device node must contain one 'port' child node per device input and output
-port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
-are numbered as follows.
-
-	  Name		Type		Port
-	---------------------------------------
-	  AIN0		sink		0
-	  AIN1		sink		1
-	  AIN2		sink		2
-	  AIN3		sink		3
-	  AIN4		sink		4
-	  AIN5		sink		5
-	  AIN6		sink		6
-	  AIN7		sink		7
-	  HDMI		sink		8
-	  TTL		sink		9
-	  TXA		source		10
-	  TXB		source		11
-
-The digital output port nodes, when present, shall contain at least one
-endpoint. Each of those endpoints shall contain the data-lanes property as
-described in video-interfaces.txt.
-
-Required source endpoint properties:
-  - data-lanes: an array of physical data lane indexes
-    The accepted value(s) for this property depends on which of the two
-    sources are described. For TXA 1, 2 or 4 data lanes can be described
-    while for TXB only 1 data lane is valid. See video-interfaces.txt
-    for detailed description.
-
-Ports are optional if they are not connected to anything at the hardware level.
-
-Example:
-
-	video-receiver@70 {
-		compatible = "adi,adv7482";
-		reg = <0x70 0x71 0x72 0x73 0x74 0x75
-		       0x60 0x61 0x62 0x63 0x64 0x65>;
-		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		interrupt-parent = <&gpio6>;
-		interrupt-names = "intrq1", "intrq2";
-		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
-			     <31 IRQ_TYPE_LEVEL_LOW>;
-
-		port@7 {
-			reg = <7>;
-
-			adv7482_ain7: endpoint {
-				remote-endpoint = <&cvbs_in>;
-			};
-		};
-
-		port@8 {
-			reg = <8>;
-
-			adv7482_hdmi: endpoint {
-				remote-endpoint = <&hdmi_in>;
-			};
-		};
-
-		port@a {
-			reg = <10>;
-
-			adv7482_txa: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&csi40_in>;
-			};
-		};
-
-		port@b {
-			reg = <11>;
-
-			adv7482_txb: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1>;
-				remote-endpoint = <&csi20_in>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
new file mode 100644
index 0000000000000000..37df0441d8790c6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADV748X video decoder with HDMI receiver
+
+maintainers:
+  - Kieran Bingham <kieran.bingham@ideasonboard.com>
+
+description:
+  The ADV7481 and ADV7482 are multi format video decoders with an integrated
+  HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
+  from three input sources HDMI, analog and TTL.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - adi,adv7481
+          - adi,adv7482
+
+  reg:
+    minItems: 1
+    maxItems: 12
+    description:
+      The ADV748x has up to twelve 256-byte maps that can be accessed via the
+      main I2C ports. Each map has it own I2C address and acts as a standard
+      slave device on the I2C bus. The main address is mandatory, others are
+      optional and remain at default values if not specified.
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: main
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
+
+  interrupts: true
+
+  interrupt-names: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      "^port@[0-7]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port nodes for analog inputs AIN[0-7].
+
+    properties:
+      port@8:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port node for HDMI.
+
+      port@9:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port node for TTL.
+
+      port@a:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node, single endpoint describing the CSI-2 transmitter TXA.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@b:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node, single endpoint describing the CSI-2 transmitter TXB.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                maxItems: 1
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,adv7481
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 3
+
+        interrupt-names:
+          minItems: 1
+          items:
+            - enum: [ intrq1, intrq2, intrq3 ]
+            - enum: [ intrq1, intrq2, intrq3 ]
+            - enum: [ intrq1, intrq2, intrq3 ]
+    else:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 2
+
+        interrupt-names:
+          minItems: 1
+          items:
+            - enum: [ intrq1, intrq2 ]
+            - enum: [ intrq1, intrq2 ]
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        video-receiver@70 {
+            compatible = "adi,adv7482";
+            reg = <0x70 0x71 0x72 0x73 0x74 0x75 0x60 0x61 0x62 0x63 0x64 0x65>;
+            reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
+                        "infoframe", "cbus", "cec", "sdp", "txa", "txb";
+
+            interrupt-parent = <&gpio6>;
+            interrupts = <30 IRQ_TYPE_LEVEL_LOW>, <31 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "intrq1", "intrq2";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@7 {
+                    reg = <7>;
+
+                    adv7482_ain7: endpoint {
+                        remote-endpoint = <&cvbs_in>;
+                    };
+                };
+
+                port@8 {
+                    reg = <8>;
+
+                    adv7482_hdmi: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+
+                port@a {
+                    reg = <10>;
+
+                    adv7482_txa: endpoint {
+                        clock-lanes = <0>;
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csi40_in>;
+                    };
+                };
+
+                port@b {
+                    reg = <11>;
+
+                    adv7482_txb: endpoint {
+                        clock-lanes = <0>;
+                        data-lanes = <1>;
+                        remote-endpoint = <&csi20_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.33.0

