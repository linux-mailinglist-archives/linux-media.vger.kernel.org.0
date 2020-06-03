Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0C91EC9E4
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgFCHBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgFCHBJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F6E920825;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=ffQDclY7fPHBFMiDyc6RfSFePnuYMi2H7FwMzARx+dY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RVwz8RKAOU0t1UXdj50t1PImHU/zbcIKXMLctEML2nz5iO3K54UgThyKDQ1RP4LUi
         UXmXR5yVGjRAEZLLsIo5jf093mRSw1dYZzk4EgCaSsIy4qprC3DYLpAQ9ec9gbB+0O
         gItnEgR0laTeAXcHePzdD4Av+ASecsBgE3L9SJJs=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8p-Jb; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] media: atomisp: change the detection of ISP2401 at runtime
Date:   Wed,  3 Jun 2020 09:00:57 +0200
Message-Id: <ba654564cf57a01893fd1cd5527a7fd444314398.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of having a static var to detect it, let's use the
already-existing arch-specific bytes, as this is how other
parts of the code also checks when it needs to do something
different, depending on an specific chipset version.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/include/linux/atomisp.h     |  3 --
 .../atomisp/include/linux/atomisp_platform.h  | 11 ++++-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 48 +++++++++----------
 .../media/atomisp/pci/atomisp_common.h        |  4 --
 .../media/atomisp/pci/atomisp_compat_css20.c  | 14 +++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 28 +++++------
 .../media/atomisp/pci/atomisp_subdev.c        |  2 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 17 ++-----
 .../pci/camera/pipe/src/pipe_binarydesc.c     |  4 +-
 .../atomisp/pci/runtime/binary/src/binary.c   |  4 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  8 ++--
 drivers/staging/media/atomisp/pci/sh_css.c    | 40 ++++++++--------
 .../media/atomisp/pci/sh_css_firmware.c       |  4 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |  8 ++--
 .../staging/media/atomisp/pci/sh_css_params.c | 22 ++++-----
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  2 +-
 .../media/atomisp/pci/sh_css_version.c        |  3 +-
 17 files changed, 108 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 6a6aa45fa550..9803a2b2e132 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -70,9 +70,6 @@
 #define V4L2_MBUS_FMT_CUSTOM_M10MO_RAW	0x800b
 #endif
 
-/* FIXME: for now, let's use a boolean to identify the type of atomisp chipset */
-extern bool atomisp_hw_is_isp2401;
-
 /* Configuration used by Bayer noise reduction and YCC noise reduction */
 struct atomisp_nr_config {
 	/* [gain] Strength of noise reduction for Bayer NR (Used by Bayer NR) */
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 395d7c022ad1..873344a02ccf 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -19,6 +19,7 @@
 #define ATOMISP_PLATFORM_H_
 
 #include <asm/intel-family.h>
+#include <asm/processor.h>
 
 #include <linux/i2c.h>
 #include <linux/sfi.h>
@@ -240,11 +241,19 @@ const struct atomisp_camera_caps *atomisp_get_default_camera_caps(void);
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
 		     boot_cpu_data.x86 == 6 &&                       \
-		     boot_cpu_data.x86_model == x)
+		     boot_cpu_data.x86_model == (x))
+#define __IS_SOCS(x,y) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
+		        boot_cpu_data.x86 == 6 &&                       \
+		        (boot_cpu_data.x86_model == (x) || \
+		         boot_cpu_data.x86_model == (y)))
 
 #define IS_MFLD	__IS_SOC(INTEL_FAM6_ATOM_SALTWELL_MID)
 #define IS_BYT	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT)
 #define IS_CHT	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT)
 #define IS_MOFD	__IS_SOC(INTEL_FAM6_ATOM_AIRMONT_MID)
 
+/* Both CHT and MOFD come with ISP2401 */
+#define IS_ISP2401 __IS_SOCS(INTEL_FAM6_ATOM_AIRMONT, \
+			     INTEL_FAM6_ATOM_AIRMONT_MID)
+
 #endif /* ATOMISP_PLATFORM_H_ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 875dd3ce6e48..4252d3d37649 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -989,7 +989,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		break;
 	case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
-		if (atomisp_hw_is_isp2401)
+		if (IS_ISP2401)
 			reset_wdt_timer = true;
 
 		pipe->buffers_in_css--;
@@ -1038,18 +1038,18 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 			asd->pending_capture_request--;
 
