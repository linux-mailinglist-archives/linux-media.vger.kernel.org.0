Return-Path: <linux-media+bounces-16485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5C9571DD
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 19:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B667A283677
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 17:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3119918785A;
	Mon, 19 Aug 2024 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDHC2MaF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3981891A8;
	Mon, 19 Aug 2024 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087678; cv=none; b=Dw/BeyiwtsYiCdnsxCD63NAMNNU05JD4lXpH5RvM2F0JNomEYPTaJGIPEkx4b6jo8vVqVwBTwMBEEot2nP4uD3S/PNbFsakD0CXrlTRRJKwcjfmsX3YsRt0QhvNhTZgYS1R5nOPW3aPEEFr0BNmKT/Hu8EgYsnO8D19rE8WTn/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087678; c=relaxed/simple;
	bh=Zs3kfOFOvPASnCu9DjqW5ep60OUXmuTKgwcTJansfIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itzLqTNX+aQgnoemuoBp/2WWIvZQwYGg2xqH47lFTiQR5DfvJai4NHvC1bBhfPzysce+5syZQ4zQscRhBfCLqQD9RCjZNO4g4TEa5hs08o09E1+z6cnHpwvll89ME+Qq1kzd5PlD4DNYYJpc48G05O9Jd0SOuLiNOa9L4DWKv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDHC2MaF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5716AC32782;
	Mon, 19 Aug 2024 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087677;
	bh=Zs3kfOFOvPASnCu9DjqW5ep60OUXmuTKgwcTJansfIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDHC2MaFAMXtS5YcBTAFKyVy4CYWH9ju/5v2uTiGTnxhwdmQ7BDMmsQ7kzqZOHjFF
	 e3+3ZS/gm7MruQg2HdmsU2+HwgnoD8p4GXvjqNuGxP8B1BQBvzslKxz7MEieE9fBFo
	 P3DSMgD+tB0eadPUIMijnrBMedNGqPzDbJXcu2hpdB3HUWuCPnmIbS7brhQqT4qUFv
	 l7nH3k981Tz/nfnz8OhFjpYHo60DT4pmLnzLQW8nE92jC0YhIwHTMMPVhiojL3xzJp
	 9soojUH9AuW3bFCdp+rt75PS06zbTsOc5dvm7vbrgX7u/qQRx0mvayTBmkA1reODIs
	 R3UdlXymLHH2w==
Date: Mon, 19 Aug 2024 18:14:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: renesas,vsp1: add top-level
 constraints
Message-ID: <20240819-lapped-sliding-fce2fd2f85e5@spud>
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
 <20240818172937.121928-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iPQdMZP6bIjrD9Wu"
Content-Disposition: inline
In-Reply-To: <20240818172937.121928-2-krzysztof.kozlowski@linaro.org>


--iPQdMZP6bIjrD9Wu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:29:37PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iPQdMZP6bIjrD9Wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN9eQAKCRB4tDGHoIJi
0sSGAQCoGC2XSGKGS4KkLVdDahR/zPZICRaRQesZyIpKJzR9jgEAzBH1r8yI35+8
j2yk4kzR1ZGqJ+wC/wtUSgyQAW3Ueg8=
=bXqu
-----END PGP SIGNATURE-----

--iPQdMZP6bIjrD9Wu--

