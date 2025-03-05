Return-Path: <linux-media+bounces-27547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63575A4F707
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0B1188C991
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414961C863A;
	Wed,  5 Mar 2025 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qiS/7FTr"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B231078F
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155761; cv=none; b=BfIK7Q8HxxR97CB20vQPqT5CkPH+GLHYXeqKJKoCWOW2e7NRBASlUChm/dMqpUhEjRpPZnqedTQAVg6g5zVlhVCVgYC+TFYbTZ2Ez42Ps9eN1Vz87qN+QoJCs7ja7Xk7ouKGCz4F1t+flRR+2dbaJEbgKEDAFyL4AElwTyNWuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155761; c=relaxed/simple;
	bh=fkp2fED2xqd0CyeP/UptClVayRRsiEKZwX+34pOV0vE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=C+V9zvDvg++eEWQ7PdGLQQ5Zqoz2QzU6kAT8iN/WFJEEBcS5+ADaqa1p+jg8mLLGngLIEnnPSHWtsaZQ8VhvUAY4T0RD+bgTUwTFwGYi1b0AL5UbOYZdEYI4cY0zivzad6GTUOIfycrphIMU4Es1QD5T69FnovRt9i5ymTwRz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qiS/7FTr; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250305062237epoutp022d6e7ba142284577e8c59152ebcda5d2~p0__85MM30208402084epoutp02m
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:22:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250305062237epoutp022d6e7ba142284577e8c59152ebcda5d2~p0__85MM30208402084epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741155757;
	bh=jFB5HnIgaYhpNnZcJsibD9Rcl09ZpJP5bOr4t99km5I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qiS/7FTrJIKC1yjbX3OZBZwUA//oTPHdBw7MK31Ul+Jfm7tMXCDArnEgz4O6LMo8h
	 hhXuPVMmdT6owgtX8O5lkfHtiHj1rmjYLtVKn+uPVptbKF/5tBtkNwRHZo1A+H22iL
	 1ziDpBGJ0Xj8NTOTI+GL9EDC/NfF5uCX7zK307Uw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250305062237epcas5p213baf8f9ed2c557224b3b3076d2d0b8b~p0__a6q-_1778717787epcas5p2F;
	Wed,  5 Mar 2025 06:22:37 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Z72XW171mz4x9Q0; Wed,  5 Mar
	2025 06:22:35 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A9.F1.19933.BADE7C76; Wed,  5 Mar 2025 15:22:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250305055904epcas5p45828c732019a847a0852c26d9ef9f2db~p0qafttrE0193201932epcas5p4J;
	Wed,  5 Mar 2025 05:59:04 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250305055904epsmtrp18f0b98d2351723846834295f7fca51dd~p0qaewnYy3097330973epsmtrp1M;
	Wed,  5 Mar 2025 05:59:04 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-6c-67c7edab7791
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0B.84.23488.728E7C76; Wed,  5 Mar 2025 14:59:03 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250305055902epsmtip159b405f9aa331ca4ab3bfe85806ba8b9~p0qYqTzmt1782217822epsmtip1i;
	Wed,  5 Mar 2025 05:59:01 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [Patch v3] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Wed,  5 Mar 2025 11:23:07 +0530
