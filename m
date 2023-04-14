Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0C36E2212
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjDNL2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjDNL16 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:27:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2908986AF
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9239612F2
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93049C433EF;
        Fri, 14 Apr 2023 11:27:55 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 11/18] media: common: saa7146: fix compliance problems with field handling
Date:   Fri, 14 Apr 2023 13:27:35 +0200
Message-Id: <20230414112742.27749-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 1adfffc987b6..79214459387a 100644
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
index 5d580b5e61fe..8306860e9e8a 100644
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

