Return-Path: <linux-media+bounces-9365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D338A4E63
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25BC51F21C6D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1805F6BB29;
	Mon, 15 Apr 2024 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M1yPEc8E"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D169D2C
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182585; cv=none; b=KJ4wS35sSMG01yogmbaxFV6fS3h0uJvKx7m8wMaoCRndvaWj4gkdn+MlknT22wb8U37+Uve+RkcNIiO2YU1qRGGOEStUtgiBqI4YfEiGUzAdPmQUXPLHaPpgHTlxHc0eivZ2usAIt3N/mTf+TwVx3ps7ADenstq1vAmgqT2+RP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182585; c=relaxed/simple;
	bh=RzcpKMiXmkKgWerMZ+T/YnspAcNE53yjOWw0HPdSfC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O75Uzz/5/P7rNDKaz9kZrxmEbiuuEzhwm7XH9v2r1xyBJmIm7FnSCrwgW0fVR2ZiQ8YXJ/TqZA8r0rt5I4ZN/UjWVkomn/j2OcLLNzcL/DprkCk2sIZWmOdDYgpAx9OqzHbHhwTtHD0QkWA6pDJ2QZTrZ7H63uQoBoMTOLV8Ruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M1yPEc8E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Euk+XHMkJouHBDFnSpR99VI4U8gTH+lkeZqF4iS19wQ=;
	b=M1yPEc8EJNKgK836INsHZU6mB+MAVS71l5J3XHbpD6HH1zLkFNU5iR6Qo87gRMxtKmrMPY
	E10kZ0DS+Vnky6LshG3FmbS4xhuYVQoQslURZZhPe5Sgom0in3c1/0ogREZ3aTQOOUFDOm
	9Do1yCzTlDyLPxUESNT2eOka8PnZfik=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-oPyhIrAWO6u4e9iA4rmyjA-1; Mon,
 15 Apr 2024 08:02:55 -0400
X-MC-Unique: oPyhIrAWO6u4e9iA4rmyjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 751C438143AA;
	Mon, 15 Apr 2024 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F046C01595;
	Mon, 15 Apr 2024 12:02:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/23] media: atomisp: Drop custom flash support
Date: Mon, 15 Apr 2024 14:02:11 +0200
Message-ID: <20240415120220.219480-15-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Remove the custom flash handling from the atomisp driver. There are only
very few Bay Trail / Cherry Trail devices with flash and if those will
ever get supported then this should be done through the new standard
include/linux/led-class-flash.h APIs instead of with atomisp specific
custom APIs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  42 -------
 .../atomisp/include/linux/atomisp_platform.h  |   1 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 117 +-----------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   4 -
 .../staging/media/atomisp/pci/atomisp_fops.c  |  14 ---
 .../media/atomisp/pci/atomisp_internal.h      |   1 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  61 ---------
 .../media/atomisp/pci/atomisp_subdev.h        |  13 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   7 --
 .../media/atomisp/pci/ia_css_frame_public.h   |   8 --
 .../media/atomisp/pci/ia_css_stream_public.h  |  14 ---
 drivers/staging/media/atomisp/pci/sh_css.c    |  33 -----
 12 files changed, 2 insertions(+), 313 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index b2735a008052..db0c1b87c9ef 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -614,26 +614,6 @@ enum atomisp_camera_port {
 	ATOMISP_CAMERA_NR_PORTS
 };
 
