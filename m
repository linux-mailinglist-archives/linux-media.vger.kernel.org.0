Return-Path: <linux-media+bounces-2371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140681197C
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 17:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0868B1F219F6
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6163A39FC5;
	Wed, 13 Dec 2023 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gO+f/cqG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8C225CC;
	Wed, 13 Dec 2023 16:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35723C433C8;
	Wed, 13 Dec 2023 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485023;
	bh=HRBRVfRwW6fBHYqFd8htivjXQBwnnBiOHlRPk7NDL7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gO+f/cqGxjSkA8AiQnDKxIMJHJSwp55yP81+AE7TivkWR4YKMO1pvRsR0LlMGSzCp
	 0VsSID4kfeqPRSA7EGypu5YeFMZeP35UmOgLcXz0Yc94MNiMCloEYqP3/hN+xTmaEr
	 q/cAOtDgz2sYdM35+W161wGQ0DidI9nV9PwzKLWy2wTHBrQW2Mce9B3a21LOyxkygs
	 4lTPAdiqkMYypN0tUlhMmqtoQX4+wKDZfyGJqUh1WiKgUgM+IN/WaR+BlYv/pPafXD
	 9v6utNMdgjtoeOlS/pC4s7T/D5OMiC47SwooA36qFEv5sLEABeWxjDw5BV6UB5HRq2
	 2KCstDSVQQ+Hg==
Date: Wed, 13 Dec 2023 16:30:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: benjamin.mugnier@foss.st.com, sylvain.petinot@foss.st.com,
	mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: st-vgxy61: relax data-lanes
 restriction
Message-ID: <20231213-chest-turf-8e9c4fb0a3db@spud>
References: <20231213071737.1070162-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gDFLM+tbaHAK4Q43"
Content-Disposition: inline
In-Reply-To: <20231213071737.1070162-1-julien.massot@collabora.com>


--gDFLM+tbaHAK4Q43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 08:17:37AM +0100, Julien Massot wrote:
> The ST VGXY61 sensors support multiple lane number, as
> well as lane mapping.
>=20
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml        | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yam=
l b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> index 8c28848b226a..733fac85a20f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> @@ -67,11 +67,8 @@ properties:
>            data-lanes:
>              description:
>                CSI lanes to use
> -            items:
> -              - const: 1
> -              - const: 2
> -              - const: 3
> -              - const: 4
> +            minItems: 1
> +            maxItems: 4

So, it is now valid to have "data-lanes =3D <6 7 8>;" now?

--gDFLM+tbaHAK4Q43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXncGgAKCRB4tDGHoIJi
0velAQC3EX1f+VCEzQgsU05Jb23yeS6pOYuiFfgVCVBIPG+k4AD+PAaWgQom7G3B
bPYcDubG+5galoD1l+QKMWYPxJPOKAY=
=51/2
-----END PGP SIGNATURE-----

--gDFLM+tbaHAK4Q43--

