Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482E43164CF
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhBJLN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 06:13:59 -0500
Received: from gloria.sntech.de ([185.11.138.130]:43744 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230150AbhBJLLO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 06:11:14 -0500
Received: from [95.90.166.74] (helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l9nO4-0003eN-Ec; Wed, 10 Feb 2021 12:10:24 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, cmuellner@linux.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 4/6] arm64: dts: rockchip: add #phy-cells to mipi-dsi1
Date:   Wed, 10 Feb 2021 12:10:18 +0100
Message-Id: <20210210111020.2476369-5-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210111020.2476369-1-heiko@sntech.de>
References: <20210210111020.2476369-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The dsi controller includes access to the dphy which might be used
not only for dsi output but also for csi input on dsi1, so add the
necessary #phy-cells to allow it to be used as phy.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index edbbf35fe19e..5d2178cb3e38 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1865,6 +1865,7 @@ mipi_dsi1: mipi@ff968000 {
 		rockchip,grf = <&grf>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#phy-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.29.2

