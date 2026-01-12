Return-Path: <linux-media+bounces-50458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FA5D12682
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37E1F304892A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B020E3559CD;
	Mon, 12 Jan 2026 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dvhz3h48"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2832D7DD1
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218829; cv=none; b=ts9hhMU/w87lJeXhDBPf4wi0FwcX/2wGD1UdaTdiYPYbeOUKFJeaf0Df2xjzZH3LXLJapJd2wyy5v5RA+exXMBQWwjkNJGFCEyVLqU/DuIodjXZ8NLJigmKmu20dFrBHxOt2JMv0SEzZSk/+WivWNGlYPO0MWRmtIyhm/oiMi0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218829; c=relaxed/simple;
	bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoxHWhnjIjMxQrPGv8/5kQ3rnZ0sMZcwCUy3Oy6CWi0neJAiHdFDRs+VlWfLzjs5Wvt6vi3PGN8XrdSuphw7Pd2G+tmbfrC4Eo+GyhTcR9skY5F4zqhG9IWjs1MX2Z8U/073j/ix5qwSLSuRgGS0KsT6VzXSp6+qabYE7SvgVO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dvhz3h48; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so59950955e9.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768218825; x=1768823625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
        b=dvhz3h48rSihr+heN2pL6rYoGdQRt2dmHZF1ED8M+d+xB/IWxP5HWUK2mAc1yls2bF
         k1WwHwk4tqj2tQ7Wik3/ruZvc32KplY4Mi/rWz8FUNXoMKJeUl6xfIy4Gg6vZIHJvmKo
         utM1H9gZDQGJtUDQBgkS3HEB6OmMbVHy9RWkJvah/lgiKJz7TmXaZp6R0bU2f9IwdtUf
         +XJG1rdF+lfYl+GDO2RhrdigWg//eDWQLg856HntCoYxEm9Pa6F1zlZltCz+u2fN18Iy
         /RiXuEg7rmj60wZg/7xLckQSSTrAU2xauQfd+n5XAc9b8S15Zd5AjYwSUaYYpKlKKV9L
         YcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218825; x=1768823625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
        b=rutrl9dJLf8DNUdW0+aI6OHr/ViX8vrLO/WEm/PRAQ0FhkHUYu9eDVZ4zE7SXKOGGy
         dkGOZVPLtf1ErqiMiyyCx4Wf7zVbNyMlKKqmhrLo3bxVzxzddunM7dK1Fq2MNPMo+e5g
         HJrYF56mayPEK4ihvtZjaC9O5fm8tI+bnPnIzdNaaoREcGOu1RFxCZOTwS+DnoI6aLFC
         hastWSy4bWs5wiZnT7ELJjtnoAlnh5FiYYO+skSCBzSIQR7H/V1+tTSyh7FIC/UUbSb+
         6DTZ6RZU1EHpVrhVJZHc6/w4rhSExrMLJy65lYmC5wqNfjVrpLePTzIeChUE4DuUez96
         sYkw==
X-Forwarded-Encrypted: i=1; AJvYcCWp8jY6nIo9msuJGegn5Nmi6mgkbFPQbYPa+mQP6VcWuNq8OdFYwsAK5srkgd8gUeJxhk0Bl4wRtBiWWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNETStmEqc7f24PGx4eOrJtHxQomCmzcKfrUiDbkX8Hlg23k6
	XEm4LyUMM8E3bUfFRfE01KEeaK525MrshR58lef5Rm4k5IhLSJvKZwqemn23LCIL+yI=
X-Gm-Gg: AY/fxX46l2wMy/ld6gnVkROhRL+SPhIPwQ529p8lOlrB3NaudVa7mcQnbAzBTseZiNn
	a3d8O/IouzJjt1VjHhQR6EmsL5bU4OTQcXeAGFPZ/StrhZ8qfIaL9dhMfVC/a6PaDAVPWLAMnW+
	dfV+4JCoC3f46xgTbFLXZUrLb2hYyWNYGdTZjPp/hchh/qD0CEuQzK6X7IlLGVG/pFzS6ivNCsu
	nVEBkLiN3CrO9jaJj9D6qPFMrrTWDyhUOgSiA7D2LD4BvF6bliicJg8gkPImRciw7vxeZvv42Rz
	fDJlE+PUBaq6bN//E5/ZlvgfW1U4AptwK3P0t0UlT4St4/AV7n9b7qPs9CumxuuQKNI18FWrn0P
	Aod4Q5hPgOnTuatiCTwNXWsSg8l193FY56D2jetAY8Cjjm7FkNr7hpL9r3wdIU1J7FrNjD5lNAu
	QdYzNd5F5PBYwqQTjhiQ65yTV8dNrGfKmDkt6syrmeFZjsz3wnyLjC1MGnWQqkh631DvKuHwHCu
	A==
X-Google-Smtp-Source: AGHT+IHS+X3LSDt5qzxc7wN+ZiHbRa7V37jnrS+IUFcr2yrSlHBW3u8uORHbJtAGSuAyEXEXsweZBQ==
X-Received: by 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d84b54031mr204347325e9.33.1768218825500;
        Mon, 12 Jan 2026 03:53:45 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d8660be14sm134733965e9.1.2026.01.12.03.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:53:44 -0800 (PST)
Date: Mon, 12 Jan 2026 12:53:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
Message-ID: <qqdjk5wi5xlily3cfa74lrepglo42ibnpoyam76vwkymju3hkh@b5dc4yg64mhs>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="atue6rojhx5cbpx3"
Content-Disposition: inline
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>


--atue6rojhx5cbpx3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
MIME-Version: 1.0

Hello,

On Wed, Dec 10, 2025 at 09:31:36AM +0100, Uwe Kleine-K=F6nig wrote:
> with the eventual goal to get rid of the callbacks .probe(), .remove()
> and .shutdown() in struct device_driver, migrate host1x to use bus
> callbacks instead.

This series got some positive feedback but nobody picked it up yet. Is
this still on someone's radar? The last patches to drivers/gpu/host1x
where picked up by Thierry.

Best regards
Uwe

--atue6rojhx5cbpx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlk4MUACgkQj4D7WH0S
/k5w/QgAhE2EAWGMq3JkMD2P64EjS1rMwsjti9FFnLXqoSgWOD1/HpSebIxgHVUH
9SjJD/+aDtRXdiEaEM0CWYWAcTk673HShaX+R5uJ+NUSegWvD1bO8RXbwYW2lW0l
5XEoBJro1TsCECL4gBAlxENblu01RKLwAnTAcCHRjTFEgjM833wJgTFdHrtUAZxZ
uiEOWaOT1mxK+8rPLf3lPzeu/3NAhDsUGyqIMDA1IQ4PUkSxBwR1A6CZPsL916r1
+Rr9xh8Jo7dY4QKqb7SseBTkAoqcbozDpROJPfpUmUbHCPld8WkAx7mt8I/DTJ+M
+lGuvDBluoPISCAslcMNqdQ44lcyOQ==
=kDAI
-----END PGP SIGNATURE-----

--atue6rojhx5cbpx3--

