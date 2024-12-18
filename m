Return-Path: <linux-media+bounces-23718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A369F6B93
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 17:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5A11890A09
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 16:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E201F892F;
	Wed, 18 Dec 2024 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETuj7uIu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587C1F63FC;
	Wed, 18 Dec 2024 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540908; cv=none; b=QWPlGdvsFJ30OZhkxJSC7NxFHVm3tzAd0mNxjvaJdU+F/CmwHod/VZApId7yazXBiS6Ogl7L6fNs3D1tVzZVQYRb/Cp+EkUbm3f/XIxZJf2y5hOmzkCriteWKjZbmIGqVU+7JiV0B6ytjuO4alnwRKH31/HyjfxNenvmKDjoolA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540908; c=relaxed/simple;
	bh=0o6YsCPhoR+Sa9h4tInrAJarF+q0Du6OnRImy1JmvmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rS+/82Ca0W/Pwd4XYIZwQwXEsIb9K+/O7BpTkQxO8qiSDXBIvKUeDG0s0X+6SnZl64QM05dcFzf5IUCrMEkxUVmgU9TG4dHIzTVmq9C7ywCoPh2UmhqUJo1GnGW3YnkNwW8WzP2CBCHuJpMsLd2ptnpCDv0VAXZ++tU572fct5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETuj7uIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F8FC4CECD;
	Wed, 18 Dec 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540907;
	bh=0o6YsCPhoR+Sa9h4tInrAJarF+q0Du6OnRImy1JmvmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETuj7uIuB6eGGCOGJuPf2ESKnfDQu/dRe9fQo0z4552Gg5u913QqHQyhGaFWw2h8+
	 XQyOTzs9U157pAsvf6Z6zwoeOPckmNGbzr/gatH/rpgh0loc2KRboRECMPlsPdjxQs
	 2C8NbCc7U2UVNUBG9AAFVVIL5H1uhN3XN5gOSuQw/7kTVp5VTJaTZrFlgfXh+MP2bF
	 QhRcudzP57qlhGdQX4URy9g+upSVe3jxQA+DNU0A4iuhxMSqWff5VZPuobsn4O5+pt
	 lO/rv4VllUbq71t9kIa2cWog5aAyrNqGpTIFBg40MfR0/iahOh7phDXJ3WL25ROoQS
	 dbVw93/FoFkuQ==
Date: Wed, 18 Dec 2024 16:55:01 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mchehab@kernel.org,
	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
Message-ID: <20241218-easiness-appraiser-4bbd32caa2cd@spud>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Askt30FtJgx6rtkn"
Content-Disposition: inline
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>


--Askt30FtJgx6rtkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:53:19AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Askt30FtJgx6rtkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L+ZQAKCRB4tDGHoIJi
0vwxAQDrAZFkEkmMQ5Z2MU2rY35fE61lDYWUebQGDUKcgUN1kQEA5mSrpxLH3nkg
sit8kCz+rofS8aJwNcWgW3XNlnMmTAU=
=ZFd/
-----END PGP SIGNATURE-----

--Askt30FtJgx6rtkn--

