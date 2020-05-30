Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF561E928C
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgE3QPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 12:15:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729120AbgE3QPW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 12:15:22 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C7F120723;
        Sat, 30 May 2020 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590855321;
        bh=37P7kqby3DwugGCnBxPwG/FDXfKi4/8s0+kgpYwehvQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hWih19aEqfPa8HHQiueiO+AaLYKBrrX4hX4fKtm2gwBjtUaSa1p0usnCb4nbXtPov
         nY/ChMRC0HLEyavYQO34P7mF0LP4JOeWfLLndUKedDk/BolSZ6U6x7iNZeOClgLsme
         UdoVV9ldgOZc+GGOVXJz0kTwfcRHkQIV6HGPaG0U=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jf48k-002rjc-Ti; Sat, 30 May 2020 18:15:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: atomisp: re-enable warnings again
Date:   Sat, 30 May 2020 18:15:15 +0200
Message-Id: <c6b14473bd7841827fee18a6322c82b9b350db42.1590855313.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <00469a56c0f88554b58892486df55ebfcfb80618.1590855313.git.mchehab+huawei@kernel.org>
References: <00469a56c0f88554b58892486df55ebfcfb80618.1590855313.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For most warnings, the current code is OK. There are still
some issues with implicit-fallthough warnings.

Solve those and re-enable all warnings for this driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile        |  9 -----
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  7 ++--
 .../media/atomisp/pci/atomisp_compat_css20.c  | 35 ++++++++++---------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  4 +--
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  2 ++
 drivers/staging/media/atomisp/pci/sh_css.c    |  1 +
 .../media/atomisp/pci/sh_css_firmware.c       |  1 +
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  2 ++
 8 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1ed410d83f40..0b62020f9b8b 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -344,12 +344,3 @@ DEFINES += -DISP2400 -DSYSTEM_hive_isp_css_2400_system
 endif
 
 ccflags-y += $(INCLUDES) $(DEFINES) -fno-common
-
-# HACK! While this driver is in bad shape, don't enable several warnings
-#       that would be otherwise enabled with W=1
-ccflags-y += $(call cc-disable-warning, implicit-fallthrough)
-ccflags-y += $(call cc-disable-warning, missing-prototypes)
-ccflags-y += $(call cc-disable-warning, missing-declarations)
-ccflags-y += $(call cc-disable-warning, suggest-attribute=format)
-ccflags-y += $(call cc-disable-warning, unused-const-variable)
-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index cea3c1bcefa9..d06173b62b99 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4967,13 +4967,14 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 {
 	switch (port) {
 	case ATOMISP_CAMERA_PORT_PRIMARY:
-				return MIPI_PORT0_ID;
+		return MIPI_PORT0_ID;
 	case ATOMISP_CAMERA_PORT_SECONDARY:
 		return MIPI_PORT1_ID;
 	case ATOMISP_CAMERA_PORT_TERTIARY:
-		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID)
+		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID) {
 			return MIPI_PORT1_ID + 1;
-	/* go through down for else case */
+		}
+	/* fall through */
 	default:
 		dev_err(isp->dev, "unsupported port: %d\n", port);
 		return MIPI_PORT0_ID;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 4a7331d15f41..b67503a77f29 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -690,22 +690,23 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 	case ATOMISP_RUN_MODE_STILL_CAPTURE:
 		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE)
 			return true;
-		else
-			return false;
+
+		return false;
 	case ATOMISP_RUN_MODE_PREVIEW:
 		if (!asd->continuous_mode->val) {
 			if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
 				return true;
-			else
-				return false;
+
+			return false;
 		}
-	/* fall through to ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE */
+	/* fall-through */
 	case ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE:
 		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
 		    pipe_id == IA_CSS_PIPE_ID_PREVIEW)
 			return true;
-		else
-			return false;
+
+		return false;
+	/* fall-through */
 	case ATOMISP_RUN_MODE_VIDEO:
 		if (!asd->continuous_mode->val) {
 			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
@@ -714,13 +715,13 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 			else
 				return false;
 		}
