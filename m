Return-Path: <linux-media+bounces-15841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727C948F70
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97F1B1C20F21
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 12:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38E51C462A;
	Tue,  6 Aug 2024 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sGfssVKc"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7314BFB0
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722948491; cv=none; b=L8EGKQFwqYnpTV/7u0WrGFCQtqYIHJUswfDN3JaL/106nrjCzqSgMlRAYisjLdUMD3UnDgzGfXpc12c8aIDejFoIkyXsMWVRYC+WAvcD/KGi3zBM6Q0oIP/gD/l2CJ8TKC+WhNY6UEA2Xvx978sc86XiMpECWqQopv/hesHi7kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722948491; c=relaxed/simple;
	bh=GMG33s26NIQZt1+FocIteInfnpZsdoU1Jna78RBP0TE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=AhMS09DROAtdaFPOkCOSPOcU+DrrnN8n/HtVS52/3P5aNh1kVxJdB/S6fvUV+qomwc0OJaTv2V2iyLmqJJhWvhZjDikO4fUlXlvoL1vWfoB2vZ361zK1KcN8O7+06iqrCCHw16xi2NoqBFUy6j0hR1qW2Z+ofCmU8mHw6LmiEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sGfssVKc; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240806124806epoutp0390f3a1a0b35c2b333dc198640c6496fc~pJIUCE9Z91639516395epoutp03F
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 12:48:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240806124806epoutp0390f3a1a0b35c2b333dc198640c6496fc~pJIUCE9Z91639516395epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722948486;
	bh=QEtNHtSIRpFLQ01HmiZiDyTT4HWV/qbWxmK/lhObWlk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=sGfssVKcBnEYKetXdCIFBGoQdZ6RrWlYwzrk2zfk8wek5bS9PK+EVkSxgibzEUWjU
	 sqTOan5J2NOGOJlwF/U5/zeR1lLJcg7b4hFtxgP7XPd70Q03MZ3hmP3jXh72ueadLy
	 syIAx13ZmyrNAnCSr+RFQJdmNsH98L0VtA0N51Z4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240806124805epcas5p2d53b355c44898279dde28938c1bdb6c5~pJITmwos-1377113771epcas5p29;
	Tue,  6 Aug 2024 12:48:05 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WdY4h0hJsz4x9Pp; Tue,  6 Aug
	2024 12:48:04 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.03.09640.38B12B66; Tue,  6 Aug 2024 21:48:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e~pImVVCbEx2322623226epcas5p1B;
	Tue,  6 Aug 2024 12:09:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240806120910epsmtrp282af1e81e0f56b730bc118d524d22f05~pImVNyaKs0294202942epsmtrp2K;
	Tue,  6 Aug 2024 12:09:10 +0000 (GMT)
X-AuditID: b6c32a49-aabb8700000025a8-e9-66b21b83dae5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C6.E8.08456.66212B66; Tue,  6 Aug 2024 21:09:10 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240806120909epsmtip2899fc7b950568b76927de86a555ad74d~pImTaRr0G1162811628epsmtip2M;
	Tue,  6 Aug 2024 12:09:08 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [PATCH] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Tue,  6 Aug 2024 17:27:14 +0530
