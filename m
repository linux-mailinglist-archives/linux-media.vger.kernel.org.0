Return-Path: <linux-media+bounces-54780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI2OO6fYqmnmXgEAu9opvQ
	(envelope-from <linux-media+bounces-54780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:37:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8D2221D3C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A69F230E9D13
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AD73A960F;
	Fri,  6 Mar 2026 13:28:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885E3A6EE7;
	Fri,  6 Mar 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803698; cv=none; b=a3cK25vi+OXUMMGPSkbekOONvBkNOsaOintrQntFhS4looJpyqmMNDzkGxoSROte2bAJgWze8D0HKbSn2544ek/Keyy1j0lHvjsrDlQbnZqt2OUjh5x4UXIZ2YoJQCHDkM4qSQS237jRGGVTdrOWYrpxCjR4Oel/wxT0Xhb9Jw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803698; c=relaxed/simple;
	bh=9qOP6B8hZtujzjk/9EQ7Z/1IahQ9BPh+cx9jM3xw0Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1HXXAPVkch5YEhlas+j03CCXMfLIZuL+7iuA/pCAfZ6xdEbt4D+uTyndMAbRLxV4Fy6CN3OkPmD6wiHokqFP+WoVLvRTZMumjt1h7zQkBbo0eeBu2p1V7aGDGM8AcZ1sUt8fz5qk4K0zz5xLY77BgydzOOZMJXsKbT3Q1a19uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 142BA1A011C;
	Fri,  6 Mar 2026 14:28:09 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE7B61A00FB;
	Fri,  6 Mar 2026 14:28:08 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8127D20270;
	Fri,  6 Mar 2026 14:28:07 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:22 +0200
Subject: [PATCH v2 5/9] accel/neutron: Add GEM buffer object support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-5-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=9346;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=9qOP6B8hZtujzjk/9EQ7Z/1IahQ9BPh+cx9jM3xw0Lw=;
 b=pc5gOhBsXHvOUqemK7VfVEWQ3ZZZLgDFL7K+I9cQYAXLW8s+LOoEezqGlteTtx+niDlhYdj/+
 xDMVE8KDBojDlcX0mP89EfKzm6S6EFOPpkjrJIon+Faxaf4Cv+PwB5M
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: 8C8D2221D3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54780-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.508];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the following IOCTLs:
- CREATE_BO - for creating a new buffer object and passing BO info
back to user
- SYNC_BO - for explicit DMA sync operations on the BO memory, since
Neutron isn't guaranteed to be cache coherent. User controls which
portions of the buffer memory to sync and the direction.

The Neutron device requires contiguous DMA buffers, so use the GEM DMA
helpers for creating and managing the BOs. Depending on the platform
it is integrated on, Neutron device may or may not be cache coherent. On
i.MX95, the first platform for which we add Neutron support, it is not.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
v2: Fix use of uninitialized variable
---
 drivers/accel/neutron/Makefile         |   3 +-
 drivers/accel/neutron/neutron_driver.c |  13 +++-
 drivers/accel/neutron/neutron_gem.c    | 116 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_gem.h    |  14 ++++
 include/uapi/drm/neutron_accel.h       |  79 ++++++++++++++++++++++
 5 files changed, 223 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
index 7592e318dd83..d4298c7a8535 100644
--- a/drivers/accel/neutron/Makefile
+++ b/drivers/accel/neutron/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON) := neutron.o
 
 neutron-y := \
 	neutron_driver.o \
-	neutron_device.o
+	neutron_device.o \
+	neutron_gem.o
diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
index 7f34785216cf..c9a18bf52037 100644
--- a/drivers/accel/neutron/neutron_driver.c
+++ b/drivers/accel/neutron/neutron_driver.c
@@ -14,12 +14,19 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
+#include <drm/neutron_accel.h>
 
 #include "neutron_device.h"
 #include "neutron_driver.h"
+#include "neutron_gem.h"
 
 #define NEUTRON_SUSPEND_DELAY_MS 1000
 
