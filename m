Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6793370601
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 08:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhEAGsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 02:48:18 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:42274 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhEAGsS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 May 2021 02:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619851641; bh=xsCHhMaji89DawEz90p0ToLPrnD62clyswwPmjCyeUE=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=bxaZPul7tE6W3lGZ0fRPfyXw3WP27LIARXOq27qj65e5Ofv+nMTMwMI7of4gb/ho4
         BtyGbum3rhEm14pCn7R60+X7IpcEc2ouKhZrNb4/FPuTMvElziOvivXU8fDMWzqsbf
         uaVTxazp6BrJuvmGQ12m9ERxRMQRKwSh4iXpuYec=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat,  1 May 2021 08:47:21 +0200 (CEST)
X-EA-Auth: wWcXHN4tkBcV5QbqMnqGnSir8zMz//8NTdULHwk5JzJzzhgHyc7FUiZPPJMDkGB4fFrLlIysz4gVUKj8kp8YWKqyJ5bDcqe/
Date:   Sat, 1 May 2021 12:17:16 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH 4/5] staging: media: atomisp: code formatting changes
 sh_css_sp.c
Message-ID: <d10d952064970e77e33acfa85563a1793308a90d.1619850663.git.drv@mailo.com>
References: <cover.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619850663.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several trivial code reformatting changes done according to the coding
style guidelines. These code changes overall improve code organisation
and readability and also address many chackpatch error, warning and
check complaints.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 471 ++++++++----------
 1 file changed, 203 insertions(+), 268 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 02f5a73b4096..b2859dcf9ac6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -91,14 +91,12 @@ static void
 initialize_stage_frames(struct ia_css_frames_sp *frames);
 
 /* This data is stored every frame */
-void
-store_sp_group_data(void)
+void store_sp_group_data(void)
 {
 	per_frame_data.sp_group_addr = sh_css_store_sp_group_to_ddr();
 }
 
