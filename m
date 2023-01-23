Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68124677BC6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbjAWMxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbjAWMxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4141027C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LZl5g5bTsbEcUO7RlARIfpvblLUPRXnsn+7DSKyKHqA=;
        b=R/Nj8JEPvUpBKU4+QnL7PIueT5KLos4rLs+hOjK3HwXKcrDWCKe2YU/EzUvroh6MWLVg1m
        HHlos+94fyLwSeMzMXG6QJxWELxCpwVXYwq6Z3ZlR6BKrcj21fAOy9zMtGTpXpiJWZRSZj
        oc3lMiqB1J704aqZk4xIDorVnBk6KJE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-igM7pXy2P-Om6fAICfQKCw-1; Mon, 23 Jan 2023 07:52:53 -0500
X-MC-Unique: igM7pXy2P-Om6fAICfQKCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6797D8030A0;
        Mon, 23 Jan 2023 12:52:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A386C15BAE;
        Mon, 23 Jan 2023 12:52:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 15/57] media: atomisp: Drop atomisp_init_pipe()
Date:   Mon, 23 Jan 2023 13:51:23 +0100
Message-Id: <20230123125205.622152-16-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_init_pipe() does 3 things:

1. Init a bunch of list-heads / locks
2. Init the vb_queue for the videodev (aka pipe)
3. zero the per-frame parameters related variables of the pipe

1. and 2. really should not be done at file-open time, but once at probe.
Currently the code is getting away with doing this on every videodev-open
because only 1 open is allowed at a time.

1. is already done at probe time by atomisp_init_subdev_pipe(), move 2. to
atomisp_init_subdev_pipe() so that it is also done once at probe.

As for 3. The per-frame parameters can only be set from a qbuf ioctl,
which can only happen after a reqbufs ioctl and atomisp_buf_cleanup
already zeros the per-frame parameters when the buffers are released,
so 3. is not necessary at all.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 40 +--------------
 .../staging/media/atomisp/pci/atomisp_fops.h  |  1 +
 .../media/atomisp/pci/atomisp_subdev.c        | 49 +++++++++++++++----
 3 files changed, 41 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 036ad339b344..7f4934ff9cab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -624,7 +624,7 @@ static void atomisp_buf_cleanup(struct vb2_buffer *vb)
 	hmm_free(frame->data);
 }
 
-static const struct vb2_ops atomisp_vb2_ops = {
+const struct vb2_ops atomisp_vb2_ops = {
 	.queue_setup		= atomisp_queue_setup,
 	.buf_init		= atomisp_buf_init,
 	.buf_cleanup		= atomisp_buf_cleanup,
@@ -633,40 +633,6 @@ static const struct vb2_ops atomisp_vb2_ops = {
 	.stop_streaming		= atomisp_stop_streaming,
 };
 
-static int atomisp_init_pipe(struct atomisp_video_pipe *pipe)
-{
-	int ret;
-
-	/* init locks */
-	spin_lock_init(&pipe->irq_lock);
-	mutex_init(&pipe->vb_queue_mutex);
-
-	/* Init videobuf2 queue structure */
-	pipe->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	pipe->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR;
-	pipe->vb_queue.buf_struct_size = sizeof(struct ia_css_frame);
-	pipe->vb_queue.ops = &atomisp_vb2_ops;
-	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
-	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	ret = vb2_queue_init(&pipe->vb_queue);
-	if (ret)
-		return ret;
-
-	pipe->vdev.queue = &pipe->vb_queue;
-	pipe->vdev.queue->lock = &pipe->vb_queue_mutex;
-
-	INIT_LIST_HEAD(&pipe->activeq);
-	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
-	INIT_LIST_HEAD(&pipe->per_frame_params);
-	memset(pipe->frame_request_config_id, 0,
-	       VIDEO_MAX_FRAME * sizeof(unsigned int));
-	memset(pipe->frame_params, 0,
-	       VIDEO_MAX_FRAME *
-	       sizeof(struct atomisp_css_params_with_list *));
-
-	return 0;
-}
-
 static void atomisp_dev_init_struct(struct atomisp_device *isp)
 {
 	unsigned int i;
@@ -773,10 +739,6 @@ static int atomisp_open(struct file *file)
 		return -EBUSY;
 	}
 
-	ret = atomisp_init_pipe(pipe);
-	if (ret)
-		goto error;
-
 	if (atomisp_dev_users(isp)) {
 		dev_dbg(isp->dev, "skip init isp in open\n");
 		goto init_subdev;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 2efc5245e571..883c1851c1c9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -31,6 +31,7 @@ unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
 
 int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd);
 
+extern const struct vb2_ops atomisp_vb2_ops;
 extern const struct v4l2_file_operations atomisp_fops;
 
 #endif /* __ATOMISP_FOPS_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index fc9e07bf63ae..c32db4ffb778 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -25,9 +25,11 @@
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
+#include <media/videobuf2-vmalloc.h>
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
 #include "atomisp_compat.h"
+#include "atomisp_fops.h"
 #include "atomisp_internal.h"
 
 const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
@@ -1023,14 +1025,31 @@ static const struct v4l2_ctrl_config ctrl_depth_mode = {
 	.def = 0,
 };
 
-static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
-				     struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
+static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
+				    struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
 {
+	int ret;
+
 	pipe->type = buf_type;
 	pipe->asd = asd;
 	pipe->isp = asd->isp;
 	spin_lock_init(&pipe->irq_lock);
 	mutex_init(&pipe->vb_queue_mutex);
+
+	/* Init videobuf2 queue structure */
+	pipe->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	pipe->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR;
+	pipe->vb_queue.buf_struct_size = sizeof(struct ia_css_frame);
+	pipe->vb_queue.ops = &atomisp_vb2_ops;
+	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
+	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	ret = vb2_queue_init(&pipe->vb_queue);
+	if (ret)
+		return ret;
+
+	pipe->vdev.queue = &pipe->vb_queue;
+	pipe->vdev.queue->lock = &pipe->vb_queue_mutex;
+
 	INIT_LIST_HEAD(&pipe->buffers_in_css);
 	INIT_LIST_HEAD(&pipe->activeq);
 	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
@@ -1040,6 +1059,8 @@ static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 	memset(pipe->frame_params,
 	       0, VIDEO_MAX_FRAME *
 	       sizeof(struct atomisp_css_params_with_list *));
+
+	return 0;
 }
 
 /*
@@ -1085,17 +1106,25 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret < 0)
 		return ret;
 
-	atomisp_init_subdev_pipe(asd, &asd->video_out_preview,
-				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_preview,
+				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (ret)
+		return ret;
 
-	atomisp_init_subdev_pipe(asd, &asd->video_out_vf,
-				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_vf,
+				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (ret)
+		return ret;
 
-	atomisp_init_subdev_pipe(asd, &asd->video_out_capture,
-				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_capture,
+				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (ret)
+		return ret;
 
-	atomisp_init_subdev_pipe(asd, &asd->video_out_video_capture,
-				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_video_capture,
+				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (ret)
+		return ret;
 
 	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE",
 				 ATOMISP_RUN_MODE_STILL_CAPTURE);
-- 
2.39.0

