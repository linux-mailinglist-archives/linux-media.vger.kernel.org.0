Return-Path: <linux-media+bounces-17229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA53966383
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 15:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DF7286799
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48681B1D5C;
	Fri, 30 Aug 2024 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLv031er"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1C1B1D43;
	Fri, 30 Aug 2024 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026231; cv=none; b=rGMXr20O5EevCeKZK4OqC1qb6Uu9vGPXdEbl16ekwNrguvIlGQE2vN8TSaOL4PEOi8cKzNln0OX8NtIIXPlKKU/kBO6VEXF/VbzkaRVd6lPfoNI5n0ky8nB+epYQRcBcbOvb0AlqGOYGeMBQDWA90AliTPjZ+zaFMyCxD4NtDUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026231; c=relaxed/simple;
	bh=edqn2YVzn1eD9OEuKsVzDSWt1beqz0UsKRVfdSWSe3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ta+gG2XymxqfhszuJXaAtSuOQWcXKBqZn4WILUtJbGwY8MAEoLGFWcII2JVh/boEUaNqPQgKbj34gUB+X8nLLBmxwxEjHXeRjTfbmvMBJstHaX85NRN0O9O/kZSxtW5VtPd7Mm9Xt3Nosc8nqiKB9u5e7IQqREe0PclsoA4PNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLv031er; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF8AC4CEC7;
	Fri, 30 Aug 2024 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725026229;
	bh=edqn2YVzn1eD9OEuKsVzDSWt1beqz0UsKRVfdSWSe3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLv031erXIxRE/HxVebTvxSqOWZAMgremWWA53VD2rzNWnVjzG/Z4N/T0i4o1P5Zn
	 wcIpPljO4ITupUeNThttP3KxpOAx4xtkp5DHsDFe3qN9UeNh0A9qygbduAmlZfMrtL
	 X8uXi/ZQ9a32EV769QQ8Sr0v0U74/gFSVPap6LCfSbdkqz4uZEXWIKcTfEkC5cdBge
	 Fk3ARsKAksud3X4PSZeiW9ItanxCmZV1WjBtnNM0BMHvTFtLRAXuwCXoEhFS/sVy0E
	 xV+uXAQc/gjMevVbC71lbgHhPy9AoAmpsaE7VI/lwXtHBbaGsqfJgm8gCXQgsJR5sP
	 P9NkvmnpJV9PQ==
Date: Fri, 30 Aug 2024 14:57:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] media: dt-bindings: i2c: ds90ub960: Add DS90UB954
 chip to DS90UB960 bindings
Message-ID: <20240830-endanger-unroll-2c74e9254a3e@spud>
References: <20240830070117.9534-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fl8VduBGvLOpE37P"
Content-Disposition: inline
In-Reply-To: <20240830070117.9534-1-eagle.alexander923@gmail.com>


--fl8VduBGvLOpE37P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 10:01:17AM +0300, Alexander Shiyan wrote:
> The ds90ub960 driver can now be used for the DS90UB954 chip as it has
> a similar register set and configuration.
> Let's add an additional compatibility line to the bindings.
>=20
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

FYI, your threading is broken on this series, patch 1 & 2 are linked,
but the binding patch is not.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yam=
l b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> index 0b71e6f911a8..86d43d949dd3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -19,6 +19,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - ti,ds90ub954-q1
>        - ti,ds90ub960-q1
>        - ti,ds90ub9702-q1
> =20
> --=20
> 2.39.1
>=20
>=20

--fl8VduBGvLOpE37P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHPsgAKCRB4tDGHoIJi
0gjXAQC81i+tJvhqiBWFxoN+PsSC1GWxdAt0u5N4Kmy9jBZ1ZgD/cGFOAuuofZqu
QDVuhjuHiFQK51jDPDlE+uApJwaO7QA=
=V9Uq
-----END PGP SIGNATURE-----

--fl8VduBGvLOpE37P--

