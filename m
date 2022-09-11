Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3C15B5028
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiIKRRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIKRRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF5E38A2
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GginiTe/J4X+Pnp6NKqkYADlHAmIUG1a11aLdK+lvm8=;
        b=aq0NYBOW/OWyiX19AVWaDLHUZr/JNZSb3o0LXpeXXiFsf6PFZJN78x0dkItljsQp3LW14q
        pRiOdGlp9S+u0wZr5/38OS5N56adGjRDPiA7kPkxytY/56i7b5gTP6cYhJvGDkx48Bj8YS
        32iHgPIULe8U21YPeuodpyyl71mSMpE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-_5KJNFapNg6o6iNFh7LPKw-1; Sun, 11 Sep 2022 13:16:59 -0400
X-MC-Unique: _5KJNFapNg6o6iNFh7LPKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6744B802E5D;
        Sun, 11 Sep 2022 17:16:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C81AC492C3B;
        Sun, 11 Sep 2022 17:16:57 +0000 (UTC)
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
Subject: [PATCH 01/17] media: atomisp: Use a normal mutex for the main lock
Date:   Sun, 11 Sep 2022 19:16:37 +0200
Message-Id: <20220911171653.568932-2-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no reason for atomisp to use a rt_mutex instead of a normal
mutex, so switch over to a normal mutex.

All the changes in this patch are just s/rt_mutex/mutex/.

This is a preparation patch for switching the ioctl locking over
to using the video_dev.lock member so that the v4l2-core takes
care of the locking.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  12 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  28 ++---
 .../media/atomisp/pci/atomisp_internal.h      |   2 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 106 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
 5 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 1c4748b7186e..97ef02e4e7a6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1446,10 +1446,10 @@ void atomisp_wdt_work(struct work_struct *work)
 	unsigned int pipe_wdt_cnt[MAX_STREAM_NUM][4] = { {0} };
 	bool css_recover = true;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (!atomisp_streaming_count(isp)) {
 		atomic_set(&isp->wdt_work_queued, 0);
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return;
 	}
 
@@ -1581,7 +1581,7 @@ void atomisp_wdt_work(struct work_struct *work)
 			isp->isp_fatal_error = true;
 			atomic_set(&isp->wdt_work_queued, 0);
 
-			rt_mutex_unlock(&isp->mutex);
+			mutex_unlock(&isp->mutex);
 			return;
 		}
 	}
@@ -1601,7 +1601,7 @@ void atomisp_wdt_work(struct work_struct *work)
 	dev_err(isp->dev, "timeout recovery handling done\n");
 	atomic_set(&isp->wdt_work_queued, 0);
 
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 }
 
 void atomisp_css_flush(struct atomisp_device *isp)
@@ -1861,7 +1861,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	 * For CSS2.0: we change the way to not dequeue all the event at one
 	 * time, instead, dequue one and process one, then another
 	 */
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (atomisp_css_isr_thread(isp, frame_done_found, css_pipe_done))
 		goto out;
 
@@ -1872,7 +1872,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 		atomisp_setup_flash(asd);
 	}
 out:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	dev_dbg(isp->dev, "<%s\n", __func__);
 
 	return IRQ_HANDLED;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index fa37defa5ecc..57587d739c4b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -711,7 +711,7 @@ static int atomisp_open(struct file *file)
 	if (ret)
 		return ret;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	asd->subdev.devnode = vdev;
 	/* Deferred firmware loading case. */
@@ -745,7 +745,7 @@ static int atomisp_open(struct file *file)
 	 */
 	if (pipe->users) {
 		dev_dbg(isp->dev, "video node already opened\n");
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return -EBUSY;
 	}
 
@@ -788,7 +788,7 @@ static int atomisp_open(struct file *file)
 
 done:
 	pipe->users++;
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	/* Ensure that a mode is set */
 	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
@@ -799,7 +799,7 @@ static int atomisp_open(struct file *file)
 	atomisp_css_uninit(isp);
 	pm_runtime_put(vdev->v4l2_dev->dev);
 error:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	v4l2_fh_release(file);
 	return ret;
 }
@@ -822,7 +822,7 @@ static int atomisp_release(struct file *file)
 		return -EBADF;
 
 	mutex_lock(&isp->streamoff_mutex);
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	dev_dbg(isp->dev, "release device %s\n", vdev->name);
 
@@ -905,7 +905,7 @@ static int atomisp_release(struct file *file)
 				     atomisp_subdev_source_pad(vdev),
 				     V4L2_SEL_TGT_COMPOSE, 0,
 				     &clear_compose);
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	mutex_unlock(&isp->streamoff_mutex);
 
 	return v4l2_fh_release(file);
@@ -1063,7 +1063,7 @@ static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & (VM_WRITE | VM_READ)))
 		return -EACCES;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	if (!(vma->vm_flags & VM_SHARED)) {
 		/* Map private buffer.
@@ -1074,7 +1074,7 @@ static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
 		 */
 		vma->vm_flags |= VM_SHARED;
 		ret = hmm_mmap(vma, vma->vm_pgoff << PAGE_SHIFT);
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return ret;
 	}
 
