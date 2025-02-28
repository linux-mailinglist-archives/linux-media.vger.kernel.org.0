Return-Path: <linux-media+bounces-27195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A61A49259
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98B91885F36
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B81C5D69;
	Fri, 28 Feb 2025 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="E4clRksz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C31C54B2
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728337; cv=none; b=lxQLy8Fua0pzvc6UUn+IuLVuapUl11Y3hPmVM/YJfkhY2y2B3seXGaYOUuwzyka2YsyYTBqydtjAi6lfkO7JQ1h2E3hH9A+AGcwiYCCcoo7p8b21HgmuIkgi+4zlMyqRTTwl7+jr4nuR0DbSHwoYLu6Y/purprAxNHTICf1AZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728337; c=relaxed/simple;
	bh=BY9q3rOxqkIVBMa7s2bmBZBkhUcguD3ZuXRRp63Ut6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=iDSA9HbMFOgPuCwl3GgxoUIYX+/dJ/qWhW+VmNKxligBSy2fUJAba2BqSEYIxULDLinBoMs/RRqqNmxbH5CJNl0vnVhAvj2UFMupphS4q7fEfHC7QiVh5YBS+JlQJlueyD9DCqD1CHw9tlH0dsIp/cHiQiCEZYki4XVeH/vmntE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=E4clRksz; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250228073853euoutp0173b946af5a4dba580df9ac4152840ef5~oTzJbh5rv2345123451euoutp01D
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 07:38:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250228073853euoutp0173b946af5a4dba580df9ac4152840ef5~oTzJbh5rv2345123451euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740728333;
	bh=fB1uu5Zm/JdUcvGbMy3KqsovvuV6bSi/1lbv+zVs20Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=E4clRksz1SUtlg+e1C0maB9+KnaXKDWsITIMWljPSLwLsF5HLwawlrv9y3qz8CR8A
	 m1xoRjArPxkwbx5Rq0kSHJQUXMzLVaNS2UOQE0a6Iiof0KmPbofRg3Mh+N1Jy7EZcd
	 QlaVR+XtV0E7cjL1mggU6pLM5+K2tsv+QxZKxgF8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250228073849eucas1p2ea3c0061bc5efce9c318f48e23b0679e~oTzFTULj60716307163eucas1p2m;
	Fri, 28 Feb 2025 07:38:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id D0.76.20821.90861C76; Fri, 28
	Feb 2025 07:38:49 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250228073848eucas1p2c71a5ff2b7b1ec8388ea57bec7bd9b09~oTzEuBMhB3132931329eucas1p21;
	Fri, 28 Feb 2025 07:38:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250228073848eusmtrp28a1e245fe1fb3aa7b5c93c5051f85326~oTzEtV3u30517905179eusmtrp2W;
	Fri, 28 Feb 2025 07:38:48 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-85-67c168094b8f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id BD.9B.19920.80861C76; Fri, 28
	Feb 2025 07:38:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250228073847eusmtip26d0d11427c3f7d3a2a2b24ab1aa31f3d~oTzDOuM0w0250102501eusmtip2j;
	Fri, 28 Feb 2025 07:38:46 +0000 (GMT)
