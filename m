Return-Path: <linux-media+bounces-47094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDB0C5DA22
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 81CF6364180
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDD132572A;
	Fri, 14 Nov 2025 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDYd9ug6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F532548B
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130442; cv=none; b=kEFvGpy8PLn/BiwO8VhzUjaLNPcs0Z7rjkVwLrpg/GSrIzOPaFOxZEpeUjAbHBTwEQAbv1YXCHwR4vTFg0afsavw19wHoqjxKUCQkxs9VjiGZz1R1LwZrchsq1hRKrRsK/rR9c7aZW0W4ELZCA4KH5KxX5OqL3P5NX8hVw9agwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130442; c=relaxed/simple;
	bh=5YadEI0vAiA2mEfESwPx+1xN4MdYsxduC+f1QiMr750=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPp07HyGoWEYO4oUuqEgsYc7lSkRmEbM0Hwi1cpvSwOT8lqgwbdj6/pc/X/j0x8O7YJOgK7WPKfO2WS5lo1O8f6yS3UpxDNHxdi7abwrNtoRarj2kg4EUIC3rSSc7KiVAtQGQKFVpWKccpJ7Nmr+SBioKdMD3uAwtU6Qjk5UGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDYd9ug6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae77516so22879815e9.1
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763130438; x=1763735238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tnB0ie2DHEok31H5zr0rYmlZz2VTfGbw8J6v6s/PiNA=;
        b=PDYd9ug6IIa3gkMdJfC2cUcw3Ldrtln4EaLKA0VNvJNtSI0hNoWg75S5PHK5Z5yHN/
         LU8wNluydCuGhdrkTUXdTHWeZ69nl+yLHPha3t95EsflGtthjoLAtmIkEXci4xBqIlaH
         Fi+mCnOgE2b2WMCi2z7SkhCMIdzd1RDn3xylZ+oUJe3dvbonlfTJ9AGr+czg51gK+ABn
         D89OxhP3NUKdPJwxtWM8BzSgRBxKUqsuZgiPyTHML+RvULfJ2h9nwtEmHB4Bm0SgsDEi
         s0M+H8ycwTzbpwwqb5D1ZmqXtQoebXMD7u3+uWkthcKrxm6VbXjtZ3HJ4b+KQClxwIJr
         e2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130438; x=1763735238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnB0ie2DHEok31H5zr0rYmlZz2VTfGbw8J6v6s/PiNA=;
        b=ht9BL4kEjQ6r31teg/WDbuZs6M4V4zWCTFfsIPbSaekTK+43LXtZVi0dUS1+YFao3+
         SgYE0aPF37dt7GDfJFMasuyJCUn2lkQiTtyNVQq5UTuGbPh3IxNy6F3s9Kk+kpSowI/4
         AcT3UHLrvECQ8VJC+2KEOBuk59+jDvMFSuRul9BJN+W64kihpGzM+id5hqEPmAoIf71F
         a4frLxVmv41TJorvo9Nw8aYBLOuhiIQFUbBrfOJeoC8jyOQjdR5OltyxvJnI+hDbEcF5
         gbpaBdz5BwxXHSUwdjr3pglzHCHsn3zPy1YoTkc1bs4ziKfcVLgKAV2ozhxwyPCMP6I/
         EWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2UVbxJIvnVqykX3VKqjC88oDHa3nq45KcepalJ33QqxDVAHlCv8wXazNQORdQuOG4NdnWvvk3bwSIWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLaUVPXnuLD7pAMgesEhVdKAm+sdHYKMo62ityG8HsOfUhG94+
	bxKEmfCvRufdveYkuhDH+9Oy6dbNLbZyh3RYbqxF/OA0CPz/wnrc/5lA
X-Gm-Gg: ASbGncttHyDlUYNgx2WOTygK+No3mRpXaWYa6WHFsldt64dshcex32+/Bs11hypxQFg
	lVJ5oOng0QLu9w0LJ+IxVBaTIf/q96bMGmwIuv2ZsdHEjV5ztYzcfgFVNnQOO+9y9a4oTflR6XX
	OUN0eNlHAAMdXNkw7DdD+xfSgV8VmNTmJdoate2rds6PvQYeAo5Mlkiqf2TWtMzLhGlTD0T1bMR
	FfTXJPwAI4puYnjaWWkIuhu7zg2k75AXn3HP8ueSnt135Nz5gMVMcaN5r3f3OLBIMhMgA3KXEPe
	lNhw7L3IjK9OgN8una/PlmoNUpMtmGxAJv0VpYLfwjEQg915R5JHcIVbQWxm4dL5nZrXp3UagW3
	0D8PNlkBtURO54FSMrvoEZ/8FA2pqb9RHYSDhpzQROrVv6f+sZZrT98jiUe6mZOGM/3v7H5T3I5
	guuc4pMPx4miFu5OUG98MAXzkx8uky64sVKQl4vIwFML+rSVQMlkbOGhI1uhh7ZbQ=
X-Google-Smtp-Source: AGHT+IExtl9I947o9yThdytltbG+dOzwR8t1R13RAWRujiBz1gy/fzjdorcNXbxrlghQJ5oA52AS3g==
X-Received: by 2002:a05:600c:3586:b0:477:7b16:5f87 with SMTP id 5b1f17b1804b1-4778fe121famr33076605e9.0.1763130438009;
        Fri, 14 Nov 2025 06:27:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm152467825e9.3.2025.11.14.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:27:16 -0800 (PST)
