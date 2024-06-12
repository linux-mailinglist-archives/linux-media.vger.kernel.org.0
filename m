Return-Path: <linux-media+bounces-13117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E8905E59
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F65284273
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6C412B170;
	Wed, 12 Jun 2024 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4wrKYE+o"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154D1DFF0;
	Wed, 12 Jun 2024 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718230862; cv=none; b=STCgZ9AloMKSizPz2IAxrAsqiNVS4XrBbLmvdqRHI/ji6ngNmrA5GaNMBP51x1BYNucD+BI1ivK4JSVv/S5Rq99lbab3Kg6cEnZRh8uiMlkvksc4Ak1i1BegXXvBCJHdaMDpdq0N5K7ZSsf0ZNQaes2WsgQJo+CGq8wAQd17njE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718230862; c=relaxed/simple;
	bh=z6S78JodWNuADElHskPehWDvqD/HSQ05v50azD0XDU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvSS5fY8onE2EJu1lGVw/2C84bj7NCt54LIXtESMoUSOeAumfce3iJjFrTLI5lz7+rgyu4hxSbUqjc+LCnBGhI4juTTFh74yUgUCV7MYfViIDJf7MOtluevWD3AyhKHn5bzOgXG/5ctL5pi99TEe5DlwVAnb6a4ht0aX2MKBuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=4wrKYE+o; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718230858;
	bh=z6S78JodWNuADElHskPehWDvqD/HSQ05v50azD0XDU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4wrKYE+oAXWGyeA4J+OREQFqe0MxZHe+9mW95n0gTbaGx42th4Uxk3SHZJyHGNEef
	 /zxCJZA6nGfVgomHsVv0MdEC/nZxaEyJeTiR0HKfJNLaO1l0wTHhuXXKbz28wACs7g
	 /F+NpfIw3rAVgVHV+b4XmdPdMqugLVCXVkKWAW0x6yJPx6B5mk/S3kTkBayuGCPY+S
	 UdYX7Rsavr27VU486ZXami/ExF0Mc1p1FjWF/0KLB+0CKsANr2+1G0YIjUJId9Q1OH
	 bt7gqm92sMaL0X1VhC6r1U1/4sYbVPQg/zsCutfGEG1nzEv9NraGzElM5PQSeM0xs4
	 pMI5ZuPFNnqbQ==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6ED2137820F9;
	Wed, 12 Jun 2024 22:20:58 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id E54E110608F7; Thu, 13 Jun 2024 00:20:57 +0200 (CEST)
Date: Thu, 13 Jun 2024 00:20:57 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, linux-rockchip@lists.infradead.org, 
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, 
	kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: rk3568-vepu: Add RK3588
 VEPU121
Message-ID: <t5yyanxuweou6edj3subsbtndow6nwwexcgkhctfx3mdkoi7dl@zjtqmvklwzz4>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <20240612173213.42827-2-sebastian.reichel@collabora.com>
 <171821679246.3419351.9732124883795406633.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntp3lma6src7nirh"
Content-Disposition: inline
In-Reply-To: <171821679246.3419351.9732124883795406633.robh@kernel.org>


--ntp3lma6src7nirh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 12:26:32PM GMT, Rob Herring (Arm) wrote:
> On Wed, 12 Jun 2024 19:15:41 +0200, Sebastian Reichel wrote:
> > From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> >=20
> > This encoder-only device is present four times on this SoC, and should
> > support everything the rk3568 vepu supports (so JPEG, H.264 and VP8
> > encoding). No fallback compatible has been added, since the operating
> > systems might already support RK3568 VEPU and want to avoid registering
> > four of them separately considering they can be used as a cluster.
> >=20
> > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml      | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
edia/rockchip,rk3568-vepu.yaml: properties:compatible:oneOf: [{'const': 'ro=
ckchip,rk3568-vepu'}, {'const': 'rockchip,rk3588-vepu121'}] should not be v=
alid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['co=
nst']}}
> 	hint: Use 'enum' rather than 'oneOf' + 'const' entries
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202406=
12173213.42827-2-sebastian.reichel@collabora.com
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.

oops. That's on me for not doing another test and doing something
stupid. I obviously wanted this and didn't recheck the bindings
after dropping the fallback compatible.

enum:
  - rockchip,rk3568-vepu
  - rockchip,rk3588-vepu121

I will change it in v6 if people are fine with this solution.

-- Sebastian

--ntp3lma6src7nirh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZqH0IACgkQ2O7X88g7
+pqdoA/9EV2En/+YR2Jzd8BcFmaqKhPrT3iarETgvi+l5Pil5FpQk+4uPvpRYTpJ
XsvG36RWz2jDBnHwqIwcqbU6fzM/YdEQbyk6RzCQwbJ7aZrDgq+Va4+RzlwNb9YG
Cvd00NTkP+Nvj1vdP7YQ4hkB9jHpGNAU6AsF+Te+A3K/YDkqvSMwDAyAL+n5bN8D
i8n3x0R5DOUVKibVFZgQgf+onqXPf9HGOfZhxGzyPArnK8i9ccyu6BGSjwcQYWIr
q24mfPKWIKmRR8+7BQvyG0gA/YPhtYzmCei4zAVXEmM9ZzK3CjNub7jHOBsBTdX/
BEAWc/S1LBboiHF1Nk3eDZr7GyUGL3i+mnMS7VJ9i35GKMNqUo/dLc9su+UVWHGK
V4T89f+yADLH1ojY4aUB9Ay3f96D3bVnHlH+RcqNvS4L0R+0lhEJ7DS5NW6yq+kn
MR+odxWpNJoQvbQJ66vb0xCr57YmKSOXNqq+k4IBXUbLG8fQf7XytmqVstZ90iGy
/PEfFTG1gjpySqENBccrQd2liRWtxsEfF/AQe3N1tthyXMORiCc1805FThm7IsFr
tTN2vaFTZt5FCv/07WzT5KyP6iQkxwiKnshN6L7wIhovNj/yo6HkW1GJ1jZx/Eab
QnzlBXW2SJpf4q6z3PMLd7ZzjBaYio+FIBDsv4PvO3mOymc6lMs=
=977a
-----END PGP SIGNATURE-----

--ntp3lma6src7nirh--

