Return-Path: <linux-media+bounces-9726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A08AA498
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 23:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2CF0B231DE
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 21:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772CE17BB31;
	Thu, 18 Apr 2024 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GqHlWb6O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A82F30
	for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474349; cv=none; b=XFpU9QIgiBy1C+mx6WWIOiFOXGCjS9TAs/POU++cW+59+03LpnqcqOJZ2HcM9cTNz3NSjhu0NoCbIBvdeEmP7joG/XSKcgFSnkS6dr2aDL8eyzIw/Lst3h3GBF78ZJ742J4hfPmk9RoUaecJFgpQ2YwmPZCIBGiqJTZCRNxoYWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474349; c=relaxed/simple;
	bh=gp8G6l5pQMNNjR3IOTaKug8axbt9G81h3V5DJpMCcas=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b129YKTJLi01InC/PGJYOC5dY4ekU3xb7LBb9utwrliW7hp84OCzP15u1kq46b4WL6Rx2g/dn6Cl2N2fcxkGk7BL5Atj0+s+avlPkuSYoxk2qvAej9vFTNehpWOxfV0cxRLwRClDT+u/IcCGWzFFxD/ANZ4zIFMyUvOx5Adf/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GqHlWb6O; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-434d0a63151so7782351cf.3
        for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 14:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1713474347; x=1714079147; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XGX+2tC6ZIe/KbHWm3VQWNIaSv0d2xtU9EG28sUDtTQ=;
        b=GqHlWb6O3Oys1v9Ex6XuwtcPFG22vCYVZE6lLwqnSZbq6jNC+ypvxKBA/jdYClcdWy
         E0UMGlvgLDXr6qQ079Z9NhPuOAgAvDL8i5/bMJ6DDceXxRNQA1sKOWGShphY+wQSH/ML
         M0VMPuRcKsl4nxFAMyS6V+H4j36Ug6xZUnZD40J1e05PnXWnvNvAA10diDYbHQsZnH9e
         Pco45EMPgBA9j5VVH07XNuOO5YKhzPfJARqai7smojhrhy7GuK/71/J8pe8ehaIAPfsY
         kQnzyAOsI8og/+IeGL4FmTC0c9O3GxMcVyENyPK+HKHBzW0pqXyGRh48cd6wB4Ddh/6o
         hG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713474347; x=1714079147;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGX+2tC6ZIe/KbHWm3VQWNIaSv0d2xtU9EG28sUDtTQ=;
        b=mGnVQnLFlerNrADyZ62nL6RJh8iymi2wzU/0xplZFOsuKX5qX+YHO2x8MNXp2jFDXI
         2LqE2dc9/wBLmD3AuOUeGJAWxW/P3b0DHWy91yJe6NFGubVYrrSsXVLzuM0yDbqjHfQj
         TFklCkC8R3Q9YizfthGCkothM/7JyP816AhYiuIcYaiflR2BsvmPHjzocE/bcSVqRkYB
         NDcTmymT0/jyf7RFJiQdPEVHnbWGrh6iqqCA/6w3HXqNdSXPU22iFOvWwhfkYRN1yA3m
         vgnpJr0CgQCHyK3AFYD/ef/kqCYCMCyNVxd1QphtR1QoaiMSOSmXLdH7/DIyJ3HldPvQ
         Kdcg==
X-Gm-Message-State: AOJu0Yw8D7RrhV7cSUje8InrEGylykKMi8Vb84MUbRsLW6mkQ/x9uHu6
	aFk4CpJGDTWmrbXM2E84e9+sP/zF9t7d0A8denvMrt895Mq2qOL4Ddn3FSfzBL0qXoL2+WyS9FI
	Z
X-Google-Smtp-Source: AGHT+IEAqfamfpBCCexH6RE6Rd8ENZ+WIk4fTsfA9BA4JshdchMFVcQU8sTZiR2W6QVdHWxzCaRJEQ==
X-Received: by 2002:a05:622a:5cd:b0:435:f8f0:2940 with SMTP id d13-20020a05622a05cd00b00435f8f02940mr316353qtb.22.1713474347450;
        Thu, 18 Apr 2024 14:05:47 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id ok23-20020ac84117000000b004367cc4ab01sm989460qtb.15.2024.04.18.14.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 14:05:47 -0700 (PDT)
