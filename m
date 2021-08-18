Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E533F05FE
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbhHRONi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239207AbhHRONH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:13:07 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA4AC0612E7
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:32 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t1so2372506pgv.3
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mmScyDNHuhPqInIkPDi1hrnGW/8MBui8p7fDqyfKaaY=;
        b=AAhat11RtUjh2IsCIHcK4cJMJm9EkgRo4Yy4qwHn/aFpQICcCdCk/ZFt0zUCFv2Hml
         A5NjAOABzqg57z7Fvm4y89RVtnfIk5Czbf1nCt8YFv9DBnVoH1K2Dzf84gf7LXq9NAVb
         NIaCHciTl9rrDKP1bwvnFThSLSoSuZWbxZnjj1oIjV0VActLfkHX4m5w/9PM/1MfyPu4
         OAoCCWa39z4O31+j3S/iFAlZom0RGoEbZ+huI+Xhf70i5YwwMo61qtTYFF8mTx1Zjeve
         QaWjsxwvbhn+M4f67YPEvIPs0aCnL+0zu67qB1sOYpI/MwZyO0hXxBS3E5WYKjc4/wBp
         6oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=mmScyDNHuhPqInIkPDi1hrnGW/8MBui8p7fDqyfKaaY=;
        b=sy23oddBBJWVPtnVTGGtHeUU6IE8l0olWa1788bJZLpNeOjkVRvI+lXqG/KHw9mmV/
         s7mLcJSJiLNkPOLvaWNqDnxmeco702OFY4mTPQS/78CbShfaYC1YhOQHfM0MEfmhv8vr
         R/1Pq443CWF0LZxyJnPfz132Bs5PNMBD6gK+x2uJDlZA2AzaTcB0vfs8P6mM5H1xKiGw
         xFXHhUOhPG4wG/c1Hv6L5PNztMVC5g6yzLYwswRn0MZ+j4wL5/Tk0/2kgOq/YzziELhC
         VsuWC+huPSWWVrLaIIOQb1GdlHz5CoK26sOjGTziDZuIz/rkyLcgmkQ1vJ98BBinFIul
         duXw==
MIME-Version: 1.0
X-Gm-Message-State: AOAM532fXouy0NVrA7Ib6STwz/Sb0proHTPod5vEkGx3W254gHq86UJx
        19z9VCntxgjfVS4cLfUxKTZIw5uILCnM3F999zWkUd2XPnZayt7GyLUOFWkgEUkRErhXeCkkHaj
        IQsQXfH9t0C6CX6YU
X-Google-Smtp-Source: ABdhPJyLBkj9FVxjq0VdTb3kf3e80XYzSmjEYlsQogtrjJnIWfnvzV3wvR0tVq1UEsWfV7DvTpCX3A==
X-Received: by 2002:a62:8858:0:b029:2fb:6bb0:aba with SMTP id l85-20020a6288580000b02902fb6bb00abamr9665379pfd.32.1629295951880;
        Wed, 18 Aug 2021 07:12:31 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:31 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 12/30] v4l: vxd-dec: Add VDEC MMU wrapper
Date:   Wed, 18 Aug 2021 19:40:19 +0530
Message-Id: <20210818141037.19990-13-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

It contains VDEC MMU APIs, used for buffer mapping, generating
virtual addresses. It will use TALMMU APIs.

Signed-off-by: Lakshmi Sankar <lakshmisankar-t@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                   |   2 +
 .../media/vxd/decoder/vdec_mmu_wrapper.c      | 829 ++++++++++++++++++
 .../media/vxd/decoder/vdec_mmu_wrapper.h      | 174 ++++
 3 files changed, 1005 insertions(+)
 create mode 100644 drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
 create mode 100644 drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b0d0708d852..6c3f7a55ce9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19565,6 +19565,8 @@ F:	drivers/staging/media/vxd/decoder/hw_control.h
 F:	drivers/staging/media/vxd/decoder/img_dec_common.h
 F:	drivers/staging/media/vxd/decoder/translation_api.c
 F:	drivers/staging/media/vxd/decoder/translation_api.h
+F:	drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
+F:	drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
 F:	drivers/staging/media/vxd/decoder/vxd_core.c
 F:	drivers/staging/media/vxd/decoder/vxd_dec.c
 F:	drivers/staging/media/vxd/decoder/vxd_dec.h
