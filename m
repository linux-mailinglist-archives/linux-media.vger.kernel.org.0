Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955E86987E0
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjBOWa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjBOWa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E181015545
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72E9E475;
        Wed, 15 Feb 2023 23:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500226;
        bh=1Sj5FGkpD0dJzXG8gmfzwpNUh6VexntWldyyqA8GCQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SHopY/OPT0tRW+IaV0mXGI8ABrFtbBiQs53AeskwnGrR7uWjo9+V2v6uxTJZSXY+v
         XObDvdrCXpe2s/59kwU0GVbeSenYWaGT4Nn5p+KvSNsF0IR/tQNtEFjmoC8AhbCW9s
         Trcvfo9meJsutuvIxwLE2mkft9fHwlGcdaEn4jKk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 11/15] media: i2c: imx290: VMAX is mode dependent
Date:   Thu, 16 Feb 2023 00:29:59 +0200
Message-Id: <20230215223003.30170-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The default VMAX for 60fps in 720p mode is 750 according to the
datasheet, however the driver always left it at 1125 thereby stopping
60fps being achieved.

Make VMAX (and therefore V4L2_CID_VBLANK) mode dependent so that 720p60
can be achieved.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 1ae01cd43efb..36d6fe12336d 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -110,8 +110,6 @@
 /* Number of lines by which exposure must be less than VMAX) */
 #define IMX290_EXPOSURE_OFFSET				2
 
-#define IMX290_VMAX_DEFAULT				1125
-
 #define IMX290_PIXEL_RATE				148500000
 
 /*
@@ -189,6 +187,7 @@ struct imx290_mode {
 	u32 width;
 	u32 height;
 	u32 hmax_min;
+	u32 vmax_min;
 	u8 link_freq_index;
 
 	const struct imx290_regval *data;
@@ -432,6 +431,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.width = 1920,
 		.height = 1080,
 		.hmax_min = 2200,
+		.vmax_min = 1125,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -440,6 +440,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.width = 1280,
 		.height = 720,
 		.hmax_min = 3300,
+		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -451,6 +452,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.width = 1920,
 		.height = 1080,
 		.hmax_min = 2200,
+		.vmax_min = 1125,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -459,6 +461,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.width = 1280,
 		.height = 720,
 		.hmax_min = 3300,
+		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -779,7 +782,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank_min = mode->hmax_min - mode->width;
 	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
-	unsigned int vblank_min = IMX290_VMAX_DEFAULT - mode->height;
+	unsigned int vblank_min = mode->vmax_min - mode->height;
 	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-- 
Regards,

Laurent Pinchart

