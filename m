Return-Path: <linux-media+bounces-52885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKM2IWovk2ke2QEAu9opvQ
	(envelope-from <linux-media+bounces-52885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:53:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F72144D83
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96B30303A6D8
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26A531328C;
	Mon, 16 Feb 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rmpUhFXj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D508E313272;
	Mon, 16 Feb 2026 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253558; cv=none; b=jZeikBcpBsEkSMU26qGTc2kl6YSJ5ZWC7k2daG6WsTcS86y6T0qVMKnBganAuL9AI+iHBM+TXqu+Cq8nIOOh9VUoigKxDD4vZhjp063SUqJP+7xozH49didD/rfBg2bZU4wvcTrwI2Xue+t/s1I/0qO+0j8otxP5DGdPuzMudiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253558; c=relaxed/simple;
	bh=plH22ctq7dB73RvWr7pMoH91rhNBqGBN1WmyQ3w5Oww=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Zxd55q5zVhvOc8D3GMS0yVzXK9qbgim2ioQbghWSrIKCGtQ5Wfrbz2Z94WRRQO3h8dhCOLhcdBbWnRTBLfagpI9lBRiKSBC6Y444ntd1/x/L+RwfI4REpvitQLjhXl/0TMRzqf8RO2ddvTL8lKBWVLRlxA/SaEo2qhTytHf7HzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rmpUhFXj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E98D74B3;
	Mon, 16 Feb 2026 15:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771253504;
	bh=plH22ctq7dB73RvWr7pMoH91rhNBqGBN1WmyQ3w5Oww=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rmpUhFXjhjNL0j0CepmybtNqvQMoWIXhRWnc854ZwcymMhnQRifZ0fYKMVaQ9st/u
	 OA+fRqWbPgLkOWCL6B/kqfCXJUPyF7IOIXAYlc7QafJY87bVBLcPdKHcz0sdOnkfaA
	 N7nqDnmrqNzdIUwc9X4IJXmLaL/JQkxLgzPq9ysU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-7-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-7-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 07/25] media: i2c: imx283: Factor out vertical cropping parameters
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:22:29 +0530
Message-ID: <177125354965.14753.16165547191912910862@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52885-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: E0F72144D83
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:46)
> The vertical cropping parameters are specific to the readout mode
> selected and do not need to be duplicated on v4l2 mode choices.
>=20
> Move them to the imx283_scanout definitions. This also fixes the 10bit
> mode which had not yet defined the veff correctly and worked by chance.

On Pi5 I see that 10bit mode is broken (black output) both before and after
this patch.

Testing 10bit output after applying the whole series, I at least don't get
a fully black frame, but I still get a frame with top 80% is bright but
garbled, and bottom 20% is black, so most probably an early line end signal
somewhere.

>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

