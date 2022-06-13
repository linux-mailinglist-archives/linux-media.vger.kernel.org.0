Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C253549FD7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349543AbiFMUp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344622AbiFMUom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A5E42611E
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7fhExAJgH4M64/mPSdNRrJyrj1bvaz0Dm1lVOnBQnBA=;
        b=atGpFA/O1SfdvFQ+b0U+oaCUmnImv4LFleOWsFFUNFVqHp5JD2yE+aCLoi/5lWfdSW7By8
        FK7gvNnCKkCJBSBJAjWvZ5FhyJVRLYH8ody9JCsPSOs/h7JiNmyXIyj3qZXfL00e71uoE+
        3PLJojiQE5F/YeA3G3gUupMSQBESBc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-2ReAnx-cOj2183sNQsrcVg-1; Mon, 13 Jun 2022 15:52:32 -0400
X-MC-Unique: 2ReAnx-cOj2183sNQsrcVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71576185A79C;
        Mon, 13 Jun 2022 19:52:31 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E922F2166B26;
        Mon, 13 Jun 2022 19:52:29 +0000 (UTC)
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
Subject: [PATCH 29/40] media: atomisp: Simplify hmm_alloc() calls
Date:   Mon, 13 Jun 2022 21:51:26 +0200
Message-Id: <20220613195137.8117-30-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make hmm_alloc() only take size as a parameter and remove other parameters.
since all callers always pass the same flags.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  4 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 19 ++++++----
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  2 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  2 +-
 .../atomisp/pci/runtime/frame/src/frame.c     |  3 +-
 .../pci/runtime/isp_param/src/isp_param.c     |  2 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  3 +-
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |  2 +-
 .../media/atomisp/pci/sh_css_firmware.c       |  2 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 37 +++++++------------
 10 files changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 615805d0dd91..c0384bb0a762 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -36,9 +36,7 @@
 int hmm_init(void);
 void hmm_cleanup(void);
 
-ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
-		     int from_highmem, const void __user *userptr,
-		     const uint16_t attrs);
+ia_css_ptr hmm_alloc(size_t bytes);
 ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr);
 void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index bc5beb5f8e97..7e56e8dbec5c 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -141,7 +141,7 @@ int hmm_init(void)
 	 * at the beginning, to avoid hmm_alloc return 0 in the
 	 * further allocation.
 	 */
-	dummy_ptr = hmm_alloc(1, HMM_BO_PRIVATE, 0, NULL, 0);
+	dummy_ptr = hmm_alloc(1);
 
 	if (!ret) {
 		ret = sysfs_create_group(&atomisp_dev->kobj,
@@ -168,9 +168,7 @@ void hmm_cleanup(void)
 	hmm_initialized = false;
 }
 
-ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
-		     int from_highmem, const void __user *userptr,
-		     const uint16_t attrs)
+static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type, const void __user *userptr)
 {
 	unsigned int pgnr;
 	struct hmm_buffer_object *bo;
@@ -194,7 +192,7 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	}
 
 	/* Allocate pages for memory */
-	ret = hmm_bo_alloc_pages(bo, type, from_highmem, userptr);
+	ret = hmm_bo_alloc_pages(bo, type, false, userptr);
 	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_alloc_pages failed.\n");
 		goto alloc_page_err;
@@ -208,8 +206,8 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	}
 
 	dev_dbg(atomisp_dev,
-		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p\n",
-		__func__, bo->start, bytes, type, from_highmem, userptr);
+		"%s: pages: 0x%08x (%zu bytes), type: %d, user ptr %p\n",
+		__func__, bo->start, bytes, type, userptr);
 
 	return bo->start;
 
@@ -221,9 +219,14 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	return 0;
 }
 
+ia_css_ptr hmm_alloc(size_t bytes)
+{
+	return __hmm_alloc(bytes, HMM_BO_PRIVATE, NULL);
+}
+
 ia_css_ptr hmm_create_from_userdata(size_t bytes, const void __user *userptr)
 {
-	return hmm_alloc(bytes, HMM_BO_USER, 0, userptr, 0);
+	return __hmm_alloc(bytes, HMM_BO_USER, userptr);
 }
 
 void hmm_free(ia_css_ptr virt)
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index 13caa55fd51a..bf0a768f8fe1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -331,7 +331,7 @@ ia_css_isp_dvs_statistics_allocate(
 			    HIVE_ISP_DDR_WORD_BYTES);
 
 	me->size = hor_size + ver_size;
