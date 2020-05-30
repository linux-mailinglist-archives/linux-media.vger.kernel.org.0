Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515331E8E9C
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbgE3G5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728834AbgE3G4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69582215A4;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=xUpAPf3A4MKwvNYsKa1mMtOUiOKfXfoMBNe70NZPfuw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L6W66H4oLd7r6r4IxYJz2d7V3Q4q8H7BXCCNFN+3ivl0EawYLlOXG/zXxq94kPMRL
         sKq/pvi7mitogSCg0C++t0w7VVEXlj/Pc62BcFcz1iAU7auOYe2qPj+5tR3915hCYx
         b24sQTHOkCb6xQ5LnZyOvbGtsFDBa4Gd6hV/I5sk=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hpa-AQ; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/41] media: atomisp: remove kvmalloc/kvcalloc abstractions
Date:   Sat, 30 May 2020 08:55:36 +0200
Message-Id: <68738042a2d5d4bff08dee70d928f1026db47fdf.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sh_css layer adds an abstraction for kvmalloc/kvcalloc.

Get rid of them. Most of the work here was done by this
small coccinelle script:

<cocci>
@@
expression size;
@@

- sh_css_malloc(size)
+ kvmalloc(size, GFP_KERNEL)

@@
expression n;
expression size;
@@

- sh_css_calloc(n, size)
+ kvcalloc(n, size, GFP_KERNEL)
</cocci>

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../atomisp/pci/base/refcount/src/refcount.c  |   4 +-
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  14 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |   4 +-
 .../atomisp/pci/runtime/binary/src/binary.c   |   6 +-
 .../atomisp/pci/runtime/frame/src/frame.c     |  12 +-
 .../pci/runtime/isp_param/src/isp_param.c     |   6 +-
 .../pci/runtime/pipeline/src/pipeline.c       |   4 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |   4 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  35 +--
 .../media/atomisp/pci/sh_css_host_data.c      |   4 +-
 .../media/atomisp/pci/sh_css_internal.h       |   6 -
 .../media/atomisp/pci/sh_css_metrics.c        |   9 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |  30 +-
 .../media/atomisp/pci/sh_css_param_shading.c  |   7 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 262 ++++++++++--------
 15 files changed, 202 insertions(+), 205 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 1616f3a38ddd..997f275ea9ec 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -81,7 +81,7 @@ enum ia_css_err ia_css_refcount_init(uint32_t size)
 		return IA_CSS_ERR_INTERNAL_ERROR;
 	}
 	myrefcount.items =
-	    sh_css_malloc(sizeof(struct ia_css_refcount_entry) * size);
+	    kvmalloc(sizeof(struct ia_css_refcount_entry) * size, GFP_KERNEL);
 	if (!myrefcount.items)
 		err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 	if (err == IA_CSS_SUCCESS) {
@@ -115,7 +115,7 @@ void ia_css_refcount_uninit(void)
 			entry->id = 0;
 		}
 	}
