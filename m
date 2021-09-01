Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652413FD682
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 11:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243536AbhIAJUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 05:20:41 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:53911 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243336AbhIAJUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 05:20:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5112E5802FE;
        Wed,  1 Sep 2021 05:19:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 01 Sep 2021 05:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=qee/sL3xIG8kS
        /37Yk5ILzt4YnbfAQiYEx7cpLb1ICM=; b=pg6JPZsl595z6TDcaf/2cf6fQJC7w
        VzLYlDvHnWL9RYkHdHcGqZSwyw3N0ejbkMJjLUYaQ82bMKelAU8qqDsacOm72cL+
        63nZPy8LtNsMjYHeA2UhxwGbLoLSeuX7qVDJIHL6iohikpCFfp3oGK9NFcceNHd+
        xDna9ulnVhcfIXaDIQH4koZmAH84sI8AE4pFlAx1HaV4B7PjnoPDo9JOSZyFuJuo
        2A7blyQKLt/bxhP6zmrYD/NP+8cd89Dbh/IK0ckCl/u3w+QbDs6SFEY4bn5X05Yw
        ykyx0Tz/3CPYsJ3PwuEkgL/asVP6wsjPD8WgBnfNdG17GE5PAxl6VUXCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=qee/sL3xIG8kS/37Yk5ILzt4YnbfAQiYEx7cpLb1ICM=; b=cwOUTqVg
        lP3X5KOo9rqC5MnRu1MiE6hKyHVA6m/LUS0MeBvRW6hPKvNaqSFK/4FxTwn1mhti
        842m/9nHohpqxk2k8FqV/u9t9XtD7lLk6x4RBfgFfQaEXChodKPNtsddy6Qwapv4
        3UQRDrlRZ0RavbYz24LV+LvNUHNrd4QUdT8Upf2VLbmewbCRVyejDOffQc51e093
        rzK9nuzJex34RFzdOftjm5snnmQlkizo1LXZe4m3dNbX2QW734nFYpivFtyooe9j
        vViGyjR3Ucl2xvfVQpu64ztZ2jN0H/wlfjghlH86Q8sCPzWrLUHTn0ZUWSd++hBJ
        lptKMjMrYv7lCw==
X-ME-Sender: <xms:sEUvYQbJYa5A4Fy3KtoGtD_SacCG0sledmK4WrGJZbRQN3fx5TfLJw>
    <xme:sEUvYbYXvOfSM41IQf1iGmjxDAaWT3w_WZbsTxia0aaXqNwj85jSi32B1iMzLsw0A
    8RNCHbTLnwDdZ0IecI>
X-ME-Received: <xmr:sEUvYa_0i0_2Jn1qAgfQ_GwIgxwOaBIm3N9_-_7Vngp0fBSKN8x7qvWP8jZJrLxSegaxmmPsxwVfzYtCUbQ35N2nIbViYA7z-Ccg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
    fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
    gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sEUvYarUozRgtmuwC2wZflTNjYhRwPi5L_ktSzE4RwSy7vVZKLrOQA>
    <xmx:sEUvYboMzk-rhEULYSpXynOY0rF1cOocpO1bJ5zb9RVCL8SHaWQIjA>
    <xmx:sEUvYYQjiaJ43u-Pb8nRXcICrJ33pufJZIPdiKb4PiuDsWZbLhzsEg>
    <xmx:sEUvYe1zX98BWwiF0UAdtY8cHQtgyumFyJ-XtzwtgxZ437nzwlQpCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:43 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 27/52] dt-bindings: media: Convert OV5640 binding to a schema
Date:   Wed,  1 Sep 2021 11:18:27 +0200
Message-Id: <20210901091852.479202-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Omnivision OV5640 is supported by Linux thanks to its device tree
binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/media/i2c/ov5640.txt  |  92 -----------
 .../bindings/media/i2c/ovti,ov5640.yaml       | 154 ++++++++++++++++++
 2 files changed, 154 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
