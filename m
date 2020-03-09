Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3941E17DD11
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgCIKOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:47 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48733 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgCIKOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:46 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003md-6i; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001m2-R9; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 09/19] media: dt-bindings: tvp5150: Add input port connectors DT bindings
Date:   Mon,  9 Mar 2020 11:14:18 +0100
Message-Id: <20200309101428.15267-10-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The TVP5150/1 decoders support different video input sources to their
AIP1A/B pins.

Possible configurations are as follows:
  - Analog Composite signal connected to AIP1A.
  - Analog Composite signal connected to AIP1B.
  - Analog S-Video Y (luminance) and C (chrominance)
    signals connected to AIP1A and AIP1B respectively.

This patch extends the device tree bindings documentation to describe
how the input connectors for these devices should be defined in a DT.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changelog:

v7:
Hi Rob,
I droped your r b tag because I changed the bindings in this
patch version. Please can you have a look on it again?

- fix missing AIP1B svideo connection (description and examples)

v3:
- remove examples for one and two inputs
- replace space by tabs

v2:
- adapt port layout in accordance with
  https://www.spinics.net/lists/linux-media/msg138546.html with the
  svideo-connector deviation (use only one endpoint)
---
 .../devicetree/bindings/media/i2c/tvp5150.txt | 112 ++++++++++++++++--
 1 file changed, 105 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index 8c0fc1a26bf0..28b64ad149ef 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -12,11 +12,32 @@ Optional Properties:
 - pdn-gpios: phandle for the GPIO connected to the PDN pin, if any.
 - reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
 
-The device node must contain one 'port' child node for its digital output
-video port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
+The device node must contain one 'port' child node per device physical input
+and output port, in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
+are numbered as follows
 
-Required Endpoint Properties for parallel synchronization:
+	  Name		Type		Port
+	--------------------------------------
+	  AIP1A		sink		0
+	  AIP1B		sink		1
+	  Y-OUT		src		2
+
+The device node must contain at least one sink port and the src port. Each input
+port must be linked to an endpoint defined in
+Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt. The
+port/connector layout is as follows
+
+tvp-5150 port@0 (AIP1A)
+	endpoint@0 -----------> Comp0-Con  port
+	endpoint@1 ------+----> Svideo-Con port
+tvp-5150 port@1 (AIP1B)  |
+	endpoint@1 ------+
+	endpoint@0 -----------> Comp1-Con  port
+tvp-5150 port@2
+	endpoint (video bitstream output at YOUT[0-7] parallel bus)
+
+Required Endpoint Properties for parallel synchronization on output port:
 
 - hsync-active: active state of the HSYNC signal. Must be <1> (HIGH).
 - vsync-active: active state of the VSYNC signal. Must be <1> (HIGH).
@@ -26,17 +47,94 @@ Required Endpoint Properties for parallel synchronization:
 If none of hsync-active, vsync-active and field-even-active is specified,
 the endpoint is assumed to use embedded BT.656 synchronization.
 
-Example:
+Example - three input sources:
+
+comp_connector_0 {
+	compatible = "composite-video-connector";
+	label = "Composite0";
+
+	port {
+		composite0_to_tvp5150: endpoint {
+			remote-endpoint = <&tvp5150_to_composite0>;
+		};
+	};
+};
+
+comp_connector_1 {
+	compatible = "composite-video-connector";
+	label = "Composite1";
+
+	port {
+		composite1_to_tvp5150: endpoint {
+			remote-endpoint = <&tvp5150_to_composite1>;
+		};
+	};
+};
+
+svideo_connector {
+	compatible = "svideo-connector";
+	label = "S-Video";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		svideo_luma_to_tvp5150: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&tvp5150_to_svideo_luma>;
+		};
+
+		svideo_chroma_to_tvp5150: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&tvp5150_to_svideo_chroma>;
+		};
+	};
+};
 
 &i2c2 {
-	...
 	tvp5150@5c {
 		compatible = "ti,tvp5150";
 		reg = <0x5c>;
 		pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
 		reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tvp5150_to_composite0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&composite0_to_tvp5150>;
+			};
+
+			tvp5150_to_svideo_luma: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&svideo_luma_to_tvp5150>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tvp5150_to_composite1: endpoint@0 {
+				reg = <0>;
+                                remote-endpoint = <&composite1_to_tvp5150>;
+			};
+
+			tvp5150_to_svideo_chroma: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&svideo_chroma_to_tvp5150>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
 
-		port {
 			tvp5150_1: endpoint {
 				remote-endpoint = <&ccdc_ep>;
 			};
-- 
2.20.1

