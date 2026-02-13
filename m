Return-Path: <linux-media+bounces-52735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJIZDvkmj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:28:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7E13661F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6AC030480A3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979AD35FF4B;
	Fri, 13 Feb 2026 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OySRjeyY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4382F532F;
	Fri, 13 Feb 2026 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989293; cv=none; b=mdnXBhyJIzC4bPpn/qyb2DY/ooqGbmGzVOWi+Jwr7tCmsgNDkElbDOZW0dsgvTgI/LJApzeSDvromHJ+eBpKr5cNj3kE/qCnxulboodnQva9TjGPMXkofB48juBxXzgNfcEBC5qwQrRAP2DIo3LaEg6KzGdsfCvL2LfU8M1uV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989293; c=relaxed/simple;
	bh=eYw9v27HNDua0nGSV3/QQfMzqGsnIGkub0Z3yGizn84=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rP7c57TjJHaxE1SDam3NNjlWW/un09aIlcPVvq3oob3RuMm+EZ2EL0MbBh0KX4J9y9/ajatJfhCcVgGOPpP3BGxr/8Z00tzoY20M2h2QVusw9T55NVCzfDmt07gRwcJPXPpfJLeZzEwCegXC7knsti6Utmn3pfIx/CBeBco6vZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OySRjeyY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22590222;
	Fri, 13 Feb 2026 14:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770989233;
	bh=eYw9v27HNDua0nGSV3/QQfMzqGsnIGkub0Z3yGizn84=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OySRjeyYKqBFGzSD7UYJLu+FimktR2cnTrP0PiFKrRbShcBWRuVS3UsuyKjzx0a+q
	 LnKxvG38uoStVwAeyEcsQSCvUxrCRpWyC4caBTaGsmQqEQ+p1T3gELYhdgOqgMGBJk
	 8eTACGEdKl+LwtSbVLrYSwkjIihQ1GDJi/z/GCYA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250918132753.3154059-2-kieran.bingham@ideasonboard.com>
References: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com> <20250918132753.3154059-2-kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/3] media: i2c: imx283: Report correct V4L2_SEL_TGT_CROP
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
To: linux-media@vger.kernel.org
Date: Fri, 13 Feb 2026 13:27:58 +0000
Message-ID: <177098927882.3376561.17396287931444560000@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52735-lists,linux-media=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: 86C7E13661F
X-Rspamd-Action: no action

Quoting Kieran Bingham (2025-09-18 14:27:51)
> From: Stefan Klug <stefan.klug@ideasonboard.com>
>=20
> The target crop rectangle is initialized with the crop of the default
> sensor mode. This is incorrect when a different sensor mode gets
> selected. Fix that by updating the crop rectangle when changing the
> sensor mode.

This seems good to me and tests well.

It's arbitrary but perhaps we should add this:

Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Cc: stable@vger.kernel.org # v6.10-rc1-70-gccb4eb4496fa


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/imx283.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 67e8bb432d10..06c4b01868c0 100644
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
> --=20
> 2.50.1
>

