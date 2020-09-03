Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBFB25C3B8
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgICO5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:57:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729167AbgICOK2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 10:10:28 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1882E208FE;
        Thu,  3 Sep 2020 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599141456;
        bh=ffupJWwXcthhtAVAOnjxO8uAsxy1+vRiYUe9PMYB2GA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZIv1Iwqj8At45/rCpRbKORXXwc0PPG/BurkdCcf9ofRkCi+8D2/XvHtSOfFh+XKf+
         sgIOIsJ4pd543yd+fadPaNXnF/fez1RYkzeL1yn1TY9dPPasYH0PZMcH2QLTaKeMDd
         OnWvdC987nmcDOAhku2B/RLo/c4WhZBHz64Pivjw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDpk6-004T6p-5S; Thu, 03 Sep 2020 15:57:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] media: atomisp: get rid of unused vars
Date:   Thu,  3 Sep 2020 15:57:30 +0200
Message-Id: <7f4a9613771b517a77547a040dbd97a7030848a0.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several vars declared and set but unused:

	drivers/staging/media/atomisp//pci/sh_css_param_shading.c:239:4: warning: variable ‘padded_width’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:1366:24: warning: variable ‘stream’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:2702:22: warning: variable ‘capture_pipe’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:2831:7: warning: variable ‘continuous’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:3534:15: warning: variable ‘num_output_pins’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:3937:55: warning: variable ‘vf_pp_binary’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:3937:38: warning: variable ‘preview_binary’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:3937:24: warning: variable ‘copy_binary’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:3936:26: warning: variable ‘me’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:5749:24: warning: variable ‘copy_binary’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:6013:7: warning: variable ‘continuous’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:6012:7: warning: variable ‘memory’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:7329:24: warning: variable ‘copy_binary’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:7459:26: warning: variable ‘num_vf_pp_stage’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css.c:10420:22: warning: variable ‘pipe_id’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css_params.c:1099:36: warning: variable ‘row_padding’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/sh_css_mipi.c:410:27: warning: variable ‘mipi_intermediate_info’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/atomisp_cmd.c:2814:31: warning: variable ‘stream_config’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/atomisp_cmd.c:2893:31: warning: variable ‘stream_config’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c:237:31: warning: variable ‘isp_data_ptr’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:119:28: warning: variable ‘ver_num_isp’ set but not used [-Wunused-but-set-variable]
	drivers/staging/media/atomisp//pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:119:15: warning: variable ‘hor_num_isp’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  6 ---
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  3 --
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  3 --
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  4 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 47 ++-----------------
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 12 -----
 .../media/atomisp/pci/sh_css_param_shading.c  | 25 +++-------
 .../staging/media/atomisp/pci/sh_css_params.c |  3 +-
 8 files changed, 14 insertions(+), 89 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 391c4acbd5b2..a1772bbc3042 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2811,7 +2811,6 @@ int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
 			 struct atomisp_metadata *md)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct ia_css_stream_config *stream_config;
 	struct ia_css_stream_info *stream_info;
 	struct camera_mipi_info *mipi_info;
 	struct atomisp_metadata_buf *md_buf;
@@ -2821,8 +2820,6 @@ int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
 	if (flag != 0)
 		return -EINVAL;
 
-	stream_config = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
-			stream_config;
 	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		      stream_info;
 
@@ -2890,7 +2887,6 @@ int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
 				 struct atomisp_metadata_with_type *md)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct ia_css_stream_config *stream_config;
 	struct ia_css_stream_info *stream_info;
 	struct camera_mipi_info *mipi_info;
 	struct atomisp_metadata_buf *md_buf;
@@ -2900,8 +2896,6 @@ int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
 	if (flag != 0)
 		return -EINVAL;
 
