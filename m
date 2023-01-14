Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6C366ACF6
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjANRSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjANRSJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E37B759
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CED28824;
        Sat, 14 Jan 2023 18:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716687;
        bh=EgO++I6XgP46oEJWKcDoxCLjjmLC6CDPjf43ve6eGbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I5l28eiBLHgIUY8YEg60jjzXOguOnKF2Hpi2iJX7w4ig0KYAS2DBeThfRojByG7Xj
         dIzP5JY+FJkCbnfYDxOyeR/N177+bAamyBAcGhSRJSEd0MrANpMmj8jmvNBf1v9iWG
         fSlORAbo9bV6G4Ii580184XotODJZ07H0KfLSdlU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 04/17] media: i2c: imx290: Access link_freq_index directly
Date:   Sat, 14 Jan 2023 19:17:49 +0200
Message-Id: <20230114171802.13878-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx290_get_link_freq_index() function hides the fact that it relies
on the imx290 current_mode field, which obfuscates the code instead of
making it more readable. Inline it in the callers, and use the mode
pointer we already have in imx290_ctrl_update() instead of using the
current_mode field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 991e7285c40c..4ad6eab4f2e2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -547,14 +547,9 @@ static int imx290_write_current_format(struct imx290 *imx290)
 	return 0;
 }
 
-static inline u8 imx290_get_link_freq_index(struct imx290 *imx290)
-{
-	return imx290->current_mode->link_freq_index;
-}
-
 static s64 imx290_get_link_freq(struct imx290 *imx290)
 {
-	u8 index = imx290_get_link_freq_index(imx290);
+	u8 index = imx290->current_mode->link_freq_index;
 
 	return *(imx290_link_freqs_ptr(imx290) + index);
 }
@@ -652,8 +647,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 	if (!imx290->ctrls.lock)
 		return;
 
-	__v4l2_ctrl_s_ctrl(imx290->link_freq,
-			   imx290_get_link_freq_index(imx290));
+	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
 				 imx290_calc_pixel_rate(imx290));
 
-- 
Regards,

Laurent Pinchart

