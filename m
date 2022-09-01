Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B105A9382
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbiIAJrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbiIAJrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F12112ECF
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=edqM0z2KQD7apCD8laUnbpMHoX2a9EzdcJiawYQYAbE=;
        b=LhuNWbc+IRVeVVfnMC/oP7jEcSS1dOal2raaTEbPqVe1+oLgxBqHHF1zVYl1E8Is7Die2S
        H8aYQMR/JfxukppGw5jD4TCLtiAP/4awYzMCJF9TQoWmOLIShZbUR0owznhnSibvzo2Ysn
        Rg7DSDLvNqfOnOojnRleaEgN6B5c5pw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-qhDua9sTP5uaKW7WsNq6yQ-1; Thu, 01 Sep 2022 05:47:02 -0400
X-MC-Unique: qhDua9sTP5uaKW7WsNq6yQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A63FA9652DA;
        Thu,  1 Sep 2022 09:46:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 312E840334C;
        Thu,  1 Sep 2022 09:46:44 +0000 (UTC)
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
Subject: [PATCH 05/14] media: atomisp: Remove never set file_input flag
Date:   Thu,  1 Sep 2022 11:46:17 +0200
Message-Id: <20220901094626.11513-6-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
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

After the file-injection support removal the file_input flag is
always false.

Remove the flag and replace any code checking it with the code-path
for when it is false.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 41 +++-----------
 .../staging/media/atomisp/pci/atomisp_fops.c  | 12 +---
 .../media/atomisp/pci/atomisp_internal.h      |  2 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 56 ++++++-------------
 4 files changed, 28 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8313724f06b3..8e6c10f25318 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1308,9 +1308,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 	bool depth_mode = false;
 	int i, ret, depth_cnt = 0;
 
-	if (!isp->sw_contex.file_input)
-		atomisp_css_irq_enable(isp,
-				       IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
 	BUG_ON(isp->num_of_streams > MAX_STREAM_NUM);
 
@@ -1396,16 +1394,11 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		atomisp_csi2_configure(asd);
 	}
 
-	if (!isp->sw_contex.file_input) {
-		atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-				       atomisp_css_valid_sof(isp));
+	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+			       atomisp_css_valid_sof(isp));
 
-		if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
-			dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
-	} else {
-		if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_MAX, true) < 0)
-			dev_dbg(isp->dev, "DFS max failed while recovering!\n");
-	}
+	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
+		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
 
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd;
@@ -1610,10 +1603,7 @@ void atomisp_wdt_work(struct work_struct *work)
 			if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
 				continue;
 
-			atomisp_wdt_refresh(asd,
-					    isp->sw_contex.file_input ?
-					    ATOMISP_ISP_FILE_TIMEOUT_DURATION :
-					    ATOMISP_ISP_TIMEOUT_DURATION);
+			atomisp_wdt_refresh(asd, ATOMISP_ISP_TIMEOUT_DURATION);
 		}
 	}
 
@@ -1643,14 +1633,10 @@ void atomisp_css_flush(struct atomisp_device *isp)
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
-		if (asd->streaming !=
-		    ATOMISP_DEVICE_STREAMING_ENABLED)
+		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
 			continue;
 
-		atomisp_wdt_refresh(asd,
-				    isp->sw_contex.file_input ?
-				    ATOMISP_ISP_FILE_TIMEOUT_DURATION :
-				    ATOMISP_ISP_TIMEOUT_DURATION);
+		atomisp_wdt_refresh(asd, ATOMISP_ISP_TIMEOUT_DURATION);
 	}
 	dev_dbg(isp->dev, "atomisp css flush done\n");
 }
@@ -1896,14 +1882,6 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	}
 out:
 	rt_mutex_unlock(&isp->mutex);
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED
-		    && css_pipe_done[asd->index]
-		    && isp->sw_contex.file_input)
-			v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-					 video, s_stream, 1);
-	}
 	dev_dbg(isp->dev, "<%s\n", __func__);
 
 	return IRQ_HANDLED;
@@ -5377,8 +5355,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	ia_css_frame_free(asd->raw_output_frame);
 	asd->raw_output_frame = NULL;
 
