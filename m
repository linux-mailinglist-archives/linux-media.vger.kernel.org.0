Return-Path: <linux-media+bounces-1075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259E7F9CD5
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 10:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2651B2812DA
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 09:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC31C171C8;
	Mon, 27 Nov 2023 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ie6DAQKQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2133E0;
	Mon, 27 Nov 2023 09:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DAAC433C9;
	Mon, 27 Nov 2023 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701078060;
	bh=VAe16eg7y6ayTkfAT9VTCj+Q3FFIy+QqJ0XsEAFzdqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ie6DAQKQwth6/jsj75eLcKctEZhUSo3DB0NwQ2dpsFGO1StB90BsXbeaHN0mAAp5r
	 eBTOZ0KH8MvrhVT6ZSAnGs89nyE+jIjaFTVBfoRB5NI1Lx2Cch6ycLeW5aA1RB8nR1
	 5Mrnhw6eBJEzPlKSL6d++7ZRL0QcMchZ30C/YoEic6QG3a+aEdIAWmzFtJFP3sLZAb
	 4O2z7iEkjaCO8KpJx9qFQH2UviDu92Ydl/azM+Wc7SAkwxNbnb1cRGkcCrU4TRNM+b
	 hmM91Th0AzdPz8u7IuiA4GPFBr4oJJ9Do4FmdDr4hCfNvLT4Y2j38vpWSBxUO0i+CW
	 9jqQWwJk6rFyA==
Date: Mon, 27 Nov 2023 10:40:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Johan Jonker <jbx6244@yandex.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RFC v3 22/37] drm/rockchip: inno_hdmi: Remove useless
 output format
Message-ID: <pxj5yv3f5ukobsqfokd5ojh2is5za5wdv3imfqrlcu3smoib76@5lw5bwl77uvg>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-22-328b0fae43a7@kernel.org>
 <52b232e4-7ffa-1d01-efa6-a0af84729483@yandex.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgomrsf3hj7iwzkr"
Content-Disposition: inline
In-Reply-To: <52b232e4-7ffa-1d01-efa6-a0af84729483@yandex.com>


--fgomrsf3hj7iwzkr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 25, 2023 at 11:00:52AM +0100, Johan Jonker wrote:
> In stead of further cripplingRockchip HDMI drivers one could also make
> it functional based=A0 on EDID info.

I'm not crippling it, it was dead code. This has no functional impact
whatsoever.

> To start with the output could you turn RGB888 input and switch between
> RGB444, YCBCR444 and YCBCR422 output.

I don't have any hardware to test that out

Maxime

--fgomrsf3hj7iwzkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWRkKQAKCRDj7w1vZxhR
xRUcAP9CI1PcttTNikiIZjxjYzvcKVQK/UCxKc5meY4XBGQ5OgD+LSZ4/nwHLH0l
7NofWH+K9NjPixshRfY99cdGrd+x+wc=
=/lNp
-----END PGP SIGNATURE-----

--fgomrsf3hj7iwzkr--

