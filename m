Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C92B9F23D5
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 01:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733014AbfKGA6L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 19:58:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41338 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbfKGA6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 19:58:11 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A06E8283CBF
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
Subject: [PATCH v10 10/11] media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
Date:   Wed,  6 Nov 2019 21:56:16 -0300
Message-Id: <20191107005617.12302-11-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191107005617.12302-1-helen.koike@collabora.com>
References: <20191107005617.12302-1-helen.koike@collabora.com>
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

