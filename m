Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE3660093B
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiJQIwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiJQIwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACFA49B4B
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XxsI1WbXoBlRASH0ZwDAhAdYaFHs9itLE6i6Dzb0M+4=;
        b=ILPR6ROzMdf4h3ceLqVVwQH9iarbHNbPTI5pY+Dkl6d51XUVu8jTJX1xbfXAAUeDH3Lwsy
        RsCizBLZFHqWjXuMTa9D+JhDZV7Jc5EUr8ZBZCQv76pG56AfHqdZTTh1YzzNfm1421nphV
        J42ouPPHSTdwhNPsGBhj9pN98GhAILo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-9xtURUv6MpqJWIa4EAhBTA-1; Mon, 17 Oct 2022 04:51:17 -0400
X-MC-Unique: 9xtURUv6MpqJWIa4EAhBTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13CBA3C30511;
        Mon, 17 Oct 2022 08:51:17 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A3E4210A58CE;
        Mon, 17 Oct 2022 08:51:14 +0000 (UTC)
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
Subject: [PATCH 06/17] media: atomisp: Also track buffers in a list when submitted to the ISP
Date:   Mon, 17 Oct 2022 10:50:46 +0200
Message-Id: <20221017085057.7483-7-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using an integer to keep count of how many buffers have
been handed over to the ISP (buffers_in_css) move buffers handed
over to the ISP to a new buffers_in_css list_head so that we can
easily loop over them.

This removes the need for atomisp_flush_video_pipe() to loop over
all buffers and then (ab)use the state to figure out if they
were handed over to the ISP.

Since the buffers are now always on a list when owned by the driver
this also allows the buffer_done path on flush vs normal completion
to be unified (both now need a list_del()) and this common code can
now be factored out into a new atomisp_buffer_done() helper.

This is a preparation patch for moving the driver over to
the videobuf2 framework.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 91 ++++++++++---------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 +
 .../staging/media/atomisp/pci/atomisp_fops.c  | 24 ++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  2 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  1 +
 .../media/atomisp/pci/atomisp_subdev.h        |  4 +-
 6 files changed, 72 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 0d3a4ff99730..5f0bebefcadd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -634,10 +634,6 @@ void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd)
 		memset(asd->metadata_bufs_in_css[i], 0,
 		       sizeof(asd->metadata_bufs_in_css[i]));
 	asd->dis_bufs_in_css = 0;
-	asd->video_out_capture.buffers_in_css = 0;
-	asd->video_out_vf.buffers_in_css = 0;
-	asd->video_out_preview.buffers_in_css = 0;
-	asd->video_out_video_capture.buffers_in_css = 0;
 }
 
 /* 0x100000 is the start of dmem inside SP */
@@ -683,40 +679,65 @@ static struct videobuf_buffer *atomisp_css_frame_to_vbuf(
 	return NULL;
 }
 
