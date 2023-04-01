Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949716D31CD
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjDAPBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjDAPBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609901F7B3
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tnzq3ByZM8vpu/jU4oQkw1x+J20uCLPHFfVgqaU1Fsc=;
        b=V1n8X6CBogxHRFtsnhMAOk6Nf9jhHM3HnlZrnHN7JE1cljPzuK5ehOesNx8yzo4DljHe1p
        OAI62Hd3QpgROrRT7nkdQul9EpyrHJmDvprOTlx/TrLbjb5ukP/hkGGKNbGpVzltyWVgdt
        5WSK8W6RihIrPz5s452CREAM2eqy3X0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-nyPR3IUWOLSbuXzFKT2p_Q-1; Sat, 01 Apr 2023 11:00:25 -0400
X-MC-Unique: nyPR3IUWOLSbuXzFKT2p_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85FA785A5A3;
        Sat,  1 Apr 2023 15:00:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF3E400F59;
        Sat,  1 Apr 2023 15:00:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 25/28] media: atomisp: Drop support for streaming from 2 sensors at once
Date:   Sat,  1 Apr 2023 16:59:23 +0200
Message-Id: <20230401145926.596216-26-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With support for depth mode gone there really is no need to support
streaming from 2 sensors at once. As discussed and acked on the list
(see Link tag) it is desirable to drop support for this since it
involves quite a lot of special handling / hacks in the code.

This initial commit limits itself to a minimum set of changes to switch
to 1 struct atomisp_sub_device / 1 stream. Further commits will actually
remove / cleanup much of the special handling.

Likewise this initial commit also deliberately skips the opportunity to
turn some multi-line statements into single-line statements, so as to
keep the diff small / easier to review.

Link: https://lore.kernel.org/linux-media/5309d845-063b-6dd9-529d-0f82654290f2@redhat.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 162 +++++-------------
 .../media/atomisp/pci/atomisp_compat.h        |   4 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |  89 ++++------
 .../staging/media/atomisp/pci/atomisp_fops.c  |   7 +-
 .../media/atomisp/pci/atomisp_internal.h      |  17 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  41 ++---
 .../media/atomisp/pci/atomisp_subdev.c        |  97 ++++-------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  36 ++--
 8 files changed, 148 insertions(+), 305 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b5d094417fc5..d0386dcb24ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -196,8 +196,6 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 			 enum atomisp_dfs_mode mode,
 			 bool force)
 {
-	/* FIXME! Only use subdev[0] status yet */
-	struct atomisp_sub_device *asd = &isp->asd[0];
 	const struct atomisp_dfs_config *dfs;
 	unsigned int new_freq;
 	struct atomisp_freq_scaling_rule curr_rules;
@@ -223,7 +221,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 		goto done;
 	}
 
-	fps = atomisp_get_sensor_fps(asd);
+	fps = atomisp_get_sensor_fps(&isp->asd);
 	if (fps == 0) {
 		dev_info(isp->dev,
 			 "Sensor didn't report FPS. Using DFS max mode.\n");
@@ -231,10 +229,10 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 		goto done;
 	}
 
-	curr_rules.width = asd->fmt[asd->capture_pad].fmt.width;
-	curr_rules.height = asd->fmt[asd->capture_pad].fmt.height;
+	curr_rules.width = isp->asd.fmt[isp->asd.capture_pad].fmt.width;
+	curr_rules.height = isp->asd.fmt[isp->asd.capture_pad].fmt.height;
 	curr_rules.fps = fps;
-	curr_rules.run_mode = asd->run_mode->val;
+	curr_rules.run_mode = isp->asd.run_mode->val;
 
 	/* search for the target frequency by looping freq rules*/
 	for (i = 0; i < dfs->dfs_table_size; i++) {
@@ -451,37 +449,13 @@ static void clear_irq_reg(struct atomisp_device *isp)
 	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, msg_ret);
 }
 
