Return-Path: <linux-media+bounces-38661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695CB162F0
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 16:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39CE41728AD
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 14:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367CF2DAFA5;
	Wed, 30 Jul 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Y0DK5VdK"
X-Original-To: linux-media@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696501C5D57;
	Wed, 30 Jul 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886158; cv=none; b=CH8KlkJtRWVn6I7B38zVuax3MK6E4KrY9uKp3qlzkYVBo8frwSENf5ukWaNGiFdShBYqyeexpG9iPknzKG8CerClT5pr+sy4H+aX9vK7an8kMr+LP9gekfjK2lQJxtpYclKhCNDr5aA5QKWW4InUulDE4n8Dy+nX6IOd7OdDKdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886158; c=relaxed/simple;
	bh=V34/0BUif7+ERzhsr3sFEFQWqSf4vhHV9Pu8EYOM8sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWUpkpEdXOLaX85U5CRuI7jK3ndeagSIPon5wQygT2v8Cf6ei6qU7mCVXsm5AmOFC/5/Vt3RhgDrDcERX/2jrh27lTYphuG2QPJ+5IITK33X+efWbGeEJ4Tzyf5g9AQgDYn8kOqThrBYa/dRJ5o9vBC77Zu68TzxPSK/khr0qXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Y0DK5VdK; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C56891C008E; Wed, 30 Jul 2025 16:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1753886148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jM2lKKsaUK/2/ezpP7H67fTfmIqiEVsc2+l+DJuNOLo=;
	b=Y0DK5VdKj7DdGQWZYOl9Oy0kbFy2e52flvg2Ks8DK4Jg5OIgTHODnagVLxgoI3/eXGn5DK
	xYLp8YH71CxbqqFNEcCAqhnR+X2M94MHnlVBaHcKvF4fohv2651N8ubol7u1h5EfViVzE0
	G05d01CXLVshIEkmNS6gC/foc+HCG7Y=
Date: Wed, 30 Jul 2025 16:35:48 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	imx@lists.linux.dev, ~diederik/pine64-discuss@lists.sr.ht,
	Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Message-ID: <aIotxHrxuEEqGbkk@duo.ucw.cz>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UCFE5hbQc5QNmNAy"
Content-Disposition: inline
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>


--UCFE5hbQc5QNmNAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-06-20 17:21:31, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
>=20
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
>=20
> This series has raised a question about the proper label name for the
> front/user camera and rear/world camera for phones.

I am not familiar with "user" / "world" cameras, but "selfie" and
"main" is something I've seen before.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--UCFE5hbQc5QNmNAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaIotxAAKCRAw5/Bqldv6
8jtFAKCAXX0aOwyInpx0Q+gZ2vXgWjrBHQCeMQnkyOMwVT35tIbT/RC5hlstnU0=
=x7Kn
-----END PGP SIGNATURE-----

--UCFE5hbQc5QNmNAy--

