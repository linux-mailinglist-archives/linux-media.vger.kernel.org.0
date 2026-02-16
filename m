Return-Path: <linux-media+bounces-52890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE0SNUkyk2mI2QEAu9opvQ
	(envelope-from <linux-media+bounces-52890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:05:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5514509F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15EEC304C09E
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18815314A65;
	Mon, 16 Feb 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="umvHloVY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2531196F;
	Mon, 16 Feb 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254090; cv=none; b=QVO8g/eqR70d+pPxx36AfybA1MYQEOefKtzYcrJpn//r99lvHRiDGF6qxxl+35n8QziPH1wDpTg1J+4b7hwVE0IcprdcjqCpCQnLJSUz+TLPxT2/j5nfZ70W3TS752LwOmTxOA5AM4Yt/cjTGlZxZoWFDQ7JiGKvpl3Kd9B8umk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254090; c=relaxed/simple;
	bh=i5izrBdkPtWMbu4KYX0s06EKLPC9pwCp8yuNNGeEVbk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aHcTDbWHuD83xMpduAYZX0oxIiOnz3BhrCgrmLlOp24yf1aJU4lEeHSzqy41sV7QQ1mIQVklc5B19tUTKm1d0xZarDSEcWuZ84UMRIirDxiyU/JHdBijSsG4OM6g3DWW2B8Pb2UnHgH7RqCQ2q/fY2SQp66ikMtEdCfSB0WdWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=umvHloVY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D70CADA8;
	Mon, 16 Feb 2026 16:00:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771254037;
	bh=i5izrBdkPtWMbu4KYX0s06EKLPC9pwCp8yuNNGeEVbk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=umvHloVYzzGvLw8t8lhrNWV7IjG0j4DzdRJFHQeus0QRnuFyBqIHZHtBdrAreJwqA
	 NYAWxDVqm5WzlYjngXb9me6x3OXiNqY4gtzx5PNjTPCJnmbLh0/nGTfNhKBRtIZeSt
	 C9XgeEE2lKLoIgq76X7aMg6VjnIYyLSK8E+0kcZM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-14-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-14-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 14/25] media: i2c: imx283: Move minimum exposure handling to scan modes
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:31:22 +0530
Message-ID: <177125408274.14753.5220962974251843111@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52890-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 42E5514509F
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:53)
> The minimum exposure is a factor of the scan mode.
>=20
> Move the definitions of the minimum exposure timeto the scan mode
> structures and clean up the duplication from the v4l2 output mode
> definitions.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index d333be4e66d7..6c2be9195cba 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -286,6 +286,9 @@ struct imx283_scanout {
>         s16 vst;
>         u16 vct;
>         u16 veff;
> +
> +       /* minimum SHR */
> +       u32 min_shr;
>  };
> =20
>  static const struct imx283_scanout imx283_scan_modes[] =3D {
> @@ -298,6 +301,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D -1, /* Align to Mode 2/3 */
>                 .vct =3D 0,
>                 .veff =3D 3694,
> +               .min_shr =3D 11,
>         },
>         [IMX283_MODE_1] =3D {
>                 .bpp =3D 10,
> @@ -307,6 +311,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D -1, /* Align to Mode 2/3 */
>                 .vct =3D 0,
>                 .veff =3D 3694,
> +               .min_shr =3D 10,
>         },
>         [IMX283_MODE_1A] =3D {
>                 .bpp =3D 10,
> @@ -316,6 +321,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 146,
>                 .vct =3D 291,
>                 .veff =3D 3112,
> +               .min_shr =3D 10,
>         },
>         [IMX283_MODE_1S] =3D {
>                 .bpp =3D 10,
> @@ -325,6 +331,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 162,
>                 .vct =3D 324,
>                 .veff =3D 3046,
> +               .min_shr =3D 10,
>         },
> =20
>         /* Horizontal / Vertical 2/2-line binning */
> @@ -336,6 +343,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D -2, /* Provides alignment to Mode 0/1 */
>                 .vct =3D 0,
>                 .veff =3D 1824,
> +               .min_shr =3D 12,
>         },
>         [IMX283_MODE_2A] =3D {
>                 .bpp =3D 12,
> @@ -345,6 +353,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 71,
>                 .vct =3D 143,
>                 .veff =3D 1556,
> +               .min_shr =3D 12,
>         },
> =20
>         /* Horizontal / Vertical 3/3-line binning */
> @@ -356,6 +365,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 1, /* Provides alignment to Mode 0/1 */
>                 .vct =3D 0,
>                 .veff =3D 1234,
> +               .min_shr =3D 16,
>         },
> =20
>         /* Vertical 2/9 subsampling, horizontal 3 binning cropping */
> @@ -367,6 +377,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 9,
>                 .vct =3D 17,
>                 .veff =3D 378,
> +               .min_shr =3D 4,
>         },
> =20
>         /* Vertical 2/19 subsampling binning, horizontal 3 binning */
> @@ -378,6 +389,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 0,
>                 .vct =3D 0,
>                 .veff =3D 198,
> +               .min_shr =3D 4,
>         },
> =20
>         /* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
> @@ -389,6 +401,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .vst =3D 0,
>                 .vct =3D 0,
>                 .veff =3D 1556,
> +               .min_shr =3D 12,
>         },
> =20
>         /*
> @@ -435,9 +448,6 @@ struct imx283_mode {
>         /* default V-timing */
>         u32 default_vmax;
> =20
> -       /* minimum SHR */
> -       u32 min_shr;
> -
>         /* Analog crop rectangle. */
>         struct v4l2_rect crop;
>  };
> @@ -511,8 +521,6 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 .default_hmax =3D 6000, /* 900 @ 480MHz/72MHz */
>                 .default_vmax =3D 4000,
> =20
> -               .min_shr =3D 11,
> -
>                 .crop =3D imx283_recommended_area,
>         },
>         {
> @@ -529,8 +537,6 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 .default_hmax =3D 2500, /* 375 @ 480MHz/72Mhz */
>                 .default_vmax =3D 3840,
> =20
> -               .min_shr =3D 12,
> -
>                 .crop =3D imx283_recommended_area,
>         },
>         {
> @@ -547,8 +553,6 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 .default_hmax =3D 1900, /* 285 @ 480MHz/72Mhz */
>                 .default_vmax =3D 4200,
> =20
> -               .min_shr =3D 16,
> -
>                 .crop =3D imx283_recommended_area,
>         },
>  };
> @@ -566,8 +570,6 @@ static const struct imx283_mode supported_modes_10bit=
[] =3D {
>                 .default_hmax =3D 6000, /* 750 @ 576MHz / 72MHz */
>                 .default_vmax =3D 3840,
> =20
> -               .min_shr =3D 10,
> -
>                 .crop =3D imx283_recommended_area,
>         },
>  };
> @@ -726,7 +728,7 @@ static void imx283_exposure_limits(struct imx283 *imx=
283,
>                                    s64 *min_exposure, s64 *max_exposure)
>  {
>         u32 svr =3D 0; /* SVR feature is not currently supported */
> -       u64 min_shr =3D mode->min_shr;
> +       u64 min_shr =3D mode->scan->min_shr;
>         /* Global Shutter is not supported */
>         u64 max_shr =3D (svr + 1) * imx283->vmax - 4;
> =20
>=20
> --=20
> 2.52.0
>

