Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC7B251E6B
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgHYRft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:35:49 -0400
Received: from mailoutvs3.siol.net ([185.57.226.194]:60510 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726803AbgHYRfp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:35:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 266975247CD;
        Tue, 25 Aug 2020 19:35:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id zA2TNDro-sN3; Tue, 25 Aug 2020 19:35:42 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id D1D435247BB;
        Tue, 25 Aug 2020 19:35:42 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 89D0D524801;
        Tue, 25 Aug 2020 19:35:40 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Subject: [PATCH 5/5] ARM: dts: sun8i: r40: Add video engine node
Date:   Tue, 25 Aug 2020 19:35:23 +0200
Message-Id: <20200825173523.1289379-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825173523.1289379-1-jernej.skrabec@siol.net>
References: <20200825173523.1289379-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 SoC has a video engine.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
index 0c7526365896..7907569e7b5c 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -273,6 +273,17 @@ csi0: csi@1c09000 {
 			status =3D "disabled";
 		};
=20
+		video-codec@1c0e000 {
+			compatible =3D "allwinner,sun8i-r40-video-engine";
+			reg =3D <0x01c0e000 0x1000>;
+			clocks =3D <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
+			<&ccu CLK_DRAM_VE>;
+			clock-names =3D "ahb", "mod", "ram";
+			resets =3D <&ccu RST_BUS_VE>;
+			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			allwinner,sram =3D <&ve_sram 1>;
+		};
+
 		mmc0: mmc@1c0f000 {
 			compatible =3D "allwinner,sun8i-r40-mmc",
 				     "allwinner,sun50i-a64-mmc";
--=20
2.28.0