-static struct atomisp_sub_device *
-__get_asd_from_port(struct atomisp_device *isp, enum mipi_port_id port)
-{
-	int i;
-
-	/* Check which isp subdev to send eof */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-		struct camera_mipi_info *mipi_info;
-
-		mipi_info = atomisp_to_sensor_mipi_info(
-				isp->inputs[asd->input_curr].camera);
-
-		if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED &&
-		    __get_mipi_port(isp, mipi_info->port) == port) {
-			return asd;
-		}
-	}
-
-	return NULL;
-}
-
 /* interrupt handling function*/
 irqreturn_t atomisp_isr(int irq, void *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)dev;
-	struct atomisp_sub_device *asd;
 	struct atomisp_css_event eof_event;
 	unsigned int irq_infos = 0;
 	unsigned long flags;
-	unsigned int i;
 	int err;
 
 	spin_lock_irqsave(&isp->lock, flags);
@@ -501,18 +475,10 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 	if (!atomisp_streaming_count(isp))
 		goto out_nowake;
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-			continue;
-		/*
-		 * Current SOF only support one stream, so the SOF only valid
-		 * either solely one stream is running
-		 */
+	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
 		if (irq_infos & IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF) {
-			atomic_inc(&asd->sof_count);
-			atomisp_sof_event(asd);
+			atomic_inc(&isp->asd.sof_count);
+			atomisp_sof_event(&isp->asd);
 
 			/* If sequence_temp and sequence are the same
 			 * there where no frames lost so we can increase
@@ -522,14 +488,14 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 			 * NOTE: There is assumption here that ISP will not
 			 * start processing next frame from sensor before old
 			 * one is completely done. */
-			if (atomic_read(&asd->sequence) == atomic_read(
-				&asd->sequence_temp))
-				atomic_set(&asd->sequence_temp,
-					   atomic_read(&asd->sof_count));
+			if (atomic_read(&isp->asd.sequence) ==
+			    atomic_read(&isp->asd.sequence_temp))
+				atomic_set(&isp->asd.sequence_temp,
+					   atomic_read(&isp->asd.sof_count));
 		}
 		if (irq_infos & IA_CSS_IRQ_INFO_EVENTS_READY)