Date: Fri, 14 Nov 2025 15:27:14 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 09/23] gpu: host1x: convert MIPI to use operation
 function pointers
Message-ID: <n5m7ubrimzctfh6uumh5anyt5cc7jnuph5opbi4wup3du7nhqe@dljwxfws6vla>
References: <20251022142051.70400-1-clamor95@gmail.com>
 <20251022142051.70400-10-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xaaurevkxctpys3l"
Content-Disposition: inline
In-Reply-To: <20251022142051.70400-10-clamor95@gmail.com>


--xaaurevkxctpys3l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 09/23] gpu: host1x: convert MIPI to use operation
 function pointers
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:20:37PM +0300, Svyatoslav Ryhel wrote:
> Convert existing MIPI code to use operation function pointers, a necessary
> step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> that is SoC-independent remains in mipi.c, while all SoC-specific code is
> moved to tegra114-mipi.c (The naming matches the first SoC generation with
> a dedicated calibration block). Shared structures and function calls are
> placed into tegra-mipi-cal.h.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c             |   1 +
>  drivers/gpu/host1x/Makefile             |   1 +
>  drivers/gpu/host1x/mipi.c               | 525 +++---------------------
>  drivers/gpu/host1x/tegra114-mipi.c      | 483 ++++++++++++++++++++++
>  drivers/staging/media/tegra-video/csi.c |   1 +
>  include/linux/host1x.h                  |  10 -
>  include/linux/tegra-mipi-cal.h          |  57 +++
>  7 files changed, 599 insertions(+), 479 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h

Not sure if I missed this earlier, but I don't understand why the code
was moved around like this. tegra114-mipi.c now contains the code for
all of Tegra114, Tegra124, Tegra132 and Tegra210, so the name doesn't
make any more sense than the old name.

Furthermore, moving the header file contents now also means that we have
a cross-dependency within the series that makes this more difficult to
merge. Obviously that's something we can make work, /if/ there's a need,
but from what I can tell there's really no benefit to this extra churn.

I also don't fully understand the benefit of converting the code into
operation function pointers if we always use the same function pointers
for all generations. Effectively this adds boilerplate and an extra
indirection for no benefit at all.

Splitting the "SoC specific" parts from the generic parts also now
needlessly exports a symbol for absolutely no reason. Both files are
linked into the same driver/module, there's no need for an exported
symbol.

The only slight bit of information that might justify this is the hint
in this commit message that Tegra20/Tegra30 requires this. But I don't
see patches for this anywhere, making it impossible to review this
change.

Looking at other parts of the series, and given it's spread across a
large number of trees with compile-time dependencies between them, I
think it would be better to split this up differently. I think it could
be three series in total: one for the clock changes needed for this,
another with all of the MIPI changes (in which case it would make sense
to include the Tegra20/Tegra30 bits as well to actually show why the
rework in this patch is needed) and a final one with the staging/media
bits that make use if this all. Well, maybe also a fourth series that
adds the DT changes needed to make it all work.

I think if you avoid splitting the MIPI prototypes into tegra-mipi-cal.h
you should be able to get rid of the cross-dependency. Clock changes
should already be independent. Also, I think it's probably fine if we
keep all of the MIPI driver code in the one file that it's currently in.
This removes the need for the odd exported symbol. It's not a great deal
of code, and I doubt that Tegra20/Tegra30 support would add
significantly to it.

Thierry

--xaaurevkxctpys3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXPD8ACgkQ3SOs138+
s6F9Mg//fsdjwELtSUcPtGsvmQbiCC8AEsQPM2yo9/JndswVd0jMth0Xv4Sqoi1r
3MjKK3XZ2ElOMba9WBeo4+0z1x1Ui8v0WDGTr5bkZBYG8OJq92Qcp+zh4Zf+1i6V
FA2lnZ3yPoKMcx+9y5QHULaqvuIjn4LQCmc2Y4RV0R8rY2XoMwm+8PRi6x0AvL+i
6emDiikWr8OPU+Xbinbp9Vn2fgWUeezNQROFqyjrZB8GRoXX2JavEQpQHlSAI4Yi
baNrdhN4TIxoGqWF5MjfvT4PaPuwJoHIeFWjT4dAfZ6VXeECdUiyYpj1QT/FhR4t
etvzich70RdWs8EBbvnr6M2pTIPKWGdcdg7MPl04UGUZGuCieqPkp0pUFEPfv7ta
OdbX376VR66TJ5VXu2+JYmfbRndyA5FoCX+3B9MAiJ176qpNrY7LLMVSQ8t0ViT5
m1NVTDl9kwIrm0Y7wJKiHPbHpXMhI+ofz1z62pzCivdzrTx9WM27WMQLbfGnk1jj
78hHWckI2EBBTDMPx9PgOIy/8ZQ+0uq8qEd84nBd5RSuOq4YEzPmkxdKJ4GCVc08
GeVyuaZk1c4Fj1JTtF8YADERPZQ86ncfYyc4LHQHJEIE3tj4MiqRpJaUixye4Mfl
NczbVNGDRiRB5b2JJSIa7u1hXBJFKv83HyXzXnkYiwiLw4cgrHQ=
=BFaE
-----END PGP SIGNATURE-----

--xaaurevkxctpys3l--

