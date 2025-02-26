Return-Path: <linux-media+bounces-27107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86386A473A1
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 04:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02D6E3A2B8A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 03:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5821D935C;
	Thu, 27 Feb 2025 03:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dI4VlG6p"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7461D5AA8
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 03:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740627430; cv=none; b=g0Apgxzg9r5JSsydePu2wa25f60TUT7nbfPu0RvFhp6aXBEOeCzbzkkJJgvx+2USmtp4Dmrpc+xTUovrenVrMoAMXxWj9fh6RmBV+C6a0I6yN1cQMxnFgtr77EN89FiFNqK6wA/grUT6nfRbR/0ROcTR9ztmYbABeyf+gvqSHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740627430; c=relaxed/simple;
	bh=Xj82/Cy6JhUBJoMRzz1RL2lRnUYVQw+GUSfz6Q+D5Mc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=A3IoUZM1e11lCTU3k2fr3+6m0uVzvKecnIw1aSh6voIB23LzI8EVdLXoIJZM//7/HJRYiWwMVsntEbR45yGMg7n870+BbKLnpUlInZK3unrKeNBN8ZcRTwEgcTO3igfrCuNCOiLYs9DpaIVxmIYWeRqaq6No4ro6k350J8meGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dI4VlG6p; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250227033704epoutp01463204fc2c488e4d92fb55e3f33e0c7e~n82uy-5kg1082710827epoutp01a
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 03:37:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250227033704epoutp01463204fc2c488e4d92fb55e3f33e0c7e~n82uy-5kg1082710827epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740627424;
	bh=I3ZgVkA5DYmIFkip7Km0C0StY+XyY8deGJTuyG5SuBM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dI4VlG6pbERgNN8rYsIjcM0YMsunf3tkbPnyAvBQcV18zjhDXlJlhdRodcGL5/9Ll
	 FiyFW7H2UL6ihcs52J0Z6qARB0gXfYaTvV3U1ZKMTZKqQu+dTjMuMprXjxXmDv6+JJ
	 2I3xMpf6yxXP+HwSBUxVcqgkAORGJHFMFwyfRaWg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250227033704epcas5p21be907277e8e783de4d71ab72ac09509~n82uTAVaw2530425304epcas5p2K;
	Thu, 27 Feb 2025 03:37:04 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z3H8G11p2z4x9Pp; Thu, 27 Feb
	2025 03:37:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.DC.19956.DDDDFB76; Thu, 27 Feb 2025 12:37:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250226102519epcas5p37f883e6750a956c3c930f3a3f4dfd964~nux5UNxCl2824828248epcas5p3M;
	Wed, 26 Feb 2025 10:25:19 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250226102519epsmtrp2c66b9f64f5934e1a6ae72b767094a34f~nux5Tf8gE0438904389epsmtrp2R;
	Wed, 26 Feb 2025 10:25:19 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-89-67bfdddd926c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	61.CD.33707.F0CEEB76; Wed, 26 Feb 2025 19:25:19 +0900 (KST)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250226102517epsmtip22df3154c9a7435a38c00c7717ef845b0~nux3e6RJc0450904509epsmtip2Q;
	Wed, 26 Feb 2025 10:25:17 +0000 (GMT)
From: "Aakarsh Jain/Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <andrzej.hajda@intel.com>,
	<mchehab@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-samsung-soc@vger.kernel.org>, <gost.dev@samsung.com>,
	<aswani.reddy@samsung.com>, <pankaj.dubey@samsung.com>
