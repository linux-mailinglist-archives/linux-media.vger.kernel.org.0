Return-Path: <linux-media+bounces-52736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL8FFBonj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:28:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF813662E
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 267B13038D07
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DF0360720;
	Fri, 13 Feb 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="anPBJPSy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAAE354AE2;
	Fri, 13 Feb 2026 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989334; cv=none; b=ovdjIbStSh7+Uuv2/WhOuwfvDNClLQlA+oaO1OIhml79j8mEv+hptEUXIcL6zYuwG5NgWoesbDKgTVCDc0v9jKJUriAZYfw7z3aFtoECyZ+cUnFp0yKJZt3+20HRtDjqYrtF5wxoZ80qkuDCCd1BEqEnVr+zt6oBzInvvbmcR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989334; c=relaxed/simple;
	bh=WFE67R5rot3IubmK1N1uz3brDaov1A1NI3xZVKVfKUw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NwGEjfTRJLLC3LGAKf41jrEiBfx1sQvOH4yX37zPTSg+nsEjrYGjcUgvIpI36c+f4c+SauoxNmSenxQIRNyR3DRvaEl9iWCmjk+KXoX+PaqpXV9uXH1eztro2hfMTiwl4xwKOPzqpuD7/JaszIVwj8r4ebDwJqdOMWW07R2feKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=anPBJPSy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79330324;
	Fri, 13 Feb 2026 14:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770989282;
	bh=WFE67R5rot3IubmK1N1uz3brDaov1A1NI3xZVKVfKUw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=anPBJPSyrJMMKiBfCFDAb9OZaxgaSuHV27b598dzZVKS3OoRiyiBJVNYOlNY6BhHO
	 ipCuwiKpVVrU5rEh13UL73QR+FFQyUPiUJ7zomzklGnYRersHQIj0+8w68B8PRilLJ
	 K1Co8Fd03hfkckZZV3emFaHSueYOwsCUenak0BqY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250918132753.3154059-4-kieran.bingham@ideasonboard.com>
References: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com> <20250918132753.3154059-4-kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: i2c: imx283: Fix handling of unsupported mbus codes
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <umang.jain@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
To: linux-media@vger.kernel.org
Date: Fri, 13 Feb 2026 13:28:48 +0000
Message-ID: <177098932853.3376561.14183734160222218483@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52736-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: B9BF813662E
X-Rspamd-Action: no action

Quoting Kieran Bingham (2025-09-18 14:27:53)
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

Here too, this fixes the original submission:

Cc: stable@vger.kernel.org # v6.10-rc1-70-gccb4eb4496fa
Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/imx283.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 582975ac849f..48a92bc8e6f1 100644
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
> @@ -973,6 +981,8 @@ static int imx283_set_pad_format(struct v4l2_subdev *=
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
> @@ -1371,8 +1381,6 @@ static int imx283_init_controls(struct imx283 *imx2=
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
> --=20
> 2.50.1
>

