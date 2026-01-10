Return-Path: <linux-media+bounces-50343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4824DD0DB5F
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A36823029572
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888991DF97C;
	Sat, 10 Jan 2026 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="fxLw6WmC"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EE500948;
	Sat, 10 Jan 2026 19:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073748; cv=none; b=Iqiuwu28PEPQ44K5bqpYh8zla1pTVX3Pg+42GnG09j5YapjwHVXAJGzAU2K5Y21iOgZn5O7jl4x8Li9llqlfcaQfmzglfUJRDAXf5/oe0U+HJwWKd+tO4J7t7GDchxKys+E85wkrlJ73nVSAO09bvBFDmE+/RdbFzAXW7YGbXRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073748; c=relaxed/simple;
	bh=BouuCuF49YicOQAMmeVM4mcbxurlxIPZZs4gzyYPhxs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LXNcLPf11WRNqxLLSj+NuyCYfJHJKiOU4/JLXmwyguQ/aemkyWYsbdwxdjWNzFDAmfGWOyGCLztF1RKxqDV2uRVLlURSCvb0hyhWOCCBZFYBZ05FWjrebJA1Lc/MKc+PnJQndIx3RUQYCffKGv+BnSd0Kba2zvz1e+um/c7CIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=fxLw6WmC; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768073742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYRmxOMkxzng4TMKTpoi3lSayf/NyY8ahAeAqOwq/3Q=;
	b=fxLw6WmCoewuA/NmZizqtsuK2ZU49/df/OHEUiOiX6DS8PzOCAax5HvdogS/qo82H1nCIm
	hYFIADCxjtguJY1oe2w941M0KkhzfmFvwlydh3o5fBEyXxy3pDghAK98WPsUG/EaDpQOJ2
	i2hIrLqvnMYRs5MnVd33JqiZZQKvLH5WNNoSqXdJEWv0EaU0KmNOIbXydf33+1blEzliIg
	B4q0NmMlVHKC0MxGJw3rsNZO7wtHtZ/ZKt0rsOE7bVBOCxZg/8Mu2VyMs/5HqVaupezTSu
	zfqA737e8YP5MxZLG3xPycrIi7+JS32jEUUkeanaVsFvTH5METUHKrhutKYDaA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 20:35:37 +0100
Message-Id: <DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Dang Huynh"
 <dang.huynh@mainlining.org>
Subject: Re: [PATCH v3 2/3] media: rkvdec: Add support for the VDPU346
 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Christian Hewitt" <christianshewitt@gmail.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, =?utf-8?q?Olivier_Cr=C3=AAte?=
 <olivier.crete@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Dragan Simic" <dsimic@manjaro.org>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
 <20260110053727.2295260-3-christianshewitt@gmail.com>
In-Reply-To: <20260110053727.2295260-3-christianshewitt@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Christian,

On Sat Jan 10, 2026 at 6:37 AM CET, Christian Hewitt wrote:
> VDPU346 is similar to VDPU381 but with a single core and limited
> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
> AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Dang Huynh <dang.huynh@mainlining.org> # Pinetab2
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index a5cf6f3240f8..6e49b129d11f 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls =
=3D {
>  	.num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>  };
> =20
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
>  static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
>  	{
>  		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc rk3288_cod=
ed_fmts[] =3D {
>  	}
>  };
> =20
> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D 4096,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D 2304,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &vdpu346_hevc_ctrls,
> +		.ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D  4096,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D  2304,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
>  static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>  	{
>  		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> @@ -1657,6 +1748,14 @@ static const struct rkvdec_variant_ops vdpu381_var=
iant_ops =3D {
>  	.flatten_matrices =3D transpose_and_flatten_matrices,
>  };
> =20
> +static const struct rkvdec_variant vdpu346_variant =3D {
> +	.coded_fmts =3D vdpu346_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
> +	.rcb_sizes =3D vdpu381_rcb_sizes,

AFAICT this is not correct, the rcb_sizes are different for vdpu346 vs
vdpu381. While for vdpu381 the sizes are the same across codecs, they
vary for vdpu346. And vdpu346 does not have 'STRMD Row', 'Transd Row'
and 'Transd col'.

For RK3588/vdpu381 it is defined in RK3588 TRM V1.0 Part1 in
paragraph 5.4.4.3 in 'Table 5-13 Row or Col buffer size required' on
page 381.

For RK3568/vdpu346 is is defines in RK3568 TRM V1.1 Part2 in
paragraph 10.4.8 in 'Table 10-9 Row or Col buffer size required' on page
474 and 475.

Cheers,
  Diederik

> +	.num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.ops =3D &vdpu381_variant_ops,
> +};
> +
>  static const struct rkvdec_variant vdpu381_variant =3D {
>  	.coded_fmts =3D vdpu381_coded_fmts,
>  	.num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
> @@ -1705,6 +1804,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
>  		.compatible =3D "rockchip,rk3399-vdec",
>  		.data =3D &rk3399_rkvdec_variant,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3568-vdec",
> +		.data =3D &vdpu346_variant,
> +	},
>  	{
>  		.compatible =3D "rockchip,rk3588-vdec",
>  		.data =3D &vdpu381_variant,


