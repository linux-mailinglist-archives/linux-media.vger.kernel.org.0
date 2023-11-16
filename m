Return-Path: <linux-media+bounces-463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 415367EE646
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 18:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC49DB20DBE
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 17:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A821111A5;
	Thu, 16 Nov 2023 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcXUwxpP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB8946546;
	Thu, 16 Nov 2023 17:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF76C433C8;
	Thu, 16 Nov 2023 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700157498;
	bh=rZwTyS46IoPYAgOl2Ju6c6Zf1PZqovxat+OWNHCaLi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcXUwxpPgENl8pzEJMZK7bYU1zdA+TIY9ZRF/gsH2ALt62PiskHEEcfh+c5RyR4Qh
	 8lG/KEKetwxGXMui/Z9vJ8zsjtz2Sp+GRj7YgSUcLP63Q04qQAQCiJKUTIM6tLUuIR
	 slJ6Ew6L7QhsfSspvGNoYKHFkenJLg09pP/bb6RuRCM5vTKVBDEUH4wyj8t3Ar7hTl
	 0sDTVbr6JmLduK9+Q5DGpD37+20QuS+PGubM4vKGsp+sJE/GF/2L4OInMRK//DCpUK
	 TYglfK/1H6ujvJUmW/YOeq8SAzl0xCTkucw8t9Pab4xKMfqbkj9NOvuYpj+nxoxci0
	 7YBm+DCTqK7jw==
Date: Thu, 16 Nov 2023 17:58:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Mehdi Djait <mehdi.djait@bootlin.com>,
	krzysztof.kozlowski+dt@linaro.org, maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com, alexandre.belloni@bootlin.com,
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	conor+dt@kernel.org, thomas.petazzoni@bootlin.com,
	michael.riesch@wolfvision.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	mchehab@kernel.org, heiko@sntech.de
Subject: Re: [PATCH v11 1/3] media: dt-bindings: media: add bindings for
 Rockchip CIF
Message-ID: <20231116-spinning-cactus-40b34caf47af@squawk>
References: <cover.1700132457.git.mehdi.djait@bootlin.com>
 <a0af1d30e79fb1f2567297c951781996836d6db6.1700132457.git.mehdi.djait@bootlin.com>
 <170013761383.1791927.3587552210147410978.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4qwzzLTYrqBc0ZIt"
Content-Disposition: inline
In-Reply-To: <170013761383.1791927.3587552210147410978.robh@kernel.org>


--4qwzzLTYrqBc0ZIt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 06:26:53AM -0600, Rob Herring wrote:
>=20
> On Thu, 16 Nov 2023 12:04:38 +0100, Mehdi Djait wrote:
> > Add a documentation for the Rockchip Camera Interface binding.
> >=20
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > ---
> >  .../bindings/media/rockchip,px30-vip.yaml     | 173 ++++++++++++++++++
> >  1 file changed, 173 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/rockchip,px=
30-vip.yaml
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/rockchip,px30-vip.example.dtb: /e=
xample-0/parent/i2c/video-decoder@44: failed to match any schema with compa=
tible: ['techwell,tw9900']

There's a reviewed binding for this on the list at present:
https://lore.kernel.org/all/169947001607.2754020.4176816227714592571.robh@k=
ernel.org/

Perhaps a poor choice however for an example in a another (unrelated?)
series.

Cheers,
Conor.

--4qwzzLTYrqBc0ZIt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVZYMgAKCRB4tDGHoIJi
0gjSAP4q53Ij7bh9Nt8DPR95YVEcWNyam3GDVdr2EN05DG1nWAD+IUQG1qOJcRVr
3m9eObRtsJeQhSRAe2M8CXnAZly3FQA=
=rvS5
-----END PGP SIGNATURE-----

--4qwzzLTYrqBc0ZIt--

