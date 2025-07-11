Return-Path: <linux-media+bounces-37467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F563B0187F
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6E1E16A82D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81227E1D5;
	Fri, 11 Jul 2025 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="V7XznGCR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049BD27E1D0
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226939; cv=none; b=CA6v1EXce+3wg1UOHuQyc2ijLW0TXdXsdZIq14uRzKJdlIqQRMrVQPkfVaip9sPOKwLuNd0LMkJ4bnWpeOah52lB+3KnyzCGOAAiYSgrnb4eo6ogEjnDh8l305qJM34KLqj+b1O3DINbaZdtq8btAiwyvxcf2ORQaMFUDzimSwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226939; c=relaxed/simple;
	bh=Aw4IHwhSVComxijkQZmfPPBFVTt8+v3V6FOeMuLV4Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=t6b0Y2X+bZhcGw+p87GByJlICzpvRcOGfP+1Po2Wta+bde3OTV/Wj/dGiacZua8B5cnKjOhEyEH1M/a/pNHlS9MsOkwoEPgbxbA0cRPEK+oceIwQjEsPkMSuISKUiqSs+lQWUufwODrJBfr8GKwPg6L0vbIs7L7QcMVje2EDtQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=V7XznGCR; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250711094215euoutp011325bca56fcf1ceba668aae7bb13b438~RKR0iUZoN0276502765euoutp019
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:42:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250711094215euoutp011325bca56fcf1ceba668aae7bb13b438~RKR0iUZoN0276502765euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752226935;
	bh=Yo5Qc8AgCyaJOahDYss18TVig4dLAJ9iHPGMYt9t/mw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=V7XznGCR26zaVD1lgYPd4k534zynxKA6N+/aRZ/8PTR8ZHf2OrJxDcx0tyMMtsWgk
	 vbnHJOAjESYnBSHglbQYuSG8JhybtMzNu6+SC6/0aIqR/OgwsYqmxm3ozk51IghiFn
	 ZerNkTVtMws4Dt/k0o22DgE5bcQjshlJDTfpWoPU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785~RKR0Nvc9l2943829438eucas1p2i;
	Fri, 11 Jul 2025 09:42:14 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250711094214eusmtip132f17d4e07628f41c2e8a75dd313cec0~RKRz1OATS0863808638eusmtip1y;
	Fri, 11 Jul 2025 09:42:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-media@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
	linux-fsd@tesla.com, Smitha T Murthy <smithatmurthy@gmail.com>, Aakarsh Jain
	<aakarsh.jain@samsung.com>, Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2] media: v4l2: Add support for NV12M tiled variants to
 v4l2_format_info()
Date: Fri, 11 Jul 2025 11:41:58 +0200
Message-Id: <20250711094159.144293-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785
X-EPHeader: CA
X-CMS-RootMailID: 20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785
References: <CGME20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785@eucas1p2.samsung.com>

Commit 6f1466123d73 ("media: s5p-mfc: Add YV12 and I420 multiplanar
format support") added support for the new formats to s5p-mfc driver,
what in turn required some internal calls to the v4l2_format_info()
function while setting up formats. This in turn broke support for the
"old" tiled NV12MT* formats, which are not recognized by this function.
Fix this by adding those variants of NV12M pixel format to
v4l2_format_info() function database.

Fixes: 6f1466123d73 ("media: s5p-mfc: Add YV12 and I420 multiplanar format support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- added Fixes tag and block_w/h restrictions as suggested by Nicolas
---
 drivers/media/v4l2-core/v4l2-common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index df40756ac8f6..c8bd8e5697d4 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -323,6 +323,12 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV61M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P012M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
+		/* Tiled YUV formats, non contiguous variant */
+		{ .format = V4L2_PIX_FMT_NV12MT,        .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
+		  .block_w = { 64, 32, 0, 0 },	.block_h = { 32, 16, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
+		  .block_w = { 16,  8, 0, 0 },	.block_h = { 16,  8, 0, 0 }},
+
 		/* Bayer RGB formats */
 		{ .format = V4L2_PIX_FMT_SBGGR8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-- 
2.34.1


