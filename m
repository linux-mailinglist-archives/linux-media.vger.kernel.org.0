Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F317FBF2D
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfKNFOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:14:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44114 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfKNFO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:14:29 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 292DE290F0D;
        Thu, 14 Nov 2019 05:14:21 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com, Jacob Chen <jacob2.chen@rock-chips.com>,
        Rob Herring <robh@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v11 10/11] media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
Date:   Thu, 14 Nov 2019 02:12:41 -0300
Message-Id: <20191114051242.14651-11-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191114051242.14651-1-helen.koike@collabora.com>
References: <20191114051242.14651-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

Add DT bindings documentation for Rockchip MIPI D-PHY RX

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Reviewed-by: Rob Herring <robh@kernel.org>
[refactored for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v11: None
Changes in v10:
- unsquash

Changes in v9:
- fix title division style
- squash
- move to staging

Changes in v8: None
Changes in v7:
- updated doc with new design and tested example

 .../bindings/media/rockchip-mipi-dphy.txt     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
new file mode 100644
index 000000000000..0a0be7b15a59
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
@@ -0,0 +1,38 @@
+Rockchip SoC MIPI RX D-PHY
+--------------------------
+
+Required properties:
+- compatible: value should be one of the following
+	"rockchip,rk3288-mipi-dphy"
+	"rockchip,rk3399-mipi-dphy"
+- clocks : list of clock specifiers, corresponding to entries in
+	clock-names property;
+- clock-names: required clock name.
+- #phy-cells: Number of cells in a PHY specifier; Should be 0.
+
+MIPI RX D-PHY use registers in "general register files", it
+should be a child of the GRF.
+
+Optional properties:
+- reg: offset and length of the register set for the device.
+- rockchip,grf: MIPI TX1RX1 D-PHY not only has its own register but also
+		the GRF, so it is only necessary for MIPI TX1RX1 D-PHY.
+
+Device node example
+-------------------
+
+grf: syscon@ff770000 {
+	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+
+...
+
+	dphy: mipi-dphy {
+		compatible = "rockchip,rk3399-mipi-dphy";
+		clocks = <&cru SCLK_MIPIDPHY_REF>,
+			<&cru SCLK_DPHY_RX0_CFG>,
+			<&cru PCLK_VIO_GRF>;
+		clock-names = "dphy-ref", "dphy-cfg", "grf";
+		power-domains = <&power RK3399_PD_VIO>;
+		#phy-cells = <0>;
+	};
+};
-- 
2.22.0

