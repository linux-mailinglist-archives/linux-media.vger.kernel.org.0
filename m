Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917AD36FDEE
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhD3PlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:41:24 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:51998 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230167AbhD3PlV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619797218; bh=VtJSbhf4CgRXIZv64t8RUB5gBBZoEaVk4i7M0VvLfak=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=SYrmYRKEa3pXEIEDZBbn8MfeY6p71r7Cz14At8uKBX0YyVCviLaUOsmLxgbGzgJfT
         62rCk78ADi7aZXuNcutYnFW/2rWGC84TT0n387YqtAtxO0TcaasDKk75z/31uy233I
         GeTPBb++f2UZTM66+VYI/nzTllE2F3JANLDaulUM=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 30 Apr 2021 17:40:18 +0200 (CEST)
X-EA-Auth: Z7+xdNEo8zKJTJEm+KnfgCYF4UG0cMvuX/0nb+QJjr7Z4ZAn1rt31LTElfGUdrYZC1gB5FSps7MJHo9nW5LzEPBiVyxvGXUB
Date:   Fri, 30 Apr 2021 21:10:12 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH] staging: media: atomisp: pci: reposition braces as per
 coding style
Message-ID: <YIwk3KbVGRPJwKa4@dU2104>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Misplaced braces makes it difficult to follow the code easily. This also
goes against the code style guidelines. This resolved following checkpatch
complaints:

