Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE7A3696AA
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 18:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhDWQKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 12:10:35 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34879 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWQKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 12:10:34 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D8BB920010;
        Fri, 23 Apr 2021 16:09:55 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCHv3 7/8] staging: media: atomisp: Fix line split style issues
Date:   Fri, 23 Apr 2021 12:13:12 -0400
Message-Id: <20210423161312.244759-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix line split issues and resolve adjacent extra parens.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 91 ++++++++++------------
 1 file changed, 42 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index eec0e6f229a3..2f581818f4a6 100644
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
@@ -4017,9 +4015,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 
 	assert(pipe_id < IA_CSS_PIPE_ID_NUM);
 	assert(buf_type < IA_CSS_NUM_DYNAMIC_BUFFER_TYPE);
-	if ((buf_type == IA_CSS_BUFFER_TYPE_INVALID) ||
-	    (buf_type >= IA_CSS_NUM_DYNAMIC_BUFFER_TYPE) ||
-	    (pipe_id >= IA_CSS_PIPE_ID_NUM)) {
+	if (buf_type == IA_CSS_BUFFER_TYPE_INVALID ||
+	    buf_type >= IA_CSS_NUM_DYNAMIC_BUFFER_TYPE ||
+	    pipe_id >= IA_CSS_PIPE_ID_NUM) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
@@ -4080,11 +4078,11 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		}
 		ddr_buffer.kernel_ptr = HOST_ADDRESS(buffer->data.metadata);
 		ddr_buffer.payload.metadata = *buffer->data.metadata;
-	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)) {
+	} else if (buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME) {
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
+	if (buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS ||
+	    buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS ||
+	    buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS) {
 		if (!pipeline) {
 			ia_css_rmgr_rel_vbuf(hmm_buffer_pool, &h_vbuf);
 			IA_CSS_LOG("pipeline is empty!");
@@ -4144,18 +4142,18 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 									(uint32_t)h_vbuf->vptr);
 			}
 		}
-	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_METADATA)) {
+	} else if (buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME ||
+		   buf_type == IA_CSS_BUFFER_TYPE_METADATA) {
 		return_err = ia_css_bufq_enqueue_buffer(thread_id,
 							queue_id,
 							(uint32_t)h_vbuf->vptr);
 #if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
-		if (!(return_err) &&
-		    (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)) {
+		if (!return_err &&
+		    buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
 			IA_CSS_LOG("pfp: enqueued OF %d to q %d thread %d",
 				   ddr_buffer.payload.frame.frame_data,
 				   queue_id, thread_id);
@@ -4307,8 +4305,8 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			buffer->driver_cookie = ddr_buffer.cookie_ptr;
 			buffer->timing_data = ddr_buffer.timing_data;
 
-			if ((buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) ||
-			    (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)) {
+			if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME ||
+			    buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) {
 				buffer->isys_eof_clock_tick.ticks = ddr_buffer.isys_eof_clock_tick;
 			}
 
@@ -6196,8 +6194,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe)
 	return 0;
 }
 
-static int load_advanced_binaries(
-    struct ia_css_pipe *pipe)
+static int load_advanced_binaries(struct ia_css_pipe *pipe)
 {
 	struct ia_css_frame_info pre_in_info, gdc_in_info,
 			post_in_info, post_out_info,
@@ -6314,8 +6311,7 @@ static int load_advanced_binaries(
 	return err;
 }
 
-static int load_bayer_isp_binaries(
-    struct ia_css_pipe *pipe)
+static int load_bayer_isp_binaries(struct ia_css_pipe *pipe)
 {
 	struct ia_css_frame_info pre_isp_in_info, *pipe_out_info;
 	int err = 0;
@@ -6344,8 +6340,7 @@ static int load_bayer_isp_binaries(
 	return err;
 }
 
-static int load_low_light_binaries(
-    struct ia_css_pipe *pipe)
+static int load_low_light_binaries(struct ia_css_pipe *pipe)
 {
 	struct ia_css_frame_info pre_in_info, anr_in_info,
 			post_in_info, post_out_info,
@@ -6483,8 +6478,7 @@ static bool copy_on_sp(struct ia_css_pipe *pipe)
 	return rval;
 }
 
-static int load_capture_binaries(
-    struct ia_css_pipe *pipe)
+static int load_capture_binaries(struct ia_css_pipe *pipe)
 {
 	int err = 0;
 	bool must_be_raw;
@@ -6559,7 +6553,8 @@ unload_capture_binaries(struct ia_css_pipe *pipe)
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY))) {
+	if (!pipe || (pipe->mode != IA_CSS_PIPE_ID_CAPTURE &&
+		      pipe->mode != IA_CSS_PIPE_ID_COPY)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -6636,10 +6631,10 @@ need_yuv_scaler_stage(const struct ia_css_pipe *pipe)
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
@@ -6756,9 +6751,9 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 }
 
 /* FIXME: merge most of this and single output version */
-static int ia_css_pipe_create_cas_scaler_desc(
-    struct ia_css_pipe *pipe,
-    struct ia_css_cas_binary_descr *descr)
+static int
+ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
+				   struct ia_css_cas_binary_descr *descr)
 {
 	struct ia_css_frame_info in_info = IA_CSS_BINARY_DEFAULT_FRAME_INFO;
 	struct ia_css_frame_info *out_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
@@ -7925,7 +7920,9 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
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
@@ -7963,8 +7960,7 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe)
 	return err;
 }
 
-static int capture_start(
-    struct ia_css_pipe *pipe)
+static int capture_start(struct ia_css_pipe *pipe)
 {
 	struct ia_css_pipeline *me;
 
@@ -8365,11 +8361,8 @@ int ia_css_stream_capture_frame(struct ia_css_stream *stream,
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