-			if (atomisp_hw_is_isp2401)
+			if (IS_ISP2401)
 				asd->re_trigger_capture = false;
 
 			dev_dbg(isp->dev, "Trigger capture again for new buffer. err=%d\n",
 				err);
-		} else if (atomisp_hw_is_isp2401) {
+		} else if (IS_ISP2401) {
 			asd->re_trigger_capture = true;
 		}
 		break;
 	case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-		if (atomisp_hw_is_isp2401)
+		if (IS_ISP2401)
 			reset_wdt_timer = true;
 
 		pipe->buffers_in_css--;
@@ -1219,7 +1219,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		 */
 		wake_up(&vb->done);
 	}
-	if (atomisp_hw_is_isp2401)
+	if (IS_ISP2401)
 		atomic_set(&pipe->wdt_count, 0);
 
 	/*
@@ -1239,7 +1239,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	if (!error && q_buffers)
 		atomisp_qbuffers_to_css(asd);
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		/* If there are no buffers queued then
 		* delete wdt timer. */
 		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
@@ -1475,7 +1475,7 @@ void atomisp_wdt_work(struct work_struct *work)
 		return;
 	}
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		dev_err(isp->dev, "timeout %d of %d\n",
 			atomic_read(&isp->wdt_count) + 1,
 			ATOMISP_ISP_MAX_TIMEOUT_COUNT);
@@ -1598,11 +1598,11 @@ void atomisp_wdt_work(struct work_struct *work)
 				atomisp_flush_bufs_and_wakeup(asd);
 				complete(&asd->init_done);
 			}
