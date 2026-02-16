Return-Path: <linux-media+bounces-52880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDWSL1wsk2mZ2AEAu9opvQ
	(envelope-from <linux-media+bounces-52880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:40:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58C144C19
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A3230209FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523BD31197B;
	Mon, 16 Feb 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f9zauxWB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D037F2066DE;
	Mon, 16 Feb 2026 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252814; cv=none; b=a/wiUlMNoPgM73ryAa8UlO7wgJZOw+Mn3kvwiXdFKMFMkLQqqb9D8eOhQCLk5Ff85/jiXKnOerypRWJkeFofRgXCHRAaOL1NCO65DVOhjjuEwDVstLUVr5x9J6QaYT4PQhuyYH0H81ly5aLbox1vSt1CCKx+MSfsBmzkRHYQUAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252814; c=relaxed/simple;
	bh=PPD5qFqP6lh6kRJaYA/2EEJC1OAlpD0UD8DSfL6ftSo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QJdtWOSJG5wMUx/UjajAjk4BBcmr3/RdT3/roa4Jk/Tyi7QZuFZEV5x6AC9cynzWBYZIoFDLZqRtxa7pcMoz+tixZvBQKNpxWysHa0D7JKytOJulzPRNdCCq4p4VLBHmk01MzoEhixPZD0FCbmKLUvMhO/jstCCxSOz2GygpM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f9zauxWB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AEC14B3;
	Mon, 16 Feb 2026 15:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771252753;
	bh=PPD5qFqP6lh6kRJaYA/2EEJC1OAlpD0UD8DSfL6ftSo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f9zauxWBeZjoKRlWREyigfCu9r58KxhcG0wAzm39hfhqt4mcWNS/9YDLLAYWipcEV
	 3STgyWqA0d6cXxtw7AdPck2cDbuT5kAco8m03dHFHtMZi8IjcpsML/J/3v9J1TICib
	 PbzO5MrG9sP9oDeicqbc+GpmFnnb/MLN4cFeeERM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-1-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-1-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 01/25] media: i2c: imx283: Report correct V4L2_SEL_TGT_CROP
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>, stable@vger.kernel.org
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:09:59 +0530
Message-ID: <177125279980.14753.13990598198179653991@freya>
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
	TAGGED_FROM(0.00)[bounces-52880-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C58C144C19
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:40)
> From: Stefan Klug <stefan.klug@ideasonboard.com>
>=20
> The target crop rectangle is initialized with the crop of the default
> sensor mode. This is incorrect when a different sensor mode gets
> selected. Fix that by updating the crop rectangle when changing the
> sensor mode.
>=20
> Cc: stable@vger.kernel.org # v6.10-rc1-70-gccb4eb4496fa
> Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>=20

> ---
>  drivers/media/i2c/imx283.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 8ab63ad8f385..e5c04d259625 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -956,6 +956,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *=
sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_format *fmt)
>  {
> +       struct v4l2_rect *crop;
>         struct v4l2_mbus_framefmt *format;
>         const struct imx283_mode *mode;
>         struct imx283 *imx283 =3D to_imx283(sd);
> @@ -982,6 +983,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *=
sd,
> =20
>         *format =3D fmt->format;
> =20
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
> +       *crop =3D mode->crop;
> +
>         return 0;
>  }
> =20
>=20
> --=20
> 2.52.0
>

