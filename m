Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F5B42EA20
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 09:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhJOHaq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 03:30:46 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33277 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229546AbhJOHap (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 03:30:45 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B6382580F1D;
        Fri, 15 Oct 2021 03:28:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 15 Oct 2021 03:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=VNKOcczGye8r1pQca6/rADupDx
        1E7RNhhiNyjezLFkU=; b=FtucuTTwS0ornV6cd5ZA0imR622ocW1YuzBFct7hE6
        dHlxZyXmyRsD3mmXXvhIzPew0i/hBdONXFehgTTTTmGhHUvsizi/2wgpsKvbFkh2
        cmg2tS302ZvkOExCObi9q3KzHUDqCa3N5QTEeAwCXsiIXywVsx03HKFYOqlnLmZn
        WlDWCinNV86TlyNaNRSxqzkMYU8bTdE5iSaF2aCm06XbCBQ6YgfaMSn7Mxc74mox
        XRG5Qu2A+D3Z1CLucLBoNd8ccwOpqyvEWTMtNZR9mAFiT6z3Av0MOOpwhiwdJcxN
        ucJD++w51uA51GERUvXM00nVFwp43adT9e4SQPOpo4Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VNKOcczGye8r1pQca
        6/rADupDx1E7RNhhiNyjezLFkU=; b=TCBmH6a1HfmdxFK8d57mnMVkdOO0dLYZq
        KG/Pj9GyTF2UZ3mVvqG9Wtt1LwPUBJVBQnAloQBZQbkXUSS9biibr8iJOAgV4Sxs
        917BEX0vn59cEJt59XqU+UrsUh2q0NoyJjGqDsOzuoUfYUVnSwzNIbpo4ibUqnDR
        h4qrn1C9xmcLFFjuUl6DhFskBZ4QlzfYiZZvAtQyJucI2DdY20Cvb8+jYwGY+Ikd
        2O9qy3Dxkmqh4AaKbyonbuRSkscjjeaZA6/30V47ijCK5WszMVKdJ+DkzbSr36GQ
        E1jdphuag0Qtm4K89gSqve/1wvPupDdvaSQFTOvA4j/66KkiFbSMg==
X-ME-Sender: <xms:oi1pYY-HwsfL8aCyKRH8zknyq9myjR3-C9mL4gGA7HOJA8GpSbL9zw>
    <xme:oi1pYQtOaBVj5ke4jWipTnmi_lmd9Wi0IPVhVXgSNaAAyTndlohGekwjZ_kALwhys
    mfdoBtYeVSKGUpwPaQ>
X-ME-Received: <xmr:oi1pYeB0C0cEowJTQSBNn8w6YHsohOCxx4l8w4vFNOrkrsCsr4B1htAA9IfhIVZszXsYpkuhPUr6MLbx3eGAqDxlqqDDTVlYhwURDG7u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddufedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhephffhhfevtddthefg
    ieeigeffudehkefgtdeufedvtdduheduieekvddvfedvkeetnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oi1pYYdvRc6lxhaV-wc5n80f_lUF0zJu7j4rVrryEoZpucEtTi8IyQ>
    <xmx:oi1pYdOKe1RQ_yRnlBFBpcug25T_ifTVh8ed4bnDxmwWYLY84dtWCg>
    <xmx:oi1pYSlKvmzqOqN7VXrLDIXkyTqz_O42P_-T8Si1b--nYJWIY2-UbQ>
    <xmx:oi1pYQqAwTAmYUJw2NBm4JO3mQkGqT8vNJA8pJZfW8yjZ8LtDsGurQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 03:28:33 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3] dt-bindings: media: Convert OV5640 binding to a schema
Date:   Fri, 15 Oct 2021 09:28:30 +0200
Message-Id: <20211015072830.8580-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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

Changes from v2:
  - Fix whitespace error
  - Changed schema referenced for the port validation
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
index 000000000000..540fd69ac39f
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
+    $ref: /schemas/graph.yaml#/$defs/port-base
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

