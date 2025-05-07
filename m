Return-Path: <linux-media+bounces-31981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6DAAE354
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 131247A6124
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF5D289813;
	Wed,  7 May 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hrf3G/n/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D92288CB7
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628967; cv=none; b=tFiOG9HJwrXhKjP2jwrB/hWmYk6zPeRc6YZxnOhfE4A34LHuXxTRTFvNHrdtQk3gGjZClxsyGrAe/hgLwD3BeJA2Yx8VHWhKaDTYs8rgKn9tmwG8xuPTBc9c2ChCBc/5FezzHfdBm5Hmbmlhcpj08lnPCMca8zLW/E/RiFGpDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628967; c=relaxed/simple;
	bh=R+3UWuBzA57ttcgNwILPDOqsoPLeiwfpTd+rT8R5Cbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=TU96nE0bi86ipNtOMTPex3vuPND+DWciubl4tatz1AyOmfB2IxlrhoeR2QzO93q2gH9j+rsaeyc5k84kn/JFEuTQ6WITw7ArhdimN3wnyw1oyVR0jRrcf1ObVwgXNo2pHQwgQE5Z2JQoGrhT2cZgyloizLi6xq91zTDr0LFuP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hrf3G/n/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250507144242euoutp02e6aeab36831d96dc606b262362d8b09e~9Rcmh9kZ60434204342euoutp02h
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 14:42:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250507144242euoutp02e6aeab36831d96dc606b262362d8b09e~9Rcmh9kZ60434204342euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746628962;
	bh=Ect8ZweMR3H51tCeyLBNq6VsNn2cyH5WOnSmVn/wrAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hrf3G/n/Kjkrf7c97CUTDXz+VD8U58myY0jZBOlg2cNSePayVW9+we/C3+9QP4cAy
	 sRr3E5UIiVD1kexkBTlQXtZpou1yVtQ5uIt1Zh9/4Cl8ALZT2FpM5On4siMaO8lKRT
	 +cQtDr/zdWvaHJhyxdXFbnzhj6nw+Obh+mgilmsE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250507144242eucas1p11523dca9f94c6e10fee75ca340076303~9RcmAYvGG0749607496eucas1p1d;
	Wed,  7 May 2025 14:42:42 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250507144241eusmtip2af1414558fdd6a0f9f652bc6979443b5~9Rcli2JaP0180601806eusmtip2D;
	Wed,  7 May 2025 14:42:41 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey
	Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] media: videobuf2: use sgtable-based scatterlist
 wrappers
Date: Wed,  7 May 2025 16:42:01 +0200
Message-Id: <20250507144203.2081756-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507144203.2081756-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250507144242eucas1p11523dca9f94c6e10fee75ca340076303
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507144242eucas1p11523dca9f94c6e10fee75ca340076303
X-EPHeader: CA
X-CMS-RootMailID: 20250507144242eucas1p11523dca9f94c6e10fee75ca340076303
References: <20250507144203.2081756-1-m.szyprowski@samsung.com>
	<CGME20250507144242eucas1p11523dca9f94c6e10fee75ca340076303@eucas1p1.samsung.com>

Use common wrappers operating directly on the struct sg_table objects to
fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
functions have to be called with the number of elements originally passed
to dma_map_sg_*() function, not the one returned in sgt->nents.

Fixes: d4db5eb57cab ("media: videobuf2: add begin/end cpu_access callbacks to dma-sg")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c6ddf2357c58..b3bf2173c14e 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -469,7 +469,7 @@ vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 	return 0;
 }
 
@@ -480,7 +480,7 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
 	return 0;
 }
 
-- 
2.34.1


