Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B933719B953
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 02:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387502AbgDBADG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 20:03:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35716 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732872AbgDBADG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 20:03:06 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AA0CE297669;
        Thu,  2 Apr 2020 01:03:00 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com
Subject: [PATCH 3/4] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
Date:   Wed,  1 Apr 2020 21:02:33 -0300
Message-Id: <20200402000234.226466-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200402000234.226466-1-helen.koike@collabora.com>
References: <20200402000234.226466-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shunqian Zheng <zhengsq@rock-chips.com>

Designware MIPI D-PHY, used for ISP0 in rk3399.

Verified with:
make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

This patchset came from the original ISP series from Rockchip:

    https://patchwork.kernel.org/patch/10267409/

The only difference is:
- add phy-cells
- update compatible to "rockchip,rk3399-mipi-dphy-rx0"
- commit message
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 33cc21fcf4c10..fc0295d2a65a1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1394,6 +1394,17 @@ io_domains: io-domains {
 			status = "disabled";
 		};
 
+		mipi_dphy_rx0: mipi-dphy-rx0 {
+			compatible = "rockchip,rk3399-mipi-dphy-rx0";
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
2.26.0