diff --git a/drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c b/drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
new file mode 100644
index 000000000000..384ce840b4dc
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
@@ -0,0 +1,829 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VDEC MMU Functions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstream
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#include "img_dec_common.h"
+#include "lst.h"
+#include "talmmu_api.h"
+#include "vdec_defs.h"
+#include "vdec_mmu_wrapper.h"
+#include "vxd_dec.h"
+
+#define GUARD_BAND  0x1000
+
+struct mmuheap {
+	unsigned char *name;
+	enum mmu_eheap_id heap_id;
+	enum talmmu_heap_type heap_type;
+	unsigned int start_offset;
+	unsigned int size;
+	unsigned char *mem_space;
+	unsigned char use_guard_band;
+	unsigned char image_buffers;
+};
+
+static const struct mmuheap mmu_heaps[MMU_HEAP_MAX] = {
+	{ "Image untiled", MMU_HEAP_IMAGE_BUFFERS_UNTILED,
+	  TALMMU_HEAP_PERCONTEXT, PVDEC_HEAP_UNTILED_START,
+	  PVDEC_HEAP_UNTILED_SIZE, "MEMBE", 1, 1 },
+
+	{ "Bitstream", MMU_HEAP_BITSTREAM_BUFFERS,
+	  TALMMU_HEAP_PERCONTEXT, PVDEC_HEAP_BITSTREAM_START,
+	  PVDEC_HEAP_BITSTREAM_SIZE, "MEMDMAC_02", 1, 0 },
+
+	{ "Stream", MMU_HEAP_STREAM_BUFFERS,
+	  TALMMU_HEAP_PERCONTEXT, PVDEC_HEAP_STREAM_START,
+	  PVDEC_HEAP_STREAM_SIZE, "MEM", 1, 0 },
+};
+
+/*
+ * @Heap ID
+ * @Heap type
+ * @Heap flags
+ * @Memory space name
+ * @Start address (virtual)
+ * @Size of heap, in bytes
+ */
+static struct talmmu_heap_info heap_info = {
+	MMU_HEAP_IMAGE_BUFFERS_UNTILED,
+	TALMMU_HEAP_PERCONTEXT,
+	TALMMU_HEAPFLAGS_NONE,
+	"MEMBE",
+	0,
+	0,
+};
+
+/*
+ * This structure contains the device context.
+ * @brief  VDECDD MMU Device Context
+ * @devmem_template_hndl: Handle for MMU template.
+ * @devmem_ctx_hndl: Handle for MMU context.
+ * @str_list: List of streams.
+ */
+struct mmu_dev_context {
+	void *devmem_template_hndl;
+	void *devmem_ctx_hndl;
+	struct lst_t str_list;
+	unsigned int ctx_id;
+	unsigned int next_ctx_id;
+};
+
+/*
+ * This structure contains the stream context.
+ * @brief  VDECDD MMU Stream Context
+ * @LST_LINK: List link (allows the structure to be part of a MeOS list).
+ * @devmem_ctx_hndl: Handle for MMU context.
+ * @dev_ctx: Pointer to device context.
+ * @ctx_id: MMU context Id.
+ * km_str_id: Stream ID used in communication with new KM interface
+ */
+struct mmu_str_context {
+	void **link;
+	void *devmem_ctx_hndl;
+	struct mmu_dev_context *dev_ctx;
+	unsigned int ctx_id;
+	void *ptd_memspace_hndl;
+	unsigned int int_reg_num;
+	unsigned int km_str_id;
+	struct vxd_dec_ctx *vxd_dec_context;
+};
+
+static unsigned int set_attributes(enum sys_emem_attrib mem_attrib)
+{
+	unsigned int attrib = 0;
+
+	if (mem_attrib & SYS_MEMATTRIB_CACHED)
+		attrib |= MEM_ATTR_CACHED;
+
+	if (mem_attrib & SYS_MEMATTRIB_UNCACHED)
+		attrib |= MEM_ATTR_UNCACHED;
+
+	if (mem_attrib & SYS_MEMATTRIB_WRITECOMBINE)
+		attrib |= MEM_ATTR_WRITECOMBINE;
+
+	if (mem_attrib & SYS_MEMATTRIB_SECURE)
+		attrib |= MEM_ATTR_SECURE;
+
+	return attrib;
+}
+
+/*
+ * @Function	mmu_dev_mem_context_create
+ */
+static int mmu_devmem_context_create(struct mmu_dev_context *dev_ctx, void **mmu_ctx_hndl)
+{
+	int result;
+	void *devmem_heap_hndl;
+	union talmmu_heap_options heap_opt1;
+	unsigned int i;
+	unsigned char use_guardband;
+	enum talmmu_heap_option_id heap_option_id;
+
+	dev_ctx->next_ctx_id++;
+
+	/* Create a context from the template */
+	result = talmmu_devmem_ctx_create(dev_ctx->devmem_template_hndl, dev_ctx->next_ctx_id,
+					  mmu_ctx_hndl);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Apply options to heaps. */
+	heap_opt1.guardband_opt.guardband = GUARD_BAND;
+
+	for (i = 0; i < MMU_HEAP_MAX; i++) {
+		result = talmmu_get_heap_handle(mmu_heaps[i].heap_id, *mmu_ctx_hndl,
+						&devmem_heap_hndl);
+		if (result != IMG_SUCCESS)
+			return result;
+
+		use_guardband = mmu_heaps[i].use_guard_band;
+		heap_option_id = TALMMU_HEAP_OPT_ADD_GUARD_BAND;
+		if (use_guardband)
+			talmmu_devmem_heap_options(devmem_heap_hndl, heap_option_id, heap_opt1);
+	}
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	mmu_device_create
+ */
+int mmu_device_create(enum mmu_etype mmu_type_arg,
+		      unsigned int ptd_alignment,
+		      void **mmudev_handle)
+{
+	int result = IMG_SUCCESS;
+	enum talmmu_mmu_type talmmu_type =
+		TALMMU_MMUTYPE_4K_PAGES_32BIT_ADDR;
+	unsigned int i;
+	struct mmu_dev_context *dev_ctx;
+	struct talmmu_devmem_info dev_mem_info;
+
+	/* Set the TAL MMU type. */
+	switch (mmu_type_arg) {
+	case MMU_TYPE_32BIT:
+		talmmu_type = TALMMU_MMUTYPE_4K_PAGES_32BIT_ADDR;
+		break;
+
+	case MMU_TYPE_36BIT:
+		talmmu_type = TALMMU_MMUTYPE_4K_PAGES_36BIT_ADDR;
+		break;
+
+	case MMU_TYPE_40BIT:
+		talmmu_type = TALMMU_MMUTYPE_4K_PAGES_40BIT_ADDR;
+		break;
+
+	default:
+		return IMG_ERROR_INVALID_PARAMETERS;
+	}
+
+	/* Allocate a device context structure */
+	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+	if (!dev_ctx)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	/* Initialise stream list. */
+	lst_init(&dev_ctx->str_list);
+
+	/* Initialise TALMMU. */
+	result = talmmu_init();
+	if (result != IMG_SUCCESS)
+		goto error_tal_init;
+
+	dev_mem_info.device_id = 0;
+	dev_mem_info.mmu_type = talmmu_type;
+	dev_mem_info.dev_flags = TALMMU_DEVFLAGS_NONE;
+	dev_mem_info.pagedir_memspace_name = "MEM";
+	dev_mem_info.pagetable_memspace_name = NULL;
+	dev_mem_info.page_size = DEV_MMU_PAGE_SIZE;
+	dev_mem_info.ptd_alignment = ptd_alignment;
+
+	result = talmmu_devmem_template_create(&dev_mem_info, &dev_ctx->devmem_template_hndl);
+	if (result != IMG_SUCCESS)
+		goto error_tal_template;
+
+	/* Add heaps to template */
+	for (i = 0; i < MMU_HEAP_MAX; i++) {
+		heap_info.heap_id = mmu_heaps[i].heap_id;
+		heap_info.heap_type = mmu_heaps[i].heap_type;
+		heap_info.memspace_name = mmu_heaps[i].name;
+		heap_info.size = mmu_heaps[i].size;
+		heap_info.basedev_virtaddr = mmu_heaps[i].start_offset;
+
+		result = talmmu_devmem_heap_add(dev_ctx->devmem_template_hndl, &heap_info);
+		if (result != IMG_SUCCESS)
+			goto error_tal_heap;
+	}
+
+	/* Create the device context. */
+	result = mmu_devmem_context_create(dev_ctx, &dev_ctx->devmem_ctx_hndl);
+	if (result != IMG_SUCCESS)
+		goto error_mmu_context;
+
+	dev_ctx->ctx_id = dev_ctx->next_ctx_id;
+
+	/* Return the device context. */
+	*mmudev_handle = dev_ctx;
+
+	return IMG_SUCCESS;
+
+	/* Roll back in case of errors. */
+error_mmu_context:
+error_tal_heap:
+	talmmu_devmem_template_destroy(dev_ctx->devmem_template_hndl);
+error_tal_template:
+	talmmu_deinit();
+error_tal_init:
+	kfree(dev_ctx);
+	return result;
+}
+
+/*
+ * @Function	mmu_device_destroy
+ */
+int mmu_device_destroy(void *mmudev_handle)
+{
+	struct mmu_dev_context *dev_ctx = mmudev_handle;
+	unsigned int result;
+	struct mmu_str_context *str_ctx;
+
+	/* Validate inputs. */
+	if (!mmudev_handle)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Destroy all streams associated with the device. */
+	str_ctx = lst_first(&dev_ctx->str_list);
+	while (str_ctx) {
+		result = mmu_stream_destroy(str_ctx);
+		if (result != IMG_SUCCESS)
+			return result;
+		/* See if there are more streams. */
+		str_ctx = lst_first(&dev_ctx->str_list);
+	}
+
+	/* Destroy the device context */
+	result = talmmu_devmem_ctx_destroy(dev_ctx->devmem_ctx_hndl);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Destroy the template. */
+	result = talmmu_devmem_template_destroy(dev_ctx->devmem_template_hndl);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	talmmu_deinit();
+
+	kfree(dev_ctx);
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	mmu_stream_create
+ * @Description
+ * This function is used to create and initialise the MMU stream context.
+ * @Input	mmudev_handle : The MMU device handle.
+ * @Input	km_str_id : Stream Id used in communication with KM driver.
+ * @Output	mmu_str_hndl : A pointer used to return the MMU stream
+ *		handle.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_stream_create(void *mmudev_handle,
+		      unsigned int km_str_id,
+		      void *vxd_dec_ctx_arg,
+		      void **mmu_str_hndl)
+{
+	struct mmu_dev_context *dev_ctx = mmudev_handle;
+	struct mmu_str_context *str_ctx;
+	int res;
+
+	/* Validate inputs. */
+	if (!mmudev_handle)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Allocate a stream context structure */
+	str_ctx = kzalloc(sizeof(*str_ctx), GFP_KERNEL);
+	if (!str_ctx)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	str_ctx->km_str_id = km_str_id;
+	str_ctx->dev_ctx = dev_ctx;
+	str_ctx->int_reg_num = 32;
+	str_ctx->vxd_dec_context = (struct vxd_dec_ctx *)vxd_dec_ctx_arg;
+
+	/* Create a stream context. */
+	res = mmu_devmem_context_create(dev_ctx, &str_ctx->devmem_ctx_hndl);
+	if (res != IMG_SUCCESS) {
+		kfree(str_ctx);
+		return res;
+	}
+
+	str_ctx->ctx_id = dev_ctx->next_ctx_id;
+
+	/* Add stream to list. */
+	lst_add(&dev_ctx->str_list, str_ctx);
+
+	*mmu_str_hndl = str_ctx;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	mmu_stream_destroy
+ * @Description
+ * This function is used to create and initialise the MMU stream context.
+ * NOTE: Destroy automatically frees and memory allocated using
+ *	mmu_stream_malloc().
+ * @Input	mmu_str_hndl : The MMU stream handle.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_stream_destroy(void *mmu_str_hndl)
+{
+	struct mmu_str_context *str_ctx = mmu_str_hndl;
+	int res;
+
+	/* Validate inputs. */
+	if (!mmu_str_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* remove stream to list. */
+	lst_remove(&str_ctx->dev_ctx->str_list, str_ctx);
+
+	/* Destroy the device context */
+	res = talmmu_devmem_ctx_destroy(str_ctx->devmem_ctx_hndl);
+	if (res != IMG_SUCCESS)
+		return res;
+
+	kfree(str_ctx);
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	mmu_malloc
+ */
+static int mmu_alloc(void *devmem_ctx_hndl,
+		     struct vxd_dec_ctx *vxd_dec_ctx_arg,
+		     enum mmu_eheap_id heap_id,
+		     unsigned int mem_heap_id,
+		     enum sys_emem_attrib mem_attrib,
+		     unsigned int size,
+		     unsigned int alignment,
+		     struct vidio_ddbufinfo *ddbuf_info)
+{
+	int result;
+	void *devmem_heap_hndl;
+	struct vxd_free_data free_data;
+	struct vxd_dec_ctx *ctx;
+	struct vxd_dev *vxd;
+	struct vxd_alloc_data alloc_data;
+	unsigned int flags;
+
+	if (!devmem_ctx_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Set buffer size. */
+	ddbuf_info->buf_size = size;
+
+	/* Round size up to next multiple of physical pages */
+	if ((size % HOST_MMU_PAGE_SIZE) != 0)
+		size = ((size / HOST_MMU_PAGE_SIZE) + 1) * HOST_MMU_PAGE_SIZE;
+
+	/* Allocate memory */
+	ctx = vxd_dec_ctx_arg;
+	vxd = ctx->dev;
+
+	alloc_data.heap_id = mem_heap_id;
+	alloc_data.size = ddbuf_info->buf_size;
+
+	alloc_data.attributes = set_attributes(mem_attrib);
+
+	result = img_mem_alloc(vxd->dev, ctx->mem_ctx, alloc_data.heap_id, alloc_data.size,
+			       (enum mem_attr)alloc_data.attributes,
+			       (int *)&ddbuf_info->buff_id);
+	if (result != IMG_SUCCESS)
+		goto error_alloc;
+
+	ddbuf_info->is_internal = 1;
+
+	if (mem_attrib & SYS_MEMATTRIB_SECURE) {
+		ddbuf_info->cpu_virt = NULL;
+	} else {
+		/* Map the buffer to CPU */
+		result = img_mem_map_km(ctx->mem_ctx, ddbuf_info->buff_id);
+		if (result) {
+			dev_err(vxd->dev, "%s: failed to map buf to cpu!(%d)\n", __func__, result);
+			goto error_get_heap_handle;
+		}
+		ddbuf_info->cpu_virt = img_mem_get_kptr(ctx->mem_ctx, ddbuf_info->buff_id);
+	}
+
+	/* Get heap handle */
+	result = talmmu_get_heap_handle(heap_id, devmem_ctx_hndl, &devmem_heap_hndl);
+	if (result != IMG_SUCCESS)
+		goto error_get_heap_handle;
+
+	/* Allocate device "virtual" memory. */
+	result = talmmu_devmem_addr_alloc(devmem_ctx_hndl, devmem_heap_hndl, size, alignment,
+					  &ddbuf_info->hndl_memory);
+	if (result != IMG_SUCCESS)
+		goto error_mem_map_ext_mem;
+
+	/* Get the device virtual address. */
+	result = talmmu_get_dev_virt_addr(ddbuf_info->hndl_memory, &ddbuf_info->dev_virt);
+	if (result != IMG_SUCCESS)
+		goto error_get_dev_virt_addr;
+
+	flags = VXD_MAP_FLAG_NONE;
+
+	if (mem_attrib & SYS_MEMATTRIB_CORE_READ_ONLY)
+		flags |= VXD_MAP_FLAG_READ_ONLY;
+
+	if (mem_attrib & SYS_MEMATTRIB_CORE_WRITE_ONLY)
+		flags |= VXD_MAP_FLAG_WRITE_ONLY;
+
+	result = vxd_map_buffer(vxd, ctx, ddbuf_info->kmstr_id, ddbuf_info->buff_id,
+				ddbuf_info->dev_virt,
+				flags);
+
+	if (result != IMG_SUCCESS)
+		goto error_map_dev;
+
+	return IMG_SUCCESS;
+
+error_map_dev:
+error_get_dev_virt_addr:
+	talmmu_devmem_addr_free(ddbuf_info->hndl_memory);
+	ddbuf_info->hndl_memory = NULL;
+error_mem_map_ext_mem:
+error_get_heap_handle:
+	free_data.buf_id = ddbuf_info->buff_id;
+	img_mem_free(ctx->mem_ctx, free_data.buf_id);
+error_alloc:
+	return result;
+}
+
+/*
+ * @Function	mmu_stream_malloc
+ */
+int mmu_stream_alloc(void *mmu_str_hndl,
+		     enum mmu_eheap_id heap_id,
+		     unsigned int mem_heap_id,
+		     enum sys_emem_attrib mem_attrib,
+		     unsigned int size,
+		     unsigned int alignment,
+		     struct vidio_ddbufinfo *ddbuf_info)
+{
+	struct mmu_str_context *str_ctx =
+		(struct mmu_str_context *)mmu_str_hndl;
+	int result;
+
+	/* Validate inputs. */
+	if (!mmu_str_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Check if device level heap. */
+	switch (heap_id) {
+	case MMU_HEAP_IMAGE_BUFFERS_UNTILED:
+	case MMU_HEAP_BITSTREAM_BUFFERS:
+	case MMU_HEAP_STREAM_BUFFERS:
+		break;
+
+	default:
+		return IMG_ERROR_INVALID_PARAMETERS;
+	}
+
+	ddbuf_info->kmstr_id = str_ctx->km_str_id;
+
+	/* Allocate device memory. */
+	result = mmu_alloc(str_ctx->devmem_ctx_hndl, str_ctx->vxd_dec_context, heap_id, mem_heap_id,
+			   mem_attrib, size, alignment, ddbuf_info);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	mmu_stream_map_ext_sg
+ */
+int mmu_stream_map_ext_sg(void *mmu_str_hndl,
+			  enum mmu_eheap_id heap_id,
+			  void *sgt,
+			  unsigned int size,
+			  unsigned int alignment,
+			  enum sys_emem_attrib mem_attrib,
+			  void *cpu_linear_addr,
+			  struct vidio_ddbufinfo *ddbuf_info,
+			  unsigned int *buff_id)
+{
+	struct mmu_str_context *str_ctx =
+		(struct mmu_str_context *)mmu_str_hndl;
+	int result;
+	void *devmem_heap_hndl;
+	unsigned int flags;
+
+	struct vxd_dec_ctx *ctx = str_ctx->vxd_dec_context;
+	struct vxd_dev *vxd = ctx->dev;
+
+	/* Validate inputs. */
+	if (!mmu_str_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Check if device level heap. */
+	switch (heap_id) {
+	case MMU_HEAP_IMAGE_BUFFERS_UNTILED:
+	case MMU_HEAP_BITSTREAM_BUFFERS:
+	case MMU_HEAP_STREAM_BUFFERS:
+		break;
+
+	default:
+		return IMG_ERROR_INVALID_PARAMETERS;
+	}
+
+	if (!str_ctx->devmem_ctx_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Set buffer size. */
+	ddbuf_info->buf_size = size;
+
+	/* Round size up to next multiple of physical pages */
+	if ((size % HOST_MMU_PAGE_SIZE) != 0)
+		size = ((size / HOST_MMU_PAGE_SIZE) + 1) * HOST_MMU_PAGE_SIZE;
+
+	result = img_mem_import(vxd->dev, ctx->mem_ctx, ddbuf_info->buf_size,
+				(enum mem_attr)set_attributes(mem_attrib),
+				(int *)buff_id);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	if (mem_attrib & SYS_MEMATTRIB_SECURE)
+		ddbuf_info->cpu_virt = NULL;
+
+	ddbuf_info->buff_id = *buff_id;
+	ddbuf_info->is_internal = 0;
+
+	ddbuf_info->kmstr_id = str_ctx->km_str_id;
+
+	/* Set buffer size. */
+	ddbuf_info->buf_size = size;
+
+	/* Ensure the address of the buffer is at least page aligned. */
+	ddbuf_info->cpu_virt = cpu_linear_addr;
+
+	/* Get heap handle */
+	result = talmmu_get_heap_handle(heap_id, str_ctx->devmem_ctx_hndl, &devmem_heap_hndl);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Allocate device "virtual" memory. */
+	result = talmmu_devmem_addr_alloc(str_ctx->devmem_ctx_hndl, devmem_heap_hndl, size,
+					  alignment,
+					  &ddbuf_info->hndl_memory);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Get the device virtual address. */
+	result = talmmu_get_dev_virt_addr(ddbuf_info->hndl_memory, &ddbuf_info->dev_virt);
+	if (result != IMG_SUCCESS)
+		goto error_get_dev_virt_addr;
+
+	/* Map memory to the device */
+	flags = VXD_MAP_FLAG_NONE;
+
+	if (mem_attrib & SYS_MEMATTRIB_CORE_READ_ONLY)
+		flags |= VXD_MAP_FLAG_READ_ONLY;
+
+	if (mem_attrib & SYS_MEMATTRIB_CORE_WRITE_ONLY)
+		flags |= VXD_MAP_FLAG_WRITE_ONLY;
+
+	result = vxd_map_buffer_sg(vxd, ctx, ddbuf_info->kmstr_id, ddbuf_info->buff_id, sgt,
+				   ddbuf_info->dev_virt,
+				   flags);
+
+	if (result != IMG_SUCCESS)
+		goto error_map_dev;
+
+	return IMG_SUCCESS;
+
+error_map_dev:
+error_get_dev_virt_addr:
+	talmmu_devmem_addr_free(ddbuf_info->hndl_memory);
+	ddbuf_info->hndl_memory = NULL;
+	return result;
+}
+
+/*
+ * @Function	mmu_stream_map_ext
+ */
+int mmu_stream_map_ext(void *mmu_str_hndl,
+		       enum mmu_eheap_id heap_id,
+		       unsigned int buff_id,
+		       unsigned int size,
+		       unsigned int alignment,
+		       enum sys_emem_attrib mem_attrib,
+		       void *cpu_linear_addr,
+		       struct vidio_ddbufinfo *ddbuf_info)
+{
+	struct mmu_str_context *str_ctx =
+		(struct mmu_str_context *)mmu_str_hndl;
+	int result;
+	void *devmem_heap_hndl;
+	struct vxd_dec_ctx *ctx;
+	struct vxd_dev *vxd;
+	unsigned int flags;
+
+	/* Validate inputs. */
+	if (!mmu_str_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Check if device level heap. */
+	switch (heap_id) {
+	case MMU_HEAP_IMAGE_BUFFERS_UNTILED:
+	case MMU_HEAP_BITSTREAM_BUFFERS:
+	case MMU_HEAP_STREAM_BUFFERS:
+		break;
+
+	default:
+		return IMG_ERROR_INVALID_PARAMETERS;
+	}
+
+	/* Round size up to next multiple of physical pages */
+	if ((size % HOST_MMU_PAGE_SIZE) != 0)
+		size = ((size / HOST_MMU_PAGE_SIZE) + 1) * HOST_MMU_PAGE_SIZE;
+
+	ddbuf_info->buff_id = buff_id;
+	ddbuf_info->is_internal = 0;
+
+	ddbuf_info->kmstr_id = str_ctx->km_str_id;
+
+	/* Set buffer size. */
+	ddbuf_info->buf_size = size;
+
+	/* Ensure the address of the buffer is at least page aligned. */
+	ddbuf_info->cpu_virt = cpu_linear_addr;
+
+	/* Get heap handle */
+	result = talmmu_get_heap_handle(heap_id, str_ctx->devmem_ctx_hndl, &devmem_heap_hndl);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Allocate device "virtual" memory. */
+	result = talmmu_devmem_addr_alloc(str_ctx->devmem_ctx_hndl, devmem_heap_hndl, size,
+					  alignment,
+					  &ddbuf_info->hndl_memory);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Get the device virtual address. */
+	result = talmmu_get_dev_virt_addr(ddbuf_info->hndl_memory, &ddbuf_info->dev_virt);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/*
+	 * Map device memory (allocated from outside VDEC)
+	 * into the stream PTD.
+	 */
+	ctx = str_ctx->vxd_dec_context;
+	vxd = ctx->dev;
+
+	flags = VXD_MAP_FLAG_NONE;
+
+	if (mem_attrib & SYS_MEMATTRIB_CORE_READ_ONLY)
+		flags |= VXD_MAP_FLAG_READ_ONLY;
+
+	if (mem_attrib & SYS_MEMATTRIB_CORE_WRITE_ONLY)
+		flags |= VXD_MAP_FLAG_WRITE_ONLY;
+
+	result = vxd_map_buffer(vxd, ctx, ddbuf_info->kmstr_id, ddbuf_info->buff_id,
+				ddbuf_info->dev_virt,
+				flags);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	mmu_free_mem
+ */
+int mmu_free_mem(void *mmustr_hndl, struct vidio_ddbufinfo *ddbuf_info)
+{
+	int tmp_result;
+	int result = IMG_SUCCESS;
+	struct vxd_dec_ctx *ctx;
+	struct vxd_dev *vxd;
+
+	struct mmu_str_context *str_ctx =
+		(struct mmu_str_context *)mmustr_hndl;
+
+	/* Validate inputs. */
+	if (!ddbuf_info)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (!str_ctx)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Unmap the memory mapped to the device */
+	ctx = str_ctx->vxd_dec_context;
+	vxd = ctx->dev;
+
+	tmp_result = vxd_unmap_buffer(vxd, ctx, ddbuf_info->kmstr_id, ddbuf_info->buff_id);
+	if (tmp_result != IMG_SUCCESS)
+		result = tmp_result;
+
+	/*
+	 * Unmapping the memory mapped to the device - done
+	 * Free the memory.
+	 */
+	tmp_result = talmmu_devmem_addr_free(ddbuf_info->hndl_memory);
+	if (tmp_result != IMG_SUCCESS)
+		result = tmp_result;
+
+	if (ddbuf_info->is_internal) {
+		struct vxd_free_data free_data = { ddbuf_info->buff_id };
+
+		img_mem_free(ctx->mem_ctx, free_data.buf_id);
+	}
+
+	return result;
+}
+
+/*
+ * @Function	mmu_free_mem
+ */
+int mmu_free_mem_sg(void *mmustr_hndl, struct vidio_ddbufinfo *ddbuf_info)
+{
+	int tmp_result;
+	int result = IMG_SUCCESS;
+	struct vxd_dec_ctx *ctx;
+	struct vxd_dev *vxd;
+	struct vxd_free_data free_data;
+
+	struct mmu_str_context *str_ctx =
+		(struct mmu_str_context *)mmustr_hndl;
+
+	/* Validate inputs. */
+	if (!ddbuf_info)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (!str_ctx)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	free_data.buf_id = ddbuf_info->buff_id;
+	/* Unmap the memory mapped to the device */
+	ctx = str_ctx->vxd_dec_context;
+	vxd = ctx->dev;
+
+	tmp_result = vxd_unmap_buffer(vxd, ctx, ddbuf_info->kmstr_id, ddbuf_info->buff_id);
+	if (tmp_result != IMG_SUCCESS)
+		result = tmp_result;
+
+	/*
+	 * Unmapping the memory mapped to the device - done
+	 * Free the memory.
+	 */
+	tmp_result = talmmu_devmem_addr_free(ddbuf_info->hndl_memory);
+	if (tmp_result != IMG_SUCCESS)
+		result = tmp_result;
+
+	/*
+	 * for external mem manager buffers, just cleanup the idr list and
+	 * buffer objects
+	 */
+	img_mem_free_bufid(ctx->mem_ctx, free_data.buf_id);
+
+	return result;
+}
+
+/*
+ * @Function                MMU_GetHeap
+ */
+int mmu_get_heap(unsigned int image_stride, enum mmu_eheap_id *heap_id)
+{
+	unsigned int i;
+	unsigned char found = FALSE;
+
+	for (i = 0; i < MMU_HEAP_MAX; i++) {
+		if (mmu_heaps[i].image_buffers) {
+			*heap_id = mmu_heaps[i].heap_id;
+			found = TRUE;
+			break;
+		}
+	}
+
+	VDEC_ASSERT(found);
+	if (!found)
+		return IMG_ERROR_COULD_NOT_OBTAIN_RESOURCE;
+
+	return IMG_SUCCESS;
+}
diff --git a/drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h b/drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
new file mode 100644
index 000000000000..50bed98240a6
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VDEC MMU Functions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstream
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "img_errors.h"
+#include "img_mem.h"
+#include "lst.h"
+#include "mmu_defs.h"
+#include "vid_buf.h"
+
+#ifndef _VXD_MMU_H_
+#define _VXD_MMU_H_
+
+/* Page size of the device MMU */
+#define DEV_MMU_PAGE_SIZE (0x1000)
+/* Page alignment of the device MMU */
+#define DEV_MMU_PAGE_ALIGNMENT  (0x1000)
+
+#define HOST_MMU_PAGE_SIZE	PAGE_SIZE
+
+/*
+ * @Function	mmu_stream_get_ptd_handle
+ * @Description
+ * This function is used to obtain the stream PTD (Page Table Directory)handle
+ * @Input	mmu_str_handle : MMU stream handle.
+ * @Output	str_ptd : Pointer to stream PTD handle.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_stream_get_ptd_handle(void *mmu_str_handle, void **str_ptd);
+
+/*
+ * @Function	mmu_device_create
+ * @Description
+ * This function is used to create and initialise the MMU device context.
+ * @Input	mmu_type : MMU type.
+ * @Input	ptd_alignment : Alignment of Page Table directory.
+ * @Output	mmudev_hndl : A pointer used to return the
+ *		MMU device handle.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_device_create(enum mmu_etype mmu_type,
+		      unsigned int ptd_alignment,
+		      void **mmudev_hndl);
+
+/*
+ * @Function	mmu_device_destroy
+ * @Description
+ * This function is used to create and initialise the MMU device context.
+ * NOTE: Destroy device automatically destroys any streams and frees and
+ * memory allocated using MMU_StreamMalloc().
+ * @Input	mmudev_hndl : The MMU device handle.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_device_destroy(void *mmudev_hndl);
+
+/*
+ * @Function	mmu_stream_create
+ * @Description
+ * This function is used to create and initialise the MMU stream context.
+ * @Input	mmudev_hndl : The MMU device handle.
+ * @Input	km_str_id : Stream Id used in communication with KM driver.
+ * @Output	mmustr_hndl : A pointer used to return the MMU stream handle.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_stream_create(void *mmudev_hndl, unsigned int km_str_id, void *vxd_dec_ctx,
+		      void **mmustr_hndl);
+
+/**
+ * mmu_stream_destroy - This function is used to create and initialise the MMU stream context.
+ * @mmustr_hndl : The MMU stream handle.
+ * Return	IMG_SUCCESS or an error code.
+ *
+ * NOTE: Destroy automatically frees and memory allocated using
+ *	mmu_stream_malloc().
+ */
+int mmu_stream_destroy(void *mmustr_hndl);
+
+/*
+ * @Function	mmu_stream_alloc
+ * @Description
+ * This function is used to allocate stream memory.
+ * @Input	mmustr_hndl : The MMU stream handle.
+ * @Input	heap_id : The MMU heap Id.
+ * @Input	mem_heap_id : Memory heap id
+ * @Input	mem_attrib : Memory attributes
+ * @Input	size : The size, in bytes, to be allocated.
+ * @Input	alignment : The required byte alignment
+ *		(1, 2, 4, 8, 16 etc).
+ * @Output	ddbuf_info : A pointer to a #vidio_ddbufinfo structure
+ *		used to return the buffer info.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int  mmu_stream_alloc(void *mmustr_hndl,
+		      enum mmu_eheap_id heap_id,
+		      unsigned int mem_heap_id,
+		      enum sys_emem_attrib mem_attrib,
+		      unsigned int size,
+		      unsigned int alignment,
+		      struct vidio_ddbufinfo *ddbuf_info);
+
+/*
+ * @Function	mmu_stream_map_ext
+ * @Description
+ * This function is used to malloc device memory (virtual memory), but mapping
+ * this to memory that has already been allocated (externally).
+ * NOTE: Memory can be freed using MMU_Free().  However, this does not
+ *	free the memory provided by the caller via pvCpuLinearAddr.
+ * @Input	mmustr_hndl    : The MMU stream handle.
+ * @Input	heap_id : The heap Id.
+ * @Input	buff_id : The buffer Id.
+ * @Input	size : The size, in bytes, to be allocated.
+ * @Input	alignment : The required byte alignment (1, 2, 4, 8, 16 etc).
+ * @Input	mem_attrib : Memory attributes
+ * @Input	cpu_linear_addr : CPU linear address of the memory
+ *		to be allocated for the device.
+ * @Output	ddbuf_info : A pointer to a #vidio_ddbufinfo structure
+ *		used to return the buffer info.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_stream_map_ext(void *mmustr_hndl,
+		       enum mmu_eheap_id heap_id,
+		       unsigned int buff_id,
+		       unsigned int size,
+		       unsigned int alignment,
+		       enum sys_emem_attrib mem_attrib,
+		       void *cpu_linear_addr,
+		       struct vidio_ddbufinfo *ddbuf_info);
+
+int mmu_stream_map_ext_sg(void *mmustr_hndl,
+			  enum mmu_eheap_id heap_id,
+			  void *sgt,
+			  unsigned int size,
+			  unsigned int alignment,
+			  enum sys_emem_attrib mem_attrib,
+			  void *cpu_linear_addr,
+			  struct vidio_ddbufinfo *ddbuf_info,
+			  unsigned int *buff_id);
+
+/*
+ * @Function	mmu_free_mem
+ * @Description
+ * This function is used to free device memory.
+ * @Input	ps_dd_buf_info : A pointer to a #vidio_ddbufinfo structure.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_free_mem(void *mmustr_hndl, struct vidio_ddbufinfo *ddbuf_info);
+
+/*
+ * @Function	mmu_free_mem
+ * @Description
+ * This function is used to free device memory.
+ * @Input	ps_dd_buf_info : A pointer to a #vidio_ddbufinfo structure.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int mmu_free_mem_sg(void *mmustr_hndl, struct vidio_ddbufinfo *ddbuf_info);
+
+int mmu_get_heap(unsigned int image_stride, enum mmu_eheap_id *heap_id);
+
+#endif /* _VXD_MMU_H_ */
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
