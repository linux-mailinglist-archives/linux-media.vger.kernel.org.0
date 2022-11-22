Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E2B634A20
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235182AbiKVWdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbiKVWdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450AD9DB94
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E218C1381;
        Tue, 22 Nov 2022 23:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156392;
        bh=Y5irZuHjx5jIN3WOBELk2dJRtr6NOEYHANCsY7ocVTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=otu/u8DhSGmBu1fl7ZMiN8smZWt/KWNbSAFRoTqd8mEe8792auGTQ0V3Vy8U2BO4l
         5zidTLE3kZJ02RPwMHlU/Pg0B9Ak7aVvMbwl6qDX8ecu+zXYYV/7mPEYk+b4rHOOcq
         3l3eUP8KtvsA6BtkhwVlJzkGShDXmTt2xKqqqWAc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 04/15] media: i2c: imx290: Access link_freq_index directly
Date:   Wed, 23 Nov 2022 00:32:39 +0200
Message-Id: <20221122223250.21233-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/i2c/imx290.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index eb295502d0c3..2d198b167853 100644
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
@@ -645,8 +640,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 	unsigned int hblank = mode->hmax - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
 
-	__v4l2_ctrl_s_ctrl(imx290->link_freq,
-			   imx290_get_link_freq_index(imx290));
+	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
 				 imx290_calc_pixel_rate(imx290));
 
-- 
Regards,

Laurent Pinchart

