Return-Path: <linux-media+bounces-14539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3192417E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 16:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2AA1C20DE5
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 14:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA481BA89F;
	Tue,  2 Jul 2024 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2/glYfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2C1BA886;
	Tue,  2 Jul 2024 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719932135; cv=none; b=V21QESv4dZix5W/lwR/mfU8JTOwbIE6LsfHj4b3iirWFWV6c/WWjBUDUoOQoThUp2hgm2qe+uVyuXsG+2sLbwkQcwe2Y5lDd3kFWkflIeHLt4nGKampIDJeBD6de7q/WdipmrgWFVHle4ld24lE125lEAT7jYJs4SMEcMsGv9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719932135; c=relaxed/simple;
	bh=6MdDBrXwK7RYXeU/DmcTKAjC7A61gys4py4Z2PoBn+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5KW8ylaqgelz0erN25RS7hTpTDduyYOSCE74P1gvMulukE4T/2YY8Kc9yiGWCUzJDMWvDxo56M78Z2JmJtM1nHZzu77VoB78KEhqQopbsc/5U9eZQy6zgL2O1FD2FE1fQI5svr+2E06nVx7Hmgh6l007RFVKh9r1JnxHDHPtyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2/glYfZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EAFC4AF07;
	Tue,  2 Jul 2024 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719932134;
	bh=6MdDBrXwK7RYXeU/DmcTKAjC7A61gys4py4Z2PoBn+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2/glYfZ7Mb+RQqZFYfvpREfq1Clsj6YUhYOtVwg53349Oz8/KC0d0ZHpIzLH0APY
	 +lLEDN2KO5Dl5y21sy7K4x4mYCWUIx/gz4jI/NvGvVhPKUvBW0JOKtXsKeauvxUrHh
	 VS3ycehzLjcFKoG2GuXValaQDeoTwNj2D3YTD2VE0llFV4ebohBKm0yAP8ES2Q+UdS
	 DcP9w5sf+ZhDjOX5L0eIZ6uVwLrlTglxKWlNDfSn/cJIcTPsrIQUlPmW86CCYe739K
	 Exb1VglO8oQBxxWoUrd5G0Equ5wn5+b4rs6ryi1a10Mvl1gQLjMsPiecLto05w0b+H
	 GXbxWTctwfvZA==
Date: Tue, 2 Jul 2024 15:55:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 2/9] media: dt-bindings: media: renesas,fcp: Document
 RZ/G2UL FCPVD bindings
Message-ID: <20240702-observer-hamlet-10ed084ccc1d@spud>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X2y8VPZfEKNH7z7W"
Content-Disposition: inline
In-Reply-To: <20240702094630.41485-3-biju.das.jz@bp.renesas.com>


--X2y8VPZfEKNH7z7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 10:46:12AM +0100, Biju Das wrote:
> Document FCPVD found in RZ/G2UL SoC. FCPVD block is similar to FCP for
> VSP found on RZ/{G2L,G2LC,V2L} SoCs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--X2y8VPZfEKNH7z7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQU4QAKCRB4tDGHoIJi
0hkNAP9SVvaGbeixUIyJfPSN0jY81aIzECPK3yIt7I25fYPs0AD/YY2Kx6O59Pde
/5h5HiNYTTSvAbf6PmkJ2tXrVFbBzwE=
=0YDE
-----END PGP SIGNATURE-----

--X2y8VPZfEKNH7z7W--

