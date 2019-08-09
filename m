Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECAF87068
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 06:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfHIEHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 00:07:07 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:26652 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725920AbfHIEHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 00:07:07 -0400
X-Halon-ID: 200f8b75-ba5b-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 200f8b75-ba5b-11e9-bdc3-005056917a89;
        Fri, 09 Aug 2019 06:06:57 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
Date:   Fri,  9 Aug 2019 06:05:57 +0200
Message-Id: <20190809040558.10698-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The MAX9286 deserializes video data received on up to 4 Gigabit
Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
to 4 data lanes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max9286.txt      | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.txt b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.txt
new file mode 100644
index 0000000000000000..afff77a55bb70744
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.txt
@@ -0,0 +1,182 @@
+Maxim Integrated Quad GMSL Deserializer
+---------------------------------------
+
+The MAX9286 deserializer receives video data on up to 4 Gigabit Multimedia
+Serial Links (GMSL) and outputs them on a CSI-2 D-PHY port using up to 4 data
+lanes.
+
+In addition to video data, the GMSL links carry a bidirectional control channel
+that encapsulates I2C messages. The MAX9286 forwards all I2C traffic not
+addressed to itself to the other side of the links, where a GMSL serializer
+will output it on a local I2C bus. In the other direction all I2C traffic
+received over GMSL by the MAX9286 is output on the local I2C bus.
+
+Required Properties:
+
+- compatible: Shall be "maxim,max9286"
+- reg: I2C device address
+
+Optional Properties:
+
+- poc-supply: Regulator providing Power over Coax to the cameras
+- enable-gpios: GPIO connected to the #PWDN pin with inverted polarity
+
+Required endpoint nodes:
+-----------------------
+
+The connections to the MAX9286 GMSL and its endpoint nodes are modelled using
+the OF graph bindings in accordance with the video interface bindings defined
+in Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+The following table lists the port number corresponding to each device port.
+
+        Port            Description
+        ----------------------------------------
+        Port 0          GMSL Input 0
+        Port 1          GMSL Input 1
+        Port 2          GMSL Input 2
+        Port 3          GMSL Input 3
+        Port 4          CSI-2 Output
+
+Optional Endpoint Properties for GMSL Input Ports (Port [0-3]):
+
+- remote-endpoint: phandle to the remote GMSL source endpoint subnode in the
+  remote node port.
+
+Required Endpoint Properties for CSI-2 Output Port (Port 4):
+
+- remote-endpoint: phandle to the remote CSI-2 sink endpoint node.
+- data-lanes: array of physical CSI-2 data lane indexes.
+
+Required i2c-mux nodes:
+----------------------
+
+Each GMSL link is modelled as a child bus of an i2c bus multiplexer/switch, in
+accordance with bindings described in
+Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer device on the
+remote end of the GMSL link shall be modelled as a child node of the
+corresponding I2C bus.
+
+Required i2c child bus properties:
+- all properties described as required i2c child bus nodes properties in
+  Documentation/devicetree/bindings/i2c/i2c-mux.txt.
+
+Example:
+-------
+
+	gmsl-deserializer@2c {
+		compatible = "maxim,max9286";
+		reg = <0x2c>;
+		poc-supply = <&camera_poc_12v>;
+		enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				max9286_in0: endpoint {
+					remote-endpoint = <&rdacm20_out0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				max9286_in1: endpoint {
+					remote-endpoint = <&rdacm20_out1>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				max9286_in2: endpoint {
+					remote-endpoint = <&rdacm20_out2>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				max9286_in3: endpoint {
+					remote-endpoint = <&rdacm20_out3>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				max9286_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			camera@51 {
+				compatible = "imi,rdacm20";
+				reg = <0x51 0x61>;
+
+				port {
+					rdacm20_out0: endpoint {
+						remote-endpoint = <&max9286_in0>;
+					};
+				};
+
+			};
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			camera@52 {
+				compatible = "imi,rdacm20";
+				reg = <0x52 0x62>;
+				port {
+					rdacm20_out1: endpoint {
+						remote-endpoint = <&max9286_in1>;
+					};
+				};
+			};
+		};
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			camera@53 {
+				compatible = "imi,rdacm20";
+				reg = <0x53 0x63>;
+				port {
+					rdacm20_out2: endpoint {
+						remote-endpoint = <&max9286_in2>;
+					};
+				};
+			};
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			camera@54 {
+				compatible = "imi,rdacm20";
+				reg = <0x54 0x64>;
+				port {
+					rdacm20_out3: endpoint {
+						remote-endpoint = <&max9286_in3>;
+					};
+				};
+			};
+		};
+	};
-- 
2.22.0