-			if (atomisp_hw_is_isp2401)
+			if (IS_ISP2401)
 				atomisp_wdt_stop(asd, false);
 		}
 
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			atomic_set(&isp->wdt_count, 0);
 		} else {
 			isp->isp_fatal_error = true;
@@ -1614,7 +1614,7 @@ void atomisp_wdt_work(struct work_struct *work)
 	}
 
 	__atomisp_css_recover(isp, true);
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		for (i = 0; i < isp->num_of_streams; i++) {
 			struct atomisp_sub_device *asd = &isp->asd[i];
 
@@ -1671,7 +1671,7 @@ void atomisp_wdt(struct timer_list *t)
 	struct atomisp_sub_device *asd;
 	struct atomisp_device *isp;
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		asd = from_timer(asd, t, wdt);
 		isp = asd->isp;
 	} else {
@@ -1730,7 +1730,7 @@ void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
 
 void atomisp_wdt_refresh(struct atomisp_sub_device *asd, unsigned int delay)
 {
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		unsigned long next;
 
 		if (delay != ATOMISP_WDT_KEEP_CURRENT_DELAY)
@@ -1793,7 +1793,7 @@ void atomisp_wdt_stop(struct atomisp_sub_device *asd, bool sync)
 {
 	dev_dbg(asd->isp->dev, "WDT stop:\n");
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (sync) {
 			del_timer_sync(&asd->wdt);
 			cancel_work_sync(&asd->isp->wdt_work);
@@ -3014,7 +3014,7 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	 * map real crop region base on above calculating base max crop region.
 	 */
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
 						  * eff_res.width
 						  / asd->sensor_array_res.width;
@@ -3584,7 +3584,7 @@ int atomisp_cp_lsc_table(struct atomisp_sub_device *asd,
 	if (!from_user && css_param->update_flag.shading_table)
 		return 0;
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		if (copy_from_compatible(&dest_st, source_st,
 					sizeof(struct atomisp_shading_table),
 					from_user)) {
@@ -3617,7 +3617,7 @@ int atomisp_cp_lsc_table(struct atomisp_sub_device *asd,
 	}
 
 	/* Shading table size per color */
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (st->width > ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
 		    st->height > ISP2400_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR) {
 			dev_err(asd->isp->dev, "shading table w/h validate failed!");
@@ -3700,7 +3700,7 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 	if (!from_user && css_param->update_flag.dvs2_coefs)
 		return 0;
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
@@ -3843,7 +3843,7 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 	old_6axis_config = css_param->dvs_6axis;
 	dvs_6axis_config = old_6axis_config;
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		struct ia_css_dvs_6axis_config t_6axis_config;
 
 		if (copy_from_compatible(&t_6axis_config, source_6axis_config,
@@ -3978,7 +3978,7 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 	old_morph_table = css_param->morph_table;
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		struct ia_css_morph_table mtbl;
 
 		if (copy_from_compatible(&mtbl, source_morph_table,
@@ -4168,7 +4168,7 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 
 	atomisp_qbuffers_to_css(asd);
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (!atomisp_is_wdt_running(asd) && atomisp_buffers_queued(asd))
 			atomisp_wdt_start(asd);
 	} else {
@@ -4204,7 +4204,7 @@ int atomisp_set_parameters(struct video_device *vdev,
 		__func__, arg->per_frame_setting, asd->index,
 		arg->isp_config_id, vdev->name);
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		if (atomisp_is_vf_pipe(pipe) && arg->per_frame_setting) {
 			dev_err(asd->isp->dev, "%s: vf pipe not support per_frame_setting",
 				__func__);
@@ -5070,7 +5070,7 @@ static int __enable_continuous_mode(struct atomisp_sub_device *asd,
 		enable, asd->continuous_raw_buffer_size->val,
 		!asd->continuous_viewfinder->val);
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_PRIMARY);
 	else
 		atomisp_update_capture_mode(asd);
@@ -5961,7 +5961,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		 * which appears to be related by a hardware
 		 * performance limitation.  It's unclear why this
 		 * particular code triggers the issue. */
-		if (!atomisp_hw_is_isp2401 || crop_needs_override) {
+		if (!IS_ISP2401 || crop_needs_override) {
 			if (isp_sink_crop.width * main_compose.height >
 			    isp_sink_crop.height * main_compose.width) {
 				sink_crop.height = isp_sink_crop.height;
@@ -6107,7 +6107,7 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	}
 
 	/* Shading table size per color */
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (user_shading_table->width > ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
 		    user_shading_table->height > ISP2400_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR)
 			return -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index d47de6731d6a..b29874f2bc0f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -44,10 +44,6 @@ extern int pad_h;
 /* ISP2401 */
 #define ATOMISP_CSS_ISP_PIPE_VERSION_2_7    1
 
-#define IS_ISP2401(isp)							\
-	(((isp)->media_dev.hw_revision & ATOMISP_HW_REVISION_MASK)	\
-	 >= (ATOMISP_HW_REVISION_ISP2401_LEGACY << ATOMISP_HW_REVISION_SHIFT))
-
 struct atomisp_format_bridge {
 	unsigned int pixelformat;
 	unsigned int depth;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index b08f50e01044..71914d364ad9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -612,7 +612,7 @@ static void __apply_additional_pipe_config(
 		    default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW)
 			stream_env->pipe_configs[pipe_id].enable_dz = false;
 
-		if (atomisp_hw_is_isp2401) {
+		if (IS_ISP2401) {
 			/* the isp default to use ISP2.2 and the camera hal will
 			* control whether use isp2.7 */
 			if (asd->select_isp_version->val == ATOMISP_CSS_ISP_PIPE_VERSION_2_7)
@@ -4159,7 +4159,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			for (i = 0; i < isp->num_of_streams; i++)
 				atomisp_wdt_stop(&isp->asd[i], 0);
 
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				atomisp_wdt(&isp->asd[0].wdt);
 			else
 				queue_work(isp->wdt_work_queue, &isp->wdt_work);
@@ -4193,7 +4193,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			atomisp_buf_done(asd, 0, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				reset_wdt_timer[asd->index] = true; /* ISP running */
 
 			break;
@@ -4203,7 +4203,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			atomisp_buf_done(asd, 0, IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				reset_wdt_timer[asd->index] = true; /* ISP running */
 
 			break;
@@ -4227,7 +4227,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 					 IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
 
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				reset_wdt_timer[asd->index] = true; /* ISP running */
 
 			break;
@@ -4236,7 +4236,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			atomisp_buf_done(asd, 0,
 					 IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				reset_wdt_timer[asd->index] = true; /* ISP running */
 
 			break;
@@ -4262,7 +4262,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 		}
 	}
 
-	if (atomisp_hw_is_isp2401)
+	if (IS_ISP2401)
 		return 0;
 
 	/* ISP2400: If there are no buffers queued then delete wdt timer. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 4abb1462a44d..0a76f388b38b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -582,7 +582,7 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	 * ioctl is the only way to enum inputs + possible external actuators
 	 * for 3A tuning purpose.
 	 */
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		motor = isp->inputs[index].motor;
 	else
 		motor = isp->motor;
@@ -732,7 +732,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		goto error;
 	}
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		motor = isp->inputs[input].motor;
 	} else {
 		motor = isp->motor;
@@ -1264,7 +1264,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		} else {
 			atomisp_qbuffers_to_css(asd);
 
-			if (!atomisp_hw_is_isp2401) {
+			if (!IS_ISP2401) {
 				if (!atomisp_is_wdt_running(asd) && atomisp_buffers_queued(asd))
 					atomisp_wdt_start(asd);
 			} else {
@@ -1288,7 +1288,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	    pipe->capq.streaming &&
 	    !asd->enable_raw_buffer_lock->val &&
 	    asd->params.offline_parm.num_captures == 1) {
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			asd->pending_capture_request++;
 			dev_dbg(isp->dev, "Add one pending capture request.\n");
 		} else {
@@ -1687,7 +1687,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 	/* Reset pending capture request count. */
 	asd->pending_capture_request = 0;
-	if (atomisp_hw_is_isp2401)
+	if (IS_ISP2401)
 		asd->re_trigger_capture = false;
 
 	if ((atomisp_subdev_streaming_count(asd) > sensor_start_stream) &&
@@ -1828,7 +1828,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 			dev_err(isp->dev, "master slave sensor stream on failed!\n");
 			goto out;
 		}
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			__wdt_on_master_slave_sensor(isp, wdt_duration);
 		} else {
 			__wdt_on_master_slave_sensor_pipe(pipe, wdt_duration, true);
@@ -1836,7 +1836,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		goto start_delay_wq;
 	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
 					    ATOMISP_DEPTH_SENSOR_STREAMON_COUNT)) {
-		if (atomisp_hw_is_isp2401)
+		if (IS_ISP2401)
 			__wdt_on_master_slave_sensor_pipe(pipe, wdt_duration, false);
 		goto start_delay_wq;
 	}
@@ -1858,7 +1858,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		goto out;
 	}
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (atomisp_buffers_queued(asd))
 			atomisp_wdt_refresh(asd, wdt_duration);
 	} else {
@@ -2317,7 +2317,7 @@ static int atomisp_queryctl(struct file *file, void *fh,
 	case V4L2_CID_FOCUS_ABSOLUTE:
 	case V4L2_CID_FOCUS_RELATIVE:
 	case V4L2_CID_FOCUS_STATUS:
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			return v4l2_queryctrl(isp->inputs[asd->input_curr].camera->
 					    ctrl_handler, qc);
 		}
@@ -2358,7 +2358,7 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
 		motor = isp->motor;
@@ -2467,7 +2467,7 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
 		motor = isp->motor;
@@ -2696,7 +2696,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	else
 		asd = atomisp_to_video_pipe(vdev)->asd;
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
 		motor = isp->motor;
@@ -2721,7 +2721,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	}
 	switch (cmd) {
 	case ATOMISP_IOC_S_SENSOR_RUNMODE:
-		if (atomisp_hw_is_isp2401)
+		if (IS_ISP2401)
 			err = atomisp_set_sensor_runmode(asd, arg);
 		else
 			err = -EINVAL;
@@ -2896,7 +2896,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 				       core, ioctl, cmd, arg);
 		break;
 	case ATOMISP_IOC_G_UPDATE_EXPOSURE:
-		if (atomisp_hw_is_isp2401)
+		if (IS_ISP2401)
 			err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 					       core, ioctl, cmd, arg);
 		else
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 7bc8083a2fb5..6ba817f15655 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1222,7 +1222,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
 				 &ctrl_disable_dz,
 				 NULL);
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		asd->select_isp_version = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 							       &ctrl_select_isp_version,
 							       NULL);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 64e2386f328f..158f11f4f545 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -124,11 +124,6 @@ MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
  * be to replace this to something stored inside atomisp allocated
  * structures.
  */
-bool atomisp_hw_is_isp2401;
-
-/* Types of atomisp hardware */
-#define HW_IS_ISP2400 0
-#define HW_IS_ISP2401 1
 
 struct device *atomisp_dev;
 
@@ -1465,21 +1460,17 @@ static bool is_valid_device(struct pci_dev *dev,
 	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
 	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
 		a0_max_id = ATOMISP_PCI_REV_MRFLD_A0_MAX;
-		atomisp_hw_is_isp2401 = false;
 		name = "Merrifield";
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_BYT:
 		a0_max_id = ATOMISP_PCI_REV_BYT_A0_MAX;
-		atomisp_hw_is_isp2401 = false;
 		name = "Baytrail";
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_ANN:
 		name = "Anniedale";
-		atomisp_hw_is_isp2401 = true;
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_CHT:
 		name = "Cherrytrail";
-		atomisp_hw_is_isp2401 = true;
 		break;
 	default:
 		dev_err(&dev->dev, "%s: unknown device ID %x04:%x04\n",
@@ -1499,13 +1490,13 @@ static bool is_valid_device(struct pci_dev *dev,
 	 */
 
 #if defined(ISP2400)
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		dev_err(&dev->dev, "Support for %s (ISP2401) was disabled at compile time\n",
 			name);
 		return false;
 	}
 #else
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		dev_err(&dev->dev, "Support for %s (ISP2400) was disabled at compile time\n",
 			name);
 		return false;
@@ -1514,7 +1505,7 @@ static bool is_valid_device(struct pci_dev *dev,
 
 	dev_info(&dev->dev, "Detected %s version %d (ISP240%c) on %s\n",
 		name, dev->revision,
-		atomisp_hw_is_isp2401 ? '1' : '0',
+		IS_ISP2401 ? '1' : '0',
 		product);
 
 	return true;
@@ -1536,7 +1527,7 @@ static int init_atomisp_wdts(struct atomisp_device *isp)
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
-		if (!atomisp_hw_is_isp2401)
+		if (!IS_ISP2401)
 			timer_setup(&asd->wdt, atomisp_wdt, 0);
 		else {
 			timer_setup(&asd->video_out_capture.wdt,
diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
index 70ccd2a36330..f20c9b02fbe0 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
@@ -608,7 +608,7 @@ void ia_css_pipe_get_primary_binarydesc(
 		 * since it has better performance. */
 		if (pipe_version == IA_CSS_PIPE_VERSION_2_6_1)
 			prim_descr->striped = false;
-		else if (!atomisp_hw_is_isp2401) {
+		else if (!IS_ISP2401) {
 			prim_descr->striped = prim_descr->continuous &&
 					      (!pipe->stream->stop_copy_preview || !pipe->stream->disable_cont_vf);
 		} else {
@@ -849,7 +849,7 @@ void ia_css_pipe_get_ldc_binarydesc(
 	assert(out_info);
 	IA_CSS_ENTER_PRIVATE("");
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		*in_info = *out_info;
 	} else {
 		if (pipe->out_yuv_ds_input_info.res.width)
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 4e0d067ceb3d..9813014c3fd3 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1342,7 +1342,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 
 	if (info->enable.sc)
 	{
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			binary->sctbl_width_per_color = _ISP2400_SCTBL_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
 			binary->sctbl_aligned_width_per_color = ISP2400_SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
 			binary->sctbl_height = _ISP2400_SCTBL_HEIGHT(sc_3a_dis_height, s3a_log_deci);
@@ -1358,7 +1358,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		binary->sctbl_width_per_color         = 0;
 		binary->sctbl_aligned_width_per_color = 0;
 		binary->sctbl_height                  = 0;
-		if (atomisp_hw_is_isp2401) {
+		if (IS_ISP2401) {
 			binary->sctbl_legacy_width_per_color  = 0;
 			binary->sctbl_legacy_height	      = 0;
 		}
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 543359d200af..f64d8243400b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -3087,7 +3087,7 @@ ia_css_debug_dump_pipe_config(
 				     "capt_pp_in_res");
 	ia_css_debug_dump_resolution(&config->vf_pp_in_res, "vf_pp_in_res");
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		ia_css_debug_dump_resolution(&config->output_system_in_res,
 					    "output_system_in_res");
 	}
@@ -3315,7 +3315,7 @@ static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
 		return;
 	}
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		tmp = ia_css_device_load_uint32(start_addr);
 		point_num = (tmp >> 16) & 0xFFFF;
 
@@ -3349,7 +3349,7 @@ static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
 		if ((limit == (-1)) && (trace_read_buf[i] == 0))
 			limit = i;
 	}
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "Status:\n");
 		for (i = 0; i < SH_CSS_MAX_SP_THREADS; i++)
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -3382,7 +3382,7 @@ static void debug_dump_one_trace(enum TRACE_CORE_ID proc_id)
 	for (i = 0; i < point_num; i++) {
 		j = (limit + i) % point_num;
 		if (trace_read_buf[j]) {
-			if (!atomisp_hw_is_isp2401) {
+			if (!IS_ISP2401) {
 				TRACE_DUMP_FORMAT dump_format = FIELD_FORMAT_UNPACK(trace_read_buf[j]);
 			} else {
 				tid_val = FIELD_TID_UNPACK(trace_read_buf[j]);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index a722b886b2f5..bf8f147df5bb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -584,7 +584,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 		vblank_cycles = vblank_lines * (width + hblank_cycles);
 		sh_css_sp_configure_sync_gen(width, height, hblank_cycles,
 					     vblank_cycles);
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG) {
 				/* TODO: move define to proper file in tools */
 				ia_css_device_store_uint32(GP_ISEL_TPG_MODE, 0);
@@ -1471,7 +1471,7 @@ static void start_pipe(
 
 	assert(me); /* all callers are in this file and call with non null argument */
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		coord = &me->config.internal_frame_origin_bqs_on_sctbl;
 		params = me->stream->isp_params_configs;
 	}
@@ -2938,7 +2938,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	if (err)
 		return err;
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		/* The delay latency determines the number of invalid frames after
 		* a stream is started. */
 		pipe->num_invalid_frames = pipe->dvs_frame_delay;
@@ -3009,7 +3009,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	 * where the driver chooses for memory based input frames. In these cases, a copy binary (which typical
 	 * copies sensor data to DDR) does not have much use.
 	 */
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		need_isp_copy_binary = !online && !continuous;
 	else
 		need_isp_copy_binary = !online && !continuous && !(pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY);
@@ -4028,7 +4028,7 @@ preview_start(struct ia_css_pipe *pipe) {
 		}
 	}
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		coord = &pipe->config.internal_frame_origin_bqs_on_sctbl;
 		params = pipe->stream->isp_params_configs;
 	}
@@ -5725,7 +5725,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 
 		tnr_info = mycs->video_binary.out_frame_info[0];
 
-		if (atomisp_hw_is_isp2401) {
+		if (IS_ISP2401) {
 			/* Select resolution for TNR. If
 			* output_system_in_resolution(GDC_out_resolution) is
 			* being used, then select that as it will also be in resolution for
@@ -5846,7 +5846,7 @@ static int video_start(struct ia_css_pipe *pipe)
 		}
 	}
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		coord = &pipe->config.internal_frame_origin_bqs_on_sctbl;
 		params = pipe->stream->isp_params_configs;
 	}
@@ -6004,7 +6004,7 @@ static bool need_capture_pp(
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE);
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		/* ldc and capture_pp are not supported in the same pipeline */
 		if (need_capt_ldc(pipe) == true)
 			return false;
@@ -6212,7 +6212,7 @@ static int load_primary_binaries(
 
 	/* TODO Do we disable ldc for skycam */
 	need_ldc = need_capt_ldc(pipe);
-	if (atomisp_hw_is_isp2401 && need_ldc) {
+	if (IS_ISP2401 && need_ldc) {
 		/* ldc and capt_pp are not supported in the same pipeline */
 		struct ia_css_binary_descr capt_ldc_descr;
 
@@ -6235,7 +6235,7 @@ static int load_primary_binaries(
 	if (need_pp) {
 		struct ia_css_binary_descr capture_pp_descr;
 
-		if (!atomisp_hw_is_isp2401)
+		if (!IS_ISP2401)
 			capt_pp_in_info = need_ldc ? &capt_ldc_out_info : &prim_out_info;
 		else
 			capt_pp_in_info = &prim_out_info;
@@ -9556,7 +9556,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			    effective_res.height);
 	}
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		for (i = 0; i < num_pipes; i++) {
 			if (pipes[i]->config.mode != IA_CSS_PIPE_MODE_ACC &&
 			    pipes[i]->config.mode != IA_CSS_PIPE_MODE_COPY) {
@@ -9610,7 +9610,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			curr_stream->cont_capt = true;
 			curr_stream->disable_cont_vf = curr_stream->config.disable_cont_viewfinder;
 
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				curr_stream->stop_copy_preview = my_css.stop_copy_preview;
 		}
 
@@ -9670,7 +9670,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		/* set current stream */
 		curr_pipe->stream = curr_stream;
 
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			/* take over effective info */
 
 			effective_res = curr_pipe->config.input_effective_res;
@@ -9705,11 +9705,11 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				goto ERR;
 		}
 
-		if (atomisp_hw_is_isp2401)
+		if (IS_ISP2401)
 			pipe_info->output_system_in_res_info = curr_pipe->config.output_system_in_res;
 
 		if (!spcopyonly) {
-			if (!atomisp_hw_is_isp2401)
+			if (!IS_ISP2401)
 				err = sh_css_pipe_get_shading_info(curr_pipe,
 								    &pipe_info->shading_info, NULL);
 			else
@@ -9834,7 +9834,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 			}
 		}
 		free_mpi = stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
-		if (atomisp_hw_is_isp2401) {
+		if (IS_ISP2401) {
 			free_mpi |= stream->config.mode == IA_CSS_INPUT_MODE_TPG;
 			free_mpi |= stream->config.mode == IA_CSS_INPUT_MODE_PRBS;
 		}
@@ -9932,7 +9932,7 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
     */
 int
 ia_css_stream_load(struct ia_css_stream *stream) {
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		int i;
 		int err;
 
@@ -10058,7 +10058,7 @@ ia_css_stream_stop(struct ia_css_stream *stream) {
 	}
 #endif
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		err = ia_css_pipeline_request_stop(&stream->last_pipe->pipeline);
 	} else {
 		err = sh_css_pipes_stop(stream);
@@ -10080,7 +10080,7 @@ ia_css_stream_has_stopped(struct ia_css_stream *stream) {
 
 	assert(stream);
 
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		stopped = ia_css_pipeline_has_stopped(&stream->last_pipe->pipeline);
 	} else {
 		stopped = sh_css_pipes_have_stopped(stream);
@@ -10426,7 +10426,7 @@ ia_css_stop_sp(void) {
 	}
 
 	/* For now, stop whole SP */
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		sh_css_write_host2sp_command(host2sp_cmd_terminate);
 	} else {
 		if (!sh_css_write_host2sp_command(host2sp_cmd_terminate))
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 83e034a77e26..d464052a3d2d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -189,7 +189,7 @@ sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 
 	const char *release_version;
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		release_version = isp2400_release_version;
 	else
 		release_version = isp2401_release_version;
@@ -230,7 +230,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	int ret;
 	const char *release_version;
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		release_version = isp2400_release_version;
 	else
 		release_version = isp2401_release_version;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 6a73424acfa1..2ef5dbd62a6d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -391,7 +391,7 @@ calculate_mipi_buff_size(
 
 static bool buffers_needed(struct ia_css_pipe *pipe)
 {
-	if (!atomisp_hw_is_isp2401) {
+	if (!IS_ISP2401) {
 		if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
 			return false;
 		else
@@ -445,7 +445,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return 0; /* AM TODO: Check  */
 	}
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		port = (unsigned int)pipe->stream->config.source.port.port;
 	else
 		err = ia_css_mipi_is_source_port_valid(pipe, &port);
@@ -594,7 +594,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 			return err;
 		}
 
-		if (!atomisp_hw_is_isp2401)
+		if (!IS_ISP2401)
 			port = (unsigned int)pipe->stream->config.source.port.port;
 		else
 			err = ia_css_mipi_is_source_port_valid(pipe, &port);
@@ -710,7 +710,7 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 		/* TODO: AM: maybe this should be returning an error. */
 	}
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		port = (unsigned int)pipe->stream->config.source.port.port;
 	else
 		err = ia_css_mipi_is_source_port_valid(pipe, &port);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 1a799f659198..ba42be9b06eb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2161,7 +2161,7 @@ ia_css_set_param_exceptions(const struct ia_css_pipe *pipe,
 	params->dp_config.b  = params->wb_config.b;
 	params->dp_config.gb = params->wb_config.gb;
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		assert(pipe);
 		assert(pipe->mode < IA_CSS_PIPE_ID_NUM);
 
@@ -2630,7 +2630,7 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 	 * before (NORM+OBC) or after. The folllowing code to set the
 	 * DPC configuration should be updated when this interface is made
 	 * available */
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		sh_css_set_dp_config(pipe, params, config->dp_config);
 		ia_css_set_param_exceptions(pipe, params);
 	}
@@ -2651,7 +2651,7 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 		goto exit;
 	}
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		ia_css_set_param_exceptions(pipe, params);
 
 exit:
@@ -3069,7 +3069,7 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 		ia_css_set_ob_config(params, &default_ob_config);
 		ia_css_set_dp_config(params, &default_dp_config);
 
-		if (!atomisp_hw_is_isp2401) {
+		if (!IS_ISP2401) {
 			ia_css_set_param_exceptions(pipe_in, params);
 		} else {
 			for (i = 0; i < stream->num_pipes; i++) {
@@ -3196,7 +3196,7 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 				retval = false;
 				goto exit;
 			}
-			if (atomisp_hw_is_isp2401) {
+			if (IS_ISP2401) {
 				if (stream->pipes[i]->mode < IA_CSS_PIPE_ID_NUM) {
 					sh_css_set_dp_config(stream->pipes[i], params,
 							    &stream_params->pipe_dp_config[stream->pipes[i]->mode]);
@@ -3208,7 +3208,7 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 			}
 		}
 
-		if (!atomisp_hw_is_isp2401)
+		if (!IS_ISP2401)
 			ia_css_set_param_exceptions(pipe_in, params);
 
 		params->fpn_config.data = stream_params->fpn_config.data;
@@ -3362,7 +3362,7 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 	pipe->scaler_pp_lut = mmgr_NULL;
 
 	if (!stream_started) {
-		if (!atomisp_hw_is_isp2401)
+		if (!IS_ISP2401)
 			pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 		else
 			pipe->scaler_pp_lut = sh_css_params_alloc_gdc_lut();
@@ -3407,7 +3407,7 @@ int sh_css_params_map_and_store_default_gdc_lut(void)
 
 	host_lut_store((void *)zoom_table);
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		default_gdc_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 	else
 		default_gdc_lut = sh_css_params_alloc_gdc_lut();
@@ -4020,7 +4020,7 @@ sh_css_params_write_to_ddr_internal(
 		u32 enable_conv;
 		size_t bytes;
 
-		if (!atomisp_hw_is_isp2401)
+		if (!IS_ISP2401)
 			bytes = ISP2400_SCTBL_BYTES(binary);
 		else
 			bytes = ISP2401_SCTBL_BYTES(binary);
@@ -4117,7 +4117,7 @@ sh_css_params_write_to_ddr_internal(
 	/* DPC configuration is made pipe specific to allow flexibility in positioning of the
 	 * DPC kernel. The code below sets the pipe specific configuration to
 	 * individual binaries. */
-	if (atomisp_hw_is_isp2401 &&
+	if (IS_ISP2401 &&
 	    params->pipe_dpc_config_changed[pipe_id] && binary->info->sp.enable.dpc)
 	{
 		unsigned int size   =
@@ -4220,7 +4220,7 @@ sh_css_params_write_to_ddr_internal(
 			if (!params->pipe_dvs_6axis_config[pipe_id]) {
 				struct ia_css_resolution dvs_offset = {0};
 
-				if (!atomisp_hw_is_isp2401) {
+				if (!IS_ISP2401) {
 					dvs_offset.width = (PIX_SHIFT_FILTER_RUN_IN_X + binary->dvs_envelope.width) / 2;
 				} else {
 					if (binary->dvs_envelope.width || binary->dvs_envelope.height) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 70c64cc4e2ed..756aad4a6e43 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1343,7 +1343,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	}
 #endif
 
-	if (atomisp_hw_is_isp2401) {
+	if (IS_ISP2401) {
 		/* For the shading correction type 1 (the legacy shading table conversion in css is not used),
 		* the parameters are passed to the isp for the shading table centering.
 		*/
diff --git a/drivers/staging/media/atomisp/pci/sh_css_version.c b/drivers/staging/media/atomisp/pci/sh_css_version.c
index c9d5c02c4571..3ef690d6f2cf 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_version.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_version.c
@@ -14,6 +14,7 @@
  */
 
 #include "../../include/linux/atomisp.h"
+#include "../../include/linux/atomisp_platform.h"
 #include "ia_css_version.h"
 #include "ia_css_version_data.h"
 #include "ia_css_err.h"
@@ -23,7 +24,7 @@ int
 ia_css_get_version(char *version, int max_size) {
 	char *css_version;
 
-	if (!atomisp_hw_is_isp2401)
+	if (!IS_ISP2401)
 		css_version = ISP2400_CSS_VERSION_STRING;
 	else
 		css_version = ISP2401_CSS_VERSION_STRING;
-- 
2.26.2

