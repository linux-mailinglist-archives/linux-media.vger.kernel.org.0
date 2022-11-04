Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E327E6199CB
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbiKDO2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbiKDO1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:35 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB3B31DC8
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:29 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D9A2E100011;
        Fri,  4 Nov 2022 14:25:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 09/10] media: ar0521: Rework startup sequence
Date:   Fri,  4 Nov 2022 15:24:52 +0100
Message-Id: <20221104142452.117135-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142452.117135-1-jacopo@jmondi.org>
References: <20221104142452.117135-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

Move geomerty configuration in the ar0521_set_stream() caller and rename
ar0521_write_mode() to ar0521_pll_config().

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ar0521.c | 50 ++++++++++++--------------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 323f583e2029..91fa4cba12f6 100644
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
2.38.1

