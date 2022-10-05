Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7345F5A61
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbiJETHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiJETHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:07:01 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF4478BE6
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:07:00 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C9DB2FF80C;
        Wed,  5 Oct 2022 19:06:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 09/10] media: ar0521: Rework startup sequence
Date:   Wed,  5 Oct 2022 21:06:12 +0200
Message-Id: <20221005190613.394277-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005190613.394277-1-jacopo@jmondi.org>
References: <20221005190613.394277-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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
---
 drivers/media/i2c/ar0521.c | 50 ++++++++++++--------------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index d46a51332964..670fa33acc6f 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -329,7 +329,7 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
 	return pll;
 }

-static void ar0521_calc_mode(struct ar0521_dev *sensor)
+static void ar0521_calc_pll(struct ar0521_dev *sensor)
 {
 	unsigned int pixel_clock;
 	unsigned int link_freq;
@@ -403,7 +403,7 @@ static void ar0521_calc_mode(struct ar0521_dev *sensor)
 	sensor->pll.mult = sensor->pll.mult2 = mult;
 }

-static int ar0521_write_mode(struct ar0521_dev *sensor)
+static int ar0521_pll_config(struct ar0521_dev *sensor)
 {
 	__be16 pll_regs[] = {
 		be(AR0521_REG_VT_PIX_CLK_DIV),
@@ -414,36 +414,9 @@ static int ar0521_write_mode(struct ar0521_dev *sensor)
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
@@ -455,8 +428,17 @@ static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
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

@@ -562,7 +544,7 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 	}

 	sensor->fmt = format->format;
-	ar0521_calc_mode(sensor);
+	ar0521_calc_pll(sensor);

 	/*
 	 * Update the exposure and blankings limits. Blankings are also reset
--
2.37.3

