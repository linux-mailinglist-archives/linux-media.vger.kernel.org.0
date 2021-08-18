Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EEB3F05FA
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239216AbhHRONT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239310AbhHRONG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:13:06 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56316C0617A8
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:30 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e7so2362311pgk.2
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XHV87XAAsVIjAQvTwVz0+xSjzNyvvg67bwT4OOQ14/w=;
        b=pLZlQXeBEhIKhx+L6EtJKOeVGeRr8GkFzAx2PLPmBdYntsQe5qEGeHyBl4hFKhPsQZ
         jko9x4BBCpZsQZm6NCJcgxICYsh+Zs6oUDOXZL2g6T0Ue6bfww5MPwYJd3mEOIWovNbg
         7qns0YvHAjYP6V6JlEvMvahwYp7QXlw36o5KBOEwQS5ZQnTjmizuBhhNoBiSGxrar6kG
         7MDhzN6Pbbwh0e3H+aGQ4hXRADGeH2Chn5Q7tBHB3y+eG4DYgd7mufAZmndRelwKyIBk
         zevylmpLrXRZY0t7FTyfe3LJQhouGr6kdWUgLuFDaG7PYLL7Xf2Scu9J99wzDFqqTV1q
         sLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XHV87XAAsVIjAQvTwVz0+xSjzNyvvg67bwT4OOQ14/w=;
        b=bO2djQM/WCZg32BTJwKpHUYYeYrFtpKKoeH+GNdS3uRyLFULxQSdal21PyOSYakp40
         HH3Z06/kittcnFAcZ3ApRIzkyQPDUHYM6s7JfEpkuSiPWjIbK5yhSfbU6xUtB+QqWJVQ
         zvAl51bcLbVa0cK+5KjNhHV6sgU8flC/ONKlbBmemsQLssSuKx9rEGBGPQL1hpCYifL1
         3Th7VakKeswv6zbd2+78eV9AdTTwdfCfeVLCJI30EPNoyorT9zvh86eNv/W9xV1pRGqk
         Zj59PSQGXIJ579ZcM8UAQvzxOtmHbETo17YMQBF/svYC+byaM9jhIC9E3dPgAylx/2Of
         B0jg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM533XSC05108eTpKwm3SzqP1A8o6fhN6LkoafVF/AhmGySy38VBDp
        BAVhPtKnH/dQGZmVcB9lkvs/C7aVpXI2Sjh9VPLjjE0yYXZfFDl+8cgdW9LWp3kxDN1ozUbAHH/
        aGRtN6cS/8xj/5GSI
X-Google-Smtp-Source: ABdhPJyKWkae4XMWkzOqMgv4tBHgl58BmL+V8dgLWcAo7J/+JkjLnmb+Dpwf6CO/hT/f3Cjd2atvkg==
X-Received: by 2002:a65:448a:: with SMTP id l10mr9059769pgq.313.1629295948818;
        Wed, 18 Aug 2021 07:12:28 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:28 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 11/30] v4l: vxd-dec: Add TALMMU module
Date:   Wed, 18 Aug 2021 19:40:18 +0530
Message-Id: <20210818141037.19990-12-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

It contains the implementation of Address allocation management
APIs, list processing primitives, generic resource allocations,
self scaling has tables and object pool memory allocator which
are needed for TALMMU functionality

Signed-off-by: Lakshmi Sankar <lakshmisankar-t@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                   |  10 +
 drivers/staging/media/vxd/common/addr_alloc.c | 499 +++++++++
 drivers/staging/media/vxd/common/addr_alloc.h | 238 +++++
 drivers/staging/media/vxd/common/hash.c       | 481 +++++++++
 drivers/staging/media/vxd/common/hash.h       |  86 ++
 drivers/staging/media/vxd/common/pool.c       | 228 ++++
 drivers/staging/media/vxd/common/pool.h       |  66 ++
 drivers/staging/media/vxd/common/ra.c         | 972 ++++++++++++++++++
 drivers/staging/media/vxd/common/ra.h         | 200 ++++
 drivers/staging/media/vxd/common/talmmu_api.c | 753 ++++++++++++++
 drivers/staging/media/vxd/common/talmmu_api.h | 246 +++++
 11 files changed, 3779 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/addr_alloc.c
 create mode 100644 drivers/staging/media/vxd/common/addr_alloc.h
 create mode 100644 drivers/staging/media/vxd/common/hash.c
 create mode 100644 drivers/staging/media/vxd/common/hash.h
 create mode 100644 drivers/staging/media/vxd/common/pool.c
 create mode 100644 drivers/staging/media/vxd/common/pool.h
 create mode 100644 drivers/staging/media/vxd/common/ra.c
 create mode 100644 drivers/staging/media/vxd/common/ra.h
 create mode 100644 drivers/staging/media/vxd/common/talmmu_api.c
 create mode 100644 drivers/staging/media/vxd/common/talmmu_api.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2668eeb89a34..2b0d0708d852 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19537,8 +19537,12 @@ M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
+F:	drivers/staging/media/vxd/common/addr_alloc.c
+F:	drivers/staging/media/vxd/common/addr_alloc.h
 F:	drivers/staging/media/vxd/common/dq.c
 F:	drivers/staging/media/vxd/common/dq.h
+F:	drivers/staging/media/vxd/common/hash.c
+F:	drivers/staging/media/vxd/common/hash.h
 F:	drivers/staging/media/vxd/common/idgen_api.c
 F:	drivers/staging/media/vxd/common/idgen_api.h
 F:	drivers/staging/media/vxd/common/img_mem_man.c
@@ -19548,6 +19552,12 @@ F:	drivers/staging/media/vxd/common/imgmmu.c
 F:	drivers/staging/media/vxd/common/imgmmu.h
 F:	drivers/staging/media/vxd/common/lst.c
 F:	drivers/staging/media/vxd/common/lst.h
+F:	drivers/staging/media/vxd/common/pool.c
+F:	drivers/staging/media/vxd/common/pool.h
+F:	drivers/staging/media/vxd/common/ra.c
+F:	drivers/staging/media/vxd/common/ra.h
+F:	drivers/staging/media/vxd/common/talmmu_api.c
+F:	drivers/staging/media/vxd/common/talmmu_api.h
 F:	drivers/staging/media/vxd/common/work_queue.c
 F:	drivers/staging/media/vxd/common/work_queue.h
 F:	drivers/staging/media/vxd/decoder/hw_control.c
