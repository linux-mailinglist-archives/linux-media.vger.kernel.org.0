Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCD81E8EB0
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgE3G6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728714AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA3B820801;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=aEE6JaVbtvfsM+kgWSz0g81jthpoQk5+1Oj9iUIvzKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gfkp/zaTjIvKU3IOrDrLomsA/KtR6eXAhDJsIvKbsI9pwQPiB2d2i5U98dfL+O+Bi
         Qx8/5tE/sovNuotEIfjlNpR/qD/GJX+vP25vk9lKKKopNQU9ccPSR7jGmYhHVjHRQl
         O8eHtKjNnpHctZwrzdVd0zFlWGSWhxiBaUXxx6qc=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hoQ-Mc; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/41] media: atomisp: get rid of mmgr_load and mmgr_store
Date:   Sat, 30 May 2020 08:55:22 +0200
Message-Id: <e3b17ce89ae332eb4276e4b230556a2c12bd60fb.1590821410.git.mchehab+huawei@kernel.org>
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

Those functions are just wrappers for hmm_load/hmm_store.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/hive_isp_css_common/host/debug.c      |  8 +++---
 .../hive_isp_css_common/host/debug_private.h  |  8 +++---
 .../memory_access/memory_access.h             | 20 -------------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 18 +++++++++++-
 .../media/atomisp/pci/ia_css_memory_access.c  | 13 ---------
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |  2 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  2 +-
 .../pci/runtime/isp_param/src/isp_param.c     |  2 +-
 .../pci/runtime/queue/src/queue_access.c      |  8 +++---
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |  2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 12 ++++----
 .../media/atomisp/pci/sh_css_firmware.c       |  2 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 28 +++++++++----------
 13 files changed, 54 insertions(+), 71 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index d911aec24185..6079ca1e7732 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -48,13 +48,13 @@ void debug_buffer_ddr_init(const hrt_vaddress addr)
 	u32 tail = 0;
 	/* set the ddr queue */
 	debug_buffer_ddr_address = addr;
