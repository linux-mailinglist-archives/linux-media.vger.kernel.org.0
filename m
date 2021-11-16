Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CE54530C9
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbhKPLe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:34:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:35198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235208AbhKPLco (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B962863236;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062149;
        bh=+eQUm8YlELY5QQ8VHElpip3gm5F0shsJO9PkjxNiU08=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=awTY3xFaTehKYBeVdMT4/GAk05+j5HqrxRM9tU5ovD6Uztfozc7HLJbMKVS4+KMFc
         DM4nP53BZUm4JifHPeJGa24HtGMxRq1wpOJyCwIlELn2bnhU6j8zX/SfWU/TVz/TbO
         8vfAdbNU/1fGlK6GZ27cj7UJVgY10HmmrkQr4J8AdFr5iuR820tqOIlniMmvtxpM29
         utzpQVe/4O12ORyMjq6vmbbTcYG578GsLuh/m/gaNesMvsc5QpfD6Vjv7WambRjl3A
         /QgwR9ivxlhyrzYLumVFvcYYKUZfmBckVut6tY0phnZJeO58ZY53tT9Ai7gkJGCjPr
         t2PqY31FKR38A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfa-Gx; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 10/23] media: atomisp: drop #ifdef SH_CSS_ENABLE_PER_FRAME_PARAMS
Date:   Tue, 16 Nov 2021 11:28:51 +0000
Message-Id: <cf9d37dbae4b3673ce0e6573fb2cab5e1ec00cfe.1637061474.git.mchehab+huawei@kernel.org>
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

This is enabled for the firmware we're using. So, just drop
the if's.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c      |  4 ----
 .../staging/media/atomisp/pci/sh_css_internal.h |  2 --
 .../staging/media/atomisp/pci/sh_css_params.c   | 17 -----------------
 drivers/staging/media/atomisp/pci/sh_css_sp.c   |  2 --
 .../staging/media/atomisp/pci/system_global.h   |  3 ---
 5 files changed, 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 3a347b72e4bd..6d3c4a0558e1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4154,14 +4154,12 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		return_err = ia_css_bufq_enqueue_buffer(thread_id,
 							queue_id,
 							(uint32_t)h_vbuf->vptr);
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 		if (!return_err &&
 		    buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
 			IA_CSS_LOG("pfp: enqueued OF %d to q %d thread %d",
 				   ddr_buffer.payload.frame.frame_data,
 				   queue_id, thread_id);
 		}
-#endif
 	}
 
 	if (!return_err) {
@@ -4364,12 +4362,10 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 					    sh_css_sp_get_binary_copy_size();
 #endif
 				}
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 				if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
 					IA_CSS_LOG("pfp: dequeued OF %d with config id %d thread %d",
 						   frame->data, frame->isp_config_id, thread_id);
 				}
