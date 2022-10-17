Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC6C60093F
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiJQIwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiJQIw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9663F33379
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RlQOiAVFNwQUJqwAmQL1BEa+l8HrtjXoN5EscduZB2Q=;
        b=YJk+FpWxBAHhQyc9K7Ox9VONtVh2CB8zXqX5iH8KS1nc5xaTtW0YASz4MQogZWa+UlevGw
        fXgkva43fp29ESE38qxSRDZH3xGqTSJXqxCBShOFIvx9/X0MH5DvRmyTY85JmNHnZ5xCRN
        RmIljeOQE7/jygl9Ja6fGSjH8fpu/UM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-k_a2GY9sPKeaGmC_Bk7VeA-1; Mon, 17 Oct 2022 04:51:24 -0400
X-MC-Unique: k_a2GY9sPKeaGmC_Bk7VeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62CAE803D49;
        Mon, 17 Oct 2022 08:51:24 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E272710A58CE;
        Mon, 17 Oct 2022 08:51:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 09/17] media: atomisp: Add ia_css_frame_get_info() helper
Date:   Mon, 17 Oct 2022 10:50:49 +0200
Message-Id: <20221017085057.7483-10-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several places rely on the [frame_]info member being the first member of
struct ia_css_frame, so that &frame->info will yield NULL when frame is
NULL (some places already explicitly check for a NULL frame pointer but
not nearly all).

For videobuf2 support the vb2_v4l2_buffer struct needs to be embedded
in the frame struct and it needs to be the first member. Breaking the
assumption that &frame->info will yield NULL when frame is NULL.

Add a ia_css_frame_get_info() helper to return either the ia_css_frame_info
struct embedded in the frame, or NULL when the frame pointer is NULL and
use this in places where a ia_css_frame_info ptr or NULL is expected.

To make sure that we catch all uses of the info field this patch also
renames the info field to frame_info.

This is a preparation patch for converting the driver to videobuf2.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  |  2 +-
 .../media/atomisp/pci/ia_css_frame_public.h   | 10 ++-
 .../bayer_io_ls/ia_css_bayer_io.host.c        | 10 +--
 .../yuv444_io_ls/ia_css_yuv444_io.host.c      | 10 +--
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.c |  2 +-
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |  4 +-
 .../pci/runtime/debug/src/ia_css_debug.c      | 26 +++----
 .../atomisp/pci/runtime/frame/src/frame.c     | 76 +++++++++----------
 drivers/staging/media/atomisp/pci/sh_css.c    | 38 +++++-----
 .../staging/media/atomisp/pci/sh_css_params.c | 17 ++---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 52 ++++++-------
 11 files changed, 124 insertions(+), 123 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index ac9aa8649635..aefe1c56c262 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -992,7 +992,7 @@ static int remove_pad_from_frame(struct atomisp_device *isp,
 		if (ret < 0)
 			goto remove_pad_error;
 
-		load  += in_frame->info.padded_width;
+		load  += in_frame->frame_info.padded_width;
 		store += width;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 5727bd175330..d787c4054bb1 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -146,7 +146,7 @@ enum ia_css_frame_flash_state {
  *  This is the main structure used for all input and output images.
  */
 struct ia_css_frame {
-	struct ia_css_frame_info info; /** info struct describing the frame */
+	struct ia_css_frame_info frame_info; /** info struct describing the frame */
 	ia_css_ptr   data;	       /** pointer to start of image data */
 	unsigned int data_bytes;       /** size of image data in bytes */
 	/* LA: move this to ia_css_buffer */
@@ -184,7 +184,7 @@ struct ia_css_frame {
 };
 
 #define DEFAULT_FRAME { \
-	.info			= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
+	.frame_info		= IA_CSS_BINARY_DEFAULT_FRAME_INFO, \
 	.dynamic_queue_id	= SH_CSS_INVALID_QUEUE_ID, \
 	.buf_type		= IA_CSS_BUFFER_TYPE_INVALID, \
 	.flash_state		= IA_CSS_FRAME_FLASH_STATE_NONE, \
@@ -320,4 +320,10 @@ ia_css_frame_map(struct ia_css_frame **frame,
 void
 ia_css_frame_unmap(struct ia_css_frame *frame);
 
+static inline const struct ia_css_frame_info *
+ia_css_frame_get_info(const struct ia_css_frame *frame)
+{
+	return frame ? &frame->frame_info : NULL;
+}
+
 #endif /* __IA_CSS_FRAME_PUBLIC_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
index c7d88552dfde..0091e2a3da52 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
@@ -28,9 +28,7 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 	const struct ia_css_frame *in_frame = args->in_frame;
 	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
 		&args->out_frame;
-	const struct ia_css_frame_info *in_frame_info = (in_frame) ? &in_frame->info :
-		&binary->in_frame_info;
-
+	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
 	const unsigned int ddr_bits_per_element = sizeof(short) * 8;
 	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
 						ddr_bits_per_element);
@@ -80,12 +78,12 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
 				    "ia_css_bayer_io_config() put part enter:\n");
 #endif
 
-		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->info);
+		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->frame_info);
 		if (ret)
 			return ret;
 		to->base_address = out_frames[0]->data;