-	stream_config = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
-			stream_config;
 	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		      stream_info;
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index b8b71791466f..67f5540b48b5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -234,7 +234,6 @@ convert_allocate_dvs_6axis_config(
 	unsigned int o_width;
 	unsigned int o_height;
 	struct ia_css_host_data *me;
-	struct gdc_warp_param_mem_s *isp_data_ptr;
 
 	assert(binary);
 	assert(dvs_6axis_config);
@@ -249,8 +248,6 @@ convert_allocate_dvs_6axis_config(
 	assert((dvs_in_frame_info->format == IA_CSS_FRAME_FORMAT_NV12)
 	       || (dvs_in_frame_info->format == IA_CSS_FRAME_FORMAT_YUV420));
 
-	isp_data_ptr = (struct gdc_warp_param_mem_s *)me->address;
-
 	i_stride  = dvs_in_frame_info->padded_width;
 
 	o_width  = binary->out_frame_info[0].res.width;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index 7922198f6784..f608740e8340 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -116,7 +116,6 @@ void ia_css_get_isp_dvs2_coefficients(
 {
 	struct ia_css_isp_parameters *params;
 	unsigned int hor_num_3a, ver_num_3a;
-	unsigned int hor_num_isp, ver_num_isp;
 	struct ia_css_binary *dvs_binary;
 
 	IA_CSS_ENTER("void");
@@ -140,8 +139,6 @@ void ia_css_get_isp_dvs2_coefficients(
 
 	hor_num_3a  = dvs_binary->dis.coef.dim.width;
 	ver_num_3a  = dvs_binary->dis.coef.dim.height;
-	hor_num_isp = dvs_binary->dis.coef.pad.width;
-	ver_num_isp = dvs_binary->dis.coef.pad.height;
 
 	memcpy(hor_coefs_odd_real,  params->dvs2_coefs.hor_coefs.odd_real,
 	       hor_num_3a * sizeof(short));
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 1ea74296fc8d..b4f53be18e7f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -241,7 +241,6 @@ void rmgr_pop_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		     struct ia_css_rmgr_vbuf_handle **handle)
 {
 	u32 i;
-	bool succes = false;
 
 	assert(pool);
 	assert(pool->recycle);
@@ -255,8 +254,7 @@ void rmgr_pop_handle(struct ia_css_rmgr_vbuf_pool *pool,
 			pool->handles[i] = NULL;
 			/* dont release, we are returning it...
 			   ia_css_rmgr_refcount_release_vbuf(handle); */
-			succes = true;
-			break;
+			return;
 		}
 	}
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 2fb817e3d756..e7a7257b9be2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1363,16 +1363,10 @@ static void
 start_binary(struct ia_css_pipe *pipe,
 	     struct ia_css_binary *binary)
 {
-	struct ia_css_stream *stream;
-
 	assert(pipe);
 	/* Acceleration uses firmware, the binary thus can be NULL */
 	/* assert(binary != NULL); */
 
-	(void)binary;
-
-	stream = pipe->stream;
-
 	if (binary)
 		sh_css_metrics_start_binary(&binary->metrics);
 
@@ -2699,7 +2693,6 @@ alloc_continuous_frames(
 	bool continuous;
 	unsigned int i, idx;
 	unsigned int num_frames;
-	struct ia_css_pipe *capture_pipe = NULL;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p, init_time = %d", pipe, init_time);
 
@@ -2761,17 +2754,12 @@ alloc_continuous_frames(
 	}
 
 	/* Write format back to binary */
-	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-	{
+	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW) {
 		pipe->pipe_settings.preview.preview_binary.in_frame_info.format =
 		    ref_info.format;
-		capture_pipe = pipe->pipe_settings.preview.capture_pipe;
-	} else if (pipe_id == IA_CSS_PIPE_ID_VIDEO)
-	{
+	} else if (pipe_id == IA_CSS_PIPE_ID_VIDEO) {
 		pipe->pipe_settings.video.video_binary.in_frame_info.format = ref_info.format;
-		capture_pipe = pipe->pipe_settings.video.capture_pipe;
-	} else
-	{
+	} else {
 		/* should not happen */
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
@@ -2828,7 +2816,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	struct ia_css_binary_descr preview_descr;
 	bool online;
 	int err = 0;
-	bool continuous, need_vf_pp = false;
+	bool need_vf_pp = false;
 	bool need_isp_copy_binary = false;
 #ifdef ISP2401
 	bool sensor = false;
@@ -2843,7 +2831,6 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	assert(pipe->mode == IA_CSS_PIPE_ID_PREVIEW);
 
 	online = pipe->stream->config.online;
-	continuous = pipe->stream->config.continuous;
 #ifdef ISP2401
 	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 #endif
@@ -3531,7 +3518,6 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 	bool need_copy   = false;
 	bool need_vf_pp  = false;
 	bool need_yuv_pp = false;
-	unsigned int num_output_pins;
 	bool need_in_frameinfo_memory = false;
 
 	unsigned int i, num_yuv_scaler;
@@ -3588,7 +3574,6 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 	copy_binary  = &pipe->pipe_settings.video.copy_binary;
 	video_binary = &pipe->pipe_settings.video.video_binary;
 	vf_pp_binary = &pipe->pipe_settings.video.vf_pp_binary;
-	num_output_pins = video_binary->info->num_output_pins;
 
 	yuv_scaler_binary = pipe->pipe_settings.video.yuv_scaler_binary;
 	num_yuv_scaler  = pipe->pipe_settings.video.num_yuv_scaler;
@@ -3933,8 +3918,6 @@ static void send_raw_frames(struct ia_css_pipe *pipe)
 
 static int
 preview_start(struct ia_css_pipe *pipe) {
-	struct ia_css_pipeline *me;
-	struct ia_css_binary *copy_binary, *preview_binary, *vf_pp_binary = NULL;
 	int err = 0;
 	struct ia_css_pipe *copy_pipe, *capture_pipe;
 	struct ia_css_pipe *acc_pipe;
@@ -3950,19 +3933,12 @@ preview_start(struct ia_css_pipe *pipe) {
 		return -EINVAL;
 	}
 
-	me = &pipe->pipeline;
-
 	preview_pipe_input_mode = pipe->stream->config.mode;
 
 	copy_pipe    = pipe->pipe_settings.preview.copy_pipe;
 	capture_pipe = pipe->pipe_settings.preview.capture_pipe;
 	acc_pipe     = pipe->pipe_settings.preview.acc_pipe;
 
-	copy_binary    = &pipe->pipe_settings.preview.copy_binary;
-	preview_binary = &pipe->pipe_settings.preview.preview_binary;
-	if (pipe->pipe_settings.preview.vf_pp_binary.info)
-		vf_pp_binary = &pipe->pipe_settings.preview.vf_pp_binary;
-
 	sh_css_metrics_start_frame();
 
 	/* multi stream video needs mipi buffers */
@@ -5746,7 +5722,6 @@ unload_video_binaries(struct ia_css_pipe *pipe) {
 
 static int video_start(struct ia_css_pipe *pipe)
 {
-	struct ia_css_binary *copy_binary;
 	int err = 0;
 	struct ia_css_pipe *copy_pipe, *capture_pipe;
 	enum sh_css_pipe_config_override copy_ovrd;
@@ -5766,8 +5741,6 @@ static int video_start(struct ia_css_pipe *pipe)
 	copy_pipe    = pipe->pipe_settings.video.copy_pipe;
 	capture_pipe = pipe->pipe_settings.video.capture_pipe;
 
-	copy_binary  = &pipe->pipe_settings.video.copy_binary;
-
 	sh_css_metrics_start_frame();
 
 	/* multi stream video needs mipi buffers */
@@ -6009,8 +5982,6 @@ static int load_primary_binaries(
     struct ia_css_pipe *pipe)
 {
 	bool online = false;
-	bool memory = false;
-	bool continuous = false;
 	bool need_pp = false;
 	bool need_isp_copy_binary = false;
 	bool need_ldc = false;
@@ -6036,8 +6007,6 @@ static int load_primary_binaries(
 	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 
 	online = pipe->stream->config.online;
-	memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
-	continuous = pipe->stream->config.continuous;
 #ifdef ISP2401
 	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
 #endif
@@ -7326,7 +7295,6 @@ unload_yuvpp_binaries(struct ia_css_pipe *pipe) {
 
 static int yuvpp_start(struct ia_css_pipe *pipe)
 {
-	struct ia_css_binary *copy_binary;
 	int err = 0;
 	enum sh_css_pipe_config_override copy_ovrd;
 	enum ia_css_input_mode yuvpp_pipe_input_mode;
@@ -7339,8 +7307,6 @@ static int yuvpp_start(struct ia_css_pipe *pipe)
 
 	yuvpp_pipe_input_mode = pipe->stream->config.mode;
 
-	copy_binary  = &pipe->pipe_settings.yuvpp.copy_binary;
-
 	sh_css_metrics_start_frame();
 
 	/* multi stream video needs mipi buffers */
@@ -7456,7 +7422,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 		*vf_pp_binary,
 		*yuv_scaler_binary;
 	bool need_scaler = false;
-	unsigned int num_stage, num_vf_pp_stage, num_output_stage;
+	unsigned int num_stage, num_output_stage;
 	unsigned int i, j;
 
 	struct ia_css_frame *in_frame = NULL;
@@ -7487,7 +7453,6 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 	}
 	ia_css_pipe_util_create_output_frames(bin_out_frame);
 	num_stage  = pipe->pipe_settings.yuvpp.num_yuv_scaler;
-	num_vf_pp_stage   = pipe->pipe_settings.yuvpp.num_vf_pp;
 	num_output_stage   = pipe->pipe_settings.yuvpp.num_output;
 
 #ifdef ISP2401
@@ -10417,14 +10382,12 @@ ia_css_update_continuous_frames(struct ia_css_stream *stream) {
 void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 {
 	unsigned int thread_id;
-	enum ia_css_pipe_id pipe_id;
 	unsigned int pipe_num;
 	bool need_input_queue;
 
 	IA_CSS_ENTER("");
 	assert(pipe);
 
-	pipe_id = pipe->mode;
 	pipe_num = pipe->pipe_num;
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index ba7d406bcc10..d5ae7f0b5864 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -407,7 +407,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		     struct ia_css_stream_info *info) {
 	int err = -EINVAL;
 	unsigned int port;
-	struct ia_css_frame_info mipi_intermediate_info;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "allocate_mipi_frames(%p) enter:\n", pipe);
@@ -486,17 +485,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 
 	ref_count_mipi_allocation[port]++;
 
-	/* TODO: Cleaning needed. */
-	/* This code needs to modified to allocate the MIPI frames in the correct normal way
-	  with an allocate from info, by justin */
-	mipi_intermediate_info = pipe->pipe_settings.video.video_binary.internal_frame_info;
-	mipi_intermediate_info.res.width = 0;
-	mipi_intermediate_info.res.height = 0;
-	/* To indicate it is not (yet) valid format. */
-	mipi_intermediate_info.format = IA_CSS_FRAME_FORMAT_NUM;
-	mipi_intermediate_info.padded_width = 0;
-	mipi_intermediate_info.raw_bit_depth = 0;
-
 	/* AM TODO: mipi frames number should come from stream struct. */
 	my_css.num_mipi_frames[port] = NUM_MIPI_FRAMES_PER_STREAM;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index ed496f6d28f0..69cc4e423d8b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -230,15 +230,8 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 		      const struct ia_css_binary *binary,
 		      unsigned int bds_factor)
 {
-	unsigned int input_width,
-		 input_height,
-		 table_width,
-		 table_height,
-		 left_padding,
-		 top_padding,
-		 padded_width,
-		 left_cropping,
-		 i;
+	unsigned int input_width, input_height, table_width, table_height, i;
+	unsigned int left_padding, top_padding, left_cropping;
 	unsigned int bds_numerator, bds_denominator;
 	int right_padding;
 
@@ -254,15 +247,11 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 		return;
 	}
 
-	padded_width = binary->in_frame_info.padded_width;
-	/* We use the ISP input resolution for the shading table because
-	   shading correction is performed in the bayer domain (before bayer
-	   down scaling). */
-#if defined(ISP2401)
-	padded_width = CEIL_MUL(binary->effective_in_frame_res.width + 2 *
-				ISP_VEC_NELEMS,
-				2 * ISP_VEC_NELEMS);
-#endif
+	/*
+	 * We use the ISP input resolution for the shading table because
+	 * shading correction is performed in the bayer domain (before bayer
+	 * down scaling).
+	 */
 	input_height  = binary->in_frame_info.res.height;
 	input_width   = binary->in_frame_info.res.width;
 	left_padding  = binary->left_padding;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fa0158c190a7..2c67c23b3700 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1096,7 +1096,7 @@ ia_css_params_alloc_convert_sctbl(
 {
 	const struct ia_css_binary *binary = stage->binary;
 	struct ia_css_host_data    *sctbl;
-	unsigned int i, j, aligned_width, row_padding;
+	unsigned int i, j, aligned_width;
 	unsigned int sctbl_size;
 	short int    *ptr;
 
@@ -1111,7 +1111,6 @@ ia_css_params_alloc_convert_sctbl(
 	}
 
 	aligned_width = binary->sctbl_aligned_width_per_color;
-	row_padding = aligned_width - shading_table->width;
 	sctbl_size = shading_table->height * IA_CSS_SC_NUM_COLORS * aligned_width *
 		     sizeof(short);
 
-- 
2.26.2

