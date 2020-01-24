Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AA61491C1
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387447AbgAXXUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:32 -0500
Received: from mailoutvs13.siol.net ([185.57.226.204]:37349 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729236AbgAXXUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 5935D5227DE;
        Sat, 25 Jan 2020 00:20:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id lnLDxxhC6oQY; Sat, 25 Jan 2020 00:20:28 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id F22115227E3;
        Sat, 25 Jan 2020 00:20:27 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 4C65F522806;
        Sat, 25 Jan 2020 00:20:25 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 1/8] clk: sunxi-ng: sun8i-de2: Swap A64 and H6 definitions
Date:   Sat, 25 Jan 2020 00:20:07 +0100
Message-Id: <20200124232014.574989-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For some reason, A64 and H6 have swapped clocks and resets definitions.
H6 doesn't have rotation unit while A64 has. Swap around to correct the
issue.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
index d9668493c3f9..08074d935317 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -51,7 +51,7 @@ static SUNXI_CCU_M(mixer1_div_a83_clk, "mixer1-div", "p=
ll-de", 0x0c, 4, 4,
 static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 		   CLK_SET_RATE_PARENT);
=20
-static struct ccu_common *sun50i_h6_de3_clks[] =3D {
+static struct ccu_common *sun50i_a64_de2_clks[] =3D {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
 	&wb_clk.common,
@@ -156,7 +156,7 @@ static struct clk_hw_onecell_data sun8i_v3s_de2_hw_cl=
ks =3D {
 	.num	=3D CLK_NUMBER_WITHOUT_ROT,
 };
=20
-static struct clk_hw_onecell_data sun50i_h6_de3_hw_clks =3D {
+static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks =3D {
 	.hws	=3D {
 		[CLK_MIXER0]		=3D &mixer0_clk.common.hw,
 		[CLK_MIXER1]		=3D &mixer1_clk.common.hw,
@@ -190,13 +190,13 @@ static struct ccu_reset_map sun50i_a64_de2_resets[]=
 =3D {
 	[RST_MIXER0]	=3D { 0x08, BIT(0) },
 	[RST_MIXER1]	=3D { 0x08, BIT(1) },
 	[RST_WB]	=3D { 0x08, BIT(2) },
+	[RST_ROT]	=3D { 0x08, BIT(3) },
 };
=20
 static struct ccu_reset_map sun50i_h6_de3_resets[] =3D {
 	[RST_MIXER0]	=3D { 0x08, BIT(0) },
 	[RST_MIXER1]	=3D { 0x08, BIT(1) },
 	[RST_WB]	=3D { 0x08, BIT(2) },
-	[RST_ROT]	=3D { 0x08, BIT(3) },
 };
=20
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc =3D {
@@ -220,20 +220,20 @@ static const struct sunxi_ccu_desc sun8i_h3_de2_clk=
_desc =3D {
 };
=20
 static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc =3D {
-	.ccu_clks	=3D sun8i_h3_de2_clks,
-	.num_ccu_clks	=3D ARRAY_SIZE(sun8i_h3_de2_clks),
+	.ccu_clks	=3D sun50i_a64_de2_clks,
+	.num_ccu_clks	=3D ARRAY_SIZE(sun50i_a64_de2_clks),
=20
-	.hw_clks	=3D &sun8i_h3_de2_hw_clks,
+	.hw_clks	=3D &sun50i_a64_de2_hw_clks,
=20
 	.resets		=3D sun50i_a64_de2_resets,
 	.num_resets	=3D ARRAY_SIZE(sun50i_a64_de2_resets),
 };
=20
 static const struct sunxi_ccu_desc sun50i_h6_de3_clk_desc =3D {
-	.ccu_clks	=3D sun50i_h6_de3_clks,
-	.num_ccu_clks	=3D ARRAY_SIZE(sun50i_h6_de3_clks),
+	.ccu_clks	=3D sun8i_h3_de2_clks,
+	.num_ccu_clks	=3D ARRAY_SIZE(sun8i_h3_de2_clks),
=20
-	.hw_clks	=3D &sun50i_h6_de3_hw_clks,
+	.hw_clks	=3D &sun8i_h3_de2_hw_clks,
=20
 	.resets		=3D sun50i_h6_de3_resets,
 	.num_resets	=3D ARRAY_SIZE(sun50i_h6_de3_resets),
--=20
2.25.0

