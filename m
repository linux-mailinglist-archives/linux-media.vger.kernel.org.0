Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBEE1491CC
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387609AbgAXXUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:49 -0500
Received: from mailoutvs60.siol.net ([185.57.226.251]:37475 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387594AbgAXXUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id ED3885228F3;
        Sat, 25 Jan 2020 00:20:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 7dL3LSThwaQe; Sat, 25 Jan 2020 00:20:44 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id A74745228F8;
        Sat, 25 Jan 2020 00:20:44 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 538075228F3;
        Sat, 25 Jan 2020 00:20:42 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 8/8] arm64: dts: allwinner: a64: add node for rotation core
Date:   Sat, 25 Jan 2020 00:20:14 +0100
Message-Id: <20200124232014.574989-9-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner A64 contains rotation core compatible to A83T.

Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
index baa6f08dc108..fd6ed305c14c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -274,6 +274,18 @@ display_clocks: clock@0 {
 				#reset-cells =3D <1>;
 			};
=20
+			rotate: rotate@20000 {
+				compatible =3D "allwinner,sun50i-a64-de2-rotate",
+					     "allwinner,sun8i-a83t-de2-rotate";
+				reg =3D <0x20000 0x10000>;
+				interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&display_clocks CLK_BUS_ROT>,
+					 <&display_clocks CLK_ROT>;
+				clock-names =3D "bus",
+					      "mod";
+				resets =3D <&display_clocks RST_ROT>;
+			};
+
 			mixer0: mixer@100000 {
 				compatible =3D "allwinner,sun50i-a64-de2-mixer-0";
 				reg =3D <0x100000 0x100000>;
--=20
2.25.0

