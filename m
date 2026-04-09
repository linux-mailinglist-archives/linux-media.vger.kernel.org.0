Return-Path: <linux-media+bounces-58326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFWdDkSp12noQwgAu9opvQ
	(envelope-from <linux-media+bounces-58326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:27:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C13CB297
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EE1230DB096
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3F29B200;
	Thu,  9 Apr 2026 13:15:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A43BED06;
	Thu,  9 Apr 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740536; cv=none; b=kt4gqVxAm5h0O4thQDR+XDkAL7yyvueP29l5/TybqyBnDUo/Cdu4fEYdk7UdxXVv45M9gkktjFXo0GMz5ZG7x3XbQ7GUKNBD7aWjSMmTjwGomO8P89zdwClnYXWSzB9cA8QzeYsuXAHpEjwMvT97I21WUKJ5vBCBslOH03MjSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740536; c=relaxed/simple;
	bh=HJWnzi27ry2ObbnjBv6NIgkwK3MnHYQz5ZtHwRq5L2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLNT9HhwmVDqOdDbrkAo+jCU6o9cnXwGCaUBQ3avXN2o/RLrAtU9hPtXWVSPh9xTMir20XwtFBuEC17XuwcdTW1k0GSZBHsTlumMCa+RGONcLkGHH52cpvD3XriaFZMjwdKNQeDQs8A31nkybNBTaTDh3DjbCgpqq/vbUERCv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id EEBFA1F8005C;
	Thu,  9 Apr 2026 13:15:26 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2489EB401A8; Thu,  9 Apr 2026 13:15:25 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E753AB401A1;
	Thu,  9 Apr 2026 13:15:23 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:15:21 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: cedrus: Fix missing cleanup in error path
Message-ID: <ademaXe-zmEbGIUV@shepard>
References: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Z+h4H++cTowfJsu"
Content-Disposition: inline
In-Reply-To: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58326-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9A5C13CB297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5Z+h4H++cTowfJsu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 07 Apr 26, 01:14, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
>=20
> According to the documentation struct v4l2_fh has to be cleaned up with
> v4l2_fh_exit() before being freed. [1]
> Currently there is no actual bug here, when v4l2_fh_exit() isn't called.
> v4l2_fh_exit() in this case only destroys internal mutex. But it may
> change in the future, when v4l2_fh_init/v4l2_fh_exit will be enhanced.
>=20
> 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Good catch too, thanks!

Acked-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> ---
>=20
> Changes in v2:
>  - remove duplicate 'in-body' From: record
>  - add details to commit message
>=20
> drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff0e2..1d2130f35fffc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
>  err_m2m_release:
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  err_free:
> +	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
>  	mutex_unlock(&dev->dev_mutex);
> =20
> --=20
> 2.51.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--5Z+h4H++cTowfJsu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXpmkACgkQhP3B6o/u
lQw6rQ/+JRyqAd6MzQ2xrzJl5ar/9l2WWPAtTawNPXkANjhkbbfG/+oxmwNk2QB2
PgJhtyvcwS+EyRCKZic7gjTTf670J9Iz9FhAW0XiZH4nmFpUSg42t9fUfbzAj1zo
anINhb1wgbSt0OJ+7u9nuF4q4KinRHlCVuqEWq3QX078b7oItJ3RY1j0MNUVVD9A
b3590HJ7XQ3fhT7bqwy4AGl4RPt3fA5UGn2J2fKfSQC/FAFcLmBBz0wfOwmNAAqC
mfAydT+ZI8zQnwb28PZw6PEx0SQnuBUm/NLWjl179DUgxyDR7F6VXjY2jmBZtLNG
Fzw8r6GyYeqCdaBt7mcT2vbIzCUMzV9u5iwQB+4bRHXiF3L8gbHJTtAvqVgL+tZt
qnj52uV8q3pdiQosqwR3bTxt8NT/wsbZbiMpBsjqe/UjHVuofjIxzqAHNexRBl2f
zRD7GV/EwnbNltbP1lu+fgZBRcJRz2t1jkvjwpZ7n/Ec66cyDXotMQ6mAy8ugSjV
MgURkiFhNrU8SPC3jpFB3ff9XpyDg3uPEEqtUd5IrXSbEfmQcag7t2GpLpGyW6lf
DEJqgz+CvDUknsCbqazLyfxt4yVyxkCe0bJw0tHIyLom1Muf8qFqR9okAq03VDD6
ikr5rF81u8+Y6vmVTaEYlWlgK1AOaSBP19JOPh32oEIdhb7DtAg=
=aZU3
-----END PGP SIGNATURE-----

--5Z+h4H++cTowfJsu--

