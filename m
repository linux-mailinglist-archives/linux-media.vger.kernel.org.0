Return-Path: <linux-media+bounces-12282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CD8D52BF
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B61191F25001
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A6374041;
	Thu, 30 May 2024 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="sJBhXQLO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32F4D8BF
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717099302; cv=none; b=rdtnqTngbuiDBKvcUxsRFLyi1M8DTMUlJ1D1aAUK4xpJkvh4nM4kPzAH/j7duHFB4uSFaclF5kSDh2KCU2Ze/si/FtVQlo3o4zdGjwbxTpbj934LiFvE4ZrZVPPU7f03fa+G4D/6I+piT0lzQBpfXDjcxKStXpqsXVYfbc1Ef6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717099302; c=relaxed/simple;
	bh=/r7/OTLCiElOQas0c0fxhNoQ8eeJnGxc2JKe/9zLkS0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DG7+GWUGMCDwiKuWFJ6cVJRCuye0/2DNfL5qvhU+YJV9hO2kTClKlYmZJ5aqcvAYYbLwwuk8+PehMf9tf9BA6um8q0dcUuVmWi2/kEeBZ2DZcdeWkBoWVZKMnl2nLRkpse/irJvssKl6d5zPop34nmDaSZ7WBvAKYJ4OYBHoW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=sJBhXQLO; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b680c1fdd4so713341eaf.1
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1717099297; x=1717704097; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mz1XFXxjJwtbWRZxhYlZxp2zaE8qw/PKCyurP7Q/B/M=;
        b=sJBhXQLOW/fS1lHgGTKWRxHeGGauU/m8gGCc8qNY/Q67a201Brfkh15aDbYLPtttD4
         B9v0NWTLxWPHj18qEJ+nD06lIzDHxpbL1jB/ZC7boPdIzxcrTothW8FBiKXEXNadsaAf
         /MdjUEEHIokK3H9RrAR4YZZVIekkYDb/LA3/KgkzLRGUZBm26RLQZiea1FyOXtvedGit
         ofA3ES33Ugx4/1Rhb4ELxPN1g7ixFvdIXcoG4+BvFlyTCUCoZ9iU4ElLU7lYbjFCmO73
         vj9QC3F59x/GOpH51aEiMxFya2I2OWHlA2slSlFnx+JTnewUrA88DJJWR0hfIM0LtWHJ
         q1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717099297; x=1717704097;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mz1XFXxjJwtbWRZxhYlZxp2zaE8qw/PKCyurP7Q/B/M=;
        b=LAaFKm+5CpeNJ6UpqydjRQzuVntBtYRcouH5OOhj//UfCGIW514+KQHWoUC0Tc+lh3
         /eixHOs8yRlZ+WMN5J0CL6hj+oFTcOuBVVzNtOYDy0y2rOj+xGSph4W6riZZK87FUB1p
         YqWBfMkMoHJTFxB/h1sBIg57rw28qhk2qv4lYEurHyBQejL3l5iapWAKpImh/T8Pvzje
         f0tqmVbRvc/O0C9FWxH3ikkaU75dwwJrfMcaXk3HlU0GIMLTYaWJtwXgdGl5ay4OIBLt
         yr/ZaYVGh0UgCS5QCGwWtwnyzFglfiJiPA/IAIROTnG9ChmHAfDZufS0PrREScceqzJ9
         J8lA==
X-Gm-Message-State: AOJu0YzRqMXs//GBF6Iwn+P0IpJw/5q/j+m426cJcLHRDWDTwi54OJjr
	XlafJgq+SGsJ1+4O/cBSUnc4ZW+Y0Y4Qg1uzPl+GaC2sNUxcCjmBZoivXcpNyVg=
X-Google-Smtp-Source: AGHT+IHnoN0t46/mudHI/pwZ02B1xB3e+w77FuWNS59OXnDylwYXdAQV3r1//7N/DU0b96mQ2eea5Q==
X-Received: by 2002:a05:6358:998a:b0:192:711e:d796 with SMTP id e5c5f4694b2df-199b973ee36mr376182255d.25.1717099296949;
        Thu, 30 May 2024 13:01:36 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4b416c39sm1270336d6.105.2024.05.30.13.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 13:01:36 -0700 (PDT)
Message-ID: <b9cf4d06e6b13fcc4dabd083ba747df71194f9eb.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v4 3/4] media: chips-media: wave5: Use helpers to
 calculate bytesperline and sizeimage.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jackson Lee <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Thu, 30 May 2024 16:01:35 -0400
In-Reply-To: <20240510112252.800-4-jackson.lee@chipsnmedia.com>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
	 <20240510112252.800-4-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Sorry for the delay.

