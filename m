Return-Path: <linux-media+bounces-343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8837EB5D3
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 18:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 828272812AA
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 17:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA792C1AC;
	Tue, 14 Nov 2023 17:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrpZd3j9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7EF2C1A6;
	Tue, 14 Nov 2023 17:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615D9C433C8;
	Tue, 14 Nov 2023 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699984304;
	bh=yRDLT5Yi6ct/vSUupMEEcgTF3wh2mnRCifA6GnyLQVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrpZd3j93jKjzVG+3VfWZJI+ZTeh9iL90bWq6VCOjfDbeQ4oRua+IbXJV06v4+wcL
	 DNGe8XaxXV50P/xW3xQoSDgyzaPiVkbi11U+Rbjypsb9yCcsVE0iVWpFcwcEn3K17Q
	 iVSveXYXP4PwozGFsXBM4ov0stfJ/O/mhdYuUNjc8vTxmlBySInvATm2tXQWfn8X4S
	 pAhNEQN+Zumop5wy1OJm6KgPCPeAqAWN/in61ehdqM9WTBQuVJyTVotAFffsAoCSZX
	 Bnrp2wla4ZcODnauBSiN1fhVLnLFkP49YIC15oOB0PSm5S2fOaNgrPh+iZu3XcE4om
	 UaV6QVHdSLbuA==
Date: Tue, 14 Nov 2023 17:51:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>, mchehab@kernel.org,
	heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, michael.riesch@wolfvision.net
Subject: Re: [PATCH v10 1/3] media: dt-bindings: media: add bindings for
 Rockchip CIF
Message-ID: <20231114-abnormal-uncross-dcebea2e82ae@squawk>
References: <cover.1699460637.git.mehdi.djait@bootlin.com>
 <037bcabf97294d37b271537e4b11fb88cf9bb6f6.1699460637.git.mehdi.djait@bootlin.com>
 <20231109-closable-superglue-5e7f39739cf1@spud>
 <ZU0avuRRaITV4jws@aptenodytes>
 <e5b1f0dd-0aab-4ce5-82ba-879a4d736e7e@linaro.org>
 <ZU0f33clFwlsTw16@aptenodytes>
 <20231110-appetizer-fame-2152806c7442@roley>
 <ZVJUsDb1mPVtcjdX@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8nu08neggqbZ3wuJ"
Content-Disposition: inline
In-Reply-To: <ZVJUsDb1mPVtcjdX@aptenodytes>


--8nu08neggqbZ3wuJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 05:54:08PM +0100, Paul Kocialkowski wrote:
=20
> > Ultimately, I don't care what the file ends up being called when there
> > are multiple devices documented in it. I'd ack a patch renaming to the
> > =C5=93riginal incarnation of the IP when the documentation for that IP =
is
> > added without a second thought.
>=20
> That would be agreeable to me if my proposal still ends up feeling unreas=
onable
> to you. But I might very well take you at your word since I ended up purc=
hasing
> a RK3066 board in a moment of weakness last week.

The ideal outcome I suppose would be documenting both variants. If
you've gone ahead and bought one, give that a go.

--8nu08neggqbZ3wuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOzqgAKCRB4tDGHoIJi
0jjfAQC4F8CNyB9+LVpLdQCs9w3PBuWgDLgZBTAMXWWl7n3p3wD/b2562YZymf5L
Y9gGBaPMp5CO1wvwe7CR7zZ78eEpAAI=
=u3yf
-----END PGP SIGNATURE-----

--8nu08neggqbZ3wuJ--

