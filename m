Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D62B1E936B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 21:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgE3TcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 15:32:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729098AbgE3TcM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 15:32:12 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CCD4207BB;
        Sat, 30 May 2020 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590867131;
        bh=qUKmliLwa+aNFmOOGsewxi/GcqiuXjA61eiN1XNA1uc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mhnd+zlJj2Bc1qhNlEkvI+QtLIJHbLowK3gTvvb7RBrfmX5fw974bACn0f+YnaHHk
         ryt6hOeWIJTD3b2y4rV+y+QfO3YMlBKBcaoDwhFhmv/DhFLBBL4klm6jEvXDNiuqI9
         9yrwGGye8bz7LPBQusMgHOT6CgZI1UUBtUQXQi/0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jf7DF-003LJ8-AF; Sat, 30 May 2020 21:32:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeremy Sowden <jeremy@azazel.net>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH 1/2] staging: media: atomisp: fix stack overflow in init_pipe_defaults()
Date:   Sat, 30 May 2020 21:32:07 +0200
Message-Id: <998be18f43c17b201495b3df427a40520398c44e.1590866796.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590866796.git.mchehab+huawei@kernel.org>
References: <cover.1590866796.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When building with clang, multiple copies of the structures to be
initialized are passed around on the stack and copied locally, using an
insane amount of stack space:

drivers/staging/media/atomisp/pci/sh_css.c:2371:1: error: stack frame size of 26864 bytes in function 'create_pipe' [-Werror,-Wframe-larger-than=]

Use constantly-allocated variables plus an explicit memcpy()
to avoid that.

Fixes: 6dc9a2568f84 ("media: atomisp: convert default struct values to use compound-literals with designated initializers")
Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/ia_css_frame_public.h   |  6 ++---
 .../staging/media/atomisp/pci/ia_css_pipe.h   | 15 ++++-------
 .../media/atomisp/pci/ia_css_pipe_public.h    |  6 ++---
 .../staging/media/atomisp/pci/ia_css_types.h  |  6 ++---
 .../sdis/common/ia_css_sdis_common_types.h    |  9 +++----
 .../runtime/binary/interface/ia_css_binary.h  |  3 +--
 .../pipeline/interface/ia_css_pipeline.h      |  3 +--
 .../pci/runtime/pipeline/src/pipeline.c       | 13 ++++++---
 drivers/staging/media/atomisp/pci/sh_css.c    | 27 +++++++++++++------
 9 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index d822aa235ffe..96c86f0dc81c 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -122,8 +122,7 @@ struct ia_css_frame_info {
 	struct ia_css_crop_info crop_info;
 };
 
-#define IA_CSS_BINARY_DEFAULT_FRAME_INFO \
-(struct ia_css_frame_info) { \
+#define IA_CSS_BINARY_DEFAULT_FRAME_INFO { \
 	.format			= IA_CSS_FRAME_FORMAT_NUM,  \
 	.raw_bayer_order	= IA_CSS_BAYER_ORDER_NUM, \
 }
@@ -185,8 +184,7 @@ struct ia_css_frame {
 		       info.format */
 };
 
