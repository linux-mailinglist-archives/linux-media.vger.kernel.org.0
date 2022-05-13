Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70485263BA
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352583AbiEMORH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353032AbiEMOQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:59 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A1B1207CC
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:47 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 3173E20018;
        Fri, 13 May 2022 14:16:46 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 18/28] media: ov5640: Remove frame rate check from find_mode()
Date:   Fri, 13 May 2022 16:14:06 +0200
Message-Id: <20220513141416.120552-19-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current implementation of ov5640_find_mode() fails if the
frame rate programmed with s_frame_interval doesn't match the
maximum frame rate for the current mode.

This causes issues when moving from one mode with higher FPS to another
one which only supports a lower FPS range with tools like media-ctl.

It also forces users that do not use s_frame_interval(), but rather
configure blankings explicitly, to adjust the programmed FPS range to
avoid failures.

For this reason, remove the FPS check from ov5640_find_mode() and only
perform it at s_frame_interval() time.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5e0014df136f..a17fcb39410d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1995,8 +1995,7 @@ static int ov5640_set_virtual_channel(struct ov5640_dev *sensor)
 }
 
 static const struct ov5640_mode_info *
-ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
-		 int width, int height, bool nearest)
+ov5640_find_mode(struct ov5640_dev *sensor, int width, int height, bool nearest)
 {
 	const struct ov5640_mode_info *mode;
 
@@ -2009,10 +2008,6 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	     (mode->width != width || mode->height != height)))
 		return NULL;
 
-	/* Check to see if the current mode exceeds the max frame rate */
-	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
-		return NULL;
-
 	return mode;
 }
 
@@ -2649,7 +2644,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 	fi->denominator = best_fps;
 
 find_mode:
-	mode = ov5640_find_mode(sensor, rate, width, height, false);
+	mode = ov5640_find_mode(sensor, width, height, false);
 	return mode ? rate : -EINVAL;
 }
 
@@ -2687,7 +2682,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int i;
 
-	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
+	mode = ov5640_find_mode(sensor, fmt->width, fmt->height, true);
 	if (!mode)
 		return -EINVAL;
 	fmt->width = mode->width;
@@ -3481,13 +3476,17 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	mode = ov5640_find_mode(sensor, frame_rate, mode->width,
-				mode->height, true);
+	mode = ov5640_find_mode(sensor, mode->width, mode->height, true);
 	if (!mode) {
 		ret = -EINVAL;
 		goto out;
 	}
 
+	if (ov5640_framerates[frame_rate] > ov5640_framerates[mode->max_fps]) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (mode != sensor->current_mode ||
 	    frame_rate != sensor->current_fr) {
 		sensor->current_fr = frame_rate;
-- 
2.35.1

