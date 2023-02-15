Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5666987D7
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjBOWaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjBOWaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702DF37B6D
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00CA7475;
        Wed, 15 Feb 2023 23:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500211;
        bh=oVV45dd9BKMhy6GwDg7AQeYiWJVyPrN0YqOB+M9cgss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bHiF56wOjjAW8xSE7rLSMV30cbz8b2OQ20HmRqEnGRwtNRI/wEzDujSQ2Iy3zZM3U
         nZAMEbZ4aaN4Fs4vaiIO0WGHd9fBFpiKY2YP+H1ZilUKWZF41C7TsMElY4wPU4V+Ri
         kag0YdQfFbn1CK/92ByouGwOIg32138Ih3wTsj7o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 03/15] media: i2c: imx290: Match kernel coding style on whitespace
Date:   Thu, 16 Feb 2023 00:29:51 +0200
Message-Id: <20230215223003.30170-4-laurent.pinchart@ideasonboard.com>
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

Fix up a couple of coding style issues regarding missing blank
lines after declarations, double blank lines, and incorrect
indentation.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index febb8aeb9252..a8acc785d995 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -106,7 +106,6 @@
 
 #define IMX290_VMAX_DEFAULT				1125
 
-
 /*
  * The IMX290 pixel array is organized as follows:
  *
@@ -350,6 +349,7 @@ static const s64 imx290_link_freq_2lanes[] = {
 	[FREQ_INDEX_1080P] = 445500000,
 	[FREQ_INDEX_720P] = 297000000,
 };
+
 static const s64 imx290_link_freq_4lanes[] = {
 	[FREQ_INDEX_1080P] = 222750000,
 	[FREQ_INDEX_720P] = 148500000,
@@ -485,7 +485,7 @@ static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *val
 			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
 	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
-			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
+			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
 		return ret;
 	}
@@ -506,7 +506,7 @@ static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
 			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
 	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
-			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
+			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
 		if (err)
 			*err = ret;
@@ -772,8 +772,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 
 	/* Set init register settings */
 	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
-					ARRAY_SIZE(
-						imx290_global_init_settings));
+					ARRAY_SIZE(imx290_global_init_settings));
 	if (ret < 0) {
 		dev_err(imx290->dev, "Could not set init registers\n");
 		return ret;
-- 
Regards,

Laurent Pinchart

