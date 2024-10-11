Return-Path: <linux-media+bounces-19475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AE99AE43
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 23:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF701F22B24
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 21:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80D71D1F50;
	Fri, 11 Oct 2024 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VnpQZBfd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878331D174F
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728683179; cv=none; b=F9OT4VcTcePqpw2xIKMX5x/qpRllL+nRJyugRKtxFnlzHXe5o6f9/N/JIStO2GqV8ee0pNIGbEZOPqikEnidWXmaGG+y8OFTrdmDBDPAjNBLIK5t3rSln/cHP/Bb519KpcDJLRgJtK7w3+5vFks684yzoia83IIt/jHvS7LYQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728683179; c=relaxed/simple;
	bh=7LipFZSSP1A4HekPYhO5ED/zfKXvS9Q5aHhRMPLupWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0vjVss5QqJ8k+XXtzY7rNwP9QqKnTu7EEpESIgOk0rFwcShKK7KxKkYqgjuKDWPXJrVp16uline7v9A6tP26XwgJnalpjK8b3IaEHOTTaor6RGQq/XMRXYNAr5QKfzv/WUtma1PSfwiZ5SKyFRz8vTBn0y5jXhjqmhuY/JmkrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VnpQZBfd; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398b589032so4133049e87.1
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728683173; x=1729287973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7LipFZSSP1A4HekPYhO5ED/zfKXvS9Q5aHhRMPLupWI=;
        b=VnpQZBfdYI53N1icVtzOooWJJYuXGflPT4+8Si5elKDoH+2B9Ul17atimRE39E3RXQ
         r2ISe7g/UxgfiGb+OSz0HxwfiHd0Anh1JWho9U0c9rsle+FntV8Tbrw77iH9tVm+uXo2
         Zo6LquIv4UZVFiiXgevYbpDyYMI8kmi9fzSTQMD6vpWqfxl8+f/8mKwIo1gBVP2C0v0q
         K0VHjHpKi06+9hoUJXIsgCXKC9WwyQF6I+lI90IYqi22OcpcngLX4lvU+TZNgjKchHLy
         YRCvA443mEq7elel9PdMcnR6GxOHbBvwtEAuhA5tih82VvWJCQwduo7H+BpziuKytWsQ
         em8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728683173; x=1729287973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LipFZSSP1A4HekPYhO5ED/zfKXvS9Q5aHhRMPLupWI=;
        b=AyAEDO9H/9k/UlvMf58KPbXvJWz2Ngv+ean3lG1/JMtv6jKR8i3/J50wsPK4FfnF9O
         FKKqvkyewWQjqsNavpVcmEZAaiyxeFqFXp2AdEemVHljg2qKvIOeU0MLSYyvoQNDopf5
         RCXxjAcGshdv9yP8rg7wuQB1wsYLGvpCU5+H8Y3BF/jxW2dA91RGD0XMaUkAM9pp5MLc
         wSbOaFXkim5EFmeJxoMhgk1C6xhtf6YqwNpaj9JbJpHfOqlUGQ9XqEDLV7Awq+puB+ic
         8OSpS/jeNxZk8X1S9+Ife/dxkRnqMj2ezSBb2x1lC041Km62JBXD0hsnFI8BeOZsiUmP
         /r5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5McUYjbiySYDRoe2Un1klMaW+GE67Uk4hHXhMro1ZlUpvngcIdF5JMA+CdoyFd+qZiA9FkFannW0oAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQfIA7HImLpsEgWXtHytA7r++Fqj06wMmKJi9vISPb4cqv7Q4
	0e2KEw50HMGOGBCawe55YRFz+CvTHjpMo6Zc6F2d714AAEZacN9NX3GrlE1JBz8=
X-Google-Smtp-Source: AGHT+IGVM2TG+HOhlrOFFnNHSE/mhcMsJ2lxfliGNd/+NilQIDLR9TUVsI8Yc5YydiTcMV93MR6pxg==
X-Received: by 2002:a05:6512:12c7:b0:539:947e:18a6 with SMTP id 2adb3069b0e04-539e571ce25mr479695e87.47.1728683172437;
        Fri, 11 Oct 2024 14:46:12 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5bea:757f:d71b:2501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5cebdsm255629666b.93.2024.10.11.14.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 14:46:11 -0700 (PDT)
Date: Fri, 11 Oct 2024 23:46:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: Switch back to struct
 platform_driver::remove()
Message-ID: <m5ezhgxp5kwup65cieicws5fviwdapqmwm6ldiojic53pgs5tj@iu5u4wf74fzk>
References: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
 <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6j7f5lqnyzxrx46e"
Content-Disposition: inline
In-Reply-To: <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com>


--6j7f5lqnyzxrx46e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] staging: media: Switch back to struct
 platform_driver::remove()
MIME-Version: 1.0

Hello Sergio,

On Fri, Oct 11, 2024 at 09:39:09AM +0200, Sergio Paracuellos wrote:
> On Fri, Oct 11, 2024 at 9:09=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >
> > Convert all platform drivers below drivers/staging/media/ to use
> > .remove(), with the eventual goal to drop struct
> > platform_driver::remove_new(). As .remove() and .remove_new() have the
> > same prototypes, conversion is done by just changing the structure
> > member name in the driver initializer.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>=20
> I sent a patch the other day to convert all staging drivers to use
> remove which was applied yesterday.
>=20
> See: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/c=
ommit/?h=3Dstaging-next&id=3Dc1a5060ec80020ce879fa5b2a16875bd9a5ab930

If you really must grab this quest from me, please coordinate, or at
least Cc: me on your patches.

Uwe

--6j7f5lqnyzxrx46e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcJnJ4ACgkQj4D7WH0S
/k49Uwf+LrZMR9SYVsbl/YHY2WCj3oTc/G5d/Pxtt5jEjTkQnbyowL4KYRlXgcKJ
yRtSpF9nuIGRqrzPjZJm2jdDkNLmw21rwGvYryePDVeI4CcJQHdyUJ8Tqcb3s2pT
ZVPAZp9j7EjuJbmDJeQE+d+MiOOtKIujCtKNWiDfW1orHl2vcG1POjlVRXpR0EEV
oC+NCbY8RKx00gYpX/H6wxybcO7DdMxqmkWOhRUF2DvFrhfHxmqRSggnj9zZZ/kh
LRE9FGbxB0DHzkuxgwrS4lwlBEa/5WspzpmipXYb407Kkc0RrT132TqD3Suylc3R
F27mRtuPAmB9Ot9aJY2j0AtRtejn1Q==
=beLi
-----END PGP SIGNATURE-----

--6j7f5lqnyzxrx46e--

