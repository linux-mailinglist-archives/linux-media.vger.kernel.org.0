Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711C07016B5
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238913AbjEMMec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjEMMe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14123ABF
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n83pxfMtAJf1FaRa1rKpPJzcoRFl0xjO3YN6xTBRTmE=;
        b=UdUYEPDZd7WOrsW+/DUhsg+273O09JVHh1YOeDB62J+lPQ3mQkesQzOx6bwUeUa2feZCH6
        Y2AGY9Bl+gtqV4pdkrUpnMnsBjDx2QU6ffTkceuzJ99ZzC/5Sa8dgggLsEl7CSsZ2OyuMK
        a/EgFUYqy5V3+F0774M+r1ENbrDGSGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-yvi32WGkPWiMumBDFdxNjw-1; Sat, 13 May 2023 08:32:38 -0400
X-MC-Unique: yvi32WGkPWiMumBDFdxNjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4529101A54F;
        Sat, 13 May 2023 12:32:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D13440C2076;
        Sat, 13 May 2023 12:32:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 20/30] media: atomisp: Turn asd->streaming state tracker into a bool
Date:   Sat, 13 May 2023 14:31:49 +0200
Message-Id: <20230513123159.33234-21-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ATOMISP_DEVICE_STREAMING_STOPPING pipe state comes from when we still
had continuous mode. This would be set when streaming from both capture +
preview devnodes when 1 of the 2 streams has been stopped and the driver
was waiting for the other stream to get stopped too.

With continuous mode gone the stopping state is no longer necessary and
asd->streaming can be changed to a bool.

Note that atomisp_assert_recovery_work() would still temporarily
set streaming to stopping, but it does so with the isp->mutex held and
changes streaming to either enabled or disabled before releasing
the mutex, so none of the consumers which care about the difference
ever see the stopping state.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 21 +++++++------------
 .../media/atomisp/pci/atomisp_compat_css20.c  |  4 ++--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  2 +-
 .../media/atomisp/pci/atomisp_internal.h      |  4 ----
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  8 +++----
 .../media/atomisp/pci/atomisp_subdev.h        |  2 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  2 +-
 7 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index ea07ddcdd7f1..26a194251a76 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -475,7 +475,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 	if (!atomisp_streaming_count(isp))
 		goto out_nowake;
 
-	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
+	if (isp->asd.streaming) {
 		if (irq_infos & IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF) {
 			atomic_inc(&isp->asd.sof_count);
 			atomisp_sof_event(&isp->asd);
@@ -950,12 +950,11 @@ static void __atomisp_css_recover(struct atomisp_device *isp)
 
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
-	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED ||
-	    isp->asd.stream_prepared) {
+	if (isp->asd.streaming || isp->asd.stream_prepared) {
 		stream_restart = true;
 
 		spin_lock_irqsave(&isp->lock, flags);
-		isp->asd.streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
+		isp->asd.streaming = false;
 		spin_unlock_irqrestore(&isp->lock, flags);
 
 		/* stream off sensor */
@@ -971,10 +970,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp)
 		css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
 		atomisp_css_stop(&isp->asd, css_pipe_id, true);
 
-		spin_lock_irqsave(&isp->lock, flags);
-		isp->asd.streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
-		spin_unlock_irqrestore(&isp->lock, flags);
-
 		isp->asd.preview_exp_id = 1;
 		isp->asd.postview_exp_id = 1;
 		/* notify HAL the CSS reset */
@@ -1003,7 +998,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp)
 				 "start SP failed, so do not set streaming to be enable!\n");
 		} else {
 			spin_lock_irqsave(&isp->lock, flags);
-			isp->asd.streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
+			isp->asd.streaming = true;
 			spin_unlock_irqrestore(&isp->lock, flags);
 		}
 
@@ -1128,7 +1123,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	if (atomisp_css_isr_thread(isp))
 		goto out;
 
-	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED)
+	if (isp->asd.streaming)
 		atomisp_setup_flash(&isp->asd);
 out:
 	mutex_unlock(&isp->mutex);
@@ -3211,7 +3206,7 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 	 * CSS/FW requires set parameter and enqueue buffer happen after ISP
 	 * is streamon.
 	 */
