Return-Path: <linux-media+bounces-50557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA901D18BCB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13E5C300D906
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC7038F24C;
	Tue, 13 Jan 2026 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW/woVd5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257C2BE7D6
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307607; cv=none; b=lwvUHtkuQsQfpaQnRBDRiJQktpASVG6A53bM5lXeaL6iF2YBRbPJN0/1VLw4zBvaouU3+2kqHkRLV6GK/v3IbX25VjRgqpJKySQwh7GZMjcu7JiGVbrmgu4juW9ZfKoHX8LAlhrSclyr0QwHRSWEyx+WFmP3R9taUNGSxHznVng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307607; c=relaxed/simple;
	bh=gF7/fWQyWmzkPClAmAUBXGyZOOP4YJ6wqtt/fKXe3BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5VAuAeV2WdxlMDBvOHJDLEOmM4SuOcdcq2ZL+XlgEKMYfZY0Xxge5nQ2Dzy0KsLi5STyapbVktGCBQ2cfmYb9x5UqzP4ouPODjYiL2dr1LvWjaPYK2ZdHLAuzGgfEIICZXEIeMakoHov5j6C9CAE/uv8xwKmiElhCTa2EFWrT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW/woVd5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so47862345e9.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 04:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307605; x=1768912405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iu+hM+o5OVgosv83g1p0lFler2aXUxBOVyQODWO4k74=;
        b=nW/woVd5LvN2qWY5heeat0v6qpN9B7ABv9Mx33OkYs68QDqwkqrY995dROwBwuiDHo
         z5/GkKhVGVtWs3V94cCzdMpnZikEHhbPSnB4y+QEVUN1LGLxixtZN61qyApPK3r7NO2l
         PBxA8RXw4WDwItgp9jzVnRqRK99CEr6H63xp+iuRNK5eVsqGg251ycV3/asg2RrZsI6E
         HOTqEY/yJYpHufBiT8U5J3s/7rJiNYYit2VPkZV6Gjwq5XhmEJVrmeXg2Ja2x4uw5GYl
         4hAdTMYigz6NoMfKEe1xAGL+DIQ8e0irxBKPO8hfLyh23D/bFP8/ONR0pH5zZ1liGzAJ
         EZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307605; x=1768912405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iu+hM+o5OVgosv83g1p0lFler2aXUxBOVyQODWO4k74=;
        b=dyfPlkMXbYLWIHgf0dZnaGG07TVXKf4lgBT7uupvWLala5HZw+noVhjGYeuPlVDDRY
         N1TgmcmCyk3j2TLH/CXHbkN2T5p2IARE7jmF7h3JtYZO1EPJdIc1ogHUGrlBrXVLHcRS
         gYvuYHVsoszSU0VVAwpI4r+grHjQtcg75lWLze1Y9WCgQEGqJgQoQ3fA0B/sVoYStI9U
         LE0J1uEtIXH0JkHdhHl7P6SmCh2pWjYrKcV/8iUqqUqhV8cJucw0CtH9Qu9Dp4e2cjDd
         A7Se/wg7WusgO/LBQx9nMn2DJOo0Ee+/cIkHLU6IJswPNLZb8TXPwJy8ko8PZdJ/YU/c
         RsAg==
X-Forwarded-Encrypted: i=1; AJvYcCVYLna40AET1eYTiO1Py8yD/eogJgHnizQ/pUo4Rn5ojL5R7tPasrlasxtADwbrKIDbH0+AaeIm6IrDcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Rje1Kb7JRnG4htU59xWAZTzHzrkoUDogEeP5il9wPgNGek21
	xCf/nh8OHqAIOhVPIJK5c3PQV40fUXSJteblF4eAHAHlB7pQvB6PJxtZ
