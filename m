Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F90077C0DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 21:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbjHNTfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 15:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbjHNTeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 15:34:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7936A10DE
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 12:34:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02B01844;
        Mon, 14 Aug 2023 21:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692041599;
        bh=ip9z8Qvqq+eFgU5+3/LfMyPfjv0qBcHYY7hPc5oQZ5s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gUssDcLS4wx2yDoSXjEocZp26jij5ja34rup7OuRIG3+w/VZLPX4brP8VkmlBgNmR
         WS36EranhPUfMXJE2b4Wr+OlG6IXe+S0zhpI2vrN+ENOzXdDfVgw6vfaUmGn2NEmes
         ypF2Mz7LY2GJpQ/QWb9+aWS6PC1KqrkW/pbmD6zM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v1 1/2] media: i2c: imx219: Fix a typo referring to a wrong variable
Date:   Mon, 14 Aug 2023 22:34:34 +0300
Message-ID: <20230814193435.24158-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814193435.24158-1-laurent.pinchart@ideasonboard.com>
References: <20230814193435.24158-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx219_init_cfg() function has stopped operating on the try format
since commit 7e700847b1fe ("media: i2c: imx219: Switch from open to
init_cfg"), but a comment in the function wasn't updated. Fix it.

While at it, improve spelling in a second comment in the function.

Fixes: 7e700847b1fe ("media: i2c: imx219: Switch from open to init_cfg")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index a1136fdfbed2..6f88e002c8d8 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -691,12 +691,12 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	/* Initialize try_fmt */
+	/* Initialize the format. */
 	format = v4l2_subdev_get_pad_format(sd, state, 0);
 	imx219_update_pad_format(imx219, &supported_modes[0], format,
 				 MEDIA_BUS_FMT_SRGGB10_1X10);
 
-	/* Initialize crop rectangle. */
+	/* Initialize the crop rectangle. */
 	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
 	crop->top = IMX219_PIXEL_ARRAY_TOP;
 	crop->left = IMX219_PIXEL_ARRAY_LEFT;
-- 
Regards,

Laurent Pinchart