-	sh_css_free(myrefcount.items);
+	kvfree(myrefcount.items);
 	myrefcount.items = NULL;
 	myrefcount.size = 0;
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index dfd621d3f6da..2fe081ee005a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -318,7 +318,7 @@ ia_css_isp_dvs_statistics_allocate(
 	if (!grid->enable)
 		return NULL;
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
@@ -359,7 +359,7 @@ ia_css_isp_dvs_statistics_map_allocate(
 	 * so we use a local char * instead. */
 	char *base_ptr;
 
-	me = sh_css_malloc(sizeof(*me));
+	me = kvmalloc(sizeof(*me), GFP_KERNEL);
 	if (!me) {
 		IA_CSS_LOG("cannot allocate memory");
 		goto err;
@@ -369,7 +369,7 @@ ia_css_isp_dvs_statistics_map_allocate(
 	me->data_allocated = !data_ptr;
 
 	if (!me->data_ptr) {
-		me->data_ptr = sh_css_malloc(isp_stats->size);
+		me->data_ptr = kvmalloc(isp_stats->size, GFP_KERNEL);
 		if (!me->data_ptr) {
 			IA_CSS_LOG("cannot allocate memory");
 			goto err;
@@ -386,7 +386,7 @@ ia_css_isp_dvs_statistics_map_allocate(
 	return me;
 err:
 	if (me)
-		sh_css_free(me);
+		kvfree(me);
 	return NULL;
 }
 
@@ -395,8 +395,8 @@ ia_css_isp_dvs_statistics_map_free(struct ia_css_isp_dvs_statistics_map *me)
 {
 	if (me) {
 		if (me->data_allocated)
-			sh_css_free(me->data_ptr);
-		sh_css_free(me);
+			kvfree(me->data_ptr);
+		kvfree(me);
 	}
 }
 
@@ -405,7 +405,7 @@ ia_css_isp_dvs_statistics_free(struct ia_css_isp_dvs_statistics *me)
 {
 	if (me) {
 		hmm_free(me->data_ptr);
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index ca34299b7998..2d2708bde17e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -285,7 +285,7 @@ ia_css_isp_dvs2_statistics_allocate(
 	if (!grid->enable)
 		return NULL;
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
@@ -318,7 +318,7 @@ ia_css_isp_dvs2_statistics_free(struct ia_css_isp_dvs_statistics *me)
 {
 	if (me) {
 		hmm_free(me->data_ptr);
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index c7083d9b3f10..fd4ecd697868 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -927,8 +927,8 @@ ia_css_binary_init_infos(void) {
 	if (num_of_isp_binaries == 0)
 		return IA_CSS_SUCCESS;
 
-	all_binaries = sh_css_malloc(num_of_isp_binaries *
-				     sizeof(*all_binaries));
+	all_binaries = kvmalloc(num_of_isp_binaries * sizeof(*all_binaries),
+				GFP_KERNEL);
 	if (!all_binaries)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 
@@ -966,7 +966,7 @@ ia_css_binary_uninit(void) {
 		}
 		binary_infos[i] = NULL;
 	}
-	sh_css_free(all_binaries);
+	kvfree(all_binaries);
 	return IA_CSS_SUCCESS;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index c7d15a01ec9a..95dcb2b86388 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -189,7 +189,7 @@ enum ia_css_err ia_css_frame_map(struct ia_css_frame **frame,
 
 error:
 	if (err != IA_CSS_SUCCESS) {
-		sh_css_free(me);
+		kvfree(me);
 		me = NULL;
 	}
 
@@ -228,7 +228,7 @@ enum ia_css_err ia_css_frame_create_from_info(struct ia_css_frame **frame,
 	err = ia_css_frame_init_planes(me);
 
 	if (err != IA_CSS_SUCCESS) {
-		sh_css_free(me);
+		kvfree(me);
 		me = NULL;
 	}
 
@@ -321,7 +321,7 @@ void ia_css_frame_free(struct ia_css_frame *frame)
 
 	if (frame) {
 		hmm_free(frame->data);
-		sh_css_free(frame);
+		kvfree(frame);
 	}
 
 	IA_CSS_LEAVE_PRIVATE("void");
@@ -551,7 +551,7 @@ enum ia_css_err ia_css_frame_allocate_with_buffer_size(
 	err = frame_allocate_buffer_data(me);
 
 	if (err != IA_CSS_SUCCESS) {
-		sh_css_free(me);
+		kvfree(me);
 		me = NULL;
 	}
 
@@ -837,7 +837,7 @@ static enum ia_css_err frame_allocate_with_data(struct ia_css_frame **frame,
 		err = frame_allocate_buffer_data(me);
 
 	if (err != IA_CSS_SUCCESS) {
-		sh_css_free(me);
+		kvfree(me);
 #ifndef ISP2401
 		return err;
 #else
@@ -858,7 +858,7 @@ static struct ia_css_frame *frame_create(unsigned int width,
 	bool contiguous,
 	bool valid)
 {
-	struct ia_css_frame *me = sh_css_malloc(sizeof(*me));
+	struct ia_css_frame *me = kvmalloc(sizeof(*me), GFP_KERNEL);
 
 	if (!me)
 		return NULL;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 6f7c21bbe62d..126d1826aa3e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -122,7 +122,9 @@ ia_css_isp_param_allocate_isp_parameters(
 			css_params->params[pclass][mem].size = size;
 			css_params->params[pclass][mem].address = 0x0;
 			if (size) {
-				mem_params->params[pclass][mem].address = sh_css_calloc(1, size);
+				mem_params->params[pclass][mem].address = kvcalloc(1,
+										   size,
+										   GFP_KERNEL);
 				if (!mem_params->params[pclass][mem].address) {
 					err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 					goto cleanup;
@@ -153,7 +155,7 @@ ia_css_isp_param_destroy_isp_parameters(
 	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			if (mem_params->params[pclass][mem].address)
-				sh_css_free(mem_params->params[pclass][mem].address);
+				kvfree(mem_params->params[pclass][mem].address);
 			if (css_params->params[pclass][mem].address)
 				hmm_free(css_params->params[pclass][mem].address);
 			mem_params->params[pclass][mem].address = NULL;
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index f65d7491abd9..ebf36f7a514f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -512,7 +512,7 @@ static void pipeline_stage_destroy(struct ia_css_pipeline_stage *stage)
 		ia_css_frame_free(stage->args.out_vf_frame);
 		stage->args.out_vf_frame = NULL;
 	}
-	sh_css_free(stage);
+	kvfree(stage);
 }
 
 static void pipeline_init_sp_thread_map(void)
@@ -593,7 +593,7 @@ static enum ia_css_err pipeline_stage_create(
 		out_frame[i] = stage_desc->out_frame[i];
 	}
 
-	stage = sh_css_malloc(sizeof(*stage));
+	stage = kvmalloc(sizeof(*stage), GFP_KERNEL);
 	if (!stage) {
 		err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 		goto ERR;
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 546988a1a42e..53bcfd380742 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -152,7 +152,7 @@ enum ia_css_err ia_css_rmgr_init_vbuf(struct ia_css_rmgr_vbuf_pool *pool)
 		bytes_needed =
 		    sizeof(void *) *
 		    pool->size;
-		pool->handles = sh_css_malloc(bytes_needed);
+		pool->handles = kvmalloc(bytes_needed, GFP_KERNEL);
 		if (pool->handles)
 			memset(pool->handles, 0, bytes_needed);
 		else
@@ -196,7 +196,7 @@ void ia_css_rmgr_uninit_vbuf(struct ia_css_rmgr_vbuf_pool *pool)
 			}
 		}
 		/* now free the pool handles list */
-		sh_css_free(pool->handles);
+		kvfree(pool->handles);
 		pool->handles = NULL;
 	}
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 835da6f12309..6e18841db58a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1860,35 +1860,6 @@ ia_css_enable_isys_event_queue(bool enable) {
 	return IA_CSS_SUCCESS;
 }
 
-void *sh_css_malloc(size_t size)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "sh_css_malloc() enter: size=%zu\n",
-			    size);
-	/* FIXME: This first test can probably go away */
-	if (size == 0)
-		return NULL;
-	if (size > PAGE_SIZE)
-		return vmalloc(size);
-	return kmalloc(size, GFP_KERNEL);
-}
-
-void *sh_css_calloc(size_t N, size_t size)
-{
-	void *p;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_calloc() enter: N=%zu, size=%zu\n", N, size);
-
-	/* FIXME: this test can probably go away */
-	if (size > 0) {
-		p = sh_css_malloc(N * size);
-		if (p)
-			memset(p, 0, size);
-		return p;
-	}
-	return NULL;
-}
-
 void sh_css_free(void *ptr)
 {
 	if (is_vmalloc_addr(ptr))
@@ -9033,7 +9004,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 				    i);
 			if (err != IA_CSS_SUCCESS) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				sh_css_free(internal_pipe);
+				kvfree(internal_pipe);
 				internal_pipe = NULL;
 				return err;
 			}
@@ -9052,7 +9023,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 				    i);
 			if (err != IA_CSS_SUCCESS) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				sh_css_free(internal_pipe);
+				kvfree(internal_pipe);
 				internal_pipe = NULL;
 				return err;
 			}
@@ -9064,7 +9035,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 						    internal_pipe->config.acc_extension);
 		if (err != IA_CSS_SUCCESS) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			sh_css_free(internal_pipe);
+			kvfree(internal_pipe);
 			return err;
 		}
 	}
diff --git a/drivers/staging/media/atomisp/pci/sh_css_host_data.c b/drivers/staging/media/atomisp/pci/sh_css_host_data.c
index 348183a221a8..69a7464b772a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_host_data.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_host_data.c
@@ -24,7 +24,7 @@ struct ia_css_host_data *ia_css_host_data_allocate(size_t size)
 	if (!me)
 		return NULL;
 	me->size = (uint32_t)size;
-	me->address = sh_css_malloc(size);
+	me->address = kvmalloc(size, GFP_KERNEL);
 	if (!me->address) {
 		kfree(me);
 		return NULL;
@@ -35,7 +35,7 @@ struct ia_css_host_data *ia_css_host_data_allocate(size_t size)
 void ia_css_host_data_free(struct ia_css_host_data *me)
 {
 	if (me) {
-		sh_css_free(me->address);
+		kvfree(me->address);
 		me->address = NULL;
 		kfree(me);
 	}
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index aaf37f0ad753..272c758dde5d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -968,12 +968,6 @@ sh_css_params_init(void);
 void
 sh_css_params_uninit(void);
 
-void *sh_css_malloc(size_t size);
-
-void *sh_css_calloc(size_t N, size_t size);
-
-void sh_css_free(void *ptr);
-
 /* For Acceleration API: Flush FW (shared buffer pointer) arguments */
 void sh_css_flush(struct ia_css_acc_fw *fw);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index 17f6dd9afab4..44a01c0db808 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -67,13 +67,16 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = sh_css_malloc(length * sizeof(*histogram->run));
+	histogram->run = kvmalloc(length * sizeof(*histogram->run),
+				  GFP_KERNEL);
 	if (!histogram->run)
 		return;
-	histogram->stall = sh_css_malloc(length * sizeof(*histogram->stall));
+	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
+				    GFP_KERNEL);
 	if (!histogram->stall)
 		return;
-	histogram->msink = sh_css_malloc(length * sizeof(*histogram->msink));
+	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
+				    GFP_KERNEL);
 	if (!histogram->msink)
 		return;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 025f26a40062..e8ef69309d92 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -30,8 +30,8 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 	enum ia_css_err err = IA_CSS_SUCCESS;
 	struct ia_css_dvs_6axis_config  *dvs_config = NULL;
 
-	dvs_config = (struct ia_css_dvs_6axis_config *)sh_css_malloc(sizeof(
-			 struct ia_css_dvs_6axis_config));
+	dvs_config = kvmalloc(sizeof(struct ia_css_dvs_6axis_config),
+			      GFP_KERNEL);
 	if (!dvs_config)	{
 		IA_CSS_ERROR("out of memory");
 		err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
@@ -57,16 +57,16 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		}
 
 		/* Generate Y buffers  */
-		dvs_config->xcoords_y = (uint32_t *)sh_css_malloc(width_y * height_y * sizeof(
-					    uint32_t));
+		dvs_config->xcoords_y = kvmalloc(width_y * height_y * sizeof(uint32_t),
+						 GFP_KERNEL);
 		if (!dvs_config->xcoords_y) {
 			IA_CSS_ERROR("out of memory");
 			err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 			goto exit;
 		}
 
-		dvs_config->ycoords_y = (uint32_t *)sh_css_malloc(width_y * height_y * sizeof(
-					    uint32_t));
+		dvs_config->ycoords_y = kvmalloc(width_y * height_y * sizeof(uint32_t),
+						 GFP_KERNEL);
 		if (!dvs_config->ycoords_y) {
 			IA_CSS_ERROR("out of memory");
 			err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
@@ -76,16 +76,16 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		/* Generate UV buffers  */
 		IA_CSS_LOG("UV W %d H %d", width_uv, height_uv);
 
-		dvs_config->xcoords_uv = (uint32_t *)sh_css_malloc(width_uv * height_uv *
-					 sizeof(uint32_t));
+		dvs_config->xcoords_uv = kvmalloc(width_uv * height_uv * sizeof(uint32_t),
+						  GFP_KERNEL);
 		if (!dvs_config->xcoords_uv) {
 			IA_CSS_ERROR("out of memory");
 			err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 			goto exit;
 		}
 
-		dvs_config->ycoords_uv = (uint32_t *)sh_css_malloc(width_uv * height_uv *
-					 sizeof(uint32_t));
+		dvs_config->ycoords_uv = kvmalloc(width_uv * height_uv * sizeof(uint32_t),
+						  GFP_KERNEL);
 		if (!dvs_config->ycoords_uv) {
 			IA_CSS_ERROR("out of memory");
 			err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
@@ -207,28 +207,28 @@ free_dvs_6axis_table(struct ia_css_dvs_6axis_config  **dvs_6axis_config)
 	if ((dvs_6axis_config) && (*dvs_6axis_config)) {
 		IA_CSS_ENTER_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_config));
 		if ((*dvs_6axis_config)->xcoords_y) {
-			sh_css_free((*dvs_6axis_config)->xcoords_y);
+			kvfree((*dvs_6axis_config)->xcoords_y);
 			(*dvs_6axis_config)->xcoords_y = NULL;
 		}
 
 		if ((*dvs_6axis_config)->ycoords_y) {
-			sh_css_free((*dvs_6axis_config)->ycoords_y);
+			kvfree((*dvs_6axis_config)->ycoords_y);
 			(*dvs_6axis_config)->ycoords_y = NULL;
 		}
 
 		/* Free up UV buffers */
 		if ((*dvs_6axis_config)->xcoords_uv) {
-			sh_css_free((*dvs_6axis_config)->xcoords_uv);
+			kvfree((*dvs_6axis_config)->xcoords_uv);
 			(*dvs_6axis_config)->xcoords_uv = NULL;
 		}
 
 		if ((*dvs_6axis_config)->ycoords_uv) {
-			sh_css_free((*dvs_6axis_config)->ycoords_uv);
+			kvfree((*dvs_6axis_config)->ycoords_uv);
 			(*dvs_6axis_config)->ycoords_uv = NULL;
 		}
 
 		IA_CSS_LEAVE_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_config));
-		sh_css_free(*dvs_6axis_config);
+		kvfree(*dvs_6axis_config);
 		*dvs_6axis_config = NULL;
 	}
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 4b648df2d073..0a6e0dbe1e2a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -360,12 +360,13 @@ ia_css_shading_table_alloc(
 	me->fraction_bits = 0;
 	for (i = 0; i < IA_CSS_SC_NUM_COLORS; i++) {
 		me->data[i] =
-		    sh_css_malloc(width * height * sizeof(*me->data[0]));
+		    kvmalloc(width * height * sizeof(*me->data[0]),
+			     GFP_KERNEL);
 		if (!me->data[i]) {
 			unsigned int j;
 
 			for (j = 0; j < i; j++) {
-				sh_css_free(me->data[j]);
+				kvfree(me->data[j]);
 				me->data[j] = NULL;
 			}
 			kfree(me);
@@ -392,7 +393,7 @@ ia_css_shading_table_free(struct ia_css_shading_table *table)
 
 	for (i = 0; i < IA_CSS_SC_NUM_COLORS; i++) {
 		if (table->data[i]) {
-			sh_css_free(table->data[i]);
+			kvfree(table->data[i]);
 			table->data[i] = NULL;
 		}
 	}
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index f1b543a6db82..45df88e2aa74 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1496,12 +1496,13 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 	if (params->fpn_config.data &&
 	    (params->fpn_config.width != width || params->fpn_config.height != height))
 	{
-		sh_css_free(params->fpn_config.data);
+		kvfree(params->fpn_config.data);
 		params->fpn_config.data = NULL;
 	}
 	if (!params->fpn_config.data)
 	{
-		params->fpn_config.data = sh_css_malloc(height * width * sizeof(short));
+		params->fpn_config.data = kvmalloc(height * width *
+						   sizeof(short), GFP_KERNEL);
 		if (!params->fpn_config.data) {
 			IA_CSS_ERROR("out of memory");
 			IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY);
@@ -1910,16 +1911,16 @@ void ia_css_morph_table_free(
 
 	for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 		if (me->coordinates_x[i]) {
-			sh_css_free(me->coordinates_x[i]);
+			kvfree(me->coordinates_x[i]);
 			me->coordinates_x[i] = NULL;
 		}
 		if (me->coordinates_y[i]) {
-			sh_css_free(me->coordinates_y[i]);
+			kvfree(me->coordinates_y[i]);
 			me->coordinates_y[i] = NULL;
 		}
 	}
 
-	sh_css_free(me);
+	kvfree(me);
 	IA_CSS_LEAVE("void");
 }
 
@@ -1932,7 +1933,7 @@ struct ia_css_morph_table *ia_css_morph_table_allocate(
 
 	IA_CSS_ENTER("");
 
-	me = sh_css_malloc(sizeof(*me));
+	me = kvmalloc(sizeof(*me), GFP_KERNEL);
 	if (!me) {
 		IA_CSS_ERROR("out of memory");
 		return me;
@@ -1944,12 +1945,12 @@ struct ia_css_morph_table *ia_css_morph_table_allocate(
 	}
 
 	for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
-		me->coordinates_x[i] =
-		    sh_css_malloc(height * width *
-				  sizeof(*me->coordinates_x[i]));
-		me->coordinates_y[i] =
-		    sh_css_malloc(height * width *
-				  sizeof(*me->coordinates_y[i]));
+		me->coordinates_x[i] = kvmalloc(height * width *
+						sizeof(*me->coordinates_x[i]),
+						GFP_KERNEL);
+		me->coordinates_y[i] = kvmalloc(height * width *
+						sizeof(*me->coordinates_y[i]),
+						GFP_KERNEL);
 
 		if ((!me->coordinates_x[i]) ||
 		    (!me->coordinates_y[i])) {
@@ -2063,11 +2064,11 @@ ia_css_isp_3a_statistics_map_free(struct ia_css_isp_3a_statistics_map *me)
 {
 	if (me) {
 		if (me->data_allocated) {
-			sh_css_free(me->data_ptr);
+			kvfree(me->data_ptr);
 			me->data_ptr = NULL;
 			me->data_allocated = false;
 		}
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -2081,7 +2082,7 @@ ia_css_isp_3a_statistics_map_allocate(
 	 * so we use a local char * instead. */
 	char *base_ptr;
 
-	me = sh_css_malloc(sizeof(*me));
+	me = kvmalloc(sizeof(*me), GFP_KERNEL);
 	if (!me) {
 		IA_CSS_LEAVE("cannot allocate memory");
 		goto err;
@@ -2090,7 +2091,7 @@ ia_css_isp_3a_statistics_map_allocate(
 	me->data_ptr = data_ptr;
 	me->data_allocated = !data_ptr;
 	if (!data_ptr) {
-		me->data_ptr = sh_css_malloc(isp_stats->size);
+		me->data_ptr = kvmalloc(isp_stats->size, GFP_KERNEL);
 		if (!me->data_ptr) {
 			IA_CSS_LEAVE("cannot allocate memory");
 			goto err;
@@ -2113,7 +2114,7 @@ ia_css_isp_3a_statistics_map_allocate(
 
 err:
 	if (me)
-		sh_css_free(me);
+		kvfree(me);
 	return NULL;
 }
 
@@ -2780,7 +2781,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	if (!grid->enable)
 		return NULL;
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
@@ -2804,7 +2805,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	me->size = me->dmem_size + me->vmem_size * 2 + me->hmem_size;
 	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
 	if (me->data_ptr == mmgr_NULL) {
-		sh_css_free(me);
+		kvfree(me);
 		me = NULL;
 		goto err;
 	}
@@ -2827,7 +2828,7 @@ ia_css_isp_3a_statistics_free(struct ia_css_isp_3a_statistics *me)
 {
 	if (me) {
 		hmm_free(me->data_ptr);
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -2846,7 +2847,7 @@ ia_css_metadata_allocate(const struct ia_css_metadata_info *metadata_info)
 	if (metadata_info->size == 0)
 		return NULL;
 
-	md = sh_css_malloc(sizeof(*md));
+	md = kvmalloc(sizeof(*md), GFP_KERNEL);
 	if (!md)
 		goto error;
 
@@ -2876,7 +2877,7 @@ ia_css_metadata_free(struct ia_css_metadata *me)
 		 * and debugging. */
 		IA_CSS_ENTER("me=%p", me);
 		hmm_free(me->address);
-		sh_css_free(me);
+		kvfree(me);
 		IA_CSS_LEAVE("void");
 	}
 }
@@ -2977,7 +2978,7 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	enum ia_css_err err = IA_CSS_SUCCESS;
 	size_t params_size;
 	struct ia_css_isp_parameters *params =
-	sh_css_malloc(sizeof(struct ia_css_isp_parameters));
+	kvmalloc(sizeof(struct ia_css_isp_parameters), GFP_KERNEL);
 
 	if (!params)
 	{
@@ -3526,7 +3527,7 @@ ia_css_stream_isp_parameters_uninit(struct ia_css_stream *stream)
 		free_map(&per_frame_params->ddr_ptrs);
 
 	if (params->fpn_config.data) {
-		sh_css_free(params->fpn_config.data);
+		kvfree(params->fpn_config.data);
 		params->fpn_config.data = NULL;
 	}
 
@@ -3542,9 +3543,9 @@ ia_css_stream_isp_parameters_uninit(struct ia_css_stream *stream)
 		}
 	}
 
-	sh_css_free(params);
+	kvfree(params);
 	if (per_frame_params)
-		sh_css_free(per_frame_params);
+		kvfree(per_frame_params);
 	stream->isp_params_configs = NULL;
 	stream->per_frame_isp_params_configs = NULL;
 
@@ -4880,19 +4881,18 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 
 	assert(grid);
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
 	me->grid = *grid;
 	grid_size = grid->width * grid->height;
-	me->data = sh_css_malloc(grid_size * sizeof(*me->data));
+	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
 	if (!me->data)
 		goto err;
 #if !defined(HAS_NO_HMEM)
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
-	me->rgby_data = (struct ia_css_3a_rgby_output *)sh_css_malloc(sizeof_hmem(
-			    HMEM0_ID));
+	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
 #else
 	me->rgby_data = NULL;
 #endif
@@ -4910,10 +4910,10 @@ void
 ia_css_3a_statistics_free(struct ia_css_3a_statistics *me)
 {
 	if (me) {
-		sh_css_free(me->rgby_data);
-		sh_css_free(me->data);
+		kvfree(me->rgby_data);
+		kvfree(me->data);
 		memset(me, 0, sizeof(struct ia_css_3a_statistics));
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -4924,18 +4924,18 @@ ia_css_dvs_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	assert(grid);
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
 	me->grid = *grid;
-	me->hor_proj = sh_css_malloc(grid->height * IA_CSS_DVS_NUM_COEF_TYPES *
-				     sizeof(*me->hor_proj));
+	me->hor_proj = kvmalloc(grid->height * IA_CSS_DVS_NUM_COEF_TYPES *
+				sizeof(*me->hor_proj), GFP_KERNEL);
 	if (!me->hor_proj)
 		goto err;
 
-	me->ver_proj = sh_css_malloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES *
-				     sizeof(*me->ver_proj));
+	me->ver_proj = kvmalloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES *
+				sizeof(*me->ver_proj), GFP_KERNEL);
 	if (!me->ver_proj)
 		goto err;
 
@@ -4949,10 +4949,10 @@ void
 ia_css_dvs_statistics_free(struct ia_css_dvs_statistics *me)
 {
 	if (me) {
-		sh_css_free(me->hor_proj);
-		sh_css_free(me->ver_proj);
+		kvfree(me->hor_proj);
+		kvfree(me->ver_proj);
 		memset(me, 0, sizeof(struct ia_css_dvs_statistics));
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -4963,21 +4963,21 @@ ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	assert(grid);
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
 	me->grid = *grid;
 
-	me->hor_coefs = sh_css_malloc(grid->num_hor_coefs *
-				      IA_CSS_DVS_NUM_COEF_TYPES *
-				      sizeof(*me->hor_coefs));
+	me->hor_coefs = kvmalloc(grid->num_hor_coefs *
+				 IA_CSS_DVS_NUM_COEF_TYPES *
+				 sizeof(*me->hor_coefs), GFP_KERNEL);
 	if (!me->hor_coefs)
 		goto err;
 
-	me->ver_coefs = sh_css_malloc(grid->num_ver_coefs *
-				      IA_CSS_DVS_NUM_COEF_TYPES *
-				      sizeof(*me->ver_coefs));
+	me->ver_coefs = kvmalloc(grid->num_ver_coefs *
+				 IA_CSS_DVS_NUM_COEF_TYPES *
+				 sizeof(*me->ver_coefs), GFP_KERNEL);
 	if (!me->ver_coefs)
 		goto err;
 
@@ -4991,10 +4991,10 @@ void
 ia_css_dvs_coefficients_free(struct ia_css_dvs_coefficients *me)
 {
 	if (me) {
-		sh_css_free(me->hor_coefs);
-		sh_css_free(me->ver_coefs);
+		kvfree(me->hor_coefs);
+		kvfree(me->ver_coefs);
 		memset(me, 0, sizeof(struct ia_css_dvs_coefficients));
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -5005,49 +5005,65 @@ ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	assert(grid);
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
 	me->grid = *grid;
 
-	me->hor_prod.odd_real = sh_css_malloc(grid->aligned_width *
-					      grid->aligned_height * sizeof(*me->hor_prod.odd_real));
+	me->hor_prod.odd_real = kvmalloc(grid->aligned_width *
+					 grid->aligned_height *
+					 sizeof(*me->hor_prod.odd_real),
+					 GFP_KERNEL);
 	if (!me->hor_prod.odd_real)
 		goto err;
 
-	me->hor_prod.odd_imag = sh_css_malloc(grid->aligned_width *
-					      grid->aligned_height * sizeof(*me->hor_prod.odd_imag));
+	me->hor_prod.odd_imag = kvmalloc(grid->aligned_width *
+					 grid->aligned_height *
+					 sizeof(*me->hor_prod.odd_imag),
+					 GFP_KERNEL);
 	if (!me->hor_prod.odd_imag)
 		goto err;
 
-	me->hor_prod.even_real = sh_css_malloc(grid->aligned_width *
-					       grid->aligned_height * sizeof(*me->hor_prod.even_real));
+	me->hor_prod.even_real = kvmalloc(grid->aligned_width *
+					  grid->aligned_height *
+					  sizeof(*me->hor_prod.even_real),
+					  GFP_KERNEL);
 	if (!me->hor_prod.even_real)
 		goto err;
 
-	me->hor_prod.even_imag = sh_css_malloc(grid->aligned_width *
-					       grid->aligned_height * sizeof(*me->hor_prod.even_imag));
+	me->hor_prod.even_imag = kvmalloc(grid->aligned_width *
+					  grid->aligned_height *
+					  sizeof(*me->hor_prod.even_imag),
+					  GFP_KERNEL);
 	if (!me->hor_prod.even_imag)
 		goto err;
 
-	me->ver_prod.odd_real = sh_css_malloc(grid->aligned_width *
-					      grid->aligned_height * sizeof(*me->ver_prod.odd_real));
+	me->ver_prod.odd_real = kvmalloc(grid->aligned_width *
+					 grid->aligned_height *
+					 sizeof(*me->ver_prod.odd_real),
+					 GFP_KERNEL);
 	if (!me->ver_prod.odd_real)
 		goto err;
 
-	me->ver_prod.odd_imag = sh_css_malloc(grid->aligned_width *
-					      grid->aligned_height * sizeof(*me->ver_prod.odd_imag));
+	me->ver_prod.odd_imag = kvmalloc(grid->aligned_width *
+					 grid->aligned_height *
+					 sizeof(*me->ver_prod.odd_imag),
+					 GFP_KERNEL);
 	if (!me->ver_prod.odd_imag)
 		goto err;
 
-	me->ver_prod.even_real = sh_css_malloc(grid->aligned_width *
-					       grid->aligned_height * sizeof(*me->ver_prod.even_real));
+	me->ver_prod.even_real = kvmalloc(grid->aligned_width *
+					  grid->aligned_height *
+					  sizeof(*me->ver_prod.even_real),
+					  GFP_KERNEL);
 	if (!me->ver_prod.even_real)
 		goto err;
 
-	me->ver_prod.even_imag = sh_css_malloc(grid->aligned_width *
-					       grid->aligned_height * sizeof(*me->ver_prod.even_imag));
+	me->ver_prod.even_imag = kvmalloc(grid->aligned_width *
+					  grid->aligned_height *
+					  sizeof(*me->ver_prod.even_imag),
+					  GFP_KERNEL);
 	if (!me->ver_prod.even_imag)
 		goto err;
 
@@ -5061,16 +5077,16 @@ void
 ia_css_dvs2_statistics_free(struct ia_css_dvs2_statistics *me)
 {
 	if (me) {
-		sh_css_free(me->hor_prod.odd_real);
-		sh_css_free(me->hor_prod.odd_imag);
-		sh_css_free(me->hor_prod.even_real);
-		sh_css_free(me->hor_prod.even_imag);
-		sh_css_free(me->ver_prod.odd_real);
-		sh_css_free(me->ver_prod.odd_imag);
-		sh_css_free(me->ver_prod.even_real);
-		sh_css_free(me->ver_prod.even_imag);
+		kvfree(me->hor_prod.odd_real);
+		kvfree(me->hor_prod.odd_imag);
+		kvfree(me->hor_prod.even_real);
+		kvfree(me->hor_prod.even_imag);
+		kvfree(me->ver_prod.odd_real);
+		kvfree(me->ver_prod.odd_imag);
+		kvfree(me->ver_prod.even_real);
+		kvfree(me->ver_prod.even_imag);
 		memset(me, 0, sizeof(struct ia_css_dvs2_statistics));
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -5081,49 +5097,57 @@ ia_css_dvs2_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	assert(grid);
 
-	me = sh_css_calloc(1, sizeof(*me));
+	me = kvcalloc(1, sizeof(*me), GFP_KERNEL);
 	if (!me)
 		goto err;
 
 	me->grid = *grid;
 
-	me->hor_coefs.odd_real = sh_css_malloc(grid->num_hor_coefs *
-					       sizeof(*me->hor_coefs.odd_real));
+	me->hor_coefs.odd_real = kvmalloc(grid->num_hor_coefs *
+					  sizeof(*me->hor_coefs.odd_real),
+					  GFP_KERNEL);
 	if (!me->hor_coefs.odd_real)
 		goto err;
 
-	me->hor_coefs.odd_imag = sh_css_malloc(grid->num_hor_coefs *
-					       sizeof(*me->hor_coefs.odd_imag));
+	me->hor_coefs.odd_imag = kvmalloc(grid->num_hor_coefs *
+					  sizeof(*me->hor_coefs.odd_imag),
+					  GFP_KERNEL);
 	if (!me->hor_coefs.odd_imag)
 		goto err;
 
-	me->hor_coefs.even_real = sh_css_malloc(grid->num_hor_coefs *
-						sizeof(*me->hor_coefs.even_real));
+	me->hor_coefs.even_real = kvmalloc(grid->num_hor_coefs *
+					   sizeof(*me->hor_coefs.even_real),
+					   GFP_KERNEL);
 	if (!me->hor_coefs.even_real)
 		goto err;
 
-	me->hor_coefs.even_imag = sh_css_malloc(grid->num_hor_coefs *
-						sizeof(*me->hor_coefs.even_imag));
+	me->hor_coefs.even_imag = kvmalloc(grid->num_hor_coefs *
+					   sizeof(*me->hor_coefs.even_imag),
+					   GFP_KERNEL);
 	if (!me->hor_coefs.even_imag)
 		goto err;
 
-	me->ver_coefs.odd_real = sh_css_malloc(grid->num_ver_coefs *
-					       sizeof(*me->ver_coefs.odd_real));
+	me->ver_coefs.odd_real = kvmalloc(grid->num_ver_coefs *
+					  sizeof(*me->ver_coefs.odd_real),
+					  GFP_KERNEL);
 	if (!me->ver_coefs.odd_real)
 		goto err;
 
-	me->ver_coefs.odd_imag = sh_css_malloc(grid->num_ver_coefs *
-					       sizeof(*me->ver_coefs.odd_imag));
+	me->ver_coefs.odd_imag = kvmalloc(grid->num_ver_coefs *
+					  sizeof(*me->ver_coefs.odd_imag),
+					  GFP_KERNEL);
 	if (!me->ver_coefs.odd_imag)
 		goto err;
 
-	me->ver_coefs.even_real = sh_css_malloc(grid->num_ver_coefs *
-						sizeof(*me->ver_coefs.even_real));
+	me->ver_coefs.even_real = kvmalloc(grid->num_ver_coefs *
+					   sizeof(*me->ver_coefs.even_real),
+					   GFP_KERNEL);
 	if (!me->ver_coefs.even_real)
 		goto err;
 
-	me->ver_coefs.even_imag = sh_css_malloc(grid->num_ver_coefs *
-						sizeof(*me->ver_coefs.even_imag));
+	me->ver_coefs.even_imag = kvmalloc(grid->num_ver_coefs *
+					   sizeof(*me->ver_coefs.even_imag),
+					   GFP_KERNEL);
 	if (!me->ver_coefs.even_imag)
 		goto err;
 
@@ -5137,16 +5161,16 @@ void
 ia_css_dvs2_coefficients_free(struct ia_css_dvs2_coefficients *me)
 {
 	if (me) {
-		sh_css_free(me->hor_coefs.odd_real);
-		sh_css_free(me->hor_coefs.odd_imag);
-		sh_css_free(me->hor_coefs.even_real);
-		sh_css_free(me->hor_coefs.even_imag);
-		sh_css_free(me->ver_coefs.odd_real);
-		sh_css_free(me->ver_coefs.odd_imag);
-		sh_css_free(me->ver_coefs.even_real);
-		sh_css_free(me->ver_coefs.even_imag);
+		kvfree(me->hor_coefs.odd_real);
+		kvfree(me->hor_coefs.odd_imag);
+		kvfree(me->hor_coefs.even_real);
+		kvfree(me->hor_coefs.even_imag);
+		kvfree(me->ver_coefs.odd_real);
+		kvfree(me->ver_coefs.odd_imag);
+		kvfree(me->ver_coefs.even_real);
+		kvfree(me->ver_coefs.even_imag);
 		memset(me, 0, sizeof(struct ia_css_dvs2_coefficients));
-		sh_css_free(me);
+		kvfree(me);
 	}
 }
 
@@ -5169,8 +5193,8 @@ ia_css_dvs2_6axis_config_allocate(const struct ia_css_stream *stream)
 		goto err;
 	}
 
-	dvs_config = (struct ia_css_dvs_6axis_config *)sh_css_calloc(1,
-		     sizeof(struct ia_css_dvs_6axis_config));
+	dvs_config = kvcalloc(1, sizeof(struct ia_css_dvs_6axis_config),
+			      GFP_KERNEL);
 	if (!dvs_config)
 		goto err;
 
@@ -5184,23 +5208,25 @@ ia_css_dvs2_6axis_config_allocate(const struct ia_css_stream *stream)
 				    params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO]->height_uv;
 	IA_CSS_LOG("table Y: W %d H %d", width_y, height_y);
 	IA_CSS_LOG("table UV: W %d H %d", width_uv, height_uv);
-	dvs_config->xcoords_y = (uint32_t *)sh_css_malloc(width_y * height_y * sizeof(
-				    uint32_t));
+	dvs_config->xcoords_y = kvmalloc(width_y * height_y * sizeof(uint32_t),
+					 GFP_KERNEL);
 	if (!dvs_config->xcoords_y)
 		goto err;
 
-	dvs_config->ycoords_y = (uint32_t *)sh_css_malloc(width_y * height_y * sizeof(
-				    uint32_t));
+	dvs_config->ycoords_y = kvmalloc(width_y * height_y * sizeof(uint32_t),
+					 GFP_KERNEL);
 	if (!dvs_config->ycoords_y)
 		goto err;
 
-	dvs_config->xcoords_uv = (uint32_t *)sh_css_malloc(width_uv * height_uv *
-				 sizeof(uint32_t));
+	dvs_config->xcoords_uv = kvmalloc(width_uv * height_uv *
+					  sizeof(uint32_t),
+					  GFP_KERNEL);
 	if (!dvs_config->xcoords_uv)
 		goto err;
 
-	dvs_config->ycoords_uv = (uint32_t *)sh_css_malloc(width_uv * height_uv *
-				 sizeof(uint32_t));
+	dvs_config->ycoords_uv = kvmalloc(width_uv * height_uv *
+					  sizeof(uint32_t),
+					  GFP_KERNEL);
 	if (!dvs_config->ycoords_uv)
 		goto err;
 
@@ -5214,12 +5240,12 @@ void
 ia_css_dvs2_6axis_config_free(struct ia_css_dvs_6axis_config *dvs_6axis_config)
 {
 	if (dvs_6axis_config) {
-		sh_css_free(dvs_6axis_config->xcoords_y);
-		sh_css_free(dvs_6axis_config->ycoords_y);
-		sh_css_free(dvs_6axis_config->xcoords_uv);
-		sh_css_free(dvs_6axis_config->ycoords_uv);
+		kvfree(dvs_6axis_config->xcoords_y);
+		kvfree(dvs_6axis_config->ycoords_y);
+		kvfree(dvs_6axis_config->xcoords_uv);
+		kvfree(dvs_6axis_config->ycoords_uv);
 		memset(dvs_6axis_config, 0, sizeof(struct ia_css_dvs_6axis_config));
-		sh_css_free(dvs_6axis_config);
+		kvfree(dvs_6axis_config);
 	}
 }
 
-- 
2.26.2