In any case, for this patch:

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 61 +++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 38 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 164e7c6125ae..0abfeeb89425 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -270,6 +270,11 @@ struct imx283_scanout {
> =20
>         /* Optical Blanking */
>         u8 vertical_ob;
> +
> +       /* Vertical Arbitrary Cropping Function */
> +       u16 vst;
> +       u16 vct;
> +       u16 veff;
>  };
> =20
>  static const struct imx283_scanout imx283_scan_modes[] =3D {
> @@ -278,21 +283,33 @@ static const struct imx283_scanout imx283_scan_mode=
s[] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x04, 0x03, 0x10, 0x00 },
>                 .vertical_ob =3D 16,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +               .veff =3D 3694,
>         },
>         [IMX283_MODE_1] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x04, 0x01, 0x00, 0x00 },
>                 .vertical_ob =3D 16,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +               .veff =3D 3694,
>         },
>         [IMX283_MODE_1A] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x04, 0x01, 0x20, 0x50 },
>                 .vertical_ob =3D 16,
> +               .vst =3D 146,
> +               .vct =3D 291,
> +               .veff =3D 3112,
>         },
>         [IMX283_MODE_1S] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x04, 0x41, 0x20, 0x50 },
>                 .vertical_ob =3D 16,
> +               .vst =3D 162,
> +               .vct =3D 324,
> +               .veff =3D 3046,
>         },
> =20
>         /* Horizontal / Vertical 2/2-line binning */
> @@ -300,11 +317,17 @@ static const struct imx283_scanout imx283_scan_mode=
s[] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x0d, 0x11, 0x50, 0x00 },
>                 .vertical_ob =3D 4,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +               .veff =3D 1824,
>         },
>         [IMX283_MODE_2A] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x0d, 0x11, 0x70, 0x50 },
>                 .vertical_ob =3D 4,
> +               .vst =3D 71,
> +               .vct =3D 143,
> +               .veff =3D 1556,
>         },
> =20
>         /* Horizontal / Vertical 3/3-line binning */
> @@ -312,6 +335,9 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x1e, 0x18, 0x10, 0x00 },
>                 .vertical_ob =3D 4,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +               .veff =3D 1234,
>         },
> =20
>         /* Vertical 2/9 subsampling, horizontal 3 binning cropping */
> @@ -319,6 +345,9 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x29, 0x18, 0x30, 0x50 },
>                 .vertical_ob =3D 4,
> +               .vst =3D 9,
> +               .vct =3D 17,
> +               .veff =3D 378,
>         },
> =20
>         /* Vertical 2/19 subsampling binning, horizontal 3 binning */
> @@ -326,6 +355,9 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 12,
>                 .readout =3D { 0x2d, 0x18, 0x10, 0x00 },
>                 .vertical_ob =3D 4,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +               .veff =3D 198,
>         },
> =20
>         /* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
> @@ -333,6 +365,9 @@ static const struct imx283_scanout imx283_scan_modes[=
] =3D {
>                 .bpp =3D 10,
>                 .readout =3D { 0x18, 0x21, 0x00, 0x09 },
>                 .vertical_ob =3D 4,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +               .veff =3D 1556,
>         },
> =20
>         /*
> @@ -382,14 +417,6 @@ struct imx283_mode {
>         /* minimum SHR */
>         u32 min_shr;
> =20
> -       /*
> -        * Per-mode vertical crop constants used to calculate values
> -        * of IMX283REG_WIDCUT and IMX283_REG_VWINPOS.
> -        */
> -       u32 veff;
> -       u32 vst;
> -       u32 vct;
> -
>         /* Horizontal and vertical binning ratio */
>         u8 hbin_ratio;
>         u8 vbin_ratio;
> @@ -463,10 +490,6 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
>                 .min_hmax =3D 5914, /* 887 @ 480MHz/72MHz */
>                 .min_vmax =3D 3793, /* Lines */
> =20
> -               .veff =3D 3694,
> -               .vst =3D 0,
> -               .vct =3D 0,
> -
>                 .hbin_ratio =3D 1,
>                 .vbin_ratio =3D 1,
> =20
> @@ -496,10 +519,6 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
>                 .default_hmax =3D 2500, /* 375 @ 480MHz/72Mhz */
>                 .default_vmax =3D 3840,
> =20
> -               .veff =3D 1824,
> -               .vst =3D 0,
> -               .vct =3D 0,
> -
>                 .hbin_ratio =3D 2,
>                 .vbin_ratio =3D 2,
> =20
> @@ -526,10 +545,6 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
>                 .default_hmax =3D 1900, /* 285 @ 480MHz/72Mhz */
>                 .default_vmax =3D 4200,
> =20
> -               .veff =3D 1234,
> -               .vst =3D 0,
> -               .vct =3D 0,
> -
>                 .hbin_ratio =3D 3,
>                 .vbin_ratio =3D 3,
> =20
> @@ -1144,9 +1159,9 @@ static int imx283_start_streaming(struct imx283 *im=
x283,
>          * cropping width =3D Veff =E2=80=93 (VWIDCUT =E2=80=93 Vct) =C3=
=97 2
>          */
>         v_pos =3D imx283->vflip->val ?
> -               ((-mode->crop.top / mode->vbin_ratio) / 2) + mode->vst :
> -               ((mode->crop.top / mode->vbin_ratio) / 2)  + mode->vst;
> -       v_widcut =3D ((mode->veff - y_out_size) / 2) + mode->vct;
> +               ((-mode->crop.top / mode->vbin_ratio) / 2) + mode->scan->=
vst :
> +               ((mode->crop.top / mode->vbin_ratio) / 2)  + mode->scan->=
vst;
> +       v_widcut =3D ((mode->scan->veff - y_out_size) / 2) + mode->scan->=
vct;
> =20
>         cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);
>         cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_size, &ret=
);
>=20
> --=20
> 2.52.0
>

