Return-Path: <linux-media+bounces-40252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9FB2C003
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 13:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4976D58723E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AF1326D62;
	Tue, 19 Aug 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EmwWewtP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22261322C78
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601996; cv=none; b=kN5ktCakWMk7HV8VHQ8u4BtvoOgCeEdejLGvs4GcgPZA9kAJc5emPD7I/NG9Jq4XnX4E32hR6QO1lcrOubvv77jD/UsR6oJ/Yre2Y6GUIoPmN2jhkw34o+d7KIfEPxLielkmrIEdApWLD7sn/a5ugWY8FbmMpGY8GnPBcPluzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601996; c=relaxed/simple;
	bh=eOGztn+XZImdmyNmzsHCKHpFegVOo+T0W3/lKZAl7/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agjlSHBsgKgDKDWjGsvE8T+JkdDSZgZYXDBQh1eIb0/wqku68YbxDc5ZGT+wc6L0/EL8qSgW+UPn35V9OWnJ+XRBJJFB9s6uvRSA0Iad2bePsGU8fmY4tquC5sbJO+HHcbZja24OKGxC6WwypbfIP4q0pBBzpDN43Ck9xlpfYB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EmwWewtP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9dc55d84bso3580928f8f.1
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755601991; x=1756206791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yJKKeK4Q7qCviwAaXshIe1r0nDBHVRyI+cfjeEzOt4=;
        b=EmwWewtPhBaopl1MsJ458kJB7K7y1LEb7x/jbrZNUgfrPmet/WGWNmk1Bo1mPOu9Nl
         0NINYeEzVkj/zdvjaEm+zUUFN8h4323BNkIpSA7geVgKKjbJ835kZ1gomk0T4Y7ci1rk
         8sKmWpGH0YA9ojwZI5yPO3JpoSqF6ZblKsD+oTu7cm61WUk+Pchkq34SwKP4uPvXk7EO
         iu59wwnEFZqf57nGVxKXTCWVIm+rWo+Ja1TIq17jWLCMFbriY7BUAlL5T9QzO7/sUva3
         n59aHMPVg84D7fysISEircSd3bD7n0b0ZogifVQz4HYKChZNWEfuxJKo6uO4ldoEhptB
         SCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601991; x=1756206791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yJKKeK4Q7qCviwAaXshIe1r0nDBHVRyI+cfjeEzOt4=;
        b=pFYjABkQK5QaYN/KJCpRqi6cFvTrvMXpm5LsJEBbVc0kG0rjRimbJXhuzqqswykq3T
         NKOFDXlNYCZcKQ4rA90HfdauuxWAnhYjUY2RZ9fQTLFRggsUrJyzvQcbkLLLpKfGREoV
         Iqs8Ty9WZ++il2zYov9uC9C+3Uk1JG9X8JnHIW6tvI3xVvhgqkIJSLMc2lZ1f3D44lal
         l8lyVRS5tzy8coi87c4ZmHYlQg5iqJXsi74YWUsv0usNVyo7UEDk1TdjTuJB8xg7U10C
         YpFtMLlfuGgB5PzRNLkcr0qX6wWaVxOZadaH4UGdRhygxqVDXgCcY/sdgSa6+26OI429
         IUng==
X-Forwarded-Encrypted: i=1; AJvYcCXg2giuc/YsBs3xFU414IUwNUBC9FqzG00xDn4SNJsHDn9FEnwwv7mEIdXwCJdTsEePAl8vT4HEQRnmqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJVRWhLwLwvu7xun9nyIEiyagrWxne5lMqSo+LxOPNOk+b6/Y
	8PbDoMsrJuXjG4NBM5pQWQn1b0NhwPZnW5MFTiTRSDyvMWTX5apUImvc+TYMZYWRjP8=
X-Gm-Gg: ASbGnctiGskJT4Uc2p7FhIczehD5k7fzIfkiaUt5Cc8JdlbaXwM+sUt0+p85X2Hqmw2
	oNFrjg+KJw+gkTw+cppTm8QucX79Xti+1gHhcYwnx6zHSeyc2CGbk7D8/gXiTVX7/u4qyYwQNUT
	RXO0jfV4qbMqLvWtWlPN8GTALBm2nN5yiGdG5RUbePQKC67BY++4h5q1VrT45WmUEvrvxkUbYmg
	/MChdZOTu5eXCQlTaieuauLmOVNrgNuyrhrZU8Ns8e/XkK5IdBK0Vc8xhGI4TTLox00TqKQcsMt
	uRons+AIca1L+p7Lzoey5FDMJQcu0Az4yZ5xCuiAxFQYRBThdh0EPSC+E+RDoWiCr+nqvMSD8Y1
	AKBlaRXshtN0t2uzBDKCnSRANjO/WDKa6tyaoS5ZylGimobq9fYGQ8G9MiRbNdid+
