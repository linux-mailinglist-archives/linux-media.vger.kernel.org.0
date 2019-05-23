Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9085A27A48
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 12:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730234AbfEWKWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 06:22:32 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:14964 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729949AbfEWKWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 06:22:32 -0400
X-UUID: 0f132aa81f0e462aa2f0c2bc6a3cb5eb-20190523
X-UUID: 0f132aa81f0e462aa2f0c2bc6a3cb5eb-20190523
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1460626260; Thu, 23 May 2019 18:22:26 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 May 2019 18:22:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 23 May 2019 18:22:18 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <menghui.lin@mediatek.com>,
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Subject: [PATCH 3/3] media: dt-bindings: media: i2c: Add bindings for ov02a10
Date:   Thu, 23 May 2019 18:22:04 +0800
Message-ID: <20190523102204.24112-4-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
References: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 8A6218DB89CF0F70A5DDA7529D5B525741C6C125BBA8720B2BC3CFF484D05CAB2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

Add device tree binding documentation for the OV02A10 CMOS image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../devicetree/bindings/media/i2c/ov02a10.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
new file mode 100644
index 0000000..fdc2904
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
@@ -0,0 +1,43 @@
+* Omnivision OV02A10 MIPI CSI-2 sensor
+
+Required Properties:
+- compatible: shall be "ovti,ov02a10"
+- clocks: reference to the xvclk input clock
+- clock-names: shall be "xvclk"
+- avdd-supply: Analog voltage supply, 2.8 volts
+- dovdd-supply: Digital I/O voltage supply, 1.8 volts
+- dvdd-supply: Digital core voltage supply, 1.8 volts
+- reset-gpios: Low active reset gpio
+
+The device node shall contain one 'port' child node with an
+'endpoint' subnode for its digital output video port,
+in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+The endpoint optional property 'data-lanes' shall be "<1>".
+
+Example:
+&i2c4 {
+	sensor_sub: sensor_sub {
+		compatible = "ovti,ov02a10";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_pins_cam1_mclk_on>;
+
+		clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
+			<&topckgen CLK_TOP_UNIVP_192M_D8>;
+		clock-names = "xvclk", "freq_mux";
+
+		avdd-supply = <&mt6358_vcama1_reg>;
+		dvdd-supply = <&mt6358_vcn18_reg>;
+		dovdd-supply = <&mt6358_vcamio_reg>;
+		pwdn-gpios = <&pio 107 1>;
+		reset-gpios = <&pio 109 1>;
+
+		port@0 {
+		   ov02a10_core: endpoint {
+		       remote-endpoint = <&ov02a10_0>;
+			   data-lanes = <1>;
+		   };
+		};
+	};
+};
-- 
2.9.2

