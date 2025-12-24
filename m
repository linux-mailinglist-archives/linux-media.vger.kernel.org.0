Return-Path: <linux-media+bounces-49503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2CCDD064
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 20:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 478F23001E2F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 19:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C573B33BBB6;
	Wed, 24 Dec 2025 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="WmKkZH+i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03ED25F7A5
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766603436; cv=none; b=D/elbbnwPOIjxeEQ1lSJOE6AHdSR2hkVU7Lr2X0Nd9DJP3vdoohe1kWJnc+OcAAJFbVwI4Hg+6uU7Eao5lualG36oNsi0wZw+mCVRFQVsdq6GotLDPYjx5vuqeW9wvul/tXHhvaDoiY7muXtDWUYv2EK+5kWLU6vxAsijnum9T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766603436; c=relaxed/simple;
	bh=dAN0G1jjsYS7iXYecflX2BXbHj9pHSN+JkwV709cqgg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QpfBY6ITqpqeXSCluQ9A2+Z3Qq7YR0sw12dPktupWtJAh+k6QtHA7aPIL/JMjW8Jt+B50aqxOC2LgI2YjW2MHzxqbeAy+lJc9nD3LRxaDrvaih0rMw4ks70SBKfSOgweFvJwfe1I1epA849nFBoWo+4ANi10FmszVnYx9D84hyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=WmKkZH+i; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-88a35a00502so63213246d6.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 11:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766603433; x=1767208233; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WdkhkRib8m1PnipWAZ9dgFe926aVbUVCPdJkvFIgPao=;
        b=WmKkZH+iMfmAGs0nS6bIFLbl832MQwkpr9Bfdmb8LmRj6hbwuo5Zf0HW5nJIkOTBGs
         HHNjtLd+hYF0MwZtPD86BBQQ3Ii45n1C3yvfBSCm7dlNQsA1IOfV6mr02FePMajU2fyF
         4nHITANGMZFFye1B+2vAk6N1BwUukeCIEBA/uWauqg6MvRJ7K7h0viiKRFs2MqpE1XUb
         /WFAQ/lClBrot7Z6I3ah0mzwfVvxwwyPpZcTHEGVA+K2qTMJxhmUVvVYhXJ84i9dtcrt
         MU+nd7MRH4uMgCxotxhetowa6hQ66gAJzyQ5NQtn8omN96ywyt3PL70d7GDWt+9n+11r
         YF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603433; x=1767208233;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdkhkRib8m1PnipWAZ9dgFe926aVbUVCPdJkvFIgPao=;
        b=MJIpvWsVoTW/6ZHulZ4JA6ozJSdpG+7esPczonvflVCnkCnRI0VsiTevNZUSustOHK
         ZgQ6QW5QDahlbVuS5idYfpY/kZeUPJh0GVGQPG/dTbA8BvR1wF0cHkVtCD830BGw0JhG
         ycXwbPTYJ33rz/R2S70uqKmFa1v56ioQni6x/00GqC0U7DGfQcmvkZP1JfCG9/f3t42S
         uj/YXrF2PzSWNbUbV3DdEaj0aVkeu3zFqUMvPFNjAHFiM8oLE26s2GBCONSE0Vb42mcX
         y0zku3z4DDiSSPcCbmHgY2+XatHmysI3BPdiO4tnvolrvFrj6QDCRUVxVekuc3jUf04v
         f5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVbDhBKLpHosEBEd+hpfF1rHL4wC9bJCwtXspvm9SzCHiTDcr5xM+7J8E9Cp4CNiRndkGW4qDFX03AXwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ6wCC96aGvdVsJLI9GRalGpDc+pDcBnn1Xxt1lcvdOicB6+Ur
	JxKGa20fziSU3o7V96h8P3IYqsoC3QziyLOZRlfKtXcyctdqLCtEKtSowQeWsg3WfCw=
X-Gm-Gg: AY/fxX71qor1oaTOX940u55yEMKmef6Th0fp5jJksN410n7A7emuCIP9tcjtAIum9Lo
	OU72a2+N9DnwSrQmbH+uwjBOH4UAAAfyYyio/t2t3YUA1LHGRrVYB6EeoQKiD8rohoEbKa5UyP5
	8d3lYWseNyxQJ2f4XYkkXMMlt0WMK/DnxfiEBLbaXbzmMSyRtUYMFLWh9Yf20V75KmvJLKXWz+w
	aI/4SbkUoMe9ZYPaTE17Ylxzw52NuPPpw+/IhL13GLWLozoFg3KPtLujUIhI6LT19wiZvyW06x/
	4BNJ7JvSC72tzE3osGglAt/ldLSi7d4zZFGujNWI3nmh35beAHbZSYhZ0kmkFk+SyDYU6/pGyzM
	HlHbwzsxYIhu5BupqH8bFcV46km70xG/Jzq/xIU2SrROBnDbG7skgAJG94mxwGokLpLaBWpaDZG
	ENhJJQn6L2Z5YY14Aw
