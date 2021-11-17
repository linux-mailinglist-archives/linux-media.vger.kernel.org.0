Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD35A4543A3
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbhKQJ2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:58832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235012AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB0C86321A;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141142;
        bh=rB1UMGyEwKX1eM6L6eBF+hJTxftC2im3Jzl7OFyPd7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tSSZK9DDtjP2x9Zde+qXueOd7TwZbJxBj9SDeTnWOpCOztQT7HsEqeOtvp4vRFV/p
         /KbCZ/5D5RYTVajEKRYfj5BoR/Jpq4lTb8srDfe0G0xgAO8U0F9Y6E83otU/bcK/JF
         /4D2mI8dzPsiyaSz+ZQDUEwNB5EEWww9a+54kN9I5EChuQ4Tyimk24BnUSijlR2s3d
         ZLMMPVBkqR61Fo1IUE3GemirJ8M5ii2YiyjSw1xwc0N7nhmr2lw/u/VlKEx3aAGL5y
         hSq93JNCEpolZmMGmJD4tXHYfL9c0CXkC8349+FV4uM3OElM42JcFRwNIdlCR8b8n3
         w2kEd0CEY+//Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb5g-6a; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 02/13] media: atomisp: simplif sh_css_defs.h
Date:   Wed, 17 Nov 2021 09:25:27 +0000
Message-Id: <cff64a2d68faf42e6411e13184f36abe3dd1aabd.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several unused macros. Simplify the logic there, making
it closer to the Intel Aero driver and the corresponding firmware,
as this is what we have widely available for this device.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 28 +++--------
 .../staging/media/atomisp/pci/ia_css_pipe.h   |  4 +-
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |  6 +--
 .../kernels/tnr/tnr_1.0/ia_css_tnr_param.h    |  4 +-
 .../pci/isp/modes/interface/isp_const.h       |  4 +-
 .../atomisp/pci/runtime/binary/src/binary.c   |  8 ++--
 .../pci/runtime/debug/src/ia_css_debug.c      |  2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 10 ++--
 .../staging/media/atomisp/pci/sh_css_defs.h   | 48 ++++---------------
 .../media/atomisp/pci/sh_css_internal.h       |  2 +-
 10 files changed, 36 insertions(+), 80 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4783590969b6..7181b901cde4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3617,18 +3617,10 @@ int atomisp_cp_lsc_table(struct atomisp_sub_device *asd,
 	}
 
 	/* Shading table size per color */
-	if (!IS_ISP2401) {
-		if (st->width > ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
-		    st->height > ISP2400_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR) {
-			dev_err(asd->isp->dev, "shading table w/h validate failed!");
-			return -EINVAL;
-		}
-	} else {
-		if (st->width > ISP2401_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
-		    st->height > ISP2401_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR) {
-			dev_err(asd->isp->dev, "shading table w/h validate failed!");
-			return -EINVAL;
-		}
+	if (st->width > SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
+	    st->height > SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR) {
+		dev_err(asd->isp->dev, "shading table w/h validate failed!");
+		return -EINVAL;
 	}
 
 	shading_table = atomisp_css_shading_table_alloc(st->width, st->height);
@@ -6181,15 +6173,9 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	}
 
 	/* Shading table size per color */
