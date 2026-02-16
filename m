Return-Path: <linux-media+bounces-52889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDKcGW0xk2k72gEAu9opvQ
	(envelope-from <linux-media+bounces-52889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:02:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F0144F93
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D20F73023338
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AD4313E2C;
	Mon, 16 Feb 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DFPs5Y6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DDF31328C;
	Mon, 16 Feb 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254041; cv=none; b=O2+S1HwwOxLBezK/wSMqJ/6JEZSz75O6zaFZU+qaB7vkWWq8DBsxNfgx0s1jI36W+IJwPdO33yqVboq/EBBTRMDPanEQMBTY8OqRGYiwu0UdOFT+8ylD+nwJgHlb+xH9UO6jCxXsQeVujpasIrSlecPZ8oUYzUIWYgFMnsYA9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254041; c=relaxed/simple;
	bh=1ovBbEYL9Fj/5cnTCQPkxgteH6HpvIVLPWskbFtLChU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TVg/SPMayBzNpazem5o4DKe/BGDEGMS+GKghzaSoAIwGae+MYGErKUX4sMG/y47ksicnNfWd6bTSXYDsAgHufUjgDLcJwwhuh0XKw8xlr4okON9MBgwumdzpAjrXu0F4L1mc6CA/VUirc3gFoHNQffrVSqbILAP6D6tY8NvUjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DFPs5Y6Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5866A4B3;
	Mon, 16 Feb 2026 15:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771253987;
	bh=1ovBbEYL9Fj/5cnTCQPkxgteH6HpvIVLPWskbFtLChU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DFPs5Y6Yd3iUpR6fghCdCu7sx7Yej9KKoJ2eC/ZTGyTYSovOHTLdVd/Rc4ZzHeuBY
	 Q7i4at/myq4cYM+1SdOdYyn0Mu//K9Yg0Ndl57KrQzjUtQDkZC8ka38YngRz8dkYKa
	 dscAyZbZqHcjLbEobiqT4CJqJOfg5ip+9GG8VpYw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-13-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-13-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 13/25] media: i2c: imx283: Move binning to scan modes
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:30:33 +0530
Message-ID: <177125403332.14753.1117745488213124443@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52889-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[kieran.bingham.ideasonboard.com:query timed out,jai.luthra.ideasonboard.com:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C2F0144F93
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:52)
> The binning factors are determined by the chosen scan mode.
>=20
> Move the definition of the binning ratio to the scan mode strutures
> and remove from the v4l2 output mode definitions. The horizontal
> binning ratio is not used and therefore is dropped.
>=20
> This also fixes the 10-bit mode handling which previously had an
> undefined vbin_ratio for MODE1.
>=20
> V4L2 does not currently expose an API to support the differences between
> binning and skipping, so while the mode capabilities are kept for the
> skipping modes - there is no definition to use them yet.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 315c050c4fd0..d333be4e66d7 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -279,6 +279,9 @@ struct imx283_scanout {
>         /* Optical Blanking */
>         u8 vertical_ob;
> =20
> +       /* vertical binning ratio */
> +       u8 vbin_ratio;
> +
>         /* Vertical Arbitrary Cropping Function */
>         s16 vst;
>         u16 vct;
> @@ -291,6 +294,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x04, 0x03, 0x10, 0x00 },
>                 .vertical_ob =3D 16,
> +               .vbin_ratio =3D 1,
>                 .vst =3D -1, /* Align to Mode 2/3 */
>                 .vct =3D 0,
>                 .veff =3D 3694,
> @@ -299,6 +303,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x04, 0x01, 0x00, 0x00 },
>                 .vertical_ob =3D 16,
> +               .vbin_ratio =3D 1,
>                 .vst =3D -1, /* Align to Mode 2/3 */
>                 .vct =3D 0,
>                 .veff =3D 3694,
> @@ -307,6 +312,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x04, 0x01, 0x20, 0x50 },
>                 .vertical_ob =3D 16,
> +               .vbin_ratio =3D 1,
>                 .vst =3D 146,
>                 .vct =3D 291,
>                 .veff =3D 3112,
> @@ -315,6 +321,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x04, 0x41, 0x20, 0x50 },
>                 .vertical_ob =3D 16,
> +               .vbin_ratio =3D 1,
>                 .vst =3D 162,
>                 .vct =3D 324,
>                 .veff =3D 3046,
> @@ -325,6 +332,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x0d, 0x11, 0x50, 0x00 },
>                 .vertical_ob =3D 4,
> +               .vbin_ratio =3D 2,
>                 .vst =3D -2, /* Provides alignment to Mode 0/1 */
>                 .vct =3D 0,
>                 .veff =3D 1824,
> @@ -333,6 +341,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x0d, 0x11, 0x70, 0x50 },
>                 .vertical_ob =3D 4,
> +               .vbin_ratio =3D 2,
>                 .vst =3D 71,
>                 .vct =3D 143,
>                 .veff =3D 1556,
> @@ -343,6 +352,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x1e, 0x18, 0x10, 0x00 },
>                 .vertical_ob =3D 4,
> +               .vbin_ratio =3D 3,
>                 .vst =3D 1, /* Provides alignment to Mode 0/1 */
>                 .vct =3D 0,
>                 .veff =3D 1234,
> @@ -353,6 +363,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x29, 0x18, 0x30, 0x50 },
>                 .vertical_ob =3D 4,
> +               .vbin_ratio =3D 1, /* SUBSAMPLING UNDEFINED */
>                 .vst =3D 9,
>                 .vct =3D 17,
>                 .veff =3D 378,
> @@ -363,6 +374,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x2d, 0x18, 0x10, 0x00 },
>                 .vertical_ob =3D 4,
> +               .vbin_ratio =3D 1, /* SUBSAMPLING UNDEFINED */
>                 .vst =3D 0,
>                 .vct =3D 0,
>                 .veff =3D 198,
> @@ -373,6 +385,7 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x18, 0x21, 0x00, 0x09 },
>                 .vertical_ob =3D 4,
> +               .vbin_ratio =3D 2, /* SUBSAMPLING UNDEFINED */
>                 .vst =3D 0,
>                 .vct =3D 0,
>                 .veff =3D 1556,
> @@ -425,10 +438,6 @@ struct imx283_mode {
>         /* minimum SHR */
>         u32 min_shr;
> =20
> -       /* Horizontal and vertical binning ratio */
> -       u8 hbin_ratio;
> -       u8 vbin_ratio;
> -
>         /* Analog crop rectangle. */
>         struct v4l2_rect crop;
>  };
> @@ -498,9 +507,6 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 .min_hmax =3D 5914, /* 887 @ 480MHz/72MHz */
>                 .min_vmax =3D 3793, /* Lines */
> =20
> -               .hbin_ratio =3D 1,
> -               .vbin_ratio =3D 1,
> -
>                 /* 20.00 FPS */
>                 .default_hmax =3D 6000, /* 900 @ 480MHz/72MHz */
>                 .default_vmax =3D 4000,
> @@ -523,9 +529,6 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 .default_hmax =3D 2500, /* 375 @ 480MHz/72Mhz */
>                 .default_vmax =3D 3840,
> =20
> -               .hbin_ratio =3D 2,
> -               .vbin_ratio =3D 2,
> -
>                 .min_shr =3D 12,
> =20
>                 .crop =3D imx283_recommended_area,
> @@ -544,9 +547,6 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 .default_hmax =3D 1900, /* 285 @ 480MHz/72Mhz */
>                 .default_vmax =3D 4200,
> =20
> -               .hbin_ratio =3D 3,
> -               .vbin_ratio =3D 3,
> -
>                 .min_shr =3D 16,
> =20
>                 .crop =3D imx283_recommended_area,
> @@ -1141,7 +1141,7 @@ static int imx283_start_streaming(struct imx283 *im=
x283,
> =20
>         /* Vertical Configuration */
>         {
> -               u32 y_out_size =3D mode->crop.height / mode->vbin_ratio;
> +               u32 y_out_size =3D mode->crop.height / mode->scan->vbin_r=
atio;
>                 u32 write_v_size =3D y_out_size + mode->scan->vertical_ob;
>                 s16 top =3D mode->crop.top;
>                 u32 v_widcut;
> @@ -1154,7 +1154,7 @@ static int imx283_start_streaming(struct imx283 *im=
x283,
>                  * cropping start position =3D (VWINPOS =E2=80=93 Vst) =
=C3=97 2
>                  * cropping width =3D Veff =E2=80=93 (VWIDCUT =E2=80=93 V=
ct) =C3=97 2
>                  */
> -               v_pos =3D (top / mode->vbin_ratio / 2) + mode->scan->vst;
> +               v_pos =3D (top / mode->scan->vbin_ratio / 2) + mode->scan=
->vst;
>                 v_widcut =3D ((mode->scan->veff - y_out_size) / 2) + mode=
->scan->vct;
> =20
>                 cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size,=
 &ret);
>=20
> --=20
> 2.52.0
>