-	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
+	if (!asd->streaming)
 		return;
 
 	if (list_empty(&pipe->per_frame_params) ||
@@ -4761,7 +4756,7 @@ static int __checking_exp_id(struct atomisp_sub_device *asd, int exp_id)
 		dev_warn(isp->dev, "%s Raw Buffer Lock is disable.\n", __func__);
 		return -EINVAL;
 	}
-	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED) {
+	if (!asd->streaming) {
 		dev_err(isp->dev, "%s streaming %d invalid exp_id %d.\n",
 			__func__, exp_id, asd->streaming);
 		return -EINVAL;
@@ -4883,7 +4878,7 @@ int atomisp_enable_dz_capt_pipe(struct atomisp_sub_device *asd,
 
 int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event)
 {
-	if (!event || asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
+	if (!event || !asd->streaming)
 		return -EINVAL;
 
 	lockdep_assert_held(&asd->isp->mutex);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 092262e1b7ec..cecdf111e14f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3081,7 +3081,7 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 		return -EINVAL;
 
 	/* isp needs to be streaming to get DIS statistics */
-	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
+	if (!asd->streaming)
 		return -EINVAL;
 
 	if (atomisp_compare_dvs_grid(asd, &stats->dvs2_stat.grid_info) != 0)
@@ -3210,7 +3210,7 @@ static bool atomisp_css_isr_get_stream_id(struct ia_css_pipe *css_pipe,
 	struct atomisp_stream_env *stream_env;
 	int i, j;
 
-	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_DISABLED)
+	if (!isp->asd.streaming)
 		return false;
 
 	for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index ef1a5ad30ace..c7da5bfd93ae 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -411,7 +411,7 @@ static void atomisp_buf_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 
 	/* TODO: do this better, not best way to queue to css */
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
+	if (asd->streaming) {
 		if (!list_empty(&pipe->buffers_waiting_for_param))
 			atomisp_handle_parameter_and_buffer(pipe);
 		else
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 3d4f0f632f44..feaf4037a389 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -168,10 +168,6 @@ struct atomisp_regs {
 	u32 csi_access_viol;
 };
 
-#define ATOMISP_DEVICE_STREAMING_DISABLED	0
-#define ATOMISP_DEVICE_STREAMING_ENABLED	1
-#define ATOMISP_DEVICE_STREAMING_STOPPING	2
-
 /*
  * ci device struct
  */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 08a3d98794df..020d4184375f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -601,7 +601,7 @@ static int atomisp_enum_input(struct file *file, void *fh,
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 {
-	return isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED;
+	return isp->asd.streaming;
 }
 
 /*
@@ -1163,7 +1163,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	spin_lock_irqsave(&isp->lock, irqflags);
-	asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
+	asd->streaming = true;
 	spin_unlock_irqrestore(&isp->lock, irqflags);
 	atomic_set(&asd->sof_count, -1);
 	atomic_set(&asd->sequence, -1);
@@ -1205,7 +1205,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret) {
 		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
 		spin_lock_irqsave(&isp->lock, irqflags);
-		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
+		asd->streaming = false;
 		spin_unlock_irqrestore(&isp->lock, irqflags);
 		ret = -EINVAL;
 		goto out_unlock;
@@ -1246,7 +1246,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
-	asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
+	asd->streaming = false;
 	spin_unlock_irqrestore(&isp->lock, flags);
 
 	atomisp_clear_css_buffer_counters(asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index a702890003f9..49177386d57f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -299,7 +299,7 @@ struct atomisp_sub_device {
 	 * Writers of streaming must hold both isp->mutex and isp->lock.
 	 * Readers of streaming need to hold only one of the two locks.
 	 */
-	unsigned int streaming;
+	bool streaming;
 	bool stream_prepared; /* whether css stream is created */
 
 	unsigned int latest_preview_exp_id; /* CSS ZSL/SDV raw buffer id */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f914ab9068c1..c68e9062743d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -672,7 +672,7 @@ static int atomisp_suspend(struct device *dev)
 		return -EBUSY;
 
 	spin_lock_irqsave(&isp->lock, flags);
-	if (isp->asd.streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
+	if (isp->asd.streaming) {
 		spin_unlock_irqrestore(&isp->lock, flags);
 		dev_err(isp->dev, "atomisp cannot suspend at this time.\n");
 		return -EINVAL;
-- 
2.40.1

