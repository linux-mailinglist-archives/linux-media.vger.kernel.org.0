Return-Path: <linux-media+bounces-12283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004218D52CB
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A4CD1F250CC
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828BC140E5F;
	Thu, 30 May 2024 20:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="U21UJ24Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF614D8BF
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 20:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717099467; cv=none; b=rJmJMEzVpkWJfUUWDddEcLmjd1L7YuVSaeryyNHn98Bns3io3sm0DPjW88uDtPClqcafIPgakX2AGqS14XfMNCDWEc9dhyWqGUS6lzr+hM4Nsa9z2o2VFJTZK7zOoc1K6cjA7mvoU/UOQbv7pFq/NexdqyQeQkwBKCpqxPtXduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717099467; c=relaxed/simple;
	bh=5lFF6p0O69z4wHRkB64rk3uIhtL67Ko8YP8HkVc2LlA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wqup2Dl/iruI7Gh+SuQJd302sSmoz6zoNd1WEHp5WyGbrw7sjgHyFo/6E2KG4CKAwCOrg+icJXAM5MtS/HsBhXoRxrhs6gYfVod1IOa1B/7WOjdCf4fXWYANiwUGGpNQbBIWeKvOjTs21LgQ2pLU1eJ9ryFambKBKQjE6UFQLpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=U21UJ24Y; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c9b94951d5so652681b6e.3
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1717099464; x=1717704264; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uFw/j4seytBxaJCy4ixcT30Pk8/ifigB662hDMKPRHo=;
        b=U21UJ24YHvSMPBGJw2+GuAYw48RtuRZgZDQHThgSIQ9qAzgd895q/MWPSbuMEkJWfA
         WJ8izGODQUgcnyTYk5SZTOUQZKYyyo3oqfe59J5LXc5NlsjZsXEMjIRQwd/Pu16WTBr+
         Ytoh5vG3WSfGJRm22AWPLg0qwCdgJXhLqIHyf23cCEox567VW7g1+YL1AsBT/XkDtgNv
         EiAANIaV59Xv46FbCXicczb2eJgkNbY+bQZJ1WavJNYmBvCtJOwXklKahALs4/Neauy4
         YqZT08XL6aGoV60H/ostFyRn9ejm6DJsp46+pIuCEpV3+Wy+EROIiQSCSKjno9G/iwU7
         8qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717099464; x=1717704264;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uFw/j4seytBxaJCy4ixcT30Pk8/ifigB662hDMKPRHo=;
        b=OSAym/ze7AXYTR6zh+TBDgEYK1TDzobKcqNTcN9afdZ16mHb6RuFJbUS7jPiFnkZvh
         8KWitFmyZkbGj1/6kwYtN36bcRshe7YRs/b4r2yjUsRVOPUc2UhXh15wGvncPFFUeqMP
         koGoFbGzg6nPVbAgDnrRCjGEc/a8kFbwPjJocOAKOMLg5BHFmU8It+05P09tvozrmAs9
         I0IUkaNDd+P669ruJ4einHrU6580we8Av3lp9VT7cBkeB+E9/SqPD0+iygUPzSB/uDTC
         G28EQX0qbpV9xppaGlIeA/lgIXnRFSW29AAdDzP4ccot0cg9Bhgv/jqID5y4KdGTZ1My
         J+dg==
X-Gm-Message-State: AOJu0YzxrgFNJO8UmhiykLzg1wmeRVu7QZGSE0qxvnx9aypO96g6L/tx
	7qIhExeH/tjVWY0qQyoY7C2nDARsEmacJj9r0zQEWWrpKxwFIkiEjX4+tY2A8wI=
X-Google-Smtp-Source: AGHT+IEeHFLSPwf7tam8MwxOtasZyt1ms8G84I1mO9sNkFBGZnem8YjKGIIj10MDppdu/IDcKOmG1w==
X-Received: by 2002:aca:905:0:b0:3d1:d34d:2775 with SMTP id 5614622812f47-3d1dcca5216mr2773765b6e.15.1717099464455;
        Thu, 30 May 2024 13:04:24 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4b40621fsm1301016d6.103.2024.05.30.13.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 13:04:24 -0700 (PDT)
Message-ID: <83f8a280f6835d9ac65fc18f7d1c88ccc90c6e65.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v4 4/4] media: chips-media: wave5: Support YUV422
 raw pixel-formats on the encoder.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jackson Lee <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Thu, 30 May 2024 16:04:20 -0400
In-Reply-To: <20240510112252.800-5-jackson.lee@chipsnmedia.com>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
	 <20240510112252.800-5-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 10 mai 2024 =C3=A0 20:22 +0900, Jackson Lee a =C3=A9crit=C2=A0:
