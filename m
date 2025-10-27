Return-Path: <linux-media+bounces-45662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE66C0DF36
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 579423B4FC6
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6166C25C821;
	Mon, 27 Oct 2025 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f097X8kx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C52580FB;
	Mon, 27 Oct 2025 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570650; cv=none; b=LsK+cgWdtUGecXGuicSS+ThwXZgbkxgYcSQvHxHfZtkZdAB16hNZvQx2pVSh7XwCK0Cj5C0HUPO6pC+n8okPJ7EsLGu3ijnzQy7Y1DIglVVCNWChqh8UpPYxLreUccaGk12D7QTtZz7g8nnVNCJtegTEcuUr8oLxq7RU3XZuLh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570650; c=relaxed/simple;
	bh=f9IEcVfP2kRCqxut50nXsL8UsN+mLFg9FFXWZh9r9Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Udun/wBOZ9FTxbgjnQleYxRCcaQZZZsixj1s+WqlbaViaYhB9YMBEtJ8XiSuYhFIMfRTU/LuF+rjZSJT80pe6S3/D5csRusvmh1H82vWtjyq3953ig3Z0+fT1evet4e6WiCeCy7Bi+pH32boWWBP0igLt7x0XiEQF7X/UMhDvfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f097X8kx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C89C4CEF1;
	Mon, 27 Oct 2025 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761570649;
	bh=f9IEcVfP2kRCqxut50nXsL8UsN+mLFg9FFXWZh9r9Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f097X8kxQ29rBIOYCXwgi0kQSgxeowPnkNwptbuTFkWy5FIvO+TtOaiMB3B0MSjpY
	 sjORIp3f0qoAe+JsuojLKEnx6JO+n/Nr1ZOFOufKlh/hEzgFjapssLK65EGCDPx4vo
	 VHi4eN8IRC8f+9Sn6Ef3m7aKs3wtxMkE/CrrCu2+iLqmjZR3cmYOX0tb9SPDXQDgW7
	 NPItTTT8vcyYhsn4qqKB8sA+l2khRCMBP0SzIHokzipz6fN/09xyFJIPd9BbCh1+XV
	 DIP9JNlraKIPn3wI42gEnOq279jGDTGK7/etbVSzdmpjmiazpTWI+8y3Z8Yvm1N5/R
	 a+fsXXfRX6NdQ==
Date: Mon, 27 Oct 2025 13:10:40 +0000
From: Mark Brown <broonie@kernel.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, kernel@collabora.com,
	linux-mmc@vger.kernel.org, linux-sound@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
Message-ID: <432db4d2-1f36-4531-b0b3-2a06ae682fd1@sirena.org.uk>
References: <20251025164023.308884-1-yury.norov@gmail.com>
 <20251025164023.308884-12-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcUV2s8VfPxXlH7h"
Content-Disposition: inline
In-Reply-To: <20251025164023.308884-12-yury.norov@gmail.com>
X-Cookie: How do I get HOME?


--tcUV2s8VfPxXlH7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 12:40:10PM -0400, Yury Norov (NVIDIA) wrote:

> Recently added FIELD_PREP_WM16() in a few places uses GENMASK. It's
> confusing and may mislead readers. Switch to BITS() or FIRST_BITS()
> as appropriate.

This doesn't seem to line up with the actual change, you're not altering
FIELD_PREP_WM16() at all but rather altering things that use it.

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.h             | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c         | 4 ++--
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h | 4 ++--
>  drivers/mmc/host/dw_mmc-rockchip.c                   | 4 ++--
>  drivers/soc/rockchip/grf.c                           | 4 ++--
>  sound/soc/rockchip/rockchip_i2s_tdm.h                | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)

It doesn't help to send changes to unrelated subsystems in one patch
either...

> --- a/sound/soc/rockchip/rockchip_i2s_tdm.h
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.h
> @@ -287,7 +287,7 @@ enum {
>  #define I2S_TDM_RXCR	(0x0034)
>  #define I2S_CLKDIV	(0x0038)
> =20
> -#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(GENMASK((h), (l)),=
 (v)))
> +#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(BITS((l), (h)), (v=
)))

This is adjusting the implementation of something that takes in h, l to
use l, h which if anything seems likely to introduce confusion, and
definitely feels well into bikeshed territory.  I don't *super* care but
I'm having a hard time seeing the benefit.

--tcUV2s8VfPxXlH7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/b08ACgkQJNaLcl1U
h9BrOgf/WZesOvGZkIjzC0cgXcITxYU+d0wJLcf0GA0ADyZjEl0v5GWiIXwSKFZ2
96/4KlYfP+QnWypd7OPgmCe0w8QeJJAea7lmFwnE8sqRkjyYikoRC318PN1ywNB1
Pyuh/mtAE5cQ+9UzI7j4nKoW3MTx2p2/bulGH1TQs5DyOO9iQK1jeaVwrD3k+ZdI
mEER+xUO2NH09agCTqrQQONeRG9S0Sfs/PstH4X744VpErUsWyuYu794BxrtC8Un
U18ljABlmQfvRVjCV9pDq73C4qwAqAlpsW/X+bTBa0JmLo/1n84hOjdI7Fobo6Kw
cyxDW3840JcPzrlIo2WKdbrXXVH/xw==
=OWcQ
-----END PGP SIGNATURE-----

--tcUV2s8VfPxXlH7h--

