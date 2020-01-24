Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42AF71491D6
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387488AbgAXXUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:35 -0500
Received: from mailoutvs35.siol.net ([185.57.226.226]:37372 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387425AbgAXXUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:33 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id C2796522844;
        Sat, 25 Jan 2020 00:20:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id oCHcyPFtp5FI; Sat, 25 Jan 2020 00:20:30 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 5DDB8522899;
        Sat, 25 Jan 2020 00:20:30 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 03FC6522844;
        Sat, 25 Jan 2020 00:20:28 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 2/8] clk: sunxi-ng: sun8i-de2: Fix A83T clocks and reset
Date:   Sat, 25 Jan 2020 00:20:08 +0100
Message-Id: <20200124232014.574989-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A83T also contains rotation core, but related clocks and reset are
missing. Add them.

With that fixed, H3 and V3s capabilities no longer match (they don't
have rotation core), so create new struct for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 31 ++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
index 08074d935317..800659cf7347 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -50,6 +50,8 @@ static SUNXI_CCU_M(mixer1_div_a83_clk, "mixer1-div", "p=
ll-de", 0x0c, 4, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 		   CLK_SET_RATE_PARENT);
+static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
+		   CLK_SET_RATE_PARENT);
=20
 static struct ccu_common *sun50i_a64_de2_clks[] =3D {
 	&mixer0_clk.common,
@@ -81,6 +83,10 @@ static struct ccu_common *sun8i_a83t_de2_clks[] =3D {
 	&mixer0_div_a83_clk.common,
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
+
+	&bus_rot_clk.common,
+	&rot_clk.common,
+	&rot_div_a83_clk.common,
 };
=20
 static struct ccu_common *sun8i_h3_de2_clks[] =3D {
@@ -113,16 +119,19 @@ static struct clk_hw_onecell_data sun8i_a83t_de2_hw=
_clks =3D {
 		[CLK_MIXER0]		=3D &mixer0_clk.common.hw,
 		[CLK_MIXER1]		=3D &mixer1_clk.common.hw,
 		[CLK_WB]		=3D &wb_clk.common.hw,
+		[CLK_ROT]		=3D &rot_clk.common.hw,
=20
 		[CLK_BUS_MIXER0]	=3D &bus_mixer0_clk.common.hw,
 		[CLK_BUS_MIXER1]	=3D &bus_mixer1_clk.common.hw,
 		[CLK_BUS_WB]		=3D &bus_wb_clk.common.hw,
+		[CLK_BUS_ROT]		=3D &bus_rot_clk.common.hw,
=20
 		[CLK_MIXER0_DIV]	=3D &mixer0_div_a83_clk.common.hw,
 		[CLK_MIXER1_DIV]	=3D &mixer1_div_a83_clk.common.hw,
 		[CLK_WB_DIV]		=3D &wb_div_a83_clk.common.hw,
+		[CLK_ROT_DIV]		=3D &rot_div_a83_clk.common.hw,
 	},
-	.num	=3D CLK_NUMBER_WITHOUT_ROT,
+	.num	=3D CLK_NUMBER_WITH_ROT,
 };
=20
 static struct clk_hw_onecell_data sun8i_h3_de2_hw_clks =3D {
@@ -179,8 +188,18 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_=
clks =3D {
 static struct ccu_reset_map sun8i_a83t_de2_resets[] =3D {
 	[RST_MIXER0]	=3D { 0x08, BIT(0) },
 	/*
-	 * For A83T, H3 and R40, mixer1 reset line is shared with wb, so
+	 * A83T and R40 mixer1 reset line is shared with wb, so
 	 * only RST_WB is exported here.
+	 */
+	[RST_WB]	=3D { 0x08, BIT(2) },
+	[RST_ROT]	=3D { 0x08, BIT(3) },
+};
+
+static struct ccu_reset_map sun8i_h3_de2_resets[] =3D {
+	[RST_MIXER0]	=3D { 0x08, BIT(0) },
+	/*
+	 * H3 mixer1 reset line is shared with wb, so only RST_WB
+	 * is exported here.
 	 * For V3s there's just no mixer1, so it also shares this struct.
 	 */
 	[RST_WB]	=3D { 0x08, BIT(2) },
@@ -215,8 +234,8 @@ static const struct sunxi_ccu_desc sun8i_h3_de2_clk_d=
esc =3D {
=20
 	.hw_clks	=3D &sun8i_h3_de2_hw_clks,
=20
-	.resets		=3D sun8i_a83t_de2_resets,
-	.num_resets	=3D ARRAY_SIZE(sun8i_a83t_de2_resets),
+	.resets		=3D sun8i_h3_de2_resets,
+	.num_resets	=3D ARRAY_SIZE(sun8i_h3_de2_resets),
 };
=20
 static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc =3D {
@@ -245,8 +264,8 @@ static const struct sunxi_ccu_desc sun8i_v3s_de2_clk_=
desc =3D {
=20
 	.hw_clks	=3D &sun8i_v3s_de2_hw_clks,
=20
-	.resets		=3D sun8i_a83t_de2_resets,
-	.num_resets	=3D ARRAY_SIZE(sun8i_a83t_de2_resets),
+	.resets		=3D sun8i_h3_de2_resets,
+	.num_resets	=3D ARRAY_SIZE(sun8i_h3_de2_resets),
 };
=20
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
--=20
2.25.0

