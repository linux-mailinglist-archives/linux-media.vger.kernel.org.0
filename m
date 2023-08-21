Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01AA7835CF
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjHUWav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjHUWau (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51135E4
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1624396B;
        Tue, 22 Aug 2023 00:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656945;
        bh=H8AtSEk0aRBGxZIPIdAkMiG8U+UAINzmSknpzWCG8BU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EC5pjOFQcJwMRFxWsdlXVgX3JyK23H4DOeSjpdSn3pNrXdZXEtgCNas2ZL/SmdyXq
         MJYXBoZMXZmLJbBJQ8L9Y0njolo6iYK0iYLhBPIfrFtLZamLipavcJZnl54l9So58w
         bgV8x4aJM5dHtPBX8JaCq0Df0HZTeHhNsNNGxw7A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 18/18] media: i2c: imx219: Move variables to inner scope
Date:   Tue, 22 Aug 2023 01:30:01 +0300
Message-ID: <20230821223001.28480-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
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

The exposure_max, exposure_def and hblank variables are only used in an
inner scope in the imx219_set_pad_format() function. Move them to that
scope to keep them closer to their usage and improve readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e2f0d3782e7c..69908ebed04a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -801,7 +801,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
-	int exposure_max, exposure_def, hblank;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	unsigned int bin;
@@ -830,6 +829,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		int exposure_max;
+		int exposure_def;
+		int hblank;
+
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
 					 IMX219_VTS_MAX - mode->height, 1,
-- 
Regards,

Laurent Pinchart

