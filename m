Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77E2B141C
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 19:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfILRwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 13:52:12 -0400
Received: from mailoutvs57.siol.net ([185.57.226.248]:33585 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731181AbfILRwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 13:52:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 0EF6D522719;
        Thu, 12 Sep 2019 19:52:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Cn9XC3Ed3qBl; Thu, 12 Sep 2019 19:52:08 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C5397521395;
        Thu, 12 Sep 2019 19:52:08 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 6A7535227D7;
        Thu, 12 Sep 2019 19:52:06 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH 6/6] dts: arm: sun8i: h3: Enable deinterlace unit
Date:   Thu, 12 Sep 2019 19:51:32 +0200
Message-Id: <20190912175132.411-7-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912175132.411-1-jernej.skrabec@siol.net>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H3 SoC contains deinterlace unit, which can be used in
combination with VPU unit to decode and process interlaced videos.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
.dtsi
index e37c30e811d3..7a59c57d2114 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -120,6 +120,19 @@
 	};
=20
 	soc {
+		deinterlace: deinterlace@1400000 {
+			compatible =3D "allwinner,sun8i-h3-deinterlace";
+			reg =3D <0x01400000 0x20000>;
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
 		syscon: system-control@1c00000 {
 			compatible =3D "allwinner,sun8i-h3-system-control";
 			reg =3D <0x01c00000 0x1000>;
--=20
2.23.0

