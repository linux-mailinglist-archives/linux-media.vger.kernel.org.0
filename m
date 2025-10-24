Return-Path: <linux-media+bounces-45473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42665C0566E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177171B868FE
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E28A15E97;
	Fri, 24 Oct 2025 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v1+tpIkI"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE142065;
	Fri, 24 Oct 2025 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299120; cv=none; b=i4jStE/9E//tkDDHQBpdeLvtavpNid8w+rwJdzSmT14WWKHZSmHYCO5i4eN5IR/Mt2MX2fP+3RvPIU8aC+p3ZNFHpEtb3Oc1iyAJ0TxOBfYC7bZ4iRbsig1FVxZr2DaaxSFz6vxI8KT9K/Sz2KnFRFG9B+QQ0e93gNidfk98Ly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299120; c=relaxed/simple;
	bh=AVnm9OgQSS23Py9t5bMjg8D/EIp64K0NhOg4nsoXH6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sE73K/TR4hoSdJCNqOPWesSWxPglHHoec75BunjBkxXh0YkfFAjQK4zK/0mgnWDt2qjjkJA0T3Fnpi0zhWmR2jAPdf2+wVqbJ6q/7sd+9rkmVMvqh+xHf0zU9sxdYCQ+Jy6AFDZm/eogpCncBiHRhyHJGpzbBO3My1avV62gwpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v1+tpIkI; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59O9j5pY1866765;
	Fri, 24 Oct 2025 04:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761299105;
	bh=T/mkxM99aQPInPdyi7+eKqBWHtoPS0AiDVRlKGOReRs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=v1+tpIkIVdBTsGq51PvwtJYSCOC208Ybs10to46mgBWvi6aWVG8uYoJpJFiGxgwMq
	 +FXXi/ian0o9xKg2Ztfr9jdDaaY2XUoEEuRQhdH3x9aDZzIIF8jm14lA82XcegIGOs
	 tipWabaK8zCguvd/byxvigCJX8u83NAyuYRYJfTA=
Received: from DFLE206.ent.ti.com (dfle206.ent.ti.com [10.64.6.64])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59O9j4qU3083390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 04:45:04 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 04:45:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 04:45:03 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59O9isvk148409;
	Fri, 24 Oct 2025 04:45:00 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V5 1/4] media: ti: vpe: Re-introduce multi-instance and multi-client support
Date: Fri, 24 Oct 2025 15:14:49 +0530
Message-ID: <20251024094452.549186-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024094452.549186-1-y-abhilashchandra@ti.com>
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

vpdma_update_dma_addr() was originally added to support multi-instance and
multi-client in vpdma. However it was dropped as it was unused.

We are adding support for TI VIP. Some devices may have multiple VIP
instances each with its own VPDMA engine. Within VIP, two slices can use a
single VPDMA engine simultaneously. So support for multi instances and
multiple clients is needed. Hence reintroduce multi-instance and
multi-client support. Also add kernel doc and switch to GPL version of
EXPORT_SYMBOL.

This reverts commit 9314891df119442a6ec1518b3d872c330e2bf1a1.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 48 +++++++++++++++++++++++++++
 drivers/media/platform/ti/vpe/vpdma.h |  3 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index bb8a8bd7980c..29ee1918bc1c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -552,6 +552,54 @@ EXPORT_SYMBOL(vpdma_submit_descs);
 
 static void dump_dtd(struct vpdma_dtd *dtd);
 
+/**
+ * vpdma_update_dma_addr() - update DMA address in a descriptor
+ * @vpdma: VPDMA device context
+ * @list: vpdma desc list to which we add this descriptor
+ * @dma_addr: new DMA address to program into the descriptor
+ * @write_dtd: descriptor pointer used to compute write-back address
+ * @drop: if true, set the drop bit in the write descriptor
+ * @idx: index of the descriptor in the list to update
+ *
+ * Updates dma addresses of the descriptor at @idx in @list.
+ * This allows reusing an existing descriptor list with a new buffer
+ * address, instead of rebuilding the list, which is needed when
+ * multiple clients share the same VPDMA engine. The list buffer is
+ * unmapped before the update and remapped after.
+ */
+void vpdma_update_dma_addr(struct vpdma_data *vpdma,
+			   struct vpdma_desc_list *list,
+			   dma_addr_t dma_addr,
+			   void *write_dtd, int drop, int idx)
+{
+	struct vpdma_dtd *dtd = list->buf.addr;
+	dma_addr_t write_desc_addr;
+	int offset;
+
+	dtd += idx;
+	vpdma_unmap_desc_buf(vpdma, &list->buf);
+
+	dtd->start_addr = dma_addr;
+
+	/* Calculate write address from the offset of write_dtd from start
+	 * of the list->buf
+	 */
+	offset = (void *)write_dtd - list->buf.addr;
+	write_desc_addr = list->buf.dma_addr + offset;
+
+	if (drop)
+		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
+							   1, 1, 0);
+	else
+		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
+							   1, 0, 0);
+
+	vpdma_map_desc_buf(vpdma, &list->buf);
+
+	dump_dtd(dtd);
+}
+EXPORT_SYMBOL_GPL(vpdma_update_dma_addr);
+
 void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
 			u32 width, u32 height)
 {
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index e4d7941c6207..5b3a0cd49a3c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -222,6 +222,9 @@ void vpdma_free_desc_list(struct vpdma_desc_list *list);
 int vpdma_submit_descs(struct vpdma_data *vpdma, struct vpdma_desc_list *list,
 		       int list_num);
 bool vpdma_list_busy(struct vpdma_data *vpdma, int list_num);
+void vpdma_update_dma_addr(struct vpdma_data *vpdma,
+			   struct vpdma_desc_list *list, dma_addr_t dma_addr,
+			   void *write_dtd, int drop, int idx);
 
 /* VPDMA hardware list funcs */
 int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv);
-- 
2.34.1