Le vendredi 10 mai 2024 =C3=A0 20:22 +0900, Jackson Lee a =C3=A9crit=C2=A0:
> From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
>=20
> Use v4l2-common helper functions to calculate bytesperline and sizeimage,
> instead of calculating in a wave5 driver directly.
>=20
> In case of raw(YUV) v4l2_pix_format, the wave5 driver updates
> v4l2_pix_format_mplane struct through v4l2_fill_pixfmt_mp() function.
>=20
> Encoder and Decoder need same bytesperline and sizeimage values
> for same v4l2_pix_format.
> So, a wave5_update_pix_fmt is refactored to support both together.
>=20
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Seems good to me now, thanks.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../platform/chips-media/wave5/wave5-helper.c |  24 ++
>  .../platform/chips-media/wave5/wave5-helper.h |   5 +
>  .../chips-media/wave5/wave5-vpu-dec.c         | 296 ++++++------------
>  .../chips-media/wave5/wave5-vpu-enc.c         | 197 +++++-------
>  .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
>  .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
>  6 files changed, 236 insertions(+), 318 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.c
> index 7e0f34bfa5be..b20ab69cd341 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -7,6 +7,8 @@
> =20
>  #include "wave5-helper.h"
> =20
> +#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
> +
>  const char *state_to_str(enum vpu_instance_state state)
>  {
>  	switch (state) {
> @@ -224,3 +226,25 @@ void wave5_return_bufs(struct vb2_queue *q, u32 stat=
e)
>  		v4l2_m2m_buf_done(vbuf, state);
>  	}
>  }
> +
> +void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  int pix_fmt_type,
> +			  unsigned int width,
> +			  unsigned int height,
> +			  const struct v4l2_frmsize_stepwise *frmsize)
> +{
> +	v4l2_apply_frmsize_constraints(&width, &height, frmsize);
> +
> +	if (pix_fmt_type =3D=3D VPU_FMT_TYPE_CODEC) {
> +		pix_mp->width =3D width;
> +		pix_mp->height =3D height;
> +		pix_mp->num_planes =3D 1;
> +		pix_mp->plane_fmt[0].bytesperline =3D 0;
> +		pix_mp->plane_fmt[0].sizeimage =3D max(DEFAULT_BS_SIZE(width, height),
> +						     pix_mp->plane_fmt[0].sizeimage);
> +	} else {
> +		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
> +	}
> +	pix_mp->flags =3D 0;
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +}
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.h
> index 6cee1c14d3ce..9937fce553fc 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
> @@ -28,4 +28,9 @@ const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsi=
gned int idx,
>  						   const struct vpu_format fmt_list[MAX_FMTS]);
>  enum wave_std wave5_to_vpu_std(unsigned int v4l2_pix_fmt, enum vpu_insta=
nce_type type);
>  void wave5_return_bufs(struct vb2_queue *q, u32 state);
> +void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  int pix_fmt_type,
> +			  unsigned int width,
> +			  unsigned int height,
> +			  const struct v4l2_frmsize_stepwise *frmsize);
>  #endif
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 861a0664047c..733c770fb049 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -11,111 +11,92 @@
>  #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
>  #define VPU_DEC_DRV_NAME "wave5-dec"
> =20
> -#define DEFAULT_SRC_SIZE(width, height) ({			\
> -	(width) * (height) / 8 * 3;					\
> -})
> +static const struct v4l2_frmsize_stepwise dec_hevc_frmsize =3D {
> +	.min_width =3D W5_MIN_DEC_PIC_8_WIDTH,
> +	.max_width =3D W5_MAX_DEC_PIC_WIDTH,
> +	.step_width =3D W5_DEC_CODEC_STEP_WIDTH,
> +	.min_height =3D W5_MIN_DEC_PIC_8_HEIGHT,
> +	.max_height =3D W5_MAX_DEC_PIC_HEIGHT,
> +	.step_height =3D W5_DEC_CODEC_STEP_HEIGHT,
> +};
> +
> +static const struct v4l2_frmsize_stepwise dec_h264_frmsize =3D {
> +	.min_width =3D W5_MIN_DEC_PIC_32_WIDTH,
> +	.max_width =3D W5_MAX_DEC_PIC_WIDTH,
> +	.step_width =3D W5_DEC_CODEC_STEP_WIDTH,
> +	.min_height =3D W5_MIN_DEC_PIC_32_HEIGHT,
> +	.max_height =3D W5_MAX_DEC_PIC_HEIGHT,
> +	.step_height =3D W5_DEC_CODEC_STEP_HEIGHT,
> +};
> +
> +static const struct v4l2_frmsize_stepwise dec_raw_frmsize =3D {
> +	.min_width =3D W5_MIN_DEC_PIC_8_WIDTH,
> +	.max_width =3D W5_MAX_DEC_PIC_WIDTH,
> +	.step_width =3D W5_DEC_RAW_STEP_WIDTH,
> +	.min_height =3D W5_MIN_DEC_PIC_8_HEIGHT,
> +	.max_height =3D W5_MAX_DEC_PIC_HEIGHT,
> +	.step_height =3D W5_DEC_RAW_STEP_HEIGHT,
> +};
> =20
>  static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] =3D {
>  	[VPU_FMT_TYPE_CODEC] =3D {
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_hevc_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
> -			.max_width =3D 8192,
> -			.min_width =3D 32,
> -			.max_height =3D 4320,
> -			.min_height =3D 32,
> +			.v4l2_frmsize =3D &dec_h264_frmsize,
>  		},
>  	},
>  	[VPU_FMT_TYPE_RAW] =3D {
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV422P,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV16,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420M,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12M,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV422M,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV16M,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61M,
> -			.max_width =3D 8192,
> -			.min_width =3D 8,
> -			.max_height =3D 4320,
> -			.min_height =3D 8,
> +			.v4l2_frmsize =3D &dec_raw_frmsize,
>  		},
>  	}
>  };
> @@ -234,74 +215,6 @@ static void wave5_handle_src_buffer(struct vpu_insta=
nce *inst, dma_addr_t rd_ptr
>  	inst->remaining_consumed_bytes =3D consumed_bytes;
>  }
> =20
> -static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, =
unsigned int width,
> -				 unsigned int height)
> -{
> -	switch (pix_mp->pixelformat) {
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -		pix_mp->width =3D round_up(width, 32);
> -		pix_mp->height =3D round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height * 3 / 2;
> -		break;
> -	case V4L2_PIX_FMT_YUV422P:
> -	case V4L2_PIX_FMT_NV16:
> -	case V4L2_PIX_FMT_NV61:
> -		pix_mp->width =3D round_up(width, 32);
> -		pix_mp->height =3D round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height * 2;
> -		break;
> -	case V4L2_PIX_FMT_YUV420M:
> -		pix_mp->width =3D round_up(width, 32);
> -		pix_mp->height =3D round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height;
> -		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[1].sizeimage =3D width * height / 4;
> -		pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[2].sizeimage =3D width * height / 4;
> -		break;
> -	case V4L2_PIX_FMT_NV12M:
> -	case V4L2_PIX_FMT_NV21M:
> -		pix_mp->width =3D round_up(width, 32);
> -		pix_mp->height =3D round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height;
> -		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[1].sizeimage =3D width * height / 2;
> -		break;
> -	case V4L2_PIX_FMT_YUV422M:
> -		pix_mp->width =3D round_up(width, 32);
> -		pix_mp->height =3D round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height;
> -		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[1].sizeimage =3D width * height / 2;
> -		pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[2].sizeimage =3D width * height / 2;
> -		break;
> -	case V4L2_PIX_FMT_NV16M:
> -	case V4L2_PIX_FMT_NV61M:
> -		pix_mp->width =3D round_up(width, 32);
> -		pix_mp->height =3D round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height;
> -		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[1].sizeimage =3D width * height;
> -		break;
> -	default:
> -		pix_mp->width =3D width;
> -		pix_mp->height =3D height;
> -		pix_mp->plane_fmt[0].bytesperline =3D 0;
> -		pix_mp->plane_fmt[0].sizeimage =3D max(DEFAULT_SRC_SIZE(width, height)=
,
> -						     pix_mp->plane_fmt[0].sizeimage);
> -		break;
> -	}
> -}
> -
>  static int start_decode(struct vpu_instance *inst, u32 *fail_res)
>  {
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> @@ -389,6 +302,8 @@ static int handle_dynamic_resolution_change(struct vp=
u_instance *inst)
>  	}
> =20
>  	if (p_dec_info->initial_info_obtained) {
> +		const struct vpu_format *vpu_fmt;
> +
>  		inst->conf_win.left =3D initial_info->pic_crop_rect.left;
>  		inst->conf_win.top =3D initial_info->pic_crop_rect.top;
>  		inst->conf_win.width =3D initial_info->pic_width -
> @@ -396,10 +311,27 @@ static int handle_dynamic_resolution_change(struct =
vpu_instance *inst)
>  		inst->conf_win.height =3D initial_info->pic_height -
>  			initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
> =20
> -		wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
> -				     initial_info->pic_height);
> -		wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
> -				     initial_info->pic_height);
> +		vpu_fmt =3D wave5_find_vpu_fmt(inst->src_fmt.pixelformat,
> +				dec_fmt_list[VPU_FMT_TYPE_CODEC]);
> +		if (!vpu_fmt)
> +			return -EINVAL;
> +
> +		wave5_update_pix_fmt(&inst->src_fmt,
> +					VPU_FMT_TYPE_CODEC,
> +					initial_info->pic_width,
> +					initial_info->pic_height,
> +					vpu_fmt->v4l2_frmsize);
> +
> +		vpu_fmt =3D wave5_find_vpu_fmt(inst->dst_fmt.pixelformat,
> +				dec_fmt_list[VPU_FMT_TYPE_RAW]);
> +		if (!vpu_fmt)
> +			return -EINVAL;
> +
> +		wave5_update_pix_fmt(&inst->dst_fmt,
> +					VPU_FMT_TYPE_RAW,
> +					initial_info->pic_width,
> +					initial_info->pic_height,
> +					vpu_fmt->v4l2_frmsize);
>  	}
> =20
>  	v4l2_event_queue_fh(fh, &vpu_event_src_ch);
> @@ -548,12 +480,7 @@ static int wave5_vpu_dec_enum_framesizes(struct file=
 *f, void *fh, struct v4l2_f
>  	}
> =20
>  	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> -	fsize->stepwise.min_width =3D vpu_fmt->min_width;
> -	fsize->stepwise.max_width =3D vpu_fmt->max_width;
> -	fsize->stepwise.step_width =3D 1;
> -	fsize->stepwise.min_height =3D vpu_fmt->min_height;
> -	fsize->stepwise.max_height =3D vpu_fmt->max_height;
> -	fsize->stepwise.step_height =3D 1;
> +	fsize->stepwise =3D *vpu_fmt->v4l2_frmsize;
> =20
>  	return 0;
>  }
> @@ -589,14 +516,10 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *f=
ile, void *fh, struct v4l2_fo
>  		width =3D inst->dst_fmt.width;
>  		height =3D inst->dst_fmt.height;
>  		f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
> -		f->fmt.pix_mp.num_planes =3D inst->dst_fmt.num_planes;
>  	} else {
> -		const struct v4l2_format_info *info =3D v4l2_format_info(vpu_fmt->v4l2=
_pix_fmt);
> -
> -		width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_=
width);
> -		height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->m=
ax_height);
> +		width =3D f->fmt.pix_mp.width;
> +		height =3D f->fmt.pix_mp.height;
>  		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> -		f->fmt.pix_mp.num_planes =3D info->mem_planes;
>  	}
> =20
>  	if (p_dec_info->initial_info_obtained) {
> @@ -604,9 +527,10 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *fi=
le, void *fh, struct v4l2_fo
>  		height =3D inst->dst_fmt.height;
>  	}
> =20
> -	wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
> -	f->fmt.pix_mp.flags =3D 0;
> -	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
> +					     width,
> +					     height,
> +					     vpu_fmt->v4l2_frmsize);
>  	f->fmt.pix_mp.colorspace =3D inst->colorspace;
>  	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
>  	f->fmt.pix_mp.quantization =3D inst->quantization;
> @@ -719,6 +643,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *fil=
e, void *fh, struct v4l2_fo
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
>  	const struct vpu_format *vpu_fmt;
> +	int width, height;
> =20
>  	dev_dbg(inst->dev->dev,
>  		"%s: fourcc: %u width: %u height: %u num_planes: %u colorspace: %u fie=
ld: %u\n",
> @@ -727,20 +652,19 @@ static int wave5_vpu_dec_try_fmt_out(struct file *f=
ile, void *fh, struct v4l2_fo
> =20
>  	vpu_fmt =3D wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, dec_fmt_list[=
VPU_FMT_TYPE_CODEC]);
>  	if (!vpu_fmt) {
> +		width =3D inst->src_fmt.width;
> +		height =3D inst->src_fmt.height;
>  		f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
> -		f->fmt.pix_mp.num_planes =3D inst->src_fmt.num_planes;
> -		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fm=
t.height);
>  	} else {
> -		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->=
max_width);
> -		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fm=
t->max_height);
> -
> +		width =3D f->fmt.pix_mp.width;
> +		height =3D f->fmt.pix_mp.height;
>  		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> -		f->fmt.pix_mp.num_planes =3D 1;
> -		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
>  	}
> =20
> -	f->fmt.pix_mp.flags =3D 0;
> -	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
> +					     width,
> +					     height,
> +					     vpu_fmt->v4l2_frmsize);
> =20
>  	return 0;
>  }
> @@ -748,6 +672,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *fil=
e, void *fh, struct v4l2_fo
>  static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v=
4l2_format *f)
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
> +	const struct vpu_format *vpu_fmt;
>  	int i, ret;
> =20
>  	dev_dbg(inst->dev->dev,
> @@ -782,7 +707,14 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file=
, void *fh, struct v4l2_form
>  	inst->quantization =3D f->fmt.pix_mp.quantization;
>  	inst->xfer_func =3D f->fmt.pix_mp.xfer_func;
> =20
> -	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp=
.height);
> +	vpu_fmt =3D wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, dec_fmt_list[=
VPU_FMT_TYPE_RAW]);
> +	if (!vpu_fmt)
> +		return -EINVAL;
> +
> +	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_RAW,
> +					     f->fmt.pix_mp.width,
> +					     f->fmt.pix_mp.height,
> +					     vpu_fmt->v4l2_frmsize);
> =20
>  	return 0;
>  }
> @@ -1005,6 +937,7 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queu=
e *q, unsigned int *num_buff
>  	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
>  	struct v4l2_pix_format_mplane inst_format =3D
>  		(q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : i=
nst->dst_fmt;
> +	unsigned int i;
> =20
>  	dev_dbg(inst->dev->dev, "%s: num_buffers: %u | num_planes: %u | type: %=
u\n", __func__,
>  		*num_buffers, *num_planes, q->type);
> @@ -1018,31 +951,9 @@ static int wave5_vpu_dec_queue_setup(struct vb2_que=
ue *q, unsigned int *num_buff
>  		if (*num_buffers < inst->fbc_buf_count)
>  			*num_buffers =3D inst->fbc_buf_count;
> =20
> -		if (*num_planes =3D=3D 1) {
> -			if (inst->output_format =3D=3D FORMAT_422)
> -				sizes[0] =3D inst_format.width * inst_format.height * 2;
> -			else
> -				sizes[0] =3D inst_format.width * inst_format.height * 3 / 2;
> -			dev_dbg(inst->dev->dev, "%s: size[0]: %u\n", __func__, sizes[0]);
> -		} else if (*num_planes =3D=3D 2) {
> -			sizes[0] =3D inst_format.width * inst_format.height;
> -			if (inst->output_format =3D=3D FORMAT_422)
> -				sizes[1] =3D inst_format.width * inst_format.height;
> -			else
> -				sizes[1] =3D inst_format.width * inst_format.height / 2;
> -			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u\n",
> -				__func__, sizes[0], sizes[1]);
> -		} else if (*num_planes =3D=3D 3) {
> -			sizes[0] =3D inst_format.width * inst_format.height;
> -			if (inst->output_format =3D=3D FORMAT_422) {
> -				sizes[1] =3D inst_format.width * inst_format.height / 2;
> -				sizes[2] =3D inst_format.width * inst_format.height / 2;
> -			} else {
> -				sizes[1] =3D inst_format.width * inst_format.height / 4;
> -				sizes[2] =3D inst_format.width * inst_format.height / 4;
> -			}
> -			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u | size[2]: %u\=
n",
> -				__func__, sizes[0], sizes[1], sizes[2]);
> +		for (i =3D 0; i < *num_planes; i++) {
> +			sizes[i] =3D inst_format.plane_fmt[i].sizeimage;
> +			dev_dbg(inst->dev->dev, "%s: size[%u]: %u\n", __func__, i, sizes[i]);
>  		}
>  	}
> =20
> @@ -1564,20 +1475,17 @@ static const struct vb2_ops wave5_vpu_dec_vb2_ops=
 =3D {
>  static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_=
fmt,
>  				     struct v4l2_pix_format_mplane *dst_fmt)
>  {
> -	unsigned int dst_pix_fmt =3D dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix=
_fmt;
> -	const struct v4l2_format_info *dst_fmt_info =3D v4l2_format_info(dst_pi=
x_fmt);
> -
>  	src_fmt->pixelformat =3D dec_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_f=
mt;
> -	src_fmt->field =3D V4L2_FIELD_NONE;
> -	src_fmt->flags =3D 0;
> -	src_fmt->num_planes =3D 1;
> -	wave5_update_pix_fmt(src_fmt, 720, 480);
> -
> -	dst_fmt->pixelformat =3D dst_pix_fmt;
> -	dst_fmt->field =3D V4L2_FIELD_NONE;
> -	dst_fmt->flags =3D 0;
> -	dst_fmt->num_planes =3D dst_fmt_info->mem_planes;
> -	wave5_update_pix_fmt(dst_fmt, 736, 480);
> +	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_CODEC,
> +				      W5_DEF_DEC_PIC_WIDTH,
> +				      W5_DEF_DEC_PIC_HEIGHT,
> +				      &dec_hevc_frmsize);
> +
> +	dst_fmt->pixelformat =3D dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt=
;
> +	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_RAW,
> +				      W5_DEF_DEC_PIC_WIDTH,
> +				      W5_DEF_DEC_PIC_HEIGHT,
> +				      &dec_raw_frmsize);
>  }
> =20
>  static int wave5_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq=
, struct vb2_queue *dst_vq)
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 703fd8d1c7da..75d230df45f6 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -11,65 +11,60 @@
>  #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
>  #define VPU_ENC_DRV_NAME "wave5-enc"
> =20
> +static const struct v4l2_frmsize_stepwise enc_frmsize[FMT_TYPES] =3D {
> +	[VPU_FMT_TYPE_CODEC] =3D {
> +		.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> +		.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> +		.step_width =3D W5_ENC_CODEC_STEP_WIDTH,
> +		.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +		.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> +		.step_height =3D W5_ENC_CODEC_STEP_HEIGHT,
> +	},
> +	[VPU_FMT_TYPE_RAW] =3D {
> +		.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> +		.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> +		.step_width =3D W5_ENC_RAW_STEP_WIDTH,
> +		.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +		.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> +		.step_height =3D W5_ENC_RAW_STEP_HEIGHT,
> +	},
> +};
> +
>  static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] =3D {
>  	[VPU_FMT_TYPE_CODEC] =3D {
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_CODEC],
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_CODEC],
>  		},
>  	},
>  	[VPU_FMT_TYPE_RAW] =3D {
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420M,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12M,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
>  		},
>  		{
>  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
> -			.max_width =3D W5_MAX_ENC_PIC_WIDTH,
> -			.min_width =3D W5_MIN_ENC_PIC_WIDTH,
> -			.max_height =3D W5_MAX_ENC_PIC_HEIGHT,
> -			.min_height =3D W5_MIN_ENC_PIC_HEIGHT,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
>  		},
>  	}
>  };
> @@ -106,46 +101,6 @@ static int switch_state(struct vpu_instance *inst, e=
num vpu_instance_state state
>  	return -EINVAL;
>  }
> =20
> -static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, =
unsigned int width,
> -				 unsigned int height)
> -{
> -	switch (pix_mp->pixelformat) {
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -		pix_mp->width =3D width;
> -		pix_mp->height =3D height;
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height * 3 / =
2;
> -		break;
> -	case V4L2_PIX_FMT_YUV420M:
> -		pix_mp->width =3D width;
> -		pix_mp->height =3D height;
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height;
> -		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[1].sizeimage =3D round_up(width, 32) * height / 4;
> -		pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[2].sizeimage =3D round_up(width, 32) * height / 4;
> -		break;
> -	case V4L2_PIX_FMT_NV12M:
> -	case V4L2_PIX_FMT_NV21M:
> -		pix_mp->width =3D width;
> -		pix_mp->height =3D height;
> -		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height;
> -		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32);
> -		pix_mp->plane_fmt[1].sizeimage =3D round_up(width, 32) * height / 2;
> -		break;
> -	default:
> -		pix_mp->width =3D width;
> -		pix_mp->height =3D height;
> -		pix_mp->plane_fmt[0].bytesperline =3D 0;
> -		pix_mp->plane_fmt[0].sizeimage =3D width * height / 8 * 3;
> -		break;
> -	}
> -}
> -
>  static int start_encode(struct vpu_instance *inst, u32 *fail_res)
>  {
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> @@ -360,13 +315,8 @@ static int wave5_vpu_enc_enum_framesizes(struct file=
 *f, void *fh, struct v4l2_f
>  			return -EINVAL;
>  	}
> =20
> -	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> -	fsize->stepwise.min_width =3D vpu_fmt->min_width;
> -	fsize->stepwise.max_width =3D vpu_fmt->max_width;
> -	fsize->stepwise.step_width =3D 1;
> -	fsize->stepwise.min_height =3D vpu_fmt->min_height;
> -	fsize->stepwise.max_height =3D vpu_fmt->max_height;
> -	fsize->stepwise.step_height =3D 1;
> +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise =3D enc_frmsize[VPU_FMT_TYPE_CODEC];
> =20
>  	return 0;
>  }
> @@ -392,6 +342,7 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *fil=
e, void *fh, struct v4l2_fo
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
>  	const struct vpu_format *vpu_fmt;
> +	int width, height;
> =20
>  	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes=
: %u field: %u\n",
>  		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_m=
p.height,
> @@ -399,20 +350,19 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *f=
ile, void *fh, struct v4l2_fo
> =20
>  	vpu_fmt =3D wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[=
VPU_FMT_TYPE_CODEC]);
>  	if (!vpu_fmt) {
> +		width =3D inst->dst_fmt.width;
> +		height =3D inst->dst_fmt.height;
>  		f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
> -		f->fmt.pix_mp.num_planes =3D inst->dst_fmt.num_planes;
> -		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fm=
t.height);
>  	} else {
> -		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->=
max_width);
> -		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fm=
t->max_height);
> -
> +		width =3D f->fmt.pix_mp.width;
> +		height =3D f->fmt.pix_mp.height;
>  		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> -		f->fmt.pix_mp.num_planes =3D 1;
> -		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
>  	}
> =20
> -	f->fmt.pix_mp.flags =3D 0;
> -	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
> +					     width,
> +					     height,
> +					     vpu_fmt->v4l2_frmsize);
>  	f->fmt.pix_mp.colorspace =3D inst->colorspace;
>  	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
>  	f->fmt.pix_mp.quantization =3D inst->quantization;
> @@ -500,6 +450,7 @@ static int wave5_vpu_enc_try_fmt_out(struct file *fil=
e, void *fh, struct v4l2_fo
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
>  	const struct vpu_format *vpu_fmt;
> +	int width, height;
> =20
>  	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes=
: %u field: %u\n",
>  		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_m=
p.height,
> @@ -507,21 +458,19 @@ static int wave5_vpu_enc_try_fmt_out(struct file *f=
ile, void *fh, struct v4l2_fo
> =20
>  	vpu_fmt =3D wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[=
VPU_FMT_TYPE_RAW]);
>  	if (!vpu_fmt) {
> +		width =3D inst->src_fmt.width;
> +		height =3D inst->src_fmt.height;
>  		f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
> -		f->fmt.pix_mp.num_planes =3D inst->src_fmt.num_planes;
> -		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fm=
t.height);
>  	} else {
> -		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->=
max_width);
> -		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fm=
t->max_height);
> -		const struct v4l2_format_info *info =3D v4l2_format_info(vpu_fmt->v4l2=
_pix_fmt);
> -
> +		width =3D f->fmt.pix_mp.width;
> +		height =3D f->fmt.pix_mp.height;
>  		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> -		f->fmt.pix_mp.num_planes =3D info->mem_planes;
> -		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
>  	}
> =20
> -	f->fmt.pix_mp.flags =3D 0;
> -	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
> +					     width,
> +					     height,
> +					     vpu_fmt->v4l2_frmsize);
> =20
>  	return 0;
>  }
> @@ -529,6 +478,7 @@ static int wave5_vpu_enc_try_fmt_out(struct file *fil=
e, void *fh, struct v4l2_fo
>  static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v=
4l2_format *f)
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
> +	const struct vpu_format *vpu_fmt;
>  	int i, ret;
> =20
>  	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes=
: %u field: %u\n",
> @@ -568,7 +518,16 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file=
, void *fh, struct v4l2_form
>  	inst->quantization =3D f->fmt.pix_mp.quantization;
>  	inst->xfer_func =3D f->fmt.pix_mp.xfer_func;
> =20
> -	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp=
.height);
> +	vpu_fmt =3D wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, enc_fmt_list[=
VPU_FMT_TYPE_CODEC]);
> +	if (!vpu_fmt)
> +		return -EINVAL;
> +
> +	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_CODEC,
> +					     f->fmt.pix_mp.width,
> +					     f->fmt.pix_mp.height,
> +					     vpu_fmt->v4l2_frmsize);
> +	inst->conf_win.width =3D inst->dst_fmt.width;
> +	inst->conf_win.height =3D inst->dst_fmt.height;
> =20
>  	return 0;
>  }
> @@ -584,12 +543,17 @@ static int wave5_vpu_enc_g_selection(struct file *f=
ile, void *fh, struct v4l2_se
>  	switch (s->target) {
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> -	case V4L2_SEL_TGT_CROP:
>  		s->r.left =3D 0;
>  		s->r.top =3D 0;
>  		s->r.width =3D inst->dst_fmt.width;
>  		s->r.height =3D inst->dst_fmt.height;
>  		break;
> +	case V4L2_SEL_TGT_CROP:
> +		s->r.left =3D 0;
> +		s->r.top =3D 0;
> +		s->r.width =3D inst->conf_win.width;
> +		s->r.height =3D inst->conf_win.height;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -612,8 +576,10 @@ static int wave5_vpu_enc_s_selection(struct file *fi=
le, void *fh, struct v4l2_se
> =20
>  	s->r.left =3D 0;
>  	s->r.top =3D 0;
> -	s->r.width =3D inst->src_fmt.width;
> -	s->r.height =3D inst->src_fmt.height;
> +	s->r.width =3D min(s->r.width, inst->dst_fmt.width);
> +	s->r.height =3D min(s->r.height, inst->dst_fmt.height);
> +
> +	inst->conf_win =3D s->r;
> =20
>  	return 0;
>  }
> @@ -1151,8 +1117,8 @@ static void wave5_set_enc_openparam(struct enc_open=
_param *open_param,
>  	open_param->wave_param.lambda_scaling_enable =3D 1;
> =20
>  	open_param->line_buf_int_en =3D true;
> -	open_param->pic_width =3D inst->dst_fmt.width;
> -	open_param->pic_height =3D inst->dst_fmt.height;
> +	open_param->pic_width =3D inst->conf_win.width;
> +	open_param->pic_height =3D inst->conf_win.height;
>  	open_param->frame_rate_info =3D inst->frame_rate;
>  	open_param->rc_enable =3D inst->rc_enable;
>  	if (inst->rc_enable) {
> @@ -1456,20 +1422,17 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops=
 =3D {
>  static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_=
fmt,
>  				     struct v4l2_pix_format_mplane *dst_fmt)
>  {
> -	unsigned int src_pix_fmt =3D enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix=
_fmt;
> -	const struct v4l2_format_info *src_fmt_info =3D v4l2_format_info(src_pi=
x_fmt);
> -
> -	src_fmt->pixelformat =3D src_pix_fmt;
> -	src_fmt->field =3D V4L2_FIELD_NONE;
> -	src_fmt->flags =3D 0;
> -	src_fmt->num_planes =3D src_fmt_info->mem_planes;
> -	wave5_update_pix_fmt(src_fmt, 416, 240);
> +	src_fmt->pixelformat =3D enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt=
;
> +	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_RAW,
> +				      W5_DEF_ENC_PIC_WIDTH,
> +				      W5_DEF_ENC_PIC_HEIGHT,
> +				      &enc_frmsize[VPU_FMT_TYPE_RAW]);
> =20
>  	dst_fmt->pixelformat =3D enc_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_f=
mt;
> -	dst_fmt->field =3D V4L2_FIELD_NONE;
> -	dst_fmt->flags =3D 0;
> -	dst_fmt->num_planes =3D 1;
> -	wave5_update_pix_fmt(dst_fmt, 416, 240);
> +	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
> +				      W5_DEF_ENC_PIC_WIDTH,
> +				      W5_DEF_ENC_PIC_HEIGHT,
> +				      &enc_frmsize[VPU_FMT_TYPE_CODEC]);
>  }
> =20
>  static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq=
, struct vb2_queue *dst_vq)
> @@ -1733,6 +1696,8 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
> =20
>  	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
> +	inst->conf_win.width =3D inst->dst_fmt.width;
> +	inst->conf_win.height =3D inst->dst_fmt.height;
>  	inst->colorspace =3D V4L2_COLORSPACE_REC709;
>  	inst->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
>  	inst->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drive=
rs/media/platform/chips-media/wave5/wave5-vpu.h
> index 32b7fd3730b5..3847332551fc 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> @@ -38,10 +38,7 @@ enum vpu_fmt_type {
> =20
>  struct vpu_format {
>  	unsigned int v4l2_pix_fmt;
> -	unsigned int max_width;
> -	unsigned int min_width;
> -	unsigned int max_height;
> -	unsigned int min_height;
> +	const struct v4l2_frmsize_stepwise *v4l2_frmsize;
>  };
> =20
>  static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh=
)
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b=
/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> index d9751eedb0f9..8e11d93ca38f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> @@ -30,10 +30,29 @@
> =20
>  #define MAX_NUM_INSTANCE                32
> =20
> -#define W5_MIN_ENC_PIC_WIDTH            256
> -#define W5_MIN_ENC_PIC_HEIGHT           128
> -#define W5_MAX_ENC_PIC_WIDTH            8192
> -#define W5_MAX_ENC_PIC_HEIGHT           8192
> +#define W5_DEF_DEC_PIC_WIDTH            720U
> +#define W5_DEF_DEC_PIC_HEIGHT           480U
> +#define W5_MIN_DEC_PIC_8_WIDTH          8U
> +#define W5_MIN_DEC_PIC_8_HEIGHT         8U
> +#define W5_MIN_DEC_PIC_32_WIDTH         32U
> +#define W5_MIN_DEC_PIC_32_HEIGHT        32U
> +#define W5_MAX_DEC_PIC_WIDTH            8192U
> +#define W5_MAX_DEC_PIC_HEIGHT           4320U
> +#define W5_DEC_CODEC_STEP_WIDTH         1U
> +#define W5_DEC_CODEC_STEP_HEIGHT        1U
> +#define W5_DEC_RAW_STEP_WIDTH           32U
> +#define W5_DEC_RAW_STEP_HEIGHT          16U
> +
> +#define W5_DEF_ENC_PIC_WIDTH            416U
> +#define W5_DEF_ENC_PIC_HEIGHT           240U
> +#define W5_MIN_ENC_PIC_WIDTH            256U
> +#define W5_MIN_ENC_PIC_HEIGHT           128U
> +#define W5_MAX_ENC_PIC_WIDTH            8192U
> +#define W5_MAX_ENC_PIC_HEIGHT           8192U
> +#define W5_ENC_CODEC_STEP_WIDTH         8U
> +#define W5_ENC_CODEC_STEP_HEIGHT        8U
> +#define W5_ENC_RAW_STEP_WIDTH           32U
> +#define W5_ENC_RAW_STEP_HEIGHT          16U
> =20
>  //  application specific configuration
>  #define VPU_ENC_TIMEOUT                 60000