-			atomic_set(&asd->sequence,
-				   atomic_read(&asd->sequence_temp));
+			atomic_set(&isp->asd.sequence,
+				   atomic_read(&isp->asd.sequence_temp));
 	}
 
 	if (irq_infos & IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF) {
@@ -554,21 +520,12 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 	}
 
 	if (irq_infos & IA_CSS_IRQ_INFO_ISYS_EVENTS_READY) {
-		while (ia_css_dequeue_isys_event(&eof_event.event) ==
-		       0) {
-			/* EOF Event does not have the css_pipe returned */
-			asd = __get_asd_from_port(isp, eof_event.event.port);
-			if (!asd) {
-				dev_err(isp->dev, "%s: ISYS event, but no subdev.event:%d",
-					__func__, eof_event.event.type);
-				continue;
-			}
-
-			atomisp_eof_event(asd, eof_event.event.exp_id);
+		while (ia_css_dequeue_isys_event(&eof_event.event) == 0) {
+			atomisp_eof_event(&isp->asd, eof_event.event.exp_id);
 			dev_dbg_ratelimited(isp->dev,
 					    "%s ISYS event: EOF exp_id %d, asd %d\n",
 					    __func__, eof_event.event.exp_id,
-					    asd->index);
+					    isp->asd.index);
 		}
 
 		irq_infos &= ~IA_CSS_IRQ_INFO_ISYS_EVENTS_READY;
@@ -993,9 +950,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
-	bool stream_restart[MAX_STREAM_NUM] = {0};
+	bool stream_restart = false;
 	unsigned long flags;
-	int i, ret;
+	int ret;
 
 	lockdep_assert_held(&isp->mutex);
 
@@ -1004,44 +961,37 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
-	BUG_ON(isp->num_of_streams > MAX_STREAM_NUM);
-
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED &&
-		    !asd->stream_prepared)
-			continue;
-
-		stream_restart[asd->index] = true;
+	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED ||
+	    isp->asd.stream_prepared) {
+		stream_restart = true;
 
 		spin_lock_irqsave(&isp->lock, flags);
-		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
+		isp->asd.streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
 		spin_unlock_irqrestore(&isp->lock, flags);
 
 		/* stream off sensor */
 		ret = v4l2_subdev_call(
-			  isp->inputs[asd->input_curr].
+			  isp->inputs[isp->asd.input_curr].
 			  camera, video, s_stream, 0);
 		if (ret)
 			dev_warn(isp->dev,
 				 "can't stop streaming on sensor!\n");
 
-		atomisp_clear_css_buffer_counters(asd);
+		atomisp_clear_css_buffer_counters(&isp->asd);
 
-		css_pipe_id = atomisp_get_css_pipe_id(asd);
-		atomisp_css_stop(asd, css_pipe_id, true);
+		css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
+		atomisp_css_stop(&isp->asd, css_pipe_id, true);
 
 		spin_lock_irqsave(&isp->lock, flags);
-		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
+		isp->asd.streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 		spin_unlock_irqrestore(&isp->lock, flags);
 
-		asd->preview_exp_id = 1;
-		asd->postview_exp_id = 1;
+		isp->asd.preview_exp_id = 1;
+		isp->asd.postview_exp_id = 1;
 		/* notify HAL the CSS reset */
 		dev_dbg(isp->dev,
-			"send reset event to %s\n", asd->subdev.devnode->name);
-		atomisp_reset_event(asd);
+			"send reset event to %s\n", isp->asd.subdev.devnode->name);
+		atomisp_reset_event(&isp->asd);
 	}
 
 	/* clear irq */