-	if (!asd->continuous_mode->val &&
-	    !asd->params.online_process && !isp->sw_contex.file_input &&
+	if (!asd->continuous_mode->val && !asd->params.online_process &&
 	    ia_css_frame_allocate_from_info(&asd->raw_output_frame,
 		    raw_output_info))
 		return -ENOMEM;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index d6a7198a957c..ab767b585011 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -628,7 +628,6 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
 {
 	unsigned int i;
 
-	isp->sw_contex.file_input = false;
 	isp->need_gfx_throttle = true;
 	isp->isp_fatal_error = false;
 	isp->mipi_frame_size = 0;
@@ -915,7 +914,7 @@ static int atomisp_release(struct file *file)
 	 * The sink pad setting can only be cleared when all device nodes
 	 * get released.
 	 */
-	if (!isp->sw_contex.file_input && asd->fmt_auto->val) {
+	if (asd->fmt_auto->val) {
 		struct v4l2_mbus_framefmt isp_sink_fmt = { 0 };
 
 		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
@@ -926,15 +925,6 @@ static int atomisp_release(struct file *file)
 	if (atomisp_subdev_users(asd))
 		goto done;
 
-	/* clear the sink pad for file input */
-	if (isp->sw_contex.file_input && asd->fmt_auto->val) {
-		struct v4l2_mbus_framefmt isp_sink_fmt = { 0 };
-
-		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
-					V4L2_SUBDEV_FORMAT_ACTIVE,
-					ATOMISP_SUBDEV_PAD_SINK, &isp_sink_fmt);
-	}
-
 	atomisp_css_free_stat_buffers(asd);
 	atomisp_free_internal_buffers(asd);
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index ce1746e7ab9f..1d2326a40227 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -91,7 +91,6 @@
 
 #define ATOMISP_ISP_TIMEOUT_DURATION		(2 * HZ)
 #define ATOMISP_EXT_ISP_TIMEOUT_DURATION        (6 * HZ)
-#define ATOMISP_ISP_FILE_TIMEOUT_DURATION	(60 * HZ)
 #define ATOMISP_WDT_KEEP_CURRENT_DELAY          0
 #define ATOMISP_ISP_MAX_TIMEOUT_COUNT	2
 #define ATOMISP_CSS_STOP_TIMEOUT_US	200000
@@ -202,7 +201,6 @@ struct atomisp_regs {
 };
 
 struct atomisp_sw_contex {
-	bool file_input;
 	int power_state;
 	int running_freq;
 };
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 345970ca4fcb..7f89226c858a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -737,7 +737,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 			ret = v4l2_subdev_call(motor, core, s_power, 1);
 	}
 
-	if (!isp->sw_contex.file_input && motor)
+	if (motor)
 		ret = v4l2_subdev_call(motor, core, init, 1);
 
 	asd->input_curr = input;
@@ -1841,8 +1841,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 	atomic_set(&asd->sof_count, -1);
 	atomic_set(&asd->sequence, -1);
 	atomic_set(&asd->sequence_temp, -1);
-	if (isp->sw_contex.file_input)
-		wdt_duration = ATOMISP_ISP_FILE_TIMEOUT_DURATION;
 
 	asd->params.dis_proj_data_valid = false;
 	asd->latest_preview_exp_id = 0;
@@ -1865,26 +1863,21 @@ static int atomisp_streamon(struct file *file, void *fh,
 		atomisp_setup_flash(asd);
 	}
 
-	if (!isp->sw_contex.file_input) {
-		atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-				       atomisp_css_valid_sof(isp));
-		atomisp_csi2_configure(asd);
-		/*
-		 * set freq to max when streaming count > 1 which indicate
-		 * dual camera would run
-		 */
-		if (atomisp_streaming_count(isp) > 1) {
-			if (atomisp_freq_scaling(isp,
-						 ATOMISP_DFS_MODE_MAX, false) < 0)
-				dev_dbg(isp->dev, "DFS max mode failed!\n");
-		} else {
-			if (atomisp_freq_scaling(isp,
-						 ATOMISP_DFS_MODE_AUTO, false) < 0)
-				dev_dbg(isp->dev, "DFS auto mode failed!\n");
-		}
-	} else {
-		if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_MAX, false) < 0)
+	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+			       atomisp_css_valid_sof(isp));
+	atomisp_csi2_configure(asd);
+	/*
+	 * set freq to max when streaming count > 1 which indicate
+	 * dual camera would run
+	 */
+	if (atomisp_streaming_count(isp) > 1) {
+		if (atomisp_freq_scaling(isp,
+					 ATOMISP_DFS_MODE_MAX, false) < 0)
 			dev_dbg(isp->dev, "DFS max mode failed!\n");
+	} else {
+		if (atomisp_freq_scaling(isp,
+					 ATOMISP_DFS_MODE_AUTO, false) < 0)
+			dev_dbg(isp->dev, "DFS auto mode failed!\n");
 	}
 
 	if (asd->depth_mode->val && atomisp_streaming_count(isp) ==
@@ -2047,15 +2040,6 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		/* if other streams are running, should not disable watch dog */
 		rt_mutex_unlock(&isp->mutex);
 		atomisp_wdt_stop(asd, true);
-
-		/*
-		 * must stop sending pixels into GP_FIFO before stop
-		 * the pipeline.
-		 */
-		if (isp->sw_contex.file_input)
-			v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-					 video, s_stream, 0);
-
 		rt_mutex_lock(&isp->mutex);
 	}
 
@@ -2072,10 +2056,7 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	}
 
 	atomisp_clear_css_buffer_counters(asd);
-
-	if (!isp->sw_contex.file_input)
-		atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-				       false);
+	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
 	if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED) {
 		cancel_work_sync(&asd->delayed_init_work);
@@ -2128,9 +2109,8 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	    != atomisp_sensor_start_stream(asd))
 		return 0;
 
-	if (!isp->sw_contex.file_input)
-		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       video, s_stream, 0);
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+			       video, s_stream, 0);
 
 	if (isp->flash) {
 		asd->params.num_flash_frames = 0;
-- 
2.37.2