Message-ID: <b0a3d6de-34c7-484a-9622-75431248e4eb@samsung.com>
Date: Fri, 28 Feb 2025 08:38:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
	gost.dev@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250226102251.9040-1-aakarsh.jain@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djP87qcGQfTDXZM5bB4umMmq8X9xZ9Z
	LA5t3spucfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jotlm/4wWSza+oXd
	gcdj8Z6XTB6bVnWyedy5tofNY/OSeo++LasYPT5vkvM49fUzewB7FJdNSmpOZllqkb5dAlfG
	nWkbmQq281fcWb2KqYGxjbeLkZNDQsBEYuf5K0xdjFwcQgIrGCXOP57CDOF8YZRYuX8mVOYz
	o8T+X8uZYVqeXDgEVbWcUWLhqimsEM5HRoljf4+yg1TxCthJrPywkRHEZhFQlXj+pgEqLihx
	cuYTFhBbVEBe4v6tGWBxYQFPiVc7J4KtExGYwChx/eMpFhCHWeAuo8SsRc9ZQaqYBcQlbj2Z
	zwRiswkYSnS97WLrYuTg4BSwlVjfwwRRIi+x/e0csPMkBPo5Jd5eeM0GcbeLxMKl95ggbGGJ
	V8e3sEPYMhL/d85ngmhoZ5RY8Ps+lAN0RsPzW4wQVdYSd879AtvGLKApsX6XPkTYUWLL+pms
	IGEJAT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8gVFpFlK4zELy5Swk78xC
	2LuAkWUVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYDI7/e/4px2Mc1991DvEyMTBeIhR
	goNZSYR3VuyBdCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8i/a3pgsJpCeWpGanphakFsFkmTg4
	pRqYGtjE2ws+31Tu4TEXO/32b/t2hqfcSkLqifdc36kWVRR1rL2+hS+/4eUx4aLrzhv2nPOd
	EKFeFD/vtazM5SAPxdaZG8/Jc2/Y78s7v/2VoIpxQUHarzNi17efOc5ya8qr2npv6V+tCaul
	4k/P7ug0eur5vFvlne9cS8POaQVPS4TenfSfVe59csKxqeen3LVU36JdcDLy80JW9et+TT3a
	5e+t2hS9Ltm2/PpsFJtRUKTP692sp7h1uvoyRu1JSzkbf13LPbq21rnsWbHeidwfredrpjZF
	GKo0XRb4cdCueuNZ47ONp7frOJa5PrJmnZhyyOPmhqAXa31Znz2v2PxRtmnaSc89HZPXvcia
	ncKuxFKckWioxVxUnAgAmXs5TdUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7ocGQfTDeZel7d4umMmq8X9xZ9Z
	LA5t3spucfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jotlm/4wWSza+oXd
	gcdj8Z6XTB6bVnWyedy5tofNY/OSeo++LasYPT5vkvM49fUzewB7lJ5NUX5pSapCRn5xia1S
	tKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GnWkbmQq281fcWb2KqYGxjbeL
	kZNDQsBE4smFQ8xdjFwcQgJLGSWuX97HDpGQkTg5rYEVwhaW+HOtiw2i6D2jxOmF58ESvAJ2
	Eis/bGQEsVkEVCWev2lgh4gLSpyc+YQFxBYVkJe4f2sGWFxYwFPi1c6JTCCDRAQmAA16NwOs
	mVngLqPEv15fiA1Aib2b3rNDJMQlbj2ZzwRiswkYSnS9BTmDg4NTwFZifQ8TRImZRNfWLqg5
	8hLb385hnsAoNAvJHbOQTJqFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAmN3
	27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHeWbEH0oV4UxIrq1KL8uOLSnNSiw8xmgIDYyKzlGhy
	PjB55JXEG5oZmBqamFkamFqaGSuJ87pdPp8mJJCeWJKanZpakFoE08fEwSnVwFR39Oa66oB3
	YiH7Odte7U1SK+4ts3msLrB69f9i/z2fdsbW2R3TfeHRoLA69OCGNH/t/xJxWbHRxXYSPtdF
	/tzZv+tN5IQyr03r0zMV4o9auu6q4tpz9HH3H/8rv3NOLrLX2f395/QJ9gobJmwO2yRbc72f
	Z+3HwrwdvJE/7Nmu8gnNuM+lckVv8dLgqDNtKdNjn8TKvS3/dq1l0+Mvou3cR+b6dKwK+n82
	w+LMpt1Zqw45s3TsLambzL7Gf5di36HbOlLi+kG9/GoVr59EnS2SzFH8u/mvqls9z9qE85JH
	jKLvxnvxrPdhLPsvljTdwafooPnGi2UfRCYteLWR5Vjn2gM/NihZzz70QWjOVwUlluKMREMt
	5qLiRABTtNcrZgMAAA==
X-CMS-MailID: 20250228073848eucas1p2c71a5ff2b7b1ec8388ea57bec7bd9b09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef
References: <CGME20250226102749epcas5p35afe43774ad2917b846c921dc593a5ef@epcas5p3.samsung.com>
	<20250226102251.9040-1-aakarsh.jain@samsung.com>

On 26.02.2025 11:22, Aakarsh Jain wrote:
> There is a possibility of getting page fault if the overall
> buffer size is not aligned to 256bytes. Since MFC does read
> operation only and it won't corrupt the data values even if
> it reads the extra bytes.
> Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
> and V4L2_PIX_FMT_NV21M pixel format.
>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> changelog:
> v1->v2
> Patch link: https://patchwork.kernel.org/project/linux-media/patch/20240806115714.29828-1-aakarsh.jain@samsung.com/
> Removed duplicate code and aligned luma and chroma size
> to multiple of 256bytes as suggested by Hans.
>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> index 73f7af674c01..0c636090d723 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> @@ -549,8 +549,9 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
>   		case V4L2_PIX_FMT_NV21M:
>   			ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
>   			ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
> -			ctx->luma_size = ctx->stride[0] * ALIGN(ctx->img_height, 16);
> -			ctx->chroma_size =  ctx->stride[0] * ALIGN(ctx->img_height / 2, 16);
> +			ctx->luma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height, 16), 256);
> +			ctx->chroma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height / 2, 16),
> +					256);
>   			break;
>   		case V4L2_PIX_FMT_YUV420M:
>   		case V4L2_PIX_FMT_YVU420M:

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