X-Google-Smtp-Source: AGHT+IFV92TWmjlNlyXfloSVnvn3OJ/hS/EMPsydq9z6s3SqLXLiBeEG9oimIjL9VVY0aN6qFW1z+g==
X-Received: by 2002:a05:6000:1889:b0:3c0:77a6:9cbe with SMTP id ffacd0b85a97d-3c0eae5913bmr1582101f8f.17.1755601991273;
        Tue, 19 Aug 2025 04:13:11 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074879fe5sm3274045f8f.2.2025.08.19.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:13:10 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:13:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, skomatineni@nvidia.com, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
Message-ID: <jodxtve3lnv4hc2f2cm25ckdj6ukfzsbqjzpxuyqwx2qmsw27w@emg722bix2a5>
References: <20250819092330.550046-1-zhao.xichao@vivo.com>
 <20250819122830.3d4874ed@booty>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmfywkuclechgpww"
Content-Disposition: inline
In-Reply-To: <20250819122830.3d4874ed@booty>


--hmfywkuclechgpww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
MIME-Version: 1.0

Hello,

On Tue, Aug 19, 2025 at 12:28:30PM +0200, Luca Ceresoli wrote:
> +Uwe, author of 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent
> for -ENOMEM").

The main purpose of that commit was to make dev_err_probe() silent if
the error code might be ENOMEM. If it's sensible to call dev_err_probe()
if you know that the error code is ENOMEM is subjective. On one hand
it's explicitly a noop then, but on the other hand it might serve as
code documentation and make it explicit that error messaging is
consistent.

There was also a recent discussion about:

	ret =3D devm_add_action(...)
	if (ret)
		return dev_err_probe(..., ret, ...);

which is a case of "ret can only be 0 or -ENOMEM", but that's harder to
spot than the patched code below.
	=09
> On Tue, 19 Aug 2025 17:23:30 +0800
> Xichao Zhao <zhao.xichao@vivo.com> wrote:
>=20
> > The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Theref=
ore,
> > remove the useless call to dev_err_probe(), and just return the value i=
nstead.
> >=20
> > Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index 7b8f8f810b35..ee65e89c119c 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -255,7 +255,7 @@ static int tegra20_channel_host1x_syncpt_init(struc=
t tegra_vi_channel *chan)
> > =20
> >  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MA=
NAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\=
n");
> > +		return -ENOMEM;
>=20
> Thanks for your patch!
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> About dev_err_probe(), I wonder whether it should mention the -ENOMEM
> exception in kerneldoc. Is it part of the API "contract" it provides?

In general you're not supposed to wail about -ENOMEM because such a
problem is already "loud". I claim it's fixed that dev_err_probe() is
silent for -ENOMEM. If you consider it helpful to add it to the
documentation, add it.

In this case I agree that dropping dev_err_probe() is sane. In the
devm_add_action() case above I tend to keep it.

Best regards
Uwe

--hmfywkuclechgpww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmikXEMACgkQj4D7WH0S
/k4o/wf/ZgEYIuiyBekysNHT7NkgK3JGmSZ0EBT1KwqWftvMxjmXXMUjFjvDgpCV
VgAyoDMHeP4LHDAyjCiYW9eiSHAvySvtNiwAPgfntErnVVVI2tCpw3M25m6EhJ+i
7RA1Need6625DeRuiFI5SpTRpS66U6uAdm68QKcfG3wFTlC7KxcRfi11Vx8VxQza
qllSXtWnSc4dc1YJjenC1nCn1uO9W61qIFU/5TYYKxL5EzG+dtl8cSDRMkzNl/mn
j74nqhcOYrob9rU2uEgLsNsISxUTcjbzvoCKSLNUx2tZiMBGJi1ral4kmsaJakx8
oLWB/IqoACKopCiO0AA8M7yusP4/Kg==
=PAjG
-----END PGP SIGNATURE-----

--hmfywkuclechgpww--

