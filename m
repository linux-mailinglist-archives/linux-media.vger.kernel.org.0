Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10381364A86
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241677AbhDSTYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:24:47 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44749 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241735AbhDSTYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:24:00 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 115B760003;
        Mon, 19 Apr 2021 19:23:27 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 7/8] staging: media: atomisp: Fix line split style issues
Date:   Mon, 19 Apr 2021 15:26:01 -0400
Message-Id: <20210419192602.498815-8-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192602.498815-1-vrzh@vrzh.net>
References: <20210419192602.498815-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix coding style issues

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 76 ++++++++++------------
 1 file changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 3d58b9b3d50d..ea096e6f90e5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -308,8 +308,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
 			      const void *acc_fw);
 
 static int
-alloc_continuous_frames(
-    struct ia_css_pipe *pipe, bool init_time);
+alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time);
 
 static void
 pipe_global_init(void);
@@ -2622,8 +2621,7 @@ static int load_copy_binary(
 }
 
 static int
-alloc_continuous_frames(
-    struct ia_css_pipe *pipe, bool init_time)
+alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 {
 	int err = 0;
 	struct ia_css_frame_info ref_info;
@@ -4080,11 +4078,11 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		}
 		ddr_buffer.kernel_ptr = HOST_ADDRESS(buffer->data.metadata);
 		ddr_buffer.payload.metadata = *buffer->data.metadata;
-	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)) {
+	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)) {
 		if (!buffer->data.frame) {
 			IA_CSS_LEAVE_ERR(-EINVAL);
 			return -EINVAL;
@@ -4124,9 +4122,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	hmm_store(h_vbuf->vptr,
 		   (void *)(&ddr_buffer),
 		   sizeof(struct sh_css_hmm_buffer));
-	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS)
-	    || (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS)
-	    || (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {
+	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) ||
+	    (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) ||
+	    (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {
 		if (!pipeline) {
 			ia_css_rmgr_rel_vbuf(hmm_buffer_pool, &h_vbuf);
 			IA_CSS_LOG("pipeline is empty!");
@@ -4144,12 +4142,12 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 									(uint32_t)h_vbuf->vptr);
 			}
 		}
-	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_METADATA)) {
+	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME) ||
+			(buf_type == IA_CSS_BUFFER_TYPE_METADATA)) {
 		return_err = ia_css_bufq_enqueue_buffer(thread_id,
 							queue_id,
 							(uint32_t)h_vbuf->vptr);
@@ -6197,8 +6195,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe)
 	return 0;
 }
 
-static int load_advanced_binaries(
-    struct ia_css_pipe *pipe)
+static int load_advanced_binaries(struct ia_css_pipe *pipe)
 {
 	struct ia_css_frame_info pre_in_info, gdc_in_info,
 			post_in_info, post_out_info,
@@ -6315,8 +6312,7 @@ static int load_advanced_binaries(
 	return err;
 }
 
-static int load_bayer_isp_binaries(
-    struct ia_css_pipe *pipe)
+static int load_bayer_isp_binaries(struct ia_css_pipe *pipe)
 {
 	struct ia_css_frame_info pre_isp_in_info, *pipe_out_info;
 	int err = 0;
@@ -6345,8 +6341,7 @@ static int load_bayer_isp_binaries(
 	return err;
 }
 
-static int load_low_light_binaries(
-    struct ia_css_pipe *pipe)
+static int load_low_light_binaries(struct ia_css_pipe *pipe)
 {
 	struct ia_css_frame_info pre_in_info, anr_in_info,
 			post_in_info, post_out_info,
@@ -6484,8 +6479,7 @@ static bool copy_on_sp(struct ia_css_pipe *pipe)
 	return rval;
 }
 
-static int load_capture_binaries(
-    struct ia_css_pipe *pipe)
+static int load_capture_binaries(struct ia_css_pipe *pipe)
 {
 	int err = 0;
 	bool must_be_raw;
@@ -6560,7 +6554,8 @@ unload_capture_binaries(struct ia_css_pipe *pipe)
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY))) {
+	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) &&
+			(pipe->mode != IA_CSS_PIPE_ID_COPY))) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -6637,10 +6632,10 @@ need_yuv_scaler_stage(const struct ia_css_pipe *pipe)
 /* which has some hard-coded knowledge which prevents reuse of the function. */
 /* Later, merge this with ia_css_pipe_create_cas_scaler_desc */
 static int ia_css_pipe_create_cas_scaler_desc_single_output(
-    struct ia_css_frame_info *cas_scaler_in_info,
-    struct ia_css_frame_info *cas_scaler_out_info,
-    struct ia_css_frame_info *cas_scaler_vf_info,
-    struct ia_css_cas_binary_descr *descr)
+	    struct ia_css_frame_info *cas_scaler_in_info,
+	    struct ia_css_frame_info *cas_scaler_out_info,
+	    struct ia_css_frame_info *cas_scaler_vf_info,
+	    struct ia_css_cas_binary_descr *descr)
 {
 	unsigned int i;
 	unsigned int hor_ds_factor = 0, ver_ds_factor = 0;
@@ -6757,9 +6752,8 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 }
 
 /* FIXME: merge most of this and single output version */
-static int ia_css_pipe_create_cas_scaler_desc(
-    struct ia_css_pipe *pipe,
-    struct ia_css_cas_binary_descr *descr)
+static int ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
+					      struct ia_css_cas_binary_descr *descr)
 {
 	struct ia_css_frame_info in_info = IA_CSS_BINARY_DEFAULT_FRAME_INFO;
 	struct ia_css_frame_info *out_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
@@ -7926,7 +7920,9 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	    * should not be considered as a clean solution. Proper
 	    * investigation should be done to come up with the clean solution.
 	    * */
-	if (mode != IA_CSS_CAPTURE_MODE_RAW && mode != IA_CSS_CAPTURE_MODE_BAYER && current_stage && vf_frame) {
+	if (mode != IA_CSS_CAPTURE_MODE_RAW &&
+	    mode != IA_CSS_CAPTURE_MODE_BAYER &&
+	    current_stage && vf_frame) {
 		in_frame = current_stage->args.out_vf_frame;
 		err = add_vf_pp_stage(pipe, in_frame, vf_frame, vf_pp_binary,
 					&current_stage);
@@ -7964,8 +7960,7 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe)
 	return err;
 }
 
-static int capture_start(
-    struct ia_css_pipe *pipe)
+static int capture_start(struct ia_css_pipe *pipe)
 {
 	struct ia_css_pipeline *me;
 
@@ -8366,11 +8361,8 @@ int ia_css_stream_capture_frame(struct ia_css_stream *stream,
     * @brief Configure the continuous capture.
     * Refer to "sh_css_internal.h" for details.
     */
-int ia_css_stream_capture(
-    struct ia_css_stream *stream,
-    int num_captures,
-    unsigned int skip,
-    int offset)
+int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
+			  unsigned int skip, int offset)
 {
 	struct sh_css_tag_descr tag_descr;
 	unsigned int encoded_tag_descr;
-- 
2.31.1

