Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10224608B53
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiJVKNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiJVKNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:13:22 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1515B2D4534
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 02:30:52 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 760E9C906B
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:24 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D782E240010;
        Sat, 22 Oct 2022 09:20:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 09/10] media: ar0521: Rework startup sequence
Date:   Sat, 22 Oct 2022 11:20:14 +0200
Message-Id: <20221022092015.208592-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022092015.208592-1-jacopo@jmondi.org>
References: <20221022092015.208592-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ar0521_write_mode() function explicitly programs the exposure time
register and the test pattern register, which are now setup by the call
to __v4l2_ctrl_handler_setup() in ar0521_set_stream().

Removing those register writes from ar0521_write_mode() reduces the
function to two operations: geometry configuration and pll
configuration.

Move those operations in the ar0521_set_stream() caller and remove
ar0521_write_mode(). However maintain the ar0521_calc_pll() function
separated as it is used during pad format configuration to update the
PIXEL_RATE control value.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ar0521.c | 50 ++++++++++++--------------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index cf2d2746657e..5560dc3d6605 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -278,7 +278,7 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
 	return pll;
 }
 
-static void ar0521_calc_mode(struct ar0521_dev *sensor)
+static void ar0521_calc_pll(struct ar0521_dev *sensor)
 {
 	unsigned int pixel_clock;
 	u16 pre, mult;
@@ -342,7 +342,7 @@ static void ar0521_calc_mode(struct ar0521_dev *sensor)
 	sensor->pll.mult = sensor->pll.mult2 = mult;
 }
 
-static int ar0521_write_mode(struct ar0521_dev *sensor)
+static int ar0521_pll_config(struct ar0521_dev *sensor)
 {
 	__be16 pll_regs[] = {
 		be(AR0521_REG_VT_PIX_CLK_DIV),
@@ -353,36 +353,9 @@ static int ar0521_write_mode(struct ar0521_dev *sensor)
 		/* 0x308 */ be(sensor->pll.vt_pix * 2), /* op_pix_clk_div = 2 * vt_pix_clk_div */
 		/* 0x30A */ be(1)  /* op_sys_clk_div */
 	};
-	int ret;
-
-	/* Stop streaming for just a moment */
-	ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
-			       AR0521_REG_RESET_DEFAULTS);
-	if (ret)
-		return ret;
-
-	ret = ar0521_set_geometry(sensor);
-	if (ret)
-		return ret;
-
-	ret = ar0521_write_regs(sensor, pll_regs, ARRAY_SIZE(pll_regs));
-	if (ret)
-		return ret;
-
-	ret = ar0521_write_reg(sensor, AR0521_REG_COARSE_INTEGRATION_TIME,
-			       sensor->ctrls.exposure->val);
-	if (ret)
-		return ret;
-
-	ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
-			       AR0521_REG_RESET_DEFAULTS |
-			       AR0521_REG_RESET_STREAM);
-	if (ret)
-		return ret;
 
-	ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
-			       sensor->ctrls.test_pattern->val);
-	return ret;
+	ar0521_calc_pll(sensor);
+	return ar0521_write_regs(sensor, pll_regs, ARRAY_SIZE(pll_regs));
 }
 
 static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
@@ -394,8 +367,17 @@ static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
 		if (ret < 0)
 			return ret;
 
-		ar0521_calc_mode(sensor);
-		ret = ar0521_write_mode(sensor);
+		/* Stop streaming for just a moment */
+		ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
+				       AR0521_REG_RESET_DEFAULTS);
+		if (ret)
+			return ret;
+
+		ret = ar0521_set_geometry(sensor);
+		if (ret)
+			return ret;
+
+		ret = ar0521_pll_config(sensor);
 		if (ret)
 			goto err;
 
@@ -501,7 +483,7 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	sensor->fmt = format->format;
-	ar0521_calc_mode(sensor);
+	ar0521_calc_pll(sensor);
 
 	/*
 	 * Update the exposure and blankings limits. Blankings are also reset
-- 
2.37.3