Message-ID: <3ba3445e820e14730794e85fb4322e5aa57e1119.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v2 4/4] media: chips-media: wave5: Support YUV422
 raw pixel-formats on the encoder.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Thu, 18 Apr 2024 17:05:46 -0400
In-Reply-To: <20240311105623.20406-5-jackson.lee@chipsnmedia.com>
References: <20240311105623.20406-1-jackson.lee@chipsnmedia.com>
	 <20240311105623.20406-5-jackson.lee@chipsnmedia.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 11 mars 2024 =C3=A0 19:56 +0900, jackson.lee a =C3=A9crit=C2=A0:
> From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
>=20
> Add support for the YUV422P, NV16, NV61, YUV422M, NV16M, NV61M raw pixel-=
formats to the Wave5 encoder.
> All these formats have a chroma subsampling ratio of 4:2:2 and therefore =
require a new image size calculation as the driver previously only handled =
a ratio of 4:2:0.
>=20
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../chips-media/wave5/wave5-vpu-enc.c         | 59 +++++++++++++++++--
>  1 file changed, 54 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 5a32bb138158..77657f63a169 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -39,6 +39,24 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES]=
[MAX_FMTS] =3D {
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
>  		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV422P,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV16,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV422M,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV16M,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61M,
> +		},
>  	}
>  };
> =20
> @@ -101,13 +119,30 @@ static int start_encode(struct vpu_instance *inst, =
u32 *fail_res)
>  	struct vb2_v4l2_buffer *dst_buf;
>  	struct frame_buffer frame_buf;
>  	struct enc_param pic_param;
> -	u32 stride =3D ALIGN(inst->dst_fmt.width, 32);
> -	u32 luma_size =3D (stride * inst->dst_fmt.height);
> -	u32 chroma_size =3D ((stride / 2) * (inst->dst_fmt.height / 2));
> +	u32 stride =3D inst->src_fmt.plane_fmt[0].bytesperline;
> +	u32 luma_size =3D (stride * inst->src_fmt.height);
> +	u32 chroma_size =3D 0;

The helper introduced in previous patch also calculate sizeimage for each
planes, so no need for this code anymore.

> =20
>  	memset(&pic_param, 0, sizeof(struct enc_param));
>  	memset(&frame_buf, 0, sizeof(struct frame_buffer));
> =20
> +	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV420 ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV420M)
> +		chroma_size =3D luma_size / 4;
> +	else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M)
> +		chroma_size =3D luma_size / 2;
> +	else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422P ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422M)
> +		chroma_size =3D luma_size / 2;
> +	else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61 ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16M ||
> +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61M)
> +		chroma_size =3D luma_size;
> +
>  	dst_buf =3D v4l2_m2m_next_dst_buf(m2m_ctx);
>  	if (!dst_buf) {
>  		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__)=
;
> @@ -490,11 +525,15 @@ static int wave5_vpu_enc_s_fmt_out(struct file *fil=
e, void *fh, struct v4l2_form
>  	}
> =20
>  	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> -	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M) {
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16M) {
>  		inst->cbcr_interleave =3D true;
>  		inst->nv21 =3D false;
>  	} else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> -		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M) {
> +		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M ||
> +		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61 ||
> +		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61M) {
>  		inst->cbcr_interleave =3D true;
>  		inst->nv21 =3D true;
>  	} else {
> @@ -1086,6 +1125,16 @@ static void wave5_set_enc_openparam(struct enc_ope=
n_param *open_param,
>  	u32 num_ctu_row =3D ALIGN(inst->dst_fmt.height, 64) / 64;
>  	u32 num_mb_row =3D ALIGN(inst->dst_fmt.height, 16) / 16;
> =20
> +	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422P ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61 ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422M ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16M ||
> +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61M)
> +		open_param->src_format =3D FORMAT_422;
> +	else
> +		open_param->src_format =3D FORMAT_420;
> +
>  	open_param->wave_param.gop_preset_idx =3D PRESET_IDX_IPP_SINGLE;
>  	open_param->wave_param.hvs_qp_scale =3D 2;
>  	open_param->wave_param.hvs_max_delta_qp =3D 10;