-/* Flash modes. Default is off.
- * Setting a flash to TORCH or INDICATOR mode will automatically
- * turn it on. Setting it to FLASH mode will not turn on the flash
- * until the FLASH_STROBE command is sent. */
-enum atomisp_flash_mode {
-	ATOMISP_FLASH_MODE_OFF,
-	ATOMISP_FLASH_MODE_FLASH,
-	ATOMISP_FLASH_MODE_TORCH,
-	ATOMISP_FLASH_MODE_INDICATOR,
-};
-
-/* Flash statuses, used by atomisp driver to check before starting
- * flash and after having started flash. */
-enum atomisp_flash_status {
-	ATOMISP_FLASH_STATUS_OK,
-	ATOMISP_FLASH_STATUS_HW_ERROR,
-	ATOMISP_FLASH_STATUS_INTERRUPTED,
-	ATOMISP_FLASH_STATUS_TIMEOUT,
-};
-
 /* Frame status. This is used to detect corrupted frames and flash
  * exposed frames. Usually, the first 2 frames coming out of the sensor
  * are corrupted. When using flash, the frame before and the frame after
@@ -661,7 +641,6 @@ enum atomisp_ext_isp_id {
 	EXT_ISP_CID_AF_STATUS,
 	EXT_ISP_CID_GET_AF_MODE,
 	EXT_ISP_CID_CAPTURE_BURST,
-	EXT_ISP_CID_FLASH_MODE,
 	EXT_ISP_CID_ZOOM,
 	EXT_ISP_CID_SHOT_MODE
 };
@@ -694,12 +673,6 @@ enum atomisp_burst_capture_options {
 	EXT_ISP_BURST_CAPTURE_CTRL_STOP
 };
 
-#define EXT_ISP_FLASH_MODE_OFF		0
-#define EXT_ISP_FLASH_MODE_ON		1
-#define EXT_ISP_FLASH_MODE_AUTO		2
-#define EXT_ISP_LED_TORCH_OFF		3
-#define EXT_ISP_LED_TORCH_ON		4
-
 #define EXT_ISP_SHOT_MODE_AUTO		0
 #define EXT_ISP_SHOT_MODE_BEAUTY_FACE	1
 #define EXT_ISP_SHOT_MODE_BEST_PHOTO	2
@@ -894,18 +867,6 @@ enum atomisp_burst_capture_options {
  * Exposure, Flash and privacy (indicator) light controls, to be upstreamed */
 #define V4L2_CID_CAMERA_LASTP1             (V4L2_CID_CAMERA_CLASS_BASE + 1024)
 
-/* Flash related CIDs, see also:
- * http://linuxtv.org/downloads/v4l-dvb-apis/extended-controls.html\
- * #flash-controls */
-
-/* Request a number of flash-exposed frames. The frame status can be
- * found in the reserved field in the v4l2_buffer struct. */
-#define V4L2_CID_REQUEST_FLASH             (V4L2_CID_CAMERA_LASTP1 + 3)
-/* Query flash driver status. See enum atomisp_flash_status above. */
-#define V4L2_CID_FLASH_STATUS              (V4L2_CID_CAMERA_LASTP1 + 5)
-/* Set the flash mode (see enum atomisp_flash_mode) */
-#define V4L2_CID_FLASH_MODE                (V4L2_CID_CAMERA_LASTP1 + 10)
-
 #define V4L2_CID_RUN_MODE			(V4L2_CID_CAMERA_LASTP1 + 20)
 #define ATOMISP_RUN_MODE_VIDEO			1
 #define ATOMISP_RUN_MODE_STILL_CAPTURE		2
