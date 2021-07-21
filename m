Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D693D109E
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 16:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238971AbhGUNYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 09:24:38 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41613 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238964AbhGUNYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 80616580482;
        Wed, 21 Jul 2021 10:05:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 21 Jul 2021 10:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=qee/sL3xIG8kS
        /37Yk5ILzt4YnbfAQiYEx7cpLb1ICM=; b=hKDd1pM2Uc1pVSt+9PJ6CSFhzslQm
        doFrnfYEX0p0ZRlDcFD8BpAEd30Mf3QRhemOyKvNfbrHQvpP1lD6+SmpMS1jbAJt
        5eAgoPksdBchWo16Dff4fa7Lq73OgUp832zYlycJsNxTHK8dbg7XVsd5/uNuAqjz
        oLerVr2fB0Ui8BxeHOWmyEqaKVHogBEnwhfHVY9HPzjnKY/nsGRBNWf5BAb7OEFa
        ITZx6StTRqVp+wFDLpgNVoBmF8i4QNlFuxds+wqa6h14lHy64EO90Ib2CefUIjhR
        PuJVQxK+ZcmUwxpgWJvhtekRVRTN4BAhmN3gY9yA4xz5XP703O5pZdJHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=qee/sL3xIG8kS/37Yk5ILzt4YnbfAQiYEx7cpLb1ICM=; b=BGKU3l/4
        7LgWc1OYG0Wtb+q3o8f7hrkeG48r7esqcl9llsp5NXV/dFRh5sZBxlAxn7DDvSUY
        af/SogUcZSeyZdoGpGLPAqzuNRerkwKEb0z96XnWpwWwNN2eBwte2nwV4hFneJ2p
        LHV2OBwsnvwmT1iCj6ux+8LVDKTrPsg6D7AB8PX/E0W8qiivqzWVjI0semz08zvg
        vSWHMYlCI+WhJRPNFcUmOtrH0WVvlb6TTZPmYmyfHiRL+41Z+TdYbXMfQFx1TlKv
        RUq5yk/fi9aegOBLLNpYtLoLdC21y0Sy0y9gpFsEmwkkqZj8jYxcmcqoVfg+YN3m
        RSyfutAS4UDiqw==
X-ME-Sender: <xms:min4YNZaBCnXnUf5W2exBAFdyhrLOdlXZnQEXhkIWWJ-sw1y_DyWbg>
    <xme:min4YEYNtfnAZK56t62ARk_kZ3lQYXyLioV1p-nRU1kQh45IjtmEWoZbNCWFCZuwc
    yN2RUQRXOJUptwgwzU>
X-ME-Received: <xmr:min4YP_i6-Ok30m10CBRBMqU1HJj2MyePL9c6MNmNHjD3p_dH9EG3GwVjoyp98MWX9DYNleMfW_nIpuYvf3bGWqR1I5eIaoKu-i4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:min4YLosWKOvRYDee6SO_EBXMD8cWy9CfhgofX8N8t7upG8Dds7fmQ>
    <xmx:min4YIrrdYhtEjhXeGdiXAxnp730vWiLoP0xT4yf0BY1hIw8UuAVNA>
    <xmx:min4YBTi8VseZh2p7UKtD6xQRzcqykib0mYClp8F5Bypd9-uc2Wb1g>
    <xmx:min4YP3vGUvCAwThQ3hTfNPo2-eOTsFte9XeQODMuw9NKsEpmUDBog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:14 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 22/54] dt-bindings: media: Convert OV5640 binding to a schema
Date:   Wed, 21 Jul 2021 16:03:52 +0200
Message-Id: <20210721140424.725744-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
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

