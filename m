Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44B01491C4
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387541AbgAXXUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:38 -0500
Received: from mailoutvs4.siol.net ([185.57.226.195]:37390 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387406AbgAXXUg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:36 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 1F03C5228C9;
        Sat, 25 Jan 2020 00:20:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FVVhKHJUZiki; Sat, 25 Jan 2020 00:20:32 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id BB642522899;
        Sat, 25 Jan 2020 00:20:32 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 634BE5228C9;
        Sat, 25 Jan 2020 00:20:30 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 3/8] ARM: dts: sunxi: Fix DE2 clocks register range
Date:   Sat, 25 Jan 2020 00:20:09 +0100
Message-Id: <20200124232014.574989-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As it can be seen from DE2 manual, clock range is 0x10000.

Fix it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi  | 2 +-
 arch/arm/boot/dts/sun8i-r40.dtsi   | 2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi   | 2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
index 74ac7ee9383c..053d439b01a7 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -314,7 +314,7 @@ soc {
=20
 		display_clocks: clock@1000000 {
 			compatible =3D "allwinner,sun8i-a83t-de2-clk";
-			reg =3D <0x01000000 0x100000>;
+			reg =3D <0x01000000 0x10000>;
 			clocks =3D <&ccu CLK_BUS_DE>,
 				 <&ccu CLK_PLL_DE>;
 			clock-names =3D "bus",
diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
index 8f09a24b36ec..a9d037667a83 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -119,7 +119,7 @@ soc {
 		display_clocks: clock@1000000 {
 			compatible =3D "allwinner,sun8i-r40-de2-clk",
 				     "allwinner,sun8i-h3-de2-clk";
-			reg =3D <0x01000000 0x100000>;
+			reg =3D <0x01000000 0x10000>;
 			clocks =3D <&ccu CLK_BUS_DE>,
 				 <&ccu CLK_DE>;
 			clock-names =3D "bus",
diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v=
3s.dtsi
index 81ea50838cd5..e5312869c0d2 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -105,7 +105,7 @@ soc {
=20
 		display_clocks: clock@1000000 {
 			compatible =3D "allwinner,sun8i-v3s-de2-clk";
-			reg =3D <0x01000000 0x100000>;
+			reg =3D <0x01000000 0x10000>;
 			clocks =3D <&ccu CLK_BUS_DE>,
 				 <&ccu CLK_DE>;
 			clock-names =3D "bus",
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi=
-h3-h5.dtsi
index 5e9c3060aa08..799f32bafd80 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -114,7 +114,7 @@ soc {
=20
 		display_clocks: clock@1000000 {
 			/* compatible is in per SoC .dtsi file */
-			reg =3D <0x01000000 0x100000>;
+			reg =3D <0x01000000 0x10000>;
 			clocks =3D <&ccu CLK_BUS_DE>,
 				 <&ccu CLK_DE>;
 			clock-names =3D "bus",
--=20
2.25.0

