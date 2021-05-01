Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCD03705F8
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 08:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhEAGqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 02:46:25 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:59114 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhEAGqZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 May 2021 02:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619851526; bh=lunQlFwfXgUmBZrwb6W8j5aDGHhINsoe2Ryk797kabA=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=mQ/53EStMh9QZ4SlUtwNf19xpM4PBn1mFuXvP9FR6pnDbTU9t6ZohFOLE6j8Hk2Mf
         BxD4GjeUx/PWcgRYU3VDW9L2YVYPFPAlQt5mSVh92Vkzlot0l8FwgR1OgbNCPsjbVR
         zsiI4/ZwY0zxhVNkmaS2qJLYkqI7/2iHsLk2KsHc=
Received: by 192.168.90.14 [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat,  1 May 2021 08:45:26 +0200 (CEST)
X-EA-Auth: LtKAoQ/4O3k8sRjn2JwBsATfGnVN4X0QkynfF1Q9dGhpvMe+bCQ1dkZSAq5TNZ10X7T+xwCmiDBs5vRCQ8vqHcMC05XW5eRz
Date:   Sat, 1 May 2021 12:15:21 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH 2/5] staging: media: atomisp: code formatting changes
 sh_css_mipi.c
Message-ID: <6ca6cd03bbe610ba191d489c04173efdaf714af3.1619850663.git.drv@mailo.com>
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
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 170 ++++++++----------
 1 file changed, 76 insertions(+), 94 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 3f34cc81be87..1ae6c07d4199 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -37,7 +37,7 @@ ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
  * Check if a source port or TPG/PRBS ID is valid
  */
 static bool ia_css_mipi_is_source_port_valid(struct ia_css_pipe *pipe,
-	unsigned int *pport)
+					     unsigned int *pport)
 {
 	bool ret = true;
 	unsigned int port = 0;
@@ -74,7 +74,8 @@ static bool ia_css_mipi_is_source_port_valid(struct ia_css_pipe *pipe,
 	return ret;
 }
 
-/* Assumptions:
+/*
+ * Assumptions:
  *	- A line is multiple of 4 bytes = 1 word.
  *	- Each frame has SOF and EOF (each 1 word).
  *	- Each line has format header and optionally SOL and EOL (each 1 word).
@@ -91,7 +92,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 				 const enum atomisp_input_format format,
 				 const bool hasSOLandEOL,
 				 const unsigned int embedded_data_size_words,
-				 unsigned int *size_mem_words) {
+				 unsigned int *size_mem_words)
+{
 	int err = 0;
 
 	unsigned int bits_per_pixel = 0;
@@ -108,7 +110,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	unsigned int width_padded = width;
 
 #if defined(ISP2401)
-	/* The changes will be reverted as soon as RAW
+	/*
+	 * The changes will be reverted as soon as RAW
 	 * Buffers are deployed by the 2401 Input System
 	 * in the non-continuous use scenario.
 	 */
@@ -118,8 +121,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	IA_CSS_ENTER("padded_width=%d, height=%d, format=%d, hasSOLandEOL=%d, embedded_data_size_words=%d\n",
 		     width_padded, height, format, hasSOLandEOL, embedded_data_size_words);
 
-	switch (format)
-	{
+	switch (format) {
 	case ATOMISP_INPUT_FORMAT_RAW_6:		/* 4p, 3B, 24bits */
 		bits_per_pixel = 6;
 		break;
@@ -134,7 +136,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	case ATOMISP_INPUT_FORMAT_YUV420_10:		/* odd 4p, 5B, 40bits, even 4p, 10B, 80bits */
 	case ATOMISP_INPUT_FORMAT_RAW_10:		/* 4p, 5B, 40bits */
 #if !defined(HAS_NO_PACKED_RAW_PIXELS)
-		/* The changes will be reverted as soon as RAW
+		/*
+		 * The changes will be reverted as soon as RAW
 		 * Buffers are deployed by the 2401 Input System
 		 * in the non-continuous use scenario.
 		 */
@@ -176,33 +179,29 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	odd_line_bytes = (width_padded * bits_per_pixel + 7) >> 3; /* ceil ( bits per line / 8) */
 
 	/* Even lines for YUV420 formats are double in bits_per_pixel. */
-	if (format == ATOMISP_INPUT_FORMAT_YUV420_8
-	    || format == ATOMISP_INPUT_FORMAT_YUV420_10
-	    || format == ATOMISP_INPUT_FORMAT_YUV420_16)
-	{
-		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >>
-			3; /* ceil ( bits per line / 8) */
-	} else
-	{
+	if (format == ATOMISP_INPUT_FORMAT_YUV420_8  ||
+	    format == ATOMISP_INPUT_FORMAT_YUV420_10 ||
+	    format == ATOMISP_INPUT_FORMAT_YUV420_16)
+		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >> 3; /* ceil ( bits per line / 8) */
+	else
 		even_line_bytes = odd_line_bytes;
-	}
 
 	/*  a frame represented in memory:  ()- optional; data - payload words.
-	*  addr		0	1	2	3	4	5	6	7:
-	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  second	(EOL)	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  ...
-	*  last		(EOL)	EOF	0	0	0	0	0	0
-	*
-	*  Embedded lines are regular lines stored before the first and after
-	*  payload lines.
-	*/
+	 *  addr		0	1	2	3	4	5	6	7:
+	 *  first	SOF	(SOL)	PACK_H	data	data	data	data	data
+	 *		data	data	data	data	data	data	data	data
+	 *		...
+	 *		data	data	0	0	0	0	0	0
+	 *  second	(EOL)	(SOL)	PACK_H	data	data	data	data	data
+	 *		data	data	data	data	data	data	data	data
+	 *		...
+	 *		data	data	0	0	0	0	0	0
+	 *  ...
+	 *  last		(EOL)	EOF	0	0	0	0	0	0
+	 *
+	 *  Embedded lines are regular lines stored before the first and after
+	 *  payload lines.
+	 */
 
 	words_per_odd_line = (odd_line_bytes + 3) >> 2;
 	/* ceil(odd_line_bytes/4); word = 4 bytes */
@@ -220,11 +219,11 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	mem_words_for_EOF        = 1; /* last line consisit of the optional (EOL) and EOF */
 
 	mem_words = ((embedded_data_size_words + 7) >> 3) +
-	mem_words_for_first_line +
-	(((height + 1) >> 1) - 1) * mem_words_per_odd_line +
-	/* ceil (height/2) - 1 (first line is calculated separatelly) */
-	(height      >> 1) * mem_words_per_even_line + /* floor(height/2) */
-	mem_words_for_EOF;
+		      mem_words_for_first_line +
+		      (((height + 1) >> 1) - 1) * mem_words_per_odd_line +
+		      /* ceil (height/2) - 1 (first line is calculated separatelly) */
+		      (height >> 1) * mem_words_per_even_line + /* floor(height/2) */
+		      mem_words_for_EOF;
 
 	*size_mem_words = mem_words; /* ceil(words/8); mem word is 32B = 8words. */
 	/* Check if the above is still needed. */
@@ -236,7 +235,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 #if !defined(ISP2401)
 int
 ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
-				       const unsigned int	size_mem_words) {
+				       const unsigned int size_mem_words)
+{
 	u32 idx;
 
 	int err = -EBUSY;
@@ -245,12 +245,10 @@ ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
 	OP___assert(size_mem_words != 0);
 
 	for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT &&
-	     my_css.mipi_sizes_for_check[port][idx] != 0;
-	     idx++)   /* do nothing */
-	{
-	}
-	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT)
-	{
+	     my_css.mipi_sizes_for_check[port][idx] != 0;)
+		idx++;
+
+	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT) {
 		my_css.mipi_sizes_for_check[port][idx] = size_mem_words;
 		err = 0;
 	}
