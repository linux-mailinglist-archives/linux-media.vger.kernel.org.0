Return-Path: <linux-media+bounces-12004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B78D08CE
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD8428FFE4
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F397715A85B;
	Mon, 27 May 2024 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nj1bqi6C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569EE155CB8;
	Mon, 27 May 2024 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827788; cv=none; b=lXQB8C32j6Yq2Mot9QaNmfHjmX/sQlBXlM1VW3EXhx9zFql4EGLx7KN138iXfH2Vt42U16UR2M3dd/LTFx5fktEbkgq32vZeFA/9t8SGx9pPRb5WTrpbnRzyfDekhlYjvBjxeq5bJD/b8JQIFpfGidrN+UY7DhXAprHRqqcqWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827788; c=relaxed/simple;
	bh=kuETU9xZTDEu2+l7dWLqSpuCPzqJ+Q4LDo6Xgf8cBns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAUaRTfjHfmQNGLFrrSlkFGuHO9HZjCkxk86RaLgLGnwsrEAdZqQmg3CvUrCcBMXqffre5AvWlF6CNTJAjW5TUFhx7g3jBaizVctLQKQxeqoSazBIeDetL97RrWYxYUKkuKEI2XpJ9PlzjzX5ySwDK9qcaUEwgARksSBHlOTptA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nj1bqi6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13204C32781;
	Mon, 27 May 2024 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827787;
	bh=kuETU9xZTDEu2+l7dWLqSpuCPzqJ+Q4LDo6Xgf8cBns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nj1bqi6Csfl3UvIvsPEmSU3EdmQxWKc+AE5ltGjeCmH2YETS1L2ezIcggaDApdIci
	 slbKmzjmnnUAkAoG7RM0Sxv9qVDK0tj1lNeiqRxtoYZl6ssi2ZpDAIbirPH5UUPGxO
	 Sfyil5Wlc9aNnPh+XTLbiuBw5dh11CPR9nQYhEeBONK7rAGiai9tOnD8JSh5Wnkwq6
	 pCAVhggd4Cia+cSsmzzcGrt4755xkz7TqW1B7p2MQ23LGEsESQLvoSYXBDP4HG9PA3
	 b7o8qtqf+pn7KNqz4291fADNdLBGY1FBGtvXYQbhLeWHsHcMQxhG9kiVtgBU84nMmO
	 9n4ZRc2Zr2jsQ==
Date: Mon, 27 May 2024 17:36:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,isp: Add binding for V4M
Message-ID: <20240527-causal-flyable-c34004c298bf@spud>
References: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cbjjTaP7vZ0Ottz6"
Content-Disposition: inline
In-Reply-To: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>


--cbjjTaP7vZ0Ottz6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 03:19:45PM +0200, Niklas S=F6derlund wrote:
> Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Should be with:
https://lore.kernel.org/all/20240527132513.1684232-1-niklas.soderlund+renes=
as@ragnatech.se/

No mention of why this can't just fall back to an existing device here
or in the driver. Why not?

> ---
>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,isp.yaml
> index 33650a1ea034..d335d5595429 100644
> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -22,6 +22,7 @@ properties:
>        - enum:
>            - renesas,r8a779a0-isp # V3U
>            - renesas,r8a779g0-isp # V4H
> +          - renesas,r8a779h0-isp # V4M
>    reg:
>      maxItems: 1
> =20
> --=20
> 2.45.1
>=20

--cbjjTaP7vZ0Ottz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS2hwAKCRB4tDGHoIJi
0j2XAP9UTI/58O+mbsYopjnzb95gdiMhJ8TnFkUjtO8tTWV09gD/Yo0txFdj7DIr
8igNWzdqzDZ9Y0HWUnv+weI2QGhz5Qs=
=/Uzo
-----END PGP SIGNATURE-----

--cbjjTaP7vZ0Ottz6--