-		to->width = out_frames[0]->info.res.width;
-		to->height = out_frames[0]->info.res.height;
+		to->width = out_frames[0]->frame_info.res.width;
+		to->height = out_frames[0]->frame_info.res.height;
 		to->stride = config.stride;
 		to->ddr_elems_per_word = ddr_elems_per_word;
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
index 7d2ef6e26ee6..32c504a950ce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
@@ -28,9 +28,7 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
 	const struct ia_css_frame *in_frame = args->in_frame;
 	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
 		&args->out_frame;
-	const struct ia_css_frame_info *in_frame_info = (in_frame) ? &in_frame->info :
-		&binary->in_frame_info;
-
+	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
 	const unsigned int ddr_bits_per_element = sizeof(short) * 8;
 	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
 						ddr_bits_per_element);
@@ -81,13 +79,13 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
 				    "ia_css_yuv444_io_config() put part enter:\n");
 #endif
 
-		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->info);
+		ret = ia_css_dma_configure_from_info(&config, &out_frames[0]->frame_info);
 		if (ret)
 			return ret;
 
 		to->base_address = out_frames[0]->data;
-		to->width = out_frames[0]->info.res.width;
-		to->height = out_frames[0]->info.res.height;
+		to->width = out_frames[0]->frame_info.res.width;
+		to->height = out_frames[0]->frame_info.res.height;
 		to->stride = config.stride;
 		to->ddr_elems_per_word = ddr_elems_per_word;
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
index 08ed916a7eb8..9288a7a37b37 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
@@ -30,7 +30,7 @@ int ia_css_ref_config(struct sh_css_isp_ref_isp_config *to,
 	int ret;
 
 	if (from->ref_frames[0]) {
-		ret = ia_css_dma_configure_from_info(&to->port_b, &from->ref_frames[0]->info);
+		ret = ia_css_dma_configure_from_info(&to->port_b, &from->ref_frames[0]->frame_info);
 		if (ret)
 			return ret;
 		to->width_a_over_b = elems_a / to->port_b.elems;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
index 53050c0c49fc..a5fea753ec64 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
@@ -79,11 +79,11 @@ int ia_css_tnr_config(struct sh_css_isp_tnr_isp_config *to,
 	unsigned int i;
 	int ret;
 
-	ret = ia_css_dma_configure_from_info(&to->port_b, &from->tnr_frames[0]->info);
+	ret = ia_css_dma_configure_from_info(&to->port_b, &from->tnr_frames[0]->frame_info);
 	if (ret)
 		return ret;
 	to->width_a_over_b = elems_a / to->port_b.elems;
-	to->frame_height = from->tnr_frames[0]->info.res.height;
+	to->frame_height = from->tnr_frames[0]->frame_info.res.height;
 	for (i = 0; i < NUM_VIDEO_TNR_FRAMES; i++) {
 		to->tnr_frame_addr[i] = from->tnr_frames[i]->data +
 					from->tnr_frames[i]->planes.yuyv.offset;
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 3d269bd23207..c10c2c598179 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1301,11 +1301,11 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 	data = (char *)HOST_ADDRESS(frame->data);
 	ia_css_debug_dtrace(2, "frame %s (%p):\n", descr, frame);
 	ia_css_debug_dtrace(2, "  resolution    = %dx%d\n",
-			    frame->info.res.width, frame->info.res.height);
+			    frame->frame_info.res.width, frame->frame_info.res.height);
 	ia_css_debug_dtrace(2, "  padded width  = %d\n",
-			    frame->info.padded_width);
-	ia_css_debug_dtrace(2, "  format        = %d\n", frame->info.format);
-	switch (frame->info.format) {
+			    frame->frame_info.padded_width);
+	ia_css_debug_dtrace(2, "  format        = %d\n", frame->frame_info.format);
+	switch (frame->frame_info.format) {
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
 	case IA_CSS_FRAME_FORMAT_NV21:
@@ -2565,11 +2565,11 @@ ia_css_debug_pipe_graph_dump_frame(
 	dtrace_dot(
 	    "node [shape = box, fixedsize=true, width=2, height=0.7]; \"%p\" [label = \"%s\\n%d(%d) x %d, %dbpp\\n%s\"];",
 	    frame,
-	    debug_frame_format2str(frame->info.format),
-	    frame->info.res.width,
-	    frame->info.padded_width,
-	    frame->info.res.height,
-	    frame->info.raw_bit_depth,
+	    debug_frame_format2str(frame->frame_info.format),
+	    frame->frame_info.res.width,
+	    frame->frame_info.padded_width,
+	    frame->frame_info.res.height,
+	    frame->frame_info.raw_bit_depth,
 	    bufinfo);
 
 	if (in_frame) {
@@ -2866,10 +2866,10 @@ ia_css_debug_pipe_graph_dump_sp_raw_copy(
 	snprintf(ring_buffer, sizeof(ring_buffer),
 		 "node [shape = box, fixedsize=true, width=2, height=0.7]; \"%p\" [label = \"%s\\n%d(%d) x %d\\nRingbuffer\"];",
 		 out_frame,
-		 debug_frame_format2str(out_frame->info.format),
-		 out_frame->info.res.width,
-		 out_frame->info.padded_width,
-		 out_frame->info.res.height);
+		 debug_frame_format2str(out_frame->frame_info.format),
+		 out_frame->frame_info.res.width,
+		 out_frame->frame_info.padded_width,
+		 out_frame->frame_info.res.height);
 
 	dtrace_dot(ring_buffer);
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index c20a4527c842..332b4a39e74d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -286,32 +286,32 @@ int ia_css_frame_init_planes(struct ia_css_frame *frame)
 {
 	assert(frame);
 
-	switch (frame->info.format) {
+	switch (frame->frame_info.format) {
 	case IA_CSS_FRAME_FORMAT_MIPI:
 		dev_err(atomisp_dev,
 			"%s: unexpected use of IA_CSS_FRAME_FORMAT_MIPI\n", __func__);
 		return -EINVAL;
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
 		frame_init_raw_single_plane(frame, &frame->planes.raw,
-					    frame->info.res.height,
-					    frame->info.padded_width,
-					    frame->info.raw_bit_depth);
+					    frame->frame_info.res.height,
+					    frame->frame_info.padded_width,
+					    frame->frame_info.raw_bit_depth);
 		break;
 	case IA_CSS_FRAME_FORMAT_RAW:
 		frame_init_single_plane(frame, &frame->planes.raw,
-					frame->info.res.height,
-					frame->info.padded_width,
-					frame->info.raw_bit_depth <= 8 ? 1 : 2);
+					frame->frame_info.res.height,
+					frame->frame_info.padded_width,
+					frame->frame_info.raw_bit_depth <= 8 ? 1 : 2);
 		break;
 	case IA_CSS_FRAME_FORMAT_RGB565:
 		frame_init_single_plane(frame, &frame->planes.rgb,
-					frame->info.res.height,
-					frame->info.padded_width, 2);
+					frame->frame_info.res.height,
+					frame->frame_info.padded_width, 2);
 		break;
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		frame_init_single_plane(frame, &frame->planes.rgb,
-					frame->info.res.height,
-					frame->info.padded_width * 4, 1);
+					frame->frame_info.res.height,
+					frame->frame_info.padded_width * 4, 1);
 		break;
 	case IA_CSS_FRAME_FORMAT_PLANAR_RGB888:
 		frame_init_rgb_planes(frame, 1);
@@ -324,14 +324,14 @@ int ia_css_frame_init_planes(struct ia_css_frame *frame)
 	case IA_CSS_FRAME_FORMAT_CSI_MIPI_YUV420_8:
 	case IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8:
 		frame_init_single_plane(frame, &frame->planes.yuyv,
-					frame->info.res.height,
-					frame->info.padded_width * 2, 1);
+					frame->frame_info.res.height,
+					frame->frame_info.padded_width * 2, 1);
 		break;
 	case IA_CSS_FRAME_FORMAT_YUV_LINE:
 		/* Needs 3 extra lines to allow vf_pp prefetching */
 		frame_init_single_plane(frame, &frame->planes.yuyv,
-					frame->info.res.height * 3 / 2 + 3,
-					frame->info.padded_width, 1);
+					frame->frame_info.res.height * 3 / 2 + 3,
+					frame->frame_info.padded_width, 1);
 		break;
 	case IA_CSS_FRAME_FORMAT_NV11:
 		frame_init_nv_planes(frame, 4, 1, 1);
@@ -380,8 +380,8 @@ int ia_css_frame_init_planes(struct ia_css_frame *frame)
 		break;
 	case IA_CSS_FRAME_FORMAT_BINARY_8:
 		frame_init_single_plane(frame, &frame->planes.binary.data,
-					frame->info.res.height,
-					frame->info.padded_width, 1);
+					frame->frame_info.res.height,
+					frame->frame_info.padded_width, 1);
 		frame->planes.binary.size = 0;
 		break;
 	default:
@@ -510,8 +510,8 @@ bool ia_css_frame_is_same_type(const struct ia_css_frame *frame_a,
 			       const struct ia_css_frame *frame_b)
 {
 	bool is_equal = false;
-	const struct ia_css_frame_info *info_a = &frame_a->info,
-						*info_b = &frame_b->info;
+	const struct ia_css_frame_info *info_a = &frame_a->frame_info;
+	const struct ia_css_frame_info *info_b = &frame_b->frame_info;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_frame_is_same_type() enter:\n");
@@ -613,8 +613,8 @@ static void frame_init_nv_planes(struct ia_css_frame *frame,
 				 unsigned int vertical_decimation,
 				 unsigned int bytes_per_element)
 {
-	unsigned int y_width = frame->info.padded_width;
-	unsigned int y_height = frame->info.res.height;
+	unsigned int y_width = frame->frame_info.padded_width;
+	unsigned int y_height = frame->frame_info.res.height;
 	unsigned int uv_width;
 	unsigned int uv_height;
 	unsigned int y_bytes;
@@ -627,7 +627,7 @@ static void frame_init_nv_planes(struct ia_css_frame *frame,
 	uv_width = 2 * (y_width / horizontal_decimation);
 	uv_height = y_height / vertical_decimation;
 
-	if (frame->info.format == IA_CSS_FRAME_FORMAT_NV12_TILEY) {
+	if (frame->frame_info.format == IA_CSS_FRAME_FORMAT_NV12_TILEY) {
 		y_width   = CEIL_MUL(y_width,   NV12_TILEY_TILE_WIDTH);
 		uv_width  = CEIL_MUL(uv_width,  NV12_TILEY_TILE_WIDTH);
 		y_height  = CEIL_MUL(y_height,  NV12_TILEY_TILE_HEIGHT);
@@ -652,8 +652,8 @@ static void frame_init_yuv_planes(struct ia_css_frame *frame,
 				  bool swap_uv,
 				  unsigned int bytes_per_element)
 {
-	unsigned int y_width = frame->info.padded_width,
-		     y_height = frame->info.res.height,
+	unsigned int y_width = frame->frame_info.padded_width,
+		     y_height = frame->frame_info.res.height,
 		     uv_width = y_width / horizontal_decimation,
 		     uv_height = y_height / vertical_decimation,
 		     y_stride, y_bytes, uv_bytes, uv_stride;
@@ -682,8 +682,8 @@ static void frame_init_yuv_planes(struct ia_css_frame *frame,
 static void frame_init_rgb_planes(struct ia_css_frame *frame,
 				  unsigned int bytes_per_element)
 {
-	unsigned int width = frame->info.res.width,
-		     height = frame->info.res.height, stride, bytes;
+	unsigned int width = frame->frame_info.res.width,
+		     height = frame->frame_info.res.height, stride, bytes;
 
 	stride = width * bytes_per_element;
 	bytes = stride * height;
@@ -698,8 +698,8 @@ static void frame_init_rgb_planes(struct ia_css_frame *frame,
 
 static void frame_init_qplane6_planes(struct ia_css_frame *frame)
 {
-	unsigned int width = frame->info.padded_width / 2,
-		     height = frame->info.res.height / 2, bytes, stride;
+	unsigned int width = frame->frame_info.padded_width / 2,
+		     height = frame->frame_info.res.height / 2, bytes, stride;
 
 	stride = width * 2;
 	bytes = stride * height;
@@ -781,11 +781,11 @@ static struct ia_css_frame *frame_create(unsigned int width,
 		return NULL;
 
 	memset(me, 0, sizeof(*me));
-	me->info.res.width = width;
-	me->info.res.height = height;
-	me->info.format = format;
-	me->info.padded_width = padded_width;
-	me->info.raw_bit_depth = raw_bit_depth;
+	me->frame_info.res.width = width;
+	me->frame_info.res.height = height;
+	me->frame_info.format = format;
+	me->frame_info.padded_width = padded_width;
+	me->frame_info.raw_bit_depth = raw_bit_depth;
 	me->valid = valid;
 	me->data_bytes = 0;
 	me->data = mmgr_NULL;
@@ -851,11 +851,11 @@ void ia_css_resolution_to_sp_resolution(
 int ia_css_frame_init_from_info(struct ia_css_frame *frame,
 				const struct ia_css_frame_info *frame_info)
 {
-	frame->info.res.width = frame_info->res.width;
-	frame->info.res.height = frame_info->res.height;
-	frame->info.format = frame_info->format;
-	frame->info.padded_width = frame_info->padded_width;
-	frame->info.raw_bit_depth = frame_info->raw_bit_depth;
+	frame->frame_info.res.width = frame_info->res.width;
+	frame->frame_info.res.height = frame_info->res.height;
+	frame->frame_info.format = frame_info->format;
+	frame->frame_info.padded_width = frame_info->padded_width;
+	frame->frame_info.raw_bit_depth = frame_info->raw_bit_depth;
 	frame->valid = true;
 	/* To indicate it is not valid frame. */
 	frame->dynamic_queue_id = SH_CSS_INVALID_QUEUE_ID;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index da96aaffebc1..5fae96bf447d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3060,7 +3060,7 @@ init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
 
 	assert(vf_frame);
 
-	sh_css_pipe_get_viewfinder_frame_info(pipe, &vf_frame->info, idx);
+	sh_css_pipe_get_viewfinder_frame_info(pipe, &vf_frame->frame_info, idx);
 	vf_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME + idx, thread_id, &queue_id);
@@ -3229,31 +3229,31 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 	assert(frame);
 	in_frame = frame;
 
-	in_frame->info.format = format;
+	in_frame->frame_info.format = format;
 
 #ifdef ISP2401
 	if (format == IA_CSS_FRAME_FORMAT_RAW)
-		in_frame->info.format = (pipe->stream->config.pack_raw_pixels) ?
+		in_frame->frame_info.format = (pipe->stream->config.pack_raw_pixels) ?
 		IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
 #endif
 
-	in_frame->info.res.width = pipe->stream->config.input_config.input_res.width;
-	in_frame->info.res.height = pipe->stream->config.input_config.input_res.height;
-	in_frame->info.raw_bit_depth =
-	ia_css_pipe_util_pipe_input_format_bpp(pipe);
-	ia_css_frame_info_set_width(&in_frame->info, pipe->stream->config.input_config.input_res.width, 0);
+	in_frame->frame_info.res.width = pipe->stream->config.input_config.input_res.width;
+	in_frame->frame_info.res.height = pipe->stream->config.input_config.input_res.height;
+	in_frame->frame_info.raw_bit_depth = ia_css_pipe_util_pipe_input_format_bpp(pipe);
+	ia_css_frame_info_set_width(&in_frame->frame_info,
+				    pipe->stream->config.input_config.input_res.width, 0);
 	in_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
 	in_frame->dynamic_queue_id = queue_id;
 	in_frame->buf_type = IA_CSS_BUFFER_TYPE_INPUT_FRAME;
 #ifdef ISP2401
-	ia_css_get_crop_offsets(pipe, &in_frame->info);
+	ia_css_get_crop_offsets(pipe, &in_frame->frame_info);
 #endif
 	err = ia_css_frame_init_planes(in_frame);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "init_in_frameinfo_memory_defaults() bayer_order = %d:\n", in_frame->info.raw_bayer_order);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s() bayer_order = %d\n",
+			    __func__, in_frame->frame_info.raw_bayer_order);
 
 	return err;
 }
@@ -3268,7 +3268,7 @@ init_out_frameinfo_defaults(struct ia_css_pipe *pipe,
 
 	assert(out_frame);
 
-	sh_css_pipe_get_output_frame_info(pipe, &out_frame->info, idx);
+	sh_css_pipe_get_output_frame_info(pipe, &out_frame->frame_info, idx);
 	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME + idx, thread_id, &queue_id);
@@ -4146,7 +4146,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 				if (!frame->valid)
 					pipe->num_invalid_frames--;
 
-				if (frame->info.format == IA_CSS_FRAME_FORMAT_BINARY_8) {
+				if (frame->frame_info.format == IA_CSS_FRAME_FORMAT_BINARY_8) {
 #ifdef ISP2401
 					frame->planes.binary.size = frame->data_bytes;
 #else
@@ -7102,7 +7102,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 			/* we use output port 1 as internal output port */
 			tmp_in_frame = yuv_scaler_stage->args.out_frame[1];
 			if (pipe->pipe_settings.yuvpp.is_output_stage[i]) {
-				if (tmp_vf_frame && (tmp_vf_frame->info.res.width != 0)) {
+				if (tmp_vf_frame && (tmp_vf_frame->frame_info.res.width != 0)) {
 					in_frame = yuv_scaler_stage->args.out_vf_frame;
 					err = add_vf_pp_stage(pipe, in_frame,
 							      tmp_vf_frame,
@@ -7118,7 +7118,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 			}
 		}
 	} else if (copy_stage) {
-		if (vf_frame[0] && vf_frame[0]->info.res.width != 0) {
+		if (vf_frame[0] && vf_frame[0]->frame_info.res.width != 0) {
 			in_frame = copy_stage->args.out_vf_frame;
 			err = add_vf_pp_stage(pipe, in_frame, vf_frame[0],
 					      &vf_pp_binary[0], &vf_pp_stage);
@@ -7158,10 +7158,10 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 
 	if (copy_on_sp(pipe) &&
 	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {
-		ia_css_frame_info_init(&out_frame->info, JPEG_BYTES, 1,
+		ia_css_frame_info_init(&out_frame->frame_info, JPEG_BYTES, 1,
 				       IA_CSS_FRAME_FORMAT_BINARY_8, 0);
-	} else if (out_frame->info.format == IA_CSS_FRAME_FORMAT_RAW) {
-		out_frame->info.raw_bit_depth =
+	} else if (out_frame->frame_info.format == IA_CSS_FRAME_FORMAT_RAW) {
+		out_frame->frame_info.raw_bit_depth =
 		ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	}
 
@@ -7200,7 +7200,7 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
 	ia_css_pipeline_clean(me);
 
 	/* Construct out_frame info */
-	err = sh_css_pipe_get_output_frame_info(pipe, &out_frame->info, 0);
+	err = sh_css_pipe_get_output_frame_info(pipe, &out_frame->frame_info, 0);
 	if (err)
 		return err;
 	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 67915d76a87f..f08564f58242 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -936,8 +936,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	assert(raw_black_frame);
 
 	params = stream->isp_params_configs;
-	height = raw_black_frame->info.res.height;
-	width = raw_black_frame->info.padded_width;
+	height = raw_black_frame->frame_info.res.height;
+	width = raw_black_frame->frame_info.padded_width;
 
 	ptr = raw_black_frame->data
 	+ raw_black_frame->planes.raw.offset;
@@ -1187,16 +1187,15 @@ ia_css_process_zoom_and_motion(
 			const struct sh_css_binary_args *args = &stage->args;
 			const struct ia_css_frame_info *out_infos[IA_CSS_BINARY_MAX_OUTPUT_PORTS] = {NULL};
 
-			if (args->out_frame[0])
-				out_infos[0] = &args->out_frame[0]->info;
+			out_infos[0] = ia_css_frame_get_info(args->out_frame[0]);
+
 			info = &stage->firmware->info.isp;
 			ia_css_binary_fill_info(info, false, false,
 						ATOMISP_INPUT_FORMAT_RAW_10,
-						args->in_frame  ? &args->in_frame->info  : NULL,
+						ia_css_frame_get_info(args->in_frame),
 						NULL,
 						out_infos,
-						args->out_vf_frame ? &args->out_vf_frame->info
-						: NULL,
+						ia_css_frame_get_info(args->out_vf_frame),
 						&tmp_binary,
 						NULL,
 						-1, true);
@@ -3461,10 +3460,10 @@ sh_css_params_write_to_ddr_internal(
 			if (stage->args.delay_frames[0]) {
 				/*When delay frames are present(as in case of video),
 				they are used for dvs. Configure DVS using those params*/
-				dvs_in_frame_info = &stage->args.delay_frames[0]->info;
+				dvs_in_frame_info = &stage->args.delay_frames[0]->frame_info;
 			} else {
 				/*Otherwise, use input frame to configure DVS*/
-				dvs_in_frame_info = &stage->args.in_frame->info;
+				dvs_in_frame_info = &stage->args.in_frame->frame_info;
 			}
 
 			/* Generate default DVS unity table on start up*/
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 615500a7d3c4..c301298b8ee4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -277,10 +277,10 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 	pipe = &sh_css_sp_group.pipe[thread_id];
 
-	pipe->copy.raw.height	    = out_frame->info.res.height;
-	pipe->copy.raw.width	    = out_frame->info.res.width;
-	pipe->copy.raw.padded_width  = out_frame->info.padded_width;
-	pipe->copy.raw.raw_bit_depth = out_frame->info.raw_bit_depth;
+	pipe->copy.raw.height	    = out_frame->frame_info.res.height;
+	pipe->copy.raw.width	    = out_frame->frame_info.res.width;
+	pipe->copy.raw.padded_width  = out_frame->frame_info.padded_width;
+	pipe->copy.raw.raw_bit_depth = out_frame->frame_info.raw_bit_depth;
 	pipe->copy.raw.max_input_width = max_input_width;
 	pipe->num_stages = 1;
 	pipe->pipe_id = pipe_id;
@@ -351,10 +351,10 @@ sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 	pipe = &sh_css_sp_group.pipe[thread_id];
 
-	pipe->copy.raw.height		= out_frame->info.res.height;
-	pipe->copy.raw.width		= out_frame->info.res.width;
-	pipe->copy.raw.padded_width	= out_frame->info.padded_width;
-	pipe->copy.raw.raw_bit_depth	= out_frame->info.raw_bit_depth;
+	pipe->copy.raw.height		= out_frame->frame_info.res.height;
+	pipe->copy.raw.width		= out_frame->frame_info.res.width;
+	pipe->copy.raw.padded_width	= out_frame->frame_info.padded_width;
+	pipe->copy.raw.raw_bit_depth	= out_frame->frame_info.raw_bit_depth;
 	pipe->copy.raw.max_input_width	= max_input_width;
 	pipe->num_stages		= 1;
 	pipe->pipe_id			= pipe_id;
@@ -451,9 +451,9 @@ sh_css_copy_frame_to_spframe(struct ia_css_frame_sp *sp_frame_out,
 					    frame_in->data,
 					    frame_in->buf_type);
 
-	ia_css_frame_info_to_frame_sp_info(&sp_frame_out->info, &frame_in->info);
+	ia_css_frame_info_to_frame_sp_info(&sp_frame_out->info, &frame_in->frame_info);
 
-	switch (frame_in->info.format) {
+	switch (frame_in->frame_info.format) {
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
 	case IA_CSS_FRAME_FORMAT_RAW:
 		sp_frame_out->planes.raw.offset = frame_in->planes.raw.offset;
@@ -536,7 +536,7 @@ set_input_frame_buffer(const struct ia_css_frame *frame)
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format) {
+	switch (frame->frame_info.format) {
 	case IA_CSS_FRAME_FORMAT_QPLANE6:
 	case IA_CSS_FRAME_FORMAT_YUV420_16:
 	case IA_CSS_FRAME_FORMAT_RAW_PACKED:
@@ -567,7 +567,7 @@ set_output_frame_buffer(const struct ia_css_frame *frame,
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format) {
+	switch (frame->frame_info.format) {
 	case IA_CSS_FRAME_FORMAT_YUV420:
 	case IA_CSS_FRAME_FORMAT_YUV422:
 	case IA_CSS_FRAME_FORMAT_YUV444:
@@ -608,7 +608,7 @@ set_view_finder_buffer(const struct ia_css_frame *frame)
 	if (!frame)
 		return -EINVAL;
 
-	switch (frame->info.format) {
+	switch (frame->frame_info.format) {
 	/* the dual output pin */
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV12_16:
@@ -819,34 +819,35 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_crop_configure(binary, &args->delay_frames[0]->info);
+	ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_output0_configure(binary, &args->out_frame[0]->info);
+	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
-	ret = ia_css_output1_configure(binary, &args->out_vf_frame->info);
+	ret = ia_css_output1_configure(binary, ia_css_frame_get_info(args->out_vf_frame));
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
 	if (ret)
 		return ret;
-	ret = ia_css_output0_configure(binary, &args->out_frame[0]->info);
+	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
-	ret = ia_css_iterator_configure(binary, &args->in_frame->info);
+	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
 	if (ret)
 		return ret;
-	ret = ia_css_dvs_configure(binary, &args->out_frame[0]->info);
+	ret = ia_css_dvs_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
-	ret = ia_css_output_configure(binary, &args->out_frame[0]->info);
+	ret = ia_css_output_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
-	ret = ia_css_raw_configure(pipeline, binary, &args->in_frame->info, &binary->in_frame_info, two_ppc, deinterleaved);
+	ret = ia_css_raw_configure(pipeline, binary, ia_css_frame_get_info(args->in_frame),
+				   &binary->in_frame_info, two_ppc, deinterleaved);
 	if (ret)
 		return ret;
 
@@ -1037,7 +1038,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		return -EINVAL;
 
 	if (args->in_frame)
-		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
+		ia_css_get_crop_offsets(pipe, &args->in_frame->frame_info);
 	else
 		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
 #else
@@ -1124,15 +1125,14 @@ sp_init_stage(struct ia_css_pipeline_stage *stage,
 		const struct ia_css_frame_info *out_infos[IA_CSS_BINARY_MAX_OUTPUT_PORTS] = {NULL};
 
 		if (args->out_frame[0])
-			out_infos[0] = &args->out_frame[0]->info;
+			out_infos[0] = &args->out_frame[0]->frame_info;
 		info = &firmware->info.isp;
 		ia_css_binary_fill_info(info, false, false,
 					ATOMISP_INPUT_FORMAT_RAW_10,
-					args->in_frame  ? &args->in_frame->info  : NULL,
+					ia_css_frame_get_info(args->in_frame),
 					NULL,
 					out_infos,
-					args->out_vf_frame ? &args->out_vf_frame->info
-					: NULL,
+					ia_css_frame_get_info(args->out_vf_frame),
 					&tmp_binary,
 					NULL,
 					-1, true);
-- 
2.37.3