X-Gm-Gg: AY/fxX4lCzYAoh2uuLyp4OMICvyYJ+5PHlPZaA/I/wF7OUrThLjjHTnXhNFQH5hRvcZ
	f26hT+MQY3vLMy53WSOxAZtsc5eOeEa2sMG7v+q7O2rDqRPdVpCal0Qc1xhzAB6V7X02DDKBnea
	+ewj/yYiJAb3DgOl3vsf04/pRGkCw6jl3JaK++BpfO0BSXb7mduzBKGoUuhjIZwWSqVP7Im6Nzr
	EyUy54wuenK7tGrUMaECj8tPsDBmzpso6up3pDsbomp0kSasdEZIbshGRv2oOecmvGkEH+jx0aU
	P4wN5SK4u28/A8h4rfmWXsJhjpHtqgBQPm+fH5zzcjGMaWvezSzpJ/A5Ov6zqujyo8yYrtZsmb+
	Szq4ABznEgrpM/dnS2QSFyjBwfMKfsvfr8gWfi+cmGx+LLxDBF7qZ8BMD2g/p8Hr3tzyOJoApId
	kdm4TfurpBQaH3cFrSMzMsLO5DGbf5fEy95w9HBeRWx9e77kBUVTp6ufotfGFQFWdoHUNeKoWGW
	hxrrSJHB3PW
X-Google-Smtp-Source: AGHT+IG8MSHR6UelEVmGpCyFD9NdUlMZd6tKUDDeZ0GaaRamXIcxo7BgHJmGz6YZQf7c2j4pEDiVyw==
X-Received: by 2002:a05:600c:83c7:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-47d84b52e31mr244947625e9.36.1768307604465;
        Tue, 13 Jan 2026 04:33:24 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f390a69sm399651475e9.0.2026.01.13.04.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:22 -0800 (PST)
Date: Tue, 13 Jan 2026 13:33:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
Message-ID: <aWY7f5V_VE2RY74T@orome>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u2bmktfhhry3gyx6"
Content-Disposition: inline
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>


--u2bmktfhhry3gyx6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
MIME-Version: 1.0

On Wed, Dec 10, 2025 at 09:31:36AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> with the eventual goal to get rid of the callbacks .probe(), .remove()
> and .shutdown() in struct device_driver, migrate host1x to use bus
> callbacks instead.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=C3=B6nig (2):
>   host1x: Make remove callback return void
>   host1x: Convert to bus methods
>=20
>  drivers/crypto/tegra/tegra-se-main.c      |  4 +-
>  drivers/gpu/drm/tegra/drm.c               |  4 +-
>  drivers/gpu/host1x/bus.c                  | 67 +++++++++++------------
>  drivers/staging/media/tegra-video/video.c |  4 +-
>  include/linux/host1x.h                    |  2 +-
>  5 files changed, 37 insertions(+), 44 deletions(-)

Applied, thanks.

Thierry

--u2bmktfhhry3gyx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlmO40ACgkQ3SOs138+
s6GKWBAAkeHMxtj03MuTuHomrmoj2kYvczHvqu0BchkARJlcBuq1QbDBow2Tyjil
qTY5YZp/VaU/tTbssrx5tdAsTOEK2yYugUOxfVz5IbyDzavUQAv8tq6kKLhY468g
v4+p3ypGVT+XiQaAoQOn7GVdKp9X5SLxkJclGirBiepzO2CrJR6ci+NjBqaBBa7n
mO8nh6jRN891vYt9IyZSd0VUf7W4K4mFS/RDKQaQYreFWSNiBAqdYMWCoUknnNY4
lSKKIwp8IUO7wSW6kO7sEFfrQDdQjzp7kBDmG18NkhOsaXs+WjXgEFP3aQqKgmu9
PYV79R8kRqMLuin51hrHrNvGuFbZqNOYFFJe86ipiO2wZTdXbaR4FjkBV5bGcj/a
nwGAeax2FkhF4wGu9Zlfo0Zc0IuAb+S03c+RojN5EguuwTQpj8Fpd4TM6wLC/hur
86LbYnh7oDIeq6rF31GpQv/uQKoXtbseL5CKi0uK9wc+MP0xP/LwONb8oNHbynRq
rPyCADy46HhE0MX7Ki6wONVMloMept5PQdKzt7uizTB7W9cTZDJzIbPCq/kUhw4q
AT9+bH0Pxgn7Q4MpCoQCwvz164tWFowRgcKmbuVO5Bp9WfkzhCNsp01s9+Y+PL+0
1zY/BIC2SpeWjz1ip4Cl19Vid5SJ+6Tv/3EXKQ/PauUfgWbF2sU=
=lJz6
-----END PGP SIGNATURE-----

--u2bmktfhhry3gyx6--

