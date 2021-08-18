Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FB53F05F7
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239379AbhHRONM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239214AbhHRONB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:13:01 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D031AC061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:25 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id y23so2364566pgi.7
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/sNuf5t+quOhrjta/GUadJ1tFtVyNFM0mWdDejN1J44=;
        b=eRLXUiUBh+S4fS1YM0U0Lc7mekPMZwHvhsEaYhaqcj+uNF9uOAwnS0ucp3aXNsB4tF
         z24r/oR0+3yXCC9Y2iPsAk2cQ4tui5ZcM1FzyqJg8+a7gNkbj8Pb1ZJv14nVkzYmVDAI
         bytX8sRH27oW8MbrVcbMy0HvU+10x+UZ+r+q4yOFseacYdZCU/miBv+xn1FKba5OOJj5
         3P+bLRDxHjSouKzTAnzSs6Nc1ycmV5fz8nIj7dlgawF1EcxU8ifiTIx9RzXdbdns44wp
         Gk1A0VIsetiCAqj4bZuU68aEg5jmb2jUx8wANgcrjmJidp8Z8OiHg5oBsRSXdys99tGQ
         zltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=/sNuf5t+quOhrjta/GUadJ1tFtVyNFM0mWdDejN1J44=;
        b=GvvqexeYW0vCaxuy9dl1x7OWOKEoVuCLN1RIEmX2j8BOxMOWmxkc2PesbHq3DYLODz
         8RJ7b9nHDcQfAdDC57DZ+S9bR51ncXF1qCkWlcpy/nHNXB+vzK5UUUG1q1DaNjYJT494
         FWu1oMqvpYalCxRutj1ce5g4PSBrc/+PfxxRXO+0tsTzlskdljS8Y6+r/N3+Dp25Nvy6
         VRAZpK1QG1TScAM1oxqL3dGPLyncHl3Gpu1ddlKXDbL4mqaP2IEeKt14ai0C84AhfoGZ
         2EISwSNZDVk3cifuLRF/2KYxDHGpesWe44/qkfoMLz/LYOUM6fUIyLe2ttUlRHOJACAo
         fI1w==
MIME-Version: 1.0
X-Gm-Message-State: AOAM533bcZw7JQUlCfdf11olJY8498TwHfGcqgzRvgSPUxxvOYCvdfCn
        HCd092hVRYjQdcXwdJAsPsDCpRIkw9q47zXb70WZzbxd8zXmPWXdno48QNBbCkuhdeTbBLBCYVB
        GEwdKDuHzrO2W1Crg
X-Google-Smtp-Source: ABdhPJyaEg2WvaDP4t7BkCZjE37ZG8NCeH4TMmkzpEQqCLcYzflg6Pl9EpzdwyEnIPiCQiyroNgsmw==
X-Received: by 2002:a63:b47:: with SMTP id a7mr9171224pgl.181.1629295945220;
        Wed, 18 Aug 2021 07:12:25 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:24 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 10/30] v4l: vxd-dec: Add utility modules
Date:   Wed, 18 Aug 2021 19:40:17 +0530
Message-Id: <20210818141037.19990-11-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

Contains utility module for double linked queues, single linked
lists and workqueue.

Signed-off-by: Lakshmi Sankar <lakshmisankar-t@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                   |   6 +
 drivers/staging/media/vxd/common/dq.c         | 248 ++++++++++++++++++
 drivers/staging/media/vxd/common/dq.h         |  36 +++
 drivers/staging/media/vxd/common/lst.c        | 119 +++++++++
 drivers/staging/media/vxd/common/lst.h        |  37 +++
 drivers/staging/media/vxd/common/work_queue.c | 188 +++++++++++++
 drivers/staging/media/vxd/common/work_queue.h |  66 +++++
 7 files changed, 700 insertions(+)
 create mode 100644 drivers/staging/media/vxd/common/dq.c
 create mode 100644 drivers/staging/media/vxd/common/dq.h
 create mode 100644 drivers/staging/media/vxd/common/lst.c
 create mode 100644 drivers/staging/media/vxd/common/lst.h
 create mode 100644 drivers/staging/media/vxd/common/work_queue.c
 create mode 100644 drivers/staging/media/vxd/common/work_queue.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0468aaac3b7d..2668eeb89a34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19537,6 +19537,8 @@ M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
