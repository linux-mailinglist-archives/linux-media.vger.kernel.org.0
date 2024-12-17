Return-Path: <linux-media+bounces-23641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E89F5629
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 19:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4610A16FD11
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837181F8ADF;
	Tue, 17 Dec 2024 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMHOyiam"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49621F893B;
	Tue, 17 Dec 2024 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734460044; cv=none; b=QPq74wOu4L8oLmpM7L5RgxQsYTVOqm1dP7R4Y+W42Ra6u/VwK3+Btn5KO/xx30vRrbprz8xcqaeyvZYb27bNmvvM19TgdAV6NrejaIzHc5e3jKz0a2j1VLKdiHbT7hm6nMTiD4Mi9ZUhhXCez5L3GfV/DIqKv9RMikOqHbhHVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734460044; c=relaxed/simple;
	bh=RB/vl1xZENeqYUPqxa8Gv9J0tIN+fUFldgQCXs2ENbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBvVQlsz+c1eyceqV6ZT3eIzT2Ay7+/bm9BUkAZghc63lrkgLx9KzD+52ryKn2W5ct6w53gCKTvzTfzsv9b3OuQSE8Ji6c694+qIrWWxAG3/QRLzHGXn1SUWo4a6ptoCRUnrqKlY6WXbc9Khi9BQSWyN440XlD2stSD23BYJl0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMHOyiam; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D930C4CED7;
	Tue, 17 Dec 2024 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734460044;
	bh=RB/vl1xZENeqYUPqxa8Gv9J0tIN+fUFldgQCXs2ENbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMHOyiam9cF06gX0sD/20gWYwACF7ZcYC4bAxANmYK5U8cBWBNnXUgKQqzk8W6fEM
	 HOuzdxFXxsiUbOleKLBK64JAqGfL2OvWMnV1EYDYAH73TP09xFrixmB8hzmyJNQCkO
	 /a24rjx9xtANDjlvuf6CfBqEpVD367G1tx9Rt+ZN7nhp61wp+QSJ8bQIQFhZ7S1Ueq
	 szjnRe/cluvX8+2k26fvudnR2ltiUNlMrZD+ZOu9Yg4w5ueE3vGsOXDiaQs+PEbD4B
	 LWMnhTHdlJyJmIlU9rvt6iidldoDVtPxwiS7/uac2BGtwHD9PAaPpld1lRN5XWfiZw
	 4Y8cNp6Vdvk5Q==
Date: Tue, 17 Dec 2024 18:27:19 +0000
From: Conor Dooley <conor@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address
 using the reg property
Message-ID: <20241217-strongly-twiddle-b9e1ade32570@spud>
References: <20241217032821.1712916-1-david@ixit.cz>
 <20241217-moving-rubble-712bba91af4d@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tqzicyYakCoVLuvO"
Content-Disposition: inline
In-Reply-To: <20241217-moving-rubble-712bba91af4d@spud>


--tqzicyYakCoVLuvO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:25:47PM +0000, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 10:28:17PM -0500, David Heidelberg wrote:
> > Use the reg property instead of text in the description.
> >=20
> > Signed-off-by: David Heidelberg <david@ixit.cz>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Heh, I was super confused as to why I couldn't find this in patchwork
but then realised Krzk had already acked it, d'oh.=20

--tqzicyYakCoVLuvO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HChwAKCRB4tDGHoIJi
0kFoAQCOhVUZvn6NqTMY+RR2X1uEyOAU6/iXeUyvpRjegTYoMgEA++gnaSbACMxl
hhbNIVzB2UIPcvKgT+yVJURaMtryjA4=
=MDSt
-----END PGP SIGNATURE-----

--tqzicyYakCoVLuvO--

