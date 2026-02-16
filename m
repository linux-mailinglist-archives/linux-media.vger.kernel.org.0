Return-Path: <linux-media+bounces-52887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJmrOLgvk2ke2QEAu9opvQ
	(envelope-from <linux-media+bounces-52887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:54:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A676144DEB
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4759301BEE0
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12E231355F;
	Mon, 16 Feb 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oz2RaM1k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8422F01;
	Mon, 16 Feb 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253677; cv=none; b=hzeQFLeqC+G+2Pa7gHEUokyTxBgx2/tvqzbP+HyagEX1aWT6TA4VdDed2tKPruee8gL9PNAYxC9SgXYpFgsoCRupQTjmxf9L4aBSFRjrbqiWVDKB5PeaBiBYE6yax6orlCRbZJaercGuCsOUCunIolTkHyMktHiaQ8+ewJBdOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253677; c=relaxed/simple;
	bh=8y7XBWXyVOHJpwRai/kgC+fpfY1KuVrSbLGJavy0WaI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AFEDSCajnS1RNt339NMaYFp0j0OyQ5rwlgDQ9rY0pou5uVo/FcI39TMg03wHYT0wugy+jpl59hXnyXf1+ZqlTA1PRoc0+fisJoOH3gmYs9nTulLWLeXZ9seSCl568liR2OEn6YZ2kXLiitrp251m/agW7IyLXQj4eq+WH3vuvAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Oz2RaM1k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2064E4B3;
	Mon, 16 Feb 2026 15:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771253624;
	bh=8y7XBWXyVOHJpwRai/kgC+fpfY1KuVrSbLGJavy0WaI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Oz2RaM1kFj3iUprgKz1EiBksYIe24Sh4u9GeIvtvzv6BBqfRfBsHW2ovN3+doc3kV
	 0UclpK/eOfiNgEW/CLfYa/vPMe8KOL0rgFLAwjgdg4NxNJ+kukWodJUOKDdOxvQExF
	 BoBf452OT9tIJ6xZGyjTukgAgmpUuWKNjT5ZenJw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-11-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-11-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 11/25] media: i2c: imx283: Constrain scope of vertical calculations
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:24:30 +0530
Message-ID: <177125367053.14753.2883519618784269745@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52887-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A676144DEB
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:50)
> Reduce the scope of the 5 registers used for vertical positioning to
> make it easier to maintain and calculate the exact vertical
> configuration.
>=20
> No functional changes intended in this patch, which simplifies
> later development.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 6d551a26cfa6..f115a6df7b31 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1092,10 +1092,7 @@ static int imx283_start_streaming(struct imx283 *i=
mx283,
>         const struct v4l2_mbus_framefmt *fmt;
>         const struct imx283_mode *mode_list;
>         unsigned int num_modes;
> -       u32 v_widcut;
> -       s32 v_pos;
> -       u32 write_v_size;
> -       u32 y_out_size;
> +
>         int ret =3D 0;
> =20
>         fmt =3D v4l2_subdev_state_get_format(state, 0);
> @@ -1142,23 +1139,29 @@ static int imx283_start_streaming(struct imx283 *=
imx283,
>                 mode->crop.width,
>                 mode->crop.height);
> =20
> -       y_out_size =3D mode->crop.height / mode->vbin_ratio;
> -       write_v_size =3D y_out_size + mode->scan->vertical_ob;
> -       /*
> -        * cropping start position =3D (VWINPOS =E2=80=93 Vst) =C3=97 2
> -        * cropping width =3D Veff =E2=80=93 (VWIDCUT =E2=80=93 Vct) =C3=
=97 2
> -        */
> -       v_pos =3D imx283->vflip->val ?
> -               ((-mode->crop.top / mode->vbin_ratio) / 2) + mode->scan->=
vst :
> -               ((mode->crop.top / mode->vbin_ratio) / 2)  + mode->scan->=
vst;
> -       v_widcut =3D ((mode->scan->veff - y_out_size) / 2) + mode->scan->=
vct;
> +       /* Vertical Configuration */
> +       {
> +               u32 y_out_size =3D mode->crop.height / mode->vbin_ratio;
> +               u32 write_v_size =3D y_out_size + mode->scan->vertical_ob;
> +               u32 v_widcut;
> +               s32 v_pos;
> =20
> -       cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);
> -       cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_size, &ret=
);
> -       cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret);
> -       cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
> +               /*
> +                * cropping start position =3D (VWINPOS =E2=80=93 Vst) =
=C3=97 2
> +                * cropping width =3D Veff =E2=80=93 (VWIDCUT =E2=80=93 V=
ct) =C3=97 2
> +                */
> +               v_pos =3D imx283->vflip->val ?
> +                       ((-mode->crop.top / mode->vbin_ratio) / 2) + mode=
->scan->vst :
> +                       ((mode->crop.top / mode->vbin_ratio) / 2)  + mode=
->scan->vst;
> +               v_widcut =3D ((mode->scan->veff - y_out_size) / 2) + mode=
->scan->vct;
> =20
> -       cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical=
_ob, &ret);
> +               cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size,=
 &ret);
> +               cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_si=
ze, &ret);
> +               cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret=
);
> +               cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
> +
> +               cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->=
vertical_ob, &ret);
> +       }
> =20
>         /* Horizontal Configuration */
>         {
>=20
> --=20
> 2.52.0
>

