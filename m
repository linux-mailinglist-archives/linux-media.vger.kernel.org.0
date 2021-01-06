Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1323B2EC310
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 19:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbhAFSNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 13:13:16 -0500
Received: from mailoutvs25.siol.net ([185.57.226.216]:37814 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727148AbhAFSNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 13:13:15 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 924535233EB;
        Wed,  6 Jan 2021 19:12:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id x-kJU5SuPU1p; Wed,  6 Jan 2021 19:12:32 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 5151B5233E6;
        Wed,  6 Jan 2021 19:12:32 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 091645233EB;
        Wed,  6 Jan 2021 19:12:30 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, jernej.skrabec@siol.net,
        linux-sunxi@googlegroups.com
Subject: [PATCH 2/2] ARM: dts: sun8i: r40: Add deinterlace node
Date:   Wed,  6 Jan 2021 19:19:01 +0100
Message-Id: <20210106181901.1324075-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106181901.1324075-1-jernej.skrabec@siol.net>
References: <20210106181901.1324075-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

R40 contains deinterlace core compatible to that in H3. One peculiarity
is that RAM gate is shared with CSI1. User manual states it's separate
but that's not true. Shared gate was verified with BSP Linux code check
and with runtime tests (CPU crashed if CSI1 gate was not ungated).

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
index 7907569e7b5c..d5ad3b9efd12 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -190,6 +190,25 @@ mixer1_out_tcon_top: endpoint {
 			};
 		};
=20
+		deinterlace: deinterlace@1400000 {
+			compatible =3D "allwinner,sun8i-r40-deinterlace",
+				     "allwinner,sun8i-h3-deinterlace";
+			reg =3D <0x01400000 0x20000>;
+			clocks =3D <&ccu CLK_BUS_DEINTERLACE>,
+				 <&ccu CLK_DEINTERLACE>,
+				 /*
+				  * NOTE: Contrary to what datasheet claims,
+				  * DRAM deinterlace gate doesn't exist and
+				  * it's shared with CSI1.
+				  */
+				 <&ccu CLK_DRAM_CSI1>;
+			clock-names =3D "bus", "mod", "ram";
+			resets =3D <&ccu RST_BUS_DEINTERLACE>;
+			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects =3D <&mbus 9>;
+			interconnect-names =3D "dma-mem";
+		};
+
 		syscon: system-control@1c00000 {
 			compatible =3D "allwinner,sun8i-r40-system-control",
 				     "allwinner,sun4i-a10-system-control";
--=20
2.30.0

