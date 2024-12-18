Return-Path: <linux-media+bounces-23717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4A9F6B8D
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 17:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4E8916A944
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956A51F868D;
	Wed, 18 Dec 2024 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv18xzyw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CF1C5CAA;
	Wed, 18 Dec 2024 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540891; cv=none; b=ijwUPutyLPnNTYpcJtWgL1sYr+VK9KapOJj2IYv/I7qwa/o+Q6tv5aw2IbLMYVDlL1c0JMKH6HBL8D2fBwEoWXdU6IVEW0X88a8ONSPCc7U83XoKvTU5wTTw35C+QGZdNDyCBabpMP9BKcvLJDxfEHSfB8V0J2VUCYNWSl8J5DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540891; c=relaxed/simple;
	bh=s2SBxETvm52Px3OUzaEAAKhG+ijEolqfdP64sqQHZgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vwi9DX6y+EcyUyVvqZJvQqsz77O7VMsUUn0jxtStjAzYwne2o8a3+oWHINzfqv3rtGXpR0UeCSgwViDN2ZskPD5Lnz43x58FMG5qWDIpyTG6udhRvYSWrjaXYG7BkY9r/UPbeRb5e6+3xrqYOvdHnJvnd8r3YX/p0qp3MkJN8cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv18xzyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A029C4CECD;
	Wed, 18 Dec 2024 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540890;
	bh=s2SBxETvm52Px3OUzaEAAKhG+ijEolqfdP64sqQHZgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pv18xzywipaGaOM6nq9UTilWK5sjSM1kEbxjo6Xpw6inXfOKAzFSfOIvKrq2aYGxv
	 ZudnAiQMcr8FqgqxMKyW7V1YQcbrFARCSOslU8PYjNq6hrBis9sZMjbFCnDRcoaRx1
	 smsgh2c6ieXd4V1gGP9WJv3t1s0/R8+O6yQSTzaXgB/5vxxLWFoiV9kwdfD6boPhbj
	 7X9RosnFG5JafHWbSsywmbT0Rz+dY95UHjJNZ6E9cd79dDsX7G28l0xqujYahkGC9v
	 XZpd71NE2vlVhstAi0ztSHn0qSQJdv21w1cIHaI7Emdk/4YEtF490hDc2GBl5hncXA
	 9jhnLbyHwXwrg==
Date: Wed, 18 Dec 2024 16:54:44 +0000
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
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
Message-ID: <20241218-skeleton-rockband-e25b7d60e7f3@spud>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAI+tP8+x8Vxvsmq"
Content-Disposition: inline
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>


--HAI+tP8+x8Vxvsmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:53:18AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible strings for the AAL, COLOR, MERGE and PADDING
> hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HAI+tP8+x8Vxvsmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L+VAAKCRB4tDGHoIJi
0u5SAP438pw1N/Szkws84SNvpbsLnX57vLfWAKvOv2y+wBPsVQEAwtZ4NMQzmlEn
7IK6CjupfLWoWguKpgjnYhFNDzV9MAQ=
=YaS1
-----END PGP SIGNATURE-----

--HAI+tP8+x8Vxvsmq--

