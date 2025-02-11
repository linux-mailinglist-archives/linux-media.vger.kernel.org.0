Return-Path: <linux-media+bounces-26023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15432A31456
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 19:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC463A133F
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 18:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A68C26215F;
	Tue, 11 Feb 2025 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl4d6UA9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5CA1D7989;
	Tue, 11 Feb 2025 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299576; cv=none; b=iOl3VE5bw8IFjEfu+FbneHSRid78Xwo5CZvpY4V+dtAhjslCuYv8XOjIEjaRc0pxnq0KeRm30WCSzTcTAQ9hK++XzLiw//6+EB5YfvcMmE5TooR6R1W/3iEyH8w7PcbBYrIO9AEUQDY8FIiG2n+JQdSeSff2oDrleBA59IZonC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299576; c=relaxed/simple;
	bh=/Q8nPQOdh4pnjecQT5SDR+UvXcomMmyjZMV67DY4plQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrFCWdbPzTvOjP0Z+OiJYVjZXwvvDVefPnApqr3xyQvO3kLCRX+f82JsVmEOLH3DeP4fFqrTxyDfF5QXSIBlhiZH866K1PvwOiYGqcLqRM/OYPExjIYQ2ZbWTomPU1HpU+eJ9HkkGw+vHmZre5FYsEIcrZnEF72owZm3dMjRiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl4d6UA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241D9C4CEDD;
	Tue, 11 Feb 2025 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299575;
	bh=/Q8nPQOdh4pnjecQT5SDR+UvXcomMmyjZMV67DY4plQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dl4d6UA9VXiaKUc4ASuUZqJqgZwNLN+RMCP6WhjXj+eOBUTMWZgBttNFJR2VR2yg6
	 cpgHMhkCX5Laf6CvWYxizFdFJN8eCWUA8sYSI8yjWVanc4clAksIr+4rTaNir4KQUD
	 vC5zZI7QtkMfETXdO4glwj4U2mQTR4Oz0CXViYn1RWcCB1dqQmTiGTceFp3mc2SaZK
	 yWIvdX3r26O8yr9UZ2nfI5QJVxAsuF7ZuYdofvecnlirtDVUzwNEvIbmqc8vUDsSqB
	 DASjHxRBfS2enAfDhlv8w3jTR8uFOZgPtk7QJZJWFqpGmWGAvCZ2/L7s/R4UgAby4h
	 Am1FToArZEkXg==
Date: Tue, 11 Feb 2025 18:46:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
Message-ID: <20250211-ecard-dallying-94ced9b29fd9@spud>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2YN4dnJkh2x99pN8"
Content-Disposition: inline
In-Reply-To: <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>


--2YN4dnJkh2x99pN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 01:29:55PM +0200, Laurentiu Palcu wrote:
> Add 'maxim,override-mode' property to allow the user to toggle the pin
> configured chip operation mode and 'maxim,fsync-config' to configure the
> chip for relaying a frame synchronization signal, received from
> deserializer, to the attached sensor. The latter is needed for
> synchronizing the images in multi-sensor setups.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..fae578d55fd4d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -42,10 +42,35 @@ properties:
>        number must be in range of [0, 10].
> =20
>    gpio-controller: true
> +  gpio-reserved-ranges: true
> =20
>    '#clock-cells':
>      const: 0
> =20
> +  maxim,override-mode:
> +    description: Toggle the operation mode from the pin configured one.
> +    type: boolean

type: flag


> +  maxim,fsync-config:
> +    description:
> +      Frame synchronization (FSYNC) is used to align images sent from mu=
ltiple
> +      sources in surround-view applications and is required for concaten=
ation.
> +      In FSYNC mode, the deserializer sends a sync signal to each serial=
izer;
> +      the serializers then send the signal to the connected sensor.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - description: FSYNC RX ID, needs to match the TX ID configured in=
 the deserializer.
> +        minimum: 0
> +        maximum: 31
> +        default: 0
> +      - description:
> +          Output GPIO pin used for sending the FSYNC to the sensor. The =
pin, however, needs
> +          to be excluded from the gpiochip using the gpio-reserved-range=
s property since
> +          it will be used exclusively for FSYNC generation.
> +        minimum: 0
> +        maximum: 10
> +        default: 0
> +
>    reg:
>      maxItems: 1
> =20
> @@ -113,6 +138,9 @@ examples:
>              #gpio-cells =3D <2>;
>              #clock-cells =3D <0>;
> =20
> +            gpio-reserved-ranges =3D <0 1>;
> +            maxim,fsync-config =3D <0 0>;
> +
>              ports {
>                  #address-cells =3D <1>;
>                  #size-cells =3D <0>;
> --=20
> 2.34.1
>=20

--2YN4dnJkh2x99pN8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6ua8gAKCRB4tDGHoIJi
0rWUAQC7DyKCXVN0UfP18uwC+5p5DYlNrG9wUl0Z9TRcFSMCpgD+N35w7t2QP+rl
NJPsEV3Cc+Uy4iJB4fuKjWiNCvDFFQI=
=NM+F
-----END PGP SIGNATURE-----

--2YN4dnJkh2x99pN8--