-	if (!IS_ISP2401) {
-		if (user_shading_table->width > ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
-		    user_shading_table->height > ISP2400_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR)
-			return -EINVAL;
-	} else {
-		if (user_shading_table->width > ISP2401_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
-		    user_shading_table->height > ISP2401_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR)
-			return -EINVAL;
-	}
+	if (user_shading_table->width > SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR ||
+	    user_shading_table->height > SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR)
+		return -EINVAL;
 
 	shading_table = atomisp_css_shading_table_alloc(
 			    user_shading_table->width, user_shading_table->height);
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe.h b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
index bb0abf9bffb1..fb58535bff40 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
@@ -33,7 +33,7 @@ struct ia_css_preview_settings {
 
 	/* 2401 only for these two - do we in fact use them for anything real */
 	struct ia_css_frame *delay_frames[MAX_NUM_VIDEO_DELAY_FRAMES];
-	struct ia_css_frame *tnr_frames[NUM_TNR_FRAMES];
+	struct ia_css_frame *tnr_frames[NUM_VIDEO_TNR_FRAMES];
 
 	struct ia_css_pipe *copy_pipe;
 	struct ia_css_pipe *capture_pipe;
@@ -81,7 +81,7 @@ struct ia_css_video_settings {
 	struct ia_css_binary vf_pp_binary;
 	struct ia_css_binary *yuv_scaler_binary;
 	struct ia_css_frame *delay_frames[MAX_NUM_VIDEO_DELAY_FRAMES];
-	struct ia_css_frame *tnr_frames[NUM_TNR_FRAMES];
+	struct ia_css_frame *tnr_frames[NUM_VIDEO_TNR_FRAMES];
 	struct ia_css_frame *vf_pp_in_frame;
 	struct ia_css_pipe *copy_pipe;
 	struct ia_css_pipe *capture_pipe;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
index 7177cf292fb0..53050c0c49fc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c
@@ -84,7 +84,7 @@ int ia_css_tnr_config(struct sh_css_isp_tnr_isp_config *to,
 		return ret;
 	to->width_a_over_b = elems_a / to->port_b.elems;
 	to->frame_height = from->tnr_frames[0]->info.res.height;
-	for (i = 0; i < NUM_TNR_FRAMES; i++) {
+	for (i = 0; i < NUM_VIDEO_TNR_FRAMES; i++) {
 		to->tnr_frame_addr[i] = from->tnr_frames[i]->data +
 					from->tnr_frames[i]->planes.yuyv.offset;
 	}
@@ -102,7 +102,7 @@ int ia_css_tnr_configure(const struct ia_css_binary     *binary,
 	struct ia_css_tnr_configuration config;
 	unsigned int i;
 
-	for (i = 0; i < NUM_TNR_FRAMES; i++)
+	for (i = 0; i < NUM_VIDEO_TNR_FRAMES; i++)
 		config.tnr_frames[i] = frames[i];
 
 	return ia_css_configure_tnr(binary, &config);
@@ -115,7 +115,7 @@ ia_css_init_tnr_state(
 {
 	(void)size;
 
-	assert(NUM_TNR_FRAMES >= 2);
+	assert(NUM_VIDEO_TNR_FRAMES >= 2);
 	assert(sizeof(*state) == size);
 	state->tnr_in_buf_idx = 0;
 	state->tnr_out_buf_idx = 1;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
index 60a2542cf685..551dd5cfa9f1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h
@@ -28,14 +28,14 @@ struct sh_css_isp_tnr_params {
 };
 
 struct ia_css_tnr_configuration {
-	const struct ia_css_frame *tnr_frames[NUM_TNR_FRAMES];
+	const struct ia_css_frame *tnr_frames[NUM_VIDEO_TNR_FRAMES];
 };
 
 struct sh_css_isp_tnr_isp_config {
 	u32 width_a_over_b;
 	u32 frame_height;
 	struct dma_port_config port_b;
-	ia_css_ptr tnr_frame_addr[NUM_TNR_FRAMES];
+	ia_css_ptr tnr_frame_addr[NUM_VIDEO_TNR_FRAMES];
 };
 
 #endif /* __IA_CSS_TNR_PARAM_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
index e5c595e5020b..bfe4f5976771 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
@@ -154,9 +154,9 @@ more details.
 /* [isp vmem] table size[vectors] per line per color (GR,R,B,GB),
    multiples of NWAY */
 #define ISP2400_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-	CEIL_DIV(ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
+	CEIL_DIV(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
 #define ISP2401_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-	CEIL_DIV(ISP2401_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
+	CEIL_DIV(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
 /* [isp vmem] table size[vectors] per line for 4colors (GR,R,B,GB),
    multiples of NWAY */
 #define SCTBL_VECTORS_PER_LINE \
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 8c0e02e4e1af..851e1d34a521 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1336,12 +1336,12 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	if (info->enable.sc)
 	{
 		if (!IS_ISP2401) {
-			binary->sctbl_width_per_color = _ISP2400_SCTBL_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
-			binary->sctbl_aligned_width_per_color = ISP2400_SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
-			binary->sctbl_height = _ISP2400_SCTBL_HEIGHT(sc_3a_dis_height, s3a_log_deci);
+			binary->sctbl_width_per_color = _ISP_SCTBL_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
+			binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
+			binary->sctbl_height = _ISP_SCTBL_HEIGHT(sc_3a_dis_height, s3a_log_deci);
 		} else {
 			binary->sctbl_width_per_color = _ISP2401_SCTBL_WIDTH_PER_COLOR(isp_internal_width, s3a_log_deci);
-			binary->sctbl_aligned_width_per_color = ISP2401_SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
+			binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
 			binary->sctbl_height = _ISP2401_SCTBL_HEIGHT(isp_internal_height, s3a_log_deci);
 			binary->sctbl_legacy_width_per_color  = _ISP_SCTBL_LEGACY_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
 			binary->sctbl_legacy_height = _ISP_SCTBL_LEGACY_HEIGHT(sc_3a_dis_height, s3a_log_deci);
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 1227a3e4d197..7bdbc1107404 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2534,7 +2534,7 @@ ia_css_debug_pipe_graph_dump_stage(
 		    "in", true);
 	}
 
-	for (i = 0; i < NUM_TNR_FRAMES; i++) {
+	for (i = 0; i < NUM_VIDEO_TNR_FRAMES; i++) {
 		if (stage->args.tnr_frames[i]) {
 			ia_css_debug_pipe_graph_dump_frame(
 			    stage->args.tnr_frames[i], id,
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e5e22f966286..acaa4c8b1884 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1261,7 +1261,7 @@ void sh_css_binary_args_reset(struct sh_css_binary_args *args)
 {
 	unsigned int i;
 
-	for (i = 0; i < NUM_TNR_FRAMES; i++)
+	for (i = 0; i < NUM_VIDEO_TNR_FRAMES; i++)
 		args->tnr_frames[i] = NULL;
 	for (i = 0; i < MAX_NUM_VIDEO_DELAY_FRAMES; i++)
 		args->delay_frames[i] = NULL;
@@ -2228,10 +2228,10 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 			}
 		}
 #ifndef ISP2401
-		ia_css_frame_free_multiple(NUM_TNR_FRAMES,
+		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
 					   pipe->pipe_settings.video.tnr_frames);
 #else
-		ia_css_frame_free_multiple(NUM_TNR_FRAMES,
+		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
 					   pipe->pipe_settings.video.tnr_frames);
 #endif
 		ia_css_frame_free_multiple(MAX_NUM_VIDEO_DELAY_FRAMES,
@@ -3424,7 +3424,7 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 	if (video_stage) {
 		int frm;
 
-		for (frm = 0; frm < NUM_TNR_FRAMES; frm++) {
+		for (frm = 0; frm < NUM_VIDEO_TNR_FRAMES; frm++) {
 			video_stage->args.tnr_frames[frm] =
 			    pipe->pipe_settings.video.tnr_frames[frm];
 		}
@@ -5163,7 +5163,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 	tnr_info.format = IA_CSS_FRAME_FORMAT_YUV_LINE;
 	tnr_info.raw_bit_depth = SH_CSS_TNR_BIT_DEPTH;
 
-	for (i = 0; i < NUM_TNR_FRAMES; i++) {
+	for (i = 0; i < NUM_VIDEO_TNR_FRAMES; i++) {
 		if (mycs->tnr_frames[i]) {
 			ia_css_frame_free(mycs->tnr_frames[i]);
 			mycs->tnr_frames[i] = NULL;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 4dd2aa06659a..353e9ea890dd 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -163,50 +163,20 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 #define SH_CSS_MORPH_TABLE_ELEMS_PER_DDR_WORD \
 	(HIVE_ISP_DDR_WORD_BYTES / SH_CSS_MORPH_TABLE_ELEM_BYTES)
 
-#define ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR   (SH_CSS_MAX_BQ_GRID_WIDTH + 1)
-#define ISP2400_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR   (SH_CSS_MAX_BQ_GRID_HEIGHT + 1)
+#define SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR   (SH_CSS_MAX_BQ_GRID_WIDTH + 1)
+#define SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR   (SH_CSS_MAX_BQ_GRID_HEIGHT + 1)
 
-#define ISP2400_SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR \
-	CEIL_MUL(ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
-
-/* TODO: I will move macros of "*_SCTBL_*" to SC kernel.
-   "+ 2" should be "+ SH_CSS_SCTBL_CENTERING_MARGIN + SH_CSS_SCTBL_LAST_GRID_COUNT". (michie, Sep/23/2014) */
-#define ISP2401_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR   (SH_CSS_MAX_BQ_GRID_WIDTH + 2)
-#define ISP2401_SH_CSS_MAX_SCTBL_HEIGHT_PER_COLOR   (SH_CSS_MAX_BQ_GRID_HEIGHT + 2)
-
-#define ISP2401_SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR \
-	CEIL_MUL(ISP2400_SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
+#define SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR \
+	CEIL_MUL(SH_CSS_MAX_SCTBL_WIDTH_PER_COLOR, ISP_VEC_NELEMS)
 
 /* Each line of this table is aligned to the maximum line width. */
 #define SH_CSS_MAX_S3ATBL_WIDTH              SH_CSS_MAX_BQ_GRID_WIDTH
 
 /* Video mode specific DVS define */
 /* The video binary supports a delay of 1 or 2 frames */
-#define VIDEO_FRAME_DELAY		2
+#define MAX_DVS_FRAME_DELAY		2
 /* +1 because DVS reads the previous and writes the current frame concurrently */
-#define MAX_NUM_VIDEO_DELAY_FRAMES	(VIDEO_FRAME_DELAY + 1)
-
-/* Preview mode specific DVS define. */
-/* In preview we only need GDC functionality (and not the DVS functionality) */
-/* The minimum number of DVS frames you need is 2, one were GDC reads from and another where GDC writes into */
-#define NUM_PREVIEW_DVS_FRAMES		(2)
-
-/* TNR is no longer exclusive to video, SkyCam preview has TNR too (same kernel as video).
- * All uses the generic define NUM_TNR_FRAMES. The define NUM_VIDEO_TNR_FRAMES has been deprecated.
- *
- * Notes
- * 1) The value depends on the used TNR kernel and is not something that depends on the mode
- *    and it is not something you just could choice.
- * 2) For the luma only pipeline a version that supports two different sets of TNR reference frames
- * is being used.
- *.
- */
-#define NUM_VALID_TNR_REF_FRAMES		(1) /* At least one valid TNR reference frame is required */
-#define NUM_TNR_FRAMES_PER_REF_BUF_SET		(2)
-/* In luma-only mode alternate illuminated frames are supported, that requires two double buffers */
-#define NUM_TNR_REF_BUF_SETS	(1)
-
-#define NUM_TNR_FRAMES		(NUM_TNR_FRAMES_PER_REF_BUF_SET * NUM_TNR_REF_BUF_SETS)
+#define MAX_NUM_VIDEO_DELAY_FRAMES	(MAX_DVS_FRAME_DELAY + 1)
 
 #define NUM_VIDEO_TNR_FRAMES		2
 
@@ -235,11 +205,11 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 	CEIL_MUL(_ISP_MORPH_TABLE_WIDTH(width), \
 		 SH_CSS_MORPH_TABLE_ELEMS_PER_DDR_WORD)
 
-#define _ISP2400_SCTBL_WIDTH_PER_COLOR(input_width, deci_factor_log2) \
+#define _ISP_SCTBL_WIDTH_PER_COLOR(input_width, deci_factor_log2) \
 	(ISP_BQ_GRID_WIDTH(input_width, deci_factor_log2) + 1)
-#define _ISP2400_SCTBL_HEIGHT(input_height, deci_factor_log2) \
+#define _ISP_SCTBL_HEIGHT(input_height, deci_factor_log2) \
 	(ISP_BQ_GRID_HEIGHT(input_height, deci_factor_log2) + 1)
-#define _ISP2400_SCTBL_ALIGNED_WIDTH_PER_COLOR(input_width, deci_factor_log2) \
+#define _ISP_SCTBL_ALIGNED_WIDTH_PER_COLOR(input_width, deci_factor_log2) \
 	CEIL_MUL(_ISP_SCTBL_WIDTH_PER_COLOR(input_width, deci_factor_log2), \
 		 ISP_VEC_NELEMS)
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index a3693902611f..71961a4220a6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -270,7 +270,7 @@ struct sh_css_binary_args {
 	struct ia_css_frame *in_frame;	     /* input frame */
 	const struct ia_css_frame
 		*delay_frames[MAX_NUM_VIDEO_DELAY_FRAMES];   /* reference input frame */
-	const struct ia_css_frame *tnr_frames[NUM_TNR_FRAMES];   /* tnr frames */
+	const struct ia_css_frame *tnr_frames[NUM_VIDEO_TNR_FRAMES];   /* tnr frames */
 	struct ia_css_frame
 		*out_frame[IA_CSS_BINARY_MAX_OUTPUT_PORTS];      /* output frame */
 	struct ia_css_frame *out_vf_frame;   /* viewfinder output frame */
-- 
2.33.1

