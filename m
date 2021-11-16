Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9148E4530C6
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbhKPLeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:34:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:35450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235203AbhKPLco (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD18363245;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062149;
        bh=9dZMW3J9NI4LAzKLdcY4OH98nWaufQoIxA6ewECyw5M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ef8E2b7Fzqw6FAto7cr2Ifmgg2An0hm/fRqUU7apU3lcNdQKn8s6uPWfN1HKIbhD6
         rC4p1Ak60fw6I8A+GrwuAlsFj8k1R0XhMz2ZpRIgAnYRcECXOR+RvVnYrb/ObI5pD4
         4UXb6WoBBxAd85Uz9z1GEdLR9JhmA6E6jWT7fU7AGhuMuJGP89lApCysyE7DctGtgM
         9HMM6XncOzhL6RTjbDRaLQ0boKjN4iHTbv173Tk2lZw8cIr4tPBbQwqRSBLnWl0kgJ
         2LvBb+ChNc5MR6XCyXKfMYDylElMja8q1aEpBwzMjLGTX2uvGkwKRwLj+aD3TiBG9V
         oqrA+cSXOj10Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfg-I8; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 12/23] media: atomisp: remove #ifdef SH_CSS_ENABLE_METADATA
Date:   Tue, 16 Nov 2021 11:28:53 +0000
Message-Id: <e712f9af1aa7cebfc4154c1676b5fc4cdc69a460.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The chosen firmware has it enabled, so, drop this symbol.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c          | 12 ------------
 drivers/staging/media/atomisp/pci/sh_css_internal.h | 12 +-----------
 drivers/staging/media/atomisp/pci/sh_css_sp.c       | 13 -------------
 3 files changed, 1 insertion(+), 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index c3f08c69f36d..1f0b941de71f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -10195,9 +10195,7 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);
-#if defined SH_CSS_ENABLE_METADATA
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-#endif
 		if (pipe->pipe_settings.preview.preview_binary.info &&
 		    pipe->pipe_settings.preview.preview_binary.info->sp.enable.s3a)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_3A_STATISTICS, map);
@@ -10210,9 +10208,7 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);
-#if defined SH_CSS_ENABLE_METADATA
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-#endif
 		if (pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_PRIMARY) {
 			for (i = 0; i < pipe->pipe_settings.capture.num_primary_stage; i++) {
 				if (pipe->pipe_settings.capture.primary_binary[i].info &&
@@ -10237,9 +10233,7 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);
-#if defined SH_CSS_ENABLE_METADATA
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-#endif
 		if (pipe->pipe_settings.video.video_binary.info &&
 		    pipe->pipe_settings.video.video_binary.info->sp.enable.s3a)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_3A_STATISTICS, map);
@@ -10252,18 +10246,14 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);
 		if (!pipe->stream->config.continuous)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);
-#if defined SH_CSS_ENABLE_METADATA
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-#endif
 	} else if (pipe->mode == IA_CSS_PIPE_ID_ACC) {
 		if (need_input_queue)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);
-#if defined SH_CSS_ENABLE_METADATA
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-#endif
 	} else if (pipe->mode == IA_CSS_PIPE_ID_YUVPP) {
 		unsigned int idx;
 
@@ -10275,9 +10265,7 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 		if (need_input_queue)
 			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);
-#if defined SH_CSS_ENABLE_METADATA
 		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_METADATA, map);
-#endif
 	}
 	IA_CSS_LEAVE("");
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 87ac3ea15dfc..735540eceb37 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -86,12 +86,6 @@
 #define SH_CSS_MAX_IF_CONFIGS	3 /* Must match with IA_CSS_NR_OF_CONFIGS (not defined yet).*/
 #define SH_CSS_IF_CONFIG_NOT_NEEDED	0xFF
 
-#define SH_CSS_ENABLE_METADATA
-
-#if defined(SH_CSS_ENABLE_METADATA) && !defined(ISP2401)
-#define SH_CSS_ENABLE_METADATA_THREAD
-#endif
-
 /*
  * SH_CSS_MAX_SP_THREADS:
  *	 sp threads visible to host with connected communication queues
@@ -101,7 +95,7 @@
  *	 these threads can't be used as image pipe
  */
 