In-Reply-To: <c09e7819-a7d9-432f-baab-732e81b3f489@xs4all.nl>
Subject: RE: [PATCH] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Wed, 26 Feb 2025 15:55:16 +0530
Message-ID: <000001db8838$bc466e00$34d34a00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE+FHJLEG7bRbSgl/2Ewycw4h6AZQMC8PEqAzhsSKO0Ym04sA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmpu69u/vTDTrrLO4v/sxicWjzVnaL
	mwd2MllcnHmXxaLvxUNmi02Pr7FaXN41h82iZ8NWVosZ5/cxWaw9cpfdYtmmP0wWi7Z+YXfg
	8Vi85yWTx6ZVnWwed67tYfPYvKTeo2/LKkaPz5vkPE59/cwewB6VbZORmpiSWqSQmpecn5KZ
	l26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdKeSQlliTilQKCCxuFhJ386mKL+0
	JFUhI7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj8etr7AV75Su+fz7F1MB4
	UKqLkZNDQsBE4nDTWpYuRi4OIYHdjBJPO54wQTifGCUebVyH4Dz9184G03Lz1jJWiMRORokZ
	J+9A9T9nlLj6cQYTSBWbgI3EtT8HmEESIgKzGCWO7F7DDuIwC7xnlDg76QcjSBWngK3ExvkX
	mUFsYQE3iQWXFgDN5eBgEVCV6NqtBxLmFbCU+P/kLSuELShxcuYTFhCbWUBbYtnC18wQJylI
	/Hy6DKxGRMBJYtWls2wQNeISR3/2QNUc4ZD4vUkVwnaROPHgIguELSzx6vgWdghbSuLzu71Q
	byZLPF70Eqo3R2L9nilQ9fYSB67MYQE5k1lAU2L9Ln2IsKzE1FPrmCDW8kn0/n7CBBHnldgx
	D8ZWk5hz5wcrhC0jcXj1UsYJjEqzkHw2C8lns5B8MAth2wJGllWMkqkFxbnpqcWmBcZ5qeXw
	GE/Oz93ECE7HWt47GB89+KB3iJGJg/EQowQHs5IIL2fmnnQh3pTEyqrUovz4otKc1OJDjKbA
	0J7ILCWanA/MCHkl8YYmlgYmZmZmJpbGZoZK4rzNO1vShQTSE0tSs1NTC1KLYPqYODilGpga
	io/s+BnCuIFloe+Ost69/9Q9NNdtXyz6pJ5/Wclx86rLtbxejySP1qlEHmq88z5O7f9lvmTZ
	wjXKrD7fnvz/GfO+R6coN6U1xNRC4vtU/6mnuIPkrUqaFgqxn+hJ+jS548XVGxJ39VqfXvSV
	lP4mtNanM0DG0W1hp8jP7vKo/4XvfEqePDu+6nnua0mvv3anHs47lD+t0jJh+RSD+dMm1u73
	Vdr4YP6USa9N0g9eXiqWcY7r/P7K8r+3eltFQp/GnehrCNohYT1fnO3VzpM9MvPnyWReqdYR
	jNwUPL1oQXFGJUPIHxV36/pdbUpPcy02xk/f8d04iG/qraAlP7TWCZZYO+knBXxmU2fTkFRi
	Kc5INNRiLipOBAB9lKQiUAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWy7bCSvC7/m33pBk2XjCzuL/7MYnFo81Z2
	i5sHdjJZXJx5l8Wi78VDZotNj6+xWlzeNYfNomfDVlaLGef3MVmsPXKX3WLZpj9MFou2fmF3
	4PFYvOclk8emVZ1sHneu7WHz2Lyk3qNvyypGj8+b5DxOff3MHsAexWWTkpqTWZZapG+XwJXx
	av8d5oL7chV/p/axNjDek+xi5OSQEDCRuHlrGWsXIxeHkMB2Ron/606yQCRkJP63HWOHsIUl
	Vv57zg5R9JRRYv/3XkaQBJuAjcS1PweYQRIiAnMYJQ4c3QZWxSzwnVHiyKLPjBAtBxglzuzb
	DDaLU8BWYuP8i8wgtrCAm8SCSwuAlnNwsAioSnTt1gMJ8wpYSvx/8pYVwhaUODnzCdhJzALa
	Ek9vPoWzly18zQxxnoLEz6fLwOpFBJwkVl06ywZRIy5x9GcP8wRG4VlIRs1CMmoWklGzkLQs
	YGRZxSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREcj1pBOxiXrf+rd4iRiYPxEKMEB7OSCC9n
	5p50Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBqYIiefO
	wXte1Dau5KoqeDDnxtdcZgP97zeEfHZeu5A5wW/KzWW3yp10mF+xVDDd/XFb69C3xmtPN5v6
	R7XazOnfKWtas2uxn9/hw40HtN9GvHY5VpjV9d32WVUtN/f8/4a/VmV4ztMr07n0daKwkfz9
	X4dbn0SbGtekfCrbvbfOqkY2qOWc3nTe+WeXiWa/6/fZ1cNYbXBTxv9vzDr2qKC/xlH+FsbW
	tUelL+fnqnnfLGRo4jjO80k8UjShJqc1c+0e988iSoxsNQeTXy7beGmv/FqFtAkpd1avecnN
	+snl9ZWC2sp4/9NuK8J73yy60rCThaVBQ3G2T6Li/8ZfAd2bLix90nbYYVqKwrRfJkosxRmJ
	hlrMRcWJAOuWeIg2AwAA
X-CMS-MailID: 20250226102519epcas5p37f883e6750a956c3c930f3a3f4dfd964
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e
References: <CGME20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e@epcas5p1.samsung.com>
	<20240806115714.29828-1-aakarsh.jain@samsung.com>
	<c09e7819-a7d9-432f-baab-732e81b3f489@xs4all.nl>

Hi Hans,

