Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBFBC6F7D9B
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 09:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEEHQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 03:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjEEHQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 03:16:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611557EF8
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 00:16:53 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F53B82F;
        Fri,  5 May 2023 09:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683271006;
        bh=cXusvt5AIJTLDcjoDyduzXVqzuJBFOlCyyG5n66V+R0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HTTX1JHqP8ViWQScbTkX7+TKudfnVmw3fY3/RzyhzZlHNEO1xx9mZ8jFRlShquu/D
         XwurSP6nkw5won3buNDBicDXfst72Ih/eb+KQuGKZyDoI7lDbgjJZ1yPpwkNY7omyi
         XXahdisTtLb+5iP7k9gxgfq4lUDUsLyfLuOhYWdY=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "Guoniu . zhou" <guoniu.zhou@nxp.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        mchehab@kernel.org
Subject: [PATCH 2/2] media: ov5640: Drop dead code using frame_interval
Date:   Fri,  5 May 2023 09:16:19 +0200
Message-Id: <20230505071619.63229-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5640_update_pixel_rate() function handles the parallel and MIPI
CSI-2 cases separately.

When running on a parallel setup the V4L2_CID_PIXEL_RATE value is
calculated at the beginning of the function using the values configured
with the frame_interval operations, and then the function immediately
returns.

The remaining of the function handles the MIPI CSI-2 configuration and
should not use the 'current_fr' and 'def_fps' fields as those are only
relevant for parallel mode.

Drop a small section of dead code that updates vblank using
frame_interval on a MIPI CSI-2 setup.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 9bba3b0f8981..fd3ea44a95e9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2926,19 +2926,6 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 				 hblank, hblank, 1, hblank);
 
 	vblank = timings->vblank_def;
-
-	if (sensor->current_fr != mode->def_fps) {
-		/*
-		 * Compute the vertical blanking according to the framerate
-		 * configured with s_frame_interval.
-		 */
-		int fie_num = sensor->frame_interval.numerator;
-		int fie_denom = sensor->frame_interval.denominator;
-
-		vblank = ((fie_num * pixel_rate / fie_denom) / timings->htot) -
-			mode->height;
-	}
-
 	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
 				 OV5640_MAX_VTS - mode->height, 1, vblank);
 	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
-- 
2.40.1

