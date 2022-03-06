Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132DC4CEB0F
	for <lists+linux-media@lfdr.de>; Sun,  6 Mar 2022 12:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiCFLaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Mar 2022 06:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiCFLaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Mar 2022 06:30:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767362B18D
        for <linux-media@vger.kernel.org>; Sun,  6 Mar 2022 03:29:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E4CE60B3B
        for <linux-media@vger.kernel.org>; Sun,  6 Mar 2022 11:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B44DC340EE;
        Sun,  6 Mar 2022 11:29:13 +0000 (UTC)
Message-ID: <51dc0870-8fd5-4705-7069-ab3229b34075@xs4all.nl>
Date:   Sun, 6 Mar 2022 12:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Martin Dauskardt <martin.dauskardt@gmx.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] ivtv: fix incorrect device_caps for ivtvfb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIDIOC_G_FBUF and related overlay ioctls no longer worked (-ENOTTY was
returned).

The root cause was the introduction of the caps field in ivtv-driver.h.
While loading the ivtvfb module would update the video_device device_caps
field with V4L2_CAP_VIDEO_OUTPUT_OVERLAY it would not update that caps field,
and that's what the overlay ioctls would look at.

It's a bad idea to keep information in two places, so drop the caps field and
only use vdev.device_caps.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Martin Dauskardt <martin.dauskardt@gmx.de>
Fixes: 2161536516ed (media: media/pci: set device_caps in struct video_device)
---
Martin, can you test this?

To be honest, using ivtvfb is rather flaky on my system; it seems to hang
frequently when I modprobe it.
---
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index 4cf92dee6527..ce3a7ca51736 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -330,7 +330,6 @@ struct ivtv_stream {
 	struct ivtv *itv;		/* for ease of use */
 	const char *name;		/* name of the stream */
 	int type;			/* stream type */
-	u32 caps;			/* V4L2 capabilities */
 
 	struct v4l2_fh *fh;		/* pointer to the streaming filehandle */
 	spinlock_t qlock;		/* locks access to the queues */
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 0cdf6b3210c2..fee460e2ca86 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -438,7 +438,7 @@ static int ivtv_g_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_f
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
 	struct v4l2_window *winfmt = &fmt->fmt.win;
 
-	if (!(s->caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
+	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -EINVAL;
 	if (!itv->osd_video_pbase)
 		return -EINVAL;
@@ -549,7 +549,7 @@ static int ivtv_try_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2
 	u32 chromakey = fmt->fmt.win.chromakey;
 	u8 global_alpha = fmt->fmt.win.global_alpha;
 
-	if (!(s->caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
+	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -EINVAL;
 	if (!itv->osd_video_pbase)
 		return -EINVAL;
@@ -1383,7 +1383,7 @@ static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
 		0,
 	};
 
-	if (!(s->caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
+	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -ENOTTY;
 	if (!itv->osd_video_pbase)
 		return -ENOTTY;
@@ -1450,7 +1450,7 @@ static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffe
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
 	struct yuv_playback_info *yi = &itv->yuv_info;
 
-	if (!(s->caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
+	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -ENOTTY;
 	if (!itv->osd_video_pbase)
 		return -ENOTTY;
@@ -1470,7 +1470,7 @@ static int ivtv_overlay(struct file *file, void *fh, unsigned int on)
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
 
-	if (!(s->caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
+	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -ENOTTY;
 	if (!itv->osd_video_pbase)
 		return -ENOTTY;
diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/ivtv-streams.c
index 6e455948cc77..13d7d55e6594 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -176,7 +176,7 @@ static void ivtv_stream_init(struct ivtv *itv, int type)
 	s->itv = itv;
 	s->type = type;
 	s->name = ivtv_stream_info[type].name;
-	s->caps = ivtv_stream_info[type].v4l2_caps;
+	s->vdev.device_caps = ivtv_stream_info[type].v4l2_caps;
 
 	if (ivtv_stream_info[type].pio)
 		s->dma = DMA_NONE;
@@ -299,12 +299,9 @@ static int ivtv_reg_dev(struct ivtv *itv, int type)
 		if (s_mpg->vdev.v4l2_dev)
 			num = s_mpg->vdev.num + ivtv_stream_info[type].num_offset;
 	}
-	s->vdev.device_caps = s->caps;
-	if (itv->osd_video_pbase) {
-		itv->streams[IVTV_DEC_STREAM_TYPE_YUV].vdev.device_caps |=
-			V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
-		itv->streams[IVTV_DEC_STREAM_TYPE_MPG].vdev.device_caps |=
-			V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+	if (itv->osd_video_pbase && (type == IVTV_DEC_STREAM_TYPE_YUV ||
+				     type == IVTV_DEC_STREAM_TYPE_MPG)) {
+		s->vdev.device_caps |= V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
 		itv->v4l2_cap |= V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
 	}
 	video_set_drvdata(&s->vdev, s);