-	/* fall through to ATOMISP_RUN_MODE_SDV */
+	/* fall through  */
 	case ATOMISP_RUN_MODE_SDV:
 		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
 		    pipe_id == IA_CSS_PIPE_ID_VIDEO)
 			return true;
-		else
-			return false;
+
+		return false;
 	}
 
 	return false;
@@ -2749,16 +2750,18 @@ static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd,
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO
 		    || asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER)
 			return IA_CSS_PIPE_ID_VIDEO;
-		else
-			return IA_CSS_PIPE_ID_CAPTURE;
+
+		return IA_CSS_PIPE_ID_CAPTURE;
 	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE:
 		if (asd->copy_mode)
 			return IA_CSS_PIPE_ID_COPY;
+
 		return IA_CSS_PIPE_ID_CAPTURE;
 	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
-		if (!atomisp_is_mbuscode_raw(
-			asd->fmt[asd->capture_pad].fmt.code))
+		if (!atomisp_is_mbuscode_raw(asd->fmt[asd->capture_pad].fmt.code)) {
 			return IA_CSS_PIPE_ID_CAPTURE;
+		}
+		/* fall through */
 	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
 		if (asd->yuvpp_mode)
 			return IA_CSS_PIPE_ID_YUVPP;
@@ -2766,8 +2769,8 @@ static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd,
 			return IA_CSS_PIPE_ID_COPY;
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
 			return IA_CSS_PIPE_ID_VIDEO;
-		else
-			return IA_CSS_PIPE_ID_PREVIEW;
+
+		return IA_CSS_PIPE_ID_PREVIEW;
 	}
 	dev_warn(isp->dev,
 		 "invalid source pad:%d, return default preview pipe index.\n",
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index e886c8f0c561..094a2886bd62 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1156,9 +1156,9 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 
 		switch (subdevs->type) {
 		case RAW_CAMERA:
-			raw_index = isp->input_cnt;
 			dev_dbg(isp->dev, "raw_index: %d\n", raw_index);
-			/* pass-though */
+			raw_index = isp->input_cnt;
+			/* fall through */
 		case SOC_CAMERA:
 			dev_dbg(isp->dev, "SOC_INDEX: %d\n", isp->input_cnt);
 			if (isp->input_cnt >= ATOM_ISP_MAX_INPUTS) {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 4bd7014d01c9..76d6e52b7af9 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -660,6 +660,8 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 				break;
 			}
 
+			/* fall through */
+
 		/*
 		 * if dynamic memory pool doesn't exist, need to free
 		 * pages to system directly.
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 63a5a7b65783..e193caa5628f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4513,6 +4513,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 #endif
 					pipe->stop_requested = false;
 				}
+				/* fall through */
 			case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
 				frame = (struct ia_css_frame *)HOST_ADDRESS(ddr_buffer.kernel_ptr);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 7774a5f8ab8e..83e034a77e26 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -314,6 +314,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 				"binary #%-2d type %s: %s\n",
 				i, fw_type_name[bd.header.type],
 				bd.name);
+			break;
 		default:
 			if (bd.header.info.isp.type > IA_CSS_ACC_STANDALONE) {
 				dev_err(dev,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 0afc083ea751..70c64cc4e2ed 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1184,12 +1184,14 @@ sp_init_sp_stage(struct ia_css_pipeline_stage *stage,
 		break;
 	case IA_CSS_PIPELINE_BIN_COPY:
 		assert(false); /* TBI */
+		break;
 	case IA_CSS_PIPELINE_ISYS_COPY:
 		sh_css_sp_start_isys_copy(args->out_frame[0],
 					  pipe_num, stage->max_input_width, if_config_index);
 		break;
 	case IA_CSS_PIPELINE_NO_FUNC:
 		assert(false);
+		break;
 	}
 }
 
-- 
2.26.2

