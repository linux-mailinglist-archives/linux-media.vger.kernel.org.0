Return-Path: <linux-media+bounces-45612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA87C0BC93
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E71194E4F8C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 04:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89A12D374F;
	Mon, 27 Oct 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNlBinVz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB423D7C3
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761540521; cv=none; b=KnTTI7ydcAcz2tlU3tzfMHLgN67vwsJvAF6xED5hnNygVCg25tKxjQthOv07GTupqitg91eecLRWNy9bwoZxGVmkZJnz1GMbacsqmoYccpKl4yIhey3If9sNMP+qraye/wsYRYS9ZNRmFjByTReJVRTOQgvwQtz8YDcv71dL1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761540521; c=relaxed/simple;
	bh=EaKFigTTtJiNclr1RKoRMcBIEapYqMy0xIueXsIfmEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CU7SxDdNLdGHmFZNc3AzF7ipakFtz2tgoI/vRcf/IH1lraMqb5CoSmIRQSC1dljtca/F49Px7oK9pSK7OTOSYBNuHiXirIpWlJ42OZFb/DxuFTPWZT2aopKcQh90CUJiEKpVA4dXdjuWLAVmWc42dT9IolI5MBuwZyQtoKAGiqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNlBinVz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761540519; x=1793076519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EaKFigTTtJiNclr1RKoRMcBIEapYqMy0xIueXsIfmEo=;
  b=MNlBinVzrri0BRMKs9jZkItuVBbkDLoZdsxK5U1RYyP8S4ankCS3RnDx
   COYiDfkVkKKyMpcFByoblBed15Ld4G3D8vcrJloJz9H8PXNaEedBMwuxr
   1ypvED2lK8ti0ZTi4pAhEwo8uiGhvYn6eauEp3fudZJR9pcXhSrVZJNoK
   CIXFgimASbe2Fg3BAYgza6bnPkFQDXODI6z3SG630+RpWCJqCBQAaQ4Cj
   73nqpyb3AJgHHJi10lFH+VkIB4MlgK1jEsoQ444dr0s6M3EEBQB9sqclS
   83HYOqHRErePiMfsxToafsOOsSBxP6cLmnMQfdwlJhDjx+O0/u6O5Xpyt
   A==;
X-CSE-ConnectionGUID: 8FimQmGlSCiT+GPq5orx1Q==
X-CSE-MsgGUID: PRpsrQDuQZOLrld1dGmo2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521066"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63521066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:36 -0700
X-CSE-ConnectionGUID: J4/P3FBsROGxdIRjuNtdYA==
X-CSE-MsgGUID: UQg3lG8TRfCOmxJZTCgOXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="188992975"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC v2 1/8] dma-buf: Add support for map/unmap APIs for interconnects
Date: Sun, 26 Oct 2025 21:44:13 -0700
Message-ID: <20251027044712.1676175-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For the map operation, the dma-buf core will create an xarray but
the exporter needs to populate it with the interconnect specific
addresses. And, similarly for unmap, the exporter is expected to
cleanup the individual entries of the xarray.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/Makefile               |  2 +-
 drivers/dma-buf/dma-buf-interconnect.c | 96 ++++++++++++++++++++++++++
 drivers/dma-buf/dma-buf.c              |  6 --
 include/linux/dma-buf-interconnect.h   | 79 +++++++++++++++++++++
 include/linux/dma-buf.h                | 27 ++++++++
 5 files changed, 203 insertions(+), 7 deletions(-)
 create mode 100644 drivers/dma-buf/dma-buf-interconnect.c
 create mode 100644 include/linux/dma-buf-interconnect.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 70ec901edf2c..fff39b973f28 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-fence-unwrap.o dma-resv.o