@@ -925,9 +886,6 @@ enum atomisp_burst_capture_options {
 #define ATOMISP_VFPP_DISABLE_SCALER		1
 #define ATOMISP_VFPP_DISABLE_LOWLAT		2
 
-/* Query real flash status register value */
-#define V4L2_CID_FLASH_STATUS_REGISTER  (V4L2_CID_CAMERA_LASTP1 + 26)
-
 #define V4L2_CID_START_ZSL_CAPTURE	(V4L2_CID_CAMERA_LASTP1 + 28)
 /* Lock and unlock raw buffer */
 #define V4L2_CID_ENABLE_RAW_BUFFER_LOCK (V4L2_CID_CAMERA_LASTP1 + 29)
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 63dd7236e3a8..8060db0e0c5f 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -111,7 +111,6 @@ enum atomisp_input_format {
 
 enum intel_v4l2_subdev_type {
 	RAW_CAMERA = 1,
-	LED_FLASH = 2,
 };
 
 struct intel_v4l2_subdev_id {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4505261a563f..f5a578a9c588 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -61,14 +61,6 @@
 #include "ia_css_debug.h"
 #include "bits.h"
 
-/* We should never need to run the flash for more than 2 frames.
- * At 15fps this means 133ms. We set the timeout a bit longer.
- * Each flash driver is supposed to set its own timeout, but
- * just in case someone else changed the timeout, we set it
- * here to make sure we don't damage the flash hardware.
- */
-#define FLASH_TIMEOUT 800 /* ms */
-
 union host {
 	struct {
 		void *kernel_ptr;
@@ -677,7 +669,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf_tmp, *md_iter;
 	enum atomisp_metadata_type md_type;
 	struct atomisp_device *isp = asd->isp;
-	struct v4l2_control ctrl;
 	int i, err;
 
 	lockdep_assert_held(&isp->mutex);
@@ -792,19 +783,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 		dev_dbg(isp->dev, "%s: vf frame with exp_id %d is ready\n",
 			__func__, frame->exp_id);
-		if (asd->params.flash_state == ATOMISP_FLASH_ONGOING) {
-			if (frame->flash_state
-			    == IA_CSS_FRAME_FLASH_STATE_PARTIAL)
-				dev_dbg(isp->dev, "%s thumb partially flashed\n",
-					__func__);
-			else if (frame->flash_state
-				 == IA_CSS_FRAME_FLASH_STATE_FULL)
-				dev_dbg(isp->dev, "%s thumb completely flashed\n",
-					__func__);
-			else
-				dev_dbg(isp->dev, "%s thumb no flash in this frame\n",
-					__func__);
-		}
 		pipe->frame_config_id[frame->vb.vb2_buf.index] = frame->isp_config_id;
 		break;
 	case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
@@ -835,40 +813,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		}
 
 		pipe->frame_config_id[i] = frame->isp_config_id;
-		ctrl.id = V4L2_CID_FLASH_MODE;
-		if (asd->params.flash_state == ATOMISP_FLASH_ONGOING) {
-			if (frame->flash_state == IA_CSS_FRAME_FLASH_STATE_PARTIAL) {
-				asd->frame_status[i] = ATOMISP_FRAME_STATUS_FLASH_PARTIAL;
-				dev_dbg(isp->dev, "%s partially flashed\n", __func__);
-			} else if (frame->flash_state == IA_CSS_FRAME_FLASH_STATE_FULL) {
-				asd->frame_status[i] = ATOMISP_FRAME_STATUS_FLASH_EXPOSED;
-				asd->params.num_flash_frames--;
-				dev_dbg(isp->dev, "%s completely flashed\n", __func__);
-			} else {
-				asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
-				dev_dbg(isp->dev, "%s no flash in this frame\n", __func__);
-			}
-
-			/* Check if flashing sequence is done */
-			if (asd->frame_status[i] == ATOMISP_FRAME_STATUS_FLASH_EXPOSED)
-				asd->params.flash_state = ATOMISP_FLASH_DONE;
-		} else if (isp->flash) {
-			if (v4l2_g_ctrl(isp->flash->ctrl_handler, &ctrl) == 0 &&
-			    ctrl.value == ATOMISP_FLASH_MODE_TORCH) {
-				ctrl.id = V4L2_CID_FLASH_TORCH_INTENSITY;
-				if (v4l2_g_ctrl(isp->flash->ctrl_handler, &ctrl) == 0 &&
-				    ctrl.value > 0)
-					asd->frame_status[i] = ATOMISP_FRAME_STATUS_FLASH_EXPOSED;
-				else
-					asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
-			} else {
-				asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
-			}
-		} else {
-			asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
-		}
-
-		asd->params.last_frame_status = asd->frame_status[i];
+		asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
 
 		if (asd->params.css_update_params_needed) {
 			atomisp_apply_css_parameters(asd,
@@ -1011,36 +956,6 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	mutex_unlock(&isp->mutex);
 }
 
-void atomisp_setup_flash(struct atomisp_sub_device *asd)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct v4l2_control ctrl;
-
-	if (!isp->flash)
-		return;
-
-	if (asd->params.flash_state != ATOMISP_FLASH_REQUESTED &&
-	    asd->params.flash_state != ATOMISP_FLASH_DONE)
-		return;
-
-	if (asd->params.num_flash_frames) {
-		/* make sure the timeout is set before setting flash mode */
-		ctrl.id = V4L2_CID_FLASH_TIMEOUT;
-		ctrl.value = FLASH_TIMEOUT;
-
-		if (v4l2_s_ctrl(NULL, isp->flash->ctrl_handler, &ctrl)) {
-			dev_err(isp->dev, "flash timeout configure failed\n");
-			return;
-		}
-
-		ia_css_stream_request_flash(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream);
-
-		asd->params.flash_state = ATOMISP_FLASH_ONGOING;
-	} else {
-		asd->params.flash_state = ATOMISP_FLASH_IDLE;
-	}
-}
-
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 {
 	struct atomisp_device *isp = isp_ptr;
@@ -1083,14 +998,8 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	 * time, instead, dequue one and process one, then another
 	 */
 	mutex_lock(&isp->mutex);
-	if (atomisp_css_isr_thread(isp))
-		goto out;
-
-	if (isp->asd.streaming)
-		atomisp_setup_flash(&isp->asd);
-out:
+	atomisp_css_isr_thread(isp);
 	mutex_unlock(&isp->mutex);
-	dev_dbg(isp->dev, "<%s\n", __func__);
 
 	return IRQ_HANDLED;
 }
@@ -4580,28 +4489,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-int atomisp_flash_enable(struct atomisp_sub_device *asd, int num_frames)
-{
-	struct atomisp_device *isp = asd->isp;
-
-	if (num_frames < 0) {
-		dev_dbg(isp->dev, "%s ERROR: num_frames: %d\n", __func__,
-			num_frames);
-		return -EINVAL;
-	}
-	/* a requested flash is still in progress. */
-	if (num_frames && asd->params.flash_state != ATOMISP_FLASH_IDLE) {
-		dev_dbg(isp->dev, "%s flash busy: %d frames left: %d\n",
-			__func__, asd->params.flash_state,
-			asd->params.num_flash_frames);
-		return -EBUSY;
-	}
-
-	asd->params.num_flash_frames = num_frames;
-	asd->params.flash_state = ATOMISP_FLASH_REQUESTED;
-	return 0;
-}
-
 static int __checking_exp_id(struct atomisp_sub_device *asd, int exp_id)
 {
 	struct atomisp_device *isp = asd->isp;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 03703eed86fa..e69ca14645b9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -58,7 +58,6 @@ void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
 void atomisp_msi_irq_init(struct atomisp_device *isp);
 void atomisp_msi_irq_uninit(struct atomisp_device *isp);
 void atomisp_assert_recovery_work(struct work_struct *work);
-void atomisp_setup_flash(struct atomisp_sub_device *asd);
 irqreturn_t atomisp_isr(int irq, void *dev);
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
 const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
@@ -262,9 +261,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 
 void atomisp_free_internal_buffers(struct atomisp_sub_device *asd);
 
-int  atomisp_flash_enable(struct atomisp_sub_device *asd,
-			  int num_frames);
-
 int atomisp_freq_scaling(struct atomisp_device *vdev,
 			 enum atomisp_dfs_mode mode,
 			 bool force);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index b464a6bd0bad..0d0c1649eaad 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -520,21 +520,12 @@ static int atomisp_open(struct file *file)
 	}
 
 	atomisp_dev_init_struct(isp);
-
-	ret = v4l2_subdev_call(isp->flash, core, s_power, 1);
-	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD) {
-		dev_err(isp->dev, "Failed to power-on flash\n");
-		goto css_error;
-	}
-
 	atomisp_subdev_init_struct(asd);
 
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
 	return 0;
 
-css_error:
-	pm_runtime_put(vdev->v4l2_dev->dev);
 error:
 	mutex_unlock(&isp->mutex);
 	v4l2_fh_release(file);
@@ -549,7 +540,6 @@ static int atomisp_release(struct file *file)
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct v4l2_subdev_fh fh;
 	struct v4l2_rect clear_compose = {0};
-	int ret;
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
@@ -584,10 +574,6 @@ static int atomisp_release(struct file *file)
 
 	atomisp_destroy_pipes_stream(asd);
 
-	ret = v4l2_subdev_call(isp->flash, core, s_power, 0);
-	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD)
-		dev_warn(isp->dev, "Failed to power-off flash\n");
-
 	if (pm_runtime_put_sync(vdev->v4l2_dev->dev) < 0)
 		dev_err(isp->dev, "Failed to power off device\n");
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 54ab872b91ee..d021c26aacd7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -200,7 +200,6 @@ struct atomisp_device {
 	struct v4l2_subdev *sensor_subdevs[ATOMISP_CAMERA_NR_PORTS];
 	unsigned int input_cnt;
 	struct atomisp_input_subdev inputs[ATOM_ISP_MAX_INPUTS];
-	struct v4l2_subdev *flash;
 
 	struct atomisp_regs saved_regs;
 	struct atomisp_css_env css_env;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8ef8cbc3b7a7..e243faec143e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -136,15 +136,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 		.step = 1,
 		.default_value = 0,
 	},
-	{
-		.id = V4L2_CID_REQUEST_FLASH,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Request flash frames",
-		.minimum = 0,
-		.maximum = 10,
-		.step = 1,
-		.default_value = 1,
-	},
 	{
 		.id = V4L2_CID_ATOMISP_LOW_LIGHT,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -956,12 +947,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	atomisp_qbuffers_to_css(asd);
 
-	if (isp->flash) {
-		asd->params.num_flash_frames = 0;
-		asd->params.flash_state = ATOMISP_FLASH_IDLE;
-		atomisp_setup_flash(asd);
-	}
-
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
 			       atomisp_css_valid_sof(isp));
 	atomisp_csi2_configure(asd);
@@ -1039,11 +1024,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	if (ret)
 		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
 
-	if (isp->flash) {
-		asd->params.num_flash_frames = 0;
-		asd->params.flash_state = ATOMISP_FLASH_IDLE;
-	}
-
 	/* Disable the CSI interface on ANN B0/K0 */
 	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
 					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
@@ -1165,9 +1145,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	case V4L2_CID_ATOMISP_FALSE_COLOR_CORRECTION:
 		ret = atomisp_false_color(asd, 1, &control->value);
 		break;
-	case V4L2_CID_REQUEST_FLASH:
-		ret = atomisp_flash_enable(asd, control->value);
-		break;
 	case V4L2_CID_ATOMISP_LOW_LIGHT:
 		ret = atomisp_low_light(asd, 1, &control->value);
 		break;
@@ -1212,7 +1189,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct v4l2_control ctrl;
 	int i;
 	int ret = 0;
@@ -1221,19 +1197,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
 		switch (ctrl.id) {
-		case V4L2_CID_FLASH_STATUS:
-		case V4L2_CID_FLASH_INTENSITY:
-		case V4L2_CID_FLASH_TORCH_INTENSITY:
-		case V4L2_CID_FLASH_INDICATOR_INTENSITY:
-		case V4L2_CID_FLASH_TIMEOUT:
-		case V4L2_CID_FLASH_STROBE:
-		case V4L2_CID_FLASH_MODE:
-		case V4L2_CID_FLASH_STATUS_REGISTER:
-			if (isp->flash)
-				ret =
-				    v4l2_g_ctrl(isp->flash->ctrl_handler,
-						&ctrl);
-			break;
 		case V4L2_CID_ZOOM_ABSOLUTE:
 			ret = atomisp_digital_zoom(asd, 0, &ctrl.value);
 			break;
@@ -1283,7 +1246,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct v4l2_control ctrl;
 	int i;
 	int ret = 0;
@@ -1294,29 +1256,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
 		switch (ctrl.id) {
-		case V4L2_CID_FLASH_STATUS:
-		case V4L2_CID_FLASH_INTENSITY:
-		case V4L2_CID_FLASH_TORCH_INTENSITY:
-		case V4L2_CID_FLASH_INDICATOR_INTENSITY:
-		case V4L2_CID_FLASH_TIMEOUT:
-		case V4L2_CID_FLASH_STROBE:
-		case V4L2_CID_FLASH_MODE:
-		case V4L2_CID_FLASH_STATUS_REGISTER:
-			if (isp->flash) {
-				ret =
-				    v4l2_s_ctrl(NULL, isp->flash->ctrl_handler,
-						&ctrl);
-				/*
-				 * When flash mode is changed we need to reset
-				 * flash state
-				 */
-				if (ctrl.id == V4L2_CID_FLASH_MODE) {
-					asd->params.flash_state =
-					    ATOMISP_FLASH_IDLE;
-					asd->params.num_flash_frames = 0;
-				}
-			}
-			break;
 		case V4L2_CID_ZOOM_ABSOLUTE:
 			ret = atomisp_digital_zoom(asd, 1, &ctrl.value);
 			break;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index bcfa829dbf61..4ab123a1c165 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -108,14 +108,6 @@ struct atomisp_pad_format {
 	struct v4l2_rect compose;
 };
 
-/* Internal states for flash process */
-enum atomisp_flash_state {
-	ATOMISP_FLASH_IDLE,
-	ATOMISP_FLASH_REQUESTED,
-	ATOMISP_FLASH_ONGOING,
-	ATOMISP_FLASH_DONE
-};
-
 /*
  * This structure is used to cache the CSS parameters, it aligns to
  * struct ia_css_isp_config but without un-supported and deprecated parts.
@@ -221,11 +213,6 @@ struct atomisp_subdev_params {
 	int  dvs_ver_proj_bytes;
 	int  dvs_hor_proj_bytes;
 
-	/* Flash */
-	int num_flash_frames;
-	enum atomisp_flash_state flash_state;
-	enum atomisp_frame_status last_frame_status;
-
 	/* Flag to check if driver needs to update params to css */
 	bool css_update_params_needed;
 };
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0069b547754d..4c3d55301089 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -825,13 +825,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			isp->sensor_lanes[mipi_port] = subdevs->lanes;
 			isp->sensor_subdevs[subdevs->port] = subdevs->subdev;
 			break;
-		case LED_FLASH:
-			if (isp->flash) {
-				dev_warn(isp->dev, "too many atomisp flash devices\n");
-				continue;
-			}
-			isp->flash = subdevs->subdev;
-			break;
 		default:
 			dev_dbg(isp->dev, "unknown subdev probed\n");
 			break;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 7ba464abf447..a26d9598e400 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -137,12 +137,6 @@ enum ia_css_frame_delay {
 	IA_CSS_FRAME_DELAY_2  /** Frame delay = 2 */
 };
 
-enum ia_css_frame_flash_state {
-	IA_CSS_FRAME_FLASH_STATE_NONE,
-	IA_CSS_FRAME_FLASH_STATE_PARTIAL,
-	IA_CSS_FRAME_FLASH_STATE_FULL
-};
-
 /* Frame structure. This structure describes an image buffer or frame.
  *  This is the main structure used for all input and output images.
  */
@@ -176,7 +170,6 @@ struct ia_css_frame {
 	 * binary, we use output port, but we expect VF_OUTPUT_DONE event
 	 */
 	enum ia_css_buffer_type buf_type;
-	enum ia_css_frame_flash_state flash_state;
 	unsigned int exp_id;
 	/** exposure id, see ia_css_event_public.h for more detail */
 	u32 isp_config_id; /** Unique ID to track which config was actually applied to a particular frame */
@@ -202,7 +195,6 @@ struct ia_css_frame {
 	.frame_info		= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
 	.dynamic_queue_id	= SH_CSS_INVALID_QUEUE_ID, \
 	.buf_type		= IA_CSS_BUFFER_TYPE_INVALID, \
-	.flash_state		= IA_CSS_FRAME_FLASH_STATE_NONE, \
 }
 
 /* @brief Allocate a CSS frame structure
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index 888f54d8495e..961c61288083 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -457,20 +457,6 @@ ia_css_stream_send_input_embedded_line(const struct ia_css_stream *stream,
 void
 ia_css_stream_end_input_frame(const struct ia_css_stream *stream);
 
-/* @brief send a request flash command to SP
- *
- * @param[in]	stream The stream.
- * @return	None
- *
- * Driver needs to call this function to send a flash request command
- * to SP, SP will be responsible for switching on/off the flash at proper
- * time. Due to the SP multi-threading environment, this request may have
- * one-frame delay, the driver needs to check the flashed flag in frame info
- * to determine which frame is being flashed.
- */
-void
-ia_css_stream_request_flash(struct ia_css_stream *stream);
-
 /* @brief Configure a stream with filter coefficients.
  *	   @deprecated {Replaced by
  *				   ia_css_pipe_set_isp_config_on_pipe()}
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 22c8cdcb2eb8..6520a35b6e47 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2834,7 +2834,6 @@ init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
 	assert(vf_frame);
 
 	sh_css_pipe_get_viewfinder_frame_info(pipe, &vf_frame->frame_info, idx);
-	vf_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME + idx, thread_id, &queue_id);
 	vf_frame->dynamic_queue_id = queue_id;
@@ -3012,7 +3011,6 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 	in_frame->frame_info.raw_bit_depth = ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	ia_css_frame_info_set_width(&in_frame->frame_info,
 				    pipe->stream->config.input_config.input_res.width, 0);
-	in_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
 	in_frame->dynamic_queue_id = queue_id;
@@ -3040,7 +3038,6 @@ init_out_frameinfo_defaults(struct ia_css_pipe *pipe,
 	assert(out_frame);
 
 	sh_css_pipe_get_output_frame_info(pipe, &out_frame->frame_info, idx);
-	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME + idx, thread_id, &queue_id);
 	out_frame->dynamic_queue_id = queue_id;
@@ -3821,12 +3818,6 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 				buffer->exp_id = ddr_buffer.payload.frame.exp_id;
 				frame->exp_id = ddr_buffer.payload.frame.exp_id;
 				frame->isp_config_id = ddr_buffer.payload.frame.isp_parameters_id;
-				if (ddr_buffer.payload.frame.flashed == 1)
-					frame->flash_state =
-					    IA_CSS_FRAME_FLASH_STATE_PARTIAL;
-				if (ddr_buffer.payload.frame.flashed == 2)
-					frame->flash_state =
-					    IA_CSS_FRAME_FLASH_STATE_FULL;
 				frame->valid = pipe->num_invalid_frames == 0;
 				if (!frame->valid)
 					pipe->num_invalid_frames--;
@@ -6788,8 +6779,6 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 	ia_css_pipeline_clean(me);
 
 	/* Construct out_frame info */
-	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
-
 	if (copy_on_sp(pipe) &&
 	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {
 		ia_css_frame_info_init(&out_frame->frame_info, JPEG_BYTES, 1,
@@ -6837,7 +6826,6 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
 	err = sh_css_pipe_get_output_frame_info(pipe, &out_frame->frame_info, 0);
 	if (err)
 		return err;
-	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, thread_id, &queue_id);
 	out_frame->dynamic_queue_id = queue_id;
@@ -7492,27 +7480,6 @@ int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
 	return return_err;
 }
 
-void ia_css_stream_request_flash(struct ia_css_stream *stream)
-{
-	(void)stream;
-
-	assert(stream);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_stream_request_flash() enter: void\n");
-
-	if (!IS_ISP2401 || sh_css_sp_is_running()) {
-		if (!sh_css_write_host2sp_command(host2sp_cmd_start_flash) && IS_ISP2401) {
-			IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
-			ia_css_debug_dump_sp_sw_debug_info();
-		}
-	} else {
-		IA_CSS_LOG("SP is not running!");
-	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_stream_request_flash() leave: return_void\n");
-}
-
 static void
 sh_css_init_host_sp_control_vars(void)
 {
-- 
2.44.0


