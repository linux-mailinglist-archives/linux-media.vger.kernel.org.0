Return-Path: <linux-media+bounces-23639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E69F560C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 19:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D2A188FA47
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D691F8930;
	Tue, 17 Dec 2024 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlQT8h2G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070E1F7562;
	Tue, 17 Dec 2024 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734459888; cv=none; b=C+3qvYjgE1ZbYHiIsOPg7EcK9TYJLFgQ+kCnNWTnyCWStfBMWZXTx0bT2CT3rqKHewnhWbXare9LevITchbeOz5f/0mp4XKvviWC1MdjBIy5xgYfCuNoEFP3ArMC3p3J0UCRug+IwYR8QXP8GHvC1L7rWTwIP7bHue2PyBPsje0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734459888; c=relaxed/simple;
	bh=WmVhbvyITgDCUN/Q9QgBlJc5BHM0NXp2JvRUV7TbNx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPmzvvfUkA6ublQk5ZmCSV0+vCAc+SGGCoSdyKzghtCy3dAyM/sx+kP4boXDui0c82F8Nq4Gm/bOmKXu+HoQTW+nZjPNzMPIO1sHhhlDZmKaoCxIfNH5ZwumFP8PeAVMTFHQyl+HeGUPA9uSYRWoeYM7wn7LK7LAEtLcnnqjdM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlQT8h2G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A90C4CED3;
	Tue, 17 Dec 2024 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459887;
	bh=WmVhbvyITgDCUN/Q9QgBlJc5BHM0NXp2JvRUV7TbNx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlQT8h2Gba0qDyGj0NxRkEsTbuCxVEUeTs9AR2Zg/fj4qjjAgZfxdNs8hk2E2P/5h
	 TyjVTn5z+6DwPfYTjhhTiGOP3le/rTpuCeX4rIru5835orQ3MLq4cmsqiI6nXTRxMG
	 QYbirz1BpNceUoIDBYa5GZonOsOD0DRbVPCyRA3qSukm6Cp7V53kEDBNDlal18jojY
	 FJOc7loci9KKJPtMEFZVGMp7IJJjF4pAMp3ihHDdNAVr/HlICmvD8+TTssKvdy8E80
	 RZqZBVZzR5spmQJE9wZcVbjF88m+5hcI6Ctq2lQSoX277tBS4mbef77dV/mIQDWZRN
	 Qbgge9+ybbO/w==
Date: Tue, 17 Dec 2024 18:24:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <20241217-crawfish-tiring-792c535301d0@spud>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXE3zBG6hEnuSLIF"
Content-Disposition: inline
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>


--xXE3zBG6hEnuSLIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> Clarify the description of the stm32 csi by mentioning CSI-2 and
> D-PHY.

> Remove the bus-type property from the example.

Why? What's there to gain from the example being (seemingly?) less
comprehensive?

>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yam=
l b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> index 33bedfe41924..e9fa3cfea5d2 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: STMicroelectronics STM32 CSI controller
> =20
>  description:
> -  The STM32 CSI controller allows connecting a CSI based
> -  camera to the DCMIPP camera pipeline.
> +  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI=
-2
> +  based camera to the DCMIPP camera pipeline.
> =20
>  maintainers:
>    - Alain Volmat <alain.volmat@foss.st.com>
> @@ -109,7 +109,6 @@ examples:
>                  endpoint {
>                      remote-endpoint =3D <&imx335_ep>;
>                      data-lanes =3D <1 2>;
> -                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                  };
>              };
> =20
>=20
> --=20
> 2.34.1
>=20

--xXE3zBG6hEnuSLIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HB6gAKCRB4tDGHoIJi
0igKAPoDrf1wD6vhulE5XAy6M4DSbGrhREGhL8rIC2ao7oWAHwD/TCNKL8PFi+YB
35xu7mty1a7YqzisPAib+kIEA3XxSAw=
=g7v+
-----END PGP SIGNATURE-----

--xXE3zBG6hEnuSLIF--