-static void
-copy_isp_stage_to_sp_stage(void)
+static void copy_isp_stage_to_sp_stage(void)
 {
 	/* [WW07.5]type casting will cause potential issues */
 	sh_css_sp_stage.num_stripes = (uint8_t)
@@ -109,7 +107,8 @@ copy_isp_stage_to_sp_stage(void)
 		sh_css_isp_stage.binary_info.iterator.row_stripes_overlap_lines;
 	sh_css_sp_stage.top_cropping = (uint16_t)
 				       sh_css_isp_stage.binary_info.pipeline.top_cropping;
-	/* moved to sh_css_sp_init_stage
+	/*
+	 * moved to sh_css_sp_init_stage
 	   sh_css_sp_stage.enable.vf_output =
 	   sh_css_isp_stage.binary_info.enable.vf_veceven ||
 	   sh_css_isp_stage.binary_info.num_output_pins > 1;
@@ -118,9 +117,8 @@ copy_isp_stage_to_sp_stage(void)
 	sh_css_sp_stage.enable.s3a = sh_css_isp_stage.binary_info.enable.s3a;
 }
 
-void
-store_sp_stage_data(enum ia_css_pipe_id id, unsigned int pipe_num,
-		    unsigned int stage)
+void store_sp_stage_data(enum ia_css_pipe_id id, unsigned int pipe_num,
+			 unsigned int stage)
 {
 	unsigned int thread_id;
 
@@ -136,8 +134,7 @@ store_sp_stage_data(enum ia_css_pipe_id id, unsigned int pipe_num,
 	sh_css_sp_stage.program_input_circuit = false;
 }
 
-static void
-store_sp_per_frame_data(const struct ia_css_fw_info *fw)
+static void store_sp_per_frame_data(const struct ia_css_fw_info *fw)
 {
 	unsigned int HIVE_ADDR_sp_per_frame_data = 0;
 
@@ -154,16 +151,13 @@ store_sp_per_frame_data(const struct ia_css_fw_info *fw)
 		return;
 	}
 
-	sp_dmem_store(SP0_ID,
-		      (unsigned int)sp_address_of(sp_per_frame_data),
-		      &per_frame_data,
-		      sizeof(per_frame_data));
+	sp_dmem_store(SP0_ID, (unsigned int)sp_address_of(sp_per_frame_data),
+		      &per_frame_data, sizeof(per_frame_data));
 }
 
-static void
-sh_css_store_sp_per_frame_data(enum ia_css_pipe_id pipe_id,
-			       unsigned int pipe_num,
-			       const struct ia_css_fw_info *sp_fw)
+static void sh_css_store_sp_per_frame_data(enum ia_css_pipe_id pipe_id,
+					   unsigned int pipe_num,
+					   const struct ia_css_fw_info *sp_fw)
 {
 	if (!sp_fw)
 		sp_fw = &sh_css_sp_fw;
@@ -175,8 +169,7 @@ sh_css_store_sp_per_frame_data(enum ia_css_pipe_id pipe_id,
 
 #if SP_DEBUG != SP_DEBUG_NONE
 
-void
-sh_css_sp_get_debug_state(struct sh_css_sp_debug_state *state)
+void sh_css_sp_get_debug_state(struct sh_css_sp_debug_state *state)
 {
 	const struct ia_css_fw_info *fw = &sh_css_sp_fw;
 	unsigned int HIVE_ADDR_sp_output = fw->info.sp.output;
@@ -193,10 +186,9 @@ sh_css_sp_get_debug_state(struct sh_css_sp_debug_state *state)
 
 #endif
 
-void
-sh_css_sp_start_binary_copy(unsigned int pipe_num,
-			    struct ia_css_frame *out_frame,
-			    unsigned int two_ppc)
+void sh_css_sp_start_binary_copy(unsigned int pipe_num,
+				 struct ia_css_frame *out_frame,
+				 unsigned int two_ppc)
 {
 	enum ia_css_pipe_id pipe_id;
 	unsigned int thread_id;
@@ -284,8 +276,10 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	pipe->copy.raw.max_input_width = max_input_width;
 	pipe->num_stages = 1;
 	pipe->pipe_id = pipe_id;
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (pipe_conf_override == SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD)
 		pipe->pipe_config =
 		    (SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id);
@@ -321,10 +315,10 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	ia_css_debug_pipe_graph_dump_sp_raw_copy(out_frame);
 }
 
-static void
-sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
-			  unsigned int pipe_num, unsigned int max_input_width,
-			  unsigned int if_config_index)
+static void sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
+				      unsigned int pipe_num,
+				      unsigned int max_input_width,
+				      unsigned int if_config_index)
 {
 	enum ia_css_pipe_id pipe_id;
 	unsigned int thread_id;
@@ -385,8 +379,7 @@ sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
 	ia_css_debug_pipe_graph_dump_sp_raw_copy(out_frame);
 }
 
-unsigned int
-sh_css_sp_get_binary_copy_size(void)
+unsigned int sh_css_sp_get_binary_copy_size(void)
 {
 	const struct ia_css_fw_info *fw = &sh_css_sp_fw;
 	unsigned int HIVE_ADDR_sp_output = fw->info.sp.output;
@@ -396,8 +389,7 @@ sh_css_sp_get_binary_copy_size(void)
 	return load_sp_array_uint(sp_output, offset);
 }
 
-unsigned int
-sh_css_sp_get_sw_interrupt_value(unsigned int irq)
+unsigned int sh_css_sp_get_sw_interrupt_value(unsigned int irq)
 {
 	const struct ia_css_fw_info *fw = &sh_css_sp_fw;
 	unsigned int HIVE_ADDR_sp_output = fw->info.sp.output;
@@ -422,16 +414,17 @@ sh_css_copy_buffer_attr_to_spbuffer(struct ia_css_buffer_sp *dest_buf,
 		 */
 		assert(queue_id < SH_CSS_MAX_NUM_QUEUES);
 
-		/* Klocwork assumes assert can be disabled;
-		   Since we can get there with any type, and it does not
-		   know that frame_in->dynamic_data_index can only be set
-		   for one of the types in the assert) it has to assume we
-		   can get here for any type. however this could lead to an
-		   out of bounds reference when indexing buf_type about 10
-		   lines below. In order to satisfy KW an additional if
-		   has been added. This one will always yield true.
+		/*
+		 * Klocwork assumes assert can be disabled;
+		 * Since we can get there with any type, and it does not
+		 * know that frame_in->dynamic_data_index can only be set
+		 * for one of the types in the assert) it has to assume we
+		 * can get here for any type. however this could lead to an
+		 * out of bounds reference when indexing buf_type about 10
+		 * lines below. In order to satisfy KW an additional if
+		 * has been added. This one will always yield true.
 		 */
-		if ((queue_id < SH_CSS_MAX_NUM_QUEUES)) {
+		if (queue_id < SH_CSS_MAX_NUM_QUEUES) {
 			dest_buf->buf_src.queue_id = queue_id;
 		}
 	} else {
@@ -441,9 +434,8 @@ sh_css_copy_buffer_attr_to_spbuffer(struct ia_css_buffer_sp *dest_buf,
 	dest_buf->buf_type = buf_type;
 }
 
-static void
-sh_css_copy_frame_to_spframe(struct ia_css_frame_sp *sp_frame_out,
-			     const struct ia_css_frame *frame_in)
+static void sh_css_copy_frame_to_spframe(struct ia_css_frame_sp *sp_frame_out,
+					 const struct ia_css_frame *frame_in)
 {
 	assert(frame_in);
 
@@ -534,13 +526,12 @@ sh_css_copy_frame_to_spframe(struct ia_css_frame_sp *sp_frame_out,
 	}
 }
 
-static int
-set_input_frame_buffer(const struct ia_css_frame *frame) {
+static int set_input_frame_buffer(const struct ia_css_frame *frame)
+{
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format)
-	{
+	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_QPLANE6:
 	case IA_CSS_FRAME_FORMAT_YUV420_16:
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
@@ -564,14 +555,13 @@ set_input_frame_buffer(const struct ia_css_frame *frame) {
 	return 0;
 }
 
-static int
-set_output_frame_buffer(const struct ia_css_frame *frame,
-			unsigned int idx) {
+static int set_output_frame_buffer(const struct ia_css_frame *frame,
+				   unsigned int idx)
+{
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format)
-	{
+	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_YUV420:
 	case IA_CSS_FRAME_FORMAT_YUV422:
 	case IA_CSS_FRAME_FORMAT_YUV444:
@@ -606,13 +596,12 @@ set_output_frame_buffer(const struct ia_css_frame *frame,
 	return 0;
 }
 
-static int
-set_view_finder_buffer(const struct ia_css_frame *frame) {
+static int set_view_finder_buffer(const struct ia_css_frame *frame)
+{
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format)
-	{
+	switch (frame->info.format) {
 	/* the dual output pin */
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV12_16:
@@ -637,11 +626,9 @@ set_view_finder_buffer(const struct ia_css_frame *frame) {
 }
 
 #if !defined(ISP2401)
-void sh_css_sp_set_if_configs(
-    const input_formatter_cfg_t	*config_a,
-    const input_formatter_cfg_t	*config_b,
-    const uint8_t		if_config_index
-)
+void sh_css_sp_set_if_configs(const input_formatter_cfg_t *config_a,
+			      const input_formatter_cfg_t *config_b,
+			      const uint8_t if_config_index)
 {
 	assert(if_config_index < SH_CSS_MAX_IF_CONFIGS);
 	assert(config_a);
@@ -661,10 +648,8 @@ void sh_css_sp_set_if_configs(
 #endif
 
 #if !defined(ISP2401)
-void
-sh_css_sp_program_input_circuit(int fmt_type,
-				int ch_id,
-				enum ia_css_input_mode input_mode)
+void sh_css_sp_program_input_circuit(int fmt_type, int ch_id,
+				     enum ia_css_input_mode input_mode)
 {
 	sh_css_sp_group.config.input_circuit.no_side_band = false;
 	sh_css_sp_group.config.input_circuit.fmt_type     = fmt_type;
@@ -680,10 +665,8 @@ sh_css_sp_program_input_circuit(int fmt_type,
 #endif
 
 #if !defined(ISP2401)
-void
-sh_css_sp_configure_sync_gen(int width, int height,
-			     int hblank_cycles,
-			     int vblank_cycles)
+void sh_css_sp_configure_sync_gen(int width, int height,
+				  int hblank_cycles, int vblank_cycles)
 {
 	sh_css_sp_group.config.sync_gen.width	       = width;
 	sh_css_sp_group.config.sync_gen.height	       = height;
@@ -691,12 +674,9 @@ sh_css_sp_configure_sync_gen(int width, int height,
 	sh_css_sp_group.config.sync_gen.vblank_cycles = vblank_cycles;
 }
 
-void
-sh_css_sp_configure_tpg(int x_mask,
-			int y_mask,
-			int x_delta,
-			int y_delta,
-			int xy_mask)
+void sh_css_sp_configure_tpg(int x_mask, int y_mask,
+			     int x_delta, int y_delta,
+			     int xy_mask)
 {
 	sh_css_sp_group.config.tpg.x_mask  = x_mask;
 	sh_css_sp_group.config.tpg.y_mask  = y_mask;
@@ -705,15 +685,13 @@ sh_css_sp_configure_tpg(int x_mask,
 	sh_css_sp_group.config.tpg.xy_mask = xy_mask;
 }
 
-void
-sh_css_sp_configure_prbs(int seed)
+void sh_css_sp_configure_prbs(int seed)
 {
 	sh_css_sp_group.config.prbs.seed = seed;
 }
 #endif
 
-void
-sh_css_sp_configure_enable_raw_pool_locking(bool lock_all)
+void sh_css_sp_configure_enable_raw_pool_locking(bool lock_all)
 {
 	sh_css_sp_group.config.enable_raw_pool_locking = true;
 	sh_css_sp_group.config.lock_all = lock_all;
@@ -725,14 +703,13 @@ sh_css_sp_enable_isys_event_queue(bool enable)
 	sh_css_sp_group.config.enable_isys_event_queue = enable;
 }
 
-void
-sh_css_sp_set_disable_continuous_viewfinder(bool flag)
+void sh_css_sp_set_disable_continuous_viewfinder(bool flag)
 {
 	sh_css_sp_group.config.disable_cont_vf = flag;
 }
 
-static int
-sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args) {
+static int sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args)
+{
 	int err = 0;
 	int i;
 
@@ -742,23 +719,23 @@ sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args) {
 		err = set_input_frame_buffer(args->in_frame);
 	if (!err && args->out_vf_frame)
 		err = set_view_finder_buffer(args->out_vf_frame);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		if (!err && args->out_frame[i])
 			err = set_output_frame_buffer(args->out_frame[i], i);
 	}
 
-	/* we don't pass this error back to the upper layer, so we add a assert here
-	   because we actually hit the error here but it still works by accident... */
-	if (err) assert(false);
+	/*
+	 * we don't pass this error back to the upper layer, so we add a assert here
+	 * because we actually hit the error here but it still works by accident...
+	 */
+	if (err)
+		assert(false);
 	return err;
 }
 
-static void
-sh_css_sp_init_group(bool two_ppc,
-		     enum atomisp_input_format input_format,
-		     bool no_isp_sync,
-		     uint8_t if_config_index)
+static void sh_css_sp_init_group(bool two_ppc,
+				 enum atomisp_input_format input_format,
+				 bool no_isp_sync, uint8_t if_config_index)
 {
 #if !defined(ISP2401)
 	sh_css_sp_group.config.input_formatter.isp_2ppc = two_ppc;
@@ -768,7 +745,8 @@ sh_css_sp_init_group(bool two_ppc,
 
 	sh_css_sp_group.config.no_isp_sync = (uint8_t)no_isp_sync;
 	/* decide whether the frame is processed online or offline */
-	if (if_config_index == SH_CSS_IF_CONFIG_NOT_NEEDED) return;
+	if (if_config_index == SH_CSS_IF_CONFIG_NOT_NEEDED)
+		return;
 #if !defined(ISP2401)
 	assert(if_config_index < SH_CSS_MAX_IF_CONFIGS);
 	sh_css_sp_group.config.input_formatter.set[if_config_index].stream_format =
@@ -778,21 +756,19 @@ sh_css_sp_init_group(bool two_ppc,
 #endif
 }
 
-void
-sh_css_stage_write_binary_info(struct ia_css_binary_info *info)
+void sh_css_stage_write_binary_info(struct ia_css_binary_info *info)
 {
 	assert(info);
 	sh_css_isp_stage.binary_info = *info;
 }
 
-static int
-copy_isp_mem_if_to_ddr(struct ia_css_binary *binary) {
+static int copy_isp_mem_if_to_ddr(struct ia_css_binary *binary)
+{
 	int err;
 
-	err = ia_css_isp_param_copy_isp_mem_if_to_ddr(
-	    &binary->css_params,
-	    &binary->mem_params,
-	    IA_CSS_PARAM_CLASS_CONFIG);
+	err = ia_css_isp_param_copy_isp_mem_if_to_ddr(&binary->css_params,
+						      &binary->mem_params,
+						      IA_CSS_PARAM_CLASS_CONFIG);
 	if (err)
 		return err;
 	err = ia_css_isp_param_copy_isp_mem_if_to_ddr(
@@ -804,20 +780,17 @@ copy_isp_mem_if_to_ddr(struct ia_css_binary *binary) {
 	return 0;
 }
 
-static bool
-is_sp_stage(struct ia_css_pipeline_stage *stage)
+static bool is_sp_stage(struct ia_css_pipeline_stage *stage)
 {
 	assert(stage);
 	return stage->sp_func != IA_CSS_PIPELINE_NO_FUNC;
 }
 
-static int
-configure_isp_from_args(
-    const struct sh_css_sp_pipeline *pipeline,
-    const struct ia_css_binary      *binary,
-    const struct sh_css_binary_args *args,
-    bool two_ppc,
-    bool deinterleaved) {
+static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
+				   const struct ia_css_binary *binary,
+				   const struct sh_css_binary_args *args,
+				   bool two_ppc, bool deinterleaved)
+{
 	ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	ia_css_crop_configure(binary, &args->delay_frames[0]->info);
 	ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
@@ -850,34 +823,31 @@ configure_isp_from_args(
 	return 0;
 }
 
-static void
-initialize_isp_states(const struct ia_css_binary *binary)
+static void initialize_isp_states(const struct ia_css_binary *binary)
 {
 	unsigned int i;
 
 	if (!binary->info->mem_offsets.offsets.state)
 		return;
-	for (i = 0; i < IA_CSS_NUM_STATE_IDS; i++) {
+	for (i = 0; i < IA_CSS_NUM_STATE_IDS; i++)
 		ia_css_kernel_init_state[i](binary);
-	}
 }
 
-static void
-initialize_frame_buffer_attribute(struct ia_css_buffer_sp *buf_attr)
+static void initialize_frame_buffer_attribute(struct ia_css_buffer_sp *buf_attr)
 {
 	buf_attr->buf_src.queue_id = SH_CSS_INVALID_QUEUE_ID;
 	buf_attr->buf_type = IA_CSS_BUFFER_TYPE_INVALID;
 }
 
-static void
-initialize_stage_frames(struct ia_css_frames_sp *frames)
+static void initialize_stage_frames(struct ia_css_frames_sp *frames)
 {
 	unsigned int i;
 
 	initialize_frame_buffer_attribute(&frames->in.buf_attr);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
+
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
 		initialize_frame_buffer_attribute(&frames->out[i].buf_attr);
-	}
+
 	initialize_frame_buffer_attribute(&frames->out_vf.buf_attr);
 	initialize_frame_buffer_attribute(&frames->s3a_buf);
 	initialize_frame_buffer_attribute(&frames->dvs_buf);
@@ -896,7 +866,8 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		     bool xnr,
 		     const struct ia_css_isp_param_css_segments *isp_mem_if,
 		     unsigned int if_config_index,
-		     bool two_ppc) {
+		     bool two_ppc)
+{
 	const struct ia_css_binary_xinfo *xinfo;
 	const struct ia_css_binary_info  *info;
 	int err = 0;
@@ -928,8 +899,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 
-	if (!info)
-	{
+	if (!info) {
 		sh_css_sp_group.pipe[thread_id].sp_stage_addr[stage] = mmgr_NULL;
 		return 0;
 	}
@@ -953,16 +923,16 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	sh_css_sp_stage.isp_copy_output = (uint8_t)args->copy_output;
 	sh_css_sp_stage.enable.vf_output = (args->out_vf_frame != NULL);
 
-	/* Copy the frame infos first, to be overwritten by the frames,
-	   if these are present.
-	*/
+	/*
+	 * Copy the frame infos first, to be overwritten by the frames,
+	 * if these are present.
+	 */
 	sh_css_sp_stage.frames.effective_in_res.width = binary->effective_in_frame_res.width;
 	sh_css_sp_stage.frames.effective_in_res.height = binary->effective_in_frame_res.height;
 
 	ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.in.info,
 					   &binary->in_frame_info);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.out[i].info,
 						   &binary->out_frame_info[i]);
 	}
@@ -996,16 +966,14 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
 	err = sh_css_sp_write_frame_pointers(args);
 	/* TODO: move it to a better place */
-	if (binary->info->sp.enable.s3a)
-	{
+	if (binary->info->sp.enable.s3a) {
 		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_3A_STATISTICS, thread_id,
 					       &queue_id);
 		sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.s3a_buf, queue_id,
 						    mmgr_EXCEPTION,
 						    IA_CSS_BUFFER_TYPE_3A_STATISTICS);
 	}
-	if (binary->info->sp.enable.dis)
-	{
+	if (binary->info->sp.enable.dis) {
 		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_DIS_STATISTICS, thread_id,
 					       &queue_id);
 		sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.dvs_buf, queue_id,
@@ -1041,21 +1009,24 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
 	initialize_isp_states(binary);
 
-	/* we do this only for preview pipe because in fill_binary_info function
+	/*
+	 * we do this only for preview pipe because in fill_binary_info function
 	 * we assign vf_out res to out res, but for ISP internal processing, we need
 	 * the original out res. for video pipe, it has two output pins --- out and
-	 * vf_out, so it can keep these two resolutions already. */
+	 * vf_out, so it can keep these two resolutions already.
+	 */
 	if (binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_PREVIEW &&
-	    (binary->vf_downscale_log2 > 0))
-	{
-		/* TODO: Remove this after preview output decimation is fixed
-		 * by configuring out&vf info fiels properly */
+	    (binary->vf_downscale_log2 > 0)) {
+		/*
+		 * TODO: Remove this after preview output decimation is fixed
+		 * by configuring out&vf info files properly
+		 */
 		sh_css_sp_stage.frames.out[0].info.padded_width
-		<<= binary->vf_downscale_log2;
+			<<= binary->vf_downscale_log2;
 		sh_css_sp_stage.frames.out[0].info.res.width
-		<<= binary->vf_downscale_log2;
+			<<= binary->vf_downscale_log2;
 		sh_css_sp_stage.frames.out[0].info.res.height
-		<<= binary->vf_downscale_log2;
+			<<= binary->vf_downscale_log2;
 	}
 	err = copy_isp_mem_if_to_ddr(binary);
 	if (err)
@@ -1064,12 +1035,10 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	return 0;
 }
 
-static int
-sp_init_stage(struct ia_css_pipeline_stage *stage,
-	      unsigned int pipe_num,
-	      bool xnr,
-	      unsigned int if_config_index,
-	      bool two_ppc) {
+static int sp_init_stage(struct ia_css_pipeline_stage *stage,
+			 unsigned int pipe_num, bool xnr,
+			 unsigned int if_config_index, bool two_ppc)
+{
 	struct ia_css_binary *binary;
 	const struct ia_css_fw_info *firmware;
 	const struct sh_css_binary_args *args;
@@ -1080,20 +1049,22 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
 	 */
 	const char *binary_name = "";
 	const struct ia_css_binary_xinfo *info = NULL;
-	/* note: the var below is made static as it is quite large;
-	   if it is not static it ends up on the stack which could
-	   cause issues for drivers
-	*/
+	/*
+	 * note: the var below is made static as it is quite large;
+	 * if it is not static it ends up on the stack which could
+	 * cause issues for drivers
+	 */
 	static struct ia_css_binary tmp_binary;
 	const struct ia_css_blob_info *blob_info = NULL;
 	struct ia_css_isp_param_css_segments isp_mem_if;
-	/* LA: should be ia_css_data, should not contain host pointer.
-	   However, CSS/DDR pointer is not available yet.
-	   Hack is to store it in params->ddr_ptrs and then copy it late in the SP just before vmem init.
-	   TODO: Call this after CSS/DDR allocation and store that pointer.
-	   Best is to allocate it at stage creation time together with host pointer.
-	   Remove vmem from params.
-	*/
+	/*
+	 * LA: should be ia_css_data, should not contain host pointer.
+	 * However, CSS/DDR pointer is not available yet.
+	 * Hack is to store it in params->ddr_ptrs and then copy it late in the SP just before vmem init.
+	 * TODO: Call this after CSS/DDR allocation and store that pointer.
+	 * Best is to allocate it at stage creation time together with host pointer.
+	 * Remove vmem from params.
+	 */
 	struct ia_css_isp_param_css_segments *mem_if = &isp_mem_if;
 
 	int err = 0;
@@ -1105,14 +1076,12 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
 	args = &stage->args;
 	stage_num = stage->stage_num;
 
-	if (binary)
-	{
+	if (binary) {
 		info = binary->info;
 		binary_name = (const char *)(info->blob->name);
 		blob_info = &info->blob->header.blob;
 		ia_css_init_memory_interface(mem_if, &binary->mem_params, &binary->css_params);
-	} else if (firmware)
-	{
+	} else if (firmware) {
 		const struct ia_css_frame_info *out_infos[IA_CSS_BINARY_MAX_OUTPUT_PORTS] = {NULL};
 
 		if (args->out_frame[0])
@@ -1120,49 +1089,37 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
 		info = &firmware->info.isp;
 		ia_css_binary_fill_info(info, false, false,
 					ATOMISP_INPUT_FORMAT_RAW_10,
-					args->in_frame  ? &args->in_frame->info  : NULL,
-					NULL,
-					out_infos,
-					args->out_vf_frame ? &args->out_vf_frame->info
-					: NULL,
-					&tmp_binary,
-					NULL,
-					-1, true);
+					args->in_frame ? &args->in_frame->info : NULL,
+					NULL, out_infos,
+					args->out_vf_frame ? &args->out_vf_frame->info : NULL,
+					&tmp_binary, NULL, -1, true);
 		binary = &tmp_binary;
 		binary->info = info;
 		binary_name = IA_CSS_EXT_ISP_PROG_NAME(firmware);
 		blob_info = &firmware->blob;
 		mem_if = (struct ia_css_isp_param_css_segments *)&firmware->mem_initializers;
-	} else
-	{
+	} else {
 		/* SP stage */
 		assert(stage->sp_func != IA_CSS_PIPELINE_NO_FUNC);
-		/* binary and blob_info are now NULL.
-		   These will be passed to sh_css_sp_init_stage
-		   and dereferenced there, so passing a NULL
-		   pointer is no good. return an error */
+		/*
+		 * binary and blob_info are now NULL.
+		 * These will be passed to sh_css_sp_init_stage
+		 * and dereferenced there, so passing a NULL
+		 * pointer is no good. return an error
+		 */
 		return -EINVAL;
 	}
 
-	err = sh_css_sp_init_stage(binary,
-				   (const char *)binary_name,
-				   blob_info,
-				   args,
-				   pipe_num,
-				   stage_num,
-				   xnr,
-				   mem_if,
-				   if_config_index,
-				   two_ppc);
+	err = sh_css_sp_init_stage(binary, (const char *)binary_name, blob_info,
+				   args, pipe_num, stage_num, xnr, mem_if,
+				   if_config_index, two_ppc);
 	return err;
 }
 
-static void
-sp_init_sp_stage(struct ia_css_pipeline_stage *stage,
-		 unsigned int pipe_num,
-		 bool two_ppc,
-		 enum sh_css_pipe_config_override copy_ovrd,
-		 unsigned int if_config_index)
+static void sp_init_sp_stage(struct ia_css_pipeline_stage *stage,
+			     unsigned int pipe_num, bool two_ppc,
+			     enum sh_css_pipe_config_override copy_ovrd,
+			     unsigned int if_config_index)
 {
 	const struct sh_css_binary_args *args = &stage->args;
 
@@ -1187,14 +1144,9 @@ sp_init_sp_stage(struct ia_css_pipeline_stage *stage,
 	}
 }
 
-void
-sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
-			enum ia_css_pipe_id id,
-			u8 pipe_num,
-			bool xnr,
-			bool two_ppc,
-			bool continuous,
-			bool offline,
+void sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
+			enum ia_css_pipe_id id, u8 pipe_num, bool xnr,
+			bool two_ppc, bool continuous, bool offline,
 			unsigned int required_bds_factor,
 			enum sh_css_pipe_config_override copy_ovrd,
 			enum ia_css_input_mode input_mode,
@@ -1204,8 +1156,8 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 			const struct ia_css_coordinate
 			*internal_frame_origin_bqs_on_sctbl, /* Origin of internal frame
 							positioned on shading table at shading correction in ISP. */
-			const struct ia_css_isp_parameters *params
-		       ) {
+			const struct ia_css_isp_parameters *params)
+{
 	/* Get first stage */
 	struct ia_css_pipeline_stage *stage        = NULL;
 	struct ia_css_binary	     *first_binary = NULL;
@@ -1223,17 +1175,13 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	first_binary = me->stages->binary;
 
 	if (input_mode == IA_CSS_INPUT_MODE_SENSOR ||
-	    input_mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-	{
+	    input_mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		assert(port_id < N_MIPI_PORT_ID);
 		if (port_id >= N_MIPI_PORT_ID) /* should not happen but KW does not know */
 			return; /* we should be able to return an error */
 		if_config_index  = (uint8_t)(port_id - MIPI_PORT0_ID);
-	} else if (input_mode == IA_CSS_INPUT_MODE_MEMORY)
-	{
-		if_config_index = SH_CSS_IF_CONFIG_NOT_NEEDED;
-	} else
-	{
+	} else if (input_mode == IA_CSS_INPUT_MODE_MEMORY) {
+		if_config_index = SH_CSS_IF_CONFIG_NOT_NEEDED; } else {
 		if_config_index = 0x0;
 	}
 
@@ -1241,15 +1189,13 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	memset(&sh_css_sp_group.pipe[thread_id], 0, sizeof(struct sh_css_sp_pipeline));
 
 	/* Count stages */
-	for (stage = me->stages, num = 0; stage; stage = stage->next, num++)
-	{
+	for (stage = me->stages, num = 0; stage; stage = stage->next, num++) {
 		stage->stage_num = num;
 		ia_css_debug_pipe_graph_dump_stage(stage, id);
 	}
 	me->num_stages = num;
 
-	if (first_binary)
-	{
+	if (first_binary) {
 		/* Init pipeline data */
 		sh_css_sp_init_group(two_ppc, first_binary->input_format,
 				     offline, if_config_index);
@@ -1270,21 +1216,23 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	sh_css_sp_group.pipe[thread_id].num_execs = me->num_execs;
 	sh_css_sp_group.pipe[thread_id].pipe_qos_config = me->pipe_qos_config;
 	sh_css_sp_group.pipe[thread_id].required_bds_factor = required_bds_factor;
-	sh_css_sp_group.pipe[thread_id].input_system_mode
-	= (uint32_t)input_mode;
+	sh_css_sp_group.pipe[thread_id].input_system_mode = (uint32_t)input_mode;
 	sh_css_sp_group.pipe[thread_id].port_id = port_id;
 	sh_css_sp_group.pipe[thread_id].dvs_frame_delay = (uint32_t)me->dvs_frame_delay;
 
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
-	if (ia_css_pipeline_uses_params(me))
-	{
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
+	if (ia_css_pipeline_uses_params(me)) {
 		sh_css_sp_group.pipe[thread_id].pipe_config =
 		SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id;
 	}
 
-	/* For continuous use-cases, SP copy is responsible for sampling the
-	 * parameters */
+	/*
+	 * For continuous use-cases, SP copy is responsible for sampling the
+	 * parameters
+	 */
 	if (continuous)
 		sh_css_sp_group.pipe[thread_id].pipe_config = 0;
 
@@ -1293,14 +1241,12 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	pipe = find_pipe_by_num(pipe_num);
 	assert(pipe);
 	if (!pipe)
-	{
 		return;
-	}
+
 	sh_css_sp_group.pipe[thread_id].scaler_pp_lut = sh_css_pipe_get_pp_gdc_lut(pipe);
 
 #if defined(SH_CSS_ENABLE_METADATA)
-	if (md_info && md_info->size > 0)
-	{
+	if (md_info && md_info->size > 0) {
 		sh_css_sp_group.pipe[thread_id].metadata.width  = md_info->resolution.width;
 		sh_css_sp_group.pipe[thread_id].metadata.height = md_info->resolution.height;
 		sh_css_sp_group.pipe[thread_id].metadata.stride = md_info->stride;
@@ -1316,8 +1262,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 
 #if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 	sh_css_sp_group.pipe[thread_id].output_frame_queue_id = (uint32_t)SH_CSS_INVALID_QUEUE_ID;
-	if (pipe_id != IA_CSS_PIPE_ID_COPY)
-	{
+	if (pipe_id != IA_CSS_PIPE_ID_COPY) {
 		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, thread_id,
 					       (enum sh_css_queue_id *)(
 						   &sh_css_sp_group.pipe[thread_id].output_frame_queue_id));
@@ -1325,18 +1270,17 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 #endif
 
 	if (IS_ISP2401) {
-		/* For the shading correction type 1 (the legacy shading table conversion in css is not used),
-		* the parameters are passed to the isp for the shading table centering.
-		*/
+		/*
+		 * For the shading correction type 1 (the legacy shading table conversion in css is not used),
+		 * the parameters are passed to the isp for the shading table centering.
+		 */
 		if (internal_frame_origin_bqs_on_sctbl &&
-		    params && params->shading_settings.enable_shading_table_conversion == 0)
-		{
+		    params && params->shading_settings.enable_shading_table_conversion == 0) {
 			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_x_bqs_on_sctbl
 			= (uint32_t)internal_frame_origin_bqs_on_sctbl->x;
 			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_y_bqs_on_sctbl
 			= (uint32_t)internal_frame_origin_bqs_on_sctbl->y;
-		} else
-		{
+		} else {
 			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_x_bqs_on_sctbl =
 			0;
 			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_y_bqs_on_sctbl =
@@ -1347,8 +1291,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe_id, sh_css_sp_group.pipe[thread_id].inout_port_config);
 
-	for (stage = me->stages, num = 0; stage; stage = stage->next, num++)
-	{
+	for (stage = me->stages, num = 0; stage; stage = stage->next, num++) {
 		sh_css_sp_group.pipe[thread_id].num_stages++;
 		if (is_sp_stage(stage)) {
 			sp_init_sp_stage(stage, pipe_num, two_ppc,
@@ -1370,8 +1313,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	store_sp_group_data();
 }
 
-void
-sh_css_sp_uninit_pipeline(unsigned int pipe_num)
+void sh_css_sp_uninit_pipeline(unsigned int pipe_num)
 {
 	unsigned int thread_id;
 
@@ -1399,8 +1341,8 @@ bool sh_css_write_host2sp_command(enum host2sp_commands host2sp_command)
 	return (last_cmd == host2sp_cmd_ready);
 }
 
-enum host2sp_commands
-sh_css_read_host2sp_command(void) {
+enum host2sp_commands sh_css_read_host2sp_command(void)
+{
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset = (unsigned int)offsetof(struct host_sp_communication, host2sp_command)
 	/ sizeof(int);
@@ -1412,15 +1354,14 @@ sh_css_read_host2sp_command(void) {
  * Frame data is no longer part of the sp_stage structure but part of a
  * separate structure. The aim is to make the sp_data struct static
  * (it defines a pipeline) and that the dynamic (per frame) data is stored
- * separetly.
+ * separately.
  *
  * This function must be called first every where were you start constructing
  * a new pipeline by defining one or more stages with use of variable
  * sh_css_sp_stage. Even the special cases like accelerator and copy_frame
  * These have a pipeline of just 1 stage.
  */
-void
-sh_css_init_host2sp_frame_data(void)
+void sh_css_init_host2sp_frame_data(void)
 {
 	/* Clean table */
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
@@ -1438,11 +1379,9 @@ sh_css_init_host2sp_frame_data(void)
  * @brief Update the offline frame information in host_sp_communication.
  * Refer to "sh_css_sp.h" for more details.
  */
-void
-sh_css_update_host2sp_offline_frame(
-    unsigned int frame_num,
-    struct ia_css_frame *frame,
-    struct ia_css_metadata *metadata)
+void sh_css_update_host2sp_offline_frame(unsigned int frame_num,
+					 struct ia_css_frame *frame,
+					 struct ia_css_metadata *metadata)
 {
 	unsigned int HIVE_ADDR_host_sp_com;
 	unsigned int offset;
@@ -1469,10 +1408,8 @@ sh_css_update_host2sp_offline_frame(
  * @brief Update the mipi frame information in host_sp_communication.
  * Refer to "sh_css_sp.h" for more details.
  */
-void
-sh_css_update_host2sp_mipi_frame(
-    unsigned int frame_num,
-    struct ia_css_frame *frame)
+void sh_css_update_host2sp_mipi_frame(unsigned int frame_num,
+				      struct ia_css_frame *frame)
 {
 	unsigned int HIVE_ADDR_host_sp_com;
 	unsigned int offset;
@@ -1495,10 +1432,8 @@ sh_css_update_host2sp_mipi_frame(
  * @brief Update the mipi metadata information in host_sp_communication.
  * Refer to "sh_css_sp.h" for more details.
  */
-void
-sh_css_update_host2sp_mipi_metadata(
-    unsigned int frame_num,
-    struct ia_css_metadata *metadata)
+void sh_css_update_host2sp_mipi_metadata(unsigned int frame_num,
+					 struct ia_css_metadata *metadata)
 {
 	unsigned int HIVE_ADDR_host_sp_com;
 	unsigned int o;
@@ -1515,8 +1450,7 @@ sh_css_update_host2sp_mipi_metadata(
 			    metadata ? metadata->address : 0);
 }
 
-void
-sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames)
+void sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames)
 {
 	unsigned int HIVE_ADDR_host_sp_com;
 	unsigned int offset;
@@ -1552,16 +1486,15 @@ sh_css_update_host2sp_cont_num_raw_frames(unsigned int num_frames,
 						      host2sp_cont_extra_num_raw_frames)
 			       / sizeof(int);
 		store_sp_array_uint(host_sp_com, offset_extra, extra_num_frames);
-	} else
+	} else {
 		offset = (unsigned int)offsetof(struct host_sp_communication,
 						host2sp_cont_target_num_raw_frames)
 			 / sizeof(int);
-
+	}
 	store_sp_array_uint(host_sp_com, offset, num_frames);
 }
 
-void
-sh_css_event_init_irq_mask(void)
+void sh_css_event_init_irq_mask(void)
 {
 	int i;
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
@@ -1586,7 +1519,8 @@ sh_css_event_init_irq_mask(void)
 int
 ia_css_pipe_set_irq_mask(struct ia_css_pipe *pipe,
 			 unsigned int or_mask,
-			 unsigned int and_mask) {
+			 unsigned int and_mask)
+{
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset;
 	struct sh_css_event_irq_mask event_irq_mask;
@@ -1625,7 +1559,8 @@ ia_css_pipe_set_irq_mask(struct ia_css_pipe *pipe,
 int
 ia_css_event_get_irq_mask(const struct ia_css_pipe *pipe,
 			  unsigned int *or_mask,
-			  unsigned int *and_mask) {
+			  unsigned int *and_mask)
+{
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset;
 	struct sh_css_event_irq_mask event_irq_mask;
-- 
2.30.2



