Return-Path: <linux-media+bounces-31386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D4AA458D
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31AA188FBDF
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E46E20D505;
	Wed, 30 Apr 2025 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wJFnZQzb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A220C472;
	Wed, 30 Apr 2025 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002115; cv=none; b=REEkBES66pPpSiybY1sbpaiiKMc1avlMjvvpx1p4MBkgs8dbBps+w2E3Yg/5wMFiVVl9bnW8kOO6TFUqYwD/oT+Skv2keuzdVLUWFPfa7qloYw1KYrEeES1MaUf4DVwHcg8iJWcXXHg7IKE/+Gw7oBZY51I4QgnMyKGlsau5cho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002115; c=relaxed/simple;
	bh=Qj9N6qHL0VhmXBcaQXC580o3iMpVHGdXhn4V47bbPPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXWrwlLPRvU5n47eRIhn9Zvui4sehqA0aCGMHOEWUsqUZbmcR7++c0VF8EFzfvZH08cTqFyKltgq8j5x6VUDd6GxlXghy9NNesaDoWIU9vj7EE7BpXhSLhsvQioxfFh6AV5TJKZr6GiXrzzbWd0KEmT3SseLQrxVcFCU8viiJ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wJFnZQzb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:5bed:77da:addd:ba0d:73db])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6CEFAF;
	Wed, 30 Apr 2025 10:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746002106;
	bh=Qj9N6qHL0VhmXBcaQXC580o3iMpVHGdXhn4V47bbPPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wJFnZQzbrlZXpGi4GpVofexZxsIBvJiasl1UHtjrOmB7DhlQxQBl1Y8cSSuQhTVMA
	 emVIq1q1hatPsG9BmFlUilfcy1kQGHk0i2ZJdciZCmebXQ3i6+QUzWlBsf+VIRaBvS
	 WXhif2EtqXgXXbEnpoIhd9KWjy7twboB7d6oEg38=
Date: Wed, 30 Apr 2025 14:05:07 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_rxport_bc_ser_config()
Message-ID: <tumx2kbyzqf2q4ibh3v5mmh7hxsalttpsk36sfcv63pomi5wkq@nrls55uvrmxt>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
 <e9e8df2c7ee2fdcad0d97562e40572073de02d9e.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mcbykiruzfvuqlko"
Content-Disposition: inline
In-Reply-To: <e9e8df2c7ee2fdcad0d97562e40572073de02d9e.1746001540.git.dan.carpenter@linaro.org>


--mcbykiruzfvuqlko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_rxport_bc_ser_config()
MIME-Version: 1.0

On Apr 30, 2025 at 11:27:42 +0300, Dan Carpenter wrote:
> The "ret" variable is not initialized on success.  Set it to zero.
>=20
> Fixes: e2a3b695bc5f ("media: i2c: ds90ub960: Configure serializer using b=
ack-channel")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-By: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/ds90ub960.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index cf104461b9a7..ed2cf9d247d1 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2133,7 +2133,7 @@ static int ub960_rxport_bc_ser_config(struct ub960_=
rxport *rxport)
>  	struct ub960_data *priv =3D rxport->priv;
>  	struct device *dev =3D &priv->client->dev;
>  	u8 nport =3D rxport->nport;
> -	int ret;
> +	int ret =3D 0;
> =20
>  	/* Skip port if serializer's address is not known */
>  	if (rxport->ser.addr < 0) {
> --=20
> 2.47.2
>=20

--=20
Thanks,
Jai

--mcbykiruzfvuqlko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgR4LsACgkQQ96R+SSa
cUUlXhAAp2SWCcHqSEWZJc1F5Sy2Gd5TWQcgPyBHGCZtDrUV99jQ1uOaG4BRmi98
wPt2vMQ/TefOyVCCeSgShckmBOl6DD2TDhwzXJttOuR7SIkMqiLDbi9qwMb5Ct15
ChS3DepJZiKYTbllslmIWv/ib3VKfdeRmqcZcEJNM+szOarTqznL7pt6tWFPcB0B
CYxEJORAOiktf2jvJ/puiUDPgLYrGA9op3LYNhJER1gwIKzmGaJH/CPjNX+Pu9JD
saVg+RKRisO5ZBiDWdryKhrH+CG/qkD+SlNBFwhydwsw9Xq1gnKME8LB3o20QMl8
UK/AKNiLdG0Avgyj+tsLkKYN4ljo7f4XkTphho2AJV69G/TiOitzPVlKOTpebJ0N
xh8Oe6ou4TgAm5gpR9wISpywr029d1x42MJnQE/d9Y8vc+d3uTe58C6ypeW120sU
TiPxkbj4L4sHFuGQG6SQBbQ9lG1jzkyFJpAhDAQociml2ONMK3N+Yizm33HaqQEd
cmLKANgxmNnhslG4po7yZQ5dY7A9SGZwcAKOUpFki33H8UnXat8ggplbFkiH6018
JPBrAm0Bn+esOcMpZ0KkKLX3x44y3n4aPq43/14IKESzSDul+qh668QQxxeqEjh/
b4DR9Hd03N0ptykqzE9Eg53198ZftDvz32MaHnr7bzFXyNEuh2Y=
=dnK4
-----END PGP SIGNATURE-----

--mcbykiruzfvuqlko--

