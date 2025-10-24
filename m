Return-Path: <linux-media+bounces-45538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8AEC083F6
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 00:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 607951A6616E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 22:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576EA2FF152;
	Fri, 24 Oct 2025 22:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fc0x/3q3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16932882AF
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761345263; cv=none; b=pA5tvrC27C8s7vls/tkpY+OB+rLv8u8lt1pDiE/GxNccVZVDx1UMn3GBdGewSlxrqARu9DAN9egx4tLpTeoQN6xYjK/3+1ncdHQ0Jf7e9mU9YwaY6l4YARPNmEIRRNCkQE1hCXzIBui8eAzip3ZesOXdKoTvGD3nYTN4zhK44nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761345263; c=relaxed/simple;
	bh=QQDTN2eNW093ph0FZf6iIjmyX73z6AUHQ14/veUC2UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHIqv6t+brtN2px8cUOQ5UtaVmf4LigWH+kq+UKx2AtyJ7w9zOLZu9i4uYnwvDwq+8Jo1/r4TENi1NdPbNJcmo1kbXBMT4mxqCe8p8Vikj43C7+Fvw0274/QsGJV/t8A7F+2j1c05sTI8gnM5apogA9UCq2OyKZy/3p+k4l/Ojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fc0x/3q3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F341C4CEF1;
	Fri, 24 Oct 2025 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761345263;
	bh=QQDTN2eNW093ph0FZf6iIjmyX73z6AUHQ14/veUC2UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fc0x/3q3QfdxrfCvm5yuVPzVApwMlzesSB+9gSwH0RwZuvEvT3jrMeBQmGWl0YMve
	 eNqmWwxmbTg7Y+oJTa9Q7pJfKahzbRR751gVh4nCzEirnGPQ7XTOtf1/+X+7Qzcyhx
	 2nHUmU2Imc0ZLVwmJM58O7ObH1KQpB+R4C14Jgd7meEXzClqoZHWURR5BOn2RIIFWM
	 WM1spcdOV8LQubVDzPKma6YH27pdHxQCxoKXBKrg2H+Vy11iGDPOCmVFXnRakJ/56h
	 VP6yDmIqmCbuk4LbC/ruaetx1tNRM1SXUqRZZQc+wZmeVkGy2epA31j186BTfXFWeS
	 2ghq4yeG6epOw==
Received: by venus (Postfix, from userid 1000)
	id 951E6181935; Sat, 25 Oct 2025 00:34:18 +0200 (CEST)
Date: Sat, 25 Oct 2025 00:34:18 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov02c10: fix orientation on Thinkpad T14s
 Gen6 (Snapdragon)
Message-ID: <qn6vtfm42jqtheqbd4vlkrdekea5ntk2hvd7bl4jfxf4chjood@7wrvzmtnfiv7>
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdhz35gpvm5vijer"
Content-Disposition: inline
In-Reply-To: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>


--kdhz35gpvm5vijer
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 0/2] media: ov02c10: fix orientation on Thinkpad T14s
 Gen6 (Snapdragon)
MIME-Version: 1.0

Hi Sakari,

On Wed, Aug 20, 2025 at 02:13:18AM +0200, Sebastian Reichel wrote:
> When testing the camera patches for Snapdragon X1E I noticed the
> image is upside-down on my T14s Gen6. After some investigation
> it looks like issues with the sensor driver have recently been
> reported, but not yet been fixed. It seems sensible to do this
> ASAP (while the driver is not yet used much) to avoid potential
> regressions when changing the VFLIP default.

Can you take a look / merge this series? It has been over two months
already and I hoped this would be handled quite quickly considering
this is a not very complicated simple fix.

Greetings,

-- Sebastian

--kdhz35gpvm5vijer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmj7/ucACgkQ2O7X88g7
+pq8dA//dBeDY4dAatZ1f7hezGFnvz0aqHb0+umpt4XxcIIy/TEvWpp1ag/zl0Fg
S5ZKyTxUhIBcH5cXTRAXexLsKOxggXMdu0Db9kgB5YWK/mCyn/eLaTiW8uizAnI6
qmsoi62JO7+x7mgzy1/wc2n3RehDmmX5mdGVtHFabN5nvhbf6OJc0i1zFMg3evaK
0JRK7wQMf3LwXtnW9rUmFLsG/GHhk7AueQ/8NuMoBsmf8F/MGaLFj64XGPNcDH7i
LQvz4pwQQISf8ykdVEYchGwNgeLOYTD0y0OJR+coGxkt2uTF+axlxWB+h1mmdUJL
QDxWsCPjMP85RAjHIFQUaHFWaaff+0KRRmJPdR3t2vgLznXCCCRcmAFXApS7HU/n
yFhQ+kKFgyTm8MKnwEdn3hPFq9Vi295Lp6YARRETPe7H98VSuH1yoG7c3BWym0Eu
m0EAqEJzLNtTn6q999s6uO3c43Lg6aIRFJH2/E2oLPSp3hZzI9SLKgw9HT6X8c6s
5njBpMTXgG7BCNNfaj5qIF7Tg0vsX1JPrD/i5wNkyqDz8Tz8RK1bM0CYsutOU4n/
xhgX9hzT7Ekr+tysfEf+iURvi1wi5fsbSlZ5MCS2f2sf7L+8E00yyrufKf64lI/q
7DQ6e1T24ApKObGg7BQUU8q5wXq//Gs7xXx9pi3pvRoEPDHyCf0=
=u8xL
-----END PGP SIGNATURE-----

--kdhz35gpvm5vijer--

