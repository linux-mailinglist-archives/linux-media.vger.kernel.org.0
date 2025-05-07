Return-Path: <linux-media+bounces-31980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F9AAE353
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C09FF7A5ABE
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED17289E0E;
	Wed,  7 May 2025 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="guZjK6sM"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64928934F
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628966; cv=none; b=bczR1HJLH3P4MyEx8d/PFBoNnhKUBKZyUiFPYPKHHVJY/EduDGCPBDdSruBReGBMPZGquYpTyanjlpTyNrXLaWh/HUNo3XsIEb+Qs6/Z7iX3CWF2BUw1OmrCzEeLCgMzehlrkAex8c6wKfrAqiX/0Mn/Vw+zSrek/X5vqT7lurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628966; c=relaxed/simple;
	bh=nT+JxUktjgaWnv4oVQvfPAtxQF4vQLFdnZTODzxasIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=gGKmNW4MrJbpnmGWCYylT7RZThLlIw4z3R8dH0/jVTF06z+VJ1b9p1ULPyb5HdGv07ZYBD469UeR7M1xOQqmXy+HcTRWFWL6ADBwydQcsMPksjnKCE2It/AdfTydYd3jB+zPWoDHLF+UyaVnewH8yQvHoLLT1laC2dz3oy7TjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=guZjK6sM; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250507144242euoutp024e41c74d01ed2c7ae768abc660fce5b8~9Rcl6L8zl0381303813euoutp02x
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 14:42:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250507144242euoutp024e41c74d01ed2c7ae768abc660fce5b8~9Rcl6L8zl0381303813euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746628962;
	bh=DbGys0US7skwcuhdvdVwOVZSicDyfO1yb004QE26BKw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=guZjK6sMfp3Due0zdoki94a/Dg56CJlCqj03/DvPwtpLQo3/Xya1JZ1n/zmT5mEIS
	 7t4BjTrPEt1HLXZGXz6lFwhgJYwGIjXjQpkxuTcSlhABw38myQzDZFIyVLUQIwqQKo
	 jjbzMLV514rdjP4BgIf/ih2wEXpfN8Y81dPqf7yY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250507144241eucas1p14542a410069bfe5bc010996ee74b9695~9RcldqLTR0872208722eucas1p1q;
	Wed,  7 May 2025 14:42:41 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250507144240eusmtip204f7fa06fe1ac4f0301c67cd939a4fd8~9RcktY56O2360223602eusmtip2f;
	Wed,  7 May 2025 14:42:40 +0000 (GMT)
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
Subject: [PATCH v2 0/3] media: fix incorrect use of dma_sync_sg_*() calls
Date: Wed,  7 May 2025 16:42:00 +0200
Message-Id: <20250507144203.2081756-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695
X-EPHeader: CA
X-CMS-RootMailID: 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695
References: <CGME20250507144241eucas1p14542a410069bfe5bc010996ee74b9695@eucas1p1.samsung.com>

Dear All,

This patchset fixes the incorrect use of dma_sync_sg_*() calls in
media and related drivers. They are replaced with much safer
dma_sync_sgtable_*() variants, which take care of passing the proper
number of elements for the sync operation.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Change log:
-v2: fixes typos and added cc: stable


Patch summary:

Marek Szyprowski (3):
  media: videobuf2: use sgtable-based scatterlist wrappers
  udmabuf: use sgtable-based scatterlist wrappers
  media: omap3isp: use sgtable-based scatterlist wrappers

 drivers/dma-buf/udmabuf.c                         | 5 ++---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 4 ++--
 drivers/media/platform/ti/omap3isp/ispccdc.c      | 8 ++++----
 drivers/media/platform/ti/omap3isp/ispstat.c      | 6 ++----
 4 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.34.1


