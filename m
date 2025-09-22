Return-Path: <linux-media+bounces-42951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8EB91A16
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D585189E5A4
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C61F1DE3A5;
	Mon, 22 Sep 2025 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Zmm0VwMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AE5191F66
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550803; cv=none; b=RgaMp+tXjoJQDQf1/oEeh9mIu4R/6ViHdq6AKaDakPPLt88ns9o6nW9R+JtSzi20OwEC/VuLMl+JXkIL4BlqDVUsDGkz5DBx+LkXtyqfQSbLzm9y8o593L/ZkjvXHseNJZzIPKA+Pzy3YnErwim7WCtI+Itsfc0lrdWljWYvpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550803; c=relaxed/simple;
	bh=6Df8NxguG9qDsI0h3yoKIKjTSkL+W00JSlq5UL2CriA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOqeNKxKuEhEm6UDkEFl6ve/ytNRHSt8N4rtQ/BovPMhTxaXd/m/SZUTBtFyceUMZWb2y20pyfAqlvqxHUkVc/Sw7crg67XAQUbbW4Eu0rNUdQUQcR4BZphL62tnYdRQo03QDP/VR7jHxw1rvcSohvIJbnNUXXOQdb6NkLGGJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Zmm0VwMz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4d10f772416so4045241cf.1
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1758550801; x=1759155601; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k0rfMuKDffzcF2pbWnCxF5gqRkB718SJ9J8ugkJZhI0=;
        b=Zmm0VwMzi2/a85k8G6zYU7KoXkQpt/P4cTxIrb8FB0NPfdyXbAdnd4U1DkauqV9Q7W
         uZJJB6xv/DBj+6U/E/fDWDCoq468wjhyARq3eXDi6dpVpa15Z+4ZInTBlr1VMQ+jDxDT
         f783kOhlbOYD2gDS+P4TNoq3A2dBhTOhUpHaTzFg4VJcTuMLxlEij1Nz7nwmUizm7lsj
         pLwGphdVccvWXEuRfBgcfjED4ib2ZJs0B8/2+A6yhYnGqTtHR2Ji0/Huw51mroRBQFoJ
         yvF9j1A95JmGZOB3vEZAgzU3muVNd2LQdoYG++kOZskHeNYNau5CoBCUkyt+YlRtV5hi
         jhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550801; x=1759155601;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0rfMuKDffzcF2pbWnCxF5gqRkB718SJ9J8ugkJZhI0=;
        b=TYoL9eD3jIwEbG3iv5/F8wMg4N/6x11OrURw8F4CVs3+7IPCqWBtcnOHc81yft86Jy
         K7rSEhQrFuT74AEp5l6ATMxOqcE3KwKy6JK14Hs8D5tWa2s8D3KZS3z9R1uh7LURW8bZ
         cjvnef9vV2S8o8fg5W9wx2vLBGSRDDZ7EKC+/6LwY0daQTB3+70zrxZThD/obIqloi1D
         gu4RVtTlAC8QBUhgRE8Rjn5WATiMqhU83WOLIux2wpgbFy6+RGQy7lgYk5JbWQtigThq
         NuSTqcmzfDswmv/Zr6EXAAn6B28lqXLc8OyF10QJ20aj/DIZtzIGE0lwbxpa/0qBwNa6
         mgKg==
X-Forwarded-Encrypted: i=1; AJvYcCXthmTxbqfdbGQq51yBK0YoSf93xkrXWyTHDSK3imMU7tvqU8M2VHSbN+Rrxd5brgjt8+v9wuPflKdKGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzeEQKe+Ka4juqoHcjS/XJ97xK5Xs0eJqeNQwLh8A6CCUm/aQ
	jFy3xtLjmDOi9NLnM5LmWWIurqT3h3nN5UlaPh6XqXj5SpRmE8VUSDRgIkewD1JkSTzP5sWRejo
	Z///p
