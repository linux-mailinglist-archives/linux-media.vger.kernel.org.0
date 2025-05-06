Return-Path: <linux-media+bounces-31863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E0AACAA0
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 18:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9651C42E72
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3DB28467C;
	Tue,  6 May 2025 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fwDG+IVO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238B284B21
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548070; cv=none; b=dxYp4LQNZWP5wl1L8rgr12HNTaiK41QInANIhPoePhE/yhFmwUuRfML0EXs1xiAIpFZCgwgmS9uO+NQIjfSxvuYJFPGkZefG63feVGM5ZLe43gjAevmNniDw+pugnqWUj9UDUttROy8lkAKap+jxQHz/NR/FD1xi+1uk6lS37J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548070; c=relaxed/simple;
	bh=BzXKbM8wh8Tvn9eRMDkRrMVZkIFojF1+l/emKbp8jYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LnVCRBANnGDZ36dGgrtiBkrrdLj1HMA20lhf7dHbY5w9sqSjWUoM5Kotuo0TJdFvS9uTAGKNZoEs7m6zxQCM69FMxJxeLhMI/vlNdCmVJVZ//45TE58wnN/K5J8nYqdJoReAx3Ugcsvm94L2Z8fgsDwfuoPCb/vxrkI/kYWa3zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fwDG+IVO; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250506161422euoutp02265f990dad1bcee30a23bb12669c0b9c~8-DWB6L6P1281312813euoutp02L
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:14:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250506161422euoutp02265f990dad1bcee30a23bb12669c0b9c~8-DWB6L6P1281312813euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746548062;
	bh=OE2cRkTkOYpXuv15aHxMbiUvH5dQCxlOg8WtuJAV98g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fwDG+IVOUQuksj/nnZ5kfvb8hJFr3/FJGwAi5D1Yy0RZ18P29wk5DM4ph/mU3B6ac
	 sMHCyuo4Jn0Zneq/ulIIwoSIK1jmEreJXmrbsM9DOz1j9Co62dSZnsoRbet5eIlvHE
	 aK1e85TSHOGvWns7zeVnENHS3Lm24S9VgwuuA9Uc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de~8-DVkn8Am1862718627eucas1p1v;
	Tue,  6 May 2025 16:14:21 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250506161421eusmtip2f63d10d07d7f41de33bdffeecaa72288~8-DVEAWPM0367703677eusmtip2C;
	Tue,  6 May 2025 16:14:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Gerd Hoffmann
	<kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit
	Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Gurchetan Singh <gurchetansingh@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 2/3] udmabuf: use sgtable-based scatterlist wrappers
Date: Tue,  6 May 2025 18:13:45 +0200
Message-Id: <20250506161346.1211105-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506161346.1211105-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de
X-EPHeader: CA
X-CMS-RootMailID: 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de
References: <20250506161346.1211105-1-m.szyprowski@samsung.com>
	<CGME20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de@eucas1p1.samsung.com>

Use common wrappers operating directly on the struct sg_table objects to
fix incorrect use of statterlists sync calls. dma_sync_sg_for_*()
functions have to be called with the number of elements originally passed
to dma_map_sg_*() function, not the one returned in sgtable's nents.

Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/dma-buf/udmabuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7eee3eb47a8e..c9d0c68d2fcb 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -264,8 +264,7 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 			ubuf->sg = NULL;
 		}
 	} else {
-		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
-				    direction);
+		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
 	}
 
 	return ret;
@@ -280,7 +279,7 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 	if (!ubuf->sg)
 		return -EINVAL;
 
-	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
+	dma_sync_sgtable_for_device(dev, ubuf->sg, direction);
 	return 0;
 }
 
-- 
2.34.1


