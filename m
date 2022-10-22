Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B6608BF2
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiJVKut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiJVKu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:50:29 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1DC2D286A
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 03:07:31 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 06666CCAE8
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:52 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2279C240005;
        Sat, 22 Oct 2022 09:20:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 01/10] media: ar0521: Implement enum_frame_sizes
Date:   Sat, 22 Oct 2022 11:20:06 +0200
Message-Id: <20221022092015.208592-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022092015.208592-1-jacopo@jmondi.org>
References: <20221022092015.208592-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the enum_frame_size pad operation.

The sensor supports a continuous size range of resolutions.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ar0521.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index c6ab531532be..0daa61df2603 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -798,6 +798,24 @@ static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ar0521_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_SGRBG8_1X8)
+		return -EINVAL;
+
+	fse->min_width = AR0521_WIDTH_MIN;
+	fse->max_width = AR0521_WIDTH_MAX;
+	fse->min_height = AR0521_HEIGHT_MIN;
+	fse->max_height = AR0521_HEIGHT_MAX;
+
+	return 0;
+}
+
 static int ar0521_pre_streamon(struct v4l2_subdev *sd, u32 flags)
 {
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
@@ -864,6 +882,7 @@ static const struct v4l2_subdev_video_ops ar0521_video_ops = {
 
 static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
 	.enum_mbus_code = ar0521_enum_mbus_code,
+	.enum_frame_size = ar0521_enum_frame_size,
 	.get_fmt = ar0521_get_fmt,
 	.set_fmt = ar0521_set_fmt,
 };
-- 
2.37.3