+	 dma-fence-unwrap.o dma-resv.o dma-buf-interconnect.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/dma-buf-interconnect.c b/drivers/dma-buf/dma-buf-interconnect.c
new file mode 100644
index 000000000000..690423b6682f
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-interconnect.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: MIT */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
+
+/**
+ * dma_buf_map_interconnect - Returns the xarray wrapped in dma_buf_ranges
+ * that contains the buffer addresses that the importer would be able to use.
+ * It is a wrapper for map_interconnect() of the dma_buf_ops.
+ * @attach:	[in]	attachment whose xarray is to be returned
+ *
+ * On success, the buffer addresses are returned in a type that is specific
+ * to the interconnect implementation. For example, for IOV interconnect,
+ * struct range is the type used to represent the buffer addresses.
+ * On failure, appropriate ERR_PTR is returned or -EOPNOTSUPP if the importer
+ * is not allowed to use interconnect mappings.
+ *
+ * The importer must eventually call dma_buf_unmap_interconnect() after it is
+ * done using the buffer addresses. Note that, only dynamic importers are
+ * allowed to use this interface.
+ */
+struct dma_buf_ranges *
+dma_buf_map_interconnect(struct dma_buf_attachment *attach)
+{
+	const struct dma_buf_interconnect_ops *ic_ops;
+	struct dma_buf *dmabuf = attach->dmabuf;
+	struct dma_buf_ranges *ranges;
+	int ret;
+
+	might_sleep();
+
+	if (WARN_ON(!attach || !attach->dmabuf))
+		return ERR_PTR(-EINVAL);
+
+	if (!attach->allow_ic)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	dma_resv_assert_held(attach->dmabuf->resv);
+
+	if (!dma_buf_attachment_is_dynamic(attach))
+		return ERR_PTR(-EINVAL);
+
+	ic_ops = dmabuf->ops->interconnect_ops;
+	if (!ic_ops || !ic_ops->map_interconnect)
+		return ERR_PTR(-EINVAL);
+
+	ranges = kzalloc(sizeof(*ranges), GFP_KERNEL);
+	if (!ranges)
+		return ERR_PTR(-ENOMEM);
+
+	xa_init(&ranges->ranges);
+	ret = ic_ops->map_interconnect(attach, ranges);
+	if (ret)
+		goto err_free_ranges;
+
+	return ranges;
+
+err_free_ranges:
+	xa_destroy(&ranges->ranges);
+	kfree(ranges);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_interconnect, "DMA_BUF");
+
+/**
+ * dma_buf_unmap_interconnect - destroys the xarray specific to this attachment
+ * and the importer. It is a wrapper for unmap_interconnect() of dma_buf_ops.
+ * @attach:	[in]	attachment to destroy xarray from
+ * @ranges:	[in]	dma_buf_ranges that contains the xarray to be destroyed
+ *
+ * This destroys the xarray that was created by dma_buf_map_interconnect().
+ */
+void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
+				struct dma_buf_ranges *ranges)
+{
+	const struct dma_buf_interconnect_ops *ic_ops;
+	struct dma_buf *dmabuf = attach->dmabuf;
+
+	if (WARN_ON(!attach || !attach->dmabuf || !ranges))
+		return;
+
+	if (!attach->allow_ic)
+		return;
+
+	ic_ops = dmabuf->ops->interconnect_ops;
+	if (!ic_ops || !ic_ops->unmap_interconnect)
+		return;
+
+	dma_resv_assert_held(attach->dmabuf->resv);
+
+	ic_ops->unmap_interconnect(attach, ranges);
+
+	xa_destroy(&ranges->ranges);
+	kfree(ranges);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..daa993503052 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -845,12 +845,6 @@ static void mangle_sg_table(struct sg_table *sg_table)
 
 }
 
