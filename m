Return-Path: <linux-media+bounces-52149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL3/JG+ZgmnnWgMAu9opvQ
	(envelope-from <linux-media+bounces-52149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 01:57:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C85E026C
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 01:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A4E1300E1A2
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 00:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025E523184F;
	Wed,  4 Feb 2026 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W6r7Bpn1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE040225A3B;
	Wed,  4 Feb 2026 00:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166625; cv=none; b=HXodxf5SKiPd2R9QJLRtMi95BknlMW/R0PRZ6qUveY0gHgC0+e2HBpyzzAcXJG2MRgjskR6Ffyg9Yxra4WirE8/Cy4n23Ww6ChIhUrNaBRIcrtXs/uxM4AAaZz65Sf2aN5k8DwJDekKU4yq1L8zYYUQxLxw4engqDniHfNUqp5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166625; c=relaxed/simple;
	bh=drOnD0JD8RHTG/kUNglbyxii+gJ+ZyzNpfojFI7bEPc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ge4ZTbonch69ttTvVSdNQJQlVqk8p2sMum71SR4racPyOHB/RVEDhUj9wMGLZJi4slu9avp/b4niC+r0CWwvgxjheZhDUKgkdG4rQUP28gaCfxGmRdtmustsrgSaO4Jm48iGvi4CzZuPOQUwE6F6+1L2sVTjBa2YexmEJj8sNCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W6r7Bpn1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:86fa:bf02:d5f1:808c:8622])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0111F3A4;
	Wed,  4 Feb 2026 01:56:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770166580;
	bh=drOnD0JD8RHTG/kUNglbyxii+gJ+ZyzNpfojFI7bEPc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W6r7Bpn1ro/ijjgb8S3Np7d+OvzjjDa7h/vrJ7EM+zClxTBXbCRBN82Ui3aP1qQYm
	 YjS/2LUS4XlumBbNbIoitd6udAmUyJ5S8e94xg9l6Kawz+lnKRJ+JEmnhgaTBgZ7gk
	 ySV6gNNQxEGacC3pb2Oy6dILoSI2iIdn7Yy263Hc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260202024024.3911367-1-nichen@iscas.ac.cn>
References: <20260202024024.3911367-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] media: i2c: imx219: Check return value of devm_gpiod_get_optional() in imx219_probe()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>, stable@kernel.org
To: Chen Ni <nichen@iscas.ac.cn>, dave.stevenson@raspberrypi.com, mchehab@kernel.org, sakari.ailus@linux.intel.com
Date: Wed, 04 Feb 2026 06:26:56 +0530
Message-ID: <177016661698.9154.10184896089971298930@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52149-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,ideasonboard.com:email,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2C85E026C
X-Rspamd-Action: no action

Quoting Chen Ni (2026-02-02 08:10:24)
> The devm_gpiod_get_optional() function may return an error pointer
> (ERR_PTR) in case of a genuine failure during GPIO acquisition,
> not just NULL which indicates the legitimate absence of an optional
> GPIO.
>=20
> Add an IS_ERR() check after the function call to catch such errors and
> propagate them to the probe function, ensuring the driver fails to load
> safely rather than proceeding with an invalid pointer.

Good catch, maybe a fixes tag is appropriate so this gets backported to
stable kernels.

Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")

with that,

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/i2c/imx219.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index fee63bc106d9..7da02ce5da15 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1218,6 +1218,9 @@ static int imx219_probe(struct i2c_client *client)
>         /* Request optional enable pin */
>         imx219->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
>                                                      GPIOD_OUT_HIGH);
> +       if (IS_ERR(imx219->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
> +                                    "failed to get reset gpio\n");
> =20
>         /*
>          * The sensor must be powered for imx219_identify_module()
> --=20
> 2.25.1
>=20
>

