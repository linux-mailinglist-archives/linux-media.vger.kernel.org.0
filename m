Return-Path: <linux-media+bounces-31864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47463AACAA3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 18:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3240D1C42FE8
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD702853F6;
	Tue,  6 May 2025 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PUzKD2UJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B9A284B45
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548072; cv=none; b=mpYf9x5UUjv6+yTWMJTWRDaatrQxufzXv5q6DgBH7eebQI6sgjoMgxqkyDZJVEZXmfFw/GhuHAwTCDAfafr7poFbsLybEvcmUuz7wnS/j++XkV/zN3gB2jz74NPZY+Ox6v7temxkHMOgxz6TRJ6PZNfEqs+o3ertmFal0LGEADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548072; c=relaxed/simple;
	bh=Bx12HwbK2g0/WiuMAX6LoUxUr/a67JMjHSrnplSmpjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=c7p9WdrPzSsMvSsKPgfcpaZZQgdUPXpIycPZTO/Ikmwc3P3wTe3A4Hh6gAAMbpS84iIWr9Xn1d8HEdBTKIxL4FrLRyx45Sp6O/dZivJh+lae/LHehB0gSG5EH6ul78e2vdiLJJg97zRYgTNF5ruDPMbDsb89d84tzG7QdLbRUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PUzKD2UJ; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250506161422euoutp02b545e9db7aca7e712cdc35d7c8e8eae5~8-DWdmiKs1174411744euoutp02a
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:14:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250506161422euoutp02b545e9db7aca7e712cdc35d7c8e8eae5~8-DWdmiKs1174411744euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746548062;
	bh=R9q7Jvt/vvnvLvP5MlEUycQ7Jn8CgPtIl0CrrLxmcLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PUzKD2UJ5wIZjaDENYXdq1qbWwANyinFlimDwA5UDvVH6nWxXLAmCgRBZGV4wBrPA
	 zv/vAxu6QA0BPCGupqjDQKmMLeNsZNyDgM1QjTPgW0DhvU7vWKgvv52xsnOKnHgsjb
	 hrrRlqfGtJSg8hPnnv/CQ0dqCT4rLOMtb8HxgbtQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250506161422eucas1p2edddea0233c1d47541bd42145fbd9db1~8-DWFmoiw1851618516eucas1p2V;
	Tue,  6 May 2025 16:14:22 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250506161421eusmtip2d4b568e08cf5a0107f5e9a307705ba7b~8-DVp_-ME0190501905eusmtip2f;
	Tue,  6 May 2025 16:14:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 3/3] omap3isp:: use sgtable-based scatterlist wrappers
Date: Tue,  6 May 2025 18:13:46 +0200
Message-Id: <20250506161346.1211105-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506161346.1211105-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250506161422eucas1p2edddea0233c1d47541bd42145fbd9db1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250506161422eucas1p2edddea0233c1d47541bd42145fbd9db1
X-EPHeader: CA
X-CMS-RootMailID: 20250506161422eucas1p2edddea0233c1d47541bd42145fbd9db1
References: <20250506161346.1211105-1-m.szyprowski@samsung.com>
	<CGME20250506161422eucas1p2edddea0233c1d47541bd42145fbd9db1@eucas1p2.samsung.com>

Use common wrappers operating directly on the struct sg_table objects to
fix incorrect use of statterlists sync calls. dma_sync_sg_for_*()
functions have to be called with the number of elements originally passed
to dma_map_sg_*() function, not the one returned in sgtable's nents.

Fixes: d33186d0be18 ("[media] omap3isp: ccdc: Use the DMA API for LSC")
Fixes: 0e24e90f2ca7 ("[media] omap3isp: stat: Use the DMA API")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/ti/omap3isp/ispccdc.c | 8 ++++----
 drivers/media/platform/ti/omap3isp/ispstat.c | 6 ++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index dd375c4e180d..7d0c723dcd11 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -446,8 +446,8 @@ static int ccdc_lsc_config(struct isp_ccdc_device *ccdc,
 		if (ret < 0)
 			goto done;
 
-		dma_sync_sg_for_cpu(isp->dev, req->table.sgt.sgl,
-				    req->table.sgt.nents, DMA_TO_DEVICE);
+		dma_sync_sgtable_for_cpu(isp->dev, &req->table.sgt,
+					 DMA_TO_DEVICE);
 
 		if (copy_from_user(req->table.addr, config->lsc,
 				   req->config.size)) {
@@ -455,8 +455,8 @@ static int ccdc_lsc_config(struct isp_ccdc_device *ccdc,
 			goto done;
 		}
 
-		dma_sync_sg_for_device(isp->dev, req->table.sgt.sgl,
-				       req->table.sgt.nents, DMA_TO_DEVICE);
+		dma_sync_sgtable_for_device(isp->dev, &req->table.sgt,
+					    DMA_TO_DEVICE);
 	}
 
 	spin_lock_irqsave(&ccdc->lsc.req_lock, flags);
diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
index 359a846205b0..d3da68408ecb 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.c
+++ b/drivers/media/platform/ti/omap3isp/ispstat.c
@@ -161,8 +161,7 @@ static void isp_stat_buf_sync_for_device(struct ispstat *stat,
 	if (ISP_STAT_USES_DMAENGINE(stat))
 		return;
 
-	dma_sync_sg_for_device(stat->isp->dev, buf->sgt.sgl,
-			       buf->sgt.nents, DMA_FROM_DEVICE);
+	dma_sync_sgtable_for_device(stat->isp->dev, &buf->sgt, DMA_FROM_DEVICE);
 }
 
 static void isp_stat_buf_sync_for_cpu(struct ispstat *stat,
@@ -171,8 +170,7 @@ static void isp_stat_buf_sync_for_cpu(struct ispstat *stat,
 	if (ISP_STAT_USES_DMAENGINE(stat))
 		return;
 
-	dma_sync_sg_for_cpu(stat->isp->dev, buf->sgt.sgl,
-			    buf->sgt.nents, DMA_FROM_DEVICE);
+	dma_sync_sgtable_for_cpu(stat->isp->dev, &buf->sgt, DMA_FROM_DEVICE);
 }
 
 static void isp_stat_buf_clear(struct ispstat *stat)
-- 
2.34.1