Message-Id: <20240806115714.29828-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmhm6z9KY0g60/zS2e7pjJanF/8WcW
	i0Obt7Jb3Dywk8ni4sy7LBZ9Lx4yW2x6fI3V4vKuOWwWPRu2slrMOL+PyWLtkbvsFss2/WGy
	WLT1C7sDr8fiPS+ZPDat6mTzuHNtD5vH5iX1Hn1bVjF6fN4k53Hq62f2APaobJuM1MSU1CKF
	1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGuVFMoSc0qBQgGJxcVK
	+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZBx7NYC/4JlSx
	q30vYwPjDIEuRk4OCQETiS3zvzJ3MXJxCAnsZpT413qMDcL5xCgxpWE1lPONUaLvziNmmJZl
	d/8xQST2Mkr0X/0L1d/KJNHzZhGQw8HBJqArcXZ7DkiDiECqxKt1a1lBapgFljBJLDryjAmk
	RljASWLbWSWQGhYBVYmnzRNZQWxeAVuJXZe2skIsk5dYveEA2HwJgY/sEp8+/IZKuEhcvvmM
	EcIWlnh1fAs7hC0l8fndXjYIO1ni8aKXUFfnSKzfM4UFwraXOHBlDgvIDcwCmhLrd+lDhGUl
	pp5axwRiMwvwSfT+fsIEEeeV2DEPxlaTmHPnB9QJMhKHVy+FOsFDYtfiE2DjhQRiJb6eusc8
	gVF2FsKGBYyMqxglUwuKc9NTi00LDPNSy+ERlZyfu4kRnAi1PHcw3n3wQe8QIxMH4yFGCQ5m
	JRHertINaUK8KYmVValF+fFFpTmpxYcYTYFhNpFZSjQ5H5iK80riDU0sDUzMzMxMLI3NDJXE
	eV+3zk0REkhPLEnNTk0tSC2C6WPi4JRqYNKwnff6vOtNvfXLbri9N9LWjNDrT/8++6aArTev
	yJ3Dyy/oCPxR1LRz8TvOKa0nvpB5baEzvzjbv6uXjVVdmtatLDiZ+W3agWNHC2ewRO6cMmfe
	TIHYiTccPISjPtvWJT9bWPLjSavc4qhz+T5G/Vc8w4UXLpXlm3/opkNd5q881tg1/jILp3S0
	LlqQfmfj//gpnC+m1rpP9MmNuf/unaL1pasJsbrOMaXryvhPT3sWse1RruD+RA+NlDOTCli/
	/3h58eKa/PlyFvU2s28escyRMu7VeJ2tHz05+Pos2z6+ebGZsdM3Mvm9OG8y8Ra3UMbKbo8z
	h2Ttr5/USrdQ1b/Y0pz4a+vX2Z/0XwsymiixFGckGmoxFxUnAgABejHdDQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCLMWRmVeSWpSXmKPExsWy7bCSvG6a0KY0gx8NxhZPd8xktbi/+DOL
	xaHNW9ktbh7YyWRxceZdFou+Fw+ZLTY9vsZqcXnXHDaLng1bWS1mnN/HZLH2yF12i2Wb/jBZ
	LNr6hd2B12PxnpdMHptWdbJ53Lm2h81j85J6j74tqxg9Pm+S8zj19TN7AHsUl01Kak5mWWqR
	vl0CV8aBRzPYC74JVexq38vYwDhDoIuRk0NCwERi2d1/TF2MXBxCArsZJd7e+M0GkZCR+N92
	jB3CFpZY+e85mC0k0Mwk8eKfehcjBwebgK7E2e05IGERgXSJSXe+soDMYRZYxySxc+VEVpAa
	YQEniW1nlUBqWARUJZ42g4Q5OXgFbCV2XdrKCjFeXmL1hgPMExh5FjAyrGKUTC0ozk3PLTYs
	MMpLLdcrTswtLs1L10vOz93ECA5ILa0djHtWfdA7xMjEwXiIUYKDWUmEt6t0Q5oQb0piZVVq
	UX58UWlOavEhRmkOFiVx3m+ve1OEBNITS1KzU1MLUotgskwcnFINTAyrF7o4/z555/Lp6dJX
	rxau9SuRvLRs67Mti2I5trw/XbXe5Y7/LanfwfauJ9UFRbacvGWbdy5x05ENMVGZp1icQs0v
	a8s96Vt/vy/3ofBO7ykp87cwf7pjpvqvbc0F3qWs/5JDnJNc/tUq5hiKXH1+5UtK1BOJGesd
	DbcGHv/6SF+Q8UHe4imi1jNVtPKDXvHmOhtVx53ZNPnL57OMl3uNJ4gfNr/ezvN0ofAXPt+S
	vQKprDs2xj6RjHm21+L+jbfqrDzHTy2cFlHQ87d+woq4zpCI5a9YJgVt1Z8500tdU35ThI3t
	FzHXLZNYnLV2/UzS5Vgh7ip1wznZ9M+WpKRKhqWsZjtUlibOWFH1jVuJpTgj0VCLuag4EQAk
	pH9wtwIAAA==
X-CMS-MailID: 20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e
References: <CGME20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

There is a possibility of getting page fault if the overall
buffer size is not aligned to 256bytes. Since MFC does read
operation only and it won't corrupt the data values even if
it reads the extra bytes.
Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
and V4L2_PIX_FMT_NV21M pixel format.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 .../media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 73f7af674c01..03c957221fc4 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -498,8 +498,8 @@ static void s5p_mfc_dec_calc_dpb_size_v6(struct s5p_mfc_ctx *ctx)
 	case V4L2_PIX_FMT_NV21M:
 		ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12MT_HALIGN_V6);
 		ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12MT_HALIGN_V6);
-		ctx->luma_size = calc_plane(ctx->stride[0], ctx->img_height);
-		ctx->chroma_size = calc_plane(ctx->stride[1], (ctx->img_height / 2));
+		ctx->luma_size = calc_plane(ctx->img_width, ctx->img_height);
+		ctx->chroma_size = calc_plane(ctx->img_width, (ctx->img_height >> 1));
 		break;
 	case V4L2_PIX_FMT_YUV420M:
 	case V4L2_PIX_FMT_YVU420M:
@@ -539,9 +539,11 @@ static void s5p_mfc_dec_calc_dpb_size_v6(struct s5p_mfc_ctx *ctx)
 static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
 {
 	unsigned int mb_width, mb_height;
+	unsigned int default_size;
 
 	mb_width = MB_WIDTH(ctx->img_width);
 	mb_height = MB_HEIGHT(ctx->img_height);
+	default_size = (mb_width * mb_height) * 256;
 
 	if (IS_MFCV12(ctx->dev)) {
 		switch (ctx->src_fmt->fourcc) {
@@ -549,8 +551,8 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
 		case V4L2_PIX_FMT_NV21M:
 			ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
 			ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
-			ctx->luma_size = ctx->stride[0] * ALIGN(ctx->img_height, 16);
-			ctx->chroma_size =  ctx->stride[0] * ALIGN(ctx->img_height / 2, 16);
+			ctx->luma_size = ALIGN(default_size, 256);
+			ctx->chroma_size = ALIGN(default_size / 2, 256);
 			break;
 		case V4L2_PIX_FMT_YUV420M:
 		case V4L2_PIX_FMT_YVU420M:
-- 
2.17.1


