Return-Path: <linux-media+bounces-31862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B47AACAA1
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 18:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 010C37B719C
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F41B284B5F;
	Tue,  6 May 2025 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bOgubCQl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF328368F
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548070; cv=none; b=M/jNTmWfNrIzouAPkK1ZvGgbjHOuvkgDDKeFexLk4YyI/A+qNAAwJgS/MxW4SA8XD50NTqf0lnkFbljDIhA1dRZvrx4rUWUywuSfP1wj8ctVsXBDQgp18w9p/of4liFADaoxzOp2uAwqWXtYVXPLO7jHLOgT9wn3Hrg78RrZL04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548070; c=relaxed/simple;
	bh=NQMKDzPrsTznQsdY47h1wRctnq2LM8luV60J/G4zDEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Ld8GVef8I63VNz9nHmtHNOVbwmF3Xodk5pDETSMs4ZxN/Lqj9gR6wLwy9vZ2Q58hdPxQsQp6lXL/jbTPPKFwlSLTt3qJAWLVxez6cDedhYX0MGQZ6gyJS7eX0Jea4UYlBd/w8Vvqt0kNoK6pSzBeNt+G/W2npg4Hc07lYn63zFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bOgubCQl; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250506161421euoutp02dd0ac62f883a51f3d2f7113bace6d440~8-DVCNVOr1174411744euoutp02Y
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:14:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250506161421euoutp02dd0ac62f883a51f3d2f7113bace6d440~8-DVCNVOr1174411744euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746548061;
	bh=LhEIDzPK3RvKZEBceRbDdfPrXJegfKev0Ozuz3A9Xts=;
	h=From:To:Cc:Subject:Date:References:From;
	b=bOgubCQlk4q1/5f9MyQ2fGda6DFAh5WYUl9it+MLvZW7TzWMuhe9jqKaUK1z/iiUw
	 KySWiEiwQz4tRc0V3fOpOerQd9szInIB2lwrvh8rAujQVSmHmjqu1J9mWLToIrPti4
	 mEvXwkgUCqzMTPGy9aa5lUgiQw3XTS8m6oloaPRA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b~8-DUeWA2S0408504085eucas1p1C;
	Tue,  6 May 2025 16:14:20 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250506161419eusmtip26942da3e12a8e7b32708a6ec1b746d39~8-DTuYPA40137601376eusmtip2X;
	Tue,  6 May 2025 16:14:19 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
	<tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey
	Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
	<vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Gurchetan
	Singh <gurchetansingh@chromium.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 0/3] media: fix incorrect use of dma_sync_sg_*() calls
Date: Tue,  6 May 2025 18:13:43 +0200
Message-Id: <20250506161346.1211105-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b
X-EPHeader: CA
X-CMS-RootMailID: 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b
References: <CGME20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b@eucas1p1.samsung.com>

Dear All,

This patchset fixes the incorrect use of dma_sync_sg_*() calls in
media and related drivers. They are replaced with much safer
dma_sync_sgtable_*() variants, which take care of passing the proper
number of elements for the sync operation.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (3):
  media: videobuf2: use sgtable-based scatterlist wrappers
  udmabuf: use sgtable-based scatterlist wrappers
  omap3isp:: use sgtable-based scatterlist wrappers

 drivers/dma-buf/udmabuf.c                         | 5 ++---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 4 ++--
 drivers/media/platform/ti/omap3isp/ispccdc.c      | 8 ++++----
 drivers/media/platform/ti/omap3isp/ispstat.c      | 6 ++----
 4 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.34.1


