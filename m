Return-Path: <linux-media+bounces-2399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47750812AA4
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 09:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 729731C2141A
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 08:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A61241FC;
	Thu, 14 Dec 2023 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPD0dHul"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7986122;
	Thu, 14 Dec 2023 08:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2380C433C8;
	Thu, 14 Dec 2023 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702543685;
	bh=bWHJ2nEewYvkEMXif5fsymjDtt1zbVHkI49YReVBsDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPD0dHulfnGTLBExOIGRTAfiqj1Qk7C1wGbXEFFA+Pt+rXyiZAj7vbwEaxmbG0WwT
	 fXFFyJk+4cXRjuEuZOaIW2zJfaQWQVhtRrRRMs9UBCIfoOA/vwGoNjuOsMobs2oBCm
	 /x6JnOvRPji6GrvOos2Yw0oUNQ7Twg7kRtElj5s2rVwBJyXcyMMHWXpshWSCkkceSt
	 DYWU1oSq1eOTpMnCRdiI6PV+tNisgz0AazAxpQrLs1AbDcui/7JAAaAoEKbqsOi4RV
	 TbFefK+3/aSdO1enpIiXwv3fnydWvBXHZc2tXzUZCp7iO2AVsS4o+JMKrdmlVqf3VR
	 5MriRhjZBtS9w==
Date: Thu, 14 Dec 2023 09:48:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 18/44] drm/vc4: hdmi: Create destroy state
 implementation
Message-ID: <rr5wvkunjglkxozfsvf5zvffwzznq6zt5mzvxw5rx2rpyfzecb@kauuy72x43gj>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
 <CAPY8ntBe9RfSjdnd5Smx23La5gQaR9WqY8ehXQyp=4D_11N55Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34euckmdvwkupler"
Content-Disposition: inline
In-Reply-To: <CAPY8ntBe9RfSjdnd5Smx23La5gQaR9WqY8ehXQyp=4D_11N55Q@mail.gmail.com>


--34euckmdvwkupler
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Dec 12, 2023 at 11:40:26AM +0000, Dave Stevenson wrote:
> On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Even though we were rolling our own custom state for the vc4 HDMI
> > controller driver, we were still using the generic helper to destroy
> > that state.
> >
> > It was mostly working since the underlying state is the first member of
> > our state so the pointers are probably equal in all relevant cases, but
> > it's still fragile so let's fix this properly.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks for the review, I've applied that patch now.

Could you also review the framework changes (patches 6 to 16) ?

Thanks!
Maxime

--34euckmdvwkupler
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXrBQgAKCRDj7w1vZxhR
xRk8AQDdN5Neajg11B6buyB2iqOXxDC3Ad8XCWlmcjkK9I1jTQEAv+RIYp6M3cV0
8PQqOi1QiT/3hX+WMjreXGSqFUgQCg8=
=hVnz
-----END PGP SIGNATURE-----

--34euckmdvwkupler--