@@ -1057,25 +1007,20 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 	atomisp_reset(isp);
 	isp->isp_timeout = false;
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		if (!stream_restart[i])
-			continue;
+	if (stream_restart) {
+		atomisp_css_input_set_mode(&isp->asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 
-		atomisp_css_input_set_mode(asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
-
-		css_pipe_id = atomisp_get_css_pipe_id(asd);
-		if (atomisp_css_start(asd, css_pipe_id, true)) {
+		css_pipe_id = atomisp_get_css_pipe_id(&isp->asd);
+		if (atomisp_css_start(&isp->asd, css_pipe_id, true)) {
 			dev_warn(isp->dev,
 				 "start SP failed, so do not set streaming to be enable!\n");
 		} else {
 			spin_lock_irqsave(&isp->lock, flags);
-			asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
+			isp->asd.streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
 			spin_unlock_irqrestore(&isp->lock, flags);
 		}
 
-		atomisp_csi2_configure(asd);
+		atomisp_csi2_configure(&isp->asd);
 	}
 
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
@@ -1084,27 +1029,20 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd;
-
-		asd = &isp->asd[i];
-
-		if (!stream_restart[i])
-			continue;
-
+	if (stream_restart) {
 		/*
 		 * dequeueing buffers is not needed. CSS will recycle
 		 * buffers that it has.
 		 */
-		atomisp_flush_bufs_and_wakeup(asd);
+		atomisp_flush_bufs_and_wakeup(&isp->asd);
 
 		/* Requeue unprocessed per-frame parameters. */
-		atomisp_recover_params_queue(&asd->video_out_capture);
-		atomisp_recover_params_queue(&asd->video_out_preview);
-		atomisp_recover_params_queue(&asd->video_out_video_capture);
+		atomisp_recover_params_queue(&isp->asd.video_out_capture);
+		atomisp_recover_params_queue(&isp->asd.video_out_preview);
+		atomisp_recover_params_queue(&isp->asd.video_out_video_capture);
 
 		ret = v4l2_subdev_call(
-			  isp->inputs[asd->input_curr].camera, video,
+			  isp->inputs[isp->asd.input_curr].camera, video,
 			  s_stream, 1);
 		if (ret)
 			dev_warn(isp->dev,
@@ -1164,10 +1102,6 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 {
 	struct atomisp_device *isp = isp_ptr;
 	unsigned long flags;
-	bool frame_done_found[MAX_STREAM_NUM] = {0};
-	bool css_pipe_done[MAX_STREAM_NUM] = {0};
-	unsigned int i;
-	struct atomisp_sub_device *asd;
 
 	dev_dbg(isp->dev, ">%s\n", __func__);
 
@@ -1206,15 +1140,11 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	 * time, instead, dequue one and process one, then another
 	 */
 	mutex_lock(&isp->mutex);
-	if (atomisp_css_isr_thread(isp, frame_done_found, css_pipe_done))
+	if (atomisp_css_isr_thread(isp))
 		goto out;
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-			continue;
-		atomisp_setup_flash(asd);
-	}
+	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED)
+		atomisp_setup_flash(&isp->asd);
 out:
 	mutex_unlock(&isp->mutex);
 	dev_dbg(isp->dev, "<%s\n", __func__);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 707509922784..218e8ac276c8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -416,9 +416,7 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd);
 
-int atomisp_css_isr_thread(struct atomisp_device *isp,
-			   bool *frame_done_found,
-			   bool *css_pipe_done);
+int atomisp_css_isr_thread(struct atomisp_device *isp);
 
 bool atomisp_css_valid_sof(struct atomisp_device *isp);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index a1c1c9b1e806..1dae2a7cfdd9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3393,41 +3393,33 @@ void atomisp_css_morph_table_free(struct ia_css_morph_table *table)
 	ia_css_morph_table_free(table);
 }
 
-static struct atomisp_sub_device *__get_atomisp_subdev(
-    struct ia_css_pipe *css_pipe,
-    struct atomisp_device *isp,
-    enum atomisp_input_stream_id *stream_id)
+static bool atomisp_css_isr_get_stream_id(struct ia_css_pipe *css_pipe,
+					  struct atomisp_device *isp,
+					  enum atomisp_input_stream_id *stream_id)
 {
-	int i, j, k;
-	struct atomisp_sub_device *asd;
 	struct atomisp_stream_env *stream_env;
+	int i, j;
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		if (asd->streaming == ATOMISP_DEVICE_STREAMING_DISABLED)
-			continue;
-		for (j = 0; j < ATOMISP_INPUT_STREAM_NUM; j++) {
-			stream_env = &asd->stream_env[j];
-			for (k = 0; k < IA_CSS_PIPE_ID_NUM; k++) {
-				if (stream_env->pipes[k] &&
-				    stream_env->pipes[k] == css_pipe) {
-					*stream_id = j;
-					return asd;
-				}
+	if (isp->asd.streaming == ATOMISP_DEVICE_STREAMING_DISABLED)
+		return false;
+
+	for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
+		stream_env = &isp->asd.stream_env[i];
+		for (j = 0; j < IA_CSS_PIPE_ID_NUM; j++) {
+			if (stream_env->pipes[j] && stream_env->pipes[j] == css_pipe) {
+				*stream_id = i;
+				return true;
 			}
 		}
 	}
 
-	return NULL;
+	return false;
 }
 
-int atomisp_css_isr_thread(struct atomisp_device *isp,
-			   bool *frame_done_found,
-			   bool *css_pipe_done)
+int atomisp_css_isr_thread(struct atomisp_device *isp)
 {
 	enum atomisp_input_stream_id stream_id = 0;
 	struct atomisp_css_event current_event;
-	struct atomisp_sub_device *asd;
 
 	lockdep_assert_held(&isp->mutex);
 
@@ -3453,9 +3445,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			continue;
 		}
 
-		asd = __get_atomisp_subdev(current_event.event.pipe,
-					   isp, &stream_id);
-		if (!asd) {
+		if (!atomisp_css_isr_get_stream_id(current_event.event.pipe, isp, &stream_id)) {
 			if (current_event.event.type == IA_CSS_EVENT_TYPE_TIMER)
 				dev_dbg(isp->dev,
 					"event: Timer event.");
@@ -3466,56 +3456,53 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			continue;
 		}
 
-		atomisp_css_temp_pipe_to_pipe_id(asd, &current_event);
+		atomisp_css_temp_pipe_to_pipe_id(&isp->asd, &current_event);
 		switch (current_event.event.type) {
 		case IA_CSS_EVENT_TYPE_OUTPUT_FRAME_DONE:
 			dev_dbg(isp->dev, "event: Output frame done");
-			frame_done_found[asd->index] = true;
-			atomisp_buf_done(asd, 0, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME,
+			atomisp_buf_done(&isp->asd, 0, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE:
 			dev_dbg(isp->dev, "event: Second output frame done");
-			frame_done_found[asd->index] = true;
-			atomisp_buf_done(asd, 0, IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME,
+			atomisp_buf_done(&isp->asd, 0, IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE:
 			dev_dbg(isp->dev, "event: 3A stats frame done");
-			atomisp_buf_done(asd, 0,
+			atomisp_buf_done(&isp->asd, 0,
 					 IA_CSS_BUFFER_TYPE_3A_STATISTICS,
 					 current_event.pipe,
 					 false, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_METADATA_DONE:
 			dev_dbg(isp->dev, "event: metadata frame done");
-			atomisp_buf_done(asd, 0,
+			atomisp_buf_done(&isp->asd, 0,
 					 IA_CSS_BUFFER_TYPE_METADATA,
 					 current_event.pipe,
 					 false, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_VF_OUTPUT_FRAME_DONE:
 			dev_dbg(isp->dev, "event: VF output frame done");
-			atomisp_buf_done(asd, 0,
+			atomisp_buf_done(&isp->asd, 0,
 					 IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE:
 			dev_dbg(isp->dev, "event: second VF output frame done");
-			atomisp_buf_done(asd, 0,
+			atomisp_buf_done(&isp->asd, 0,
 					 IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE:
 			dev_dbg(isp->dev, "event: dis stats frame done");
-			atomisp_buf_done(asd, 0,
+			atomisp_buf_done(&isp->asd, 0,
 					 IA_CSS_BUFFER_TYPE_DIS_STATISTICS,
 					 current_event.pipe,
 					 false, stream_id);
 			break;
 		case IA_CSS_EVENT_TYPE_PIPELINE_DONE:
 			dev_dbg(isp->dev, "event: pipeline done");
-			css_pipe_done[asd->index] = true;
 			break;
 		case IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE:
 			dev_warn(isp->dev, "unexpected event: acc stage done");
@@ -3532,23 +3519,17 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 
 bool atomisp_css_valid_sof(struct atomisp_device *isp)
 {
-	unsigned int i, j;
-
-	/* Loop for each css stream */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-		/* Loop for each css vc stream */
-		for (j = 0; j < ATOMISP_INPUT_STREAM_NUM; j++) {
-			if (!asd->stream_env[j].stream)
-				continue;
-
-			dev_dbg(isp->dev,
-				"stream #%d: mode: %d\n", j,
-				asd->stream_env[j].stream_config.mode);
-			if (asd->stream_env[j].stream_config.mode ==
-			    IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-				return false;
-		}
+	unsigned int i;
+
+	/* Loop for each css vc stream */
+	for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
+		if (!isp->asd.stream_env[i].stream)
+			continue;
+
+		dev_dbg(isp->dev, "stream #%d: mode: %d\n",
+			i, isp->asd.stream_env[i].stream_config.mode);
+		if (isp->asd.stream_env[i].stream_config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
+			return false;
 	}
 
 	return true;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index e220f500aff4..fa362c8a37e8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -594,12 +594,7 @@ static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
 
 unsigned int atomisp_dev_users(struct atomisp_device *isp)
 {
-	unsigned int i, sum;
-
-	for (i = 0, sum = 0; i < isp->num_of_streams; i++)
-		sum += atomisp_subdev_users(&isp->asd[i]);
-
-	return sum;
+	return atomisp_subdev_users(&isp->asd);
 }
 
 static int atomisp_open(struct file *file)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 35293f2c196a..1fac99f4e2b0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -48,8 +48,6 @@
 	(((isp)->media_dev.hw_revision & ATOMISP_HW_REVISION_MASK) == \
 	 ((rev) << ATOMISP_HW_REVISION_SHIFT))
 
-#define MAX_STREAM_NUM	2
-
 #define ATOMISP_PCI_DEVICE_SOC_MASK	0xfff8
 /* MRFLD with 0x1178: ISP freq can burst to 457MHz */
 #define ATOMISP_PCI_DEVICE_SOC_MRFLD	0x1178
@@ -181,6 +179,7 @@ struct atomisp_device {
 	struct device *dev;
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
+	struct atomisp_sub_device asd;
 	struct atomisp_platform_data *pdata;
 	void *mmu_l1_base;
 	void __iomem *base;
@@ -190,18 +189,6 @@ struct atomisp_device {
 	struct pm_qos_request pm_qos;
 	s32 max_isr_latency;
 
-	/*
-	 * ISP modules
-	 * Multiple streams are represents by multiple
-	 * atomisp_sub_device instances
-	 */
-	struct atomisp_sub_device *asd;
-	/*
-	 * this will be assigned dyanamically.
-	 * For Merr/BTY(ISP2400), 2 streams are supported.
-	 */
-	unsigned int num_of_streams;
-
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
 	struct atomisp_tpg_device tpg;
 
@@ -222,7 +209,7 @@ struct atomisp_device {
 	bool isp_fatal_error;
 	struct work_struct assert_recovery_work;
 
-	spinlock_t lock; /* Protects asd[i].streaming */
+	spinlock_t lock; /* Protects asd.streaming */
 
 	bool need_gfx_throttle;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 99cfe8a80bb1..14700afd92c2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -626,13 +626,7 @@ atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 {
-	unsigned int i, sum;
-
-	for (i = 0, sum = 0; i < isp->num_of_streams; i++)
-		sum += isp->asd[i].streaming ==
-		       ATOMISP_DEVICE_STREAMING_ENABLED;
-
-	return sum;
+	return isp->asd.streaming == ATOMISP_DEVICE_STREAMING_ENABLED;
 }
 
 /*
@@ -1318,11 +1312,11 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	struct video_device *vdev = &pipe->vdev;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	bool recreate_streams[MAX_STREAM_NUM] = {0};
 	enum ia_css_pipe_id css_pipe_id;
+	bool recreate_stream = false;
 	bool first_streamoff = false;
 	unsigned long flags;
-	int i, ret;
+	int ret;
 
 	mutex_lock(&isp->mutex);
 
@@ -1409,11 +1403,9 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	 *
 	 * So force stream destroy here.
 	 */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		if (isp->asd[i].stream_prepared) {
-			atomisp_destroy_pipes_stream_force(&isp->asd[i]);
-			recreate_streams[i] = true;
-		}
+	if (isp->asd.stream_prepared) {
+		atomisp_destroy_pipes_stream_force(&isp->asd);
+		recreate_stream = true;
 	}
 
 	/* disable  PUNIT/ISP acknowlede/handshake - SRSE=3 */
@@ -1421,19 +1413,18 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
 	dev_err(isp->dev, "atomisp_reset");
 	atomisp_reset(isp);
-	for (i = 0; i < isp->num_of_streams; i++) {
-		if (recreate_streams[i]) {
-			int ret2;
-
-			ret2 = atomisp_create_pipes_stream(&isp->asd[i]);
-			if (ret2) {
-				dev_err(isp->dev, "%s error re-creating streams: %d\n",
-					__func__, ret2);
-				if (!ret)
-					ret = ret2;
-			}
+
+	if (recreate_stream) {
+		int ret2;
+
+		ret2 = atomisp_create_pipes_stream(&isp->asd);
+		if (ret2) {
+			dev_err(isp->dev, "%s error re-creating streams: %d\n", __func__, ret2);
+			if (!ret)
+				ret = ret2;
 		}
 	}
+
 	isp->isp_timeout = false;
 out_unlock:
 	mutex_unlock(&isp->mutex);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 011e67ccdbba..143176bc684a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1018,21 +1018,16 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 
 int atomisp_create_pads_links(struct atomisp_device *isp)
 {
-	struct atomisp_sub_device *asd;
-	int i, j, ret = 0;
+	int i, ret;
 
-	isp->num_of_streams = 2;
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
-		for (j = 0; j < isp->num_of_streams; j++) {
-			ret =
-			    media_create_pad_link(&isp->csi2_port[i].subdev.
-						  entity, CSI2_PAD_SOURCE,
-						  &isp->asd[j].subdev.entity,
-						  ATOMISP_SUBDEV_PAD_SINK, 0);
-			if (ret < 0)
-				return ret;
-		}
+		ret = media_create_pad_link(&isp->csi2_port[i].subdev.entity,
+					    CSI2_PAD_SOURCE, &isp->asd.subdev.entity,
+					    ATOMISP_SUBDEV_PAD_SINK, 0);
+		if (ret < 0)
+			return ret;
 	}
+
 	for (i = 0; i < isp->input_cnt; i++) {
 		/* Don't create links for the test-pattern-generator */
 		if (isp->inputs[i].type == TEST_PATTERN)
@@ -1047,33 +1042,28 @@ int atomisp_create_pads_links(struct atomisp_device *isp)
 		if (ret < 0)
 			return ret;
 	}
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		ret = media_create_pad_link(&asd->subdev.entity,
-					    ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW,
-					    &asd->video_out_preview.vdev.entity,
-					    0, 0);
-		if (ret < 0)
-			return ret;
-		ret = media_create_pad_link(&asd->subdev.entity,
-					    ATOMISP_SUBDEV_PAD_SOURCE_VF,
-					    &asd->video_out_vf.vdev.entity, 0,
-					    0);
-		if (ret < 0)
-			return ret;
-		ret = media_create_pad_link(&asd->subdev.entity,
-					    ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE,
-					    &asd->video_out_capture.vdev.entity,
-					    0, 0);
-		if (ret < 0)
-			return ret;
-		ret = media_create_pad_link(&asd->subdev.entity,
-					    ATOMISP_SUBDEV_PAD_SOURCE_VIDEO,
-					    &asd->video_out_video_capture.vdev.
-					    entity, 0, 0);
-		if (ret < 0)
-			return ret;
-	}
+
+	ret = media_create_pad_link(&isp->asd.subdev.entity,
+				    ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW,
+				    &isp->asd.video_out_preview.vdev.entity, 0, 0);
+	if (ret < 0)
+		return ret;
+	ret = media_create_pad_link(&isp->asd.subdev.entity,
+				    ATOMISP_SUBDEV_PAD_SOURCE_VF,
+				    &isp->asd.video_out_vf.vdev.entity, 0, 0);
+	if (ret < 0)
+		return ret;
+	ret = media_create_pad_link(&isp->asd.subdev.entity,
+				    ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE,
+				    &isp->asd.video_out_capture.vdev.entity, 0, 0);
+	if (ret < 0)
+		return ret;
+	ret = media_create_pad_link(&isp->asd.subdev.entity,
+				    ATOMISP_SUBDEV_PAD_SOURCE_VIDEO,
+				    &isp->asd.video_out_video_capture.vdev.entity, 0, 0);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -1169,29 +1159,14 @@ int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
  */
 int atomisp_subdev_init(struct atomisp_device *isp)
 {
-	struct atomisp_sub_device *asd;
-	int i, ret = 0;
+	int ret;
 
-	/*
-	 * CSS2.0 running ISP2400 support
-	 * multiple streams
-	 */
-	isp->num_of_streams = 2;
-	isp->asd = devm_kzalloc(isp->dev, sizeof(struct atomisp_sub_device) *
-				isp->num_of_streams, GFP_KERNEL);
-	if (!isp->asd)
-		return -ENOMEM;
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		asd->isp = isp;
-		isp_subdev_init_params(asd);
-		asd->index = i;
-		ret = isp_subdev_init_entities(asd);
-		if (ret < 0) {
-			atomisp_subdev_cleanup_entities(asd);
-			break;
-		}
-	}
+	isp->asd.index = 0;
+	isp->asd.isp = isp;
+	isp_subdev_init_params(&isp->asd);
+	ret = isp_subdev_init_entities(&isp->asd);
+	if (ret < 0)
+		atomisp_subdev_cleanup_entities(&isp->asd);
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 4f5698e54711..3f315dabbeeb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -753,8 +753,6 @@ static int atomisp_suspend(struct device *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)
 				     dev_get_drvdata(dev);
-	/* FIXME: only has one isp_subdev at present */
-	struct atomisp_sub_device *asd = &isp->asd[0];
 	unsigned long flags;
 
 	/*
@@ -765,7 +763,7 @@ static int atomisp_suspend(struct device *dev)
 		return -EBUSY;
 
 	spin_lock_irqsave(&isp->lock, flags);
-	if (asd->streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
+	if (isp->asd.streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
 		spin_unlock_irqrestore(&isp->lock, flags);
 		dev_err(isp->dev, "atomisp cannot suspend at this time.\n");
 		return -EINVAL;
@@ -1004,8 +1002,7 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 	unsigned int i;
 	struct v4l2_subdev *sd, *next;
 
-	for (i = 0; i < isp->num_of_streams; i++)
-		atomisp_subdev_unregister_entities(&isp->asd[i]);
+	atomisp_subdev_unregister_entities(&isp->asd);
 	atomisp_tpg_unregister_entities(&isp->tpg);
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
@@ -1064,17 +1061,10 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		goto tpg_register_failed;
 	}
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		ret = atomisp_subdev_register_subdev(asd, &isp->v4l2_dev);
-		if (ret < 0) {
-			dev_err(isp->dev, "atomisp_subdev_register_subdev fail\n");
-			for (; i > 0; i--)
-				atomisp_subdev_unregister_entities(
-				    &isp->asd[i - 1]);
-			goto subdev_register_failed;
-		}
+	ret = atomisp_subdev_register_subdev(&isp->asd, &isp->v4l2_dev);
+	if (ret < 0) {
+		dev_err(isp->dev, "atomisp_subdev_register_subdev fail\n");
+		goto subdev_register_failed;
 	}
 
 	for (i = 0; i < isp->input_cnt; i++) {
@@ -1099,9 +1089,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	return 0;
 
 link_failed:
-	for (i = 0; i < isp->num_of_streams; i++)
-		atomisp_subdev_unregister_entities(
-		    &isp->asd[i]);
+	atomisp_subdev_unregister_entities(&isp->asd);
 subdev_register_failed:
 	atomisp_tpg_unregister_entities(&isp->tpg);
 tpg_register_failed:
@@ -1117,13 +1105,11 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 
 static int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
-	int i, err;
+	int err;
 
-	for (i = 0; i < isp->num_of_streams; i++) {
-		err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
-		if (err)
-			return err;
-	}
+	err = atomisp_subdev_register_video_nodes(&isp->asd, &isp->v4l2_dev);
+	if (err)
+		return err;
 
 	err = atomisp_create_pads_links(isp);
 	if (err)
-- 
2.39.1

