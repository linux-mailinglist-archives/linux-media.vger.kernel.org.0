Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D8EAEB0C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 15:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfIJNFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 09:05:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:28575 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725916AbfIJNFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 09:05:00 -0400
X-UUID: 94e2d771f664496489e282bd0254852a-20190910
X-UUID: 94e2d771f664496489e282bd0254852a-20190910
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 927411041; Tue, 10 Sep 2019 21:04:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Sep 2019 21:04:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Sep 2019 21:04:50 +0800
From:   <dongchun.zhu@mediatek.com>
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
Subject: [V2, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Date:   Tue, 10 Sep 2019 21:04:45 +0800
Message-ID: <20190910130446.26413-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
References: <media: ov8856: DT bindings and sensor mode improvements>
 <20190910130446.26413-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds device tree bindings documentation for the ov8856 CMOS
image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../devicetree/bindings/media/i2c/ov8856.txt       | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.txt b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
new file mode 100644
index 0000000..99c654a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
@@ -0,0 +1,51 @@
+* Omnivision OV8856 MIPI CSI-2 sensor
+
+Required Properties:
+- compatible: Shall be "ovti,ov8856"
+- reg: I2C bus address of the device. Depending on how the sensor is wired,
+       it shall be <0x10>.
+- clocks: Reference to the xvclk input clock.
+- clock-names: Shall be "xvclk".
+- clock-frequency: Frequency of the xclk clock.
+- dovdd-supply: Digital I/O voltage supply, 1.8 volts
+- avdd-supply: Analog voltage supply, 2.8 volts
+- dvdd-supply: Digital core voltage supply, 1.5 volts
+- reset-gpios: High active reset gpio
+
+The device node shall contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required Properties on endpoint:
+- data-lanes: check ../video-interfaces.txt
+- link-frequencies: check ../video-interfaces.txt
+- remote-endpoint: check ../video-interfaces.txt
+
+Example:
+
+&i2c1 {
+	ov8856: camera-sensor@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&clk_24m_cam>;
+
+		clocks = <&cru SCLK_TESTCLKOUT1>;
+		clock-names = "xvclk";
+		clock-frequency = <19200000>;
+
+		avdd-supply = <&mt6358_vcama2_reg>;
+		dvdd-supply = <&mt6358_vcamd_reg>;
+		dovdd-supply = <&mt6358_vcamio_reg>;
+		reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			wcam_out: endpoint {
+				remote-endpoint = <&mipi_in_wcam>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000 180000000>;
+			};
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e..7746c6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11889,6 +11889,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov8856.c
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.txt
 
 OMNIVISION OV9650 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.9.2