-#endif
 
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 						    "ia_css_pipe_dequeue_buffer() buf_type=%d, data(DDR address)=0x%x\n",
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index f26df3f44a7a..87ac3ea15dfc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -536,9 +536,7 @@ struct sh_css_sp_pipeline {
 		ia_css_ptr    cont_buf; /* Address of continuous buffer */
 	} metadata;
 #endif
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 	u32	output_frame_queue_id;
-#endif
 	union {
 		struct {
 			u32	bytes_available;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index b3ef6b4c3225..448b07162382 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -731,13 +731,11 @@ sh_css_set_global_isp_config_on_pipe(
     const struct ia_css_isp_config *config,
     struct ia_css_pipe *pipe);
 
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 static int
 sh_css_set_per_frame_isp_config_on_pipe(
     struct ia_css_stream *stream,
     const struct ia_css_isp_config *config,
     struct ia_css_pipe *pipe);
-#endif
 
 static int
 sh_css_update_uds_and_crop_info_based_on_zoom_region(
@@ -1905,11 +1903,9 @@ ia_css_stream_set_isp_config_on_pipe(
 
 	IA_CSS_ENTER("stream=%p, config=%p, pipe=%p", stream, config, pipe);
 
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 	if (config->output_frame)
 		err = sh_css_set_per_frame_isp_config_on_pipe(stream, config, pipe);
 	else
-#endif
 		err = sh_css_set_global_isp_config_on_pipe(stream->pipes[0], config, pipe);
 
 	IA_CSS_LEAVE_ERR(err);
@@ -1930,11 +1926,9 @@ ia_css_pipe_set_isp_config(struct ia_css_pipe *pipe,
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "config=%p\n", config);
 
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 	if (config->output_frame)
 		err = sh_css_set_per_frame_isp_config_on_pipe(pipe->stream, config, pipe);
 	else
-#endif
 		err = sh_css_set_global_isp_config_on_pipe(pipe, config, pipe_in);
 	IA_CSS_LEAVE_ERR(err);
 	return err;
@@ -1969,7 +1963,6 @@ sh_css_set_global_isp_config_on_pipe(
 	return err;
 }
 
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 static int
 sh_css_set_per_frame_isp_config_on_pipe(
     struct ia_css_stream *stream,
@@ -2039,7 +2032,6 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 	return err;
 }
-#endif
 
 static int
 sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
@@ -3253,15 +3245,10 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 		isp_pipe_version = ia_css_pipe_get_isp_pipe_version(pipe);
 		ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 		ia_css_query_internal_queue_id(params->output_frame
 					       ? IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET
 					       : IA_CSS_BUFFER_TYPE_PARAMETER_SET,
 					       thread_id, &queue_id);
-#else
-		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_PARAMETER_SET, thread_id,
-					       &queue_id);
-#endif
 		if (!sh_css_sp_is_running()) {
 			/* SP is not running. The queues are not valid */
 			err = -EBUSY;
@@ -3357,12 +3344,10 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 		err = ia_css_bufq_enqueue_buffer(thread_id, queue_id, (uint32_t)cpy);
 		if (err) {
 			free_ia_css_isp_parameter_set_info(cpy);
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 			IA_CSS_LOG("pfp: FAILED to add config id %d for OF %d to q %d on thread %d",
 				   isp_params_info.isp_parameters_id,
 				   isp_params_info.output_frame_ptr,
 				   queue_id, thread_id);
-#endif
 			break;
 		} else {
 			/* TMP: check discrepancy between nr of enqueued
@@ -3384,12 +3369,10 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 			    (uint8_t)thread_id,
 			    (uint8_t)queue_id,
 			    0);
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 			IA_CSS_LOG("pfp: added config id %d for OF %d to q %d on thread %d",
 				   isp_params_info.isp_parameters_id,
 				   isp_params_info.output_frame_ptr,
 				   queue_id, thread_id);
-#endif
 		}
 		/* clean-up old copy */
 		ia_css_dequeue_param_buffers(/*pipe_num*/);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index ff7c2c5fd94d..4a0206f564c9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1319,14 +1319,12 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	(void)md_info;
 #endif
 
-#if defined(SH_CSS_ENABLE_PER_FRAME_PARAMS)
 	sh_css_sp_group.pipe[thread_id].output_frame_queue_id = (uint32_t)SH_CSS_INVALID_QUEUE_ID;
 	if (pipe_id != IA_CSS_PIPE_ID_COPY) {
 		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, thread_id,
 					       (enum sh_css_queue_id *)(
 						   &sh_css_sp_group.pipe[thread_id].output_frame_queue_id));
 	}
-#endif
 
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe_id, sh_css_sp_group.pipe[thread_id].inout_port_config);
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 9b22b8c168be..060b924023ec 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -25,9 +25,6 @@
  * N.B. the 3 input formatters are of 2 different classess
  */
 
-/* per-frame parameter handling support */
-#define SH_CSS_ENABLE_PER_FRAME_PARAMS
-
 #define DMA_DDR_TO_VAMEM_WORKAROUND
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
-- 
2.33.1

