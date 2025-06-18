Return-Path: <linux-media+bounces-35166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B776ADE98B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 13:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1293E7A25D2
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758E5288C0D;
	Wed, 18 Jun 2025 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="daYQhKGt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60E11B0437
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244631; cv=none; b=meM3TSE9TuRLspkNu0aHgNUMGiO77wonbPYDMmlsUQz/IoJ5RDqpG5DfB/H/1REQAFybn01wz1DSMEaT/aa4UE1akBJ1gAbhdXLpC/MwOplUyAzI5ITPJK2ovoQNvBMxx63IQcfoevWv84C4IF9BM8tzNKA0SLvroDnkYPbIpGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244631; c=relaxed/simple;
	bh=0nn5Hh9gQgDqC1H98rYF4GGWYfI+6An40/+KdHEedlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQoe/kQRp1bGIYLj8mtdINeLzMvZ16/3ZSkq3iipMGTEiIpIdzcFtEjgsgSVSu91DTnzZJqJqUkBVoQOUKNPcLDtOr2Iwzl8Hvf4++V8tJOZTCKIxM7t6UqyHb80H9DByLO3nS6+qiaFniezE+a2O94Nr7f2/aWcNT7jEToUg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=daYQhKGt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0nn5
	Hh9gQgDqC1H98rYF4GGWYfI+6An40/+KdHEedlI=; b=daYQhKGtQhb0d/qWsa/n
	lUNe6GPm8THq9rj2Q8Hru55vKMlfjezINua0EIXYm2XJaBJ8/EKu6GR7mLBC55LK
	6iyX+xERwdYxeDnnDJWuVQm1n/WYys8c9w3TFetGDXupIUHUaGmjYGB9HabJcGI0
	duLr0+7oQ5FP9zxVjMRnLXMoKZ6A4jOzmQmd/5jdDDvvAwdWDGp1jpsHevM1FBlu
	bBGSR0NVPiW3tjGl9X3b6hZGypSyyR33jgnSsdBk1f7olcu46vy61wsBYnThLIxT
	uwljDL1zNhgTUVncn0KjBlcuclbUAj4XRTKiunUXEqP+kOEJbbZAW/IjC1qxb87e
	5A==
Received: (qmail 1998330 invoked from network); 18 Jun 2025 13:03:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2025 13:03:38 +0200
X-UD-Smtp-Session: l3s3148p1@22G8lNY3aKUgAwDPXy2/ACpZfVCNKldR
Date: Wed, 18 Jun 2025 13:03:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 07/12] media: rcar-vin: Merge all notifiers
Message-ID: <aFKdCgNHxQr_ZOPl@shikoro>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-8-niklas.soderlund+renesas@ragnatech.se>
 <20250612231504.GE10542@pendragon.ideasonboard.com>
 <CAMuHMdWn01G-kyFgM+7e+TDaoN4ekSuM=c0kcByFLDsVBVvgwA@mail.gmail.com>
 <20250618085840.GD28826@pendragon.ideasonboard.com>
 <CAMuHMdXFH9iKGOsgMt+nqSMFCg-u3b=iTWeqP0tWeuYWseLbtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/svJFNZ2s4KF9IA"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXFH9iKGOsgMt+nqSMFCg-u3b=iTWeqP0tWeuYWseLbtA@mail.gmail.com>


--z/svJFNZ2s4KF9IA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I find it annoying to have to search for the needle in the
> haystack, and I'm not alone:
> https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/process/submitting-patches.rst#L352

FTR +1 ;)

Still, love you all!


--z/svJFNZ2s4KF9IA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhSnQYACgkQFA3kzBSg
KbZUphAAohmG4+rTb0nKP3UDG/G7kFA7tbgdnqe4es2fh3dTpvoKplNtHyu2gO3/
KJVyZutwVOkVjzNoW8dAiRf++qUstXtV1kqtW1N+iP5TOEKACIOYjbKJyRCxeGwK
npB68EH4gLBPn/BAy7YCiw8vRr13htUL+/Gr9YFSEcOw2xtnw+Ex2EBmslNaGlCm
o4GMyzrFFB5oqTGC5edPrA5lB1s4FNEZSENwVAlZ07tHyf12n++RYHsaWW+D+VWf
yiRntiMm0bI4/o19ZedyR/R1RCH3Pj2O3tLjMPvbm9XmMSR4nhCXmgvTH5t3Z+2r
1p9QL7yh1LwbdamHG5wqmT19vviLgdZrPtfoaUlWvOfLSnJFZjQhg29z6nG9Jojf
cPf6hw/P5wBtdio/4a2/u4MA/VdNYo4BMBD+H7GeXC/BeY1+XVajiSANZEU66kVH
ebakBzYbSflIwfA4MRatKVX5o3yN1d/eC2s/HWZ9B0GsExRfyUFHe1BGuWWlXbQq
mY21rShuqoKgupOXV9py67a3xNPT4fQqQcUiMYGNZLEZpg58IKAdxorpIjnkjZ7Z
4jf99Jx8aSMQ6hFLifGQbHFDlBp/51ZYeRFI9Jv3FQm59pVyU0GbVnfFvkFnnduN
FBiWcMqaoK9Q3Os4AQSxnQxE1D9ONqx0yi8JkV53S+BVrtXJ32Y=
=Ynaf
-----END PGP SIGNATURE-----

--z/svJFNZ2s4KF9IA--