-	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
+	me->data_ptr = hmm_alloc(me->size);
 	if (me->data_ptr == mmgr_NULL)
 		goto err;
 	me->hor_size = hor_size;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index f608740e8340..c13de289a3db 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -294,7 +294,7 @@ ia_css_isp_dvs2_statistics_allocate(
 	       * grid->aligned_height * IA_CSS_DVS2_NUM_COEF_TYPES;
 
 	me->size = 2 * size;
-	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
+	me->data_ptr = hmm_alloc(me->size);
 	if (me->data_ptr == mmgr_NULL)
 		goto err;
 	me->hor_proj = me->data_ptr;
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index b0ce288b76be..bd0eb8641265 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -728,8 +728,7 @@ static int frame_allocate_buffer_data(struct ia_css_frame *frame)
 #ifdef ISP2401
 	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
 #endif
-	frame->data = hmm_alloc(frame->data_bytes,
-				HMM_BO_PRIVATE, 0, NULL, 0);
+	frame->data = hmm_alloc(frame->data_bytes);
 	if (frame->data == mmgr_NULL)
 		return -ENOMEM;
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 823ec54b6281..99c2f3a533ab 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -131,7 +131,7 @@ ia_css_isp_param_allocate_isp_parameters(
 					goto cleanup;
 				}
 				if (pclass != IA_CSS_PARAM_CLASS_PARAM) {
-					css_params->params[pclass][mem].address = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, 0);
+					css_params->params[pclass][mem].address = hmm_alloc(size);
 					if (!css_params->params[pclass][mem].address) {
 						err = -ENOMEM;
 						goto cleanup;
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index b84c6cff1499..2e07dab8bf51 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -285,8 +285,7 @@ void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			}
 			if (new_handle->vptr == 0x0) {
 				/* we need to allocate */
-				new_handle->vptr = hmm_alloc(new_handle->size,
-							     HMM_BO_PRIVATE, 0, NULL, 0);
+				new_handle->vptr = hmm_alloc(new_handle->size);
 			} else {
 				/* we popped a buffer */
 				*handle = new_handle;
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 7f4592565af6..c34bfc5f970d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -64,7 +64,7 @@ int ia_css_spctrl_load_fw(sp_ID_t sp_id, ia_css_spctrl_cfg *spctrl_cfg)
 	 * Data used to be stored separately, because of access alignment constraints,
 	 * fix the FW generation instead
 	 */
-	code_addr = hmm_alloc(spctrl_cfg->code_size, HMM_BO_PRIVATE, 0, NULL, 0);
+	code_addr = hmm_alloc(spctrl_cfg->code_size);
 	if (code_addr == mmgr_NULL)
 		return -ENOMEM;
 	hmm_store(code_addr, spctrl_cfg->code, spctrl_cfg->code_size);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index dd688f8ab649..e7ef578db8ab 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -369,7 +369,7 @@ void sh_css_unload_firmware(void)
 ia_css_ptr
 sh_css_load_blob(const unsigned char *blob, unsigned int size)
 {
-	ia_css_ptr target_addr = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, 0);
+	ia_css_ptr target_addr = hmm_alloc(size);
 	/*
 	 * this will allocate memory aligned to a DDR word boundary which
 	 * is required for the CSS DMA to read the instructions.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index b5a10725d263..0e7c38b2bfe3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2072,8 +2072,7 @@ static bool realloc_isp_css_mm_buf(
     size_t *curr_size,
     size_t needed_size,
     bool force,
-    int *err,
-    uint16_t mmgr_attribute)
+    int *err)
 {
 	s32 id;
 
@@ -2095,11 +2094,7 @@ static bool realloc_isp_css_mm_buf(
 
 	id = IA_CSS_REFCOUNT_PARAM_BUFFER;
 	ia_css_refcount_decrement(id, *curr_buf);
-	*curr_buf = ia_css_refcount_increment(id, hmm_alloc(needed_size,
-							    HMM_BO_PRIVATE, 0,
-							    NULL,
-							    mmgr_attribute));
-
+	*curr_buf = ia_css_refcount_increment(id, hmm_alloc(needed_size));
 	if (!*curr_buf) {
 		*err = -ENOMEM;
 		*curr_size = 0;
@@ -2122,7 +2117,7 @@ static bool reallocate_buffer(
 	IA_CSS_ENTER_PRIVATE("void");
 
 	ret = realloc_isp_css_mm_buf(curr_buf,
-				     curr_size, needed_size, force, err, 0);
+				     curr_size, needed_size, force, err);
 
 	IA_CSS_LEAVE_PRIVATE("ret=%d", ret);
 	return ret;
@@ -2161,7 +2156,7 @@ ia_css_isp_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 	me->hmem_size = CEIL_MUL(me->hmem_size, HIVE_ISP_DDR_WORD_BYTES);
 
 	me->size = me->dmem_size + me->vmem_size * 2 + me->hmem_size;
-	me->data_ptr = hmm_alloc(me->size, HMM_BO_PRIVATE, 0, NULL, 0);
+	me->data_ptr = hmm_alloc(me->size);
 	if (me->data_ptr == mmgr_NULL) {
 		kvfree(me);
 		me = NULL;
@@ -2211,7 +2206,7 @@ ia_css_metadata_allocate(const struct ia_css_metadata_info *metadata_info)
 
 	md->info = *metadata_info;
 	md->exp_id = 0;
-	md->address = hmm_alloc(metadata_info->size, HMM_BO_PRIVATE, 0, NULL, 0);
+	md->address = hmm_alloc(metadata_info->size);
 	if (md->address == mmgr_NULL)
 		goto error;
 
@@ -2364,13 +2359,13 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	ddr_ptrs_size->isp_param = params_size;
 	ddr_ptrs->isp_param =
 	ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-				  hmm_alloc(params_size, HMM_BO_PRIVATE, 0, NULL, 0));
+				  hmm_alloc(params_size));
 	succ &= (ddr_ptrs->isp_param != mmgr_NULL);
 
 	ddr_ptrs_size->macc_tbl = sizeof(struct ia_css_macc_table);
 	ddr_ptrs->macc_tbl =
 	ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-				  hmm_alloc(sizeof(struct ia_css_macc_table), HMM_BO_PRIVATE, 0, NULL, 0));
+				  hmm_alloc(sizeof(struct ia_css_macc_table)));
 	succ &= (ddr_ptrs->macc_tbl != mmgr_NULL);
 
 	*isp_params_out = params;
@@ -2584,12 +2579,10 @@ sh_css_params_init(void)
 		for (i = 0; i < SH_CSS_MAX_STAGES; i++) {
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
-						  hmm_alloc(sizeof(struct sh_css_sp_stage),
-							    HMM_BO_PRIVATE, 0, NULL, 0));
+						  hmm_alloc(sizeof(struct sh_css_sp_stage)));
 			xmem_isp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
-						  hmm_alloc(sizeof(struct sh_css_sp_stage),
-							    HMM_BO_PRIVATE, 0, NULL, 0));
+						  hmm_alloc(sizeof(struct sh_css_sp_stage)));
 
 			if ((xmem_sp_stage_ptrs[p][i] == mmgr_NULL) ||
 			    (xmem_isp_stage_ptrs[p][i] == mmgr_NULL)) {
@@ -2610,11 +2603,9 @@ sh_css_params_init(void)
 
 	sp_ddr_ptrs = ia_css_refcount_increment(-1,
 						hmm_alloc(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
-								   HIVE_ISP_DDR_WORD_BYTES),
-							  HMM_BO_PRIVATE, 0, NULL, 0));
+								   HIVE_ISP_DDR_WORD_BYTES)));
 	xmem_sp_group_ptrs = ia_css_refcount_increment(-1,
-						       hmm_alloc(sizeof(struct sh_css_sp_group),
-								 HMM_BO_PRIVATE, 0, NULL, 0));
+						       hmm_alloc(sizeof(struct sh_css_sp_group)));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
 	    (xmem_sp_group_ptrs == mmgr_NULL)) {
@@ -2669,7 +2660,7 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 	}
 
 	if (!stream_started) {
-		pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
+		pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table));
 
 		if (pipe->scaler_pp_lut == mmgr_NULL) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
@@ -2711,7 +2702,7 @@ int sh_css_params_map_and_store_default_gdc_lut(void)
 
 	host_lut_store((void *)zoom_table);
 
-	default_gdc_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
+	default_gdc_lut = hmm_alloc(sizeof(zoom_table));
 
 	if (default_gdc_lut == mmgr_NULL)
 		return -ENOMEM;
@@ -3804,7 +3795,7 @@ static int write_ia_css_isp_parameter_set_info_to_ddr(
 	assert(out);
 
 	*out = ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_SET_POOL,
-					 hmm_alloc(sizeof(struct ia_css_isp_parameter_set_info), HMM_BO_PRIVATE, 0, NULL, 0));
+					 hmm_alloc(sizeof(struct ia_css_isp_parameter_set_info)));
 	succ = (*out != mmgr_NULL);
 	if (succ)
 		hmm_store(*out,
-- 
2.36.0

