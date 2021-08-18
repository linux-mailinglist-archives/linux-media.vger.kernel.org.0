Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A1B3F0634
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239519AbhHROQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239658AbhHROOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:14:12 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E96C06124C
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:48 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d17so1847832plr.12
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lTn1tv+cdEEWthxb7x9eEJtLz7gLrC1ZYvDMpUK9UtU=;
        b=W7A9o60SXqg+Pm4Zvg+9FQMtg8rSHOBJI2nwglb095hB8O0O3ovYoar36huZ3ZbVvZ
         TQLyUwxaWhzDXaeI1n1otLRDy6oUnycYug+gRKjZ7iw8S1jiblO5z6p5QvmBnlffSwDI
         dsjUY/XVbsTIDJ8i+raMaLxYpb8iPt+QSBjsCeOx9skX44a/WLaXS8kSTuCThwkkooUa
         THYDlWbMfPdEMEqbmyQIOFHtF5vvISKphCjJkR8cDk5QAnNsQ+tOrB7YztWxiuYNcCmt
         cpCHGcsSdnDBirK1oYAfPtmy2zdgHsG39YaPq4GLdjjAgyvDb0vavVclE4BbUNvrjQMG
         BU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=lTn1tv+cdEEWthxb7x9eEJtLz7gLrC1ZYvDMpUK9UtU=;
        b=UhgifBVLYRCcJwV3YZj7cuA6ZAXz9gueFESsFkDdNsUvpJbleSwSCI8iEeopM4X9UC
         mK/XP7tGpnSrTqmKKNCmX5uoopSzogdi8mC1o/1fT/LLM2hqzndrU9zu8MtMQXoOCELK
         byjPEdrNlGgtSXcaNy4JcW7kbPiS6uXLuUkssrscvZE/QDe6rySeNQMq4rBDt6bC+icZ
         ERMOO1RW74mYFK/8djGLAVuVooQWP+82dDjgJtahAoD4JIAivMJCyt5yCy4OHcikyGyT
         y/m64B1Aj4dcPwysgBHXNYgg5hUl0D0Gl8JOidy15YUcXxnOELkf4D/XFqzEaDKK7rPA
         biCw==
MIME-Version: 1.0
X-Gm-Message-State: AOAM532CETmJCD4x8AHYaeXIEah0DeseFwVtgI6aiCVoURkAeR/3J/pr
        NHfujGgfaPo5EkqwofgHJJ/tTrtRS9tBgJKqTcb1RRg+NRzd6vaxwHDcmnXonRb3pBNeWA0CEE3
        wQZr23fBUplMnt7cW
X-Google-Smtp-Source: ABdhPJzWE4IEG6p1dUMaTevQk3xKy4dKqZZPdBdTIF+8HzvDBttle5+iDu25KKfVjahs11LvahUa9w==
X-Received: by 2002:a17:90a:c8b:: with SMTP id v11mr9330341pja.114.1629295967576;
        Wed, 18 Aug 2021 07:12:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:47 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 16/30] v4l: vxd-dec: Add pool api modules
Date:   Wed, 18 Aug 2021 19:40:23 +0530
Message-Id: <20210818141037.19990-17-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

This patch create and destroy the pool of the resources
and it manages the allocation and free of the resources.

Signed-off-by: Amit Makani <amit.makani@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                 |   2 +
 drivers/staging/media/vxd/common/pool_api.c | 709 ++++++++++++++++++++
 drivers/staging/media/vxd/common/pool_api.h | 113 ++++
 3 files changed, 824 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/pool_api.c
 create mode 100644 drivers/staging/media/vxd/common/pool_api.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a00ac0852b2a..f7e55791f355 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19556,6 +19556,8 @@ F:	drivers/staging/media/vxd/common/lst.c
 F:	drivers/staging/media/vxd/common/lst.h
 F:	drivers/staging/media/vxd/common/pool.c
 F:	drivers/staging/media/vxd/common/pool.h