@@ -1117,7 +1117,7 @@ static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
 		}
 		raw_virt_addr->data_bytes = origin_size;
 		vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return 0;
 	}
 
@@ -1129,12 +1129,12 @@ static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
 		ret = -EINVAL;
 		goto error;
 	}
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return atomisp_videobuf_mmap_mapper(&pipe->capq, vma);
 
 error:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return ret;
 }
@@ -1146,12 +1146,12 @@ static __poll_t atomisp_poll(struct file *file,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (pipe->capq.streaming != 1) {
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return EPOLLERR;
 	}
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return videobuf_poll_stream(file, &pipe->capq, pt);
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index fc7bd877dae8..759575cbd356 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -238,7 +238,7 @@ struct atomisp_device {
 
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
-	struct rt_mutex mutex;
+	struct mutex mutex;
 	/*
 	 * Serialise streamoff: mutex is dropped during streamoff to
 	 * cancel the watchdog queue. MUST be acquired BEFORE
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index caeb38eadc48..4016ac4fffe0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -638,9 +638,9 @@ static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	*input = asd->input_curr;
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return 0;
 }
@@ -663,7 +663,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
 		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
 		ret = -EINVAL;
@@ -743,12 +743,12 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	asd->input_curr = input;
 	/* mark this camera is used by the current stream */
 	isp->inputs[input].asd = asd;
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return 0;
 
 error:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return ret;
 }
@@ -831,7 +831,7 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	rval = v4l2_subdev_call(camera, pad, enum_mbus_code, NULL, &code);
 	if (rval == -ENOIOCTLCMD) {
@@ -839,7 +839,7 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 			 "enum_mbus_code pad op not supported by %s. Please fix your sensor driver!\n",
 			 camera->name);
 	}
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	if (rval)
 		return rval;
@@ -952,9 +952,9 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	f->fmt.pix.width += pad_w;
 	f->fmt.pix.height += pad_h;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	if (ret)
 		return ret;
@@ -969,9 +969,9 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	pipe = atomisp_to_video_pipe(vdev);
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	f->fmt.pix = pipe->pix;
 
@@ -993,14 +993,14 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (isp->isp_fatal_error) {
 		ret = -EIO;
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return ret;
 	}
 	ret = atomisp_set_fmt(vdev, f);
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -1224,9 +1224,9 @@ int atomisp_reqbufs(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	ret = __atomisp_reqbufs(file, fh, req);
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return ret;
 }
@@ -1267,7 +1267,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (isp->isp_fatal_error) {
 		ret = -EIO;
 		goto error;
@@ -1366,10 +1366,10 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 
 	pipe->frame_params[buf->index] = NULL;
 
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	ret = videobuf_qbuf(&pipe->capq, buf);
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (ret)
 		goto error;
 
@@ -1409,7 +1409,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 			asd->pending_capture_request++;
 			dev_dbg(isp->dev, "Add one pending capture request.\n");
 	}
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	dev_dbg(isp->dev, "qbuf buffer %d (%s) for asd%d\n", buf->index,
 		vdev->name, asd->index);
@@ -1417,7 +1417,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	return ret;
 
 error:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -1455,21 +1455,21 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	if (isp->isp_fatal_error) {
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return -EIO;
 	}
 
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
 			__func__);
 		return -EIO;
 	}
 
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	ret = videobuf_dqbuf(&pipe->capq, buf, file->f_flags & O_NONBLOCK);
 	if (ret) {
@@ -1477,7 +1477,7 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 			dev_dbg(isp->dev, "<%s: %d\n", __func__, ret);
 		return ret;
 	}
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	buf->bytesused = pipe->pix.sizeimage;
 	buf->reserved = asd->frame_status[buf->index];
 
@@ -1491,7 +1491,7 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
 		buf->reserved |= __get_frame_exp_id(pipe, buf) << 16;
 	buf->reserved2 = pipe->frame_config_id[buf->index];
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	dev_dbg(isp->dev,
 		"dqbuf buffer %d (%s) for asd%d with exp_id %d, isp_config_id %d\n",
@@ -1720,7 +1720,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	if (isp->isp_fatal_error) {
 		ret = -EIO;
 		goto out;
@@ -1774,11 +1774,11 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 			if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED) {
 				flush_work(&asd->delayed_init_work);
-				rt_mutex_unlock(&isp->mutex);
+				mutex_unlock(&isp->mutex);
 				if (wait_for_completion_interruptible(
 					&asd->init_done) != 0)
 					return -ERESTARTSYS;
-				rt_mutex_lock(&isp->mutex);
+				mutex_lock(&isp->mutex);
 			}
 
 			/* handle per_frame_setting parameter and buffers */
@@ -1938,7 +1938,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	}
 out:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -2036,9 +2036,9 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	if (first_streamoff) {
 		/* if other streams are running, should not disable watch dog */
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		atomisp_wdt_stop(asd, true);
-		rt_mutex_lock(&isp->mutex);
+		mutex_lock(&isp->mutex);
 	}
 
 	spin_lock_irqsave(&isp->lock, flags);
