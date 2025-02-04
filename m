Return-Path: <linux-media+bounces-25653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B999A27B54
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 20:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1309D163987
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 19:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FCF219A6B;
	Tue,  4 Feb 2025 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMpnY06C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF5204F72;
	Tue,  4 Feb 2025 19:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697459; cv=none; b=tQ1ZiGFxRfaa2nmnyOI9tuHXjm5RG8Qo/0O/A8pwT2CAFX3t6aFndTE0e2Q73Wmg1ArBj1OJXp6Bw4R3Xv//jGd7KqozJb7ku7MghMJlGbLwMQi9npszcJCq7helMkX49r5shlATGFSAChR3HfZkWX5KgJrgxUCnn1Z6itUy52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697459; c=relaxed/simple;
	bh=xHGH4a/Ywo4+o/ZzmwaCuhzBpYplcQuCjUSy9UL7dtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAZQK+aQAkvjW+n2nz3gVWffdOxUjMHvAtuB0Uvnw56cD3zSMTRoDhzXU+3bxc8M6YDzJXa6qlL7aBzv4ZZFcN2ceFpgSZwDvc+IHpYGjtjBi3hvnbb8syaXk5zRsUEXTa0DX8rOU+NkSLSlpgOzFhG+rIlnbYN/qUA8Oj9bK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMpnY06C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EF8C4CEE2;
	Tue,  4 Feb 2025 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697458;
	bh=xHGH4a/Ywo4+o/ZzmwaCuhzBpYplcQuCjUSy9UL7dtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMpnY06Cph7s50YtSLnzh0whrBYj3+19NY8J/lXEJ5PtGPfiAqMLpaMv8pnJTFb0P
	 93oj+nkxIft/kgW92UACbNRdrZHHsuam2LDq3HHEy+Q2UlC5ngXXAjzLiTFmLRLuDx
	 43mtYvjCbAu2z+dzJzeQcFMNir+YLla30E7ytuMnJqpXDT0D9O+o3rpdwm1QMEqK52
	 eNZ4kpudcDR3Y8h8h8Uj61hw9nLJA6nXk92J694aOrDyitUUm8+Kp11wNoEbYE/LSG
	 FEpgIxGpOVPrGgqzJZYNcv6igP9KVImNEoKuY1qzDC/Toh2oV82rNQisd0Q2ALOSm9
	 gPhd3dYCEHM1A==
Date: Tue, 4 Feb 2025 19:30:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@aj.id.au, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: convert aspeed-video.txt to dt-schema
Message-ID: <20250204-from-catsup-132a4af05f49@spud>
References: <20250204062822.3738037-1-jammy_huang@aspeedtech.com>
 <20250204-acronym-unshaved-18b89a389091@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S4lsoQVavYeukAq/"
Content-Disposition: inline
In-Reply-To: <20250204-acronym-unshaved-18b89a389091@spud>


--S4lsoQVavYeukAq/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 07:30:03PM +0000, Conor Dooley wrote:
> On Tue, Feb 04, 2025 at 02:28:22PM +0800, Jammy Huang wrote:
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Specifies the scu node that is needed if video wants to capture
> > +      from sources other than Host VGA.
> > +
> > +  aspeed,gfx:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Specifies the Soc Display(gfx) node that needs to be queried to =
get
> > +      related information if video wants to use gfx as capture source.
>=20
> These two phandle properties are new and not mentioned in your commit
> message. Why have they been added?

nvm, I see Krzysztof has already responded to the v2

--S4lsoQVavYeukAq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Jq7QAKCRB4tDGHoIJi
0u/dAP9W0ZzsPi1nGv0y3Mt5OGgJcbcIllWIJygiE1g/EgrSHAEA/s0hskJKMuu/
a2utbby4wEBmS2pfmG8tdx84sTac9gY=
=jK5r
-----END PGP SIGNATURE-----

--S4lsoQVavYeukAq/--

