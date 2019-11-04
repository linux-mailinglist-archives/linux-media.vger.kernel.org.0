Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06562EDD1F
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 11:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfKDK50 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 05:57:26 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:34080 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726364AbfKDK5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 05:57:25 -0500
X-UUID: 7ee20e2c2c114b8ca4fc53144d7448e9-20191104
X-UUID: 7ee20e2c2c114b8ca4fc53144d7448e9-20191104
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 640859393; Mon, 04 Nov 2019 18:57:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 18:57:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 4 Nov 2019 18:57:14 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [V5, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
Date:   Mon, 4 Nov 2019 18:57:12 +0800
Message-ID: <20191104105713.24311-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20191104105713.24311-1-dongchun.zhu@mediatek.com>
References: <20191104105713.24311-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device tree bindings documentation for Omnivision OV02A10 image sensor.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
new file mode 100644
index 0000000..38dd8db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
@@ -0,0 +1,54 @@
+* Omnivision OV02A10 MIPI CSI-2 sensor
+
+Required Properties:
+- compatible: shall be "ovti,ov02a10"
+- clocks: reference to the eclk input clock
+- clock-names: shall be "eclk"
+- dovdd-supply: Digital I/O voltage supply, 1.8 volts
+- avdd-supply: Analog voltage supply, 2.8 volts
+- dvdd-supply: Digital core voltage supply, 1.8 volts
+- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
+		   if any. This is an active low signal to the OV02A10.
+- reset-gpios: reference to the GPIO connected to the reset pin, if any.
+	       This is an active high signal to the OV02A10.
+
+Optional Properties:
+- rotation: as defined in
+	    Documentation/devicetree/bindings/media/video-interfaces.txt,
+	    valid values are 0 (sensor mounted upright; the default) and
+	    180 (sensor mounted upside down).
+
+The device node shall contain one 'port' child node with an
+'endpoint' subnode for its digital output video port,
+in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+&i2c4 {
+	ov02a10: camera-sensor@3d {
+		compatible = "ovti,ov02a10";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_pins_cam1_mclk_on>;
+
+		clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
+			<&topckgen CLK_TOP_UNIVP_192M_D8>;
+		clock-names = "eclk", "freq_mux";
+		clock-frequency = <24000000>;
+
+		dovdd-supply = <&mt6358_vcamio_reg>;
+		avdd-supply = <&mt6358_vcama1_reg>;
+		dvdd-supply = <&mt6358_vcn18_reg>;
+		powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
+		rotation = <180>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			ov02a10_core: endpoint {
+				remote-endpoint = <&ov02a10_0>;
+				link-frequencies = /bits/ 64 <390000000>;
+			};
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b..ca503fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11949,6 +11949,13 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov13858.c
 
+OMNIVISION OV02A10 SENSOR DRIVER
+M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ov02a10.txt
+
 OMNIVISION OV2680 SENSOR DRIVER
 M:	Rui Miguel Silva <rmfrfs@gmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.9.2

