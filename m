Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120AB6A8320
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjCBNDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjCBNDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1AC18175
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F14F6615B3
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90237C433EF;
        Thu,  2 Mar 2023 13:03:40 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 08/17] media: common: saa7146: fix compliance problems with field handling
Date:   Thu,  2 Mar 2023 14:03:21 +0100
Message-Id: <20230302130330.1125172-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index a3b4fe303d03..89cba6b36372 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -282,7 +282,7 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv)
 	fmt->width = 384;
 	fmt->height = 288;
 	fmt->pixelformat = V4L2_PIX_FMT_BGR24;
-	fmt->field = V4L2_FIELD_ANY;
+	fmt->field = V4L2_FIELD_INTERLACED;
 	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	fmt->bytesperline = 3 * fmt->width;
 	fmt->sizeimage = fmt->bytesperline * fmt->height;
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index 290f388c2f28..592a4c6da103 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -386,20 +386,13 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_forma
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
@@ -439,6 +432,14 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
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
2.39.1