@@ -268,10 +266,9 @@ mipi_init(void)
 		ref_count_mipi_allocation[i] = 0;
 }
 
-int
-calculate_mipi_buff_size(
-    struct ia_css_stream_config *stream_cfg,
-    unsigned int *size_mem_words) {
+int calculate_mipi_buff_size(struct ia_css_stream_config *stream_cfg,
+			     unsigned int *size_mem_words)
+{
 #if !defined(ISP2401)
 	int err = -EINVAL;
 	(void)stream_cfg;
@@ -345,15 +342,11 @@ calculate_mipi_buff_size(
 	odd_line_bytes = (width_padded * bits_per_pixel + 7) >> 3; /* ceil ( bits per line / 8) */
 
 	/* Even lines for YUV420 formats are double in bits_per_pixel. */
-	if (format == ATOMISP_INPUT_FORMAT_YUV420_8
-	    || format == ATOMISP_INPUT_FORMAT_YUV420_10)
-	{
-		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >>
-			3; /* ceil ( bits per line / 8) */
-	} else
-	{
+	if (format == ATOMISP_INPUT_FORMAT_YUV420_8 ||
+	    format == ATOMISP_INPUT_FORMAT_YUV420_10)
+		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >> 3; /* ceil ( bits per line / 8) */
+	else
 		even_line_bytes = odd_line_bytes;
-	}
 
 	words_per_odd_line	 = (odd_line_bytes   + 3) >> 2;
 	/* ceil(odd_line_bytes/4); word = 4 bytes */
@@ -392,8 +385,8 @@ static bool buffers_needed(struct ia_css_pipe *pipe)
 }
 
 int
-allocate_mipi_frames(struct ia_css_pipe *pipe,
-		     struct ia_css_stream_info *info) {
+allocate_mipi_frames(struct ia_css_pipe *pipe, struct ia_css_stream_info *info)
+{
 	int err = -EINVAL;
 	unsigned int port;
 
@@ -402,8 +395,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 
 	assert(pipe);
 	assert(pipe->stream);
-	if ((!pipe) || (!pipe->stream))
-	{
+	if (!pipe || !pipe->stream) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
 				    pipe);
@@ -411,8 +403,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	}
 
 #ifdef ISP2401
-	if (pipe->stream->config.online)
-	{
+	if (pipe->stream->config.online) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: no buffers needed for 2401 pipe mode.\n",
 				    pipe);
@@ -443,27 +434,25 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	}
 
 #ifdef ISP2401
-	err = calculate_mipi_buff_size(
-	    &pipe->stream->config,
-	    &my_css.mipi_frame_size[port]);
+	err = calculate_mipi_buff_size(&pipe->stream->config,
+				       &my_css.mipi_frame_size[port]);
 #endif
 
 #if !defined(ISP2401)
-	if (ref_count_mipi_allocation[port] != 0)
-	{
+	if (ref_count_mipi_allocation[port] != 0) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: already allocated for this port (port=%d).\n",
 				    pipe, port);
 		return 0;
 	}
 #else
-	/* 2401 system allows multiple streams to use same physical port. This is not
+	/*
+	 * 2401 system allows multiple streams to use same physical port. This is not
 	 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
 	 * TODO AM: Once that is changed (removed) this code should be removed as well.
 	 * In that case only 2400 related code should remain.
 	 */
-	if (ref_count_mipi_allocation[port] != 0)
-	{
+	if (ref_count_mipi_allocation[port] != 0) {
 		ref_count_mipi_allocation[port]++;
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) leave: nothing to do, already allocated for this port (port=%d).\n",
@@ -481,8 +470,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	{ /* limit the scope of i,j */
 		unsigned int i, j;
 
-		for (i = 0; i < my_css.num_mipi_frames[port]; i++)
-		{
+		for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
 			/* free previous frame */
 			if (my_css.mipi_frames[port][i]) {
 				ia_css_frame_free(my_css.mipi_frames[port][i]);
@@ -534,8 +522,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 	return err;
 }
 
-int
-free_mipi_frames(struct ia_css_pipe *pipe) {
+int free_mipi_frames(struct ia_css_pipe *pipe)
+{
 	int err = -EINVAL;
 	unsigned int port;
 
@@ -543,8 +531,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 			    "free_mipi_frames(%p) enter:\n", pipe);
 
 	/* assert(pipe != NULL); TEMP: TODO: Should be assert only. */
-	if (pipe)
-	{
+	if (pipe) {
 		assert(pipe->stream);
 		if ((!pipe) || (!pipe->stream)) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
@@ -606,10 +593,10 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 						    "free_mipi_frames(%p) exit (deallocated).\n", pipe);
-			}
+			} else {
 #if defined(ISP2401)
-			else {
-				/* 2401 system allows multiple streams to use same physical port. This is not
+				/*
+				 * 2401 system allows multiple streams to use same physical port. This is not
 				 * true for 2400 system. Currently 2401 uses MIPI buffers as a temporary solution.
 				 * TODO AM: Once that is changed (removed) this code should be removed as well.
 				 * In that case only 2400 related code should remain.
@@ -617,11 +604,10 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 						    "free_mipi_frames(%p) leave: nothing to do, other streams still use this port (port=%d).\n",
 						    pipe, port);
-			}
 #endif
+			}
 		}
-	} else   /* pipe ==NULL */
-	{
+	} else { /* pipe ==NULL */
 		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */
 		for (port = CSI_PORT0_ID; port < N_CSI_PORTS; port++) {
 			unsigned int i;
@@ -644,8 +630,8 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
 	return 0;
 }
 
-int
-send_mipi_frames(struct ia_css_pipe *pipe) {
+int send_mipi_frames(struct ia_css_pipe *pipe)
+{
 	int err = -EINVAL;
 	unsigned int i;
 #ifndef ISP2401
@@ -658,8 +644,7 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 
 	assert(pipe);
 	assert(pipe->stream);
-	if (!pipe || !pipe->stream)
-	{
+	if (!pipe || !pipe->stream) {
 		IA_CSS_ERROR("pipe or stream is null");
 		return -EINVAL;
 	}
@@ -686,8 +671,7 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 	}
 
 	/* Hand-over the SP-internal mipi buffers */
-	for (i = 0; i < my_css.num_mipi_frames[port]; i++)
-	{
+	for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
 		/* Need to include the ofset for port. */
 		sh_css_update_host2sp_mipi_frame(port * NUM_MIPI_FRAMES_PER_STREAM + i,
 						 my_css.mipi_frames[port][i]);
@@ -700,18 +684,16 @@ send_mipi_frames(struct ia_css_pipe *pipe) {
 	 * Send an event to inform the SP
 	 * that all MIPI frames are passed.
 	 **********************************/
-	if (!sh_css_sp_is_running())
-	{
+	if (!sh_css_sp_is_running()) {
 		/* SP is not running. The queues are not valid */
 		IA_CSS_ERROR("sp is not running");
 		return err;
 	}
 
-	ia_css_bufq_enqueue_psys_event(
-	    IA_CSS_PSYS_SW_EVENT_MIPI_BUFFERS_READY,
-	    (uint8_t)port,
-	    (uint8_t)my_css.num_mipi_frames[port],
-	    0 /* not used */);
+	ia_css_bufq_enqueue_psys_event(IA_CSS_PSYS_SW_EVENT_MIPI_BUFFERS_READY,
+				       (uint8_t)port,
+				       (uint8_t)my_css.num_mipi_frames[port],
+				       0 /* not used */);
 	IA_CSS_LEAVE_ERR_PRIVATE(0);
 	return 0;
 }
-- 
2.30.2



