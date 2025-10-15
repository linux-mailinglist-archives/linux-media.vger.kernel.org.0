Return-Path: <linux-media+bounces-44511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC1BDC9E3
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97A7D4EF8EC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9AF30649A;
	Wed, 15 Oct 2025 05:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="min3pe1X"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102F305055;
	Wed, 15 Oct 2025 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506847; cv=none; b=fRWD6p/OaJqhGxkbVdGMuLAwwC87CwV9GRtWK0JKDHjVhNDc48bnzAwSs8aaTJY3oGzQ/6c6bHLQCRK+e0fVhDEkmcZkTyh+WnGniM8vUCBrF3k4ZNliOhWvhmMzOCDx8YzkFXIBhYtboO4F2xm9rI9JrPKdeei6UfCQMI5RCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506847; c=relaxed/simple;
	bh=NYRU8BV/OuyASZ0L2jC8DqfbFRBgaItpb5g7CznkW34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZOPttvkSh017rEmKFUQhujrYsRXo3irZpaFzWASQA9mZgUVxSKfxwp3VwDF0tns7BIOokaFdGlzF9vAZxBrNtbpB24wWYjMTRxf/ya6JUildtw44yX/LmB81ydbL7muQG6RvDASq8o33DGzs4W4SNzxmypqQ4dsCboWsipk22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=min3pe1X; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5eRRv1325969;
	Wed, 15 Oct 2025 00:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506827;
	bh=PA37AC6tL2tlIyZu7ECsuzZvr0T08u1j1guxwx+nqLw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=min3pe1XSfdRSqLer6zex3exFjvxu9zyslLKejB9b2PGigZJdbIMWwxf2MJwy5OKP
	 8s5o5NxaEtvb7crZSHrecey66mrPYHI0eRj0xtPDiWnhgYZzl2zaGtkx0yRuwWYJ3L
	 A24M6qUupDfaNUlk5DqQCGPVJNksu1+GQp7B+enY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5eRKE582020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 15 Oct 2025 00:40:27 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 15
 Oct 2025 00:40:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:40:26 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5eGdn1402458;
	Wed, 15 Oct 2025 00:40:22 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V4 1/4] media: ti: vpe: Re-introduce multi-instance and multi-client support
Date: Wed, 15 Oct 2025 11:10:07 +0530
Message-ID: <20251015054010.3594423-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
References: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
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
Changelog:
Changes in v4:
- Squash patches 1,2,3 of v3 into patch 1 of v4

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


