Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C67E4DB9EB
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 22:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355589AbiCPVLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 17:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiCPVLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 17:11:04 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D67D65796;
        Wed, 16 Mar 2022 14:09:48 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9A74D20005;
        Wed, 16 Mar 2022 21:09:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: i2c: rdacm20: Fix format definition
Date:   Wed, 16 Mar 2022 22:09:16 +0100
Message-Id: <20220316210916.606929-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RDACM20 camera supports a single image format which is currently
listed as MEDIA_BUS_FMT_UYVY8_2X8. As the video stream is transmitted on
the GMSL serial bus, the 2X8 variant does not apply.

Fix the format byusing MEDIA_BUS_FMT_UYVY8_1X16.

This fixes a runtime error which is now triggered as the MAX9286
deserializer implements .link_validate().

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index ba956733aa89..6f23776ad214 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -47,11 +47,11 @@
 #define OV10635_VTS			933

 /*
- * As the drivers supports a single MEDIA_BUS_FMT_UYVY8_2X8 format we
+ * As the drivers supports a single MEDIA_BUS_FMT_UYVY8_1X16 format we
  * can harcode the pixel rate.
  *
  * PCLK is fed through the system clock, programmed @88MHz.
- * MEDIA_BUS_FMT_UYVY8_2X8 format = 2 samples per pixel.
+ * MEDIA_BUS_FMT_UYVY8_1X16 format = 2 samples per pixel.
  *
  * Pixelrate = PCLK / 2
  * FPS = (OV10635_VTS * OV10635_HTS) / PixelRate
@@ -409,7 +409,7 @@ static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad || code->index > 0)
 		return -EINVAL;

-	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	code->code = MEDIA_BUS_FMT_UYVY8_1X16;

 	return 0;
 }
@@ -425,7 +425,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,

 	mf->width		= OV10635_WIDTH;
 	mf->height		= OV10635_HEIGHT;
-	mf->code		= MEDIA_BUS_FMT_UYVY8_2X8;
+	mf->code		= MEDIA_BUS_FMT_UYVY8_1X16;
 	mf->colorspace		= V4L2_COLORSPACE_RAW;
 	mf->field		= V4L2_FIELD_NONE;
 	mf->ycbcr_enc		= V4L2_YCBCR_ENC_601;
--
2.35.1