Message-Id: <20250305055308.111300-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmhu7qt8fTDS5dYrV4umMmq8X9xZ9Z
	LA5t3spucfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jou1R+6yWyzb9IfJ
	YtHWL+wOvB6L97xk8ti0qpPN4861PWwem5fUe/RtWcXo8XmTnMepr5/ZA9ijsm0yUhNTUosU
	UvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgK5VUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YWl+al6+WlllgZGhgYmQIVJmRnLJz6kKXgPn/F
	2QkLWBsYb/B2MXJySAiYSMw7vYWti5GLQ0hgN6PEzANHGCGcT4wSN1tWskI43xglnh1dywbT
	8vjGIiaIxF5GiTsv7kP1f2GUaJrXCtTCwcEmoCtxdnsOSIOIQKrEq3VrwSYxCyxhklh05BkT
	SEJYwFWi4+InsKksAqoSWw60sIDYvAJ2EjOPr2aG2CYvsXrDAWaQZgmBj+wSi19OhTrDReJ7
	21N2CFtY4tXxLVC2lMTL/jYoO1ni8aKXUINyJNbvmcICYdtLHLgyhwXkUGYBTYn1u/QhwrIS
	U0+tA7uNWYBPovf3EyaIOK/EjnkwtprEnDs/WCFsGYnDq5cygoyREPCQePdGECQsJBArMW/7
	JeYJjLKzEBYsYGRcxSiZWlCcm55abFpglJdaDo+o5PzcTYzgRKjltYPx4YMPeocYmTgYDzFK
	cDArifC+PnU8XYg3JbGyKrUoP76oNCe1+BCjKTDIJjJLiSbnA1NxXkm8oYmlgYmZmZmJpbGZ
	oZI4b/POlnQhgfTEktTs1NSC1CKYPiYOTqkGpuDlQXImE3lPHzZ3+9LXtP2mzcv8TGGRU4ol
	Z1T2aXQslPZzqUq0OxpnuH926sp9C+8/bvVwtW1f+9Eva3bEogNJug02u7gXNf53CQq7sOvI
	TvvFIR9PLrKxntgprjZZ/m2DrCiP6vLVP3QfLNb5VqgQZHSag/PcpZOsewsTlKa5bDUWfLDT
	7p1CxU83A0dnjck+SSdFWl65dp99u+LcQrdM1TVJ3tx/vyh0z9UWOCatYMx5+ZolE+dGwROW
	h+TnzxRWbGC89G+u3EKm93/Cb54z2HvRtGSLe/vl+A85stP2WjRvac1YeuVzi1z90e9FHqv+
	TW/yV/2s/bbgZkmCx5bZ6S9b2/Lj3OefP2g1SYmlOCPRUIu5qDgRAKgTF78NBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnK76i+PpBrunWlk83TGT1eL+4s8s
	Foc2b2W3uHlgJ5PFxZl3WSz6Xjxkttj0+BqrxeVdc9gsejZsZbWYcX4fk8XaI3fZLZZt+sNk
	sWjrF3YHXo/Fe14yeWxa1cnmcefaHjaPzUvqPfq2rGL0+LxJzuPU18/sAexRXDYpqTmZZalF
	+nYJXBkLpz5kKbjPX3F2wgLWBsYbvF2MnBwSAiYSj28sYupi5OIQEtjNKNG75zobREJG4n/b
	MXYIW1hi5b/n7BBFnxgllhxZwtjFyMHBJqArcXZ7DkiNiEC6xKQ7X1lAapgF1jFJ7Fw5kRUk
	ISzgKtFx8RPYUBYBVYktB1pYQGxeATuJmcdXM0MskJdYveEA8wRGngWMDKsYJVMLinPTc5MN
	CwzzUsv1ihNzi0vz0vWS83M3MYKDUktjB+O7b036hxiZOBgPMUpwMCuJ8L4+dTxdiDclsbIq
	tSg/vqg0J7X4EKM0B4uSOO9Kw4h0IYH0xJLU7NTUgtQimCwTB6dUA1NFZ4Vv7tK9tiXfLvFa
	f10W+GbVROOfYkw3VkseZms9UDwl8btfralXa+upw5v08jYk3dQ/1+Jze4b1+0k31BhZTFvt
	Kyos9u2tdIwqKT7+x/PLvU1dd11Fpp5eWny1/+cVF/vozJQNN5UmSx3etuex64LDfu8erVGO
	/PLq58PJMz6fXeR8ao93/9JHm4VOPjboDVVdaDVR7c1f738vAjnPZh40nPs3fFF2ykLb2/JG
	LbembgSmkY2ik923MUux1HR1X9U9tMTsa9zqC3N0nbuZTDjFjlV3MB0tFO54Um0kdTONf3dC
	quhRI9aC3/WlYi5iHhJWW45/erv90gqhK9d67mz0zFJRuBVy9KXSeVMlluKMREMt5qLiRACU
	PJzCuQIAAA==
X-CMS-MailID: 20250305055904epcas5p45828c732019a847a0852c26d9ef9f2db
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305055904epcas5p45828c732019a847a0852c26d9ef9f2db
References: <CGME20250305055904epcas5p45828c732019a847a0852c26d9ef9f2db@epcas5p4.samsung.com>
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

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
changelog:
v2->v3
Patch link:https://patchwork.kernel.org/project/linux-media/patch/20250226102251.9040-1-aakarsh.jain@samsung.com/
Fixed checkpatch warning.

v1->v2
Patch link: https://patchwork.kernel.org/project/linux-media/patch/20240806115714.29828-1-aakarsh.jain@samsung.com/
Removed duplicate code and aligned luma and chroma size
to multiple of 256bytes as suggested by Hans.
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 73f7af674c01..4cf12f33d706 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -549,8 +549,9 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
 		case V4L2_PIX_FMT_NV21M:
 			ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
 			ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
-			ctx->luma_size = ctx->stride[0] * ALIGN(ctx->img_height, 16);
-			ctx->chroma_size =  ctx->stride[0] * ALIGN(ctx->img_height / 2, 16);
+			ctx->luma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height, 16), 256);
+			ctx->chroma_size = ALIGN(ctx->stride[0] *
+						ALIGN(ctx->img_height / 2, 16), 256);
 			break;
 		case V4L2_PIX_FMT_YUV420M:
 		case V4L2_PIX_FMT_YVU420M:
-- 
2.17.1


