Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D6C3164C3
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 12:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhBJLNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 06:13:21 -0500
Received: from gloria.sntech.de ([185.11.138.130]:43742 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230125AbhBJLLN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 06:11:13 -0500
Received: from [95.90.166.74] (helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l9nO4-0003eN-V2; Wed, 10 Feb 2021 12:10:25 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, cmuellner@linux.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 5/6] arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
Date:   Wed, 10 Feb 2021 12:10:19 +0100
Message-Id: <20210210111020.2476369-6-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210111020.2476369-1-heiko@sntech.de>
References: <20210210111020.2476369-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

This enables variant a of the clkout signal for camera applications
and also the cifclkin pinctrl setting.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 5d2178cb3e38..7c661d84df25 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -2102,6 +2102,18 @@ clk_32k: clk-32k {
 			};
 		};
 
+		cif {
+			cif_clkin: cif-clkin {
+				rockchip,pins =
+					<2 RK_PB2 3 &pcfg_pull_none>;
+			};
+
+			cif_clkouta: cif-clkouta {
+				rockchip,pins =
+					<2 RK_PB3 3 &pcfg_pull_none>;
+			};
+		};
+
 		edp {
 			edp_hpd: edp-hpd {
 				rockchip,pins =
-- 
2.29.2