+F:	drivers/staging/media/vxd/common/pool_api.c
+F:	drivers/staging/media/vxd/common/pool_api.h
 F:	drivers/staging/media/vxd/common/ra.c
 F:	drivers/staging/media/vxd/common/ra.h
 F:	drivers/staging/media/vxd/common/talmmu_api.c
diff --git a/drivers/staging/media/vxd/common/pool_api.c b/drivers/staging/media/vxd/common/pool_api.c
new file mode 100644
index 000000000000..68d960a687da
--- /dev/null
+++ b/drivers/staging/media/vxd/common/pool_api.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Resource pool manager API.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
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
+#include <linux/types.h>
+
+#include "idgen_api.h"
+#include "lst.h"
+#include "pool_api.h"
+
+/*
+ * list can be modified by different instances. So please,
+ * make sure to acquire mutex lock before initializing the list.
+ */
+static struct mutex *shared_res_mutex_handle;
+
+/*
+ * Max resource ID's.
+ */
+#define POOL_IDGEN_MAX_ID	   (0xFFFFFFFF)
+/*
+ * Size of blocks used for ID's.
+ */
+#define POOL_IDGEN_BLOCK_SIZE  (50)
+
+/*
+ * Indicates if the pool API has been indialized or not.
+ * zero if not done. 1 if done.
+ */
+static int poolinitdone;
+
+/* list of resource pool */
+static struct lst_t poollist = {0};
+
+/**
+ * struct poollist - Structure contains resource list information.
+ * @link: to be able to part of single linked list
+ * @pool_mutex: lock
+ * @freereslst: list of free resource structure
+ * @actvreslst: list of active resource structure
+ * @pfnfree: pool free callback function
+ * @idgenhandle: ID generator context handl
+ */
+struct poollist {
+	void **link;
+	struct mutex *pool_mutex; /* Mutex lock */
+	struct lst_t freereslst;
+	struct lst_t actvreslst;
+	pfrecalbkpntr pfnfree;
+	void *idgenhandle;
+};
+
+/*
+ * This structure contains pool resource.
+ */
+struct poolres {
+	void **link; /* to be able to part of single linked list */
+	/* Resource id */
+	unsigned int resid;
+	/* Pointer to destructor function */
+	pdestcallbkptr desfunc;
+	/* resource param */
+	void *resparam;
+	/* size of resource param in bytes */
+	unsigned int resparmsize;
+	/* pointer to resource pool list */
+	struct poollist *respoollst;
+	/* 1 if this is a clone of the original resource */
+	int isclone;
+	/* pointer to original resource */
+	struct poolres *origres;
+	/* list of cloned resource structures. Only used on the original */
+	struct lst_t clonereslst;
+	/* reference count. Only used on the original resource */
+	unsigned int refcnt;
+	void *cb_handle;
+};
+
+/*
+ * This function initializes the list if not done earlier.
+ */
+int pool_init(void)
+{
+	/* Check if list already initialized */
+	if (!poolinitdone) {
+		/*
+		 * list can be modified by different instances. So please,
+		 * make sure to acquire mutex lock before initializing the list.
+		 */
+
+		shared_res_mutex_handle = kzalloc(sizeof(*shared_res_mutex_handle), GFP_KERNEL);
+		if (!shared_res_mutex_handle)
+			return -ENOMEM;
+
+		mutex_init(shared_res_mutex_handle);
+
+		/* initialize the list of pools */
+		lst_init(&poollist);
+		/* Get initialized flag to true */
+		poolinitdone = 1;
+	}
+
+	return 0;
+}
+
+/*
+ * This function de-initializes the list.
+ */
+void pool_deinit(void)
+{
+	struct poollist *respoollist;
+
+	/* Check if list initialized */
+	if (poolinitdone) {
+		/* destroy any active pools */
+		respoollist = (struct poollist *)lst_first(&poollist);
+		while (respoollist) {
+			pool_destroy(respoollist);
+			respoollist = (struct poollist *)lst_first(&poollist);
+		}
+
+		/* Destroy mutex */
+		mutex_destroy(shared_res_mutex_handle);
+		kfree(shared_res_mutex_handle);
+		shared_res_mutex_handle = NULL;
+
+		/* set initialized flag to 0 */
+		poolinitdone = 0;
+	}
+}
+
+/*
+ * This function creates pool.
+ */
+int pool_api_create(void **poolhndle)
+{
+	struct poollist *respoollist;
+	unsigned int result = 0;
+
+	/* Allocate a pool structure */
+	respoollist = kzalloc(sizeof(*respoollist), GFP_KERNEL);
+	if (!respoollist)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	/* Initialize the pool info */
+	lst_init(&respoollist->freereslst);
+	lst_init(&respoollist->actvreslst);
+
+	/* Create mutex */
+	respoollist->pool_mutex = kzalloc(sizeof(*respoollist->pool_mutex), GFP_KERNEL);
+	if (!respoollist->pool_mutex) {
+		result = ENOMEM;
+		goto error_create_context;
+	}
+	mutex_init(respoollist->pool_mutex);
+
+	/* Create context for the Id generator */
+	result = idgen_createcontext(POOL_IDGEN_MAX_ID,
+				     POOL_IDGEN_BLOCK_SIZE, 0,
+				     &respoollist->idgenhandle);
+	if (result != IMG_SUCCESS)
+		goto error_create_context;
+
+	/* Disable interrupts */
+	mutex_lock_nested(shared_res_mutex_handle, SUBCLASS_POOL_RES);
+
+	/* Add to list of pools */
+	lst_add(&poollist, respoollist);
+
+	/* Enable interrupts */
+	mutex_unlock(shared_res_mutex_handle);
+
+	/* Return handle to pool */
+	*poolhndle = respoollist;
+
+	return IMG_SUCCESS;
+
+	/* Error handling. */
+error_create_context:
+	kfree(respoollist);
+
+	return result;
+}
+
+/*
+ * This function destroys the pool.
+ */
+int pool_destroy(void *poolhndle)
+{
+	struct poollist *respoollist = poolhndle;
+	struct poolres *respool;
+	struct poolres *clonerespool;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respoollist) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto	error_nolock;
+	}
+
+	/* Lock the pool */
+	mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+	/* Disable interrupts */
+	/*
+	 * We need to check if we really need to check disable,
+	 * interrupts because before deleting we need to make sure the
+	 * pool lst is not being used other process. As of now getting ipl
+	 * global mutex
+	 */
+	mutex_lock_nested(shared_res_mutex_handle, SUBCLASS_POOL_RES);
+
+	/* Remove the pool from the active list */
+	lst_remove(&poollist, respoollist);
+
+	/* Enable interrupts */
+	mutex_unlock(shared_res_mutex_handle);
+
+	/* Destroy any resources in the free list */
+	respool = (struct poolres *)lst_removehead(&respoollist->freereslst);
+	while (respool) {
+		respool->desfunc(respool->resparam, respool->cb_handle);
+		kfree(respool);
+		respool = (struct poolres *)
+				lst_removehead(&respoollist->freereslst);
+	}
+
+	/* Destroy any resources in the active list */
+	respool = (struct poolres *)lst_removehead(&respoollist->actvreslst);
+	while (respool) {
+		clonerespool = (struct poolres *)
+				lst_removehead(&respool->clonereslst);
+		while (clonerespool) {
+			/*
+			 * If we created a copy of the resources pvParam
+			 * then free it.
+			 * kfree(NULL) is safe and this check is probably not
+			 * required
+			 */
+			kfree(clonerespool->resparam);
+
+			kfree(clonerespool);
+			clonerespool = (struct poolres *)
+					lst_removehead(&respool->clonereslst);
+		}
+
+		/* Call the resource destructor */
+		respool->desfunc(respool->resparam, respool->cb_handle);
+		kfree(respool);
+		respool = (struct poolres *)
+				lst_removehead(&respoollist->actvreslst);
+	}
+	/* Destroy the context for the Id generator */
+	if (respoollist->idgenhandle)
+		result = idgen_destroycontext(respoollist->idgenhandle);
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+	/* Destroy mutex */
+	mutex_destroy(respoollist->pool_mutex);
+	kfree(respoollist->pool_mutex);
+	respoollist->pool_mutex = NULL;
+
+	/* Free the pool structure */
+	kfree(respoollist);
+
+	return IMG_SUCCESS;
+
+error_nolock:
+	return result;
+}
+
+int pool_setfreecalbck(void *poolhndle, pfrecalbkpntr pfnfree)
+{
+	struct poollist *respoollist = poolhndle;
+	struct poolres *respool;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respoollist) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error_nolock;
+	}
+
+	/* Lock the pool */
+	mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+	respoollist->pfnfree = pfnfree;
+
+	/* If free callback set */
+	if (respoollist->pfnfree) {
+		/* Move resources from free to active list */
+		respool = (struct poolres *)
+				lst_removehead(&respoollist->freereslst);
+		while (respool) {
+			/* Add to active list */
+			lst_add(&respoollist->actvreslst, respool);
+			respool->refcnt++;
+
+			/* Unlock the pool */
+			mutex_unlock(respoollist->pool_mutex);
+
+			/* Call the free callback */
+			respoollist->pfnfree(respool->resid, respool->resparam);
+
+			/* Lock the pool */
+			mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+			/* Get next free resource */
+			respool = (struct poolres *)
+				lst_removehead(&respoollist->freereslst);
+		}
+	}
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+	/* Return IMG_SUCCESS */
+	return IMG_SUCCESS;
+
+error_nolock:
+	return result;
+}
+
+int pool_resreg(void *poolhndle, pdestcallbkptr fndestructor,
+		void *resparam, unsigned int resparamsize,
+		int balloc, unsigned int *residptr,
+		void **poolreshndle, void *cb_handle)
+{
+	struct poollist *respoollist = poolhndle;
+	struct poolres *respool;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respoollist) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto	error_nolock;
+	}
+
+	/* Allocate a resource structure */
+	respool = kzalloc(sizeof(*respool), GFP_KERNEL);
+	if (!respool)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	/* Setup the resource */
+	respool->desfunc  = fndestructor;
+	respool->cb_handle = cb_handle;
+	respool->resparam = resparam;
+	respool->resparmsize = resparamsize;
+	respool->respoollst = respoollist;
+	lst_init(&respool->clonereslst);
+
+	/* Lock the pool */
+	mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+	/* Set resource id */
+	result = idgen_allocid(respoollist->idgenhandle,
+			       (void *)respool, &respool->resid);
+	if (result != IMG_SUCCESS) {
+		kfree(respool);
+		/* Unlock the pool */
+		mutex_unlock(respoollist->pool_mutex);
+		return result;
+	}
+
+	/* If allocated or free callback not set */
+	if (balloc || respoollist->pfnfree) {
+		/* Add to active list */
+		lst_add(&respoollist->actvreslst, respool);
+		respool->refcnt++;
+	} else {
+		/* Add to free list */
+		lst_add(&respoollist->freereslst, respool);
+	}
+
+	/* Return the resource id */
+	if (residptr)
+		*residptr = respool->resid;
+
+	/* Return the handle to the resource */
+	if (poolreshndle)
+		*poolreshndle = respool;
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+	/* If free callback set */
+	if (respoollist->pfnfree) {
+		/* Call the free callback */
+		respoollist->pfnfree(respool->resid, respool->resparam);
+	}
+
+	/* Return IMG_SUCCESS */
+	return IMG_SUCCESS;
+
+error_nolock:
+	return result;
+}
+
+int pool_resdestroy(void *poolreshndle, int bforce)
+{
+	struct poolres *respool = poolreshndle;
+	struct poollist *respoollist;
+	struct poolres *origrespool;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respool) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error_nolock;
+	}
+
+	respoollist = respool->respoollst;
+
+	/* If this is a clone */
+	if (respool->isclone) {
+		/* Get access to the original */
+		origrespool = respool->origres;
+		if (!origrespool) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			goto error_nolock;
+		}
+
+		if (origrespool->isclone) {
+			result = IMG_ERROR_UNEXPECTED_STATE;
+			goto error_nolock;
+		}
+
+		/* Remove from the clone list */
+		lst_remove(&origrespool->clonereslst, respool);
+
+		/* Free resource id */
+		result = idgen_freeid(respoollist->idgenhandle,
+				      respool->resid);
+		if (result != IMG_SUCCESS)
+			return result;
+
+		/*
+		 * If we created a copy of the resources pvParam then free it
+		 * kfree(NULL) is safe and this check is probably not required.
+		 */
+		kfree(respool->resparam);
+
+		/* Free the clone resource structure */
+		kfree(respool);
+
+		/* Set resource to be "freed" to the original */
+		respool = origrespool;
+	}
+
+	/* If there are still outstanding references */
+	if (!bforce && respool->refcnt != 0) {
+		/*
+		 * We may need to mark the resource and destroy it when
+		 * there are no outstanding references
+		 */
+		return IMG_SUCCESS;
+	}
+
+	/* Has the resource outstanding references */
+	if (respool->refcnt != 0) {
+		/* Remove the resource from the active list */
+		lst_remove(&respoollist->actvreslst, respool);
+	} else {
+		/* Remove the resource from the free list */
+		lst_remove(&respoollist->freereslst, respool);
+	}
+
+	/* Free resource id */
+	result = idgen_freeid(respoollist->idgenhandle,
+			      respool->resid);
+	if (result != IMG_SUCCESS)
+		return result;
+
+	/* Call the resource destructor */
+	respool->desfunc(respool->resparam, respool->cb_handle);
+	kfree(respool);
+
+	return IMG_SUCCESS;
+
+error_nolock:
+	return result;
+}
+
+int pool_resalloc(void *poolhndle, void *poolreshndle)
+{
+	struct poollist *respoollist = poolhndle;
+	struct poolres *respool = poolreshndle;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respoollist || !poolreshndle) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error_nolock;
+	}
+
+	/* Lock the pool */
+	mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+	/* Remove resource from free list */
+	lst_remove(&respoollist->freereslst, respool);
+
+	/* Add to active list */
+	lst_add(&respoollist->actvreslst, respool);
+	respool->refcnt++;
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+	/* Return IMG_SUCCESS */
+	return IMG_SUCCESS;
+
+error_nolock:
+	return result;
+}
+
+int pool_resfree(void *poolreshndle)
+{
+	struct poolres *respool = poolreshndle;
+	struct poollist *respoollist;
+	struct poolres *origrespool;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respool) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error_nolock;
+	}
+
+	respoollist = respool->respoollst;
+
+	/* Lock the pool */
+	mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+	/* If this is a clone */
+	if (respool->isclone) {
+		/* Get access to the original */
+		origrespool = respool->origres;
+		if (!origrespool) {
+			mutex_unlock(respoollist->pool_mutex);
+			return IMG_ERROR_INVALID_PARAMETERS;
+		}
+
+		/* Remove from the clone list */
+		lst_remove(&origrespool->clonereslst, respool);
+
+		/* Free resource id */
+		result = idgen_freeid(respoollist->idgenhandle,
+				      respool->resid);
+		if (result != IMG_SUCCESS) {
+			/* Unlock the pool */
+			mutex_unlock(respoollist->pool_mutex);
+			return result;
+		}
+
+		/*
+		 * If we created a copy of the resources pvParam then free it
+		 * kfree(NULL) is safe and this check is probably not required.
+		 */
+		kfree(respool->resparam);
+
+		/* Free the clone resource structure */
+		kfree(respool);
+
+		/* Set resource to be "freed" to the original */
+		respool = origrespool;
+	}
+
+	/* Update the reference count */
+	respool->refcnt--;
+
+	/* If there are still outstanding references */
+	if (respool->refcnt != 0) {
+		/* Unlock the pool */
+		mutex_unlock(respoollist->pool_mutex);
+		/* Return IMG_SUCCESS */
+		return IMG_SUCCESS;
+	}
+
+	/* Remove the resource from the active list */
+	lst_remove(&respoollist->actvreslst, respool);
+
+	/* If free callback set */
+	if (respoollist->pfnfree) {
+		/* Add to active list */
+		lst_add(&respoollist->actvreslst, respool);
+		respool->refcnt++;
+	} else {
+		/* Add to free list */
+		lst_add(&respoollist->freereslst, respool);
+	}
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+	/* If free callback set */
+	if (respoollist->pfnfree) {
+		/* Call the free callback */
+		respoollist->pfnfree(respool->resid, respool->resparam);
+	}
+
+	/* Return IMG_SUCCESS */
+	return IMG_SUCCESS;
+
+error_nolock:
+	return result;
+}
+
+int pool_resclone(void *poolreshndle, void **clonereshndle, void **resparam)
+{
+	struct poolres *respool = poolreshndle;
+	struct poollist *respoollist;
+	struct poolres *origrespool = respool;
+	struct poolres *clonerespool;
+	unsigned int result = 0;
+
+	if (!poolinitdone || !respool) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error_nolock;
+	}
+
+	/* Allocate a resource structure */
+	clonerespool = kzalloc(sizeof(*clonerespool), GFP_KERNEL);
+	if (!clonerespool)
+		return IMG_ERROR_OUT_OF_MEMORY;
+
+	respoollist = respool->respoollst;
+	if (!respoollist)
+		return IMG_ERROR_FATAL;
+
+	/* Lock the pool */
+	mutex_lock_nested(respoollist->pool_mutex, SUBCLASS_POOL);
+
+	/* Set resource id */
+	result = idgen_allocid(respoollist->idgenhandle,
+			       (void *)clonerespool, &clonerespool->resid);
+	if (result != IMG_SUCCESS)
+		goto error_alloc_id;
+
+	/* If this is a clone, set the original */
+	if (respool->isclone)
+		origrespool = respool->origres;
+
+	/* Setup the cloned resource */
+	clonerespool->isclone = 1;
+	clonerespool->respoollst = respoollist;
+	clonerespool->origres = origrespool;
+
+	/* Add to clone list */
+	lst_add(&origrespool->clonereslst, clonerespool);
+	origrespool->refcnt++;
+
+	/* If ppvParam is not IMG_NULL */
+	if (resparam) {
+		/* If the size of the original vParam is 0 */
+		if (origrespool->resparmsize == 0) {
+			*resparam = NULL;
+		} else {
+			/* Allocate memory for a copy of the original vParam */
+			/*
+			 * kmemdup allocates memory of length
+			 * origrespool->resparmsize and to resparam and copy
+			 * origrespool->resparam to resparam of the allocated
+			 * length
+			 */
+			*resparam = kmemdup(origrespool->resparam,
+					    origrespool->resparmsize,
+					    GFP_KERNEL);
+			if (!(*resparam)) {
+				result = IMG_ERROR_OUT_OF_MEMORY;
+				goto error_copy_param;
+			}
+		}
+	}
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+	/* Return the cloned resource */
+	*clonereshndle = clonerespool;
+
+	/* Return IMG_SUCCESS */
+	return IMG_SUCCESS;
+
+	/* Error handling. */
+error_copy_param:
+	lst_remove(&origrespool->clonereslst, clonerespool);
+	origrespool->refcnt--;
+error_alloc_id:
+	kfree(clonerespool);
+
+	/* Unlock the pool */
+	mutex_unlock(respoollist->pool_mutex);
+
+error_nolock:
+	return result;
+}
diff --git a/drivers/staging/media/vxd/common/pool_api.h b/drivers/staging/media/vxd/common/pool_api.h
new file mode 100644
index 000000000000..1e7803abb715
--- /dev/null
+++ b/drivers/staging/media/vxd/common/pool_api.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Resource pool manager API.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ */
+#ifndef __POOLAPI_H__
+#define __POOLAPI_H__
+
+#include "img_errors.h"
+#include "lst.h"
+
+/*
+ * This is the prototype for "free" callback functions.  This function
+ * is called when resources are returned to the pools list of free resources.
+ * NOTE: The "freed" resource is then allocated and passed to the callback
+ * function.
+ */
+typedef void (*pfrecalbkpntr)(unsigned int ui32resid, void *resparam);
+
+/*
+ * This is the prototype for "destructor" callback functions.  This function
+ * is called when a resource registered with the resource pool manager is to
+ * be destroyed.
+ */
+typedef void (*pdestcallbkptr)(void *resparam, void *cb_handle);
+
+/*
+ * pool_init - This function is used to initializes the resource pool manager component
+ * and should be called at start-up.
+ */
+int pool_init(void);
+
+/*
+ * This function is used to deinitialises the resource pool manager component
+ * and would normally be called at shutdown.
+ */
+void pool_deinit(void);
+
+/*
+ * This function is used to create a resource pool into which resources can be
+ * placed.
+ */
+int pool_api_create(void **poolhndle);
+
+/*
+ * This function is used to destroy a resource pool.
+ * NOTE: Destroying a resource pool destroys all of the resources within the
+ * pool by calling the associated destructor function #POOL_pfnDestructor
+ * defined when the resource what registered using POOL_ResRegister().
+ *
+ * NOTE: All of the pools resources must be in the pools free list - the
+ * allocated list must be empty.
+ */
+int pool_destroy(void *poolhndle);
+
+/*
+ * This function is used to set or remove a free callback function on a pool.
+ * The free callback function gets call for any resources already in the
+ * pools free list or for any resources that subsequently get freed.
+ * NOTE: The resource passed to the callback function has been allocated before
+ * the callback is made.
+ */
+int pool_setfreecalbck(void *poolhndle, pfrecalbkpntr pfnfree);
+
+/*
+ * This function is used to register a resource within a resource pool.  The
+ * resource is added to the pools allocated or free list based on the value
+ * of bAlloc.
+ */
+int pool_resreg(void *poolhndle, pdestcallbkptr fndestructor,
+		void *resparam, unsigned int resparamsize,
+		int balloc, unsigned int *residptr,
+		void **poolreshndle, void *cb_handle);
+
+/*
+ * This function is used to destroy a resource.
+ */
+int pool_resdestroy(void *poolreshndle, int bforce);
+
+/*
+ * This function is used to get/allocate a resource from a pool.  This moves
+ * the resource from the free to allocated list.
+ */
+int pool_resalloc(void *poolhndle, void *poolreshndle);
+
+/*
+ * This function is used to free a resource and return it to the pools lists of
+ * free resources.
+ * NOTE: The resources is only moved to the free list when all references to
+ * the resource have been freed.
+ */
+int pool_resfree(void *poolreshndle);
+
+/*
+ * This function is used to clone a resource - this creates an additional
+ * reference to the resource.
+ * NOTE: The resources is only moved to the free list when all references to
+ * the resource have been freed.
+ * NOTE: If this function is used to clone the resource's pvParam data then
+ * the clone of the data is freed when the clone of the resource is freed.
+ * The resource destructor is NOT used for this - simply an IMG_FREE.
+ */
+int pool_resclone(void *poolreshndle, void **clonereshndle, void **resparam);
+
+#endif /* __POOLAPI_H__ */
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
