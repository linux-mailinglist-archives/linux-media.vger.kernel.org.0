Return-Path: <linux-media+bounces-26761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BAA41628
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67F4188E0C5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516311E5B77;
	Mon, 24 Feb 2025 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jt69pVqr"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54F34414
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740381696; cv=none; b=X+zujQDN0Z91CH6RH8es/g84TeRamFQZh1UAITI3W+3Uo8Du6lNcBgRmk1UVPF4mQlt31OzoWRzx206GT4sQnnH5nNu2+XWRJt9KtXxztgPR7KzDwPSVzhoBi4oEZ2BijQQt22qFwJ3hvLhp+65KfBwxGNFudFSyxV1iUbtXVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740381696; c=relaxed/simple;
	bh=Ge1K0ekP0Qup8UdrWDsn33L76A379+px/4IITni0SJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/xRHjJkppexvI0A20LOtNM1VWYwSVo7VU3zwBB1gPlEdwyWJhpP/OJFJmA8ZTezwm84qP+K94Xwi+cQ5iK/ZR35tjp0jGLBhV1GEyRYR53Kg2TU66EN+Tz8/PDhSASEslOiQlWLKVwAkBv11zWz2/AwsqzyoY+HV1joqkRcA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jt69pVqr; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 24 Feb 2025 12:50:29 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740381682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XPoINk1hDVXc0BCmMYLWPaHTV8bhalUYaAUhLHPIwRQ=;
	b=jt69pVqrB7fUsG+20yVtBzackRI58HxDbJ3Y1A1tOfZxiXAnrr4/FMZoCXfd1EWYRW/whn
	iH6x6kUQIZIs1KN8bSeIeD18VkBEotLZCozxuoowPpF76KSHOOjWzZUUx12KkItL0m67Pl
	M31TVTf9oljMOr3JCHLh0OaqhZT7rIo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v3 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Message-ID: <3fzkpcdjsthw5lbajxp6zyiyejo45rcgt3gwjfu2bub3v3acpa@kow5blexev5u>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
 <20250221120337.3920874-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ttzzri7jdpw667k3"
Content-Disposition: inline
In-Reply-To: <20250221120337.3920874-2-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--ttzzri7jdpw667k3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
MIME-Version: 1.0

Hi Abhilash,

Thanks for the patch.

On Fri, Feb 21, 2025 at 05:33:36PM +0530, Yemike Abhilash Chandra wrote:
> The Cadence CSI2RX IP exposes 2 interrupts [0] 12.7 camera subsystem.
> Enabling these interrupts will provide additional information about a CSI
> packet or an individual frame. So, add support for optional interrupts
> and interrupt-names properties.
>=20
> [0]: http://www.ti.com/lit/pdf/spruil1
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>=20
> Changes in v3:
> - Address Krzysztof's review comment to drop minItems from the bindings.
> - Collect Acked-by from Krzysztof.
>=20
>  Documentation/devicetree/bindings/media/cdns,csi2rx.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/D=
ocumentation/devicetree/bindings/media/cdns,csi2rx.yaml
> index 2008a47c0580..e8d7eaf443d1 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> @@ -24,6 +24,14 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: irq
> +      - const: error_irq
> +

If I test these bindings with only one interrupt (error_irq) defined in the=
=20
device tree, I get these errors:

  DTC [C] arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb
/home/darkapex/dev/linux2/out_clang/arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb=
: csi-bridge@30101000: interrupts: [[0, 187, 4]] is too short
        from schema $id: http://devicetree.org/schemas/media/cdns,csi2rx.ya=
ml#
/home/darkapex/dev/linux2/out_clang/arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb=
: csi-bridge@30101000: interrupt-names:0: 'irq' was expected
        from schema $id: http://devicetree.org/schemas/media/cdns,csi2rx.ya=
ml#
/home/darkapex/dev/linux2/out_clang/arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb=
: csi-bridge@30101000: interrupt-names: ['error_irq'] is too short
        from schema $id: http://devicetree.org/schemas/media/cdns,csi2rx.ya=
ml#
make[1]: Leaving directory '/home/darkapex/dev/linux2/out_clang'

There could be cases where only the error interrupt is integrated by the So=
C,=20
and the second interrupt is unconnected. IMHO it would make sense to keep t=
he=20
other interrupt optional:

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml=20
b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index e8d7eaf443d1..054ed4b94312 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -25,12 +25,14 @@ properties:
     maxItems: 1

   interrupts:
+    minItems: 1
     maxItems: 2

   interrupt-names:
+    minItems: 1
     items:
-      - const: irq
       - const: error_irq
+      - const: irq

   clocks:
     items:

>    clocks:
>      items:
>        - description: CSI2Rx system clock
> --=20
> 2.34.1
>=20

--ttzzri7jdpw667k3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme8Hb0ACgkQQ96R+SSa
cUXXvg/+N/NXP8C4sPmnhkf1V2Dk4s2t+vl3U69CQ7Ymlv7gOWiKL7UmlFIOECh0
kK76Afep6KS2mewq1tVHw1GluKwoHMufQcKvFuk4FSFSGUR5FNCerD1evUwZ9xt2
7sfTZjA/VXl4fek+GRIIL9Th1oc8ELEiRhcUGSphtWD6o4B9fA2LX0Gncmz7iO0V
hm5BrHaa0HOOsdmNH9STjE+LmFFBjeJ6CyqyDeLl4Jgt47OMm1DMKfigSeeIFxpB
Ua68WzrZM2byPLL+DyOW+58feqSxcpTgw2UIKFznhm7Wy/DNYoPw46wAV/ZMY2Et
sfycLOQSKArObgvfxTijfKEnLDOEwgFccWCT1+soraDAYJtbK3yqlJTPoDxMLEjH
2Hwsp+gLJTDM4weDoshQ6rOjLfoz8GBjfaj2iqm6t23rscvU8ncOaFMGwrHX49kw
YteZjX2fwJVF59kNwx51p0iEbI83+bFf/1UcuUpcuW3750f6EBBlg+EmfcxeR6ol
eQECOod2v1Hyh+9nDdohVt41xs9kwsZi8I0nrfquzNzPIN7aT5vxOMxjV47VgZqZ
yykeN7ry5A7azKlz+66AaWrd0iHHwbkbwoD/ruG3LFhOGQHysjld0Y+CXgitToU6
bf/SoikT3IfUAjFlFo/861QCMmek8CClApY7ZlzGPt2FqWI3/Ms=
=yOgi
-----END PGP SIGNATURE-----

--ttzzri7jdpw667k3--

