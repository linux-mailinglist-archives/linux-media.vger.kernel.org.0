Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEE266C2E6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbjAPO4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbjAPOz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:55:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CD326840
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DE02D82;
        Mon, 16 Jan 2023 15:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880299;
        bh=EgO++I6XgP46oEJWKcDoxCLjjmLC6CDPjf43ve6eGbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n18kaS95iuRNpgVW+RcoIFpOeCqytjd4ON5mUFpCfIYO3Cc0gDXtgr4KHzwsM7zzS
         I69x5nKSLqfVb5iCsf3ixEtxYa7iDWtDxSb0U7pVh0M3qMiUIidjAesIrJnTNcVb35
         /+T0dmHKgpKg7kG2dNFjGxPxIYs9D8XaTJpIUVQo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 04/17] media: i2c: imx290: Access link_freq_index directly
Date:   Mon, 16 Jan 2023 16:44:41 +0200
Message-Id: <20230116144454.1012-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
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