-#define DEFAULT_FRAME \
-(struct ia_css_frame) { \
+#define DEFAULT_FRAME { \
 	.info			= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
 	.dynamic_queue_id	= SH_CSS_INVALID_QUEUE_ID, \
 	.buf_type		= IA_CSS_BUFFER_TYPE_INVALID, \
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe.h b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
index 9c0c4ccf4571..bb0abf9bffb1 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
@@ -40,8 +40,7 @@ struct ia_css_preview_settings {
 	struct ia_css_pipe *acc_pipe;
 };
 
-#define IA_CSS_DEFAULT_PREVIEW_SETTINGS \
-(struct ia_css_preview_settings) { \
+#define IA_CSS_DEFAULT_PREVIEW_SETTINGS { \
 	.copy_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
 	.preview_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
 	.vf_pp_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
@@ -65,8 +64,7 @@ struct ia_css_capture_settings {
 	unsigned int num_yuv_scaler;
 };
 
-#define IA_CSS_DEFAULT_CAPTURE_SETTINGS \
-(struct ia_css_capture_settings) { \
+#define IA_CSS_DEFAULT_CAPTURE_SETTINGS { \
 	.copy_binary		= IA_CSS_BINARY_DEFAULT_SETTINGS, \
 	.primary_binary		= {IA_CSS_BINARY_DEFAULT_SETTINGS}, \
 	.pre_isp_binary		= IA_CSS_BINARY_DEFAULT_SETTINGS, \
@@ -91,8 +89,7 @@ struct ia_css_video_settings {
 	unsigned int num_yuv_scaler;
 };
 
-#define IA_CSS_DEFAULT_VIDEO_SETTINGS \
-(struct ia_css_video_settings) { \
+#define IA_CSS_DEFAULT_VIDEO_SETTINGS { \
 	.copy_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
 	.video_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
 	.vf_pp_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
@@ -108,8 +105,7 @@ struct ia_css_yuvpp_settings {
 	unsigned int num_output;
 };
 
-#define IA_CSS_DEFAULT_YUVPP_SETTINGS \
-(struct ia_css_yuvpp_settings) { \
+#define IA_CSS_DEFAULT_YUVPP_SETTINGS { \
 	.copy_binary	= IA_CSS_BINARY_DEFAULT_SETTINGS, \
 }
 
@@ -157,8 +153,7 @@ struct ia_css_pipe {
 	unsigned int pipe_num;
 };
 
-#define IA_CSS_DEFAULT_PIPE \
-(struct ia_css_pipe) { \
+#define IA_CSS_DEFAULT_PIPE { \
 	.config			= DEFAULT_PIPE_CONFIG, \
 	.info			= DEFAULT_PIPE_INFO, \
 	.mode			= IA_CSS_PIPE_ID_ACC, /* (pipe_id) */ \
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 17b0941382bf..4affd21f9e3f 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -149,8 +149,7 @@ struct ia_css_pipe_config {
 /**
  * Default settings for newly created pipe configurations.
  */
-#define DEFAULT_PIPE_CONFIG \
-(struct ia_css_pipe_config) { \
+#define DEFAULT_PIPE_CONFIG { \
 	.mode			= IA_CSS_PIPE_MODE_PREVIEW, \
 	.isp_pipe_version	= 1, \
 	.output_info		= {IA_CSS_BINARY_DEFAULT_FRAME_INFO}, \
@@ -203,8 +202,7 @@ struct ia_css_pipe_info {
 /**
  * Defaults for ia_css_pipe_info structs.
  */
-#define DEFAULT_PIPE_INFO \
-(struct ia_css_pipe_info) { \
+#define DEFAULT_PIPE_INFO {\
 	.output_info		= {IA_CSS_BINARY_DEFAULT_FRAME_INFO}, \
 	.vf_output_info		= {IA_CSS_BINARY_DEFAULT_FRAME_INFO}, \
 	.raw_output_info	= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index bac0a41add92..6e34d401f9df 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -392,8 +392,7 @@ struct ia_css_grid_info {
 };
 
 /* defaults for ia_css_grid_info structs */
-#define DEFAULT_GRID_INFO \
-(struct ia_css_grid_info) { \
+#define DEFAULT_GRID_INFO { \
 	.dvs_grid	= DEFAULT_DVS_GRID_INFO, \
 	.vamem_type	= IA_CSS_VAMEM_TYPE_1 \
 }
@@ -485,8 +484,7 @@ struct ia_css_capture_config {
 };
 
 /* default settings for ia_css_capture_config structs */
-#define DEFAULT_CAPTURE_CONFIG \
-(struct ia_css_capture_config) { \
+#define DEFAULT_CAPTURE_CONFIG { \
 	.mode	= IA_CSS_CAPTURE_MODE_PRIMARY, \
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
index c92f5836059b..c2ec30b4abd4 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/common/ia_css_sdis_common_types.h
@@ -197,12 +197,11 @@ struct ia_css_dvs_stat_grid_info {
 
 /* DVS statistics generated by accelerator default grid info
  */
-#define DEFAULT_DVS_GRID_INFO \
-(union ia_css_dvs_grid_u) { \
-	.dvs_stat_grid_info = (struct ia_css_dvs_stat_grid_info) { \
+#define DEFAULT_DVS_GRID_INFO { \
+	.dvs_stat_grid_info = { \
 		.fe_roi_cfg = { \
-			[1] = (struct dvs_stat_public_dvs_level_fe_roi_cfg) { \
-				.x_start = 4 \
+			[1] = { \
+			    .x_start = 4 \
 			} \
 		} \
 	} \
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
index 560580023b29..b44099dbdacd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
@@ -144,8 +144,7 @@ struct ia_css_binary {
 	struct ia_css_isp_param_css_segments  css_params;
 };
 
-#define IA_CSS_BINARY_DEFAULT_SETTINGS \
-(struct ia_css_binary) { \
+#define IA_CSS_BINARY_DEFAULT_SETTINGS { \
 	.input_format		= ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY, \
 	.in_frame_info		= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
 	.internal_frame_info	= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 1f4afd163ffa..18a7d18e197e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -57,8 +57,7 @@ struct ia_css_pipeline {
 	u32 pipe_qos_config;
 };
 
-#define DEFAULT_PIPELINE \
-(struct ia_css_pipeline) { \
+#define DEFAULT_PIPELINE { \
 	.pipe_id		= IA_CSS_PIPE_ID_PREVIEW, \
 	.in_frame		= DEFAULT_FRAME, \
 	.out_frame		= {DEFAULT_FRAME}, \
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 29207fe120a0..4b8e85bc2122 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -665,6 +665,8 @@ static int pipeline_stage_create(
 	return err;
 }
 
+static const struct ia_css_frame ia_css_default_frame = DEFAULT_FRAME;
+
 static void pipeline_init_defaults(
     struct ia_css_pipeline *pipeline,
     enum ia_css_pipe_id pipe_id,
@@ -677,10 +679,15 @@ static void pipeline_init_defaults(
 	pipeline->stages = NULL;
 	pipeline->stop_requested = false;
 	pipeline->current_stage = NULL;
-	pipeline->in_frame = DEFAULT_FRAME;
+
+	memcpy(&pipeline->in_frame, &ia_css_default_frame,
+	       sizeof(ia_css_default_frame));
+
 	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
-		pipeline->out_frame[i] = DEFAULT_FRAME;
-		pipeline->vf_frame[i] = DEFAULT_FRAME;
+		memcpy(&pipeline->out_frame[i], &ia_css_default_frame,
+		       sizeof(ia_css_default_frame));
+		memcpy(&pipeline->vf_frame[i], &ia_css_default_frame,
+		       sizeof(ia_css_default_frame));
 	}
 	pipeline->num_execs = -1;
 	pipeline->acquire_isp_each_stage = true;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 31a13a486b70..9c754e29fa00 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2231,10 +2231,17 @@ create_host_pipeline(struct ia_css_stream *stream) {
 	return err;
 }
 
+static const struct ia_css_pipe default_pipe = IA_CSS_DEFAULT_PIPE;
+static const struct ia_css_preview_settings preview = IA_CSS_DEFAULT_PREVIEW_SETTINGS;
+static const struct ia_css_capture_settings capture = IA_CSS_DEFAULT_CAPTURE_SETTINGS;
+static const struct ia_css_video_settings video = IA_CSS_DEFAULT_VIDEO_SETTINGS;
+static const struct ia_css_yuvpp_settings yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
+
 static int
 init_pipe_defaults(enum ia_css_pipe_mode mode,
 		   struct ia_css_pipe *pipe,
 		   bool copy_pipe) {
+
 	if (!pipe)
 	{
 		IA_CSS_ERROR("NULL pipe parameter");
@@ -2242,14 +2249,14 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 	}
 
 	/* Initialize pipe to pre-defined defaults */
-	*pipe = IA_CSS_DEFAULT_PIPE;
+	memcpy(pipe, &default_pipe, sizeof(default_pipe));
 
 	/* TODO: JB should not be needed, but temporary backward reference */
 	switch (mode)
 	{
 	case IA_CSS_PIPE_MODE_PREVIEW:
 		pipe->mode = IA_CSS_PIPE_ID_PREVIEW;
-		pipe->pipe_settings.preview = IA_CSS_DEFAULT_PREVIEW_SETTINGS;
+		memcpy(&pipe->pipe_settings.preview, &preview, sizeof(preview));
 		break;
 	case IA_CSS_PIPE_MODE_CAPTURE:
 		if (copy_pipe) {
@@ -2257,11 +2264,11 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 		} else {
 			pipe->mode = IA_CSS_PIPE_ID_CAPTURE;
 		}
-		pipe->pipe_settings.capture = IA_CSS_DEFAULT_CAPTURE_SETTINGS;
+		memcpy(&pipe->pipe_settings.capture, &capture, sizeof(capture));
 		break;
 	case IA_CSS_PIPE_MODE_VIDEO:
 		pipe->mode = IA_CSS_PIPE_ID_VIDEO;
-		pipe->pipe_settings.video = IA_CSS_DEFAULT_VIDEO_SETTINGS;
+		memcpy(&pipe->pipe_settings.video, &video, sizeof(video));
 		break;
 	case IA_CSS_PIPE_MODE_ACC:
 		pipe->mode = IA_CSS_PIPE_ID_ACC;
@@ -2271,7 +2278,7 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 		break;
 	case IA_CSS_PIPE_MODE_YUVPP:
 		pipe->mode = IA_CSS_PIPE_ID_YUVPP;
-		pipe->pipe_settings.yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
+		memcpy(&pipe->pipe_settings.yuvpp, &yuvpp, sizeof(yuvpp));
 		break;
 	default:
 		return -EINVAL;
@@ -8769,12 +8776,16 @@ sh_css_init_host_sp_control_vars(void) {
 }
 
 /*
-    * create the internal structures and fill in the configuration data
-    */
+ * create the internal structures and fill in the configuration data
+ */
+
+static const struct
+ia_css_pipe_config ia_css_pipe_default_config = DEFAULT_PIPE_CONFIG;
+
 void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_config_defaults()\n");
-	*pipe_config = DEFAULT_PIPE_CONFIG;
+	memcpy(pipe_config, &ia_css_pipe_default_config, sizeof(*pipe_config));
 }
 
 void
-- 
2.26.2

