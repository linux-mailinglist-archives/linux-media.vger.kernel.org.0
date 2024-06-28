Return-Path: <linux-media+bounces-14352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594391C270
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 17:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1E12855E9
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB341CB31E;
	Fri, 28 Jun 2024 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCIIJnZc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3D81C6892;
	Fri, 28 Jun 2024 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587799; cv=none; b=RaKnqfZ5xVhzL16NO2ICvOLWsmAx/0BC4WC3NA2wGYjQucBmJ+Ths5y+cI4dJDCMphFFRX4wyNk9opI3v7LuArh2SuUljRsuprRsgSE8NoaUHPgpi0nZeAUyFKByyJikiIvnQk8OATMqZelx9ZwOw4rEpxMvzgDIfq9w16Rkfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587799; c=relaxed/simple;
	bh=WSRJmQMAFlO38fu2tQjRbK/jmk96MXJAwdDbjhekZZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbtNBYMV/Isn1Wig01YGW9yglNyGt8brppQHWPjBwk7xutez3znTdIdQRGPgtMMwKCM7/VAtSHbh6YZaDpiSBJkU++gyenpj9xUKTMKsGZ8Ttx2qAcKGZyFdvIADKcqJw5TAje89HpeKQJz2tWjX6YoXKkrIcHeMSlvfnhV+0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCIIJnZc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36743abace4so1195803f8f.1;
        Fri, 28 Jun 2024 08:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587796; x=1720192596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i9bG41lpTys++LmQ1GCNQOV3ahso6A8Qax/7yjOjJis=;
        b=NCIIJnZcbpyNjfv4M5dlQM9G3Fv7WKFhH7oW80vdYH9EDudbuLsHZUr/i3Zl2z8NwV
         RVlZB8U0yHGgUdjMslt1PeZmn+zFTLVhWz+Aiv9szO2ADWe3ffElsD0jH3Hlly270bHu
         UDzkymqa4iz6S0XZCzm+x/+F+n1Js4235yFBov3KTvjF1RdNhyLAp4ohAF8DYgW75pvO
         FIFRwVxDsPKjeLF6UA6VcCn8MfyRDVqqimw/KT6ZGr+wenbrfBxR3QUYlLiS1WoRpV+X
         gwdJGEE/KjIDTNUV6vwkgpnECFsAo9mUNYPsxbzCP+aU1GrWcqtIx9Ci3ZI3oZX1d9vm
         uI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587796; x=1720192596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9bG41lpTys++LmQ1GCNQOV3ahso6A8Qax/7yjOjJis=;
        b=u/eBZZxyTURNtrsRN0xBZ7kFdHWbNZUtANwwAuqMWrxKWwru4qlVy6gufXM8shWJ4a
         uz2MjKXXQvJL6b5h5cnrCqHBqTKilGr8z0BgSNjilX7Yv09cf0iHrXCucL2Vycyy6IzH
         ykgGHNvwo2MXmK0WyH1dfRteVsmdEP+rSdyB7Dugh4i/3S6d65ylQbyGNtnrG3J5K605
         7in2SorqNmIbc+/0DkqMgQsYq/vxxFDOCwDrEjknOAVP7UIaeKPctYQnjycaOg7Nka5g
         w9CgDJWc9aUN/tymc8rqDfi3ogXZLqmwDB8Ei6qkObB8ZixK7G2ieYKny0nU4xHXtK9H
         whaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuBZTcVJ4wRlSTz0IiJxVhf6gSV3MUjQ54cB5WXxxCCKxq2hSDkAJP3gFBpiHriSw9HakJ31LCOqQuPSV3J+v1fr7Qz1fxdYoelAhpN5y1r/z3tK4+1HdzVGheXH8lwxhy0xPG57XlQg==
X-Gm-Message-State: AOJu0YyWCKrk6/yfg3tVKt9LaUnSwmbNgt0dIfefljAyW2sYsJOqO43G
	pvMfxp7F3K9HMiHjbsfHbxKwGJHtIYd3Hy3XZRjS1l9g5/nM/KPu
X-Google-Smtp-Source: AGHT+IHIyEQqfdOhxQwHaLxnbtr2uDrsmL0XJxTidzhg4n/BFvFU9RaBcpCPekdGKZg0jtrv8uazIw==
X-Received: by 2002:a05:6000:4598:b0:366:df58:1fd9 with SMTP id ffacd0b85a97d-36760aa37fdmr1531065f8f.24.1719587795584;
        Fri, 28 Jun 2024 08:16:35 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10337csm2578971f8f.97.2024.06.28.08.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:16:34 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:16:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 7/8] media: tegra-vde: use 'time_left' variable with
 wait_for_completion_interruptible_timeout()
Message-ID: <5h63pricryzzm45kq6eshtvqzkvko7kc6eq446c2jyqcl5z4zn@it6dx4ouvcvj>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
 <20240603092841.9500-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hxdxmddpampxcv6d"
Content-Disposition: inline
In-Reply-To: <20240603092841.9500-8-wsa+renesas@sang-engineering.com>


--hxdxmddpampxcv6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 11:28:38AM GMT, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeo=
ut' to
> store the result of wait_for_completion_interruptible_timeout() causing p=
atterns like:
>=20
> 	timeout =3D wait_for_completion_interruptible_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
>=20
> with all kinds of permutations. Use 'time_left' as a variable to make the=
 code
> self explaining.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/h264.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--hxdxmddpampxcv6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+09EACgkQ3SOs138+
s6GZyhAAlyOJe6Lpf/9/gOOuoytVcou1CIjEOqwWMoGBOSunqnLVTHwIVuBgW6/8
DpTHlzxW3lNHD9A82wU9LKEyGHpNynt+1eAbHbo2GsZs0Phjc8IpdeX/wfxaYVWE
qoaKFpXVf/fReo/dSw1pcCDajP5BoNlL5X1bsZC1JY1B5ssTXUru1+/XmNaR5mRD
4fCi3lbIosn67wuHBn4PnJ+gzDb1uydKadG9zScsVBEj4B6RQEzVN1wah2GNQw3p
bcGZM1j0gVNmFPGdytiQtGd2cFtyWalIGqBHsBM859kKjvY77ExSNFgqTKzp/oDO
y7PXT98BzhGUctr7TWNhC3uGIOW/n6o/vpISw65etPexkVP/rBaIsQKgZaXzKK1c
xbIicYhjyFWDSDrsJ+p24V+egk47DFh9gIaRaKgyxn8xrw1knbv6TTRHq3sIwBHe
pvGodLjKGHAz4EJQyd3DEXkCMjhl8WcC/q1egUqP294tXcc2en0NIJKGzrxiAeY2
0BKXzQFDOHmHjZIUfh4ZazeoDNBI4nR1xCiscAGDTobD6gWPGSC22HxK1IaJQVfY
gTHXFaHzA+yY3WAb25O4MFFXxFGMsJOMQ6P6uw9rCZuBSjFvyQmrFsOxq3nuhr7M
TKu7y0KjsT5fvFIlfau5/7FtqWEvOnIlkoXLxlsnnVNf+Z3M1rw=
=gs8y
-----END PGP SIGNATURE-----

--hxdxmddpampxcv6d--

