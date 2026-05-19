Return-Path: <linux-media+bounces-62088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB3nA+MCDGrETgUAu9opvQ
	(envelope-from <linux-media+bounces-62088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:27:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC68578148
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D469E30E514A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D00A3A6EE3;
	Tue, 19 May 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7NDWOiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAF389119;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171355; cv=none; b=p722QVOKVZGrt/JGh71Fg1Ba+k5HKXGkLgz3sg0pxXFSvcwHRe2Y62Y8jflyUc2IycC3KouKfjk7QFHqo61VOjx3Nh3MylAIkamtyHRh+9YtvAf10mXgyTSNbUnApnR6VWmwZuaRPCgpkd/ou292MfQ41gU/zOhIyMkWPCShQno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171355; c=relaxed/simple;
	bh=+j05OfJh6zpolc7DiX419pjciIRN9lIjWEK9d8yVFuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FojagUzva0ZDlDJhnIs8I/uOveseVYCxXjazd893wQx+XMTNWXqfg9M3HjtvEPzIbr9i0vVwcMmHB9Ix1hdEWuJRrR8CGgo/MjgJOutisYLuSnLUnBMNhauCTc9PoIyemjVqsESy9WKpWU40UqF0beTIn7DLy5vTkOi7yYBSYCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7NDWOiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACF21C4AF13;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171355;
	bh=+j05OfJh6zpolc7DiX419pjciIRN9lIjWEK9d8yVFuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U7NDWOiJqWk+DQbdjQLDiU+YXiBJ596RCnwiwezRqzfruTmOBEWGAi9gEAwiIipRI
	 qJRfDB3rlJ2z7Pmn3OK/v7D8YhLZGbxhxNnKqzQehlrZv2rZu5Ai/dqSiJl12OzN25
	 r528H7usMwke9zpN11fergKpKgmPI2YM6TIEZdwTZjsijcMOQsKb/q+2CN5o58+1C/
	 D4hJiWX13JnZgKuOc1ti1gsoJYEhsSJcu4ivhS2OXc5Ae1aj7TFrhZ4L/5L2ZgGUwI
	 OM+YdBgWTbWADoLNA7dreLn4QBgVP2iCZN2nQkCGQQeOfE0qMYuWHRHFa8fN4RyLje
	 i4Hf3ctMh8+cg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EDFCD4F54;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:45:57 +0530
Subject: [PATCH 07/15] accel/qda: Add memory manager for CB devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
In-Reply-To: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=12810;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=ribI9taLgY7T9NNuJSJlwzx5x9A/sedmzLmUOdR8ZVA=;
 b=JCHyzk2GDqaUxYJMiawvnA/yA4L0PPN23HG3TEHZ6kqs6hZslggUWdYFpdAtK+TMBbA+urC/B
 bsqYgN+/aybBdDsjFIc44i5QUp34dJK5vY2OlTas7sHvM5mI0Vv+6w2
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62088-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 9EC68578148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Introduce the QDA memory manager (qda_memory_manager) to track and
manage the IOMMU devices that back each compute context bank (CB).

Each CB device registered on the qda-compute-cb bus is assigned a
unique ID via an XArray and wrapped in a qda_iommu_device descriptor
that records the device pointer and its stream ID. This registry
allows the driver to look up the correct IOMMU domain for a given
session when mapping DSP buffers.

The memory manager is initialised in qda_init_device() before CB
devices are populated and torn down in qda_deinit_device() after they
are destroyed, ensuring no dangling references remain in the XArray.

qda_cb.c is extended with qda_cb_setup_device(), which is called
immediately after a CB device is registered on the bus. It allocates
a qda_iommu_device, registers it with the memory manager, and stores
it as the CB device's driver data so that qda_destroy_cb_device() can
retrieve and unregister it during teardown.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile             |   1 +
 drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
 drivers/accel/qda/qda_drv.c            |  34 ++++++++++
 drivers/accel/qda/qda_drv.h            |   5 ++
 drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
 drivers/accel/qda/qda_rpmsg.c          |   7 +++
 7 files changed, 254 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 143c9e4e789e..701fad5ffb50 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_memory_manager.o \
 	qda_rpmsg.o
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
index 77caf8438c67..6d540bb0ec7b 100644
--- a/drivers/accel/qda/qda_cb.c
+++ b/drivers/accel/qda/qda_cb.c
@@ -8,11 +8,42 @@
 #include <linux/slab.h>
 #include <drm/drm_print.h>
 #include "qda_drv.h"
+#include "qda_memory_manager.h"
 #include "qda_cb.h"
 
+static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev, u32 sid)
+{
+	struct qda_iommu_device *iommu_dev;
+	int rc;
+
+	drm_dbg_driver(&qdev->drm_dev, "Setting up CB device %s\n", dev_name(cb_dev));
+
+	iommu_dev = kzalloc_obj(*iommu_dev);
+	if (!iommu_dev)
+		return -ENOMEM;
+
+	iommu_dev->dev = cb_dev;
+	iommu_dev->qdev = qdev;
+	iommu_dev->sid = sid;
+
+	rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
+	if (rc) {
+		drm_err(&qdev->drm_dev, "Failed to register IOMMU device: %d\n", rc);
+		kfree(iommu_dev);
+		return rc;
+	}
+
+	dev_set_drvdata(cb_dev, iommu_dev);
+
+	drm_dbg_driver(&qdev->drm_dev, "CB device setup complete - SID: %u\n", sid);
+
+	return 0;
+}
+
 int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
 {
 	struct device *cb_dev;
+	int ret;
 	u32 sid = 0;
 	char name[64];
 	struct qda_cb_dev *entry;
@@ -30,6 +61,13 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
 		return PTR_ERR(cb_dev);
 	}
 
