Return-Path: <linux-media+bounces-52881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCvIFrUsk2mZ2AEAu9opvQ
	(envelope-from <linux-media+bounces-52881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:41:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CD0144C3F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66490301F9B0
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EAC3126A8;
	Mon, 16 Feb 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M97+2pkO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C46223708;
	Mon, 16 Feb 2026 14:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252884; cv=none; b=nw09jie8WNhq1ycDmuLXHxsYyvAfeo3mvrIf1x6v3kXHgcVRqdoqxXuagc5uNo1YZA0kzmXLZ6MYrym7Bdil4xE2Lv8taDIOHKvRx15TyRHwpslKm6he8ne3YBo1mpd2HyVU6tCxAWwOsv0Td0tZbjhqROwevXUUYwakNLaRQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252884; c=relaxed/simple;
	bh=V85sgEywKF5QmjogrsC3iUnyGh4n5fDclDwas6LeGVs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aXydUanX1NMtEsVrdHkwBXUN3m4AAdyd7mxf3TTjx5KHwyABSYltBlq1/HDqrvjZ5meqA88iqJOY+W6jN5d9BiGeREusb+3/SbolJMAF2FDHepni8eEj8k8aSjIZ3Yl92MCQVwWD9O5DRJReW3LbvDE/9L5K6qppgxOf+KPx3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M97+2pkO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBCFD4B3;
	Mon, 16 Feb 2026 15:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771252831;
	bh=V85sgEywKF5QmjogrsC3iUnyGh4n5fDclDwas6LeGVs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M97+2pkOsHfnN1rQp2mBoJ3VjKTb/BW2KtIpfF2t450LOFjq3yR3cy5fYrJ4jj+67
	 uo+G368rc0tz52F7QgbXFr6xDuuoWO1adLP/hdjIShj8lm4p3hMljr1IGJCtUmFr9a
	 oS92aRpnvQBON+QFYFbYn2sKiiFb4URVotYLFKN4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-2-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-2-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 02/25] media: i2c: imx283: Fix handling of unsupported mbus codes
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>, stable@vger.kernel.org
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:11:16 +0530
Message-ID: <177125287682.14753.1272283722821288828@freya>
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
	TAGGED_FROM(0.00)[bounces-52881-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: B3CD0144C3F
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:41)
> From: Stefan Klug <stefan.klug@ideasonboard.com>
>=20
> When the code requested by imx283_set_pad_format() is not supported, a
> kernel exception occurs due to dereferencing the mode variable which is
> null. Fix that by correcting the code to a valid value before getting
> the mode table.
>=20
> While at it, remove the cases for the other unsupported codes in
> get_mode_table.
>=20
> Cc: stable@vger.kernel.org # v6.10-rc1-70-gccb4eb4496fa
> Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>=20

> ---
>  drivers/media/i2c/imx283.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index e5c04d259625..9a47cd0b181a 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -576,23 +576,31 @@ static inline struct imx283 *to_imx283(struct v4l2_=
subdev *sd)
>         return container_of_const(sd, struct imx283, sd);
>  }
> =20
> +static inline int get_format_code(unsigned int code)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx283_mbus_codes); i++)
> +               if (imx283_mbus_codes[i] =3D=3D code)
> +                       break;
> +
> +       if (i >=3D ARRAY_SIZE(imx283_mbus_codes))
> +               i =3D 0;
> +
> +       return imx283_mbus_codes[i];
> +}
> +
>  static inline void get_mode_table(unsigned int code,
>                                   const struct imx283_mode **mode_list,
>                                   unsigned int *num_modes)
>  {
>         switch (code) {
>         case MEDIA_BUS_FMT_SRGGB12_1X12:
> -       case MEDIA_BUS_FMT_SGRBG12_1X12:
> -       case MEDIA_BUS_FMT_SGBRG12_1X12:
> -       case MEDIA_BUS_FMT_SBGGR12_1X12:
>                 *mode_list =3D supported_modes_12bit;
>                 *num_modes =3D ARRAY_SIZE(supported_modes_12bit);
>                 break;
> =20
>         case MEDIA_BUS_FMT_SRGGB10_1X10:
> -       case MEDIA_BUS_FMT_SGRBG10_1X10:
> -       case MEDIA_BUS_FMT_SGBRG10_1X10:
> -       case MEDIA_BUS_FMT_SBGGR10_1X10:
>                 *mode_list =3D supported_modes_10bit;
>                 *num_modes =3D ARRAY_SIZE(supported_modes_10bit);
>                 break;
> @@ -963,6 +971,8 @@ static int imx283_set_pad_format(struct v4l2_subdev *=
sd,
>         const struct imx283_mode *mode_list;
>         unsigned int num_modes;
> =20
> +       fmt->format.code =3D get_format_code(fmt->format.code);
> +
>         get_mode_table(fmt->format.code, &mode_list, &num_modes);
> =20
>         mode =3D v4l2_find_nearest_size(mode_list, num_modes, width, heig=
ht,
> @@ -1361,8 +1371,6 @@ static int imx283_init_controls(struct imx283 *imx2=
83)
> =20
>         imx283->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops, =
V4L2_CID_VFLIP,
>                                           0, 1, 1, 0);
> -       if (imx283->vflip)
> -               imx283->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> =20
>         v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx283_ctrl_ops,
>                                      V4L2_CID_TEST_PATTERN,
>=20
> --=20
> 2.52.0
>