deleted file mode 100644
index c97c2f2da12d..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-* Omnivision OV5640 MIPI CSI-2 / parallel sensor
-
-Required Properties:
-- compatible: should be "ovti,ov5640"
-- clocks: reference to the xclk input clock.
-- clock-names: should be "xclk".
-- DOVDD-supply: Digital I/O voltage supply, 1.8 volts
-- AVDD-supply: Analog voltage supply, 2.8 volts
-- DVDD-supply: Digital core voltage supply, 1.5 volts
-
-Optional Properties:
-- reset-gpios: reference to the GPIO connected to the reset pin, if any.
-	       This is an active low signal to the OV5640.
-- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
-		   if any. This is an active high signal to the OV5640.
-- rotation: as defined in
-	    Documentation/devicetree/bindings/media/video-interfaces.txt,
-	    valid values are 0 (sensor mounted upright) and 180 (sensor
-	    mounted upside down).
-
-The device node must contain one 'port' child node for its digital output
-video port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-OV5640 can be connected to a MIPI CSI-2 bus or a parallel bus endpoint.
-
-Endpoint node required properties for CSI-2 connection are:
-- remote-endpoint: a phandle to the bus receiver's endpoint node.
-- clock-lanes: should be set to <0> (clock lane on hardware lane 0)
-- data-lanes: should be set to <1> or <1 2> (one or two CSI-2 lanes supported)
-
-Endpoint node required properties for parallel connection are:
-- remote-endpoint: a phandle to the bus receiver's endpoint node.
-- bus-width: shall be set to <8> for 8 bits parallel bus
-	     or <10> for 10 bits parallel bus
-- data-shift: shall be set to <2> for 8 bits parallel bus
-	      (lines 9:2 are used) or <0> for 10 bits parallel bus
-- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
-- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
-- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
-	       signal.
-
-Examples:
-
-&i2c1 {
-	ov5640: camera@3c {
-		compatible = "ovti,ov5640";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ov5640>;
-		reg = <0x3c>;
-		clocks = <&clks IMX6QDL_CLK_CKO>;
-		clock-names = "xclk";
-		DOVDD-supply = <&vgen4_reg>; /* 1.8v */
-		AVDD-supply = <&vgen3_reg>;  /* 2.8v */
-		DVDD-supply = <&vgen2_reg>;  /* 1.5v */
-		powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
-		rotation = <180>;
-
-		port {
-			/* MIPI CSI-2 bus endpoint */
-			ov5640_to_mipi_csi2: endpoint {
-				remote-endpoint = <&mipi_csi2_from_ov5640>;
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-			};
-		};
-	};
-};
-
-&i2c1 {
-	ov5640: camera@3c {
-		compatible = "ovti,ov5640";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ov5640>;
-		reg = <0x3c>;
-		clocks = <&clk_ext_camera>;
-		clock-names = "xclk";
-
-		port {
-			/* Parallel bus endpoint */
-			ov5640_to_parallel: endpoint {
-				remote-endpoint = <&parallel_from_ov5640>;
-				bus-width = <8>;
-				data-shift = <2>; /* lines 9:2 are used */
-				hsync-active = <0>;
-				vsync-active = <0>;
-				pclk-sample = <1>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
new file mode 100644
index 000000000000..0283b1895a75
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV5640 Image Sensor Device Tree Bindings
+
+maintainers:
+  - Steve Longerbeam <slongerbeam@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov5640
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: XCLK Input Clock
+
+  clock-names:
+    const: xclk
+
+  AVDD-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  DVDD-supply:
+    description: Digital core voltage supply, 1.5 volts
+
+  DOVDD-supply:
+    description: Digital I/O voltage supply, 1.8 volts
+
+  powerdown-gpios:
+    maxItems: 1
+    description: >
+      Reference to the GPIO connected to the powerdown pin, if any.
+
+  reset-gpios:
+    maxItems: 1
+    description: >
+      Reference to the GPIO connected to the reset pin, if any.
+
+  rotation:
+    enum: 
+      - 0
+      - 180
+
+  port:
+    description: Digital Output Port
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          clock-lanes:
+            const: 0
+
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2]
+
+          bus-width:
+            enum: [8, 10]
+
+          data-shift:
+            enum: [0, 2]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - AVDD-supply
+  - DVDD-supply
+  - DOVDD-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/clock/imx6qdl-clock.h>
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@3c {
+              compatible = "ovti,ov5640";
+              pinctrl-names = "default";
+              pinctrl-0 = <&pinctrl_ov5640>;
+              reg = <0x3c>;
+              clocks = <&clks IMX6QDL_CLK_CKO>;
+              clock-names = "xclk";
+              DOVDD-supply = <&vgen4_reg>; /* 1.8v */
+              AVDD-supply = <&vgen3_reg>;  /* 2.8v */
+              DVDD-supply = <&vgen2_reg>;  /* 1.5v */
+              powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+              reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+              rotation = <180>;
+
+              port {
+                  /* MIPI CSI-2 bus endpoint */
+                  ov5640_to_mipi_csi2: endpoint {
+                      remote-endpoint = <&mipi_csi2_from_ov5640>;
+                      clock-lanes = <0>;
+                      data-lanes = <1 2>;
+                  };
+              };
+          };
+      };
+
+  - |
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@3c {
+              compatible = "ovti,ov5640";
+              pinctrl-names = "default";
+              pinctrl-0 = <&pinctrl_ov5640>;
+              reg = <0x3c>;
+              clocks = <&clk_ext_camera>;
+              clock-names = "xclk";
+              DOVDD-supply = <&vgen4_reg>; /* 1.8v */
+              AVDD-supply = <&vgen3_reg>;  /* 2.8v */
+              DVDD-supply = <&vgen2_reg>;  /* 1.5v */
+
+              port {
+                  /* Parallel bus endpoint */
+                  ov5640_to_parallel: endpoint {
+                      remote-endpoint = <&parallel_from_ov5640>;
+                      bus-width = <8>;
+                      data-shift = <2>; /* lines 9:2 are used */
+                      hsync-active = <0>;
+                      vsync-active = <0>;
+                      pclk-sample = <1>;
+                  };
+              };
+          };
+      };
+
+...
-- 
2.31.1