X-Gm-Gg: ASbGncuqQLZspaa5AkBIx2dnTtYCM768HEGvxGZHcj55vo5B7j+cfpBE8qVYK/4x/66
	gcAJHcsJIKpCpx8E0X3ipMCejs97YKyqojeRjEdTd69c/E3OYs3GWU5fiHFUHyUDgtk0ADi42dq
	RnGa/37U3pdq4P44CJcBs72ugHZDz4D8krhr6QxX4ZDsXF/TzrKt1QpfpAKDLsXTtoB9hKPuL5T
	4AESoPL4Hs0zi3P+usZR9HfVWFhBayvwuJcDW7OEWQ/loXCe1MgJ3LGjjh84mdElq4cCOm8SNhU
	DDfC0zMs4uBRxNtXcSVzlRb2VnCBMdv9WvlIi2ZquD1EfkLG3WrxjQuRTbEl4nbeVhFLj9Vx1EA
	EIS7WA1fZ7yv+3YMx4jCJVGSt66+XoPYTC8tothY=
X-Google-Smtp-Source: AGHT+IEJKVFJvQdzMlv24ri3l2dTJ9inka+FIaTLCOIKsGHQanOg2gWbZBayM6/vJaEm9Boy9nJEEQ==
X-Received: by 2002:a05:620a:6ccd:b0:827:937c:2c2e with SMTP id af79cd13be357-8363adf489cmr1972115585a.30.1758550800399;
        Mon, 22 Sep 2025 07:20:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:aee0::5ac? ([2606:6d00:10:aee0::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836278b7ee5sm810275385a.18.2025.09.22.07.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:19:59 -0700 (PDT)
Message-ID: <ab0b031703efcd660923ac7d053d00ab7338797c.camel@ndufresne.ca>
Subject: Re: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the
 VDPU381 variant
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jonas Karlman <jonas@kwiboo.se>, Diederik de Haas
 <didi.debian@cknow.org>,  Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 10:19:57 -0400
In-Reply-To: <60353116-98cd-48f7-9f91-b2e51f2ff813@kwiboo.se>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
	 <20250808200340.156393-12-detlev.casanova@collabora.com>
	 <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
	 <60353116-98cd-48f7-9f91-b2e51f2ff813@kwiboo.se>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tLYINSSFihYeorIw7EIC"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-tLYINSSFihYeorIw7EIC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 20 septembre 2025 =C3=A0 18:23 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi Diederik and Detlev,
>=20
> On 9/20/2025 5:07 PM, Diederik de Haas wrote:
> > Hi again,
> >=20
> > I think I've found a similar issue here as I did for H264.
> >=20
> > On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
> > > The VDPU381 supports HEVC decoding up to 7680x4320@30fps.
> > > It could double that when using both decoder cores.
> > >=20
> > > It support YUV420 (8 and 10 bits) as well as AFBC (not implemented
> > > here)
> > >=20
> > > The fluster score is 146/147 for JCT-VC-HEVC_V1, tested on ROCK 5B.
> > > None of the other test suites works.
> > >=20
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > > =C2=A0.../media/platform/rockchip/rkvdec/Kconfig=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 1 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-cabac.c=C2=A0=C2=A0 | 3435 =
+++++++++++++++++
> > > =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 546 +++
> > > =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 101 +
> > > =C2=A0.../rockchip/rkvdec/rkvdec-vdpu381-hevc.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 596 +++
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0=
=C2=A0 81 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> > > =C2=A08 files changed, 4763 insertions(+)
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc-common.c
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc-common.h
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-vdpu381-hevc.c
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers=
/media/platform/rockchip/rkvdec/Kconfig
> > > index 5f3bdd848a2cf..3303b0ce32809 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > @@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_VDEC
> > > =C2=A0	select VIDEOBUF2_VMALLOC
> > > =C2=A0	select V4L2_MEM2MEM_DEV
> > > =C2=A0	select V4L2_H264
> > > +	select V4L2_HEVC
> > > =C2=A0	select V4L2_VP9
> > > =C2=A0	help
> > > =C2=A0	=C2=A0 Support for the Rockchip Video Decoder IP present on Ro=
ckchip SoCs,
> > >=20
> > > ...
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec.c
> > > index dab34a2322c95..cd01f1e41beb5 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > @@ -257,6 +257,60 @@ static const struct rkvdec_ctrls rkvdec_h264_ctr=
ls =3D {
> > > =C2=A0	.num_ctrls =3D ARRAY_SIZE(rkvdec_h264_ctrl_descs),
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct rkvdec_ctrl_desc rkvdec_hevc_ctrl_descs[] =3D {
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> > > +		.cfg.ops =3D &rkvdec_ctrl_ops,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
> > > +		.cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> > > +		.cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> > > +		.cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
> > > +		.cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> > > +		.cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> > > +		.cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +		.cfg.menu_skip_mask =3D
> > > +			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > > +		.cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> > > +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > > +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
> > > +		.cfg.dims =3D { 65 },
> > > +	},
> > > +	{
> > > +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
> > > +		.cfg.dims =3D { 65 },
> > > +	},
> > > +};
> > > +
> > > +static const struct rkvdec_ctrls rkvdec_hevc_ctrls =3D {
> > > +	.ctrls =3D rkvdec_hevc_ctrl_descs,
> > > +	.num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> > > +};
> > > +
> > > =C2=A0static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded=
_fmts[] =3D {
> > > =C2=A0	{
> > > =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV12,
> > > @@ -276,6 +330,17 @@ static const struct rkvdec_decoded_fmt_desc rkvd=
ec_h264_decoded_fmts[] =3D {
> > > =C2=A0	},
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct rkvdec_decoded_fmt_desc rkvdec_hevc_decoded_fmts=
[] =3D {
> > > +	{
> > > +		.fourcc =3D V4L2_PIX_FMT_NV12,
> > > +		.image_fmt =3D RKVDEC_IMG_FMT_420_8BIT,
> > > +	},
> > > +	{
> > > +		.fourcc =3D V4L2_PIX_FMT_NV15,
> > > +		.image_fmt =3D RKVDEC_IMG_FMT_420_10BIT,
> > > +	},
> > > +};
> > > +
> > > =C2=A0static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] =
=3D {
> > > =C2=A0	{
> > > =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_VP9_FRAME,
> > > @@ -354,6 +419,22 @@ static const struct rkvdec_coded_fmt_desc vdpu38=
1_coded_fmts[] =3D {
> > > =C2=A0		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> > > =C2=A0		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BU=
F,
> > > =C2=A0	},
> > > +	{
> > > +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > +		.frmsize =3D {
> > > +			.min_width =3D 16,
> > > +			.max_width =3D 65472,
> > > +			.step_width =3D 16,
> > > +			.min_height =3D 16,
> > > +			.max_height =3D 65472,
> > > +			.step_height =3D 16,
> > > +		},
> >=20
> > In the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size" =
:
> > 64x64 to 65472x65472; step size 16 pixels
> >=20
> > So I think .min_width and .min_height should be 64, not 16.
>=20
> This should probably be changed to use min/max of 64 together with use
> of 64 as step_width. With that we should not really need the special
> vdpu38x_fill_pixfmt_mp, if I am not mistaken.
>=20
> Use of 64 aligned buffers was introduced to correctly align buffers for
> H264 hi10 and 10-bit HEVC, I currently do not see any reason why we need
> to do something different for "rkvdec2".

And another data point, 64x64 have been picked in the past to improve
compatibility with the Mali GPUs, which typically requires 64 x 64 alignmen=
t.
Its not true if you use the YUV sampler, but there is a lot of use cases to=
 pass
decoder data to the normal 2D samplers.

More context, nearly all Rockchip SoC we support have GPUs based on ARM Mal=
i
technology.

Nicolas

>=20
> Regards,
> Jonas
>=20
> >=20
> > Cheers,
> > =C2=A0 Diederik
> >=20
> > > +		.ctrls =3D &rkvdec_hevc_ctrls,
> > > +		.ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
> > > +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> > > +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> > > +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> > > +	},
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] =
=3D {
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/driver=
s/media/platform/rockchip/rkvdec/rkvdec.h
> > > index acb9d72b130bb..df56bc0516ac9 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> > > @@ -173,6 +173,7 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_v=
p9_fmt_ops;
> > > =C2=A0
> > > =C2=A0/* VDPU381 ops */
> > > =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fm=
t_ops;
> > > +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops=
;
> > > =C2=A0
> > > =C2=A0/* VDPU383 ops */
> > > =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fm=
t_ops;
> >=20
>=20

--=-tLYINSSFihYeorIw7EIC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNFbDQAKCRDZQZRRKWBy
9GXeAQC3StdvV5aacSmLcskPRW3TcWPBLEmjU9Srwr9jryEqAwEAlZFEQxPQJ6L8
A5pwspzQZxGaGpKmJCD78skby4GSVAA=
=2/SZ
-----END PGP SIGNATURE-----

--=-tLYINSSFihYeorIw7EIC--

