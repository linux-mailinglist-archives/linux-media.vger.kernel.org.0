Return-Path: <linux-media+bounces-24471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C1A0676C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 22:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71593A6B99
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 21:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60C3202F71;
	Wed,  8 Jan 2025 21:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="sRqcOyYx"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614F1A08CA;
	Wed,  8 Jan 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736372827; cv=none; b=pNo5h9UbT9ilxWGHnIfLIGqoqhZQsUiF4XkACH8sP+J5An7rVVkRV3euky8nOQ8bUaX/GIPsxStxBjKpp+uUcs1nEjAKZftW3ywTmKqX4jeC7C6Fz7NoIGvMhyHIAyQ29l3deRCIW7SqkSySERM9eur/e4qbUsMOt6SyjkJogKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736372827; c=relaxed/simple;
	bh=r6TPsiFF9469TCcU3lNiHDvfYSv19Wi3PmkcVGVqjG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tk6IW2TsB9fkVBmySfhgoCstGPdJNsPT75NSqKf5qRS79yQcvvWggsgBM02V77WJcWEuDy3Xn0V/8zyPOF57sNSsllUGnbcN+IPavL8tdnj7maJbgsjzMk+k3AqxGWPvmXBbqcA0quckAJq7N1ymUpOOAaWE8VhxkwPl8mMyT9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=sRqcOyYx; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=r3rUZgXCoX0ABltQexniZOiDWtUMtA6NHy3vAUGQcUw=; b=sRqcOyYx3gTB+Qqt3k/9cU1VEX
	2yQB7USOYKLEXd+bOWzAboesFyicENH5ZFhvBt71w/7r3afJE+EEG00Hyzcywwi9apdZA8PJjgZ6r
	0QAaqlSBY535KBTjk/MNGJQtdb75eN+duYNr/Y4eri6XPNDx9QH6Svo2VBah7SIh1X5/7iKFxM05K
	T4xSmXik13lvX2OXlMDzPehuoKq2waTTZ5KaL8Wpkjab+l+0iNx1eb+3SsOp/086k0l1cu03K2oWx
	LVRpgj7HXzNktsX9b+WAAKWGQ61Y/4mQeiYxBwEAHTqin7qW7nPAl8KdVASu3lZh5zM5Be9yvAjeD
	jnTW3Mxg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tVdt6-000Bot-36;
	Wed, 08 Jan 2025 22:46:53 +0100
Received: from [77.64.252.250] (helo=framework.lan)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tVdt6-0006hV-2D;
	Wed, 08 Jan 2025 22:46:52 +0100
Message-ID: <97f7de9efc16f01b29f98dc888329db33715275c.camel@apitzsch.eu>
Subject: Re: [PATCH v6 12/13] media: i2c: imx214: Fix clock handling on
 probe error or remove
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  Vincent Knecht
 <vincent.knecht@mailoo.org>, Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 08 Jan 2025 22:46:51 +0100
In-Reply-To: <Z35mt_ViYmrJLKZb@kekkonen.localdomain>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
	 <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>
	 <Z35mt_ViYmrJLKZb@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27512/Wed Jan  8 10:41:20 2025)

Hi Sakari,

Am Mittwoch, dem 08.01.2025 um 11:51 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> Thanks for the update.
>=20
> On Fri, Dec 20, 2024 at 02:26:11PM +0100, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > The driver should disable or unprepare the clock on probe error and
> > on
> > removing the module.
> >=20
> > Remove regulator_bulk_disable(), because it is called by
> > imx214_power_off().
> >=20
> > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>=20
> This and the next one appear to be bugfixes. I think it'd be
> reasonable to backport them. Any idea where this got broken, for the
> Fixes: tag?
> The bug fixed by the last patch was probably introduced with the
> driver?
>=20

I think both, the missing imx214_power_off() and the wrong link
frequency where introduced with
> 436190596241 ("media: imx214: Add imx214 camera sensor driver")

The first one could also be considered as a fix for the incomplete
> 9bc92332cc3f ("media: imx214: Fix the error handling in imx214_probe()")

Shall I submit a new version with the Fixes: tag?

Regards,
Andr=C3=A9

> > ---
> > =C2=A0drivers/media/i2c/imx214.c | 4 +++-
> > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/i2c/imx214.c
> > b/drivers/media/i2c/imx214.c
> > index
> > 96d05acfeb66480770bb6291027dd023fdccb649..e8d35f8b0f8b57d64f03ff6f5
> > ed9eac51a671e8e 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -1340,7 +1340,7 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0	v4l2_ctrl_handler_free(&imx214->ctrls);
> > =C2=A0error_power_off:
> > =C2=A0	pm_runtime_disable(imx214->dev);
> > -	regulator_bulk_disable(IMX214_NUM_SUPPLIES, imx214-
> > >supplies);
> > +	imx214_power_off(dev);
> > =C2=A0
> > =C2=A0	return ret;
> > =C2=A0}
> > @@ -1356,6 +1356,8 @@ static void imx214_remove(struct i2c_client
> > *client)
> > =C2=A0	v4l2_ctrl_handler_free(&imx214->ctrls);
> > =C2=A0
> > =C2=A0	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		imx214_power_off(&client->dev);
> > =C2=A0	pm_runtime_set_suspended(&client->dev);
> > =C2=A0}
> > =C2=A0
> >=20
>=20


