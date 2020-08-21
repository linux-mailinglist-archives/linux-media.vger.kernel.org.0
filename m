Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31FD24D7CD
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 17:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgHUPAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 11:00:37 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38959 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgHUPAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 11:00:30 -0400
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPA id 58E4F100013;
        Fri, 21 Aug 2020 15:00:26 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, yong.deng@magewell.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH 2/7] dt-bindings: media: i2c: Add documentation for ov8865
Date:   Fri, 21 Aug 2020 16:59:30 +0200
Message-Id: <20200821145935.20346-3-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a documentation for the sensor ov8865 from Omnivision.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 .../devicetree/bindings/media/i2c/ov8865.txt  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8865.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8865.txt b/Documentation/devicetree/bindings/media/i2c/ov8865.txt
new file mode 100644
index 000000000000..ac5a662288de
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8865.txt
@@ -0,0 +1,51 @@
+* Omnivision OV8865 MIPI CSI-2
+
+Required Properties:
+- compatible: should be "ovti,ov8865"
+- clocks: reference to the xclk input clock.
+- clock-names: should be "xclk".
+- DOVDD-supply: Digital I/O voltage supply, 2.8 volts
+- AVDD-supply: Analog voltage supply, 2.8 volts
+- AFVDD-supply: Analog voltage supply, 2.8 volts
+- DVDD-supply: Digital core voltage supply, 1.2 volts
+- reset-gpios: reference to the GPIO connected to the reset pin.
+	       This is an active low signal to the OV8865.
+- powerdown-gpios: reference to the GPIO connected to the powerdown pin.
+		   This is an active low signal to the OV8865.
+- rotation: as defined in
+	    Documentation/devicetree/bindings/media/video-interfaces.txt,
+	    valid values are 0 (sensor mounted upright) and 180 (sensor
+	    mounted upside down).
+- remote-endpoint: a phandle to the bus receiver's endpoint node.
+- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
+- data-lanes: should be set to <4> (four CSI-2 lanes supported).
+
+The device node must contain one 'port' child node for its digital output video
+port, in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+&i2c2 {
+	ov8865: camera@36 {
+                 compatible = "ovti,ov8865";
+                 reg = <0x36>;
+                 clocks = <&ccu CLK_CSI_MCLK>;
+                 clock-names ="xclk";
+                 AVDD-supply = <&reg_ov8865_avdd>;
+                 DOVDD-supply = <&reg_ov8865_dovdd>;
+                 VDD2-supply = <&reg_ov8865_vdd2>;
+                 AFVDD-supply = <&reg_ov8865_afvdd>;
+                 powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+                 reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+                 rotation = <180>;
+
+                 port {
+                         ov8865_to_mipi_csi2: endpoint {
+                                 remote-endpoint = <&mipi_csi2_from_ov8865>;
+                                 data-lanes = <1 2 3 4>;
+                                 clock-lanes = <0>;
+                                 bus-type = <4>; /* V4L2_FWNODE_BUS_TYPE_CSI2_DPHY */
+                         };
+		};
+	};
+};
-- 
2.17.1

