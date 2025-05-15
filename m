Return-Path: <linux-media+bounces-32602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F96AB8A53
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 17:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94865501445
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0B521884A;
	Thu, 15 May 2025 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="COsK1glW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D220B80D;
	Thu, 15 May 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321608; cv=none; b=dcIYZArl9QLh4mmAEYRUBP49WvIWvmK9mC3004CTlVmKzCAQ18CIN3/tMOaEjqCOtYINZ77c6A7np3S8XEa1Oc9zDDI9X2CtzGCF3jGoFv0ERng+HqT7hQEXCwW6VLNdZdMyadEv1dUtVD38skHAFhyxW1c7FpxnPGmYvNkiC/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321608; c=relaxed/simple;
	bh=oEnth8bjUONr3DIKUUQwEbQ+/XvAP1CP6xRsYJyF4aI=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=aJPFahczWkWxFPscSgMB6bDsDT/ULT+mGin/tFy3re1VhDNBk4BSvnEBMwEv28/o1X4iU01A1waKbNflqy7SPgNSrEjG4y7SF7MRPrjBy07EDZaacnOZidccytbtq1QwAztPbtyFXI50f6mlB7SUnmDOz9whdzM8VP8edfeXzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=COsK1glW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:7a1b:96fc:ca34:4316:6e64:be11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D202886;
	Thu, 15 May 2025 17:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747321587;
	bh=oEnth8bjUONr3DIKUUQwEbQ+/XvAP1CP6xRsYJyF4aI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=COsK1glWWlt55c4C4BhybNEkGbuISlUEnvHf0PiyVijfHRhYXbS0W1vEO++QsQ+Wq
	 en5x2MN0KhEtwZNZqG6HcSeHSQVm1SWoQq6WQZKwfU9+fBWz9c7XTW0VOZcXieBWaB
	 7R2AEJA1Fh4SnpGkxk08Fk3BowLjcvxAl2bh2k7s=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============7026641472008806453=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250515142945.1348722-1-alexander.stein@ew.tq-group.com>
References: <20250515142945.1348722-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] media: dt-bindings: sony,imx219: Allow props from video-interface-devices
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Date: Thu, 15 May 2025 17:06:35 +0200
Message-ID: <174732159526.2108882.8905658469049267620@selene>
User-Agent: alot/0.12.dev11+g1dd20f1f

--===============7026641472008806453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Alexander Stein (2025-05-15 16:29:42)
> Allow properties from video-interface-devices. The change is identical to
> commit b6339ecfd0865 ("media: dt-bindings: sony,imx290: Allow props from
> video-interface-devices")
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Are there any driver changes coming for the new properties?

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> index 8b23e5fc6a24f..38c3759bcd9f5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> @@ -16,6 +16,9 @@ description: |-
>    Image data is sent through MIPI CSI-2, which is configured as either 2=
 or
>    4 data lanes.
> =20
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      const: sony,imx219
> @@ -79,7 +82,7 @@ required:
>    - VDDL-supply
>    - port
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
> --=20
> 2.43.0
>=20
>
--===============7026641472008806453==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgmAvoACgkQQ96R+SSa
cUWmdg/+O//yk9DsUF6kBlI/j3zM9DieGhBLoptflIfGtB7CLBh92lZhHBzvBOJ2
+7iYLGiifh1J81hdFMPq04e5/iGTlefuv2P8l9XpKu25eCGyTJyjJG6RWZ7SZJUh
TqGdxxyAZCdiuTRHoLpp5goTl4mIFcm1wGuF2n8lpxpUV02h40XCbYqwSrMSVeGP
teDAn4jbUFgQsoF4IE2kq9v3ah4PsMbG1omdomAYrWrkc9Dzcenl2JLCGBSeMMvD
unlQ/+ybbh6ytTIEDhc6uXpI7O25Oi5n+jasxUawqFZikowy8npXgBRPYUqQ5D2W
V0aK1DlA9u44aJZbs5r5ortYdI2y+cOY1tdvBwbp2H+7VrjLLUpeW56g9wSyrKrZ
y+EYtFoAaHyuZEsaMfdmbAB+0MepcebIo9QNtYCsgpVtwIi8YccTROsyFkn39PTl
d8RcacHkwwlnSafMUWv73Iw4mFXaeQwI0h8U4L8ckYIT8+aWiFlSwNj34BCD+Ycw
UgkcsCz3Y0KIblRld3XbE1qvzBrM0hgbiynayLA5Is4qlqv5I14EP1UUWUZ0kqCL
JqkYLzo57pTfA332ucgD0of26zp1/tD4Xwah9kJXSCb2YjEagpBHSNfQbZ4svk/N
ZHoZist6wjNWh86LLr3BUx9SrsLxvlCd0K8u+hujP0B854GqjIw=
=+Wns
-----END PGP SIGNATURE-----

--===============7026641472008806453==--

