Return-Path: <linux-media+bounces-12001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F688D08C1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 731DAB2A2A2
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D6473449;
	Mon, 27 May 2024 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+Vhv2YS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1B61FF3;
	Mon, 27 May 2024 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827656; cv=none; b=cy4cMs5aXyuSAsMd9QdB5b51xltbYE0fpYomDVrbSAkglEMGQxTHp2nPLz0zQHZlhqLjHdeVq0NEL7Baul7QBH1jvS/7ogUNculu27YRJCcMnJ2L+44d81JDNvguZIxC+BdNlWP8MQkByS6gzOwrbgAq2XtuLxlUxF5DBV1pmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827656; c=relaxed/simple;
	bh=BYig6Wo4uSGSXHAyC7Rmbk3eHN1uEho75S+B5LtPWI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXS5k8BI9r6zsjqy9oHjcsNB0OK5390zAhLWbfel+aI/4xZawZTQqMGh+W0Tb3TjopFZiVoifyVGoW7ZGWm+Y4ypqEkeSWRXNSl3fRHVZe0rZYc0W/ZKbIu1qAV6yBBxXt2ZxfE11sKts9ydp0Nnwzi5aKrNj5/xOpTS/BoG25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+Vhv2YS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972BCC2BBFC;
	Mon, 27 May 2024 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827655;
	bh=BYig6Wo4uSGSXHAyC7Rmbk3eHN1uEho75S+B5LtPWI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+Vhv2YSApJanPOMM7Akkr5XXEsmtGa9ZUBvKms8mBF9FStmGRFmH5qqKbyi5TM4g
	 JAwEgwidX36HVIeJmoyEiq8hm6eV619mov7TOoutM0Hl5za7HjdAVOX1RNPjY0LPdY
	 g6oESqtTds8OONboxYyHNJ04st85p+KPvIboPMccxxKdJ9/Tf/jJinrNAc1MhpnIpV
	 GswL65wHtBqQ8TGetbx1zVyBJ0BGg67y4emxdVtx8APbtek4akLB/Ngz3OBxA2mP6C
	 7AfBsVA7Virls5yWefIQXlvmjxw+LMw06PvWmDKz/MtlA2+87Y4BFZ75BvrH6FADjp
	 hLaJhlGmF0KcQ==
Date: Mon, 27 May 2024 17:34:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: maxim,max96712: Add compatible for
 MAX96724
Message-ID: <20240527-varsity-grieving-14d341b3dc96@spud>
References: <20240527132216.1681903-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RVxVbXa2+4jKIkRZ"
Content-Disposition: inline
In-Reply-To: <20240527132216.1681903-1-niklas.soderlund+renesas@ragnatech.se>


--RVxVbXa2+4jKIkRZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 03:22:16PM +0200, Niklas S=F6derlund wrote:
> The MAX96712 and MAX96724 are almost identical and can be supported by
> the same driver, add a compatible for MAX96724.

What does "almost identical" mean? I don't see another patch here adding
the driver support, which makes me wonder if this was intended to be a
fallback to the existing device... Ohh wait, the other patch is here:
https://lore.kernel.org/all/20240527133410.1690169-1-niklas.soderlund+renes=
as@ragnatech.se/

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Put it in a series next time (and mention what actually is different in
your commit message).

Thanks,
Conor.

>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 6c72e77b927c..26f85151afbd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -25,7 +25,10 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: maxim,max96712
> +    items:
> +      - enum:
> +          - maxim,max96712
> +          - maxim,max96724
> =20
>    reg:
>      description: I2C device address
> --=20
> 2.45.1
>=20

--RVxVbXa2+4jKIkRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS2AwAKCRB4tDGHoIJi
0t7BAQCaAvprCbdOXYqXTsbyKhiaJyIU3XmydjvEVq/54EC8uAD+Kgw+pMfc6w8d
VNOgaac48HredsHZT8PxuSru/643GQU=
=jmpR
-----END PGP SIGNATURE-----

--RVxVbXa2+4jKIkRZ--

