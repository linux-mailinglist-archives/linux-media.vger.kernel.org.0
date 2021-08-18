Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EEC3F061D
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239815AbhHROPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239882AbhHROOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:14:46 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBAAC061144
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j1so2680950pjv.3
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e9GS0XtdqE8onjLTy3tFzyTTcz/8B/KCJITKycaxTxM=;
        b=qmGh5Q49c/CBMN9o7bX9j2uFy6YKzLYfKIWsNtDkxrfDvlzReGZrmPoZFqz8wgFyDf
         4JHTcVnvsI9FipYhOGvVd3yx5G2P6S1AnNBLhdQw7T5a/rgDOWrn3G3yzHaEjUsLd8dn
         BL/TSxHk5zwzXDtn1wPuEqVTRWjDRX4Jc6nY1RYLToReuyQAa/O0MrzfbsF4LWb67rkz
         acXfUfBLKYuWyQ8NJD8XgOaYerC+1opWM+Nz2LOaFhK8xMmw8YSFuIG5MaqjZQ6YZQJ9
         2hYjVtg9ulWPEblDCzhYiMra2ndUxgx4i6wzNchqCS6+OGh4VOzGvc/fjs1qrpH5B7hJ
         uLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=e9GS0XtdqE8onjLTy3tFzyTTcz/8B/KCJITKycaxTxM=;
        b=W4aXkpFbYdStD00FfaZtY8h6B+RmCGQvpRvpUq3uozX7pe8G0JNE3TBZAib8ocyF7e
         RM+pAbc4BgnGiNI65Wmek2WZovbQ2f9kAAmuf2itvyRalIzFkAFZtJVv+/Au5hxMEN/a
         a1IcioVEYBzwWJjhP6gy19+JUEbtn50UlBhTMSIxOilfgN7qP/ypqcyQQSRjWjnRVpyo
         gntGEztlh9tB4FzBA1RWZLTZXSc5HpFzTE0pKkfLJs5lpFfT1M2suKZSKJfroC4PIvYk
         VC2opyweTTfhpdSJOjePj1JY1n07Pd/CYrhdKPU4ySO9CfAuYMMLQrSQPXE4L6yQYEGm
         N1JA==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531Q9oXBiYG5gKgP/ObLJzfDaFnEjqp7WFHRlznFlZw/RbSjIZLJ
        DtU9HaFUbQbSRZAjV1EQiVGOkxHRFWs0/27yWVQzdPrTdeBb770nn0Ck4ztBYv/CaOHgKlLLe8W
        g7cu+/tMrfivug7dI
X-Google-Smtp-Source: ABdhPJxDLFV8kG1DK6WWrR+jCjpXErGYLzqT9VKPrbh+EBvdK/cWFFFpyvwmkJDM6N8Ca5ZIeWxbiw==
X-Received: by 2002:a17:902:7c87:b029:12c:8f2d:4238 with SMTP id y7-20020a1709027c87b029012c8f2d4238mr7559912pll.50.1629295994113;
        Wed, 18 Aug 2021 07:13:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:13:13 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 24/30] v4l:vxd-dec: Add resource manager
Date:   Wed, 18 Aug 2021 19:40:31 +0530
Message-Id: <20210818141037.19990-25-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

This module handles the resources which is added to list
and return the resource based requested list.

Signed-off-by: Amit Makani <amit.makani@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                 |   2 +
 drivers/staging/media/vxd/common/resource.c | 576 ++++++++++++++++++++
 drivers/staging/media/vxd/common/resource.h |  66 +++
 3 files changed, 644 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/resource.c
 create mode 100644 drivers/staging/media/vxd/common/resource.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c7c008efd97..b5875f9015ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19560,6 +19560,8 @@ F:	drivers/staging/media/vxd/common/pool_api.c
 F:	drivers/staging/media/vxd/common/pool_api.h
 F:	drivers/staging/media/vxd/common/ra.c
 F:	drivers/staging/media/vxd/common/ra.h
+F:	drivers/staging/media/vxd/common/resource.c
+F:	drivers/staging/media/vxd/common/resource.h
 F:	drivers/staging/media/vxd/common/rman_api.c
 F:	drivers/staging/media/vxd/common/rman_api.h
 F:	drivers/staging/media/vxd/common/talmmu_api.c
