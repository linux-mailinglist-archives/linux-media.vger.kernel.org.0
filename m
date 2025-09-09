Return-Path: <linux-media+bounces-42069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C4B4A49A
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D5AF1B21504
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD1C247281;
	Tue,  9 Sep 2025 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WPLxeCFB"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4418246BB0;
	Tue,  9 Sep 2025 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405310; cv=none; b=W3snIUiMRvE0ApUsRwfBRkes+AiqxpCR2ItbeDXgXCj4bGT+/Hir6M4onA6eEcfPqzPaGbIOeLZl5xCMuimNKu6i12fKHIx6uMQxHPT8ojiBozSSiQ7m/U8OIUhWnYSvhl9dlWneVSNYK5vbiEsMy6X2YMpKToABTmV4AfGCeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405310; c=relaxed/simple;
	bh=89w6MEXCIhsoRMtf3xdonsIzzsSUSv4uhS13qrhfDQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzfZApM1zkNKXXSf72fud2x7/+dmubd3GRbnbybxRYn/3CZdpUHmsrSuyZWANq1cbiwyEA2p/Qn9v8G3pz8OoTpV2xiKTilhoL0ttJ13xMxZLPyFN6+m+E/Rw912wicgOpg9ID4KPzVyKQ76KiLo7CsSDdwP0jR9kPnBu+qjc0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WPLxeCFB; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58988M11293721;
	Tue, 9 Sep 2025 03:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757405302;
	bh=zAoKSSA3eOpGoSDC2uDEsYycNqZ4whp7kQEppdqyx30=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WPLxeCFBFFec+Q523cP7gR5ZZwRfVB8742Ga0F+Q2g8qe4kb4FIMc0RwqKuC4InMz
	 jy1Lu1lmoPzSxC0/jufr67a0FS8MA7HjC1Hkot/XXUbVYU5ng2R0MigJnQ0kJE+Fl0
	 7yWL7VOI0VvcLZLS0mBxtdPFMc57wIIEG+4PAjaA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58988MxD205175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 03:08:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 03:08:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 03:08:21 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58987soG2319864;
	Tue, 9 Sep 2025 03:08:17 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V3 3/5] media: platform: ti: Switch to EXPORT_SYMBOL_GPL()
Date: Tue, 9 Sep 2025 13:37:16 +0530
Message-ID: <20250909080718.1381758-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
References: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Switch to GPL version of EXPORT_SYMBOL for vpdma_update_dma_addr() and Fix
a small alignment issue while at it.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 7 ++++---
 drivers/media/platform/ti/vpe/vpdma.h | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index b79b7e8479f9..29ee1918bc1c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -568,8 +568,9 @@ static void dump_dtd(struct vpdma_dtd *dtd);
  * unmapped before the update and remapped after.
  */
 void vpdma_update_dma_addr(struct vpdma_data *vpdma,
-	struct vpdma_desc_list *list, dma_addr_t dma_addr,
-	void *write_dtd, int drop, int idx)
+			   struct vpdma_desc_list *list,
+			   dma_addr_t dma_addr,
+			   void *write_dtd, int drop, int idx)
 {
 	struct vpdma_dtd *dtd = list->buf.addr;
 	dma_addr_t write_desc_addr;
@@ -597,7 +598,7 @@ void vpdma_update_dma_addr(struct vpdma_data *vpdma,
 
 	dump_dtd(dtd);
 }
-EXPORT_SYMBOL(vpdma_update_dma_addr);
+EXPORT_SYMBOL_GPL(vpdma_update_dma_addr);
 
 void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
 			u32 width, u32 height)
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index 393fcbb3cb40..5b3a0cd49a3c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -223,8 +223,8 @@ int vpdma_submit_descs(struct vpdma_data *vpdma, struct vpdma_desc_list *list,
 		       int list_num);
 bool vpdma_list_busy(struct vpdma_data *vpdma, int list_num);
 void vpdma_update_dma_addr(struct vpdma_data *vpdma,
-	struct vpdma_desc_list *list, dma_addr_t dma_addr,
-	void *write_dtd, int drop, int idx);
+			   struct vpdma_desc_list *list, dma_addr_t dma_addr,
+			   void *write_dtd, int drop, int idx);
 
 /* VPDMA hardware list funcs */
 int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv);
-- 
2.34.1


