Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488A878EF0D
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 15:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237768AbjHaN5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 09:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjHaN5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 09:57:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73DDCEB
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 06:57:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82B2C8C2;
        Thu, 31 Aug 2023 15:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693490174;
        bh=hcBONjIRWRZgrCHpUY4uSRK330UUahteqN2MT/ig22o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SYSLszBEbq7+CeJS1zwnwxjyzlaTLywSm0bZUxHTerXqzv46tj8ykTjGvqbLrmaWd
         oIHw11nPw+gn+Jg+PuUocuQZKSfDuHpqkw+IexWaANbGD9ks5DWenH8wvAR6Wgfl6j
         B3nItYOqxSdTGdToIYASQVeLnUROGZ0JG38iToRE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 1/3] media: i2c: imx219: Fix a typo referring to a wrong variable
Date:   Thu, 31 Aug 2023 16:57:45 +0300
Message-ID: <20230831135747.23148-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
References: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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

