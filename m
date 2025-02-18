Return-Path: <linux-media+bounces-26259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3EA39582
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73AB21738E6
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5612222B5B5;
	Tue, 18 Feb 2025 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IFyFAolF"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641FF188938
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867538; cv=none; b=B8sMrdikRXYmyYfsr/QlzrZBEORLFAH6yZd7WBIzuViYYuQPVcqFO5ZlEiIGZoNcjETiRhMvB1uBsfR9Ws1oNVy3aTbYU3cWpX3R1AGNxGFbvHrRdJFlz/Ga7aWx5T0qIUhXyZTSCQ7J+g+Lo5bH1r0BwYHZtq3I1pzAljY//tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867538; c=relaxed/simple;
	bh=0vz42sgw/7vv4ncPas+Jn/NJdwKEOXuXcw+s0NaMgOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw3R8nnGPF4wuHKipZCWVDY2bUtP/ctVsC1xkAK30ldelmXgztHoiWhBXWFpGw97qaOoTZvpvA52y9iAMaltJfJXBEeTbTNnDcD+Rq2xrNW6ItjnQj5oumQub2DW02zz6cwPtANetDIEnS8zIXgZU1XnoLr/5JXlC6nulF2lVPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IFyFAolF; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 18 Feb 2025 14:02:03 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739867533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8sEo/j0+/IxHJzaY5ssMwAnQ6lNXaOwOy/RizOMoOY=;
	b=IFyFAolFyygDm3vXzeAKCORgZ0D61una1O8W6GvhtQbIUK1pGdEdrBiqsXn9fLVXm+d1i/
	37r2Eqwqthy/PV1vUULJx9NtTFw+v+jawVIrCnFbikwe+biYki+rhN6Unvs3UCkWc01xaV
	zV8ODsG+2N4y34n7iCMMGnPTy9lWC5Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mripard@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, r-donadkar@ti.com, 
	u-kumar1@ti.com, Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Message-ID: <m6ijg5colbev6lyhiobblecb4wlvwezpccibnso26gd3dadrfh@twgul4eel6hg>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sr4ldtn435nab4uz"
Content-Disposition: inline
In-Reply-To: <20250217130013.2802293-2-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--sr4ldtn435nab4uz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
MIME-Version: 1.0

Hi Abhilash,

On Mon, Feb 17, 2025 at 06:30:12PM +0530, Yemike Abhilash Chandra wrote:
> The Cadence CSI2RX IP exposes 3 interrupts [0] 12.7 camera subsystem.
> Enabling these interrupts will provide additional information about a CSI
> packet or an individual frame. So, add support for optional interrupts
> and interrupt-names properties.
>=20
> [0]: http://www.ti.com/lit/pdf/spruil1
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>=20
> Changes in v2:
> - Address Krzysztof's review comment to remove flexibility while adding
>   interrupts.
>=20
>  .../devicetree/bindings/media/cdns,csi2rx.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/D=
ocumentation/devicetree/bindings/media/cdns,csi2rx.yaml
> index 2008a47c0580..f335429cbde9 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> @@ -24,6 +24,16 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: info
> +      - const: error
> +      - const: monitor
> +

How many interrupt lines are actually exposed by the Cadence IP?

It is not clear to me from the TRM [0]. From the "Table 12-1524. CSI_RX_IF=
=20
Hardware Requests" it looks like there are three separate interrupt lines=
=20
CSI_ERR_IRQ, CSI_IRQ and CSI_LEVEL, which are routed to the Arm core/GIC. A=
nd=20
four lines for the ASF submodule (?) that are not routed to GIC.

This does not match with the error, info and monitor line names mentioned=
=20
here.

In my understanding which interrupt lines are actually integrated will vary=
=20
=66rom SoC to SoC, so please check what are the actual interrupt line names=
=20
exposed by the Cadence IP. Maybe Maxime knows more.

But I don't think it is correct to make all 3 mandatory together, as some=
=20
vendors may only integrate the error interrupt ignoring the rest.

CC: Changhuang Liang <changhuang.liang@starfivetech.com>

>    clocks:
>      items:
>        - description: CSI2Rx system clock
> --=20
> 2.34.1
>=20

Thanks,
Jai

--sr4ldtn435nab4uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme0RYMACgkQQ96R+SSa
cUXdNBAAvlJSdV/EmJzBACqQuS7J9cW/g3lobP1lUOO8QviUZnB6Dk2LKP0FDBjH
Y+/F+/HzgOqppHGn/hZx9+BSDBih8i5Vt/X5X3GlusRYxbCPoURk2D0Q+C4Aq/Q5
/riVnZzhF/8BA0YQcuPXuMLv9+3Mt5gDlKwMLiEpzOrOwXAM5/JLYqyofCsMkd6X
Yu8Rpr0uEQQ8kioSQwgwGDzvkpqPFcfhsS+jww/Gimtn4dKAgJQDZ+wlWvQMXZNC
ug81y5Nr3s5dvzcBs/Jb+rhH3ZzctiYFJNPQI/ISHtoFx1HH3BMekTyEScBZZ3/i
PRTtgUMzflXys/EBB8vCQwZILPM14WhKKwhmxjv+AAZr8qcMnM+cLs+XzZV1/PiK
lsSs5KdPdsVw1qDMfXtI/dhbGp2Z7zaxsPTD4rOvdGKWThEIGWvr+GurJOt4a2v0
q4aOfag1uAz8e+3ICx+636f80BlwL2omB8zSZw85sHTmybFLB9Nk4vqe/tPo6Ut1
nvJB5iCg8wGnrcLVkU7lQAw1O1YndShy76eHlb63HuzF1jyuwFLhVVCYiHHraQKF
AGiB7p8SpquuOCRBnHqFqJD9rCwWOS1/oCTWNFxgKqo/aULKjYjNXn1/9/gRhmeD
wxeg06OsQMv8CyJoHyP5BC+6MMXiG88Ik01EYfg6Nj0uvF8B/Es=
=ZXoX
-----END PGP SIGNATURE-----

--sr4ldtn435nab4uz--