ERROR: open brace '{' following function definitions go on the next line
ERROR: that open brace { should be on the previous line

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Please Note: There are several other checkpatch triggered warnings and
errors that should be addressed in separate patches.


 .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |  69 +++----
 .../staging/media/atomisp/pci/sh_css_params.c | 171 ++++++++----------
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 108 +++++------
 .../media/atomisp/pci/sh_css_version.c        |   3 +-
 5 files changed, 157 insertions(+), 197 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 060b8765ae96..200f16994f3a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -29,7 +29,8 @@ static struct v4l2_mbus_framefmt *__csi2_get_format(struct
 	v4l2_subdev_pad_config *cfg,
 	enum
 	v4l2_subdev_format_whence
-	which, unsigned int pad) {
+	which, unsigned int pad)
+{
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
 	else
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 3f34cc81be87..75489f7d75ee 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -91,7 +91,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 				 const enum atomisp_input_format format,
 				 const bool hasSOLandEOL,
 				 const unsigned int embedded_data_size_words,
-				 unsigned int *size_mem_words) {
+				 unsigned int *size_mem_words)
+{
 	int err = 0;
 
 	unsigned int bits_per_pixel = 0;
@@ -118,8 +119,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	IA_CSS_ENTER("padded_width=%d, height=%d, format=%d, hasSOLandEOL=%d, embedded_data_size_words=%d\n",
 		     width_padded, height, format, hasSOLandEOL, embedded_data_size_words);
 
-	switch (format)
-	{
+	switch (format) {
 	case ATOMISP_INPUT_FORMAT_RAW_6:		/* 4p, 3B, 24bits */
 		bits_per_pixel = 6;
 		break;
@@ -178,12 +178,10 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	/* Even lines for YUV420 formats are double in bits_per_pixel. */
 	if (format == ATOMISP_INPUT_FORMAT_YUV420_8
 	    || format == ATOMISP_INPUT_FORMAT_YUV420_10
-	    || format == ATOMISP_INPUT_FORMAT_YUV420_16)
-	{
+	    || format == ATOMISP_INPUT_FORMAT_YUV420_16) {
 		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >>
 			3; /* ceil ( bits per line / 8) */
-	} else
-	{
+	} else {
 		even_line_bytes = odd_line_bytes;
 	}
 
@@ -236,7 +234,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 #if !defined(ISP2401)
 int
 ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
-				       const unsigned int	size_mem_words) {
+				       const unsigned int	size_mem_words)
+{
 	u32 idx;
 
 	int err = -EBUSY;
@@ -246,11 +245,9 @@ ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
 
 	for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT &&
 	     my_css.mipi_sizes_for_check[port][idx] != 0;
-	     idx++)   /* do nothing */
-	{
+	     idx++) { /* do nothing */
 	}
-	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT)
-	{
+	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT) {
 		my_css.mipi_sizes_for_check[port][idx] = size_mem_words;
 		err = 0;
 	}
@@ -271,7 +268,8 @@ mipi_init(void)
 int
 calculate_mipi_buff_size(
     struct ia_css_stream_config *stream_cfg,
-    unsigned int *size_mem_words) {
+    unsigned int *size_mem_words)
+{
 #if !defined(ISP2401)
 	int err = -EINVAL;
 	(void)stream_cfg;
@@ -346,12 +344,10 @@ calculate_mipi_buff_size(
 
 	/* Even lines for YUV420 formats are double in bits_per_pixel. */
 	if (format == ATOMISP_INPUT_FORMAT_YUV420_8
-	    || format == ATOMISP_INPUT_FORMAT_YUV420_10)
-	{
+	    || format == ATOMISP_INPUT_FORMAT_YUV420_10) {
 		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >>
 			3; /* ceil ( bits per line / 8) */
-	} else
-	{
+	} else {
 		even_line_bytes = odd_line_bytes;
 	}
 
@@ -393,7 +389,8 @@ static bool buffers_needed(struct ia_css_pipe *pipe)
 
 int
 allocate_mipi_frames(struct ia_css_pipe *pipe,
-		     struct ia_css_stream_info *info) {
+		     struct ia_css_stream_info *info)
+{
 	int err = -EINVAL;
 	unsigned int port;
 
@@ -402,8 +399,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 
 	assert(pipe);
 	assert(pipe->stream);
-	if ((!pipe) || (!pipe->stream))
-	{
+	if ((!pipe) || (!pipe->stream)) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
 				    pipe);
@@ -411,8 +407,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	}
 
 #ifdef ISP2401
-	if (pipe->stream->config.online)
-	{
+	if (pipe->stream->config.online) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
 				    pipe);
@@ -449,8 +444,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 #endif
 
 #if !defined(ISP2401)
-	if (ref_count_mipi_allocation[port] != 0)
-	{
+	if (ref_count_mipi_allocation[port] != 0) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
 				    pipe, port);
@@ -462,8 +456,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	 * TODO AM: Once that is changed (removed) this code should be removed as well.
 	 * In that case only 2400 related code should remain.
 	 */
-	if (ref_count_mipi_allocation[port] != 0)
-	{
+	if (ref_count_mipi_allocation[port] != 0) {
 		ref_count_mipi_allocation[port]++;
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
@@ -481,8 +474,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	{ /* limit the scope of i,j */
 		unsigned int i, j;
 
-		for (i = 0; i < my_css.num_mipi_frames[port]; i++)
-		{
+		for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
 			/* free previous frame */
 			if (my_css.mipi_frames[port][i]) {
 				ia_css_frame_free(my_css.mipi_frames[port][i]);
@@ -535,7 +527,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 }
 
 int
-free_mipi_frames(struct ia_css_pipe *pipe) {
+free_mipi_frames(struct ia_css_pipe *pipe)
+{
 	int err = -EINVAL;
 	unsigned int port;
 
@@ -543,8 +536,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 			    "free_mipi_frames(%p) enter:\n", pipe);
 
 	/* assert(pipe != NULL); TEMP: TODO: Should be assert only. */
-	if (pipe)
-	{
+	if (pipe) {
 		assert(pipe->stream);
 		if ((!pipe) || (!pipe->stream)) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
@@ -620,8 +612,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 			}
 #endif
 		}
-	} else   /* pipe ==NULL */
-	{
+	} else { /* pipe ==NULL */
 		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */
 		for (port = CSI_PORT0_ID; port < N_CSI_PORTS; port++) {
 			unsigned int i;
@@ -645,7 +636,8 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 }
 
 int
-send_mipi_frames(struct ia_css_pipe *pipe) {
+send_mipi_frames(struct ia_css_pipe *pipe)
+{
 	int err = -EINVAL;
 	unsigned int i;
 #ifndef ISP2401
@@ -658,8 +650,7 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 
 	assert(pipe);
 	assert(pipe->stream);
-	if (!pipe || !pipe->stream)
-	{
+	if (!pipe || !pipe->stream) {
 		IA_CSS_ERROR("pipe or stream is null");
 		return -EINVAL;
 	}
@@ -686,8 +677,7 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 	}
 
 	/* Hand-over the SP-internal mipi buffers */
-	for (i = 0; i < my_css.num_mipi_frames[port]; i++)
-	{
+	for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
 		/* Need to include the ofset for port. */
 		sh_css_update_host2sp_mipi_frame(port * NUM_MIPI_FRAMES_PER_STREAM + i,
 						 my_css.mipi_frames[port][i]);
@@ -700,8 +690,7 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 	 * Send an event to inform the SP
 	 * that all MIPI frames are passed.
 	 **********************************/
-	if (!sh_css_sp_is_running())
-	{
+	if (!sh_css_sp_is_running()) {
 		/* SP is not running. The queues are not valid */
 		IA_CSS_ERROR("sp is not running");
 		return err;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 644e14575987..dbd3bfe3d343 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -813,15 +813,15 @@ convert_allocate_fpntbl(struct ia_css_isp_parameters *params)
 }
 
 static int
-store_fpntbl(struct ia_css_isp_parameters *params, ia_css_ptr ptr) {
+store_fpntbl(struct ia_css_isp_parameters *params, ia_css_ptr ptr)
+{
 	struct ia_css_host_data *isp_data;
 
 	assert(params);
 	assert(ptr != mmgr_NULL);
 
 	isp_data = convert_allocate_fpntbl(params);
-	if (!isp_data)
-	{
+	if (!isp_data) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
@@ -894,7 +894,8 @@ ia_css_process_kernel(struct ia_css_stream *stream,
 
 static int
 sh_css_select_dp_10bpp_config(const struct ia_css_pipe *pipe,
-			      bool *is_dp_10bpp) {
+			      bool *is_dp_10bpp)
+{
 	int err = 0;
 	/* Currently we check if 10bpp DPC configuration is required based
 	 * on the use case,i.e. if BDS and DPC is both enabled. The more cleaner
@@ -903,12 +904,10 @@ sh_css_select_dp_10bpp_config(const struct ia_css_pipe *pipe,
 	 * implementation. (This is because the configuration is set before a
 	 * binary is selected, and the binary info is not available)
 	 */
-	if ((!pipe) || (!is_dp_10bpp))
-	{
+	if ((!pipe) || (!is_dp_10bpp)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		err = -EINVAL;
-	} else
-	{
+	} else {
 		*is_dp_10bpp = false;
 
 		/* check if DPC is enabled from the host */
@@ -936,7 +935,8 @@ sh_css_select_dp_10bpp_config(const struct ia_css_pipe *pipe,
 
 int
 sh_css_set_black_frame(struct ia_css_stream *stream,
-		       const struct ia_css_frame *raw_black_frame) {
+		       const struct ia_css_frame *raw_black_frame)
+{
 	struct ia_css_isp_parameters *params;
 	/* this function desperately needs to be moved to the ISP or SP such
 	 * that it can use the DMA.
@@ -957,13 +957,11 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	IA_CSS_ENTER_PRIVATE("black_frame=%p", raw_black_frame);
 
 	if (params->fpn_config.data &&
-	    (params->fpn_config.width != width || params->fpn_config.height != height))
-	{
+	    (params->fpn_config.width != width || params->fpn_config.height != height)) {
 		kvfree(params->fpn_config.data);
 		params->fpn_config.data = NULL;
 	}
-	if (!params->fpn_config.data)
-	{
+	if (!params->fpn_config.data) {
 		params->fpn_config.data = kvmalloc(height * width *
 						   sizeof(short), GFP_KERNEL);
 		if (!params->fpn_config.data) {
@@ -977,8 +975,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	}
 
 	/* store raw to fpntbl */
-	for (y = 0; y < height; y++)
-	{
+	for (y = 0; y < height; y++) {
 		for (x = 0; x < width; x += (ISP_VEC_NELEMS * 2)) {
 			int ofs = y * width + x;
 
@@ -1181,7 +1178,8 @@ sh_css_enable_pipeline(const struct ia_css_binary *binary)
 static int
 ia_css_process_zoom_and_motion(
     struct ia_css_isp_parameters *params,
-    const struct ia_css_pipeline_stage *first_stage) {
+    const struct ia_css_pipeline_stage *first_stage)
+{
 	/* first_stage can be  NULL */
 	const struct ia_css_pipeline_stage *stage;
 	int err = 0;
@@ -1195,8 +1193,7 @@ ia_css_process_zoom_and_motion(
 	IA_CSS_ENTER_PRIVATE("");
 
 	/* Go through all stages to udate uds and cropping */
-	for (stage = first_stage; stage; stage = stage->next)
-	{
+	for (stage = first_stage; stage; stage = stage->next) {
 		struct ia_css_binary *binary;
 		/* note: the var below is made static as it is quite large;
 		   if it is not static it ends up on the stack which could
@@ -1581,7 +1578,8 @@ ia_css_isp_3a_statistics_map_allocate(
 
 int
 ia_css_get_3a_statistics(struct ia_css_3a_statistics           *host_stats,
-			 const struct ia_css_isp_3a_statistics *isp_stats) {
+			 const struct ia_css_isp_3a_statistics *isp_stats)
+{
 	struct ia_css_isp_3a_statistics_map *map;
 	int ret = 0;
 
@@ -1591,13 +1589,11 @@ ia_css_get_3a_statistics(struct ia_css_3a_statistics           *host_stats,
 	assert(isp_stats);
 
 	map = ia_css_isp_3a_statistics_map_allocate(isp_stats, NULL);
-	if (map)
-	{
+	if (map) {
 		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_3a_statistics(host_stats, map);
 		ia_css_isp_3a_statistics_map_free(map);
-	} else
-	{
+	} else {
 		IA_CSS_ERROR("out of memory");
 		ret = -ENOMEM;
 	}
@@ -1894,7 +1890,8 @@ sh_css_pipe_isp_config_get(struct ia_css_pipe *pipe)
 int
 ia_css_stream_set_isp_config(
     struct ia_css_stream *stream,
-    const struct ia_css_isp_config *config) {
+    const struct ia_css_isp_config *config)
+{
 	return ia_css_stream_set_isp_config_on_pipe(stream, config, NULL);
 }
 
@@ -1902,7 +1899,8 @@ int
 ia_css_stream_set_isp_config_on_pipe(
     struct ia_css_stream *stream,
     const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
 	if ((!stream) || (!config))
@@ -1923,7 +1921,8 @@ ia_css_stream_set_isp_config_on_pipe(
 
 int
 ia_css_pipe_set_isp_config(struct ia_css_pipe *pipe,
-			   struct ia_css_isp_config *config) {
+			   struct ia_css_isp_config *config)
+{
 	struct ia_css_pipe *pipe_in = pipe;
 	int err = 0;
 
@@ -1948,7 +1947,8 @@ static int
 sh_css_set_global_isp_config_on_pipe(
     struct ia_css_pipe *curr_pipe,
     const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	int err = 0;
 	int err1 = 0;
 	int err2 = 0;
@@ -1977,7 +1977,8 @@ static int
 sh_css_set_per_frame_isp_config_on_pipe(
     struct ia_css_stream *stream,
     const struct ia_css_isp_config *config,
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	unsigned int i;
 	bool per_frame_config_created = false;
 	int err = 0;
@@ -1991,8 +1992,7 @@ sh_css_set_per_frame_isp_config_on_pipe(
 
 	IA_CSS_ENTER_PRIVATE("stream=%p, config=%p, pipe=%p", stream, config, pipe);
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		err = -EINVAL;
 		goto exit;
 	}
@@ -2000,8 +2000,7 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	/* create per-frame ISP params object with default values
 	 * from stream->isp_params_configs if one doesn't already exist
 	*/
-	if (!stream->per_frame_isp_params_configs)
-	{
+	if (!stream->per_frame_isp_params_configs) {
 		err = sh_css_create_isp_params(stream,
 					       &stream->per_frame_isp_params_configs);
 		if (err)
@@ -2012,15 +2011,13 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	params = stream->per_frame_isp_params_configs;
 
 	/* update new ISP params object with the new config */
-	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))
-	{
+	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
 		err1 = -EINVAL;
 	}
 
 	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
 
-	if (per_frame_config_created)
-	{
+	if (per_frame_config_created) {
 		ddr_ptrs = &params->ddr_ptrs;
 		ddr_ptrs_size = &params->ddr_ptrs_size;
 		/* create per pipe reference to general ddr_ptrs */
@@ -2051,7 +2048,8 @@ static int
 sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 				   struct ia_css_isp_parameters *params,
 				   const struct ia_css_isp_config *config,
-				   struct ia_css_pipe *pipe_in) {
+				   struct ia_css_pipe *pipe_in)
+{
 	int err = 0;
 	bool is_dp_10bpp = true;
 
@@ -2096,8 +2094,7 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 	}
 
 	if (0 ==
-	    sh_css_select_dp_10bpp_config(pipe, &is_dp_10bpp))
-	{
+	    sh_css_select_dp_10bpp_config(pipe, &is_dp_10bpp)) {
 		/* return an error when both DPC and BDS is enabled by the
 		 * user. */
 		/* we do not exit from this point immediately to allow internal
@@ -2105,8 +2102,7 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 		if (is_dp_10bpp) {
 			err = -EINVAL;
 		}
-	} else
-	{
+	} else {
 		err = -EINVAL;
 		goto exit;
 	}
@@ -2359,7 +2355,8 @@ static unsigned int g_param_buffer_dequeue_count;
 static unsigned int g_param_buffer_enqueue_count;
 
 int
-ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
+ia_css_stream_isp_parameters_init(struct ia_css_stream *stream)
+{
 	int err = 0;
 	unsigned int i;
 	struct sh_css_ddr_address_map *ddr_ptrs;
@@ -2369,8 +2366,7 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 	assert(stream);
 	IA_CSS_ENTER_PRIVATE("void");
 
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -2385,8 +2381,7 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 		goto ERR;
 
 	params = stream->isp_params_configs;
-	if (!sh_css_init_isp_params_from_global(stream, params, true, NULL))
-	{
+	if (!sh_css_init_isp_params_from_global(stream, params, true, NULL)) {
 		/* we do not return the error immediately to enable internal
 		 * firmware feature testing */
 		err = -EINVAL;
@@ -2396,8 +2391,7 @@ ia_css_stream_isp_parameters_init(struct ia_css_stream *stream) {
 	ddr_ptrs_size = &params->ddr_ptrs_size;
 
 	/* create per pipe reference to general ddr_ptrs */
-	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		ref_sh_css_ddr_address_map(ddr_ptrs, &params->pipe_ddr_ptrs[i]);
 		params->pipe_ddr_ptrs_size[i] = *ddr_ptrs_size;
 	}
@@ -2431,7 +2425,8 @@ ia_css_set_sdis2_config(
 
 static int
 sh_css_create_isp_params(struct ia_css_stream *stream,
-			 struct ia_css_isp_parameters **isp_params_out) {
+			 struct ia_css_isp_parameters **isp_params_out)
+{
 	bool succ = true;
 	unsigned int i;
 	struct sh_css_ddr_address_map *ddr_ptrs;
@@ -2441,23 +2436,20 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	struct ia_css_isp_parameters *params =
 	kvmalloc(sizeof(struct ia_css_isp_parameters), GFP_KERNEL);
 
-	if (!params)
-	{
+	if (!params) {
 		*isp_params_out = NULL;
 		err = -ENOMEM;
 		IA_CSS_ERROR("%s:%d error: cannot allocate memory", __FILE__, __LINE__);
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else
-	{
+	} else {
 		memset(params, 0, sizeof(struct ia_css_isp_parameters));
 	}
 
 	ddr_ptrs = &params->ddr_ptrs;
 	ddr_ptrs_size = &params->ddr_ptrs_size;
 
-	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++) {
 		memset(&params->pipe_ddr_ptrs[i], 0,
 		       sizeof(params->pipe_ddr_ptrs[i]));
 		memset(&params->pipe_ddr_ptrs_size[i], 0,
@@ -2714,7 +2706,8 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 }
 
 int
-sh_css_params_init(void) {
+sh_css_params_init(void)
+{
 	int i, p;
 
 	IA_CSS_ENTER_PRIVATE("void");
@@ -2723,8 +2716,7 @@ sh_css_params_init(void) {
 	g_param_buffer_dequeue_count = 0;
 	g_param_buffer_enqueue_count = 0;
 
-	for (p = 0; p < IA_CSS_PIPE_ID_NUM; p++)
-	{
+	for (p = 0; p < IA_CSS_PIPE_ID_NUM; p++) {
 		for (i = 0; i < SH_CSS_MAX_STAGES; i++) {
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
@@ -2762,8 +2754,7 @@ sh_css_params_init(void) {
 								 ATOMISP_MAP_FLAG_CLEARED));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
-	    (xmem_sp_group_ptrs == mmgr_NULL))
-	{
+	    (xmem_sp_group_ptrs == mmgr_NULL)) {
 		ia_css_uninit();
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
@@ -3094,14 +3085,14 @@ store_morph_plane(
     unsigned int width,
     unsigned int height,
     ia_css_ptr dest,
-    unsigned int aligned_width) {
+    unsigned int aligned_width)
+{
 	struct ia_css_host_data *isp_data;
 
 	assert(dest != mmgr_NULL);
 
 	isp_data = convert_allocate_morph_plane(data, width, height, aligned_width);
-	if (!isp_data)
-	{
+	if (!isp_data) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
@@ -3221,7 +3212,8 @@ int
 sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 			       struct ia_css_isp_parameters *params,
 			       bool commit,
-			       struct ia_css_pipe *pipe_in) {
+			       struct ia_css_pipe *pipe_in)
+{
 	int err = 0;
 	ia_css_ptr cpy;
 	int i;
@@ -3238,15 +3230,13 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 	raw_bit_depth = ia_css_stream_input_format_bits_per_pixel(curr_pipe->stream);
 
 	/* now make the map available to the sp */
-	if (!commit)
-	{
+	if (!commit) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
 	/* enqueue a copies of the mem_map to
 	   the designated pipelines */
-	for (i = 0; i < curr_pipe->stream->num_pipes; i++)
-	{
+	for (i = 0; i < curr_pipe->stream->num_pipes; i++) {
 		struct ia_css_pipe *pipe;
 		struct sh_css_ddr_address_map *cur_map;
 		struct sh_css_ddr_address_map_size *cur_map_size;
@@ -3430,7 +3420,8 @@ sh_css_params_write_to_ddr_internal(
     struct ia_css_isp_parameters *params,
     const struct ia_css_pipeline_stage *stage,
     struct sh_css_ddr_address_map *ddr_map,
-    struct sh_css_ddr_address_map_size *ddr_map_size) {
+    struct sh_css_ddr_address_map_size *ddr_map_size)
+{
 	int err;
 	const struct ia_css_binary *binary;
 
@@ -3452,8 +3443,7 @@ sh_css_params_write_to_ddr_internal(
 
 	stage_num = stage->stage_num;
 
-	if (binary->info->sp.enable.fpnr)
-	{
+	if (binary->info->sp.enable.fpnr) {
 		buff_realloced = reallocate_buffer(&ddr_map->fpn_tbl,
 						   &ddr_map_size->fpn_tbl,
 						   (size_t)(FPNTBL_BYTES(binary)),
@@ -3474,8 +3464,7 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	if (binary->info->sp.enable.sc)
-	{
+	if (binary->info->sp.enable.sc) {
 		u32 enable_conv;
 		size_t bytes;
 
@@ -3577,8 +3566,7 @@ sh_css_params_write_to_ddr_internal(
 	 * DPC kernel. The code below sets the pipe specific configuration to
 	 * individual binaries. */
 	if (IS_ISP2401 &&
-	    params->pipe_dpc_config_changed[pipe_id] && binary->info->sp.enable.dpc)
-	{
+	    params->pipe_dpc_config_changed[pipe_id] && binary->info->sp.enable.dpc) {
 		unsigned int size   =
 		    stage->binary->info->mem_offsets.offsets.param->dmem.dp.size;
 
@@ -3596,8 +3584,7 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	if (params->config_changed[IA_CSS_MACC_ID] && binary->info->sp.enable.macc)
-	{
+	if (params->config_changed[IA_CSS_MACC_ID] && binary->info->sp.enable.macc) {
 		unsigned int i, j, idx;
 		unsigned int idx_map[] = {
 			0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8
@@ -3646,8 +3633,7 @@ sh_css_params_write_to_ddr_internal(
 			   sizeof(converted_macc_table.data));
 	}
 
-	if (binary->info->sp.enable.dvs_6axis)
-	{
+	if (binary->info->sp.enable.dvs_6axis) {
 		/* because UV is packed into the Y plane, calc total
 		 * YYU size = /2 gives size of UV-only,
 		 * total YYU size = UV-only * 3.
@@ -3705,8 +3691,7 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	if (binary->info->sp.enable.ca_gdc)
-	{
+	if (binary->info->sp.enable.ca_gdc) {
 		unsigned int i;
 		ia_css_ptr *virt_addr_tetra_x[
 
@@ -3811,8 +3796,7 @@ sh_css_params_write_to_ddr_internal(
 	}
 
 	/* After special cases like SC, FPN since they may change parameters */
-	for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
 		const struct ia_css_isp_data *isp_data =
 		    ia_css_isp_param_get_isp_mem_init(&binary->info->sp.mem_initializers,
 						    IA_CSS_PARAM_CLASS_PARAM, mem);
@@ -4025,7 +4009,8 @@ static int write_ia_css_isp_parameter_set_info_to_ddr(
 
 static int
 free_ia_css_isp_parameter_set_info(
-    ia_css_ptr ptr) {
+    ia_css_ptr ptr)
+{
 	int err = 0;
 	struct ia_css_isp_parameter_set_info isp_params_info;
 	unsigned int i;
@@ -4034,8 +4019,7 @@ free_ia_css_isp_parameter_set_info(
 	IA_CSS_ENTER_PRIVATE("ptr = %u", ptr);
 
 	/* sanity check - ptr must be valid */
-	if (!ia_css_refcount_is_valid(ptr))
-	{
+	if (!ia_css_refcount_is_valid(ptr)) {
 		IA_CSS_ERROR("%s: IA_CSS_REFCOUNT_PARAM_SET_POOL(0x%x) invalid arg", __func__,
 			     ptr);
 		err = -EINVAL;
@@ -4046,8 +4030,7 @@ free_ia_css_isp_parameter_set_info(
 	hmm_load(ptr, &isp_params_info.mem_map, sizeof(struct sh_css_ddr_address_map));
 	/* copy map using size info */
 	for (i = 0; i < (sizeof(struct sh_css_ddr_address_map_size) /
-			 sizeof(size_t)); i++)
-	{
+			 sizeof(size_t)); i++) {
 		if (addrs[i] == mmgr_NULL)
 			continue;
 
@@ -4254,7 +4237,8 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
     struct sh_css_uds_info *uds,		/* out */
     struct sh_css_crop_pos *sp_out_crop_pos,	/* out */
     struct ia_css_resolution pipe_in_res,
-    bool enable_zoom) {
+    bool enable_zoom)
+{
 	unsigned int x0 = 0, y0 = 0, x1 = 0, y1 = 0;
 	int err = 0;
 	/* Note:
@@ -4285,19 +4269,16 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 	if ((x0 > x1) || (y0 > y1) || (x1 > pipe_in_res.width) || (y1 > pipe_in_res.height))
 		return -EINVAL;
 
-	if (!enable_zoom)
-	{
+	if (!enable_zoom) {
 		uds->curr_dx = HRT_GDC_N;
 		uds->curr_dy = HRT_GDC_N;
 	}
 
-	if (info->enable.dvs_envelope)
-	{
+	if (info->enable.dvs_envelope) {
 		/* Zoom region is only supported by the UDS module on ISP
 		 * 2 and higher. It is not supported in video mode on ISP 1 */
 		return -EINVAL;
-	} else
-	{
+	} else {
 		if (enable_zoom) {
 			/* A. Calculate dx/dy based on crop region using in_frame_info
 			* Scale the crop region if in_frame_info to the stage is not same as
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 02f5a73b4096..a73e8ca1e225 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -535,12 +535,12 @@ sh_css_copy_frame_to_spframe(struct ia_css_frame_sp *sp_frame_out,
 }
 
 static int
-set_input_frame_buffer(const struct ia_css_frame *frame) {
+set_input_frame_buffer(const struct ia_css_frame *frame)
+{
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format)
-	{
+	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_QPLANE6:
 	case IA_CSS_FRAME_FORMAT_YUV420_16:
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
@@ -566,12 +566,12 @@ set_input_frame_buffer(const struct ia_css_frame *frame) {
 
 static int
 set_output_frame_buffer(const struct ia_css_frame *frame,
-			unsigned int idx) {
+			unsigned int idx)
+{
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format)
-	{
+	switch (frame->info.format) {
 	case IA_CSS_FRAME_FORMAT_YUV420:
 	case IA_CSS_FRAME_FORMAT_YUV422:
 	case IA_CSS_FRAME_FORMAT_YUV444:
@@ -607,12 +607,12 @@ set_output_frame_buffer(const struct ia_css_frame *frame,
 }
 
 static int
-set_view_finder_buffer(const struct ia_css_frame *frame) {
+set_view_finder_buffer(const struct ia_css_frame *frame)
+{
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format)
-	{
+	switch (frame->info.format) {
 	/* the dual output pin */
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV12_16:
@@ -732,7 +732,8 @@ sh_css_sp_set_disable_continuous_viewfinder(bool flag)
 }
 
 static int
-sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args) {
+sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args)
+{
 	int err = 0;
 	int i;
 
@@ -742,8 +743,7 @@ sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args) {
 		err = set_input_frame_buffer(args->in_frame);
 	if (!err && args->out_vf_frame)
 		err = set_view_finder_buffer(args->out_vf_frame);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		if (!err && args->out_frame[i])
 			err = set_output_frame_buffer(args->out_frame[i], i);
 	}
@@ -786,7 +786,8 @@ sh_css_stage_write_binary_info(struct ia_css_binary_info *info)
 }
 
 static int
-copy_isp_mem_if_to_ddr(struct ia_css_binary *binary) {
+copy_isp_mem_if_to_ddr(struct ia_css_binary *binary)
+{
 	int err;
 
 	err = ia_css_isp_param_copy_isp_mem_if_to_ddr(
@@ -817,7 +818,8 @@ configure_isp_from_args(
     const struct ia_css_binary      *binary,
     const struct sh_css_binary_args *args,
     bool two_ppc,
-    bool deinterleaved) {
+    bool deinterleaved)
+{
 	ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	ia_css_crop_configure(binary, &args->delay_frames[0]->info);
 	ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
@@ -896,7 +898,8 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		     bool xnr,
 		     const struct ia_css_isp_param_css_segments *isp_mem_if,
 		     unsigned int if_config_index,
-		     bool two_ppc) {
+		     bool two_ppc)
+{
 	const struct ia_css_binary_xinfo *xinfo;
 	const struct ia_css_binary_info  *info;
 	int err = 0;
@@ -928,8 +931,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 
-	if (!info)
-	{
+	if (!info) {
 		sh_css_sp_group.pipe[thread_id].sp_stage_addr[stage] = mmgr_NULL;
 		return 0;
 	}
@@ -961,8 +963,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
 	ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.in.info,
 					   &binary->in_frame_info);
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.out[i].info,
 						   &binary->out_frame_info[i]);
 	}
@@ -996,16 +997,14 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
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
@@ -1046,8 +1045,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	 * the original out res. for video pipe, it has two output pins --- out and
 	 * vf_out, so it can keep these two resolutions already. */
 	if (binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_PREVIEW &&
-	    (binary->vf_downscale_log2 > 0))
-	{
+	    (binary->vf_downscale_log2 > 0)) {
 		/* TODO: Remove this after preview output decimation is fixed
 		 * by configuring out&vf info fiels properly */
 		sh_css_sp_stage.frames.out[0].info.padded_width
@@ -1069,7 +1067,8 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
 	      unsigned int pipe_num,
 	      bool xnr,
 	      unsigned int if_config_index,
-	      bool two_ppc) {
+	      bool two_ppc)
+{
 	struct ia_css_binary *binary;
 	const struct ia_css_fw_info *firmware;
 	const struct sh_css_binary_args *args;
@@ -1105,14 +1104,12 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
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
@@ -1133,8 +1130,7 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
 		binary_name = IA_CSS_EXT_ISP_PROG_NAME(firmware);
 		blob_info = &firmware->blob;
 		mem_if = (struct ia_css_isp_param_css_segments *)&firmware->mem_initializers;
-	} else
-	{
+	} else {
 		/* SP stage */
 		assert(stage->sp_func != IA_CSS_PIPELINE_NO_FUNC);
 		/* binary and blob_info are now NULL.
@@ -1205,7 +1201,8 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 			*internal_frame_origin_bqs_on_sctbl, /* Origin of internal frame
 							positioned on shading table at shading correction in ISP. */
 			const struct ia_css_isp_parameters *params
-		       ) {
+		       )
+{
 	/* Get first stage */
 	struct ia_css_pipeline_stage *stage        = NULL;
 	struct ia_css_binary	     *first_binary = NULL;
@@ -1223,17 +1220,14 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
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
+	} else if (input_mode == IA_CSS_INPUT_MODE_MEMORY) {
 		if_config_index = SH_CSS_IF_CONFIG_NOT_NEEDED;
-	} else
-	{
+	} else {
 		if_config_index = 0x0;
 	}
 
@@ -1241,15 +1235,13 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
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
@@ -1277,8 +1269,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 
 	/* TODO: next indicates from which queues parameters need to be
 		 sampled, needs checking/improvement */
-	if (ia_css_pipeline_uses_params(me))
-	{
+	if (ia_css_pipeline_uses_params(me)) {
 		sh_css_sp_group.pipe[thread_id].pipe_config =
 		SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id;
 	}
@@ -1292,15 +1283,13 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 
 	pipe = find_pipe_by_num(pipe_num);
 	assert(pipe);
-	if (!pipe)
-	{
+	if (!pipe) {
 		return;
 	}
 	sh_css_sp_group.pipe[thread_id].scaler_pp_lut = sh_css_pipe_get_pp_gdc_lut(pipe);
 
 #if defined(SH_CSS_ENABLE_METADATA)
-	if (md_info && md_info->size > 0)
-	{
+	if (md_info && md_info->size > 0) {
 		sh_css_sp_group.pipe[thread_id].metadata.width  = md_info->resolution.width;
 		sh_css_sp_group.pipe[thread_id].metadata.height = md_info->resolution.height;
 		sh_css_sp_group.pipe[thread_id].metadata.stride = md_info->stride;
@@ -1316,8 +1305,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 
 #if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 	sh_css_sp_group.pipe[thread_id].output_frame_queue_id = (uint32_t)SH_CSS_INVALID_QUEUE_ID;
-	if (pipe_id != IA_CSS_PIPE_ID_COPY)
-	{
+	if (pipe_id != IA_CSS_PIPE_ID_COPY) {
 		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, thread_id,
 					       (enum sh_css_queue_id *)(
 						   &sh_css_sp_group.pipe[thread_id].output_frame_queue_id));
@@ -1329,14 +1317,12 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 		* the parameters are passed to the isp for the shading table centering.
 		*/
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
@@ -1347,8 +1333,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe_id, sh_css_sp_group.pipe[thread_id].inout_port_config);
 
-	for (stage = me->stages, num = 0; stage; stage = stage->next, num++)
-	{
+	for (stage = me->stages, num = 0; stage; stage = stage->next, num++) {
 		sh_css_sp_group.pipe[thread_id].num_stages++;
 		if (is_sp_stage(stage)) {
 			sp_init_sp_stage(stage, pipe_num, two_ppc,
@@ -1400,7 +1385,8 @@ bool sh_css_write_host2sp_command(enum host2sp_commands host2sp_command)
 }
 
 enum host2sp_commands
-sh_css_read_host2sp_command(void) {
+sh_css_read_host2sp_command(void)
+{
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset = (unsigned int)offsetof(struct host_sp_communication, host2sp_command)
 	/ sizeof(int);
@@ -1586,7 +1572,8 @@ sh_css_event_init_irq_mask(void)
 int
 ia_css_pipe_set_irq_mask(struct ia_css_pipe *pipe,
 			 unsigned int or_mask,
-			 unsigned int and_mask) {
+			 unsigned int and_mask)
+{
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset;
 	struct sh_css_event_irq_mask event_irq_mask;
@@ -1625,7 +1612,8 @@ ia_css_pipe_set_irq_mask(struct ia_css_pipe *pipe,
 int
 ia_css_event_get_irq_mask(const struct ia_css_pipe *pipe,
 			  unsigned int *or_mask,
-			  unsigned int *and_mask) {
+			  unsigned int *and_mask)
+{
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset;
 	struct sh_css_event_irq_mask event_irq_mask;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_version.c b/drivers/staging/media/atomisp/pci/sh_css_version.c
index fa6de61e4995..f5ff8ca66b50 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_version.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_version.c
@@ -21,7 +21,8 @@
 #include "sh_css_firmware.h"
 
 int
-ia_css_get_version(char *version, int max_size) {
+ia_css_get_version(char *version, int max_size)
+{
 	char *css_version;
 
 	if (!IS_ISP2401)
-- 
2.30.2



