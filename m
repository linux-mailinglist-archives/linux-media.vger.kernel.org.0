Return-Path: <linux-media+bounces-14540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B85924181
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 16:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96D71C212F2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDB31BA885;
	Tue,  2 Jul 2024 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJpamRkR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE41DFFC;
	Tue,  2 Jul 2024 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719932149; cv=none; b=s5c8pjCFCjN5WAvWbbkmB+RgK2u/cQsO88U5b05e0z3A1VMTBNYK/yQ3nYDig2+xfx0yL52MpZzWZw2feaxIL1LiW5OYXcU8Ml+dP+BTVc5Y71InKfmNtXkXFCTTIBj+5wDrZ73h90PKRYkxNLkAYeUAI14Lf2fCJUUk759V4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719932149; c=relaxed/simple;
	bh=aKnXc4LS+0HcqlnmTNs0KyqA1prCHPz17Pn+D9Ve4sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCAkhkpsI1eDY+aas9NVjGvCc1MSIOQ5tJ3bNroQEBiU2JAhBivaVZKnnqfdLI3QqwVGt62X524mtX1xpkZ1a/wCvPoo0wAquBuWkyWCfRt5quPaVAUG2UeTDQErMOAktn/O/2cNNm2HrVYl15Bm0YZ3S0r47bp9hwxyOawBjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJpamRkR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13BCC116B1;
	Tue,  2 Jul 2024 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719932148;
	bh=aKnXc4LS+0HcqlnmTNs0KyqA1prCHPz17Pn+D9Ve4sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJpamRkR07ZZfr9GeHCs31kvY9SbaptMAq51W2SfIqm1AKSML0V/pVi8ozMQd463E
	 LJ4l7UVPNXua6Gh7/sRgwcbjZgS2FTdBXdwOPT3REwyRNoE1m26gFYAen/CRVVr/fY
	 7nIDUDCH1IH46kMBNG0VkkkbZ5XwBUBEQVnQwtmmvVCln5C456h69AcGSnjrBafT43
	 aDPDWyo31vtQwr4OAxOBXTT8yqLqpRrQRSh9eIrzhdgWm7fOL1tHKXfK+WWz5eDCaI
	 6/2/oMP0D2pNdCzZGn0dNh3J6R6AxwOgDeq2/N8Y0GJreBpUP3m5xoGTCd1KDXxj2f
	 TlVnv90ctD3Yw==
Date: Tue, 2 Jul 2024 15:55:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 1/9] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2UL VSPD bindings
Message-ID: <20240702-brownnose-simplify-6236435d3d8a@spud>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8Iv1g+RFGY8EpF8z"
Content-Disposition: inline
In-Reply-To: <20240702094630.41485-2-biju.das.jz@bp.renesas.com>


--8Iv1g+RFGY8EpF8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 10:46:11AM +0100, Biju Das wrote:
> Document VSPD found in RZ/G2UL SoC. The VSPD block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8Iv1g+RFGY8EpF8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQU7wAKCRB4tDGHoIJi
0qKJAQDluL3960dKjBUoU1UVBhSaXuINQ/zbNzdTcIa2A2j7xgD+N8ZmN3mFZxQv
mVSs3nF9gGVCCfkCF+PJAinFzrY2jww=
=PQJv
-----END PGP SIGNATURE-----

--8Iv1g+RFGY8EpF8z--