> From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
>=20
> Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
> NV61M raw pixel-formats to the Wave5 encoder.
>=20
> All these formats have a chroma subsampling ratio of 4:2:2 and
> therefore require a new image size calculation as the driver
> previously only handled a ratio of 4:2:0.
>=20
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../chips-media/wave5/wave5-vpu-enc.c         | 81 +++++++++++++++----
>  1 file changed, 67 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 75d230df45f6..3f148e1b0513 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -66,6 +66,24 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES]=
[MAX_FMTS] =3D {
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
>  			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
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
> @@ -109,13 +127,26 @@ static int start_encode(struct vpu_instance *inst, =
u32 *fail_res)
>  	struct vb2_v4l2_buffer *dst_buf;
>  	struct frame_buffer frame_buf;
>  	struct enc_param pic_param;
> -	u32 stride =3D ALIGN(inst->dst_fmt.width, 32);
> -	u32 luma_size =3D (stride * inst->dst_fmt.height);
> -	u32 chroma_size =3D ((stride / 2) * (inst->dst_fmt.height / 2));
> +	const struct v4l2_format_info *info;
> +	u32 stride =3D inst->src_fmt.plane_fmt[0].bytesperline;
> +	u32 luma_size =3D 0;
> +	u32 chroma_size =3D 0;
> =20
>  	memset(&pic_param, 0, sizeof(struct enc_param));
>  	memset(&frame_buf, 0, sizeof(struct frame_buffer));
> =20
> +	info =3D v4l2_format_info(inst->src_fmt.pixelformat);
> +	if (!info)
> +		return -EINVAL;
> +
> +	if (info->mem_planes =3D=3D 1) {
> +		luma_size =3D stride * inst->dst_fmt.height;
> +		chroma_size =3D luma_size / (info->hdiv * info->vdiv);
> +	} else {
> +		luma_size =3D inst->src_fmt.plane_fmt[0].sizeimage;
> +		chroma_size =3D inst->src_fmt.plane_fmt[1].sizeimage;
> +	}
> +
>  	dst_buf =3D v4l2_m2m_next_dst_buf(m2m_ctx);
>  	if (!dst_buf) {
>  		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__)=
;
> @@ -479,6 +510,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file,=
 void *fh, struct v4l2_form
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
>  	const struct vpu_format *vpu_fmt;
> +	const struct v4l2_format_info *info;
>  	int i, ret;
> =20
>  	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes=
: %u field: %u\n",
> @@ -500,16 +532,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *fil=
e, void *fh, struct v4l2_form
>  		inst->src_fmt.plane_fmt[i].sizeimage =3D f->fmt.pix_mp.plane_fmt[i].si=
zeimage;
>  	}
> =20
> -	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> -	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M) {
> -		inst->cbcr_interleave =3D true;
> -		inst->nv21 =3D false;
> -	} else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> -		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M) {
> -		inst->cbcr_interleave =3D true;
> +	info =3D v4l2_format_info(inst->src_fmt.pixelformat);
> +	if (!info)
> +		return -EINVAL;
> +
> +	inst->cbcr_interleave =3D (info->comp_planes =3D=3D 2) ? true : false;
> +
> +	switch (inst->src_fmt.pixelformat) {
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_NV21M:
> +	case V4L2_PIX_FMT_NV61:
> +	case V4L2_PIX_FMT_NV61M:
>  		inst->nv21 =3D true;
> -	} else {
> -		inst->cbcr_interleave =3D false;
> +		break;
> +	default:
>  		inst->nv21 =3D false;
>  	}
> =20
> @@ -1095,13 +1131,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_bu=
ffer *vb)
>  	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
>  }
> =20
> -static void wave5_set_enc_openparam(struct enc_open_param *open_param,
> +static int wave5_set_enc_openparam(struct enc_open_param *open_param,
>  				    struct vpu_instance *inst)
>  {
>  	struct enc_wave_param input =3D inst->enc_param;
> +	const struct v4l2_format_info *info;
>  	u32 num_ctu_row =3D ALIGN(inst->dst_fmt.height, 64) / 64;
>  	u32 num_mb_row =3D ALIGN(inst->dst_fmt.height, 16) / 16;
> =20
> +	info =3D v4l2_format_info(inst->src_fmt.pixelformat);
> +	if (!info)
> +		return -EINVAL;
> +
> +	if (info->hdiv =3D=3D 2 && info->vdiv =3D=3D 1)
> +		open_param->src_format =3D FORMAT_422;
> +	else
> +		open_param->src_format =3D FORMAT_420;
> +
>  	open_param->wave_param.gop_preset_idx =3D PRESET_IDX_IPP_SINGLE;
>  	open_param->wave_param.hvs_qp_scale =3D 2;
>  	open_param->wave_param.hvs_max_delta_qp =3D 10;
> @@ -1190,6 +1236,8 @@ static void wave5_set_enc_openparam(struct enc_open=
_param *open_param,
>  			open_param->wave_param.intra_refresh_arg =3D num_ctu_row;
>  	}
>  	open_param->wave_param.forced_idr_header_enable =3D input.forced_idr_he=
ader_enable;
> +
> +	return 0;
>  }
> =20
>  static int initialize_sequence(struct vpu_instance *inst)
> @@ -1285,7 +1333,12 @@ static int wave5_vpu_enc_start_streaming(struct vb=
2_queue *q, unsigned int count
> =20
>  		memset(&open_param, 0, sizeof(struct enc_open_param));
> =20
> -		wave5_set_enc_openparam(&open_param, inst);
> +		ret =3D wave5_set_enc_openparam(&open_param, inst);
> +		if (ret) {
> +			dev_dbg(inst->dev->dev, "%s: wave5_set_enc_openparam, fail: %d\n",
> +				__func__, ret);
> +			goto return_buffers;
> +		}
> =20
>  		ret =3D wave5_vpu_enc_open(inst, &open_param);
>  		if (ret) {