-----Original Message-----
From: Hans Verkuil <hverkuil-cisco=40xs4all.nl>=20
Sent: 11 October 2024 18:17
To: Aakarsh Jain <aakarsh.jain=40samsung.com>; linux-arm-kernel=40lists.inf=
radead.org; linux-media=40vger.kernel.org; linux-kernel=40vger.kernel.org
Cc: m.szyprowski=40samsung.com; andrzej.hajda=40intel.com; mchehab=40kernel=
.org; krzysztof.kozlowski+dt=40linaro.org; linux-samsung-soc=40vger.kernel.=
org; gost.dev=40samsung.com; aswani.reddy=40samsung.com; pankaj.dubey=40sam=
sung.com
Subject: Re: =5BPATCH=5D media: s5p-mfc: Corrected NV12M/NV21M plane-sizes

On 06/08/2024 13:57, Aakarsh Jain wrote:
> There is a possibility of getting page fault if the overall buffer=20
> size is not aligned to 256bytes. Since MFC does read operation only=20
> and it won't corrupt the data values even if it reads the extra bytes.
> Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M and=20
> V4L2_PIX_FMT_NV21M pixel format.
>=20
> Signed-off-by: Aakarsh Jain <aakarsh.jain=40samsung.com>
> ---
>  .../media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c    =7C 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=20
> b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> index 73f7af674c01..03c957221fc4 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> =40=40 -498,8 +498,8 =40=40 static void s5p_mfc_dec_calc_dpb_size_v6(stru=
ct s5p_mfc_ctx *ctx)
>  	case V4L2_PIX_FMT_NV21M:
>  		ctx->stride=5B0=5D =3D ALIGN(ctx->img_width, S5P_FIMV_NV12MT_HALIGN_V6=
);
>  		ctx->stride=5B1=5D =3D ALIGN(ctx->img_width, S5P_FIMV_NV12MT_HALIGN_V6=
);
> -		ctx->luma_size =3D calc_plane(ctx->stride=5B0=5D, ctx->img_height);
> -		ctx->chroma_size =3D calc_plane(ctx->stride=5B1=5D, (ctx->img_height /=
 2));
> +		ctx->luma_size =3D calc_plane(ctx->img_width, ctx->img_height);
> +		ctx->chroma_size =3D calc_plane(ctx->img_width, (ctx->img_height >>=20
> +1));

I don't really understand why this is changed. Looking at the implementatio=
n of calc_plane and the various =23define values that are used here and in =
calc_plane, the number should be the same.

I think the original code makes more sense.
okay.

If I missed something, let me know.

>  		break;
>  	case V4L2_PIX_FMT_YUV420M:
>  	case V4L2_PIX_FMT_YVU420M:
> =40=40 -539,9 +539,11 =40=40 static void s5p_mfc_dec_calc_dpb_size_v6(str=
uct=20
> s5p_mfc_ctx *ctx)  static void s5p_mfc_enc_calc_src_size_v6(struct=20
> s5p_mfc_ctx *ctx)  =7B
>  	unsigned int mb_width, mb_height;
> +	unsigned int default_size;
> =20
>  	mb_width =3D MB_WIDTH(ctx->img_width);
>  	mb_height =3D MB_HEIGHT(ctx->img_height);
> +	default_size =3D (mb_width * mb_height) * 256;
> =20
>  	if (IS_MFCV12(ctx->dev)) =7B
>  		switch (ctx->src_fmt->fourcc) =7B
> =40=40 -549,8 +551,8 =40=40 static void s5p_mfc_enc_calc_src_size_v6(stru=
ct s5p_mfc_ctx *ctx)
>  		case V4L2_PIX_FMT_NV21M:
>  			ctx->stride=5B0=5D =3D ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6=
);
>  			ctx->stride=5B1=5D =3D ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6=
);
> -			ctx->luma_size =3D ctx->stride=5B0=5D * ALIGN(ctx->img_height, 16);
> -			ctx->chroma_size =3D  ctx->stride=5B0=5D * ALIGN(ctx->img_height / 2,=
 16);
> +			ctx->luma_size =3D ALIGN(default_size, 256);
> +			ctx->chroma_size =3D ALIGN(default_size / 2, 256);

Isn't this effectively the same as doing:

			ctx->luma_size =3D ALIGN(ctx->luma_size, 256);
			ctx->chroma_size =3D ALIGN(ctx->chroma_size, 256);

I.e., the bug is that these sizes are not rounded up to a multiple of 256, =
so just add that, rather than changing code elsewhere.

I might be wrong, but this seems a much simpler solution.
sure Hans. Will address in v2.

Thanks for review.

Regards,

	Hans

>  			break;
>  		case V4L2_PIX_FMT_YUV420M:
>  		case V4L2_PIX_FMT_YVU420M:



