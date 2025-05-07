Return-Path: <linux-media+bounces-31992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5CAAE631
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581EE980266
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6184128C006;
	Wed,  7 May 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KSZeSTQG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDC289E21
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634166; cv=none; b=HkLdlt267kjdDLVcfWq1zXM0i7bdbbDvIG4qjmW6Q0n1367+mprfdVB+MybTypONWnrJTErPXyDzjl21XaXerSMU/gYcwB9pl3H18xylTjkZy5ZyTy20qHPzkzzwf8/3XDchBkGjyUOeMsvaIKlDEeVZaXp5GZavvKaVb0bcJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634166; c=relaxed/simple;
	bh=xzmb2PLhpxgH7J9f0XbQH0kNx0j0SJyiEhhEqv0470s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=IjS3ydreFvHIm891fOQnJPPeDAU3y10T3rS7I09BjP/T5nchvMQoRFmjrzFSFewKPkzkQz6O6lirG2wW7FhEa6dhy3u/9b0ztDQbUl4QJjG5RkHjx/dW8iRbUsac0oW3AHvuFlIDP+wyfahsgtOqmv5NSkZh5AvVpjL3P8dou9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KSZeSTQG; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250507160922euoutp02b879e1d4a1e9c64f6bbfc9c49818d4f3~9SoQsd5HF0396403964euoutp02d
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 16:09:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250507160922euoutp02b879e1d4a1e9c64f6bbfc9c49818d4f3~9SoQsd5HF0396403964euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746634162;
	bh=M3SqDjMH2OEj84bPabFMQ0Loj/zISCk3BQwUb/ZH58w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSZeSTQGAmdjDLwrqmcZ+uwZJv4a2zEbTRnieHRsVYF2jeaR2shTih9gnx0NLUB+F
	 b+6tapJbT7hpH1FiG/hhdpNQ9bFu53GJcHD6Ws5i6YSnRmDwlV/+7R9DlO9K58+J+b
	 2B9FpV/06jJug+JP63TMo0BakbgV2dagkoEE9ZmI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73~9SoQbt7wG1792117921eucas1p2C;
	Wed,  7 May 2025 16:09:21 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250507160921eusmtip14167cae9141d9bd450c3182711e4dec3~9SoP_b54S3077630776eusmtip1-;
	Wed,  7 May 2025 16:09:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey
	Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
Subject: [PATCH v3 1/3] media: videobuf2: use sgtable-based scatterlist
 wrappers
Date: Wed,  7 May 2025 18:09:11 +0200
Message-Id: <20250507160913.2084079-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507160913.2084079-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73
X-EPHeader: CA
X-CMS-RootMailID: 20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
	<CGME20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73@eucas1p2.samsung.com>

Use common wrappers operating directly on the struct sg_table objects to
fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
functions have to be called with the number of elements originally passed
to dma_map_sg_*() function, not the one returned in sgt->nents.

Fixes: d4db5eb57cab ("media: videobuf2: add begin/end cpu_access callbacks to dma-sg")
CC: stable@vger.kernel.org
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


