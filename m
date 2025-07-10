Return-Path: <linux-media+bounces-37263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37585AFFB58
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85FB05A46A0
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E51828B4E0;
	Thu, 10 Jul 2025 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pgOlG69o"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF728853C
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133909; cv=none; b=TCRdL/WiV9OHfbt1hmAAWkuqJKHzCsOQUbwqQTwS1sH7QwStW94d2c/7P9TN4HdcG08tUX3CCfH1zwlMl7/FcsC9gqSEXIspbVd7VMF6X/3qfcnYCnhuj7ZJPqYtzgx256T4cUJeIYJrdMD/mH4vj0TMknD7tcTIpwea2M6T6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133909; c=relaxed/simple;
	bh=40wL8A3i7v6nIYVUODdmmHf9IitOUZORRCrFP7EncU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Kns1ZuXkl/3hdsmDfIvxCB/YrUcW8aShf9TMRMLD0epZbz7qOV/6X6Q9MPak9SZgm//Qw3sDWqvAvOpQvQCKKl4je9PA7Er7rEoIYmNCY+Voo/jv/rBlAUu/NHjGfJMOAAx1NriE7lAWoRsS2j7FH2GbeIOipg9pEk3muUErRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pgOlG69o; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250710075145euoutp023421c2ec96a8472c1e02e363b508f683~Q1IDqxM-L2114321143euoutp02U
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:51:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250710075145euoutp023421c2ec96a8472c1e02e363b508f683~Q1IDqxM-L2114321143euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752133905;
	bh=TXIsTFiIi+RDdcK034cGQrqZL6mqvHBR3AnoOqnqpWw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=pgOlG69oKRLKMuoZW93IQ5xlyUgzmYL1zBBambfLMyXisq7FFbLOcec29aaGM5iiL
	 kx++fZXHn1IMc8KrMNj4db4bB7x+WaBH7pUkWkuZg1riMNF4JqifUuUtSeyMI5ZT7X
	 PVlSe5ZlmbL7XN/W7zcyua6yEBQqijzd+7n7GbiM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f~Q1IDdo3Fm2052020520eucas1p2G;
	Thu, 10 Jul 2025 07:51:44 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710075144eusmtip1fd9f339acca527f419621e2bb73cc277~Q1IDFCN2F3021630216eusmtip1X;
	Thu, 10 Jul 2025 07:51:44 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
	linux-fsd@tesla.com, Smitha T Murthy <smithatmurthy@gmail.com>, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [PATCH] media: v4l2: Add support for NV12M tiled variants to
 v4l2_format_info()
Date: Thu, 10 Jul 2025 09:51:30 +0200
Message-Id: <20250710075130.3940569-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f
X-EPHeader: CA
X-CMS-RootMailID: 20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f
References: <CGME20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f@eucas1p2.samsung.com>

Commit 6f1466123d73 ("media: s5p-mfc: Add YV12 and I420 multiplanar
format support") added support for the new formats to s5p-mfc driver,
what in turn required some internal calls to the v4l2_format_info()
function while setting up formats. This in turn broke support for the
"old" tiled NV12MT* formats, which are not recognized by this function.
Fix this by adding those variants of NV12M pixel format to
v4l2_format_info() function database.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index df40756ac8f6..0829d7028ef7 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -323,6 +323,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV61M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P012M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
+		/* Tiled YUV formats, non contiguous variant */
+		{ .format = V4L2_PIX_FMT_NV12MT,        .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+
 		/* Bayer RGB formats */
 		{ .format = V4L2_PIX_FMT_SBGGR8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-- 
2.34.1


