Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7238A2EC328
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 19:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAFST2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 13:19:28 -0500
Received: from mailoutvs15.siol.net ([185.57.226.206]:36210 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbhAFST2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 13:19:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id AB69D522E4C;
        Wed,  6 Jan 2021 19:18:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id lzcbLdMjobo6; Wed,  6 Jan 2021 19:18:45 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6A407522F57;
        Wed,  6 Jan 2021 19:18:45 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 24B7F522E4C;
        Wed,  6 Jan 2021 19:18:45 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jernej.skrabec@siol.net, linux-sunxi@googlegroups.com
Subject: [PATCH] arm64: dts: allwinner: h5: Add deinterlace node
Date:   Wed,  6 Jan 2021 19:25:23 +0100
Message-Id: <20210106182523.1325796-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deinterlace core is completely compatible to H3.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
Note: I didn't add H5 fallback, since the only reason why this node
is not in common H3/H5 dtsi is that it's located on different addresses.

If anyone feel fallback compatible is needed, I'll add it in next revisio=
n.

 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h5.dtsi
index 10489e508695..578a63dedf46 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -121,6 +121,19 @@ crypto: crypto@1c15000 {
 			resets =3D <&ccu RST_BUS_CE>;
 		};
=20
+		deinterlace: deinterlace@1e00000 {
+			compatible =3D "allwinner,sun8i-h3-deinterlace";
+			reg =3D <0x01e00000 0x20000>;
+			clocks =3D <&ccu CLK_BUS_DEINTERLACE>,
+				 <&ccu CLK_DEINTERLACE>,
+				 <&ccu CLK_DRAM_DEINTERLACE>;
+			clock-names =3D "bus", "mod", "ram";
+			resets =3D <&ccu RST_BUS_DEINTERLACE>;
+			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects =3D <&mbus 9>;
+			interconnect-names =3D "dma-mem";
+		};
+
 		mali: gpu@1e80000 {
 			compatible =3D "allwinner,sun50i-h5-mali", "arm,mali-450";
 			reg =3D <0x01e80000 0x30000>;
--=20
2.30.0