-static void atomisp_flush_video_pipe(struct atomisp_sub_device *asd,
-				     struct atomisp_video_pipe *pipe)
+int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
 {
 	unsigned long irqflags;
-	int i;
+	struct list_head *pos;
+	int buffers_in_css = 0;
 
-	if (!pipe->users)
-		return;
+	spin_lock_irqsave(&pipe->irq_lock, irqflags);
 
-	for (i = 0; pipe->capq.bufs[i]; i++) {
-		spin_lock_irqsave(&pipe->irq_lock, irqflags);
-		if (pipe->capq.bufs[i]->state == VIDEOBUF_ACTIVE ||
-		    pipe->capq.bufs[i]->state == VIDEOBUF_QUEUED) {
-			pipe->capq.bufs[i]->ts = ktime_get_ns();
-			pipe->capq.bufs[i]->field_count =
-			    atomic_read(&asd->sequence) << 1;
-			dev_dbg(asd->isp->dev, "release buffers on device %s\n",
-				pipe->vdev.name);
-			if (pipe->capq.bufs[i]->state == VIDEOBUF_QUEUED)
-				list_del_init(&pipe->capq.bufs[i]->queue);
-			pipe->capq.bufs[i]->state = VIDEOBUF_ERROR;
-			wake_up(&pipe->capq.bufs[i]->done);
-		}
-		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
+	list_for_each(pos, &pipe->buffers_in_css)
+		buffers_in_css++;
+
+	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
+
+	return buffers_in_css;
+}
+
+void atomisp_buffer_done(struct atomisp_video_pipe *pipe, struct videobuf_buffer *vb,
+			 int state)
+{
+	lockdep_assert_held(&pipe->irq_lock);
+
+	vb->ts = ktime_get_ns();
+	vb->field_count = atomic_read(&pipe->asd->sequence) << 1;
+	vb->state = state;
+	list_del(&vb->queue);
+	wake_up(&vb->done);
+}
+
+void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames)
+{
+	struct videobuf_buffer *_vb, *vb;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&pipe->irq_lock, irqflags);
+
+	list_for_each_entry_safe(vb, _vb, &pipe->buffers_in_css, queue) {
+		if (warn_on_css_frames)
+			dev_warn(pipe->isp->dev, "Warning: CSS frames queued on flush\n");
+		atomisp_buffer_done(pipe, vb, VIDEOBUF_ERROR);
+	}
+
+	list_for_each_entry_safe(vb, _vb, &pipe->activeq, queue)
+		atomisp_buffer_done(pipe, vb, VIDEOBUF_ERROR);
+
+	list_for_each_entry_safe(vb, _vb, &pipe->buffers_waiting_for_param, queue) {
+		pipe->frame_request_config_id[vb->i] = 0;
+		atomisp_buffer_done(pipe, vb, VIDEOBUF_ERROR);
 	}
+
+	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 }
 
 /* Returns queued buffers back to video-core */
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd)
 {
-	atomisp_flush_video_pipe(asd, &asd->video_out_capture);
-	atomisp_flush_video_pipe(asd, &asd->video_out_vf);
-	atomisp_flush_video_pipe(asd, &asd->video_out_preview);
-	atomisp_flush_video_pipe(asd, &asd->video_out_video_capture);
+	atomisp_flush_video_pipe(&asd->video_out_capture, false);
+	atomisp_flush_video_pipe(&asd->video_out_vf, false);
+	atomisp_flush_video_pipe(&asd->video_out_preview, false);
+	atomisp_flush_video_pipe(&asd->video_out_video_capture, false);
 }
 
 /* clean out the parameters that did not apply */
@@ -974,7 +995,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		break;
 	case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