+F:	drivers/staging/media/vxd/common/dq.c
+F:	drivers/staging/media/vxd/common/dq.h
 F:	drivers/staging/media/vxd/common/idgen_api.c
 F:	drivers/staging/media/vxd/common/idgen_api.h
 F:	drivers/staging/media/vxd/common/img_mem_man.c
@@ -19544,6 +19546,10 @@ F:	drivers/staging/media/vxd/common/img_mem_man.h
 F:	drivers/staging/media/vxd/common/img_mem_unified.c
 F:	drivers/staging/media/vxd/common/imgmmu.c
 F:	drivers/staging/media/vxd/common/imgmmu.h
+F:	drivers/staging/media/vxd/common/lst.c
+F:	drivers/staging/media/vxd/common/lst.h
+F:	drivers/staging/media/vxd/common/work_queue.c
+F:	drivers/staging/media/vxd/common/work_queue.h
 F:	drivers/staging/media/vxd/decoder/hw_control.c
 F:	drivers/staging/media/vxd/decoder/hw_control.h
 F:	drivers/staging/media/vxd/decoder/img_dec_common.h
diff --git a/drivers/staging/media/vxd/common/dq.c b/drivers/staging/media/vxd/common/dq.c
new file mode 100644
index 000000000000..890be5ed00e7
--- /dev/null
+++ b/drivers/staging/media/vxd/common/dq.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Utility module for doubly linked queues.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
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
+
+void dq_init(struct dq_linkage_t *queue)
+{
+	queue->fwd = (struct dq_linkage_t *)queue;
+	queue->back = (struct dq_linkage_t *)queue;
+}
+
+void dq_addhead(struct dq_linkage_t *queue, void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return;
+
+	((struct dq_linkage_t *)item)->back = (struct dq_linkage_t *)queue;
+	((struct dq_linkage_t *)item)->fwd =
+					((struct dq_linkage_t *)queue)->fwd;
+	((struct dq_linkage_t *)queue)->fwd->back = (struct dq_linkage_t *)item;
+	((struct dq_linkage_t *)queue)->fwd = (struct dq_linkage_t *)item;
+}
+
+void dq_addtail(struct dq_linkage_t *queue, void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return;
+
+	((struct dq_linkage_t *)item)->fwd = (struct dq_linkage_t *)queue;
+	((struct dq_linkage_t *)item)->back =
+					((struct dq_linkage_t *)queue)->back;
+	((struct dq_linkage_t *)queue)->back->fwd = (struct dq_linkage_t *)item;
+	((struct dq_linkage_t *)queue)->back = (struct dq_linkage_t *)item;
+}
+
+int dq_empty(struct dq_linkage_t *queue)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return 1;
+
+	return ((queue)->fwd == (struct dq_linkage_t *)(queue));
+}
+
+void *dq_first(struct dq_linkage_t *queue)
+{
+	struct dq_linkage_t *temp = queue->fwd;
+
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return NULL;
+
+	return temp == (struct dq_linkage_t *)queue ? NULL : temp;
+}
+
+void *dq_last(struct dq_linkage_t *queue)
+{
+	struct dq_linkage_t *temp = queue->back;
+
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return NULL;
+
+	return temp == (struct dq_linkage_t *)queue ? NULL : temp;
+}
+
+void *dq_next(void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)item)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)item)->fwd);
+
+	if (!((struct dq_linkage_t *)item)->back ||
+	    !((struct dq_linkage_t *)item)->fwd)
+		return NULL;
+
+	return ((struct dq_linkage_t *)item)->fwd;
+}
+
+void *dq_previous(void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)item)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)item)->fwd);
+
+	if (!((struct dq_linkage_t *)item)->back ||
+	    !((struct dq_linkage_t *)item)->fwd)
+		return NULL;
+
+	return ((struct dq_linkage_t *)item)->back;
+}
+
+void dq_remove(void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)item)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)item)->fwd);
+
+	if (!((struct dq_linkage_t *)item)->back ||
+	    !((struct dq_linkage_t *)item)->fwd)
+		return;
+
+	((struct dq_linkage_t *)item)->fwd->back =
+					((struct dq_linkage_t *)item)->back;
+	((struct dq_linkage_t *)item)->back->fwd =
+					((struct dq_linkage_t *)item)->fwd;
+
+	/* make item linkages safe for "orphan" removes */
+	((struct dq_linkage_t *)item)->fwd = item;
+	((struct dq_linkage_t *)item)->back = item;
+}
+
+void *dq_removehead(struct dq_linkage_t *queue)
+{
+	struct dq_linkage_t *temp;
+
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return NULL;
+
+	if ((queue)->fwd == (struct dq_linkage_t *)(queue))
+		return NULL;
+
+	temp = ((struct dq_linkage_t *)queue)->fwd;
+	temp->fwd->back = temp->back;
+	temp->back->fwd = temp->fwd;
+
+	/* make item linkages safe for "orphan" removes */
+	temp->fwd = temp;
+	temp->back = temp;
+	return temp;
+}
+
+void *dq_removetail(struct dq_linkage_t *queue)
+{
+	struct dq_linkage_t *temp;
+
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)queue)->fwd);
+
+	if (!((struct dq_linkage_t *)queue)->back ||
+	    !((struct dq_linkage_t *)queue)->fwd)
+		return NULL;
+
+	if ((queue)->fwd == (struct dq_linkage_t *)(queue))
+		return NULL;
+
+	temp = ((struct dq_linkage_t *)queue)->back;
+	temp->fwd->back = temp->back;
+	temp->back->fwd = temp->fwd;
+
+	/* make item linkages safe for "orphan" removes */
+	temp->fwd = temp;
+	temp->back = temp;
+
+	return temp;
+}
+
+void dq_addbefore(void *successor, void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)successor)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)successor)->fwd);
+
+	if (!((struct dq_linkage_t *)successor)->back ||
+	    !((struct dq_linkage_t *)successor)->fwd)
+		return;
+
+	((struct dq_linkage_t *)item)->fwd = (struct dq_linkage_t *)successor;
+	((struct dq_linkage_t *)item)->back =
+				((struct dq_linkage_t *)successor)->back;
+	((struct dq_linkage_t *)item)->back->fwd = (struct dq_linkage_t *)item;
+	((struct dq_linkage_t *)successor)->back = (struct dq_linkage_t *)item;
+}
+
+void dq_addafter(void *predecessor, void *item)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)predecessor)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)predecessor)->fwd);
+
+	if (!((struct dq_linkage_t *)predecessor)->back ||
+	    !((struct dq_linkage_t *)predecessor)->fwd)
+		return;
+
+	((struct dq_linkage_t *)item)->fwd =
+				((struct dq_linkage_t *)predecessor)->fwd;
+	((struct dq_linkage_t *)item)->back =
+					(struct dq_linkage_t *)predecessor;
+	((struct dq_linkage_t *)item)->fwd->back = (struct dq_linkage_t *)item;
+	((struct dq_linkage_t *)predecessor)->fwd = (struct dq_linkage_t *)item;
+}
+
+void dq_move(struct dq_linkage_t *from, struct dq_linkage_t *to)
+{
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)from)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)from)->fwd);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)to)->back);
+	IMG_DBG_ASSERT(((struct dq_linkage_t *)to)->fwd);
+
+	if (!((struct dq_linkage_t *)from)->back ||
+	    !((struct dq_linkage_t *)from)->fwd ||
+	    !((struct dq_linkage_t *)to)->back ||
+	    !((struct dq_linkage_t *)to)->fwd)
+		return;
+
+	if ((from)->fwd == (struct dq_linkage_t *)(from)) {
+		dq_init(to);
+	} else {
+		*to = *from;
+		to->fwd->back = (struct dq_linkage_t *)to;
+		to->back->fwd = (struct dq_linkage_t *)to;
+		dq_init(from);
+	}
+}
diff --git a/drivers/staging/media/vxd/common/dq.h b/drivers/staging/media/vxd/common/dq.h
new file mode 100644
index 000000000000..4663a92aaf7a
--- /dev/null
+++ b/drivers/staging/media/vxd/common/dq.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Utility module for doubly linked queues.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ */
+#ifndef DQ_H
+#define DQ_H
+
+/* dq structure */
+struct dq_linkage_t {
+	struct dq_linkage_t *fwd;
+	struct dq_linkage_t *back;
+};
+
+/* Function Prototypes */
+void dq_addafter(void *predecessor, void *item);
+void dq_addbefore(void *successor, void *item);
+void dq_addhead(struct dq_linkage_t *queue, void *item);
+void dq_addtail(struct dq_linkage_t *queue, void *item);
+int dq_empty(struct dq_linkage_t *queue);
+void *dq_first(struct dq_linkage_t *queue);
+void *dq_last(struct dq_linkage_t *queue);
+void dq_init(struct dq_linkage_t *queue);
+void dq_move(struct dq_linkage_t *from, struct dq_linkage_t *to);
+void *dq_next(void *item);
+void *dq_previous(void *item);
+void dq_remove(void *item);
+void *dq_removehead(struct dq_linkage_t *queue);
+void *dq_removetail(struct dq_linkage_t *queue);
+
+#endif /* #define DQ_H */
diff --git a/drivers/staging/media/vxd/common/lst.c b/drivers/staging/media/vxd/common/lst.c
new file mode 100644
index 000000000000..bb047ab6d598
--- /dev/null
+++ b/drivers/staging/media/vxd/common/lst.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * List processing primitives.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ */
+
+#include "lst.h"
+
+#ifndef NULL
+#define NULL ((void *)0)
+#endif
+
+void lst_add(struct lst_t *list, void *item)
+{
+	if (!list->first) {
+		list->first = item;
+		list->last = item;
+	} else {
+		*list->last = item;
+		list->last = item;
+	}
+	*((void **)item) = NULL;
+}
+
+void lst_addhead(struct lst_t *list, void *item)
+{
+	if (!list->first) {
+		list->first = item;
+		list->last = item;
+		*((void **)item) = NULL;
+	} else {
+		*((void **)item) = list->first;
+		list->first = item;
+	}
+}
+
+int lst_empty(struct lst_t *list)
+{
+	if (!list->first)
+		return 1;
+	else
+		return 0;
+}
+
+void *lst_first(struct lst_t *list)
+{
+	return list->first;
+}
+
+void lst_init(struct lst_t *list)
+{
+	list->first = NULL;
+	list->last = NULL;
+}
+
+void *lst_last(struct lst_t *list)
+{
+	return list->last;
+}
+
+void *lst_next(void *item)
+{
+	return *((void **)item);
+}
+
+void *lst_removehead(struct lst_t *list)
+{
+	void **temp = list->first;
+
+	if (temp) {
+		list->first = *temp;
+		if (!list->first)
+			list->last = NULL;
+	}
+	return temp;
+}
+
+void *lst_remove(struct lst_t *list, void *item)
+{
+	void **p;
+	void **q;
+
+	p = (void **)list;
+	q = *p;
+	while (q) {
+		if (q == item) {
+			*p = *q;
+			if (list->last == q)
+				list->last = p;
+			return item;
+		}
+		p = q;
+		q = *p;
+	}
+
+	return NULL;
+}
+
+int lst_check(struct lst_t *list, void *item)
+{
+	void **p;
+	void **q;
+
+	p = (void **)list;
+	q = *p;
+	while (q) {
+		if (q == item)
+			return 1;
+		p = q;
+		q = *p;
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/vxd/common/lst.h b/drivers/staging/media/vxd/common/lst.h
new file mode 100644
index 000000000000..ccf6eed19019
--- /dev/null
+++ b/drivers/staging/media/vxd/common/lst.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * List processing primitives.
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Author:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ */
+#ifndef __LIST_H__
+#define __LIST_H__
+
+#include <linux/types.h>
+
+struct lst_t {
+	void **first;
+	void **last;
+};
+
+void lst_add(struct lst_t *list, void *item);
+void lst_addhead(struct lst_t *list, void *item);
+
+/**
+ * lst_empty- Is list empty?
+ * @list: pointer to list
+ */
+int  lst_empty(struct lst_t *list);
+void *lst_first(struct lst_t *list);
+void lst_init(struct lst_t *list);
+void *lst_last(struct lst_t *list);
+void *lst_next(void *item);
+void *lst_remove(struct lst_t *list, void *item);
+void *lst_removehead(struct lst_t *list);
+int lst_check(struct lst_t *list, void *item);
+
+#endif /* __LIST_H__ */
diff --git a/drivers/staging/media/vxd/common/work_queue.c b/drivers/staging/media/vxd/common/work_queue.c
new file mode 100644
index 000000000000..6bd91a7fdbf4
--- /dev/null
+++ b/drivers/staging/media/vxd/common/work_queue.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Work Queue Handling for Linux
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstream
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#include <linux/slab.h>
+#include <linux/printk.h>
+#include <linux/mutex.h>
+
+#include "work_queue.h"
+
+/* Defining and initilizing mutex
+ */
+DEFINE_MUTEX(mutex);
+
+#define false 0
+#define true 1
+
+struct node {
+	void **key;
+	struct node *next;
+};
+
+struct node *work_head;
+struct node *delayed_work_head;
+
+void init_work(void **work_args, void *work_fn, uint8_t hwa_id)
+{
+	struct work_struct **work = (struct work_struct **)work_args;
+	//create a link
+	struct node *link = kmalloc(sizeof(*link), GFP_KERNEL);
+
+	*work = kzalloc(sizeof(*work), GFP_KERNEL);
+	if (!(*work)) {
+		pr_err("Memory allocation failed for work_queue\n");
+		return;
+	}
+	INIT_WORK(*work, work_fn);
+
+	link->key = (void **)work;
+	mutex_lock(&mutex);
+	//point it to old first node
+	link->next = work_head;
+
+	//point first to new first node
+	work_head = link;
+	mutex_unlock(&mutex);
+}
+
+void init_delayed_work(void **work_args, void *work_fn, uint8_t hwa_id)
+{
+	struct delayed_work **work = (struct delayed_work **)work_args;
+	//create a link
+	struct node *link = kmalloc(sizeof(*link), GFP_KERNEL);
+
+	*work = kzalloc(sizeof(*work), GFP_KERNEL);
+	if (!(*work)) {
+		pr_err("Memory allocation failed for delayed_work_queue\n");
+		return;
+	}
+	INIT_DELAYED_WORK(*work, work_fn);
+
+	link->key = (void **)work;
+	mutex_lock(&mutex);
+	//point it to old first node
+	link->next = delayed_work_head;
+
+	//point first to new first node
+	delayed_work_head = link;
+	mutex_unlock(&mutex);
+}
+
+/**
+ * get_work_buff - get_work_buff
+ * @key: key value
+ * @flag: flag
+ */
+
+void *get_work_buff(void *key, signed char flag)
+{
+	struct node *data = NULL;
+	void *work_new = NULL;
+	struct node *temp = NULL;
+	struct node *previous = NULL;
+	struct work_struct **work = NULL;
+
+	//start from the first link
+	mutex_lock(&mutex);
+	temp = work_head;
+
+	//if list is empty
+	if (!work_head) {
+		mutex_unlock(&mutex);
+		return NULL;
+	}
+
+	work = ((struct work_struct **)(temp->key));
+	//navigate through list
+	while (*work != key) {
+		//if it is last node
+		if (!temp->next) {
+			mutex_unlock(&mutex);
+			return NULL;
+		}
+			//store reference to current link
+			previous = temp;
+			//move to next link
+			temp = temp->next;
+			work = ((struct work_struct **)(temp->key));
+	}
+
+	if (flag) {
+		//found a match, update the link
+		if (temp == work_head) {
+			//change first to point to next link
+			work_head = work_head->next;
+		} else {
+			//bypass the current link
+			previous->next = temp->next;
+		}
+	}
+
+	mutex_unlock(&mutex);
+	//return temp;
+	data = temp;
+	if (data) {
+		work_new = data->key;
+		if (flag)
+			kfree(data);
+	}
+	return work_new;
+}
+
+void *get_delayed_work_buff(void *key, signed char flag)
+{
+	struct node *data = NULL;
+	void *dwork_new = NULL;
+	struct node *temp = NULL;
+	struct node *previous = NULL;
+	struct delayed_work **dwork = NULL;
+
+	if (flag) {
+		/* This Condition is true when kernel module is removed */
+		return delayed_work_head;
+	}
+	//start from the first link
+	mutex_lock(&mutex);
+	temp = delayed_work_head;
+
+	//if list is empty
+	if (!delayed_work_head) {
+		mutex_unlock(&mutex);
+		return NULL;
+	}
+
+	dwork = ((struct delayed_work **)(temp->key));
+	//navigate through list
+	while (&(*dwork)->work != key) {
+		//if it is last node
+		if (!temp->next) {
+			mutex_unlock(&mutex);
+			return NULL;
+		}
+			//store reference to current link
+			previous = temp;
+			//move to next link
+			temp = temp->next;
+			dwork = ((struct delayed_work **)(temp->key));
+	}
+
+	mutex_unlock(&mutex);
+	data = temp;
+	if (data) {
+		dwork_new = data->key;
+		if (flag)
+			kfree(data);
+	}
+	return dwork_new;
+}
diff --git a/drivers/staging/media/vxd/common/work_queue.h b/drivers/staging/media/vxd/common/work_queue.h
new file mode 100644
index 000000000000..44ed423334e2
--- /dev/null
+++ b/drivers/staging/media/vxd/common/work_queue.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Work Queue Related Definitions
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Lakshmi Sankar <lakshmisankar-t@ti.com>
+ *
+ * Re-written for upstream
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#ifndef WORKQUEUE_H_
+#define WORKQUEUE_H_
+
+#include <linux/types.h>
+
+enum {
+	HWA_DECODER   = 0,
+	HWA_ENCODER    = 1,
+	HWA_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * init_work - This function provides the necessary initialization
+ * and saving given pointer(work_args) in linked list.
+ * @work_args: structure for the initialization
+ * @work_fn: work function pointer
+ *
+ * This function provides the necessary initialization
+ * and setting of the handler function (passed by the user).
+ */
+void init_work(void **work_args, void *work_fn, uint8_t hwa_id);
+
+/*
+ * init_delayed_work - This function provides the necessary initialization.
+ * and saving given pointer(work_args) in linked list.
+ * @work_args: structure for the initialization
+ * @work_fn: work function pointer
+ *
+ * This function provides the necessary initialization
+ * and setting of the handler function (passed by the user).
+ */
+void init_delayed_work(void **work_args, void *work_fn, uint8_t hwa_id);
+
+/*
+ * get_delayed_work_buff - This function return base address of given pointer
+ * @key: The given work struct pointer
+ * @flag: If TRUE, delete the node from the linked list.
+ *
+ * Return: Base address of the given input buffer.
+ */
+void *get_delayed_work_buff(void *key, signed char flag);
+
+/**
+ * get_work_buff - This function return base address of given pointer
+ * @key: The given work struct pointer
+ * @flag: If TRUE, delete the node from the linked list.
+ *
+ * Return: Base address of the given input buffer.
+ */
+void *get_work_buff(void *key, signed char flag);
+
+#endif /* WORKQUEUE_H_ */
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