-#if defined(SH_CSS_ENABLE_METADATA_THREAD)
+#if !defined(ISP2401)
 #define SH_CSS_SP_INTERNAL_METADATA_THREAD	1
 #else
 #define SH_CSS_SP_INTERNAL_METADATA_THREAD	0
@@ -526,7 +520,6 @@ struct sh_css_sp_pipeline {
 				  this struct; needs cleanup */
 	s32 num_execs; /* number of times to run if this is
 			      an acceleration pipe. */
-#if defined(SH_CSS_ENABLE_METADATA)
 	struct {
 		u32        format;   /* Metadata format in hrt format */
 		u32        width;    /* Width of a line */
@@ -535,7 +528,6 @@ struct sh_css_sp_pipeline {
 		u32        size;     /* Total size (in bytes) */
 		ia_css_ptr    cont_buf; /* Address of continuous buffer */
 	} metadata;
-#endif
 	u32	output_frame_queue_id;
 	union {
 		struct {
@@ -570,9 +562,7 @@ struct ia_css_frames_sp {
 	struct ia_css_frame_sp_info internal_frame_info;
 	struct ia_css_buffer_sp s3a_buf;
 	struct ia_css_buffer_sp dvs_buf;
-#if defined SH_CSS_ENABLE_METADATA
 	struct ia_css_buffer_sp metadata_buf;
-#endif
 };
 
 /* Information for a single pipeline stage for an ISP */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 4a0206f564c9..778639f391cb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -330,9 +330,7 @@ sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
 	unsigned int thread_id;
 	u8 stage_num = 0;
 	struct sh_css_sp_pipeline *pipe;
-#if defined SH_CSS_ENABLE_METADATA
 	enum sh_css_queue_id queue_id;
-#endif
 
 	assert(out_frame);
 
@@ -372,7 +370,6 @@ sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
 
 	set_output_frame_buffer(out_frame, 0);
 
-#if defined SH_CSS_ENABLE_METADATA
 	if (pipe->metadata.height > 0) {
 		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_METADATA, thread_id,
 					       &queue_id);
@@ -380,7 +377,6 @@ sh_css_sp_start_isys_copy(struct ia_css_frame *out_frame,
 						    queue_id, mmgr_EXCEPTION,
 						    IA_CSS_BUFFER_TYPE_METADATA);
 	}
-#endif
 
 	ia_css_debug_pipe_graph_dump_sp_raw_copy(out_frame);
 }
@@ -904,9 +900,7 @@ initialize_stage_frames(struct ia_css_frames_sp *frames)
 	initialize_frame_buffer_attribute(&frames->out_vf.buf_attr);
 	initialize_frame_buffer_attribute(&frames->s3a_buf);
 	initialize_frame_buffer_attribute(&frames->dvs_buf);
-#if defined SH_CSS_ENABLE_METADATA
 	initialize_frame_buffer_attribute(&frames->metadata_buf);
-#endif
 }
 
 static int
@@ -1032,10 +1026,8 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 						    mmgr_EXCEPTION,
 						    IA_CSS_BUFFER_TYPE_DIS_STATISTICS);
 	}
-#if defined SH_CSS_ENABLE_METADATA
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_METADATA, thread_id, &queue_id);
 	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id, mmgr_EXCEPTION, IA_CSS_BUFFER_TYPE_METADATA);
-#endif
 	if (err)
 		return err;
 
@@ -1304,7 +1296,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	}
 	sh_css_sp_group.pipe[thread_id].scaler_pp_lut = sh_css_pipe_get_pp_gdc_lut(pipe);
 
-#if defined(SH_CSS_ENABLE_METADATA)
 	if (md_info && md_info->size > 0) {
 		sh_css_sp_group.pipe[thread_id].metadata.width  = md_info->resolution.width;
 		sh_css_sp_group.pipe[thread_id].metadata.height = md_info->resolution.height;
@@ -1314,10 +1305,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 		    md_config->data_type, MIPI_PREDICTOR_NONE,
 		    &sh_css_sp_group.pipe[thread_id].metadata.format);
 	}
-#else
-	(void)md_config;
-	(void)md_info;
-#endif
 
 	sh_css_sp_group.pipe[thread_id].output_frame_queue_id = (uint32_t)SH_CSS_INVALID_QUEUE_ID;
 	if (pipe_id != IA_CSS_PIPE_ID_COPY) {
-- 
2.33.1