diff --git a/drivers/staging/media/vxd/common/addr_alloc.c b/drivers/staging/media/vxd/common/addr_alloc.c
new file mode 100644
index 000000000000..393d309b2c0c
--- /dev/null
+++ b/drivers/staging/media/vxd/common/addr_alloc.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Address allocation APIs - used to manage address allocation
+ * with a number of predefined regions.
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
+#include <linux/slab.h>
+#include <linux/printk.h>
+#include <linux/mutex.h>
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "addr_alloc.h"
+#include "hash.h"
+#include "img_errors.h"
+
+/* Global context. */
+static struct addr_context global_ctx = {0};
+/* Sub-system initialized. */
+static int global_initialized;
+/* Count of contexts. */
+static unsigned int num_ctx;
+/* Global mutex */
+static struct mutex *global_lock;
+
+/**
+ * addr_initialise - addr_initialise
+ */
+
+int addr_initialise(void)
+{
+	unsigned int result = IMG_ERROR_ALREADY_INITIALISED;
+
+	/* If we are not initialized */
+	if (!global_initialized)
+		result = addr_cx_initialise(&global_ctx);
+	return result;
+}
+
+int addr_cx_initialise(struct addr_context * const context)
+{
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!context)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (!global_initialized) {
+		/* Initialise context */
+		memset(context, 0x00, sizeof(struct addr_context));
+
+		/* If no mutex associated with this resource */
+		if (!global_lock) {
+			/* Create one */
+
+			global_lock = kzalloc(sizeof(*global_lock), GFP_KERNEL);
+			if (!global_lock)
+				return -ENOMEM;
+
+			mutex_init(global_lock);
+		}
+
+		mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+		/* Initialise the hash functions. */
+		result = vid_hash_initialise();
+		if (result != IMG_SUCCESS) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+
+		/* Initialise the arena functions */
+		result = vid_ra_initialise();
+		if (result != IMG_SUCCESS) {
+			mutex_unlock(global_lock);
+			result = vid_hash_finalise();
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+
+		/* We are now initialized */
+		global_initialized = TRUE;
+		result = IMG_SUCCESS;
+	} else {
+		mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+	}
+
+	num_ctx++;
+	mutex_unlock(global_lock);
+
+	return result;
+}
+
+int addr_deinitialise(void)
+{
+	return addr_cx_deinitialise(&global_ctx);
+}
+
+int addr_cx_deinitialise(struct addr_context * const context)
+{
+	struct addr_region *tmp_region = NULL;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!context)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (global_initialized) {
+		mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+		tmp_region = context->regions;
+
+		/* Delete all arena structure */
+		if (context->default_region)
+			result = vid_ra_delete(context->default_region->arena);
+
+		while (tmp_region) {
+			result = vid_ra_delete(tmp_region->arena);
+			tmp_region = tmp_region->nxt_region;
+		}
+
+		if (num_ctx != 0)
+			num_ctx--;
+
+		result = IMG_SUCCESS;
+		if (num_ctx == 0) {
+			/* Free off resources */
+			result = vid_hash_finalise();
+			result = vid_ra_deinit();
+			global_initialized = FALSE;
+
+			mutex_unlock(global_lock);
+			mutex_destroy(global_lock);
+			kfree(global_lock);
+			global_lock = NULL;
+		} else {
+			mutex_unlock(global_lock);
+		}
+	}
+
+	return result;
+}
+
+int addr_define_mem_region(struct addr_region * const region)
+{
+	return addr_cx_define_mem_region(&global_ctx, region);
+}
+
+int addr_cx_define_mem_region(struct addr_context * const context,
+			      struct addr_region * const region)
+{
+	struct addr_region *tmp_region = NULL;
+	unsigned int result = IMG_SUCCESS;
+
+	if (!context || !region)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+	tmp_region = context->regions;
+
+	/* Ensure the link to the next is NULL */
+	region->nxt_region = NULL;
+
+	/* If this is the default memory region */
+	if (!region->name) {
+		/* Should not previously have been defined */
+		if (context->default_region) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+
+		context->default_region = region;
+		context->no_regions++;
+
+		/*
+		 * Create an arena for memory allocation
+		 * name of resource arena for debug
+		 * start of resource
+		 * size of resource
+		 * allocation quantum
+		 * import allocator
+		 * import deallocator
+		 * import handle
+		 */
+		result = vid_ra_create("memory",
+				       region->base_addr,
+				       region->size,
+				       1,
+				       NULL,
+				       NULL,
+				       NULL,
+				       &region->arena);
+
+		if (result != IMG_SUCCESS) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+	} else {
+		/*
+		 * Run down the list of existing named regions
+		 * to check if there is a region with this name
+		 */
+		while (tmp_region &&
+		       (strcmp(region->name, tmp_region->name) != 0) &&
+		       tmp_region->nxt_region) {
+			tmp_region = tmp_region->nxt_region;
+		}
+
+		/* If we have items in the list */
+		if (tmp_region) {
+			/*
+			 * Check we didn't stop because the name
+			 * clashes with one already defined.
+			 */
+
+			if (strcmp(region->name, tmp_region->name) == 0 ||
+			    tmp_region->nxt_region) {
+				mutex_unlock(global_lock);
+				return IMG_ERROR_UNEXPECTED_STATE;
+			}
+
+			/* Add to end of list */
+			tmp_region->nxt_region = region;
+		} else {
+			/* Add to head of list */
+			context->regions = region;
+		}
+
+		context->no_regions++;
+
+		/*
+		 * Create an arena for memory allocation
+		 * name of resource arena for debug
+		 * start of resource
+		 * size of resource
+		 * allocation quantum
+		 * import allocator
+		 * import deallocator
+		 * import handle
+		 */
+		result = vid_ra_create(region->name,
+				       region->base_addr,
+				       region->size,
+				       1,
+				       NULL,
+				       NULL,
+				       NULL,
+				       &region->arena);
+
+		if (result != IMG_SUCCESS) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+	}
+
+	mutex_unlock(global_lock);
+
+	/* Check the arean was created OK */
+	if (!region->arena)
+		return IMG_ERROR_UNEXPECTED_STATE;
+
+	return result;
+}
+
+int addr_malloc(const unsigned char * const name,
+		unsigned long long size,
+		unsigned long long * const base_adr)
+{
+	return addr_cx_malloc(&global_ctx, name, size, base_adr);
+}
+
+int addr_cx_malloc(struct addr_context * const context,
+		   const unsigned char * const name,
+		   unsigned long long size,
+		   unsigned long long * const base_adr)
+{
+	unsigned int result = IMG_ERROR_FATAL;
+	struct addr_region *tmp_region = NULL;
+
+	if (!context || !base_adr || !name)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	*(base_adr) = (unsigned long long)-1LL;
+
+	mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+	tmp_region = context->regions;
+
+	/*
+	 * Run down the list of existing named
+	 * regions to locate this
+	 */
+	while (tmp_region && (strcmp(name, tmp_region->name) != 0) && (tmp_region->nxt_region))
+		tmp_region = tmp_region->nxt_region;
+
+	/* If there was no match. */
+	if (!tmp_region || (strcmp(name, tmp_region->name) != 0)) {
+		/* Use the default */
+		if (!context->default_region) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+
+		tmp_region = context->default_region;
+	}
+
+	if (!tmp_region) {
+		mutex_unlock(global_lock);
+		return IMG_ERROR_UNEXPECTED_STATE;
+	}
+
+	/* Allocate size + guard band */
+	result = vid_ra_alloc(tmp_region->arena,
+			      size + tmp_region->guard_band,
+			      NULL,
+			      NULL,
+			      SEQUENTIAL_ALLOCATION,
+			      1,
+			      base_adr);
+	if (result != IMG_SUCCESS) {
+		mutex_unlock(global_lock);
+		return IMG_ERROR_OUT_OF_MEMORY;
+	}
+
+	mutex_unlock(global_lock);
+
+	return result;
+}
+
+int addr_cx_malloc_res(struct addr_context * const context,
+		       const unsigned char * const name,
+		       unsigned long long size,
+		       unsigned long long * const base_adr)
+{
+	unsigned int result = IMG_ERROR_FATAL;
+	struct addr_region *tmp_region = NULL;
+
+	if (!context || !base_adr || !name)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+	tmp_region = context->regions;
+	/* If the allocation is for the default region */
+	/*
+	 * Run down the list of existing named
+	 * regions to locate this
+	 */
+	while (tmp_region && (strcmp(name, tmp_region->name) != 0) && (tmp_region->nxt_region))
+		tmp_region = tmp_region->nxt_region;
+
+	/* If there was no match. */
+	if (!tmp_region || (strcmp(name, tmp_region->name) != 0)) {
+		/* Use the default */
+		if (!context->default_region) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+		tmp_region = context->default_region;
+	}
+	if (!tmp_region) {
+		mutex_unlock(global_lock);
+		return IMG_ERROR_UNEXPECTED_STATE;
+	}
+	/* Allocate size + guard band */
+	result = vid_ra_alloc(tmp_region->arena, size + tmp_region->guard_band,
+			      NULL, NULL, SEQUENTIAL_ALLOCATION, 1, base_adr);
+	if (result != IMG_SUCCESS) {
+		mutex_unlock(global_lock);
+		return IMG_ERROR_OUT_OF_MEMORY;
+	}
+	mutex_unlock(global_lock);
+
+	return result;
+}
+
+int addr_cx_malloc_align_res(struct addr_context * const context,
+			     const unsigned char * const name,
+			     unsigned long long size,
+			     unsigned long long alignment,
+			     unsigned long long * const base_adr)
+{
+	unsigned int result;
+	struct addr_region *tmp_region = NULL;
+
+	if (!context || !base_adr || !name)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+	tmp_region = context->regions;
+
+	/*
+	 * Run down the list of existing named
+	 * regions to locate this
+	 */
+	while (tmp_region &&
+	       (strcmp(name, tmp_region->name) != 0) &&
+	       (tmp_region->nxt_region)) {
+		tmp_region = tmp_region->nxt_region;
+	}
+	/* If there was no match. */
+	if (!tmp_region ||
+	    (strcmp(name, tmp_region->name) != 0)) {
+		/* Use the default */
+		if (!context->default_region) {
+			mutex_unlock(global_lock);
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+
+		tmp_region = context->default_region;
+	}
+
+	if (!tmp_region) {
+		mutex_unlock(global_lock);
+		return IMG_ERROR_UNEXPECTED_STATE;
+	}
+	/* Allocate size + guard band */
+	result = vid_ra_alloc(tmp_region->arena,
+			      size + tmp_region->guard_band,
+			      NULL,
+			      NULL,
+			      SEQUENTIAL_ALLOCATION,
+			      alignment,
+			      base_adr);
+	if (result != IMG_SUCCESS) {
+		mutex_unlock(global_lock);
+		return IMG_ERROR_OUT_OF_MEMORY;
+	}
+
+	mutex_unlock(global_lock);
+
+	return result;
+}
+
+int addr_free(const unsigned char * const name, unsigned long long addr)
+{
+	return addr_cx_free(&global_ctx, name, addr);
+}
+
+int addr_cx_free(struct addr_context * const context,
+		 const unsigned char * const name,
+		 unsigned long long addr)
+{
+	struct addr_region *tmp_region;
+	unsigned int result;
+
+	if (!context)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	tmp_region = context->regions;
+
+	mutex_lock_nested(global_lock, SUBCLASS_ADDR_ALLOC);
+
+	/* If the allocation is for the default region */
+	if (!name) {
+		if (!context->default_region) {
+			result = IMG_ERROR_INVALID_PARAMETERS;
+			goto error;
+		}
+		tmp_region = context->default_region;
+	} else {
+		/*
+		 * Run down the list of existing named
+		 * regions to locate this
+		 */
+		while (tmp_region &&
+		       (strcmp(name, tmp_region->name) != 0) &&
+		       tmp_region->nxt_region) {
+			tmp_region = tmp_region->nxt_region;
+		}
+
+		/* If there was no match */
+		if (!tmp_region || (strcmp(name, tmp_region->name) != 0)) {
+			/* Use the default */
+			if (!context->default_region) {
+				result = IMG_ERROR_INVALID_PARAMETERS;
+				goto error;
+			}
+			tmp_region = context->default_region;
+		}
+	}
+
+	/* Free the address */
+	result = vid_ra_free(tmp_region->arena, addr);
+
+error:
+	mutex_unlock(global_lock);
+	return result;
+}
diff --git a/drivers/staging/media/vxd/common/addr_alloc.h b/drivers/staging/media/vxd/common/addr_alloc.h
new file mode 100644
index 000000000000..387418b124e4
--- /dev/null
+++ b/drivers/staging/media/vxd/common/addr_alloc.h
@@ -0,0 +1,238 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Address allocation management API.
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
+#ifndef __ADDR_ALLOC_H__
+#define __ADDR_ALLOC_H__
+
+#include <linux/types.h>
+#include "ra.h"
+
+/* Defines whether sequential or random allocation is used */
+enum {
+	SEQUENTIAL_ALLOCATION,
+	RANDOM_ALLOCATION,
+	RANDOM_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/**
+ * struct addr_region - Memory region structure
+ *@name: A pointer to a sring containing the name of the region.
+ *		NULL for the default memory region.
+ *@base_addr: The base address of the memory region.
+ *@size: The size of the memory region.
+ *@guard_band: The size of any guard band to be used.
+ *		Guard bands can be useful in separating block allocations
+ *		and allows the caller to detect erroneous accesses
+ *		into these areas.
+ *@nxt_region:Used internally by the ADDR API.A pointer used to point
+ *		to the next memory region.
+ *@arena: Used internally by the ADDR API. A to a structure used to
+ *		maintain and perform address allocation.
+ *
+ * This structure contains information about the memory region.
+ */
+struct addr_region {
+	unsigned char *name;
+	unsigned long long base_addr;
+	unsigned long long size;
+	unsigned int guard_band;
+	struct addr_region *nxt_region;
+	void *arena;
+};
+
+/*
+ * This structure contains the context for allocation.
+ *@regions: Pointer the first region in the list.
+ *@default_region: Pointer the default region.
+ *@no_regions: Number of regions currently available (including default)
+ */
+struct addr_context {
+	struct addr_region *regions;
+	struct addr_region *default_region;
+	unsigned int no_regions;
+};
+
+/*
+ * @Function	ADDR_Initialise
+ * @Description
+ * This function is used to initialise the address alocation sub-system.
+ * NOTE: This function may be called multiple times. The initialisation only
+ * happens the first time it is called.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_initialise(void);
+
+/*
+ * @Function	addr_deinitialise
+ * @Description
+ * This function is used to de-initialise the address alocation sub-system.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_deinitialise(void);
+
+/*
+ * @Function	addr_define_mem_region
+ * @Description
+ * This function is used define a memory region.
+ * NOTE: The region structure MUST be defined in static memory as this
+ * is retained and used by the ADDR sub-system.
+ * NOTE: Invalid parameters are trapped by asserts.
+ * @Input	region: A pointer to a region structure.
+ * @Return	IMG_RESULT  : IMG_SUCCESS or an error code.
+ */
+int addr_define_mem_region(struct addr_region * const region);
+
+/*
+ * @Function	addr_malloc
+ * @Description
+ * This function is used allocate space within a memory region.
+ * NOTE: Allocation failures or invalid parameters are trapped by asserts.
+ * @Input	name: Is a pointer the name of the memory region.
+ *		NULL can be used to allocate space from the
+ *		default memory region.
+ * @Input	size: The size (in bytes) of the allocation.
+ * @Output	base_adr : The address of the allocated space.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_malloc(const unsigned char *const name,
+		unsigned long long size,
+		unsigned long long *const base_adr);
+
+/*
+ * @Function	addr_free
+ * @Description
+ * This function is used free a previously allocate space within
+ * a memory region.
+ * NOTE: Invalid parameters are trapped by asserts.
+ * @Input	name: Is a pointer to the name of the memory region.
+ *		NULL is used to free space from the default memory region.
+ *@Input	addr: The address allocated.
+ *@Return	IMG_SUCCESS or an error code.
+ */
+int addr_free(const unsigned char * const name, unsigned long long addr);
+
+/*
+ * @Function	addr_cx_initialise
+ * @Description
+ * This function is used to initialise the address allocation sub-system with
+ * an external context structure.
+ * NOTE: This function should be call only once for the context.
+ * @Input	context : Pointer to context structure.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_initialise(struct addr_context * const context);
+
+/*
+ * @Function	addr_cx_deinitialise
+ * @Description
+ * This function is used to de-initialise the address allocation
+ * sub-system with an external context structure.
+ * @Input	context : Pointer to context structure.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_deinitialise(struct addr_context * const context);
+
+/*
+ * @Function	addr_cx_define_mem_region
+ * @Description
+ * This function is used define a memory region with an external
+ * context structure.
+ * NOTE: The region structure MUST be defined in static memory as this
+ * is retained and used by the ADDR sub-system.
+ * NOTE: Invalid parameters are trapped by asserts.
+ * @Input	context : Pointer to context structure.
+ * @Input	region : A pointer to a region structure.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_define_mem_region(struct addr_context *const context,
+			      struct addr_region *const region);
+
+/*
+ * @Function	addr_cx_malloc
+ * @Description
+ * This function is used allocate space within a memory region with
+ * an external context structure.
+ * NOTE: Allocation failures or invalid parameters are trapped by asserts.
+ * @Input	context : Pointer to context structure.
+ * @Input	name : Is a pointer the name of the memory region.
+ *		NULL can be used to allocate space from the
+ *		default memory region.
+ * @Input	size : The size (in bytes) of the allocation.
+ * @Output	base_adr : The address of the allocated space.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_malloc(struct addr_context * const context,
+		   const unsigned char *const name,
+		   unsigned long long size,
+		   unsigned long long *const base_adr);
+
+/*
+ * @Function	addr_cx_malloc_res
+ * @Description
+ * This function is used allocate space within a memory region with
+ * an external context structure.
+ * NOTE: Allocation failures are returned in IMG_RESULT, however invalid
+ * parameters are trapped by asserts.
+ * @Input	context : Pointer to context structure.
+ * @Input	name : Is a pointer the name of the memory region.
+ *		NULL can be used to allocate space from the
+ *		default memory region.
+ * @Input	size : The size (in bytes) of the allocation.
+ * @Input	base_adr : Pointer to the address of the allocated space.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_malloc_res(struct addr_context *const context,
+		       const unsigned char *const name,
+		       unsigned long long size,
+		       unsigned long long * const base_adr);
+
+/*
+ * @Function	addr_cx_malloc1_res
+ * @Description
+ * This function is used allocate space within a memory region with
+ * an external context structure.
+ * NOTE: Allocation failures are returned in IMG_RESULT, however invalid
+ * parameters are trapped by asserts.
+ * @Input	context : Pointer to context structure.
+ * @Input	name : Is a pointer the name of the memory region.
+ *		NULL can be used to allocate space from the
+ *		default memory region.
+ * @Input	size	: The size (in bytes) of the allocation.
+ * @Input	alignment : The required byte alignment (1, 2, 4, 8, 16 etc).
+ * @Input	base_adr : Pointer to the address of the allocated space.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_malloc_align_res(struct addr_context *const context,
+			     const unsigned char *const name,
+			     unsigned long long size,
+			     unsigned long long alignment,
+			     unsigned long long *const base_adr);
+
+/*
+ * @Function	addr_cx_free
+ * @Description
+ * This function is used free a previously allocate space within a memory region
+ * with an external context structure.
+ * NOTE: Invalid parameters are trapped by asserts.
+ * @Input	context : Pointer to context structure.
+ * @Input	name : Is a pointer the name of the memory region.
+ *		NULL is used to free space from the
+ *		default memory region.
+ * @Input	addr : The address allocated.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int addr_cx_free(struct addr_context *const context,
+		 const unsigned char *const name,
+		 unsigned long long addr);
+
+#endif /* __ADDR_ALLOC_H__	*/
diff --git a/drivers/staging/media/vxd/common/hash.c b/drivers/staging/media/vxd/common/hash.c
new file mode 100644
index 000000000000..1a03aecc34ef
--- /dev/null
+++ b/drivers/staging/media/vxd/common/hash.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Self scaling hash tables.
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
+#include "hash.h"
+#include "img_errors.h"
+#include "pool.h"
+
+/* pool of struct hash objects */
+static struct pool *global_hashpool;
+
+/* pool of struct bucket objects */
+static struct pool *global_bucketpool;
+
+static int global_initialized;
+
+/* Each entry in a hash table is placed into a bucket */
+struct bucket {
+	struct bucket *next;
+	unsigned long long key;
+	unsigned long long value;
+};
+
+struct hash {
+	struct bucket **table;
+	unsigned int size;
+	unsigned int count;
+	unsigned int minimum_size;
+};
+
+/**
+ * hash_func - Hash function intended for hashing addresses.
+ * @vale : The key to hash.
+ * @size : The size of the hash table
+ */
+static unsigned int hash_func(unsigned long long vale,
+			      unsigned int size)
+{
+	unsigned int hash = (unsigned int)(vale);
+
+	hash += (hash << 12);
+	hash ^= (hash >> 22);
+	hash += (hash << 4);
+	hash ^= (hash >> 9);
+	hash += (hash << 10);
+	hash ^= (hash >> 2);
+	hash += (hash << 7);
+	hash ^= (hash >> 12);
+	hash &= (size - 1);
+	return hash;
+}
+
+/*
+ * @Function	hash_chain_insert
+ * @Description
+ * Hash function intended for hashing addresses.
+ * @Input	bucket : The bucket
+ * @Input	table : The hash table
+ * @Input	size : The size of the hash table
+ * @Return	IMG_SUCCESS or an error code.
+ */
+static int hash_chain_insert(struct bucket *bucket,
+			     struct bucket **table,
+			     unsigned int size)
+{
+	unsigned int idx;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!bucket || !table || !size) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	idx = hash_func(bucket->key, size);
+
+	if (idx < size) {
+		result = IMG_SUCCESS;
+		bucket->next = table[idx];
+		table[idx] = bucket;
+	}
+
+	return result;
+}
+
+/*
+ * @Function	hash_rehash
+ * @Description
+ * Iterate over every entry in an old hash table and rehash into the new table.
+ * @Input	old_table : The old hash table
+ * @Input	old_size : The size of the old hash table
+ * @Input	new_table : The new hash table
+ * @Input	new_sz : The size of the new hash table
+ * @Return	IMG_SUCCESS or an error code.
+ */
+static int hash_rehash(struct bucket **old_table,
+		       unsigned int old_size,
+		       struct bucket **new_table,
+		       unsigned int new_sz)
+{
+	unsigned int idx;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!old_table || !new_table) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	for (idx = 0; idx < old_size; idx++) {
+		struct bucket *bucket;
+		struct bucket *nex_bucket;
+
+		bucket = old_table[idx];
+		while (bucket) {
+			nex_bucket = bucket->next;
+			result = hash_chain_insert(bucket, new_table, new_sz);
+			if (result != IMG_SUCCESS) {
+				result = IMG_ERROR_UNEXPECTED_STATE;
+				return result;
+			}
+			bucket = nex_bucket;
+		}
+	}
+	result = IMG_SUCCESS;
+
+	return result;
+}
+
+/*
+ * @Function	hash_resize
+ * @Description
+ * Attempt to resize a hash table, failure to allocate a new larger hash table
+ * is not considered a hard failure. We simply continue and allow the table to
+ * fill up, the effect is to allow hash chains to become longer.
+ * @Input	hash_arg : Pointer to the hash table
+ * @Input	new_sz : The size of the new hash table
+ * @Return	IMG_SUCCESS or an error code.
+ */
+static int hash_resize(struct hash *hash_arg,
+		       unsigned int new_sz)
+{
+	unsigned int malloc_sz = 0;
+	unsigned int result = IMG_ERROR_FATAL;
+	unsigned int idx;
+
+	if (!hash_arg) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	if (new_sz != hash_arg->size) {
+		struct bucket **new_bkt_table;
+
+		malloc_sz = (sizeof(struct bucket *) * new_sz);
+		new_bkt_table = kmalloc(malloc_sz, GFP_KERNEL);
+
+		if (!new_bkt_table) {
+			result = IMG_ERROR_MALLOC_FAILED;
+			return result;
+		}
+
+		for (idx = 0; idx < new_sz; idx++)
+			new_bkt_table[idx] = NULL;
+
+		result = hash_rehash(hash_arg->table,
+				     hash_arg->size,
+				     new_bkt_table,
+				     new_sz);
+
+		if (result != IMG_SUCCESS) {
+			kfree(new_bkt_table);
+			new_bkt_table = NULL;
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+
+		kfree(hash_arg->table);
+		hash_arg->table = new_bkt_table;
+		hash_arg->size = new_sz;
+	}
+	result = IMG_SUCCESS;
+
+	return result;
+}
+
+static unsigned int private_max(unsigned int a, unsigned int b)
+{
+	unsigned int ret = (a > b) ? a : b;
+	return ret;
+}
+
+/*
+ * @Function	vid_hash_initialise
+ * @Description
+ * To initialise the hash module.
+ * @Input	None
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_initialise(void)
+{
+	unsigned int result = IMG_ERROR_ALREADY_COMPLETE;
+
+	if (!global_initialized) {
+		if (global_hashpool || global_bucketpool) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+
+		result = pool_create("img-hash",
+				     sizeof(struct hash),
+				     &global_hashpool);
+
+		if (result != IMG_SUCCESS) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+
+		result = pool_create("img-sBucket",
+				     sizeof(struct bucket),
+				     &global_bucketpool);
+		if (result != IMG_SUCCESS) {
+			if (global_bucketpool) {
+				result = pool_delete(global_bucketpool);
+				global_bucketpool = NULL;
+			}
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+		global_initialized = true;
+		result = IMG_SUCCESS;
+	}
+	return result;
+}
+
+/*
+ * @Function	vid_hash_finalise
+ * @Description
+ * To finalise the hash module. All allocated hash tables should
+ * be deleted before calling this function.
+ * @Input	None
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_finalise(void)
+{
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (global_initialized) {
+		if (global_hashpool) {
+			result = pool_delete(global_hashpool);
+			if (result != IMG_SUCCESS)
+				return result;
+
+			global_hashpool = NULL;
+		}
+
+		if (global_bucketpool) {
+			result = pool_delete(global_bucketpool);
+			if (result != IMG_SUCCESS)
+				return result;
+
+			global_bucketpool = NULL;
+		}
+		global_initialized = false;
+		result = IMG_SUCCESS;
+	}
+
+	return result;
+}
+
+/*
+ * @Function	vid_hash_create
+ * @Description
+ * Create a self scaling hash table.
+ * @Input	initial_size : Initial and minimum size of the hash table.
+ * @Output	hash_arg : Will countin the hash table handle or NULL.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_create(unsigned int initial_size,
+		    struct hash ** const hash_arg)
+{
+	unsigned int idx;
+	unsigned int tbl_sz = 0;
+	unsigned int result = IMG_ERROR_FATAL;
+	struct hash *local_hash = NULL;
+
+	if (!hash_arg) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	if (global_initialized) {
+		pool_alloc(global_hashpool, ((void **)&local_hash));
+		if (!local_hash) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			*hash_arg = NULL;
+			return result;
+		}
+
+		local_hash->count = 0;
+		local_hash->size = initial_size;
+		local_hash->minimum_size = initial_size;
+
+		tbl_sz = (sizeof(struct bucket *) * local_hash->size);
+		local_hash->table = kmalloc(tbl_sz, GFP_KERNEL);
+		if (!local_hash->table) {
+			result = pool_free(global_hashpool, local_hash);
+			if (result != IMG_SUCCESS)
+				result = IMG_ERROR_UNEXPECTED_STATE;
+			result |= IMG_ERROR_MALLOC_FAILED;
+			*hash_arg = NULL;
+			return result;
+		}
+
+		for (idx = 0; idx < local_hash->size; idx++)
+			local_hash->table[idx] = NULL;
+
+		*hash_arg = local_hash;
+		result = IMG_SUCCESS;
+	}
+	return result;
+}
+
+/*
+ * @Function	vid_hash_delete
+ * @Description
+ * To delete a hash table, all entries in the table should be
+ * removed before calling this function.
+ * @Input	hash_arg : Hash table pointer
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_delete(struct hash * const hash_arg)
+{
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!hash_arg) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	if (global_initialized) {
+		if (hash_arg->count != 0) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+
+		kfree(hash_arg->table);
+		hash_arg->table = NULL;
+
+		result = pool_free(global_hashpool, hash_arg);
+		if (result != IMG_SUCCESS) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+	}
+	return result;
+}
+
+/*
+ * @Function	vid_hash_insert
+ * @Description
+ * To insert a key value pair into a hash table.
+ * @Input	hash_arg : Hash table pointer
+ * @Input	key : Key value
+ * @Input	value : The value associated with the key.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_insert(struct hash * const hash_arg,
+		    unsigned long long key,
+		    unsigned long long value)
+{
+	struct bucket *ps_bucket = NULL;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!hash_arg) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	if (global_initialized) {
+		result = pool_alloc(global_bucketpool, ((void **)&ps_bucket));
+		if (result != IMG_SUCCESS || !ps_bucket) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+		ps_bucket->next = NULL;
+		ps_bucket->key = key;
+		ps_bucket->value = value;
+
+		result = hash_chain_insert(ps_bucket,
+					   hash_arg->table,
+					   hash_arg->size);
+
+		if (result != IMG_SUCCESS) {
+			pool_free(global_bucketpool, ((void **)&ps_bucket));
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			return result;
+		}
+
+		hash_arg->count++;
+
+		/* check if we need to think about re-balancing */
+		if ((hash_arg->count << 1) > hash_arg->size) {
+			result = hash_resize(hash_arg, (hash_arg->size << 1));
+			if (result != IMG_SUCCESS) {
+				result = IMG_ERROR_UNEXPECTED_STATE;
+				return result;
+			}
+		}
+		result = IMG_SUCCESS;
+	}
+	return result;
+}
+
+/*
+ * @Function	vid_hash_remove
+ * @Description
+ * To remove a key value pair from a hash table
+ * @Input	hash_arg : Hash table pointer
+ * @Input	key : Key value
+ * @Input	ret_result : 0 if the key is missing or the value
+ *		associated with the key.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_remove(struct hash * const hash_arg,
+		    unsigned long long key,
+		    unsigned long * const ret_result)
+{
+	unsigned int idx;
+	unsigned int tmp1 = 0;
+	unsigned int tmp2 = 0;
+	unsigned int result = IMG_ERROR_FATAL;
+	struct bucket **bucket = NULL;
+
+	if (!hash_arg) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	idx = hash_func(key, hash_arg->size);
+
+	for (bucket = &hash_arg->table[idx]; (*bucket) != NULL;
+		bucket = &((*bucket)->next)) {
+		if ((*bucket)->key == key) {
+			struct bucket *ps_bucket = (*bucket);
+
+			unsigned long long value = ps_bucket->value;
+
+			*bucket = ps_bucket->next;
+			result = pool_free(global_bucketpool, ps_bucket);
+
+			hash_arg->count--;
+
+			/* check if we need to think about re-balencing */
+			if (hash_arg->size > (hash_arg->count << 2) &&
+			    hash_arg->size > hash_arg->minimum_size) {
+				tmp1 = (hash_arg->size >> 1);
+				tmp2 = hash_arg->minimum_size;
+				result = hash_resize(hash_arg,
+						     private_max(tmp1, tmp2));
+			}
+			*ret_result = value;
+			result = IMG_SUCCESS;
+			break;
+		}
+	}
+	return result;
+}
diff --git a/drivers/staging/media/vxd/common/hash.h b/drivers/staging/media/vxd/common/hash.h
new file mode 100644
index 000000000000..91034d1ba441
--- /dev/null
+++ b/drivers/staging/media/vxd/common/hash.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Self scaling hash tables.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstream
+ *      Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+#ifndef _HASH_H_
+#define _HASH_H_
+
+#include <linux/types.h>
+struct hash;
+
+/**
+ * vid_hash_initialise - VID_HASH_Initialise
+ * @Input	 None
+ *
+ * To initialise the hash module.
+ */
+int vid_hash_initialise(void);
+
+/*
+ * @Function	VID_HASH_Finalise
+ * @Description
+ * To finalise the hash module. All allocated hash tables should
+ * be deleted before calling this function.
+ * @Input	None
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_finalise(void);
+
+/*
+ * @Function	VID_HASH_Create
+ * @Description
+ * Create a self scaling hash table.
+ * @Input	initial_size : Initial and minimum size of the hash table.
+ * @Output	hash : Hash table handle or NULL.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_create(unsigned int initial_size,
+		    struct hash ** const hash_hndl);
+
+/*
+ * @Function	VID_HASH_Delete
+ * @Description
+ * To delete a hash table, all entries in the table should be
+ * removed before calling this function.
+ * @Input	hash : Hash table pointer
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_delete(struct hash * const ps_hash);
+
+/*
+ * @Function	VID_HASH_Insert
+ * @Description
+ * To insert a key value pair into a hash table.
+ * @Input	ps_hash : Hash table pointer
+ * @Input	key : Key value
+ * @Input	value : The value associated with the key.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_insert(struct hash * const ps_hash,
+		    unsigned long long key,
+		    unsigned long long value);
+
+/*
+ * @Function	VID_HASH_Remove
+ * @Description
+ * To remove a key value pair from a hash table
+ * @Input	ps_hash : Hash table pointer
+ * @Input	key : Key value
+ * @Input	result : 0 if the key is missing or the value
+ *		associated with the key.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int vid_hash_remove(struct hash * const ps_hash,
+		    unsigned long long key,
+		    unsigned long * const result);
+
+#endif /* _HASH_H_ */
diff --git a/drivers/staging/media/vxd/common/pool.c b/drivers/staging/media/vxd/common/pool.c
new file mode 100644
index 000000000000..c0cb1e465c50
--- /dev/null
+++ b/drivers/staging/media/vxd/common/pool.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Object Pool Memory Allocator
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
+#include "pool.h"
+
+#define BUFF_MAX_SIZE 4096
+#define BUFF_MAX_GROW 32
+
+/* 64 bits */
+#define ALIGN_SIZE (sizeof(long long) - 1)
+
+struct pool {
+	unsigned char *name;
+	unsigned int size;
+	unsigned int grow;
+	struct buffer *buffers;
+	struct object *objects;
+};
+
+struct buffer {
+	struct buffer *next;
+};
+
+struct object {
+	struct object *next;
+};
+
+static inline unsigned char *strdup_cust(const unsigned char *str)
+{
+	unsigned char *r = kmalloc(strlen(str) + 1, GFP_KERNEL);
+
+	if (r)
+		strcpy(r, str);
+	return r;
+}
+
+/*
+ * pool_create - Create an sObject pool
+ * @name: Name of sObject pool for diagnostic purposes
+ * @obj_size: size of each sObject in the pool in bytes
+ * @pool_hdnl: Will contain NULL or sObject pool handle
+ *
+ * This function Create an sObject pool
+ */
+
+int pool_create(const unsigned char * const name,
+		unsigned int obj_size,
+		struct pool ** const pool_hdnl)
+{
+	struct pool *local_pool = NULL;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!name || !pool_hdnl) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	local_pool = kmalloc((sizeof(*local_pool)), GFP_KERNEL);
+	if (!local_pool) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	local_pool->name = strdup_cust((unsigned char *)name);
+	local_pool->size = obj_size;
+	local_pool->buffers = NULL;
+	local_pool->objects = NULL;
+	local_pool->grow =
+		(BUFF_MAX_SIZE - sizeof(struct buffer)) /
+		(obj_size + ALIGN_SIZE);
+
+	if (local_pool->grow == 0)
+		local_pool->grow = 1;
+	else if (local_pool->grow > BUFF_MAX_GROW)
+		local_pool->grow = BUFF_MAX_GROW;
+
+	*pool_hdnl = local_pool;
+	result = IMG_SUCCESS;
+
+	return result;
+}
+
+/*
+ * @Function	pool_delete
+ * @Description
+ * Delete an sObject pool. All psObjects allocated from the pool must
+ * be free'd with pool_free() before deleting the sObject pool.
+ * @Input	pool : Object Pool pointer
+ * @Return IMG_SUCCESS or an error code.
+ */
+int pool_delete(struct pool * const pool_arg)
+{
+	struct buffer *local_buf = NULL;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!pool_arg) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	local_buf = pool_arg->buffers;
+	while (local_buf) {
+		local_buf = local_buf->next;
+		kfree(pool_arg->buffers);
+		pool_arg->buffers = local_buf;
+	}
+
+	kfree(pool_arg->name);
+	pool_arg->name = NULL;
+
+	kfree(pool_arg);
+	result = IMG_SUCCESS;
+
+	return result;
+}
+
+/*
+ * @Function	pool_alloc
+ * @Description
+ * Allocate an sObject from an sObject pool.
+ * @Input	pool_arg : Object Pool
+ * @Output	obj_hndl : Pointer containing the handle to the
+ * object created or IMG_NULL
+ * @Return    IMG_SUCCESS or an error code.
+ */
+int pool_alloc(struct pool * const pool_arg,
+	       void ** const obj_hndl)
+{
+	struct object *local_obj1 = NULL;
+	struct buffer *local_buf = NULL;
+	unsigned int idx = 0;
+	unsigned int sz = 0;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!pool_arg || !obj_hndl) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	if (!pool_arg->objects) {
+		sz = (pool_arg->size + ALIGN_SIZE);
+		sz *= (pool_arg->grow + sizeof(struct buffer));
+		local_buf = kmalloc(sz, GFP_KERNEL);
+		if (!local_buf) {
+			result = IMG_ERROR_MALLOC_FAILED;
+			return result;
+		}
+
+		local_buf->next = pool_arg->buffers;
+		pool_arg->buffers = local_buf;
+
+		for (idx = 0; idx < pool_arg->grow; idx++) {
+			struct object *local_obj2;
+			unsigned char *temp_ptr = NULL;
+
+			local_obj2 = (struct object *)(((unsigned char *)(local_buf + 1))
+				+ (idx * (pool_arg->size + ALIGN_SIZE)));
+
+			temp_ptr = (unsigned char *)local_obj2;
+			if ((unsigned long)temp_ptr & ALIGN_SIZE) {
+				temp_ptr += ((ALIGN_SIZE + 1)
+					- ((unsigned long)temp_ptr & ALIGN_SIZE));
+				local_obj2 = (struct object *)temp_ptr;
+			}
+
+			local_obj2->next = pool_arg->objects;
+			pool_arg->objects = local_obj2;
+		}
+	}
+
+	if (!pool_arg->objects) {
+		result = IMG_ERROR_UNEXPECTED_STATE;
+		return result;
+	}
+
+	local_obj1 = pool_arg->objects;
+	pool_arg->objects = local_obj1->next;
+
+	*obj_hndl = (void *)(local_obj1);
+	result = IMG_SUCCESS;
+
+	return result;
+}
+
+/*
+ * @Function	pool_free
+ * @Description
+ * Free an sObject previously allocated from an sObject pool.
+ * @Input	pool_arg : Object Pool pointer.
+ * @Output	h_object : Handle to the object to be freed.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int pool_free(struct pool * const pool_arg,
+	      void * const obj_hndl)
+{
+	struct object *object = NULL;
+	unsigned int result = IMG_ERROR_FATAL;
+
+	if (!pool_arg || !obj_hndl) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		return result;
+	}
+
+	object = (struct object *)obj_hndl;
+	object->next = pool_arg->objects;
+	pool_arg->objects = object;
+
+	result = IMG_SUCCESS;
+
+	return result;
+}
diff --git a/drivers/staging/media/vxd/common/pool.h b/drivers/staging/media/vxd/common/pool.h
new file mode 100644
index 000000000000..d22d15a2af54
--- /dev/null
+++ b/drivers/staging/media/vxd/common/pool.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Object Pool Memory Allocator header
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
+#ifndef _pool_h_
+#define _pool_h_
+
+#include <linux/types.h>
+
+struct pool;
+
+/**
+ * pool_create - Create an sObject pool
+ * @name: Name of sObject pool for diagnostic purposes
+ * @obj_size: size of each sObject in the pool in bytes
+ * @pool: Will contain NULL or sObject pool handle
+ *
+ * Return	IMG_SUCCESS or an error code.
+ */
+int pool_create(const unsigned char * const name,
+		unsigned int obj_size,
+		struct pool ** const pool);
+
+/*
+ * @Function	pool_delete
+ * @Description
+ * Delete an sObject pool. All psObjects allocated from the pool must
+ * be free'd with pool_free() before deleting the sObject pool.
+ * @Input	pool : Object Pool pointer
+ * @Return IMG_SUCCESS or an error code.
+ */
+int pool_delete(struct pool * const pool);
+
+/*
+ * @Function	pool_alloc
+ * @Description
+ * Allocate an Object from an Object pool.
+ * @Input	pool : Object Pool
+ * @Output	obj_hdnl : Pointer containing the handle to the
+ * object created or IMG_NULL
+ * @Return    IMG_SUCCESS or an error code.
+ */
+int pool_alloc(struct pool * const pool,
+	       void ** const obj_hdnl);
+
+/*
+ * @Function	pool_free
+ * @Description
+ * Free an sObject previously allocated from an sObject pool.
+ * @Input	pool : Object Pool pointer.
+ * @Output	obj_hdnl : Handle to the object to be freed.
+ * @Return	IMG_SUCCESS or an error code.
+ */
+int pool_free(struct pool * const pool,
+	      void * const obj_hdnl);
+
+#endif /* _pool_h_ */
diff --git a/drivers/staging/media/vxd/common/ra.c b/drivers/staging/media/vxd/common/ra.c
new file mode 100644
index 000000000000..ac07737f351b
--- /dev/null
+++ b/drivers/staging/media/vxd/common/ra.c
@@ -0,0 +1,972 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Implements generic resource allocation.
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
+#include "hash.h"
+#include "img_errors.h"
+#include "pool.h"
+#include "ra.h"
+
+static unsigned char	global_init;
+
+/* pool of struct arena's */
+static struct pool *global_pool_arena;
+
+/* pool of struct boundary tag */
+static struct pool *global_pool_bt;
+
+/**
+ * ra_request_alloc_fail - ra_request_alloc_fail
+ * @import_hdnl : Callback handle.
+ * @requested_size : Requested allocation size.
+ * @ref : Pointer to user reference data.
+ * @alloc_flags : Allocation flags.
+ * @actual_size : Pointer to contain the actual allocated size.
+ * @base_addr : Allocation base(always 0,it is failing).
+ *
+ * Default callback allocator used if no callback is specified, always fails
+ * to allocate further resources to the arena.
+ */
+static int ra_request_alloc_fail(void *import_hdnl,
+				 unsigned long long requested_size,
+				 unsigned long long *actual_size,
+				 void **ref,
+				 unsigned int alloc_flags,
+				 unsigned long long *base_addr)
+{
+	if (base_addr)
+		*base_addr = 0;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	ra_log2
+ * @Description
+ * Calculates the Log2(n) with n being a 64-bit value.
+ *
+ * @Input	value : Input value.
+ * @Output	None
+ * @Return	result : Log2(ui64Value).
+ */
+
+static unsigned int ra_log2(unsigned long long value)
+{
+	int res = 0;
+
+	value >>= 1;
+	while (value > 0) {
+		value >>= 1;
+		res++;
+	}
+	return res;
+}
+
+/*
+ * @Function	ra_segment_list_insert_after
+ * @Description	Insert a boundary tag into an arena segment list after a
+ *		specified boundary tag.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_here_arg : The boundary tag before which psBTToInsert
+ *		will be added .
+ * @Input	bt_to_insert_arg : The boundary tag to insert.
+ * @Output	None
+ * @Return	None
+ */
+static void ra_segment_list_insert_after(struct arena *arena_arg,
+					 struct btag *bt_here_arg,
+					 struct btag *bt_to_insert_arg)
+{
+	bt_to_insert_arg->nxt_seg = bt_here_arg->nxt_seg;
+	bt_to_insert_arg->prv_seg = bt_here_arg;
+
+	if (!bt_here_arg->nxt_seg)
+		arena_arg->tail_seg = bt_to_insert_arg;
+	else
+		bt_here_arg->nxt_seg->prv_seg = bt_to_insert_arg;
+
+	bt_here_arg->nxt_seg = bt_to_insert_arg;
+}
+
+/*
+ * @Function	ra_segment_list_insert
+ * @Description
+ * Insert a boundary tag into an arena segment list at the appropriate point.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_to_insert_arg : The boundary tag to insert.
+ * @Output	None
+ * @Return	None
+ */
+static void ra_segment_list_insert(struct arena *arena_arg,
+				   struct btag *bt_to_insert_arg)
+{
+	/* insert into the segment chain */
+	if (!arena_arg->head_seg) {
+		arena_arg->head_seg = bt_to_insert_arg;
+		arena_arg->tail_seg = bt_to_insert_arg;
+		bt_to_insert_arg->nxt_seg = NULL;
+		bt_to_insert_arg->prv_seg = NULL;
+	} else {
+		struct btag *bt_scan = arena_arg->head_seg;
+
+		while (bt_scan->nxt_seg &&
+		       bt_to_insert_arg->base >=
+		       bt_scan->nxt_seg->base) {
+			bt_scan = bt_scan->nxt_seg;
+		}
+		ra_segment_list_insert_after(arena_arg,
+					     bt_scan,
+					     bt_to_insert_arg);
+	}
+}
+
+/*
+ * @Function	ra_SegmentListRemove
+ * @Description
+ * Insert a boundary tag into an arena segment list at the appropriate point.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_to_remove_arg : The boundary tag to insert.
+ * @Output	None
+ * @Return	None
+ */
+static void ra_segment_list_remove(struct arena *arena_arg,
+				   struct btag *bt_to_remove_arg)
+{
+	if (!bt_to_remove_arg->prv_seg)
+		arena_arg->head_seg = bt_to_remove_arg->nxt_seg;
+	else
+		bt_to_remove_arg->prv_seg->nxt_seg = bt_to_remove_arg->nxt_seg;
+
+	if (!bt_to_remove_arg->nxt_seg)
+		arena_arg->tail_seg = bt_to_remove_arg->prv_seg;
+	else
+		bt_to_remove_arg->nxt_seg->prv_seg = bt_to_remove_arg->prv_seg;
+}
+
+/*
+ * @Function	ra_segment_split
+ * @Description
+ * Split a segment into two, maintain the arena segment list.
+ * The boundary tag should not be in the free table. Neither the original or
+ * the new psBTNeighbour bounary tag will be in the free table.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_to_split_arg : The boundary tag to split.
+ *		The required segment size of boundary tag after the split.
+ * @Output	None
+ * @Return	btag *: New boundary tag.
+ */
+static struct btag *ra_segment_split(struct arena *arena_arg,
+				     struct btag *bt_to_split_arg,
+				     unsigned long long size)
+{
+	struct btag *local_bt_neighbour = NULL;
+	int res = IMG_ERROR_FATAL;
+
+	res = pool_alloc(global_pool_bt, ((void **)&local_bt_neighbour));
+	if (res != IMG_SUCCESS)
+		return NULL;
+
+	local_bt_neighbour->prv_seg = bt_to_split_arg;
+	local_bt_neighbour->nxt_seg = bt_to_split_arg->nxt_seg;
+	local_bt_neighbour->bt_type = RA_BOUNDARY_TAG_TYPE_FREE;
+	local_bt_neighbour->size = (bt_to_split_arg->size - size);
+	local_bt_neighbour->base = (bt_to_split_arg->base + size);
+	local_bt_neighbour->nxt_free = NULL;
+	local_bt_neighbour->prv_free = NULL;
+	local_bt_neighbour->ref = bt_to_split_arg->ref;
+
+	if (!bt_to_split_arg->nxt_seg)
+		arena_arg->tail_seg = local_bt_neighbour;
+	else
+		bt_to_split_arg->nxt_seg->prv_seg = local_bt_neighbour;
+
+	bt_to_split_arg->nxt_seg = local_bt_neighbour;
+	bt_to_split_arg->size = size;
+
+	return local_bt_neighbour;
+}
+
+/*
+ * @Function	ra_free_list_insert
+ * @Description
+ * Insert a boundary tag into an arena free table.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_arg : The boundary tag to insert into an arena
+ *		free table.
+ * @Output	None
+ * @Return	None
+ */
+static void ra_free_list_insert(struct arena *arena_arg,
+				struct btag *bt_arg)
+{
+	unsigned int index = ra_log2(bt_arg->size);
+
+	bt_arg->bt_type = RA_BOUNDARY_TAG_TYPE_FREE;
+	if (index < FREE_TABLE_LIMIT)
+		bt_arg->nxt_free = arena_arg->head_free[index];
+	else
+		bt_arg->nxt_free = NULL;
+
+	bt_arg->prv_free = NULL;
+
+	if (index < FREE_TABLE_LIMIT) {
+		if (arena_arg->head_free[index])
+			arena_arg->head_free[index]->prv_free = bt_arg;
+	}
+
+	if (index < FREE_TABLE_LIMIT)
+		arena_arg->head_free[index] = bt_arg;
+}
+
+/*
+ * @Function	ra_free_list_remove
+ * @Description
+ * Remove a boundary tag from an arena free table.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_arg    : The boundary tag to remove from
+ *		an arena free table.
+ * @Output	None
+ * @Return	None
+ */
+static void ra_free_list_remove(struct arena *arena_arg,
+				struct btag *bt_arg)
+{
+	unsigned int index = ra_log2(bt_arg->size);
+
+	if (bt_arg->nxt_free)
+		bt_arg->nxt_free->prv_free = bt_arg->prv_free;
+
+	if (!bt_arg->prv_free && index < FREE_TABLE_LIMIT)
+		arena_arg->head_free[index] = bt_arg->nxt_free;
+	else if (bt_arg->prv_free)
+		bt_arg->prv_free->nxt_free = bt_arg->nxt_free;
+}
+
+/*
+ * @Function	ra_build_span_marker
+ * @Description
+ * Construct a span marker boundary tag.
+ * @Input	base : The base of the boundary tag.
+ * @Output	None
+ * @Return    btag * : New span marker boundary tag
+ */
+static struct btag *ra_build_span_marker(unsigned long long base)
+{
+	struct btag *local_bt = NULL;
+	int res = IMG_ERROR_FATAL;
+
+	res = pool_alloc(global_pool_bt, ((void **)&local_bt));
+	if (res != IMG_SUCCESS)
+		return NULL;
+
+	local_bt->bt_type = RA_BOUNDARY_TAG_TYPE_SPAN;
+	local_bt->base = base;
+	local_bt->size = 0;
+	local_bt->nxt_seg = NULL;
+	local_bt->prv_seg = NULL;
+	local_bt->nxt_free = NULL;
+	local_bt->prv_free = NULL;
+	local_bt->ref = NULL;
+
+	return local_bt;
+}
+
+/*
+ * @Function	ra_build_bt
+ * @Description
+ * Construct a boundary tag for a free segment.
+ * @Input	    ui64Base    : The base of the resource segment.
+ * @Input	    ui64Size    : The extent of the resource segment.
+ * @Output	None
+ * @Return    btag *       : New boundary tag
+ */
+static struct btag *ra_build_bt(unsigned long long base, unsigned long long size)
+{
+	struct btag *local_bt = NULL;
+	int res = IMG_ERROR_FATAL;
+
+	res = pool_alloc(global_pool_bt, ((void **)&local_bt));
+
+	if (res != IMG_SUCCESS)
+		return local_bt;
+
+	local_bt->bt_type = RA_BOUNDARY_TAG_TYPE_FREE;
+	local_bt->base = base;
+	local_bt->size = size;
+	local_bt->nxt_seg = NULL;
+	local_bt->prv_seg = NULL;
+	local_bt->nxt_free = NULL;
+	local_bt->prv_free = NULL;
+	local_bt->ref = NULL;
+
+	return local_bt;
+}
+
+/*
+ * @Function	ra_insert_resource
+ * @Description
+ * Add a free resource segment to an arena.
+ * @Input	base : The base of the resource segment.
+ * @Input	size : The size of the resource segment.
+ * @Output	None
+ * @Return	IMG_SUCCESS or an error code.
+ */
+static int ra_insert_resource(struct arena *arena_arg,
+			      unsigned long long base,
+			      unsigned long long size)
+{
+	struct btag *local_bt = NULL;
+
+	local_bt = ra_build_bt(base, size);
+	if (!local_bt)
+		return IMG_ERROR_UNEXPECTED_STATE;
+
+	ra_segment_list_insert(arena_arg, local_bt);
+	ra_free_list_insert(arena_arg, local_bt);
+	arena_arg->max_idx = ra_log2(size);
+	if (1ULL << arena_arg->max_idx < size)
+		arena_arg->max_idx++;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	ra_insert_resource_span
+ * @Description
+ * Add a free resource span to an arena, complete with span markers.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	base : The base of the resource segment.
+ * @Input	size : The size of the resource segment.
+ * @Output	None
+ * @Return	btag * : The boundary tag representing
+ *		the free resource segment.
+ */
+static struct btag *ra_insert_resource_span(struct arena *arena_arg,
+					    unsigned long long base,
+					    unsigned long long size)
+{
+	struct btag *local_bt = NULL;
+	struct btag *local_bt_span_start = NULL;
+	struct btag *local_bt_span_end = NULL;
+
+	local_bt_span_start = ra_build_span_marker(base);
+	if (!local_bt_span_start)
+		return NULL;
+
+	local_bt_span_end = ra_build_span_marker(base + size);
+	if (!local_bt_span_end) {
+		pool_free(global_pool_bt, local_bt_span_start);
+		return NULL;
+	}
+
+	local_bt = ra_build_bt(base, size);
+	if (!local_bt) {
+		pool_free(global_pool_bt, local_bt_span_end);
+		pool_free(global_pool_bt, local_bt_span_start);
+		return NULL;
+	}
+
+	ra_segment_list_insert(arena_arg, local_bt_span_start);
+	ra_segment_list_insert_after(arena_arg,
+				     local_bt_span_start,
+				     local_bt);
+	ra_free_list_insert(arena_arg, local_bt);
+	ra_segment_list_insert_after(arena_arg,
+				     local_bt,
+				     local_bt_span_end);
+
+	return local_bt;
+}
+
+/*
+ * @Function	ra_free_bt
+ * @Description
+ * Free a boundary tag taking care of the segment list and the
+ *		boundary tag free table.
+ * @Input	arena_arg : Pointer to the input arena.
+ * @Input	bt_arg : The boundary tag to free.
+ * @Output	None
+ * @Return	None
+ */
+static void ra_free_bt(struct arena *arena_arg,
+		       struct btag *bt_arg)
+{
+	struct btag *bt_neibr;
+
+	/* try and coalesce with left bt_neibr */
+	bt_neibr = bt_arg->prv_seg;
+	if (bt_neibr &&
+	    bt_neibr->bt_type == RA_BOUNDARY_TAG_TYPE_FREE &&
+	    bt_neibr->base + bt_neibr->size == bt_arg->base) {
+		ra_free_list_remove(arena_arg, bt_neibr);
+		ra_segment_list_remove(arena_arg, bt_neibr);
+		bt_arg->base = bt_neibr->base;
+		bt_arg->size += bt_neibr->size;
+		pool_free(global_pool_bt, bt_neibr);
+	}
+
+	/* try to coalesce with right psBTNeighbour */
+	bt_neibr = bt_arg->nxt_seg;
+	if (bt_neibr &&
+	    bt_neibr->bt_type == RA_BOUNDARY_TAG_TYPE_FREE &&
+	    bt_arg->base + bt_arg->size == bt_neibr->base) {
+		ra_free_list_remove(arena_arg, bt_neibr);
+		ra_segment_list_remove(arena_arg, bt_neibr);
+		bt_arg->size += bt_neibr->size;
+		pool_free(global_pool_bt, bt_neibr);
+	}
+
+	if (bt_arg->nxt_seg &&
+	    bt_arg->nxt_seg->bt_type == RA_BOUNDARY_TAG_TYPE_SPAN &&
+	    bt_arg->prv_seg && bt_arg->prv_seg->bt_type ==
+	    RA_BOUNDARY_TAG_TYPE_SPAN) {
+		struct btag *ps_bt_nxt = bt_arg->nxt_seg;
+		struct btag *ps_bt_prev = bt_arg->prv_seg;
+
+		ra_segment_list_remove(arena_arg, ps_bt_nxt);
+		ra_segment_list_remove(arena_arg, ps_bt_prev);
+		ra_segment_list_remove(arena_arg, bt_arg);
+		arena_arg->import_free_fxn(arena_arg->import_hdnl,
+					   bt_arg->base,
+					   bt_arg->ref);
+		pool_free(global_pool_bt, ps_bt_nxt);
+		pool_free(global_pool_bt, ps_bt_prev);
+		pool_free(global_pool_bt, bt_arg);
+	} else {
+		ra_free_list_insert(arena_arg, bt_arg);
+	}
+}
+
+static int ra_check_btag(struct arena *arena_arg,
+			 unsigned long long size_arg,
+			 void **ref,
+			 struct btag *bt_arg,
+			 unsigned long long align_arg,
+			 unsigned long long *base_arg,
+			 unsigned int align_log2)
+{
+	unsigned long long local_align_base;
+	int res = IMG_ERROR_FATAL;
+
+	while (bt_arg) {
+		if (align_arg > 1ULL)
+			local_align_base = ((bt_arg->base + align_arg - 1)
+				>> align_log2) << align_log2;
+		else
+			local_align_base = bt_arg->base;
+
+		if ((bt_arg->base + bt_arg->size) >=
+		     (local_align_base + size_arg)) {
+			ra_free_list_remove(arena_arg, bt_arg);
+
+			/*
+			 * with align_arg we might need to discard the front of
+			 * this segment
+			 */
+			if (local_align_base > bt_arg->base) {
+				struct btag *btneighbor;
+
+				btneighbor = ra_segment_split(arena_arg,
+							      bt_arg,
+							      (local_align_base -
+							       bt_arg->base));
+				/*
+				 * Partition the buffer, create a new boundary
+				 * tag
+				 */
+				if (!btneighbor)
+					return IMG_ERROR_UNEXPECTED_STATE;
+
+				ra_free_list_insert(arena_arg, bt_arg);
+				bt_arg = btneighbor;
+			}
+
+			/*
+			 * The segment might be too big, if so, discard the back
+			 * of the segment
+			 */
+			if (bt_arg->size > size_arg) {
+				struct btag *btneighbor;
+
+				btneighbor = ra_segment_split(arena_arg,
+							      bt_arg,
+							      size_arg);
+				/*
+				 * Partition the buffer, create a new boundary
+				 * tag
+				 */
+				if (!btneighbor)
+					return IMG_ERROR_UNEXPECTED_STATE;
+
+				ra_free_list_insert(arena_arg, btneighbor);
+			}
+
+			bt_arg->bt_type = RA_BOUNDARY_TAG_TYPE_LIVE;
+
+			res = vid_hash_insert(arena_arg->hash_tbl,
+					      bt_arg->base,
+					      (unsigned long)bt_arg);
+			if (res != IMG_SUCCESS) {
+				ra_free_bt(arena_arg, bt_arg);
+				*base_arg = 0;
+				return IMG_ERROR_UNEXPECTED_STATE;
+			}
+
+			if (ref)
+				*ref = bt_arg->ref;
+
+			*base_arg = bt_arg->base;
+			return IMG_SUCCESS;
+		}
+		bt_arg = bt_arg->nxt_free;
+	}
+
+	return res;
+}
+
+/*
+ * @Function	ra_attempt_alloc_aligned
+ * @Description	Attempt to allocate from an arena
+ * @Input	arena_arg: Pointer to the input arena
+ * @Input	size_arg: The requested allocation size
+ * @Input	ref: The user references associated with the allocated
+ *		segment
+ * @Input	align_arg: Required alignment
+ * @Output	base_arg: Allocated resource size
+ * @Return	IMG_SUCCESS or an error code
+ */
+static int ra_attempt_alloc_aligned(struct arena *arena_arg,
+				    unsigned long long size_arg,
+				    void **ref,
+				    unsigned long long align_arg,
+				    unsigned long long *base_arg)
+{
+	unsigned int index;
+	unsigned int align_log2;
+	int res = IMG_ERROR_FATAL;
+
+	if (!arena_arg || !base_arg)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/*
+	 * Take the log of the alignment to get number of bits to shift
+	 * left/right for multiply/divide. Assumption made here is that
+	 * alignment has to be a power of 2 value. Aserting otherwise.
+	 */
+	align_log2 = ra_log2(align_arg);
+
+	/*
+	 * Search for a near fit free boundary tag, start looking at the
+	 * log2 free table for our required size and work on up the table.
+	 */
+	index = ra_log2(size_arg);
+
+	/*
+	 * If the Size required is exactly 2**n then use the n bucket, because
+	 * we know that every free block in that bucket is larger than 2**n,
+	 * otherwise start at then next bucket up.
+	 */
+	if (size_arg > (1ull << index))
+		index++;
+
+	while ((index < FREE_TABLE_LIMIT) && !arena_arg->head_free[index])
+		index++;
+
+	if (index >= FREE_TABLE_LIMIT) {
+		pr_err("requested allocation size doesn't fit in the arena. Increase MMU HEAP Size\n");
+		return IMG_ERROR_OUT_OF_MEMORY;
+	}
+
+	while (index < FREE_TABLE_LIMIT) {
+		if (arena_arg->head_free[index]) {
+			/* we have a cached free boundary tag */
+			struct btag *local_bt =
+				arena_arg->head_free[index];
+
+			res = ra_check_btag(arena_arg,
+					    size_arg,
+					    ref,
+					    local_bt,
+					    align_arg,
+					    base_arg,
+					    align_log2);
+			if (res != IMG_SUCCESS)
+				return res;
+		}
+		index++;
+	}
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	vid_ra_init
+ * @Description	Initializes the RA module. Must be called before any other
+ *		ra API function
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_initialise(void)
+{
+	int res = IMG_ERROR_FATAL;
+
+	if (!global_init) {
+		res = pool_create("img-arena",
+				  sizeof(struct arena),
+				  &global_pool_arena);
+		if (res != IMG_SUCCESS)
+			return IMG_ERROR_UNEXPECTED_STATE;
+
+		res = pool_create("img-bt",
+				  sizeof(struct btag),
+				  &global_pool_bt);
+		if (res != IMG_SUCCESS) {
+			res = pool_delete(global_pool_arena);
+			global_pool_arena = NULL;
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+		global_init = 1;
+		res = IMG_SUCCESS;
+	}
+
+	return res;
+}
+
+/*
+ * @Function	vid_ra_deinit
+ * @Description	Deinitializes the RA module
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_deinit(void)
+{
+	int res = IMG_ERROR_FATAL;
+
+	if (global_init) {
+		if (global_pool_arena) {
+			res = pool_delete(global_pool_arena);
+			global_pool_arena = NULL;
+		}
+		if (global_pool_bt) {
+			res = pool_delete(global_pool_bt);
+			global_pool_bt = NULL;
+		}
+		global_init = 0;
+		res = IMG_SUCCESS;
+	}
+	return res;
+}
+
+/*
+ * @Function	vid_ra_create
+ * @Description	Used to create a resource arena.
+ * @Input	name: The name of the arena for diagnostic purposes
+ * @Input	base_arg: The base of an initial resource span or 0
+ * @Input	size_arg: The size of an initial resource span or 0
+ * @Input	quantum: The arena allocation quantum
+ * @Input	(*import_alloc_fxn): A resource allocation callback or NULL
+ * @Input	(*import_free_fxn): A resource de-allocation callback or NULL
+ * @Input	import_hdnl: Handle passed to alloc and free or NULL
+ * @Output	arena_hndl: The handle for the arene being created, or NULL
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_create(const unsigned char * const name,
+		  unsigned long long base_arg,
+		  unsigned long long size_arg,
+		  unsigned long	quantum,
+		  int (*import_alloc_fxn)(void * const import_hdnl,
+					  unsigned long long req_sz,
+					  unsigned long long * const actl_sz,
+					  void ** const ref,
+					  unsigned int alloc_flags,
+					  unsigned long long * const base_arg),
+		  int (*import_free_fxn)(void * const import_hdnl,
+					 unsigned long long import_base,
+					 void * const import_ref),
+					 void *import_hdnl,
+					 void **arena_hndl)
+{
+	struct arena *local_arena = NULL;
+	unsigned int idx = 0;
+	int res = IMG_ERROR_FATAL;
+
+	if (!arena_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	*(arena_hndl) = NULL;
+
+	if (global_init) {
+		res = pool_alloc(global_pool_arena, ((void **)&local_arena));
+		if (!local_arena || res != IMG_SUCCESS)
+			return IMG_ERROR_UNEXPECTED_STATE;
+
+		local_arena->name = NULL;
+		if (name)
+			local_arena->name = kstrdup((const signed char *)name,
+						    GFP_KERNEL);
+		if (import_alloc_fxn)
+			local_arena->import_alloc_fxn = import_alloc_fxn;
+		else
+			local_arena->import_alloc_fxn = ra_request_alloc_fail;
+
+		local_arena->import_free_fxn = import_free_fxn;
+		local_arena->import_hdnl = import_hdnl;
+
+		for (idx = 0; idx < FREE_TABLE_LIMIT; idx++)
+			local_arena->head_free[idx] = NULL;
+
+		local_arena->head_seg = NULL;
+		local_arena->tail_seg = NULL;
+		local_arena->quantum = quantum;
+
+		res = vid_hash_create(MINIMUM_HASH_SIZE,
+				      &local_arena->hash_tbl);
+
+		if (!local_arena->hash_tbl) {
+			vid_hash_delete(local_arena->hash_tbl);
+			kfree(local_arena->name);
+			local_arena->name = NULL;
+			return IMG_ERROR_UNEXPECTED_STATE;
+		}
+
+		//if (size_arg > (unsigned long long)0) {
+		if (size_arg > 0ULL) {
+			size_arg = (size_arg + quantum - 1) / quantum * quantum;
+
+			res = ra_insert_resource(local_arena,
+						 base_arg,
+						 size_arg);
+			if (res != IMG_SUCCESS) {
+				vid_hash_delete(local_arena->hash_tbl);
+				pool_free(global_pool_arena, local_arena);
+				kfree(local_arena->name);
+				local_arena->name = NULL;
+				return IMG_ERROR_UNEXPECTED_STATE;
+			}
+		}
+		*(arena_hndl) = local_arena;
+		res = IMG_SUCCESS;
+	}
+
+	return res;
+}
+
+/*
+ * @Function	vid_ra_delete
+ * @Description	Used to delete a resource arena. All resources allocated from
+ *		the arena must be freed before deleting the arena
+ * @Input	arena_hndl: The handle to the arena to delete
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_delete(void * const arena_hndl)
+{
+	int res = IMG_ERROR_FATAL;
+	struct arena *local_arena = NULL;
+	unsigned int idx;
+
+	if (!arena_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (global_init) {
+		local_arena = (struct arena *)arena_hndl;
+		kfree(local_arena->name);
+		local_arena->name = NULL;
+		for (idx = 0; idx < FREE_TABLE_LIMIT; idx++)
+			local_arena->head_free[idx] = NULL;
+
+		while (local_arena->head_seg) {
+			struct btag *local_bt = local_arena->head_seg;
+
+			ra_segment_list_remove(local_arena, local_bt);
+		}
+		res = vid_hash_delete(local_arena->hash_tbl);
+		if (res != IMG_SUCCESS)
+			return IMG_ERROR_UNEXPECTED_STATE;
+
+		res = pool_free(global_pool_arena, local_arena);
+		if (res != IMG_SUCCESS)
+			return IMG_ERROR_UNEXPECTED_STATE;
+	}
+
+	return res;
+}
+
+/*
+ * @Function	vid_ra_add
+ * @Description	Used to add a resource span to an arena. The span must not
+ *		overlap with any span previously added to the arena
+ * @Input	base_arg: The base_arg of the span
+ * @Input	size_arg: The size of the span
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_add(void * const arena_hndl, unsigned long long base_arg, unsigned long long size_arg)
+{
+	int res = IMG_ERROR_FATAL;
+	struct arena *local_arena = NULL;
+
+	if (!arena_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (global_init) {
+		local_arena = (struct arena *)arena_hndl;
+		size_arg = (size_arg + local_arena->quantum - 1) /
+			local_arena->quantum * local_arena->quantum;
+
+		res = ra_insert_resource(local_arena, base_arg, size_arg);
+		if (res != IMG_SUCCESS)
+			return IMG_ERROR_INVALID_PARAMETERS;
+	}
+
+	return res;
+}
+
+/*
+ * @Function	vid_ra_alloc
+ * @Description	Used to allocate resource from an arena
+ * @Input	arena_hndl: The handle to the arena to create the resource
+ * @Input	request_size: The requested size of resource segment
+ * @Input	actl_size: The actualSize of resource segment
+ * @Input	ref: The user reference associated with allocated resource
+ *		span
+ * @Input	alloc_flags: AllocationFlags influencing allocation policy
+ * @Input	align_arg: The alignment constraint required for the allocated
+ *		segment
+ * @Output	base_args: The base of the allocated resource
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_alloc(void * const arena_hndl,
+		 unsigned long long request_size,
+		 unsigned long long * const actl_sz,
+		 void ** const ref,
+		 unsigned int alloc_flags,
+		 unsigned long long alignarg,
+		 unsigned long long * const basearg)
+{
+	int res = IMG_ERROR_FATAL;
+	struct arena *arn_ctx = NULL;
+	unsigned long long loc_size = request_size;
+
+	if (!arena_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (global_init) {
+		arn_ctx = (struct arena *)arena_hndl;
+		loc_size = ((loc_size + arn_ctx->quantum - 1) /
+				arn_ctx->quantum) * arn_ctx->quantum;
+
+		if (actl_sz)
+			*actl_sz = loc_size;
+
+		/*
+		 * If allocation failed then we might have an import source
+		 * which can provide more resource, else we will have to fail
+		 * the allocation to the caller.
+		 */
+		if (alloc_flags == RA_SEQUENTIAL_ALLOCATION)
+			res = ra_attempt_alloc_aligned(arn_ctx,
+						       loc_size,
+						       ref,
+						       alignarg,
+						       basearg);
+
+		if (res != IMG_SUCCESS) {
+			void *import_ref = NULL;
+			unsigned long long import_base = 0ULL;
+			unsigned long long locimprt_reqsz = loc_size;
+			unsigned long long locimprt_actsz = 0ULL;
+
+			res = arn_ctx->import_alloc_fxn(arn_ctx->import_hdnl,
+					locimprt_reqsz,
+					&locimprt_actsz,
+					&import_ref,
+					alloc_flags,
+					&import_base);
+
+			if (res == IMG_SUCCESS) {
+				struct btag *local_bt =
+					ra_insert_resource_span(arn_ctx,
+								import_base,
+								locimprt_actsz);
+
+				/*
+				 * Successfully import more resource, create a
+				 * span to represent it and retry the allocation
+				 * attempt
+				 */
+				if (!local_bt) {
+					/*
+					 * Insufficient resources to insert the
+					 * newly acquired span, so free it back
+					 */
+					arn_ctx->import_free_fxn(arn_ctx->import_hdnl,
+							import_base,
+							import_ref);
+					return IMG_ERROR_UNEXPECTED_STATE;
+				}
+				local_bt->ref = import_ref;
+				if (alloc_flags == RA_SEQUENTIAL_ALLOCATION) {
+					res = ra_attempt_alloc_aligned(arn_ctx,
+								       loc_size,
+								       ref,
+								       alignarg,
+								       basearg);
+				}
+			}
+		}
+	}
+
+	return res;
+}
+
+/*
+ * @Function	vid_ra_free
+ * @Description	Used to free a resource segment
+ * @Input	arena_hndl: The arena the segment was originally allocated from
+ * @Input	base_arg: The base of the span
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_free(void * const arena_hndl, unsigned long long base_arg)
+{
+	int res = IMG_ERROR_FATAL;
+	struct arena *local_arena = NULL;
+	struct btag *local_bt = NULL;
+	unsigned long	uip_res;
+
+	if (!arena_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (global_init) {
+		local_arena = (struct arena *)arena_hndl;
+
+		res = vid_hash_remove(local_arena->hash_tbl,
+				      base_arg,
+				      &uip_res);
+		if (res != IMG_SUCCESS)
+			return res;
+		local_bt = (struct btag *)uip_res;
+
+		ra_free_bt(local_arena, local_bt);
+	}
+
+	return res;
+}
diff --git a/drivers/staging/media/vxd/common/ra.h b/drivers/staging/media/vxd/common/ra.h
new file mode 100644
index 000000000000..a4d529d635d7
--- /dev/null
+++ b/drivers/staging/media/vxd/common/ra.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Implements generic resource allocation.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstream
+ *      Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+#ifndef _RA_H_
+#define _RA_H_
+
+#define MINIMUM_HASH_SIZE  (64)
+#define FREE_TABLE_LIMIT   (64)
+
+/* Defines whether sequential or random allocation is used */
+enum {
+	RA_SEQUENTIAL_ALLOCATION = 0,
+	RA_RANDOM_ALLOCATION,
+	RA_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Defines boundary tag type */
+enum eboundary_tag_type {
+	RA_BOUNDARY_TAG_TYPE_SPAN = 0,
+	RA_BOUNDARY_TAG_TYPE_FREE,
+	RA_BOUNDARY_TAG_TYPE_LIVE,
+	RA_BOUNDARY_TAG_TYPE_MAX,
+	RA_BOUNDARY_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * @Description
+ * Boundary tags, used to describe a resource segment
+ *
+ * @enum0: span markers
+ * @enum1: free resource segment
+ * @enum2: allocated resource segment
+ * @enum3: max
+ * @base,size: The base resource of this segment and extent of this segment
+ * @nxt_seg, prv_seg: doubly linked ordered list of all segments
+ *			within the arena
+ * @nxt_free, prv_free: doubly linked un-ordered list of free segments
+ * @reference : a user reference associated with this span, user
+ *		references are currently only provided in
+ *		the callback mechanism
+ */
+struct btag {
+	unsigned int bt_type;
+	unsigned long long base;
+	unsigned long long size;
+	struct btag *nxt_seg;
+	struct btag *prv_seg;
+	struct btag *nxt_free;
+	struct btag *prv_free;
+	void *ref;
+};
+
+/*
+ * @Description
+ * resource allocation arena
+ *
+ * @name: arena for diagnostics output
+ * @quantum: allocations within this arena are quantum sized
+ * @max_idx: index of the last position in the psBTHeadFree table,
+ *		with available free space
+ * @import_alloc_fxn: import interface, if provided
+ * @import_free_fxn: import interface, if provided
+ * @import_hdnl: import interface, if provided
+ * @head_free: head of list of free boundary tags for indexed by Log2
+ *		of the boundary tag size. Power-of-two table of free lists
+ * @head_seg, tail_seg : resource ordered segment list
+ * @ps_hash : segment address to boundary tag hash table
+ */
+struct arena {
+	unsigned char *name;
+	unsigned long quantum;
+	unsigned int max_idx;
+	int (*import_alloc_fxn)(void *import_hdnl,
+				unsigned long long requested_size,
+				unsigned long long *actual_size,
+				void **ref,
+				unsigned int alloc_flags,
+				unsigned long long *base_addr);
+	int (*import_free_fxn)(void *import_hdnl,
+			       unsigned long long base,
+			       void *ref);
+	void *import_hdnl;
+	struct btag *head_free[FREE_TABLE_LIMIT];
+	struct btag *head_seg;
+	struct btag *tail_seg;
+	struct hash *hash_tbl;
+};
+
+/*
+ * @Function	vid_ra_init
+ * @Description	Initializes the RA module. Must be called before any other
+ *		ra API function
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_initialise(void);
+
+/*
+ * @Function	vid_ra_deinit
+ * @Description	Deinitializes the RA module
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_deinit(void);
+
+/*
+ * @Function	vid_ra_create
+ * @Description	Used to create a resource arena.
+ * @Input	name: The name of the arena for diagnostic purposes
+ * @Input	base_arg: The base of an initial resource span or 0
+ * @Input	size_arg: The size of an initial resource span or 0
+ * @Input	quantum: The arena allocation quantum
+ * @Input	(*import_alloc_fxn): A resource allocation callback or NULL
+ * @Input	(*import_free_fxn): A resource de-allocation callback or NULL
+ * @Input	import_hdnl: Handle passed to alloc and free or NULL
+ * @Output	arena_hndl: The handle for the arene being created, or NULL
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_create(const unsigned char * const name,
+		  unsigned long long base_arg,
+		  unsigned long long size_arg,
+		  unsigned long quantum,
+		  int (*import_alloc_fxn)(void * const import_hdnl,
+					  unsigned long long req_sz,
+					  unsigned long long * const actl_sz,
+					  void ** const ref,
+					  unsigned int alloc_flags,
+					  unsigned long long * const base_arg),
+		  int (*import_free_fxn)(void * const import_hdnl,
+					 unsigned long long import_base,
+					 void * const import_ref),
+		  void *import_hdnl,
+		  void **arena_hndl);
+
+/*
+ * @Function	vid_ra_delete
+ * @Description	Used to delete a resource arena. All resources allocated from
+ *		the arena must be freed before deleting the arena
+ * @Input	arena_hndl: The handle to the arena to delete
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_delete(void * const arena_hndl);
+
+/*
+ * @Function	vid_ra_add
+ * @Description	Used to add a resource span to an arena. The span must not
+ *		overlap with any span previously added to the arena
+ * @Input	base_arg: The base_arg of the span
+ * @Input	size_arg: The size of the span
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_add(void * const arena_hndl, unsigned long long base_arg, unsigned long long size_arg);
+
+/*
+ * @Function	vid_ra_alloc
+ * @Description	Used to allocate resource from an arena
+ * @Input	arena_hndl: The handle to the arena to create the resource
+ * @Input	request_size: The requested size of resource segment
+ * @Input	actl_size: The actualSize of resource segment
+ * @Input	ref: The user reference associated with allocated resource
+ *		span
+ * @Input	alloc_flags: AllocationFlags influencing allocation policy
+ * @Input	align_arg: The alignment constraint required for the allocated
+ *		segment
+ * @Output	base_args: The base of the allocated resource
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_alloc(void * const arena_hndl,
+		 unsigned long long request_size,
+		 unsigned long long * const actl_sz,
+		 void ** const ref,
+		 unsigned int alloc_flags,
+		 unsigned long long align_arg,
+		 unsigned long long * const base_arg);
+
+/*
+ * @Function	vid_ra_free
+ * @Description	Used to free a resource segment
+ * @Input	arena_hndl: The arena the segment was originally allocated from
+ * @Input	base_arg: The base of the span
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int vid_ra_free(void * const arena_hndl, unsigned long long base_arg);
+
+#endif
diff --git a/drivers/staging/media/vxd/common/talmmu_api.c b/drivers/staging/media/vxd/common/talmmu_api.c
new file mode 100644
index 000000000000..04ddcc33505c
--- /dev/null
+++ b/drivers/staging/media/vxd/common/talmmu_api.c
@@ -0,0 +1,753 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TAL MMU Extensions.
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
+#include <linux/slab.h>
+#include <linux/printk.h>
+#include <linux/mutex.h>
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "img_errors.h"
+#include "lst.h"
+#include "talmmu_api.h"
+
+static int global_init;
+static struct lst_t gl_dmtmpl_lst = {0};
+static struct mutex *global_lock;
+
+static int talmmu_devmem_free(void *mem_hndl)
+{
+	struct talmmu_memory *mem = mem_hndl;
+	struct talmmu_devmem_heap *mem_heap;
+
+	if (!mem_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	mem_heap = mem->devmem_heap;
+
+	if (!mem->ext_dev_virtaddr)
+		addr_cx_free(&mem_heap->ctx, "", mem->dev_virtoffset);
+
+	mutex_lock_nested(global_lock, SUBCLASS_TALMMU);
+
+	lst_remove(&mem_heap->memory_list, mem);
+
+	mutex_unlock(global_lock);
+
+	kfree(mem);
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * talmmu_devmem_heap_empty - talmmu_devmem_heap_empty
+ * @devmem_heap_hndl: device memory heap handle
+ *
+ * This function is used for emptying the device memory heap list
+ */
+int talmmu_devmem_heap_empty(void *devmem_heap_hndl)
+{
+	struct talmmu_devmem_heap *devmem_heap = devmem_heap_hndl;
+
+	if (!devmem_heap)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	while (!lst_empty(&devmem_heap->memory_list))
+		talmmu_devmem_free(lst_first(&devmem_heap->memory_list));
+
+	addr_cx_deinitialise(&devmem_heap->ctx);
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_devmem_heap_destroy
+ *
+ * @Description	This function is used for freeing the device memory heap
+ *
+ * @Input
+ *
+ * @Output
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+static void talmmu_devmem_heap_destroy(void *devmem_heap_hndl)
+{
+	struct talmmu_devmem_heap *devmem_heap = devmem_heap_hndl;
+
+	talmmu_devmem_heap_empty(devmem_heap_hndl);
+	kfree(devmem_heap);
+}
+
+/*
+ * @Function	talmmu_init
+ *
+ * @Description	This function is used to initialize the TALMMU component.
+ *
+ * @Input	None.
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_init(void)
+{
+	if (!global_init) {
+		/* If no mutex associated with this resource */
+		if (!global_lock) {
+			/* Create one */
+			global_lock = kzalloc(sizeof(*global_lock), GFP_KERNEL);
+			if (!global_lock)
+				return IMG_ERROR_OUT_OF_MEMORY;
+
+			mutex_init(global_lock);
+		}
+
+		lst_init(&gl_dmtmpl_lst);
+		global_init = 1;
+	}
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_deinit
+ *
+ * @Description	This function is used to de-initialize the TALMMU component.
+ *
+ * @Input	None.
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_deinit(void)
+{
+	struct talmmu_dm_tmpl *t;
+
+	if (global_init) {
+		while (!lst_empty(&gl_dmtmpl_lst)) {
+			t = (struct talmmu_dm_tmpl *)lst_first(&gl_dmtmpl_lst);
+			talmmu_devmem_template_destroy((void *)t);
+		}
+		mutex_destroy(global_lock);
+		kfree(global_lock);
+		global_lock = NULL;
+		global_init = 0;
+	}
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_devmem_template_create
+ *
+ * @Description	This function is used to create a device memory template
+ *
+ * @Input	devmem_info:  A pointer to a talmmu_devmem_info structure.
+ *
+ * @Output	devmem_template_hndl: A pointer used to return the template
+ *		handle
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_template_create(struct talmmu_devmem_info *devmem_info,
+				  void **devmem_template_hndl)
+{
+	struct talmmu_dm_tmpl *devmem_template;
+	struct talmmu_dm_tmpl *tmp_devmem_template;
+
+	if (!devmem_info)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	devmem_template = kzalloc(sizeof(*devmem_template), GFP_KERNEL);
+	if (!devmem_template)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	devmem_template->devmem_info = *devmem_info;
+
+	lst_init(&devmem_template->devmem_ctx_list);
+
+	mutex_lock_nested(global_lock, SUBCLASS_TALMMU);
+
+	tmp_devmem_template = lst_first(&gl_dmtmpl_lst);
+	while (tmp_devmem_template)
+		tmp_devmem_template = lst_next(tmp_devmem_template);
+
+	devmem_template->page_num_shift = 12;
+	devmem_template->byte_in_pagemask = 0xFFF;
+	devmem_template->heap_alignment = 0x400000;
+	devmem_template->pagetable_entries_perpage =
+		(devmem_template->devmem_info.page_size / sizeof(unsigned int));
+	devmem_template->pagetable_num_shift = 10;
+	devmem_template->index_in_pagetable_mask = 0x3FF;
+	devmem_template->pagedir_num_shift = 22;
+
+	lst_add(&gl_dmtmpl_lst, devmem_template);
+
+	mutex_unlock(global_lock);
+
+	*devmem_template_hndl = devmem_template;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_devmem_template_destroy
+ *
+ * @Description This function is used to obtain the template from the list and
+ *		destroy
+ *
+ * @Input	devmem_tmplt_hndl: Device memory template handle
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_template_destroy(void *devmem_tmplt_hndl)
+{
+	struct talmmu_dm_tmpl *dm_tmpl = devmem_tmplt_hndl;
+	unsigned int i;
+
+	if (!devmem_tmplt_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	while (!lst_empty(&dm_tmpl->devmem_ctx_list))
+		talmmu_devmem_ctx_destroy(lst_first(&dm_tmpl->devmem_ctx_list));
+
+	for (i = 0; i < dm_tmpl->num_heaps; i++)
+		talmmu_devmem_heap_destroy(dm_tmpl->devmem_heap[i]);
+
+	mutex_lock_nested(global_lock, SUBCLASS_TALMMU);
+
+	lst_remove(&gl_dmtmpl_lst, dm_tmpl);
+
+	mutex_unlock(global_lock);
+
+	kfree(dm_tmpl);
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_create_heap
+ *
+ * @Description	This function is used to create a device memory heap
+ *
+ * @Input
+ *
+ * @Output
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+static int talmmu_create_heap(void *devmem_tmplt_hndl,
+			      struct talmmu_heap_info *heap_info_arg,
+			      unsigned char isfull,
+			      struct talmmu_devmem_heap **devmem_heap_arg)
+{
+	struct talmmu_dm_tmpl *devmem_template = devmem_tmplt_hndl;
+	struct talmmu_devmem_heap *devmem_heap;
+
+	/* Allocating memory for device memory heap */
+	devmem_heap = kzalloc(sizeof(*devmem_heap), GFP_KERNEL);
+	if (!devmem_heap)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	/*
+	 * Update the device memory heap structure members
+	 * Update the device memory template
+	 */
+	devmem_heap->devmem_template = devmem_template;
+	/* Update the device memory heap information */
+	devmem_heap->heap_info = *heap_info_arg;
+
+	/* Initialize the device memory heap list */
+	lst_init(&devmem_heap->memory_list);
+
+	/* If full structure required */
+	if (isfull) {
+		addr_cx_initialise(&devmem_heap->ctx);
+		devmem_heap->regions.base_addr = 0;
+		devmem_heap->regions.size = devmem_heap->heap_info.size;
+		addr_cx_define_mem_region(&devmem_heap->ctx,
+					  &devmem_heap->regions);
+	}
+
+	*devmem_heap_arg = devmem_heap;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_devmem_heap_add
+ *
+ * @Description	This function is for creating and adding the heap to the
+ *		device memory template
+ *
+ * @Input	devmem_tmplt_hndl: device memory template handle
+ *
+ * @Input	heap_info_arg: pointer to the heap info structure
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_heap_add(void *devmem_tmplt_hndl,
+			   struct talmmu_heap_info *heap_info_arg)
+{
+	struct talmmu_dm_tmpl *devmem_template = devmem_tmplt_hndl;
+	struct talmmu_devmem_heap *devmem_heap;
+	unsigned int res;
+
+	if (!devmem_tmplt_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (!heap_info_arg)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	res = talmmu_create_heap(devmem_tmplt_hndl,
+				 heap_info_arg,
+				 1,
+				 &devmem_heap);
+	if (res != IMG_SUCCESS)
+		return res;
+
+	devmem_template->devmem_heap[devmem_template->num_heaps] = devmem_heap;
+	devmem_template->num_heaps++;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_devmem_ctx_create
+ *
+ * @Description	This function is used to create a device memory context
+ *
+ * @Input	devmem_tmplt_hndl: pointer to the device memory template handle
+ *
+ * @Input	mmu_ctx_id: MMU context ID used with the TAL
+ *
+ * @Output	devmem_ctx_hndl: pointer to the device memory context handle
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_ctx_create(void *devmem_tmplt_hndl,
+			     unsigned int mmu_ctx_id,
+			     void **devmem_ctx_hndl)
+{
+	struct talmmu_dm_tmpl *dm_tmpl = devmem_tmplt_hndl;
+	struct talmmu_devmem_ctx *dm_ctx;
+	struct talmmu_devmem_heap *dm_heap;
+	int i;
+	unsigned int res = IMG_SUCCESS;
+
+	if (!devmem_tmplt_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* Allocate memory for device memory context */
+	dm_ctx = kzalloc((sizeof(struct talmmu_devmem_ctx)), GFP_KERNEL);
+	if (!dm_ctx)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	/*
+	 * Update the device memory context structure members
+	 * Update the device memory template
+	 */
+	dm_ctx->devmem_template = dm_tmpl;
+	/* Update MMU context ID */
+	dm_ctx->mmu_ctx_id = mmu_ctx_id;
+
+	/* Check for PTD Alignment */
+	if (dm_tmpl->devmem_info.ptd_alignment == 0)
+		/*
+		 * Make sure alignment is a multiple of page size.
+		 * Set up PTD alignment to Page Size
+		 */
+		dm_tmpl->devmem_info.ptd_alignment =
+			dm_tmpl->devmem_info.page_size;
+
+	/* Reference or create heaps for this context */
+	for (i = 0; i < dm_tmpl->num_heaps; i++) {
+		dm_heap = dm_tmpl->devmem_heap[i];
+		if (!dm_heap)
+			goto error_heap_create;
+
+		switch (dm_heap->heap_info.heap_type) {
+		case TALMMU_HEAP_PERCONTEXT:
+			res = talmmu_create_heap(dm_tmpl,
+						 &dm_heap->heap_info,
+						 1,
+						 &dm_ctx->devmem_heap[i]);
+			if (res != IMG_SUCCESS)
+				goto error_heap_create;
+			break;
+
+		default:
+			break;
+		}
+
+		dm_ctx->num_heaps++;
+	}
+
+	mutex_lock_nested(global_lock, SUBCLASS_TALMMU);
+
+	/* Add the device memory context to the list */
+	lst_add(&dm_tmpl->devmem_ctx_list, dm_ctx);
+
+	dm_tmpl->num_ctxs++;
+
+	mutex_unlock(global_lock);
+
+	*devmem_ctx_hndl = dm_ctx;
+
+	return IMG_SUCCESS;
+
+error_heap_create:
+	/* Destroy the device memory heaps which were already created */
+	for (i--; i >= 0; i--) {
+		dm_heap = dm_ctx->devmem_heap[i];
+		if (dm_heap->heap_info.heap_type == TALMMU_HEAP_PERCONTEXT)
+			talmmu_devmem_heap_destroy(dm_heap);
+
+		dm_ctx->num_heaps--;
+	}
+	kfree(dm_ctx);
+	return res;
+}
+
+/*
+ * @Function	talmmu_devmem_ctx_destroy
+ *
+ * @Description	This function is used to get the device memory context from
+ *		the list and destroy
+ *
+ * @Input	devmem_ctx_hndl: device memory context handle
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_ctx_destroy(void *devmem_ctx_hndl)
+{
+	struct talmmu_devmem_ctx *devmem_ctx = devmem_ctx_hndl;
+	struct talmmu_dm_tmpl *devmem_template;
+	struct talmmu_devmem_heap *devmem_heap;
+	unsigned int i;
+
+	if (!devmem_ctx_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	devmem_template = devmem_ctx->devmem_template;
+
+	for (i = 0; i < devmem_ctx->num_heaps; i++) {
+		devmem_heap = devmem_ctx->devmem_heap[i];
+		if (!devmem_heap)
+			return IMG_ERROR_INVALID_PARAMETERS;
+
+		talmmu_devmem_heap_destroy(devmem_heap);
+	}
+
+	devmem_ctx->pagedir = NULL;
+
+	mutex_lock_nested(global_lock, SUBCLASS_TALMMU);
+
+	lst_remove(&devmem_template->devmem_ctx_list, devmem_ctx);
+
+	devmem_ctx->devmem_template->num_ctxs--;
+
+	mutex_unlock(global_lock);
+
+	kfree(devmem_ctx);
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_get_heap_handle
+ *
+ * @Description	This function is used to get the device memory heap handle
+ *
+ * @Input	hid: heap id
+ *
+ * @Input	devmem_ctx_hndl: device memory context handle
+ *
+ * @Output	devmem_heap_hndl: pointer to the device memory heap handle
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_get_heap_handle(unsigned int hid,
+			   void *devmem_ctx_hndl,
+			   void **devmem_heap_hndl)
+{
+	struct talmmu_devmem_ctx *devmem_ctx = devmem_ctx_hndl;
+	unsigned int i;
+
+	if (!devmem_ctx_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	for (i = 0; i < devmem_ctx->num_heaps; i++) {
+		/*
+		 * Checking for requested heap id match and return the device
+		 * memory heap handle
+		 */
+		if (devmem_ctx->devmem_heap[i]->heap_info.heap_id == hid) {
+			*devmem_heap_hndl = devmem_ctx->devmem_heap[i];
+			return IMG_SUCCESS;
+		}
+	}
+
+	return IMG_ERROR_GENERIC_FAILURE;
+}
+
+/*
+ * @Function	talmmu_devmem_heap_options
+ *
+ * @Description	This function is used to set additional heap options
+ *
+ * @Input	devmem_heap_hndl: Handle for heap
+ *
+ * @Input	heap_opt_id: Heap options ID
+ *
+ * @Input	heap_options: Heap options
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+void talmmu_devmem_heap_options(void *devmem_heap_hndl,
+				enum talmmu_heap_option_id heap_opt_id,
+				union talmmu_heap_options heap_options)
+{
+	struct talmmu_devmem_heap *dm_heap = devmem_heap_hndl;
+
+	switch (heap_opt_id) {
+	case TALMMU_HEAP_OPT_ADD_GUARD_BAND:
+		dm_heap->guardband = heap_options.guardband_opt.guardband;
+		break;
+	default:
+		break;
+	}
+}
+
+/*
+ * @Function	talmmu_devmem_malloc_nonmap
+ *
+ * @Description
+ *
+ * @Input
+ *
+ * @Output
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+static int talmmu_devmem_alloc_nonmap(void *devmem_ctx_hndl,
+				      void *devmem_heap_hndl,
+				      unsigned int size,
+				      unsigned int align,
+				      unsigned int dev_virt_ofset,
+				      unsigned char ext_dev_vaddr,
+				      void **mem_hndl)
+{
+	struct talmmu_devmem_ctx *dm_ctx = devmem_ctx_hndl;
+	struct talmmu_dm_tmpl *dm_tmpl;
+	struct talmmu_devmem_heap *dm_heap = devmem_heap_hndl;
+	struct talmmu_memory *mem;
+	unsigned long long ui64_dev_offset = 0;
+	int res = IMG_SUCCESS;
+
+	if (!dm_ctx)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	if (!devmem_heap_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	dm_tmpl = dm_ctx->devmem_template;
+
+	/* Allocate memory for memory structure */
+	mem = kzalloc((sizeof(struct talmmu_memory)), GFP_KERNEL);
+	if (!mem)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	mem->devmem_heap = dm_heap;
+	mem->devmem_ctx = dm_ctx;
+	mem->ext_dev_virtaddr = ext_dev_vaddr;
+
+	/* We always for to be at least page aligned */
+	if (align >= dm_tmpl->devmem_info.page_size)
+		/*
+		 * alignment is larger than page size - make sure alignment is
+		 * a multiple of page size
+		 */
+		mem->alignment = align;
+	else
+		/*
+		 * alignment is smaller than page size - make sure page size is
+		 * a multiple of alignment. Now round up alignment to one page
+		 */
+		mem->alignment = dm_tmpl->devmem_info.page_size;
+
+	/* Round size up to next multiple of physical pages */
+	if ((size % dm_tmpl->devmem_info.page_size) != 0)
+		mem->size = ((size / dm_tmpl->devmem_info.page_size)
+			+ 1) * dm_tmpl->devmem_info.page_size;
+	else
+		mem->size = size;
+
+	/* If the device virtual address was externally defined */
+	if (mem->ext_dev_virtaddr) {
+		res = IMG_ERROR_INVALID_PARAMETERS;
+		goto free_mem;
+	}
+
+	res = addr_cx_malloc_align_res(&dm_heap->ctx, "",
+				       (mem->size + dm_heap->guardband),
+				       mem->alignment,
+				       &ui64_dev_offset);
+
+	mem->dev_virtoffset = (unsigned int)ui64_dev_offset;
+	if (res != IMG_SUCCESS)
+		/*
+		 * If heap space is unavaliable return NULL, the caller must
+		 * handle this condition
+		 */
+		goto free_virt;
+
+	mutex_lock_nested(global_lock, SUBCLASS_TALMMU);
+
+	/*
+	 * Add memory allocation to the list for this heap...
+	 * If the heap is empty...
+	 */
+	if (lst_empty(&dm_heap->memory_list))
+		/*
+		 * Save flag to indicate whether the device virtual address
+		 * is allocated internally or externally...
+		 */
+		dm_heap->ext_dev_virtaddr = mem->ext_dev_virtaddr;
+
+	/*
+	 * Once we have started allocating in one way ensure that we continue
+	 * to do this...
+	 */
+	lst_add(&dm_heap->memory_list, mem);
+
+	mutex_unlock(global_lock);
+
+	*mem_hndl = mem;
+
+	return IMG_SUCCESS;
+
+free_virt:
+	addr_cx_free(&dm_heap->ctx, "", mem->dev_virtoffset);
+free_mem:
+	kfree(mem);
+
+	return res;
+}
+
+/*
+ * @Function	talmmu_devmem_addr_alloc
+ *
+ * @Description
+ *
+ * @Input
+ *
+ * @Output
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_addr_alloc(void *devmem_ctx_hndl,
+			     void *devmem_heap_hndl,
+			     unsigned int size,
+			     unsigned int align,
+			     void **mem_hndl)
+{
+	unsigned int res;
+	void *mem;
+
+	res = talmmu_devmem_alloc_nonmap(devmem_ctx_hndl,
+					 devmem_heap_hndl,
+					 size,
+					 align,
+					 0,
+					 0,
+					 &mem);
+	if (res != IMG_SUCCESS)
+		return res;
+
+	*mem_hndl = mem;
+
+	return IMG_SUCCESS;
+}
+
+/*
+ * @Function	talmmu_devmem_addr_free
+ *
+ * @Description	This function is used to free device memory allocated using
+ *		talmmu_devmem_addr_alloc().
+ *
+ * @Input	mem_hndl : Handle for the memory object
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_devmem_addr_free(void *mem_hndl)
+{
+	unsigned int res;
+
+	if (!mem_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	/* free device memory allocated by calling talmmu_devmem_free() */
+	res = talmmu_devmem_free(mem_hndl);
+
+	return res;
+}
+
+/*
+ * @Function	talmmu_get_dev_virt_addr
+ *
+ * @Description	This function is use to obtain the device (virtual) memory
+ *		address which may be required for as a device virtual address
+ *		in some of the TAL image functions
+ *
+ * @Input	mem_hndl : Handle for the memory object
+ *
+ * @Output	dev_virt: A piointer used to return the device virtual address
+ *
+ * @Return	IMG_SUCCESS or an error code
+ *
+ */
+int talmmu_get_dev_virt_addr(void *mem_hndl,
+			     unsigned int *dev_virt)
+{
+	struct talmmu_memory *mem = mem_hndl;
+	struct talmmu_devmem_heap *devmem_heap;
+
+	if (!mem_hndl)
+		return IMG_ERROR_INVALID_PARAMETERS;
+
+	devmem_heap = mem->devmem_heap;
+
+	/*
+	 * Device virtual address is addition of the specific device virtual
+	 * offset and the base device virtual address from the heap information
+	 */
+	*dev_virt = (devmem_heap->heap_info.basedev_virtaddr +
+		mem->dev_virtoffset);
+
+	return IMG_SUCCESS;
+}
diff --git a/drivers/staging/media/vxd/common/talmmu_api.h b/drivers/staging/media/vxd/common/talmmu_api.h
new file mode 100644
index 000000000000..f37f78394d54
--- /dev/null
+++ b/drivers/staging/media/vxd/common/talmmu_api.h
@@ -0,0 +1,246 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TAL MMU Extensions.
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
+#include "addr_alloc.h"
+#include "ra.h"
+#include "lst.h"
+
+#ifndef __TALMMU_API_H__
+#define __TALMMU_API_H__
+
+#define	TALMMU_MAX_DEVICE_HEAPS	(32)
+#define	TALMMU_MAX_TEMPLATES	(32)
+
+/* MMU type */
+enum talmmu_mmu_type {
+	/* 4kb pages and 32-bit address range */
+	TALMMU_MMUTYPE_4K_PAGES_32BIT_ADDR = 0x1,
+	/* variable size pages and 32-bit address */
+	TALMMU_MMUTYPE_VAR_PAGES_32BIT_ADDR,
+	/* 4kb pages and 36-bit address range */
+	TALMMU_MMUTYPE_4K_PAGES_36BIT_ADDR,
+	/* 4kb pages and 40-bit address range */
+	TALMMU_MMUTYPE_4K_PAGES_40BIT_ADDR,
+	/* variable size pages and 40-bit address range */
+	TALMMU_MMUTYPE_VP_40BIT,
+	TALMMU_MMUTYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Device flags */
+enum talmmu_dev_flags {
+	TALMMU_DEVFLAGS_NONE = 0x0,
+	TALMMU_DEVFLAGS_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Heap type */
+enum talmmu_heap_type {
+	TALMMU_HEAP_SHARED_EXPORTED,
+	TALMMU_HEAP_PERCONTEXT,
+	TALMMU_HEAP_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Heap flags */
+enum talmmu_eheapflags {
+	TALMMU_HEAPFLAGS_NONE = 0x0,
+	TALMMU_HEAPFLAGS_SET_CACHE_CONSISTENCY = 0x00000001,
+	TALMMU_HEAPFLAGS_128BYTE_INTERLEAVE = 0x00000002,
+	TALMMU_HEAPFLAGS_256BYTE_INTERLEAVE = 0x00000004,
+	TALMMU_HEAPFLAGS_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/* Contains the device memory information */
+struct talmmu_devmem_info {
+	/* device id */
+	unsigned int device_id;
+	/* mmu type */
+	enum talmmu_mmu_type mmu_type;
+	/* Device flags - bit flags that can be combined */
+	enum talmmu_dev_flags dev_flags;
+	/* Name of the memory space for page directory allocations */
+	unsigned char *pagedir_memspace_name;
+	/* Name of the memory space for page table allocations */
+	unsigned char *pagetable_memspace_name;
+	/* Page size in bytes */
+	unsigned int page_size;
+	/* PTD alignment, must be multiple of Page size */
+	unsigned int ptd_alignment;
+};
+
+struct talmmu_heap_info {
+	/* heap id */
+	unsigned int heap_id;
+	/* heap type */
+	enum talmmu_heap_type heap_type;
+	/* heap flags - bit flags that can be combined */
+	enum talmmu_eheapflags heap_flags;
+	/* Name of the memory space for memory allocations */
+	unsigned char *memspace_name;
+	/* Base device virtual address */
+	unsigned int basedev_virtaddr;
+	/* size in bytes */
+	unsigned int size;
+};
+
+/* Device memory template information */
+struct talmmu_dm_tmpl {
+	/* list */
+	struct lst_t list;
+	/* Copy of device memory info structure */
+	struct talmmu_devmem_info devmem_info;
+	/* Memory space ID for PTD allocations */
+	void *ptd_memspace_hndl;
+	/* Memory space ID for Page Table allocations */
+	void *ptentry_memspace_hndl;
+	/* number of heaps */
+	unsigned int num_heaps;
+	/* Array of heap pointers */
+	struct talmmu_devmem_heap *devmem_heap[TALMMU_MAX_DEVICE_HEAPS];
+	/* Number of active contexts */
+	unsigned int num_ctxs;
+	/* List of device memory context created from this template */
+	struct lst_t devmem_ctx_list;
+	/* Number of bits to shift right to obtain page number */
+	unsigned int page_num_shift;
+	/* Mask to extract byte-within-page */
+	unsigned int byte_in_pagemask;
+	/* Heap alignment */
+	unsigned int heap_alignment;
+	/* Page table entries/page */
+	unsigned int pagetable_entries_perpage;
+	/* Number of bits to shift right to obtain page table number */
+	unsigned int pagetable_num_shift;
+	/* Mask to extract index-within-page-table */
+	unsigned int index_in_pagetable_mask;
+	/* Number of bits to shift right to obtain page dir number */
+	unsigned int pagedir_num_shift;
+};
+
+/* Device memory heap information */
+struct talmmu_devmem_heap {
+	/* list item */
+	struct lst_t list;
+	/* Copy of the heap info structure */
+	struct talmmu_heap_info heap_info;
+	/* Pointer to the device memory template */
+	struct talmmu_dm_tmpl *devmem_template;
+	/* true if device virtual address offset allocated externally by user */
+	unsigned int ext_dev_virtaddr;
+	/* list of memory allocations */
+	struct lst_t memory_list;
+	/* Memory space ID for memory allocations */
+	void *memspace_hndl;
+	/* Address context structure */
+	struct addr_context ctx;
+	/* Regions structure */
+	struct addr_region regions;
+	/* size of heap guard band */
+	unsigned int guardband;
+};
+
+struct talmmu_devmem_ctx {
+	/* list item */
+	struct lst_t list;
+	/* Pointer to device template */
+	struct talmmu_dm_tmpl *devmem_template;
+	/* No. of heaps */
+	unsigned int num_heaps;
+	/* Array of heap pointers */
+	struct talmmu_devmem_heap *devmem_heap[TALMMU_MAX_DEVICE_HEAPS];
+	/* The MMU context id */
+	unsigned int mmu_ctx_id;
+	/* Pointer to the memory that represents Page directory */
+	unsigned int *pagedir;
+};
+
+struct talmmu_memory {
+	/* list item */
+	struct lst_t list;
+	/* Heap from which memory was allocated */
+	struct talmmu_devmem_heap *devmem_heap;
+	/* Context through which memory was allocated */
+	struct talmmu_devmem_ctx *devmem_ctx;
+	/* size */
+	unsigned int size;
+	/* alignment */
+	unsigned int alignment;
+	/* device virtual offset of allocation */
+	unsigned int dev_virtoffset;
+	/* true if device virtual address offset allocated externally by user */
+	unsigned int ext_dev_virtaddr;
+};
+
+/* This type defines the event types for the TALMMU callbacks */
+enum talmmu_event {
+	/* Function to flush the cache. */
+	TALMMU_EVENT_FLUSH_CACHE,
+	/*! Function to write the page directory address to the device */
+	TALMMU_EVENT_WRITE_PAGE_DIRECTORY_REF,
+	/* Placeholder*/
+	TALMMU_NO_OF_EVENTS
+};
+
+enum talmmu_heap_option_id {
+	/* Add guard band to all mallocs */
+	TALMMU_HEAP_OPT_ADD_GUARD_BAND,
+	TALMMU_HEAP_OPT_SET_MEM_ATTRIB,
+	TALMMU_HEAP_OPT_SET_MEM_POOL,
+
+	/* Placeholder */
+	TALMMU_NO_OF_OPTIONS,
+	TALMMU_NO_OF_FORCE32BITS = 0x7FFFFFFFU
+};
+
+struct talmmu_guardband_options {
+	unsigned int guardband;
+};
+
+union talmmu_heap_options {
+	/* Guardband parameters */
+	struct talmmu_guardband_options guardband_opt;
+};
+
+int talmmu_init(void);
+int talmmu_deinit(void);
+int talmmu_devmem_template_create(struct talmmu_devmem_info *devmem_info,
+				  void **devmem_template_hndl);
+int talmmu_devmem_heap_add(void *devmem_tmplt_hndl,
+			   struct talmmu_heap_info *heap_info_arg);
+int talmmu_devmem_template_destroy(void *devmem_tmplt_hndl);
+int talmmu_devmem_ctx_create(void *devmem_tmplt_hndl,
+			     unsigned int mmu_ctx_id,
+			     void **devmem_ctx_hndl);
+int talmmu_devmem_ctx_destroy(void *devmem_ctx_hndl);
+int talmmu_get_heap_handle(unsigned int hid,
+			   void *devmem_ctx_hndl,
+			   void **devmem_heap_hndl);
+/**
+ * talmmu_devmem_heap_empty - talmmu_devmem_heap_empty
+ * @devmem_heap_hndl: device memory heap handle
+ *
+ * This function is used for emptying the device memory heap list
+ */
+
+int talmmu_devmem_heap_empty(void *devmem_heap_hndl);
+void talmmu_devmem_heap_options(void *devmem_heap_hndl,
+				enum talmmu_heap_option_id heap_opt_id,
+				union talmmu_heap_options heap_options);
+int talmmu_devmem_addr_alloc(void *devmem_ctx_hndl,
+			     void *devmem_heap_hndl,
+			     unsigned int size,
+			     unsigned int align,
+			     void **mem_hndl);
+int talmmu_devmem_addr_free(void *mem_hndl);
+int talmmu_get_dev_virt_addr(void *mem_hndl,
+			     unsigned int *dev_virt);
+
+#endif /* __TALMMU_API_H__ */
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
