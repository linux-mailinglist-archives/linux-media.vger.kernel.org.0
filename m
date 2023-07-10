Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545DA74DA80
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjGJPyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbjGJPxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:53:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCDCE6D
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 08:53:38 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9D6B11F0;
        Mon, 10 Jul 2023 17:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689004290;
        bh=b7ol/xusmVrFOOMVwRtYQIkmS3DA3YUXUXSw6whXG/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QI6foXuYoTJjXT4uqSMbfQxboudcAUMz896GGh6rZ1Fdylh5mQ1OubXSgLYlC2fLi
         HFFh9f3iK4x/VFPaThe4VzWUzfspNGasOonZl7zLA4fUCPibUMWxDMWWlJ1JsDJ/Xx
         Nx5aUudRSbx4T7obPK5bk1z7JD6sxnCBft9ZYiMQ=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 3/7] media: i2c: imx219: Complete default format initialization
Date:   Mon, 10 Jul 2023 17:51:59 +0200
Message-Id: <20230710155203.92366-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
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

Complete the default format initialization in init_cfg() filling in
the fields for the colorspace configuration copied from
imx219_set_default_format().

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 45b219321d98..cd43a897391c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -714,6 +714,12 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
 	format->code = imx219_get_format_code(imx219,
 					      MEDIA_BUS_FMT_SRGGB10_1X10);
 	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_SRGB;
+	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
+	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							     format->colorspace,
+							     format->ycbcr_enc);
+	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
 
 	/* Initialize crop rectangle. */
 	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
-- 
2.40.1