-		pipe->buffers_in_css--;
 		frame = buffer.css_buffer.data.frame;
 		if (!frame) {
 			WARN_ON(1);
@@ -1026,7 +1046,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		break;
 	case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-		pipe->buffers_in_css--;
 		frame = buffer.css_buffer.data.frame;
 		if (!frame) {
 			WARN_ON(1);
@@ -1179,19 +1198,9 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		break;
 	}
 	if (vb) {
-		vb->ts = ktime_get_ns();
-		vb->field_count = atomic_read(&asd->sequence) << 1;
-		/*mark videobuffer done for dequeue*/
 		spin_lock_irqsave(&pipe->irq_lock, irqflags);
-		vb->state = !error ? VIDEOBUF_DONE : VIDEOBUF_ERROR;
+		atomisp_buffer_done(pipe, vb, error ? VIDEOBUF_ERROR : VIDEOBUF_DONE);
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
-
-		/*
-		 * Frame capture done, wake up any process block on
-		 * current active buffer
-		 * possibly hold by videobuf_dqbuf()
-		 */
-		wake_up(&vb->done);
 	}
 
 	/*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index fc1cfda718e1..1b46f4e60924 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -55,6 +55,10 @@ void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 struct camera_mipi_info *atomisp_to_sensor_mipi_info(struct v4l2_subdev *sd);
 struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev);
 int atomisp_reset(struct atomisp_device *isp);
+int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe);
+void atomisp_buffer_done(struct atomisp_video_pipe *pipe, struct videobuf_buffer *buf,
+			 int state);
+void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames);
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
 void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 3b833cd5b423..ac9aa8649635 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -217,7 +217,9 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	struct ia_css_dvs_grid_info *dvs_grid =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
 	unsigned long irqflags;
-	int err = 0;
+	int space, err = 0;
+
+	lockdep_assert_held(&asd->isp->mutex);
 
 	if (WARN_ON(css_pipe_id >= IA_CSS_PIPE_ID_NUM))
 		return -EINVAL;
@@ -225,20 +227,21 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 	if (pipe->stopping)
 		return -EINVAL;
 
-	while (pipe->buffers_in_css < ATOMISP_CSS_Q_DEPTH) {
+	space = ATOMISP_CSS_Q_DEPTH - atomisp_buffers_in_css(pipe);
+	while (space--) {
 		struct videobuf_buffer *vb;
 
 		spin_lock_irqsave(&pipe->irq_lock, irqflags);
-		if (list_empty(&pipe->activeq)) {
-			spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
-			return -EINVAL;
+		vb = list_first_entry_or_null(&pipe->activeq, struct videobuf_buffer, queue);
+		if (vb) {
+			list_move_tail(&vb->queue, &pipe->buffers_in_css);
+			vb->state = VIDEOBUF_ACTIVE;
 		}
-		vb = list_entry(pipe->activeq.next,
-				struct videobuf_buffer, queue);
-		list_del_init(&vb->queue);
-		vb->state = VIDEOBUF_ACTIVE;
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 
+		if (!vb)
+			return -EINVAL;
+
 		/*
 		 * If there is a per_frame setting to apply on the buffer,
 		 * do it before buffer en-queueing.
@@ -291,14 +294,13 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 						    css_buf_type, css_pipe_id);
 		if (err) {
 			spin_lock_irqsave(&pipe->irq_lock, irqflags);
-			list_add_tail(&vb->queue, &pipe->activeq);
+			list_move_tail(&vb->queue, &pipe->activeq);
 			vb->state = VIDEOBUF_QUEUED;
 			spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 			dev_err(asd->isp->dev, "%s, css q fails: %d\n",
 				__func__, err);
 			return -EINVAL;
 		}
-		pipe->buffers_in_css++;
 
 		/* enqueue 3A/DIS/metadata buffers */
 		if (asd->params.curr_grid_info.s3a_grid.enable &&
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bf5249b0d3bd..1fffe49cf578 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1764,7 +1764,7 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	mutex_unlock(&isp->mutex);
 	/* wait max 1 second */
 	ret = wait_event_interruptible_timeout(pipe->capq.wait,
-					       pipe->buffers_in_css == 0, HZ);
+					       atomisp_buffers_in_css(pipe) == 0, HZ);
 	mutex_lock(&isp->mutex);
 	pipe->stopping = false;
 	if (ret <= 0)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 847dfee6ad78..95dc4188309b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1064,6 +1064,7 @@ static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 	pipe->asd = asd;
 	pipe->isp = asd->isp;
 	spin_lock_init(&pipe->irq_lock);
+	INIT_LIST_HEAD(&pipe->buffers_in_css);
 	INIT_LIST_HEAD(&pipe->activeq);
 	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
 	INIT_LIST_HEAD(&pipe->per_frame_params);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 65c2f8664f9d..45b0c7341e84 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -70,6 +70,9 @@ struct atomisp_video_pipe {
 	enum v4l2_buf_type type;
 	struct media_pad pad;
 	struct videobuf_queue capq;
+	/* List of video-buffers handed over to the CSS  */
+	struct list_head buffers_in_css;
+	/* List of video-buffers handed over to the driver, but not yet to the CSS */
 	struct list_head activeq;
 	/*
 	 * the buffers waiting for per-frame parameters, this is only valid
@@ -83,7 +86,6 @@ struct atomisp_video_pipe {
 	unsigned int default_run_mode;
 	/* Set from streamoff to disallow queuing further buffers in CSS */
 	bool stopping;
-	unsigned int buffers_in_css;
 
 	/*
 	 * irq_lock is used to protect video buffer state change operations and
-- 
2.37.3