@@ -2188,9 +2188,9 @@ static int atomisp_streamoff(struct file *file, void *fh,
 	int rval;
 
 	mutex_lock(&isp->streamoff_mutex);
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	rval = __atomisp_streamoff(file, fh, type);
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	mutex_unlock(&isp->streamoff_mutex);
 
 	return rval;
@@ -2225,7 +2225,7 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	switch (control->id) {
 	case V4L2_CID_IRIS_ABSOLUTE:
@@ -2248,7 +2248,7 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	case V4L2_CID_TEST_PATTERN_COLOR_GR:
 	case V4L2_CID_TEST_PATTERN_COLOR_GB:
 	case V4L2_CID_TEST_PATTERN_COLOR_B:
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->
 				   ctrl_handler, control);
 	case V4L2_CID_COLORFX:
@@ -2277,7 +2277,7 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 		break;
 	}
 
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -2310,7 +2310,7 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	switch (control->id) {
 	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
 	case V4L2_CID_EXPOSURE:
@@ -2331,7 +2331,7 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	case V4L2_CID_TEST_PATTERN_COLOR_GR:
 	case V4L2_CID_TEST_PATTERN_COLOR_GB:
 	case V4L2_CID_TEST_PATTERN_COLOR_B:
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		return v4l2_s_ctrl(NULL,
 				   isp->inputs[asd->input_curr].camera->
 				   ctrl_handler, control);
@@ -2363,7 +2363,7 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 		ret = -EINVAL;
 		break;
 	}
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -2488,9 +2488,9 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 						&ctrl);
 			break;
 		case V4L2_CID_ZOOM_ABSOLUTE:
-			rt_mutex_lock(&isp->mutex);
+			mutex_lock(&isp->mutex);
 			ret = atomisp_digital_zoom(asd, 0, &ctrl.value);
-			rt_mutex_unlock(&isp->mutex);
+			mutex_unlock(&isp->mutex);
 			break;
 		case V4L2_CID_G_SKIP_FRAMES:
 			ret = v4l2_subdev_call(
@@ -2603,7 +2603,7 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_FLASH_STROBE:
 		case V4L2_CID_FLASH_MODE:
 		case V4L2_CID_FLASH_STATUS_REGISTER:
-			rt_mutex_lock(&isp->mutex);
+			mutex_lock(&isp->mutex);
 			if (isp->flash) {
 				ret =
 				    v4l2_s_ctrl(NULL, isp->flash->ctrl_handler,
@@ -2618,12 +2618,12 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 					asd->params.num_flash_frames = 0;
 				}
 			}
-			rt_mutex_unlock(&isp->mutex);
+			mutex_unlock(&isp->mutex);
 			break;
 		case V4L2_CID_ZOOM_ABSOLUTE:
-			rt_mutex_lock(&isp->mutex);
+			mutex_lock(&isp->mutex);
 			ret = atomisp_digital_zoom(asd, 1, &ctrl.value);
-			rt_mutex_unlock(&isp->mutex);
+			mutex_unlock(&isp->mutex);
 			break;
 		default:
 			ctr = v4l2_ctrl_find(&asd->ctrl_handler, ctrl.id);
@@ -2691,9 +2691,9 @@ static int atomisp_g_parm(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 	parm->parm.capture.capturemode = asd->run_mode->val;
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return 0;
 }
@@ -2719,7 +2719,7 @@ static int atomisp_s_parm(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	rt_mutex_lock(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	asd->high_speed_mode = false;
 	switch (parm->parm.capture.capturemode) {
@@ -2761,7 +2761,7 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	rval = v4l2_ctrl_s_ctrl(asd->run_mode, mode);
 
 out:
-	rt_mutex_unlock(&isp->mutex);
+	mutex_unlock(&isp->mutex);
 
 	return rval == -ENOIOCTLCMD ? 0 : rval;
 }
@@ -2795,7 +2795,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		/* we do not need take isp->mutex for these IOCTLs */
 		break;
 	default:
-		rt_mutex_lock(&isp->mutex);
+		mutex_lock(&isp->mutex);
 		break;
 	}
 	switch (cmd) {
@@ -3057,7 +3057,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	case ATOMISP_IOC_G_UPDATE_EXPOSURE:
 		break;
 	default:
-		rt_mutex_unlock(&isp->mutex);
+		mutex_unlock(&isp->mutex);
 		break;
 	}
 	return err;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 4d73bf3d6421..aa38e0d33b5b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1514,7 +1514,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
 
-	rt_mutex_init(&isp->mutex);
+	mutex_init(&isp->mutex);
 	mutex_init(&isp->streamoff_mutex);
 	spin_lock_init(&isp->lock);
 
-- 
2.37.3