+static const struct drm_ioctl_desc neutron_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(NEUTRON_CREATE_BO, neutron_ioctl_create_bo, 0),
+	DRM_IOCTL_DEF_DRV(NEUTRON_SYNC_BO, neutron_ioctl_sync_bo, 0),
+};
+
 static int neutron_open(struct drm_device *drm, struct drm_file *file)
 {
 	struct neutron_device *ndev = to_neutron_device(drm);
@@ -45,7 +52,7 @@ static void neutron_postclose(struct drm_device *drm, struct drm_file *file)
 DEFINE_DRM_ACCEL_FOPS(neutron_drm_driver_fops);
 
 static const struct drm_driver neutron_drm_driver = {
-	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
 	.name			= "neutron",
 	.desc			= "NXP Neutron driver",
 	.major			= 1,
@@ -54,6 +61,10 @@ static const struct drm_driver neutron_drm_driver = {
 	.fops			= &neutron_drm_driver_fops,
 	.open			= neutron_open,
 	.postclose		= neutron_postclose,
+	.ioctls			= neutron_drm_ioctls,
+	.num_ioctls		= ARRAY_SIZE(neutron_drm_ioctls),
+
+	.gem_create_object      = neutron_gem_create_object,
 };
 
 static irqreturn_t neutron_irq_handler_thread(int irq, void *data)
diff --git a/drivers/accel/neutron/neutron_gem.c b/drivers/accel/neutron/neutron_gem.c
new file mode 100644
index 000000000000..142237caf041
--- /dev/null
+++ b/drivers/accel/neutron/neutron_gem.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025-2026 NXP */
+
+#include <linux/sizes.h>
+#include <linux/align.h>
+#include <linux/dma-map-ops.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
+#include <drm/neutron_accel.h>
+
+#include "neutron_device.h"
+#include "neutron_gem.h"
+
+#define NEUTRON_BO_ALIGN SZ_1M
+
+struct drm_gem_object *neutron_gem_create_object(struct drm_device *drm, size_t size)
+{
+	struct neutron_device *ndev = to_neutron_device(drm);
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+
+	dma_obj = kzalloc_obj(*dma_obj);
+	if (!dma_obj)
+		return ERR_PTR(-ENOMEM);
+
+	dma_obj->map_noncoherent = !dev_is_dma_coherent(ndev->dev);
+	dma_obj->map_bidirectional = true;
+	gem_obj = &dma_obj->base;
+
+	return gem_obj;
+}
+
+int neutron_ioctl_create_bo(struct drm_device *drm, void *data, struct drm_file *filp)
+{
+	struct drm_neutron_create_bo *args = data;
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+	size_t size;
+	int ret;
+
+	if (!args->size || args->pad)
+		return -EINVAL;
+
+	size = ALIGN(args->size, NEUTRON_BO_ALIGN);
+
+	dma_obj = drm_gem_dma_create(drm, size);
+	if (IS_ERR(dma_obj))
+		return PTR_ERR(dma_obj);
+
+	gem_obj = &dma_obj->base;
+
+	/* We expect correctly aligned buffers, but double-check */
+	if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
+		ret = -EFAULT;
+		goto out_put;
+	}
+
+	ret = drm_gem_handle_create(filp, gem_obj, &args->handle);
+	if (ret)
+		goto out_put;
+
+	args->map_offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	args->size = gem_obj->size;
+
+out_put:
+	/* No need to keep a reference of the GEM object. Freeing is handled by user */
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int neutron_ioctl_sync_bo(struct drm_device *drm, void *data, struct drm_file *filp)
+{
+	struct drm_neutron_sync_bo *args = data;
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_gem_object *gem_obj;
+	dma_addr_t start_addr;
+	int ret = 0;
+
+	gem_obj = drm_gem_object_lookup(filp, args->handle);
+	if (!gem_obj) {
+		dev_dbg(drm->dev, "Invalid BO handle %u\n", args->handle);
+		return -ENOENT;
+	}
+
+	dma_obj = to_drm_gem_dma_obj(gem_obj);
+
+	if (!args->size || args->offset >= gem_obj->size ||
+	    args->size > gem_obj->size - args->offset) {
+		dev_dbg(drm->dev, "Invalid offset/size for BO sync\n");
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	start_addr = dma_obj->dma_addr + args->offset;
+
+	switch (args->direction) {
+	case DRM_NEUTRON_SYNC_TO_DEVICE:
+		dma_sync_single_for_device(drm->dev, start_addr, args->size,
+					   DMA_BIDIRECTIONAL);
+		break;
+	case DRM_NEUTRON_SYNC_FROM_DEVICE:
+		dma_sync_single_for_cpu(drm->dev, start_addr, args->size,
+					DMA_BIDIRECTIONAL);
+		break;
+	default:
+		dev_dbg(drm->dev, "Invalid direction for BO sync\n");
+		ret = -EINVAL;
+	}
+
+out_put:
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
diff --git a/drivers/accel/neutron/neutron_gem.h b/drivers/accel/neutron/neutron_gem.h
new file mode 100644
index 000000000000..95ba2fe96617
--- /dev/null
+++ b/drivers/accel/neutron/neutron_gem.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025-2026 NXP */
+
+#ifndef __NEUTRON_GEM_H__
+#define __NEUTRON_GEM_H__
+
+#include <drm/drm_gem.h>
+
+struct drm_gem_object *neutron_gem_create_object(struct drm_device *drm, size_t size);
+
+int neutron_ioctl_create_bo(struct drm_device *drm, void *data, struct drm_file *filp);
+int neutron_ioctl_sync_bo(struct drm_device *drm, void *data, struct drm_file *filp);
+
+#endif /* __NEUTRON_GEM_H__ */
diff --git a/include/uapi/drm/neutron_accel.h b/include/uapi/drm/neutron_accel.h
new file mode 100644
index 000000000000..2f5639f2e0e8
--- /dev/null
+++ b/include/uapi/drm/neutron_accel.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/* Copyright 2025-2026 NXP */
+
+#ifndef __NEUTRON_ACCEL_H__
+#define __NEUTRON_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * enum drm_neutron_ioctl - Neutron IOCTL IDs
+ *
+ * @DRM_NEUTRON_CREATE_BO: Create a buffer object
+ * @DRM_NEUTRON_SYNC_BO: Sync (parts of) the buffer object memory
+ */
+enum drm_neutron_ioctl {
+	DRM_NEUTRON_CREATE_BO = 0,
+	DRM_NEUTRON_SYNC_BO,
+};
+
+/**
+ * struct drm_neutron_create_bo - Create a buffer object and return buffer
+ *                                info to user
+ *
+ * @size: Size in bytes of requested buffer. May be updated by driver
+ *        if allocated size different than requested
+ * @handle: Returned handle for the new buffer object
+ * @pad: MBZ
+ * @map_offset: Returned offset for mmap() calls
+ */
+struct drm_neutron_create_bo {
+	__u64 size;
+	__u32 handle;
+	__u32 pad;
+	__u64 map_offset;
+};
+
+/**
+ * enum drm_neutron_sync_dir - Direction of buffer object synchronization
+ *
+ * @DRM_NEUTRON_SYNC_TO_DEVICE: Sync from CPU to device
+ * @DRM_NEUTRON_SYNC_FROM_DEVICE: Sync from device to CPU
+ */
+enum drm_neutron_sync_dir {
+	DRM_NEUTRON_SYNC_TO_DEVICE = 0,
+	DRM_NEUTRON_SYNC_FROM_DEVICE,
+};
+
+/**
+ * struct drm_neutron_sync_bo - Sync buffer object memory
+ *
+ * @handle: Handle of buffer object to sync
+ * @direction: Direction of sync, can be one of enum drm_neutron_sync_dir
+ * @size: Size of the memory to sync, in bytes
+ * @offset: Offset inside the buffer, in bytes
+ */
+struct drm_neutron_sync_bo {
+	__u32 handle;
+	__u32 direction;
+	__u64 size;
+	__u64 offset;
+};
+
+#define DRM_IOCTL_NEUTRON_CREATE_BO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_CREATE_BO, \
+		 struct drm_neutron_create_bo)
+
+#define DRM_IOCTL_NEUTRON_SYNC_BO \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SYNC_BO, \
+		 struct drm_neutron_sync_bo)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __NEUTRON_ACCEL_H__ */

-- 
2.34.1