+	ret = qda_cb_setup_device(qdev, cb_dev, sid);
+	if (ret) {
+		drm_err(&qdev->drm_dev, "CB device setup failed: %d\n", ret);
+		device_unregister(cb_dev);
+		return ret;
+	}
+
 	entry = kzalloc_obj(*entry);
 	if (!entry) {
 		device_unregister(cb_dev);
@@ -80,6 +118,7 @@ int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
 void qda_destroy_cb_device(struct device *cb_dev)
 {
 	struct iommu_group *group;
+	struct qda_iommu_device *iommu_dev;
 
 	if (!cb_dev) {
 		pr_debug("qda: NULL CB device passed to destroy\n");
@@ -88,6 +127,14 @@ void qda_destroy_cb_device(struct device *cb_dev)
 
 	dev_dbg(cb_dev, "Destroying CB device %s\n", dev_name(cb_dev));
 
+	iommu_dev = dev_get_drvdata(cb_dev);
+	if (iommu_dev && iommu_dev->qdev && iommu_dev->qdev->iommu_mgr) {
+		dev_dbg(cb_dev, "Unregistering IOMMU device for %s\n",
+			dev_name(cb_dev));
+		qda_memory_manager_unregister_device(iommu_dev->qdev->iommu_mgr,
+						     iommu_dev);
+	}
+
 	group = iommu_group_get(cb_dev);
 	if (group) {
 		dev_dbg(cb_dev, "Removing %s from IOMMU group\n", dev_name(cb_dev));
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 6c20d6a2fc47..0ad5d9873d7e 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -57,6 +57,40 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	return qdev;
 }
 
+static void cleanup_memory_manager(struct qda_dev *qdev)
+{
+	if (qdev->iommu_mgr) {
+		qda_memory_manager_exit(qdev->iommu_mgr);
+		kfree(qdev->iommu_mgr);
+		qdev->iommu_mgr = NULL;
+	}
+}
+
+static int init_memory_manager(struct qda_dev *qdev)
+{
+	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr);
+	if (!qdev->iommu_mgr)
+		return -ENOMEM;
+
+	return qda_memory_manager_init(qdev->iommu_mgr);
+}
+
+void qda_deinit_device(struct qda_dev *qdev)
+{
+	cleanup_memory_manager(qdev);
+}
+
+int qda_init_device(struct qda_dev *qdev)
+{
+	int ret;
+
+	ret = init_memory_manager(qdev);
+	if (ret)
+		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
+
+	return ret;
+}
+
 void qda_unregister_device(struct qda_dev *qdev)
 {
 	drm_dev_unregister(&qdev->drm_dev);
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 2715f378775d..eb089e586b17 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -13,6 +13,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include "qda_memory_manager.h"
 
 /* Driver identification */
 #define QDA_DRIVER_NAME "qda"
@@ -40,6 +41,8 @@ struct qda_dev {
 	struct device *dev;
 	/** @cb_devs: Compute context-bank (CB) child devices */
 	struct list_head cb_devs;
+	/** @iommu_mgr: IOMMU/memory manager instance */
+	struct qda_memory_manager *iommu_mgr;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
@@ -59,6 +62,8 @@ static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
 struct qda_dev *qda_alloc_device(struct device *dev);
 
 /* Core device lifecycle */
+int qda_init_device(struct qda_dev *qdev);
+void qda_deinit_device(struct qda_dev *qdev);
 int qda_register_device(struct qda_dev *qdev);
 void qda_unregister_device(struct qda_dev *qdev);
 
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
new file mode 100644
index 000000000000..00a9c0ae4224
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+#include <linux/refcount.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/xarray.h>
+#include <drm/drm_file.h>
+#include "qda_drv.h"
+#include "qda_memory_manager.h"
+
+static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
+{
+	unsigned long index;
+	void *entry;
+
+	pr_debug("qda: Starting cleanup of all memory devices\n");
+
+	xa_for_each(&mem_mgr->device_xa, index, entry) {
+		struct qda_iommu_device *iommu_dev = entry;
+
+		pr_debug("qda: Cleaning up device id=%lu\n", index);
+
+		xa_erase(&mem_mgr->device_xa, index);
+		kfree(iommu_dev);
+	}
+
+	pr_debug("qda: Completed cleanup of all memory devices\n");
+}
+
+static int allocate_device_id(struct qda_memory_manager *mem_mgr,
+			      struct qda_iommu_device *iommu_dev, u32 *id)
+{
+	int ret;
+
+	ret = xa_alloc(&mem_mgr->device_xa, id, iommu_dev,
+		       xa_limit_31b, GFP_KERNEL);
+	if (ret) {
+		dev_err(iommu_dev->dev, "Failed to allocate XArray ID: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(iommu_dev->dev, "Allocated device id=%u\n", *id);
+	return 0;
+}
+
+/**
+ * qda_memory_manager_register_device() - Register an IOMMU device
+ * @mem_mgr: Pointer to memory manager
+ * @iommu_dev: Pointer to IOMMU device to register
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
+				       struct qda_iommu_device *iommu_dev)
+{
+	int ret;
+	u32 id;
+
+	ret = allocate_device_id(mem_mgr, iommu_dev, &id);
+	if (ret) {
+		dev_err(iommu_dev->dev,
+			"Failed to allocate device ID: %d (sid=%u)\n",
+			ret, iommu_dev->sid);
+		return ret;
+	}
+
+	iommu_dev->id = id;
+
+	dev_dbg(iommu_dev->dev, "Registered device id=%u (sid=%u)\n", id, iommu_dev->sid);
+
+	return 0;
+}
+
+/**
+ * qda_memory_manager_unregister_device() - Unregister an IOMMU device
+ * @mem_mgr: Pointer to memory manager
+ * @iommu_dev: Pointer to IOMMU device to unregister
+ */
+void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
+					  struct qda_iommu_device *iommu_dev)
+{
+	xa_erase(&mem_mgr->device_xa, iommu_dev->id);
+	kfree(iommu_dev);
+}
+
+/**
+ * qda_memory_manager_init() - Initialize the memory manager
+ * @mem_mgr: Pointer to memory manager structure to initialize
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_init(struct qda_memory_manager *mem_mgr)
+{
+	pr_debug("qda: Initializing memory manager\n");
+
+	xa_init_flags(&mem_mgr->device_xa, XA_FLAGS_ALLOC);
+
+	pr_debug("qda: Memory manager initialized successfully\n");
+	return 0;
+}
+
+/**
+ * qda_memory_manager_exit() - Clean up the memory manager
+ * @mem_mgr: Pointer to memory manager structure to clean up
+ */
+void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr)
+{
+	cleanup_all_memory_devices(mem_mgr);
+	pr_debug("qda: Memory manager exited\n");
+}
diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
new file mode 100644
index 000000000000..0243f9c0c5aa
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_manager.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_MEMORY_MANAGER_H__
+#define __QDA_MEMORY_MANAGER_H__
+
+#include <linux/device.h>
+#include <linux/xarray.h>
+#include "qda_drv.h"
+
+/**
+ * struct qda_iommu_device - IOMMU device instance for memory management
+ *
+ * Represents a single IOMMU-enabled device managed by the memory manager.
+ * Each device can be assigned to a specific process session.
+ */
+struct qda_iommu_device {
+	/** @dev: Pointer to the underlying device */
+	struct device *dev;
+	/** @qdev: Back-pointer to the parent QDA device */
+	struct qda_dev *qdev;
+	/** @id: Unique identifier assigned by the memory manager XArray */
+	u32 id;
+	/** @sid: Stream ID for IOMMU transactions */
+	u32 sid;
+};
+
+/**
+ * struct qda_memory_manager - Central memory management coordinator
+ *
+ * Coordinates memory management across multiple IOMMU devices. Maintains
+ * a registry of devices using an XArray for O(1) lookup by ID.
+ */
+struct qda_memory_manager {
+	/** @device_xa: XArray storing all registered IOMMU devices */
+	struct xarray device_xa;
+};
+
+int qda_memory_manager_init(struct qda_memory_manager *mem_mgr);
+void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr);
+
+int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
+				       struct qda_iommu_device *iommu_dev);
+void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
+					  struct qda_iommu_device *iommu_dev);
+
+#endif /* __QDA_MEMORY_MANAGER_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index afd9e851d00e..719dabb028c5 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -39,6 +39,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
 	qda_unregister_device(qdev);
+	qda_deinit_device(qdev);
 	dev_info(qdev->dev, "RPMsg device removed\n");
 }
 
@@ -61,14 +62,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 	qdev->dsp_name = label;
 
+	ret = qda_init_device(qdev);
+	if (ret)
+		return ret;
+
 	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
 	if (ret) {
 		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
+		qda_deinit_device(qdev);
 		return ret;
 	}
 
 	ret = qda_register_device(qdev);
 	if (ret) {
+		qda_deinit_device(qdev);
 		qda_cb_unpopulate(qdev);
 		return ret;
 	}

-- 
2.34.1