diff --git a/drivers/staging/media/vxd/common/resource.c b/drivers/staging/media/vxd/common/resource.c
new file mode 100644
index 000000000000..c3dd6d010d73
--- /dev/null
+++ b/drivers/staging/media/vxd/common/resource.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VXD DEC Resource manager implementations
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Sunita Nadampalli <sunitan@ti.com>
+ *
+ * Re-written for upstream
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#include <linux/types.h>
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "dq.h"
+#include "img_errors.h"
+#include "lst.h"
+#include "resource.h"
+
+struct resource_list_elem {
+	struct dq_linkage_t	link;
+	void *item;
+	unsigned int id;
+	unsigned int *refcnt;
+};
+
+/*
+ * marks an item as used by incrementing the reference count
+ */
+int resource_item_use(unsigned int *refcnt)
+{
+	if (refcnt)
+		(*refcnt)++;
+
+	return 0;
+}
+
+/*
+ * returns an item by decrementing the reference count
+ */
+void resource_item_return(unsigned int *refcnt)
+{
+	if (refcnt && *refcnt > 0)
+		(*refcnt)--;
+}
+
+/*
+ * releases an item by setting reference count to 1 (original owner)
+ */
+int resource_item_release(unsigned int *refcnt)
+{
+	if (refcnt)
+		*refcnt = 1;
+
+	return 0;
+}
+
+/*
+ * indicates whether an item is free to be used (no owners)
+ */
+int resource_item_isavailable(unsigned int *refcnt)
+{
+	if (refcnt)
+		return (*refcnt == 0) ? 1 : 0;
+	else
+		return 0;
+}
+
+/*
+ * adds an item (and associated id) to a resource list
+ */
+int resource_list_add_img(struct lst_t *list, void *item, unsigned int id, unsigned int *refcnt)
+{
+	struct resource_list_elem *listelem = NULL;
+	int bfound = 0;
+	unsigned int result = 0;
+
+	if (!list || !item) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error;
+	}
+
+	/*
+	 * Decrement the reference count on the item
+	 * to signal that the owner has relinquished it.
+	 */
+	resource_item_return(refcnt);
+
+	/*
+	 *  Determine whether this buffer is already in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (listelem->item == item) {
+			bfound = 1;
+			break;
+		}
+
+		listelem = lst_next(listelem);
+	}
+
+	if (!bfound) {
+		/*
+		 * allocate the image buffer list element structure.
+		 */
+		listelem = kmalloc(sizeof(*(listelem)), GFP_KERNEL);
+		if (!listelem) {
+			result = IMG_ERROR_OUT_OF_MEMORY;
+			goto error;
+		}
+		memset(listelem, 0, sizeof(*(listelem)));
+
+		/*
+		 * setup the list element.
+		 */
+		listelem->item = item;
+		listelem->id = id;
+		listelem->refcnt = refcnt;
+
+		/*
+		 * add the element to the list.
+		 */
+		lst_add(list, (void *)listelem);
+	}
+
+	return 0;
+
+error:
+	return result;
+}
+
+/*
+ * obtains pointer to item at head of resource list
+ */
+void *resource_list_pickhead(struct lst_t *list)
+{
+	struct resource_list_elem *listelem = NULL;
+	void *item = NULL;
+
+	if (!list)
+		goto error;
+	/*
+	 * peek the head item of the list.
+	 */
+	listelem = lst_first(list);
+	if (listelem)
+		item = listelem->item;
+
+error:
+	return item;
+}
+
+/*
+ * removes item from resource list
+ */
+int resource_list_remove(struct lst_t *list, void *item)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int result = 0;
+
+	if (!list || !item) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error;
+	}
+
+	/*
+	 * find the specified item in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (listelem->item == item) {
+			if (*listelem->refcnt != 0)
+				pr_warn("item remove from list still in use\n");
+
+			/*
+			 * Remove the item from the list.
+			 */
+			lst_remove(list, listelem);
+			/*
+			 * Free the stream unit queue element.
+			 */
+			kfree(listelem);
+			listelem = NULL;
+			return 0;
+		}
+
+		listelem = lst_next(listelem);
+	}
+
+#if defined(DEBUG_DECODER_DRIVER) || defined(DEBUG_ENCODER_DRIVER)
+	pr_info("item could not be located to remove from RESOURCE list\n");
+#endif
+
+	return IMG_ERROR_COULD_NOT_OBTAIN_RESOURCE;
+
+error:
+	return result;
+}
+
+/*
+ * resource_list_removehead - removes item at head of resource list
+ * @list: head of resource list
+ */
+void *resource_list_removehead(struct lst_t *list)
+{
+	struct resource_list_elem *listelem = NULL;
+	void *item = NULL;
+
+	if (!list)
+		goto error;
+
+	/*
+	 * peek the head item of the list.
+	 */
+	listelem = lst_removehead(list);
+	if (listelem) {
+		item = listelem->item;
+		kfree(listelem);
+		listelem = NULL;
+	}
+
+error:
+	return item;
+}
+
+/*
+ * removes next available item from resource list.
+ * item is freed if no longer used
+ */
+int resource_list_remove_nextavail(struct lst_t *list,
+				   resource_pfn_freeitem fn_freeitem,
+				   void *free_cb_param)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int result = IMG_ERROR_COULD_NOT_OBTAIN_RESOURCE;
+
+	if (!list) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error;
+	}
+
+	/*
+	 * find the next unused item in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (resource_item_isavailable(listelem->refcnt)) {
+			resource_item_return(listelem->refcnt);
+
+			if (*listelem->refcnt == 0) {
+				if (fn_freeitem)
+					fn_freeitem(listelem->item, free_cb_param);
+				else
+					kfree(listelem->item);
+
+				listelem->item = NULL;
+			}
+
+			/*
+			 * get the next element from the list.
+			 */
+			lst_remove(list, listelem);
+
+			/*
+			 * free the buffer list element.
+			 */
+			kfree(listelem);
+			listelem = NULL;
+
+			result = 0;
+			break;
+		}
+
+		listelem = lst_next(listelem);
+	}
+
+	if (result == IMG_ERROR_COULD_NOT_OBTAIN_RESOURCE)
+		pr_debug("failed to locate an available resource element to remove\n");
+
+error:
+	return result;
+}
+
+/*
+ * obtains pointer to an available item from the resource list
+ */
+void *resource_list_get_avail(struct lst_t *list)
+{
+	struct resource_list_elem *listelem = NULL;
+	void *item = NULL;
+
+	if (!list)
+		goto error;
+
+	/*
+	 * find the next unused item in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (resource_item_isavailable(listelem->refcnt)) {
+			resource_item_use(listelem->refcnt);
+			item = listelem->item;
+			break;
+		}
+		listelem = lst_next(listelem);
+	}
+
+error:
+	return item;
+}
+
+/*
+ * signal duplicate use of specified item with resource list
+ */
+void *resource_list_reuseitem(struct lst_t *list, void *item)
+{
+	struct resource_list_elem *listelem = NULL;
+	void *ret_item  = NULL;
+
+	if (!list || !item)
+		goto error;
+
+	/*
+	 * find the specified item in the list.
+	 */
+	listelem = lst_first(list);
+
+	while (listelem) {
+		if (listelem->item == item) {
+			resource_item_use(listelem->refcnt);
+			ret_item = item;
+			break;
+		}
+
+		listelem = lst_next(listelem);
+	}
+
+error:
+	return ret_item;
+}
+
+/*
+ * obtain pointer to item from resource list with id
+ */
+void *resource_list_getbyid(struct lst_t *list, unsigned int id)
+{
+	struct resource_list_elem *listelem = NULL;
+	void *item  = NULL;
+
+	if (!list)
+		goto error;
+
+	/*
+	 * find the next unused buffer in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (listelem->id == id) {
+			resource_item_use(listelem->refcnt);
+			item = listelem->item;
+			break;
+		}
+
+		listelem = lst_next(listelem);
+	}
+
+error:
+	return item;
+}
+
+/*
+ * obtain the number of available (unused) items within list.
+ */
+int resource_list_getnumavail(struct lst_t *list)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int num_items = 0;
+
+	if (!list)
+		goto error;
+
+	/*
+	 * find the next unused buffer in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (resource_item_isavailable(listelem->refcnt))
+			num_items++;
+
+		listelem = lst_next(listelem);
+	}
+
+error:
+	return num_items;
+}
+
+/*
+ * Obtain the number of items within list
+ */
+int resource_list_getnum(struct lst_t *list)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int num_items = 0;
+
+	if (!list)
+		goto error;
+
+	/*
+	 * find the next unused buffer in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		num_items++;
+		listelem = lst_next(listelem);
+	}
+
+error:
+	return num_items;
+}
+
+/*
+ * replaces an item (of specified id) within a resource list
+ */
+int resource_list_replace(struct lst_t *list, void *item, unsigned int id, unsigned int *refcnt,
+			  resource_pfn_freeitem fn_freeitem,
+			  void *free_cb_param)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int result = 0;
+
+	if (!list || !item) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error;
+	}
+
+	/*
+	 * determine whether this sequence header is already in the list
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		if (listelem->id == id) {
+			resource_item_return(listelem->refcnt);
+			if (*listelem->refcnt == 0) {
+				if (fn_freeitem)
+					fn_freeitem(listelem->item,
+						    free_cb_param);
+				else
+					kfree(listelem->item);
+				listelem->item = NULL;
+			}
+
+			lst_remove(list, listelem);
+			break;
+		}
+
+		listelem = lst_next(listelem);
+	}
+
+	if (!listelem) {
+		/*
+		 * Allocate the sequence header list element structure.
+		 */
+		listelem = kmalloc(sizeof(*(listelem)), GFP_KERNEL);
+		if (!listelem) {
+			result = IMG_ERROR_OUT_OF_MEMORY;
+			goto error;
+		}
+		memset(listelem, 0, sizeof(*(listelem)));
+	}
+
+	/*
+	 * setup the sequence header list element.
+	 */
+	resource_item_use(refcnt);
+
+	listelem->item = item;
+	listelem->id = id;
+	listelem->refcnt = refcnt;
+
+	/*
+	 * Add the sequence header list element to the sequence header list.
+	 */
+	lst_add(list, (void *)listelem);
+
+	return 0;
+
+error:
+	return result;
+}
+
+/*
+ * removes all items from a resource list.
+ */
+int resource_list_empty(struct lst_t *list, unsigned int release_item,
+			resource_pfn_freeitem fn_freeitem,
+			void *free_cb_param)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int result = 0;
+
+	if (!list) {
+		result = IMG_ERROR_INVALID_PARAMETERS;
+		goto error;
+	}
+
+	/*
+	 * remove all the buffer list elements from the image buffer list
+	 */
+	listelem = lst_removehead(list);
+	while (listelem) {
+		if (release_item) {
+			resource_item_release(listelem->refcnt);
+		} else {
+			/*
+			 * Return and free.
+			 */
+			resource_item_return(listelem->refcnt);
+
+			if (!listelem->refcnt || *listelem->refcnt == 0) {
+				if (fn_freeitem)
+					fn_freeitem(listelem->item,
+						    free_cb_param);
+				else
+					kfree(listelem->item);
+				listelem->item = NULL;
+			}
+		}
+
+		/*
+		 * free the buffer list element.
+		 */
+		kfree(listelem);
+		listelem = NULL;
+
+		/*
+		 * Get the next element from the list.
+		 */
+		listelem = lst_removehead(list);
+	}
+
+	return 0;
+
+error:
+	return result;
+}
+
+/*
+ * obtain the number of pictures within list
+ */
+int resource_getnumpict(struct lst_t *list)
+{
+	struct resource_list_elem *listelem = NULL;
+	unsigned int num_pict = 0;
+
+	if (!list)
+		goto error;
+
+	/*
+	 * find the next unused buffer in the list.
+	 */
+	listelem = lst_first(list);
+	while (listelem) {
+		num_pict++;
+		listelem = lst_next(listelem);
+	}
+
+error:
+	return num_pict;
+}
diff --git a/drivers/staging/media/vxd/common/resource.h b/drivers/staging/media/vxd/common/resource.h
new file mode 100644
index 000000000000..b041ff918e23
--- /dev/null
+++ b/drivers/staging/media/vxd/common/resource.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * VXD DEC SYSDEV and UI Interface header
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Sunita Nadampalli <sunitan@ti.com>
+ *
+ * Re-written for upstream
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#ifndef _VXD_RESOURCE_H
+#define _VXD_RESOURCE_H
+
+typedef int (*resource_pfn_freeitem)(void *item, void *free_cb_param);
+
+int resource_item_use(unsigned int *refcnt);
+
+void resource_item_return(unsigned int *refcnt);
+
+int resource_item_release(unsigned int *refcnt);
+
+int resource_item_isavailable(unsigned int *refcnt);
+
+int resource_list_add_img(struct lst_t *list, void *item, unsigned int id, unsigned int *refcnt);
+
+void *resource_list_pickhead(struct lst_t *list);
+
+int resource_list_remove(struct lst_t *list, void *item);
+
+/**
+ * resource_list_removehead - removes item at head of resource list
+ * @list: head of resource list
+ */
+
+void *resource_list_removehead(struct lst_t *list);
+
+int resource_list_remove_nextavail(struct lst_t *list,
+				   resource_pfn_freeitem fn_freeitem,
+				   void *free_cb_param);
+
+void *resource_list_get_avail(struct lst_t *list);
+
+void *resource_list_reuseitem(struct lst_t *list, void *item);
+
+void *resource_list_getbyid(struct lst_t *list, unsigned int id);
+
+int resource_list_getnumavail(struct lst_t *list);
+
+int resource_list_getnum(struct lst_t *list);
+
+int resource_list_replace(struct lst_t *list, void *item, unsigned int id, unsigned int *refcnt,
+			  resource_pfn_freeitem fn_freeitem,
+			  void *free_cb_param);
+
+int resource_list_empty(struct lst_t *list, unsigned int release_item,
+			resource_pfn_freeitem fn_freeitem,
+			void *free_cb_param);
+
+int resource_getnumpict(struct lst_t *list);
+
+#endif /* _VXD_RESOURCE_H */
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
