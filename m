Return-Path: <linux-media+bounces-31385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70213AA458B
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F1A188DB3E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68242219A8E;
	Wed, 30 Apr 2025 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jjzrUXNX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BB219302;
	Wed, 30 Apr 2025 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002096; cv=none; b=ApWRz4MU6qoOr3RR/jgJkuINc7WmLvw6NNzzv5H8xcXHl2VYLfD7Wu7Y+8pmf9sMXmIPR5k0fHs7qWl3jiOK6i6f3zjbTJ1hpsevtE2K5CfhhYk0pAvZV+4QMCsJyWNDEjZK2yU6h0H5DUHbdP+LGS1oQiiPTYlvW1vB1Zn1aRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002096; c=relaxed/simple;
	bh=QDO0Es7F76467cgQLZCHDxN8oWt7wTYwDWMEm8JMfXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI/JAENgG9e3OsLOkJg/AEiakHS45h2S9flo70TvHG5lRsIPIVWhACTbHbXDGdxDfPsMJkIoCG9GESjrl2haK1auSCIKKS+QA3SrEPef3a0AjcFXoVOLbNNJcuKcHMlJ+tbZFS3gwukhF4SzY6/B3ql5RHrlsxyq3ZXRyRmDHXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jjzrUXNX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:5bed:77da:addd:ba0d:73db])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 423B6AF;
	Wed, 30 Apr 2025 10:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746002086;
	bh=QDO0Es7F76467cgQLZCHDxN8oWt7wTYwDWMEm8JMfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjzrUXNXPV793Jo+NunyIOp6tMFaAXr2TQSoY0/FsSkFRxdnwY9azpnwrNt/iAAcm
	 Nv5flGhXd8YKMuSWd+/lhjuvq85TmniPuniDEtI9WoAwRON0VZO4KWKDDIOeaBnaIq
	 bPSqxX/+9xpHihUjMiOlbieMOsSZIyixq3RIFTwc=
Date: Wed, 30 Apr 2025 14:04:48 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_serializer_temp_ramp()
Message-ID: <lwxi27a537rmzvu7fj3nnsyik5cvrgasxrtwtxkjho7wohuk5e@xoshmwsm2lpn>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
 <e01f2784c6f8e4bc14458f9f4246ac0a8888468c.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvnyg4oyqz2votsd"
Content-Disposition: inline
In-Reply-To: <e01f2784c6f8e4bc14458f9f4246ac0a8888468c.1746001540.git.dan.carpenter@linaro.org>


--vvnyg4oyqz2votsd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_serializer_temp_ramp()
MIME-Version: 1.0

Hi Dan,

On Apr 30, 2025 at 11:27:36 +0300, Dan Carpenter wrote:
> The "ret" variable is not initialized on the success path.
>=20
> Fixes: a05744749600 ("media: i2c: ds90ub9xx: Set serializer temperature r=
amp")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/i2c/ds90ub960.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 8075bffbac2b..cf104461b9a7 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2058,7 +2058,7 @@ static int ub960_serializer_temp_ramp(struct ub960_=
rxport *rxport)
>  	u8 temp_dynamic_cfg;
>  	u8 nport =3D rxport->nport;
>  	u8 ser_temp_code;
> -	int ret;
> +	int ret =3D 0;

Oops, thanks for the fix.

Reviewed-By: Jai Luthra <jai.luthra@ideasonboard.com>

> =20
>  	/* Configure temp ramp only on UB953 */
>  	if (!fwnode_device_is_compatible(rxport->ser.fwnode, "ti,ds90ub953-q1"))
> --=20
> 2.47.2
>=20

--=20
Thanks,
Jai

--vvnyg4oyqz2votsd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgR4KcACgkQQ96R+SSa
cUUApA/+Pa9yO82BvZbfB4xs9wi2A/RFJVMFtXtV18uX6oxyXPX9qzEAkBZ+QM63
Z6uEuVKrwC7aNaIUyr7ohE+m7qCcazTFiqgXzCM1CfeuSzmrweuvKtB0p0TDSHbw
yWVvKqVb4b90JPEBLEo4TmQPzjmDGyj1tU6QtRZisPfu4Dl72gumPKh06bcm3bwT
/6bM3gkwq6//fRAzJQePwmJBoXIYRdnJB65hNlhf8W7e7o8h3+fiLg3kJ9Gwvsj+
YmscV/MFlVgevybc7D785ia+l7WKjFxoy+Oi6Ni3oj6UYWKcJYiBNB1qmDtYRYSE
KtxCpR5zwyoQF7BynCEK2g0gWIk+OcrvKvNVT4y8NkI6AkWxLDmJ19SqFIfvWM38
q0nycpVyKqQC7Yya5YahLAjBjr1CQWH9E5VkAQd9YmLlhpcGo6VPsmYQEEueLhvx
14qNYMOBie9sHRsfcFMCME45BmfoX0/G1GJSBMiTBMLVxAAp7JYlB6OabPiBVYcq
RVVnK3ioVvCGuNT0jYkAM2ujjXITJ00wS4RwIMZu7mDe2ysequc9rtLItJaAGYAK
Gj50BjPk5Xvw/xungsdLvbP82Od3vGnUEKGSP9zzWA7k0nJ0GwVEGZzC1tYtiXxR
CIul3wdzwg3RvEWRb2L5LC1e8jtrP4mhxjTYHQLolwwmuQLebtA=
=41U/
-----END PGP SIGNATURE-----

--vvnyg4oyqz2votsd--

