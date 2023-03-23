Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B456C6CA5
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbjCWPyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbjCWPyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3811911D
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:53:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E9144B821A0
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB7AC433D2;
        Thu, 23 Mar 2023 15:53:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 11/19] media: common: saa7146: fix compliance problems with field handling
Date:   Thu, 23 Mar 2023 16:53:35 +0100
Message-Id: <20230323155343.2399473-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
References: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initial field value of the format is ANY, which isn't allowed.
Change to INTERLACED.

VIDIOC_TRY_FMT will overwrite vv->last_field, which is an
unwanted side-effect, so drop this.

And finally vidioc_s_fmt_vid_cap didn't initialize vv->last_field
correctly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c  |  2 +-
 drivers/media/common/saa7146/saa7146_video.c | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 7bc7674e7d41..4107ee770b03 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -298,7 +298,7 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv)
 	fmt->width = 384;
 	fmt->height = 288;
 	fmt->pixelformat = V4L2_PIX_FMT_BGR24;
-	fmt->field = V4L2_FIELD_ANY;
+	fmt->field = V4L2_FIELD_INTERLACED;
 	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	fmt->bytesperline = 3 * fmt->width;
 	fmt->sizeimage = fmt->bytesperline * fmt->height;
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 83d4f61aac9a..5a472eb99368 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -381,20 +381,13 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
 	}
 	switch (field) {
 	case V4L2_FIELD_ALTERNATE:
-		vv->last_field = V4L2_FIELD_TOP;
-		maxh = maxh / 2;
-		break;
 	case V4L2_FIELD_TOP:
 	case V4L2_FIELD_BOTTOM:
-		vv->last_field = V4L2_FIELD_INTERLACED;
 		maxh = maxh / 2;
 		break;
-	case V4L2_FIELD_INTERLACED:
-		vv->last_field = V4L2_FIELD_INTERLACED;
-		break;
 	default:
-		DEB_D("no known field mode '%d'\n", field);
-		return -EINVAL;
+		field = V4L2_FIELD_INTERLACED;
+		break;
 	}
 
 	f->fmt.pix.field = field;
@@ -434,6 +427,14 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 	err = vidioc_try_fmt_vid_cap(file, fh, f);
 	if (0 != err)
 		return err;
+	switch (f->fmt.pix.field) {
+	case V4L2_FIELD_ALTERNATE:
+		vv->last_field = V4L2_FIELD_TOP;
+		break;
+	default:
+		vv->last_field = V4L2_FIELD_INTERLACED;
+		break;
+	}
 	vv->video_fmt = f->fmt.pix;
 	DEB_EE("set to pixelformat '%4.4s'\n",
 	       (char *)&vv->video_fmt.pixelformat);
-- 
2.39.2