-static inline bool
-dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
-{
-	return !!attach->importer_ops;
-}
-
 static bool
 dma_buf_pin_on_map(struct dma_buf_attachment *attach)
 {
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
new file mode 100644
index 000000000000..50fc7a8272ce
--- /dev/null
+++ b/include/linux/dma-buf-interconnect.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DMA_BUF_INTERCONNECT_H__
+#define __DMA_BUF_INTERCONNECT_H__
+
+#include <linux/xarray.h>
+
+#define CREATE_INTERCONNECT(type)					       \
+	static const struct dma_buf_interconnect __##type##_interconnect = {   \
+		.name = #type"_interconnect",				       \
+	};								       \
+	const struct dma_buf_interconnect *type##_interconnect =	       \
+		&__##type##_interconnect;   				       \
+
+struct dma_buf_attachment;
+
+/**
+ * struct dma_buf_interconnect - holds info associated with an interconnect
+ * @name: name of the interconnect.
+ *
+ * The exporter is expected to use CREATE_INTERCONNECT() macro to create a
+ * unique instance of this structure for each interconnect type it supports.
+ */
+struct dma_buf_interconnect {
+	const char *name;
+};
+
+/**
+ * struct dma_buf_ranges - holds info about interconnect address ranges
+ * @ranges: xarray that contains the address ranges
+ * @nranges: total number of ranges populated in the xarray
+ *
+ * The exporter is expected to populate this structure with xarray entries
+ * of type specific to the interconnect that would contain the address ranges
+ * associated with the shared buffer.
+ */
+struct dma_buf_ranges {
+	struct xarray ranges;
+	unsigned int nranges;
+};
+
+/**
+ * struct dma_buf_interconnect_ops - operations for using dma-buf interconnects
+ *
+ * These operations would be implemented by the exporter.
+ */
+struct dma_buf_interconnect_ops {
+	/**
+	 * @map_interconnect:
+	 *
+	 * This is called by dma_buf_map_interconnect() and is used to fill an
+	 * xarray with addresses wrapped in type specific to the interconnect
+	 * for the given attachment. It can only be called if @attach->allow_ic
+	 * has been set to true.
+	 *
+	 * Returns:
+	 *
+	 * A zero is returned on success, which means that the xarray is
+	 * successfully populated with addresses for all ranges.
+	 * On failure, a negative error value is returned.
+	 *
+	 * Note that only dynamic importers are expected to use this interface.
+	 */
+	int (*map_interconnect)(struct dma_buf_attachment *attach,
+				struct dma_buf_ranges *ranges);
+	/**
+	 * @unmap_interconnect:
+	 *
+	 * This is called by dma_buf_unmap_interconnect() and is used to clean
+	 * up the xarray entries allocated in @map_interconnect.
+	 */
+	void (*unmap_interconnect)(struct dma_buf_attachment *attach,
+				   struct dma_buf_ranges *ranges);
+};
+
+struct dma_buf_ranges *dma_buf_map_interconnect(struct dma_buf_attachment *);
+void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
+				struct dma_buf_ranges *);
+#endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e7..a675bc89a69c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -23,6 +23,8 @@
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
 
+#include <linux/dma-buf-interconnect.h>
+
 struct device;
 struct dma_buf;
 struct dma_buf_attachment;
@@ -276,6 +278,16 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	/**
+	 * @interconnect_ops:
+	 *
+	 * This contains the operations required for supporting dma-buf
+	 * interconnects for the exporter.
+	 *
+	 * This interface is optional.
+	 */
+	const struct dma_buf_interconnect_ops *interconnect_ops;
 };
 
 /**
@@ -483,6 +495,7 @@ struct dma_buf_attach_ops {
  * @dev: device attached to the buffer.
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
  * @peer2peer: true if the importer can handle peer resources without pages.
+ * @allow_ic: true if the importer is allowed to use interconnect ops.
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
@@ -502,6 +515,7 @@ struct dma_buf_attachment {
 	struct device *dev;
 	struct list_head node;
 	bool peer2peer;
+	bool allow_ic;
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
@@ -568,6 +582,19 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 	return !!dmabuf->ops->pin;
 }
 
+/**
+ * dma_buf_attachment_is_dynamic - check if the importer can handle move_notify.
+ * @attach: the attachment to check
+ *
+ * Returns true if a DMA-buf importer has indicated that it can handle dmabuf
+ * location changes through the move_notify callback.
+ */
+static inline bool
+dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
+{
+	return !!attach->importer_ops;
+}
+
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *
-- 
2.50.1