-	mmgr_store(addr + DEBUG_DATA_BUF_MODE_DDR_ADDR,
+	hmm_store(addr + DEBUG_DATA_BUF_MODE_DDR_ADDR,
 		   &mode, sizeof(debug_buf_mode_t));
-	mmgr_store(addr + DEBUG_DATA_HEAD_DDR_ADDR,
+	hmm_store(addr + DEBUG_DATA_HEAD_DDR_ADDR,
 		   &head, sizeof(uint32_t));
-	mmgr_store(addr + DEBUG_DATA_TAIL_DDR_ADDR,
+	hmm_store(addr + DEBUG_DATA_TAIL_DDR_ADDR,
 		   &tail, sizeof(uint32_t));
-	mmgr_store(addr + DEBUG_DATA_ENABLE_DDR_ADDR,
+	hmm_store(addr + DEBUG_DATA_ENABLE_DDR_ADDR,
 		   &enable, sizeof(uint32_t));
 
 	/* set the local copy */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
index 8447e33d1c04..f2f5b7658819 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug_private.h
@@ -101,22 +101,22 @@ STORAGE_CLASS_DEBUG_C void debug_synch_queue_ddr(void)
 {
 	u32	remote_tail;
 
-	mmgr_load(debug_buffer_ddr_address + DEBUG_DATA_TAIL_DDR_ADDR, &remote_tail,
+	hmm_load(debug_buffer_ddr_address + DEBUG_DATA_TAIL_DDR_ADDR, &remote_tail,
 		  sizeof(uint32_t));
 	/* We could move the remote head after the upload, but we would have to limit the upload w.r.t. the local head. This is easier */
 	if (remote_tail > debug_data_ptr->tail) {
 		size_t	delta = remote_tail - debug_data_ptr->tail;
 
-		mmgr_load(debug_buffer_ddr_address + DEBUG_DATA_BUF_DDR_ADDR +
+		hmm_load(debug_buffer_ddr_address + DEBUG_DATA_BUF_DDR_ADDR +
 			  debug_data_ptr->tail * sizeof(uint32_t),
 			  (void *)&debug_data_ptr->buf[debug_data_ptr->tail], delta * sizeof(uint32_t));
 	} else if (remote_tail < debug_data_ptr->tail) {
 		size_t	delta = DEBUG_BUF_SIZE - debug_data_ptr->tail;
 
-		mmgr_load(debug_buffer_ddr_address + DEBUG_DATA_BUF_DDR_ADDR +
+		hmm_load(debug_buffer_ddr_address + DEBUG_DATA_BUF_DDR_ADDR +
 			  debug_data_ptr->tail * sizeof(uint32_t),
 			  (void *)&debug_data_ptr->buf[debug_data_ptr->tail], delta * sizeof(uint32_t));
-		mmgr_load(debug_buffer_ddr_address + DEBUG_DATA_BUF_DDR_ADDR,
+		hmm_load(debug_buffer_ddr_address + DEBUG_DATA_BUF_DDR_ADDR,
 			  (void *)&debug_data_ptr->buf[0],
 			  remote_tail * sizeof(uint32_t));
 	} /* else we are up to date */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
index 19b9083995a4..4a062ee2f8df 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/memory_access/memory_access.h
@@ -91,24 +91,4 @@
 
 hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attribute);
 
-/*! Read an array of bytes from a virtual memory address
-
- \param	vaddr[in]		Address of an allocation
- \param	data[out]		pointer to the destination array
- \param	size[in]		number of bytes to read
-
- \return none
- */
-void mmgr_load(const hrt_vaddress vaddr, void *data, const size_t size);
-
-/*! Write an array of bytes to device registers or memory in the device
-
- \param	vaddr[in]		Address of an allocation
- \param	data[in]		pointer to the source array
- \param	size[in]		number of bytes to write
-
- \return none
- */
-void mmgr_store(const hrt_vaddress vaddr, const void *data, const size_t size);
-
 #endif /* __MEMORY_ACCESS_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 68dab2393767..5e983442ca80 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -403,9 +403,14 @@ static int load_and_flush(ia_css_ptr virt, void *data, unsigned int bytes)
 /* Read function in ISP memory management */
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 {
+	if (!virt) {
+		dev_warn(atomisp_dev,
+			"hmm_store: address is NULL\n");
+		return -EINVAL;
+	}
 	if (!data) {
 		dev_err(atomisp_dev,
-			"hmm_load NULL argument\n");
+			"hmm_store: data is a NULL argument\n");
 		return -EINVAL;
 	}
 	return load_and_flush(virt, data, bytes);
@@ -425,6 +430,17 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 	char *src, *des;
 	int ret;
 
+	if (!virt) {
+		dev_warn(atomisp_dev,
+			"hmm_store: address is NULL\n");
+		return -EINVAL;
+	}
+	if (!data) {
+		dev_err(atomisp_dev,
+			"hmm_store: data is a NULL argument\n");
+		return -EINVAL;
+	}
+
 	bo = hmm_bo_device_search_in_range(&bo_device, virt);
 	ret = hmm_check_bo(bo, virt);
 	if (ret)
diff --git a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
index e19b98fe7201..8dd41ec725f4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_memory_access.c
@@ -18,16 +18,3 @@ hrt_vaddress mmgr_alloc_attr(const size_t size, const uint16_t attrs)
 {
 	return hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, attrs);
 }
-
-void mmgr_load(const hrt_vaddress vaddr, void *data, const size_t size)
-{
-	if (vaddr && data)
-		hmm_load(vaddr, data, size);
-}
-
-void
-mmgr_store(const hrt_vaddress vaddr, const void *data, const size_t size)
-{
-	if (vaddr && data)
-		hmm_store(vaddr, data, size);
-}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index 827400957bad..fb0e6dcbca43 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -249,7 +249,7 @@ ia_css_get_dvs_statistics(
 	map = ia_css_isp_dvs_statistics_map_allocate(isp_stats, NULL);
 	if (map)
 	{
-		mmgr_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
+		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_dvs_statistics(host_stats, map);
 		ia_css_isp_dvs_statistics_map_free(map);
 	} else
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index 21e5fb940180..b9c7736baa44 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -189,7 +189,7 @@ ia_css_get_dvs2_statistics(
 	map = ia_css_isp_dvs_statistics_map_allocate(isp_stats, NULL);
 	if (map)
 	{
-		mmgr_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
+		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_dvs2_statistics(host_stats, map);
 		ia_css_isp_dvs_statistics_map_free(map);
 	} else
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 8138fb8b4155..d1442f5653da 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -194,7 +194,7 @@ ia_css_isp_param_copy_isp_mem_if_to_ddr(
 			return IA_CSS_ERR_INTERNAL_ERROR;
 		if (!size)
 			continue;
-		mmgr_store(ddr_mem_ptr, host_mem_ptr, size);
+		hmm_store(ddr_mem_ptr, host_mem_ptr, size);
 	}
 	return IA_CSS_SUCCESS;
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index 1e8d3eb82eab..a2f7bacd4206 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -63,7 +63,7 @@ int ia_css_queue_load(
 
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_HOST) {
 		/* doing DMA transfer of entire structure */
-		mmgr_load(rdesc->desc.remote.cb_desc_addr,
+		hmm_load(rdesc->desc.remote.cb_desc_addr,
 			  (void *)cb_desc,
 			  sizeof(ia_css_circbuf_desc_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_ISP) {
@@ -110,7 +110,7 @@ int ia_css_queue_store(
 					    cb_desc->step);
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_HOST) {
 		/* doing DMA transfer of entire structure */
-		mmgr_store(rdesc->desc.remote.cb_desc_addr,
+		hmm_store(rdesc->desc.remote.cb_desc_addr,
 			   (void *)cb_desc,
 			   sizeof(ia_css_circbuf_desc_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_ISP) {
@@ -136,7 +136,7 @@ int ia_css_queue_item_load(
 			     item,
 			     sizeof(ia_css_circbuf_elem_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_HOST) {
-		mmgr_load(rdesc->desc.remote.cb_elems_addr
+		hmm_load(rdesc->desc.remote.cb_elems_addr
 			  + position * sizeof(ia_css_circbuf_elem_t),
 			  (void *)item,
 			  sizeof(ia_css_circbuf_elem_t));
@@ -163,7 +163,7 @@ int ia_css_queue_item_store(
 			      item,
 			      sizeof(ia_css_circbuf_elem_t));
 	} else if (rdesc->location == IA_CSS_QUEUE_LOC_HOST) {
-		mmgr_store(rdesc->desc.remote.cb_elems_addr
+		hmm_store(rdesc->desc.remote.cb_elems_addr
 			   + position * sizeof(ia_css_circbuf_elem_t),
 			   (void *)item,
 			   sizeof(ia_css_circbuf_elem_t));
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 19326d888e53..65f8dda5e2c8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -66,7 +66,7 @@ enum ia_css_err ia_css_spctrl_load_fw(sp_ID_t sp_id,
 	code_addr = mmgr_alloc_attr(spctrl_cfg->code_size, 0);
 	if (code_addr == mmgr_NULL)
 		return IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
-	mmgr_store(code_addr, spctrl_cfg->code, spctrl_cfg->code_size);
+	hmm_store(code_addr, spctrl_cfg->code, spctrl_cfg->code_size);
 
 	if (sizeof(hrt_vaddress) > sizeof(hrt_data)) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index f9571252e6e0..791f03572f59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4312,7 +4312,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		return IA_CSS_ERR_INTERNAL_ERROR;
 	}
 
-	mmgr_store(h_vbuf->vptr,
+	hmm_store(h_vbuf->vptr,
 		   (void *)(&ddr_buffer),
 		   sizeof(struct sh_css_hmm_buffer));
 	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS)
@@ -4471,7 +4471,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 		    ddr_buffer_addr, buf_type);
 		if (hmm_buffer_record) {
 			/* valid hmm_buffer_record found. Save the kernel_ptr
-			 * for validation after performing mmgr_load.  The
+			 * for validation after performing hmm_load.  The
 			 * vbuf handle and buffer_record can be released.
 			 */
 			kernel_ptr = hmm_buffer_record->kernel_ptr;
@@ -4484,7 +4484,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			return IA_CSS_ERR_INTERNAL_ERROR;
 		}
 
-		mmgr_load(ddr_buffer_addr,
+		hmm_load(ddr_buffer_addr,
 			  &ddr_buffer,
 			  sizeof(struct sh_css_hmm_buffer));
 
@@ -10849,10 +10849,10 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 				sp_dmem_load(SP0_ID,
 						(unsigned int)sp_address_of(sp_group),
 						&sp_group, sizeof(struct sh_css_sp_group));
-				mmgr_load(sp_group.pipe[thread_id].sp_stage_addr[stage_num],
+				hmm_load(sp_group.pipe[thread_id].sp_stage_addr[stage_num],
 					    &sp_stage, sizeof(struct sh_css_sp_stage));
 
-				mmgr_load(sp_stage.isp_stage_addr,
+				hmm_load(sp_stage.isp_stage_addr,
 					    &isp_stage, sizeof(struct sh_css_isp_stage));
 
 				for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
@@ -10868,7 +10868,7 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 						isp_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].size;
 				}
 
-				mmgr_store(sp_stage.isp_stage_addr,
+				hmm_store(sp_stage.isp_stage_addr,
 					    &isp_stage, sizeof(struct sh_css_isp_stage));
 			}
 		}
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 5a2e86b02c85..fa7c62465f90 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -328,6 +328,6 @@ sh_css_load_blob(const unsigned char *blob, unsigned int size)
 
 	assert(blob);
 	if (target_addr)
-		mmgr_store(target_addr, blob, size);
+		hmm_store(target_addr, blob, size);
 	return target_addr;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 00388e563668..890f8e74a85d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1521,7 +1521,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 			int ofs = y * width + x;
 
 			for (k = 0; k < ISP_VEC_NELEMS; k += 2) {
-				mmgr_load(ptr, (void *)(&data), sizeof(int));
+				hmm_load(ptr, (void *)(&data), sizeof(int));
 				params->fpn_config.data[ofs + 2 * k] =
 				    (short)(data & 0xFFFF);
 				params->fpn_config.data[ofs + 2 * k + 2] =
@@ -1529,7 +1529,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 				ptr += sizeof(int);	/* byte system address */
 			}
 			for (k = 0; k < ISP_VEC_NELEMS; k += 2) {
-				mmgr_load(ptr, (void *)(&data), sizeof(int));
+				hmm_load(ptr, (void *)(&data), sizeof(int));
 				params->fpn_config.data[ofs + 2 * k + 1] =
 				    (short)(data & 0xFFFF);
 				params->fpn_config.data[ofs + 2 * k + 3] =
@@ -1620,7 +1620,7 @@ ia_css_params_store_ia_css_host_data(
 
 	IA_CSS_ENTER_PRIVATE("");
 
-	mmgr_store(ddr_addr,
+	hmm_store(ddr_addr,
 		   (void *)(data->address),
 		   (size_t)data->size);
 
@@ -2133,7 +2133,7 @@ ia_css_get_3a_statistics(struct ia_css_3a_statistics           *host_stats,
 	map = ia_css_isp_3a_statistics_map_allocate(isp_stats, NULL);
 	if (map)
 	{
-		mmgr_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
+		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_3a_statistics(host_stats, map);
 		ia_css_isp_3a_statistics_map_free(map);
 	} else
@@ -3368,7 +3368,7 @@ enum ia_css_err ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 		} else {
 			gdc_lut_convert_to_isp_format((const int(*)[HRT_GDC_N])lut,
 						      interleaved_lut_temp);
-			mmgr_store(pipe->scaler_pp_lut,
+			hmm_store(pipe->scaler_pp_lut,
 				   (int *)interleaved_lut_temp,
 				   sizeof(zoom_table));
 		}
@@ -3411,7 +3411,7 @@ enum ia_css_err sh_css_params_map_and_store_default_gdc_lut(void)
 
 	gdc_lut_convert_to_isp_format((const int(*)[HRT_GDC_N])zoom_table,
 				      interleaved_lut_temp);
-	mmgr_store(default_gdc_lut, (int *)interleaved_lut_temp,
+	hmm_store(default_gdc_lut, (int *)interleaved_lut_temp,
 		   sizeof(zoom_table));
 
 	IA_CSS_LEAVE_PRIVATE("lut(%u) err=%d", default_gdc_lut, err);
@@ -3656,7 +3656,7 @@ static void sh_css_update_isp_params_to_ddr(
 
 	assert(params);
 
-	mmgr_store(ddr_ptr, &params->uds, size);
+	hmm_store(ddr_ptr, &params->uds, size);
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
@@ -3672,7 +3672,7 @@ static void sh_css_update_isp_mem_params_to_ddr(
 
 	params = ia_css_isp_param_get_mem_init(&binary->mem_params,
 					       IA_CSS_PARAM_CLASS_PARAM, mem);
-	mmgr_store(ddr_mem_ptr, params->address, size);
+	hmm_store(ddr_mem_ptr, params->address, size);
 
 	IA_CSS_LEAVE_PRIVATE("void");
 }
@@ -4176,7 +4176,7 @@ sh_css_params_write_to_ddr_internal(
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
-		mmgr_store(ddr_map->macc_tbl,
+		hmm_store(ddr_map->macc_tbl,
 			   converted_macc_table.data,
 			   sizeof(converted_macc_table.data));
 	}
@@ -4461,7 +4461,7 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 hrt_vaddress sh_css_store_sp_group_to_ddr(void)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
-	mmgr_store(xmem_sp_group_ptrs,
+	hmm_store(xmem_sp_group_ptrs,
 		   &sh_css_sp_group,
 		   sizeof(struct sh_css_sp_group));
 	return xmem_sp_group_ptrs;
@@ -4472,7 +4472,7 @@ hrt_vaddress sh_css_store_sp_stage_to_ddr(
     unsigned int stage)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
-	mmgr_store(xmem_sp_stage_ptrs[pipe][stage],
+	hmm_store(xmem_sp_stage_ptrs[pipe][stage],
 		   &sh_css_sp_stage,
 		   sizeof(struct sh_css_sp_stage));
 	return xmem_sp_stage_ptrs[pipe][stage];
@@ -4483,7 +4483,7 @@ hrt_vaddress sh_css_store_isp_stage_to_ddr(
     unsigned int stage)
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
-	mmgr_store(xmem_isp_stage_ptrs[pipe][stage],
+	hmm_store(xmem_isp_stage_ptrs[pipe][stage],
 		   &sh_css_isp_stage,
 		   sizeof(struct sh_css_isp_stage));
 	return xmem_isp_stage_ptrs[pipe][stage];
@@ -4545,7 +4545,7 @@ static enum ia_css_err write_ia_css_isp_parameter_set_info_to_ddr(
 					 mmgr_alloc_attr(sizeof(struct ia_css_isp_parameter_set_info), 0));
 	succ = (*out != mmgr_NULL);
 	if (succ)
-		mmgr_store(*out,
+		hmm_store(*out,
 			   me, sizeof(struct ia_css_isp_parameter_set_info));
 	else
 		err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
@@ -4574,7 +4574,7 @@ free_ia_css_isp_parameter_set_info(
 		return err;
 	}
 
-	mmgr_load(ptr, &isp_params_info.mem_map, sizeof(struct sh_css_ddr_address_map));
+	hmm_load(ptr, &isp_params_info.mem_map, sizeof(struct sh_css_ddr_address_map));
 	/* copy map using size info */
 	for (i = 0; i < (sizeof(struct sh_css_ddr_address_map_size) /
 			 sizeof(size_t)); i++)
-- 
2.26.2

