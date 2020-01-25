Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 374CF14950E
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbgAYLES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:04:18 -0500
Received: from mailoutvs52.siol.net ([185.57.226.243]:55274 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729145AbgAYLEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:04:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E7EB0520F58;
        Sat, 25 Jan 2020 12:04:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GANqUdVUYAjt; Sat, 25 Jan 2020 12:04:11 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 9C9DB520E6B;
        Sat, 25 Jan 2020 12:04:11 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 54AC4520F72;
        Sat, 25 Jan 2020 12:04:09 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 5/5] arm64: dts: allwinner: a64: Add deinterlace core node
Date:   Sat, 25 Jan 2020 12:03:53 +0100
Message-Id: <20200125110353.591658-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200125110353.591658-1-jernej.skrabec@siol.net>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A64 contains deinterlace core, compatible to the one found in H3.
It can be used in combination with VPU unit to decode and process
interlaced videos.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
index d225ea1f3b87..ddaf25782f1f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1114,6 +1114,20 @@ dphy: d-phy@1ca1000 {
 			#phy-cells =3D <0>;
 		};
=20
+		deinterlace: deinterlace@1e00000 {
+			compatible =3D "allwinner,sun50i-a64-deinterlace",
+				     "allwinner,sun8i-h3-deinterlace";
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
 		hdmi: hdmi@1ee0000 {
 			compatible =3D "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
--=20
2.25.0

