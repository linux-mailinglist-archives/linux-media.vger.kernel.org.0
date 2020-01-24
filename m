Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A831491CD
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387601AbgAXXUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:49 -0500
Received: from mailoutvs39.siol.net ([185.57.226.230]:37460 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387575AbgAXXUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 92DE55228EE;
        Sat, 25 Jan 2020 00:20:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id S5av63ohaILC; Sat, 25 Jan 2020 00:20:42 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 4C1965228E9;
        Sat, 25 Jan 2020 00:20:42 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id EAEED5228EE;
        Sat, 25 Jan 2020 00:20:39 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 7/8] ARM: dts: sun8i: a83t: Add device node for rotation core
Date:   Sat, 25 Jan 2020 00:20:13 +0100
Message-Id: <20200124232014.574989-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner A83T contains rotation core. Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
index 053d439b01a7..749d8e1e08cb 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -324,6 +324,17 @@ display_clocks: clock@1000000 {
 			#reset-cells =3D <1>;
 		};
=20
+		rotate: rotate@1020000 {
+			compatible =3D "allwinner,sun8i-a83t-de2-rotate";
+			reg =3D <0x1020000 0x10000>;
+			interrupts =3D <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&display_clocks CLK_BUS_ROT>,
+				 <&display_clocks CLK_ROT>;
+			clock-names =3D "bus",
+				      "mod";
+			resets =3D <&display_clocks RST_ROT>;
+		};
+
 		mixer0: mixer@1100000 {
 			compatible =3D "allwinner,sun8i-a83t-de2-mixer-0";
 			reg =3D <0x01100000 0x100000>;
--=20
2.25.0

