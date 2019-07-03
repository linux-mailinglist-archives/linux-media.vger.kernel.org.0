Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF625EC81
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 21:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfGCTK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 15:10:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42542 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGCTK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 15:10:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 47C9428ABC2
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Helen Koike <helen.koike@collabora.com>,
        Christoph Muellner <christoph.muellner@theobroma-systems.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tony Xie <tony.xie@rock-chips.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v7 13/14] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
Date:   Wed,  3 Jul 2019 16:09:09 -0300
Message-Id: <20190703190910.32633-14-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703190910.32633-1-helen.koike@collabora.com>
References: <20190703190910.32633-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shunqian Zheng <zhengsq@rock-chips.com>

It's a Designware MIPI D-PHY, used for ISP0 in rk3399.

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
[update for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v7:
- add phy-cells

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index e7cf52e4b0ec..6b8e211e84c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1388,6 +1388,17 @@
 			status = "disabled";
 		};
 
+		mipi_dphy_rx0: mipi-dphy-rx0 {
+			compatible = "rockchip,rk3399-mipi-dphy";
+			clocks = <&cru SCLK_MIPIDPHY_REF>,
+				<&cru SCLK_DPHY_RX0_CFG>,
+				<&cru PCLK_VIO_GRF>;
+			clock-names = "dphy-ref", "dphy-cfg", "grf";
+			power-domains = <&power RK3399_PD_VIO>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		u2phy0: usb2-phy@e450 {
 			compatible = "rockchip,rk3399-usb2phy";
 			reg = <0xe450 0x10>;
-- 
2.20.1