X-Google-Smtp-Source: AGHT+IEQUsqZXLqkkPxa2+KYv+fyXfZuaLetYcgC91biDM0aZwokVZC4OyDueQEybb9eanIS8m171g==
X-Received: by 2002:a05:6214:470b:b0:7f1:c596:e1cc with SMTP id 6a1803df08f44-88d820420fdmr269109756d6.19.1766603432784;
        Wed, 24 Dec 2025 11:10:32 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997addd5sm136299236d6.33.2025.12.24.11.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:10:32 -0800 (PST)
Message-ID: <92defeb3fdc1f1dac636671f44155e5b73246e79.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: rkvdec: Add support for the VDPU346 variant
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Olivier =?ISO-8859-1?Q?Cr=EAte?=	
 <olivier.crete@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Diederik de Haas <diederik@cknow-tech.com>, Dmitry
 Osipenko	 <dmitry.osipenko@collabora.com>, Thomas Gleixner
 <tglx@linutronix.de>,  Dragan Simic <dsimic@manjaro.org>, Chukun Pan
 <amadeus@jmu.edu.cn>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 24 Dec 2025 14:10:30 -0500
In-Reply-To: <20251206082809.2040679-4-christianshewitt@gmail.com>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
	 <20251206082809.2040679-4-christianshewitt@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yuB6wf+lr8PoWSyb/nWH"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-yuB6wf+lr8PoWSyb/nWH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 06 d=C3=A9cembre 2025 =C3=A0 08:28 +0000, Christian Hewitt a =C3=
=A9crit=C2=A0:
> VDPU346 is derived from VDPU381 but with a single core and limited
> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
> AVS2 capabilities. It is used with RK3566 and RK3568.
>=20
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>

Please resend whenever there is a dependency update, I believe some of the
variant stuff is being modified. Another note, I tried bigger resolution, b=
ut it
only yielded green images, so the 65K max does not actually work and will n=
eed
investigation.

Nicolas

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 110 +++++=
+++++++++++++
> =C2=A01 file changed, 110 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index a1c02ef3a97c..cf68454b2217 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -295,6 +295,62 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls =
=3D {
> =C2=A0	.num_ctrls =3D ARRAY_SIZE(rkvdec_h264_ctrl_descs),
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
> +		.cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +		.cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +		.cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
> +		.cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +		.cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +		.cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		.cfg.menu_skip_mask =3D
> +			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.dims =3D { 65 },
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.dims =3D { 65 },
> +	},
> +};
> +
> +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
> +	.ctrls =3D vdpu346_hevc_ctrl_descs,
> +	.num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
> +};
> +
> =C2=A0static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D =
{
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> @@ -449,6 +505,43 @@ static const struct rkvdec_coded_fmt_desc
> rkvdec_coded_fmts[] =3D {
> =C2=A0	}
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D=C2=A0 65520,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D=C2=A0 65520,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability =3D RKVDEC_CAPABILITY_H264,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D 65472,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D 65472,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &vdpu346_hevc_ctrls,
> +		.ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability =3D RKVDEC_CAPABILITY_HEVC,
> +	},
> +};
> +
> =C2=A0static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D =
{
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> @@ -1654,6 +1747,19 @@ static const struct rkvdec_variant
> rk3399_rkvdec_variant =3D {
> =C2=A0			RKVDEC_CAPABILITY_VP9,
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_variant rk3568_vdpu346_variant =3D {
> +	.coded_fmts =3D vdpu346_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
> +	.rcb_sizes =3D vdpu381_rcb_sizes,
> +	.num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.irq_handler =3D vdpu381_irq_handler,
> +	.colmv_size =3D rkvdec_colmv_size,
> +	.flatten_matrices =3D transpose_and_flatten_matrices,
> +	.named_regs =3D true,
> +	.capabilities =3D RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_HEVC,
> +};
> +
> =C2=A0static const struct rkvdec_variant rk3588_vdpu381_variant =3D {
> =C2=A0	.coded_fmts =3D vdpu381_coded_fmts,
> =C2=A0	.num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
> @@ -1693,6 +1799,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
> =C2=A0		.compatible =3D "rockchip,rk3399-vdec",
> =C2=A0		.data =3D &rk3399_rkvdec_variant,
> =C2=A0	},
> +	{
> +		.compatible =3D "rockchip,rk3568-vdec",
> +		.data =3D &rk3568_vdpu346_variant,
> +	},
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3588-vdec",
> =C2=A0		.data =3D &rk3588_vdpu381_variant,

--=-yuB6wf+lr8PoWSyb/nWH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw6pgAKCRDZQZRRKWBy
9D6EAP9ZsxXS8naP+lmNLuk413EqEubATIC4HWdxSsUsDyvFnwEAmvgTIoFdMMY9
p9YBQjcz5+pkXo+Btf5Dn1WHEJi/+w4=
=g1yd
-----END PGP SIGNATURE-----

--=-yuB6wf+lr8PoWSyb/nWH--

