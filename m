Return-Path: <linux-media+bounces-503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AD7EF3AA
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 14:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 348AA2813BC
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9741131A9D;
	Fri, 17 Nov 2023 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PjQ2pSJd"
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EF5E0;
	Fri, 17 Nov 2023 05:19:40 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99FF4E0003;
	Fri, 17 Nov 2023 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700227179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FoBJqFPZps/IfTWChc3pHLcKO0nSjgo4MRL5iaSeOk0=;
	b=PjQ2pSJdu9x5ihXwMQAH4DLve4Tq7tBDAn/SBjaOXh+lKzC1L0Gi7wEMV113BVBWXN89UT
	VuqQ2p9jKeGm0lNWjmCwz8AdmfozHIOGZa2yo6iPNuKhP5vRU18squYOBVZKjux2WM0izA
	xeGzy3J8mwq8OQ6oHTGIFIgnut/z8z1DSbiTzJi6fmYogiM2GpYqHtWmroebymlEjBn1NO
	d45wq6H8ND0urpxOnyU7c/aIKyGq11Sg6xKS8hL1ypvc5h4QvJaQdtZMqkCpX5I+KDGzSs
	59a5zRN3swyuAx/p0+IaFNnu/bDpfAw/FE0+Ih2HvJBdSu5IlBnAu4qrIlv2MQ==
Date: Fri, 17 Nov 2023 14:19:38 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, michael.riesch@wolfvision.net
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: Add the camera interface
Message-ID: <ZVdoaqgS7Fy8fC1y@aptenodytes>
References: <cover.1700132457.git.mehdi.djait@bootlin.com>
 <3566c176d1ef5ae93aa54587a14ccfa80974e872.1700132457.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TFD2HmYut63ln2GZ"
Content-Disposition: inline
In-Reply-To: <3566c176d1ef5ae93aa54587a14ccfa80974e872.1700132457.git.mehdi.djait@bootlin.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--TFD2HmYut63ln2GZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mehdi,

On Thu 16 Nov 23, 12:04, Mehdi Djait wrote:
> The PX30 has a video capture component, supporting the BT.656
> parallel interface. Add a DT description for it.

One thing I missed: you need the commit title to mention the PX30, otherwise
we cannot see which chip you are adding camera support for.

> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts=
/rockchip/px30.dtsi
> index 42ce78beb413..3a4e859e5a49 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1281,6 +1281,18 @@ isp_mmu: iommu@ff4a8000 {
>  		#iommu-cells =3D <0>;
>  	};
> =20
> +	cif: video-capture@ff490000 {
> +		compatible =3D "rockchip,px30-vip";
> +		reg =3D <0x0 0xff490000 0x0 0x200>;
> +		interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
> +		clock-names =3D "aclk", "hclk", "pclk";
> +		power-domains =3D <&power PX30_PD_VI>;
> +		resets =3D <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN=
>;
> +		reset-names =3D "axi", "ahb", "pclkin";
> +		status =3D "disabled";
> +	};
> +
>  	qos_gmac: qos@ff518000 {
>  		compatible =3D "rockchip,px30-qos", "syscon";
>  		reg =3D <0x0 0xff518000 0x0 0x20>;
> --=20
> 2.41.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--TFD2HmYut63ln2GZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVXaGoACgkQ3cLmz3+f
v9FIRAf8CSuN94tBIxlWPN+Yhiy8dbHRhZ9rV2bkQ2+eJ/8f7y5OFlsXVoeTk3Bd
sFsN74KvBzgsxB8z6Lfon1xz44Dd+d8gR588ZFhTgk4h8Dllj5JtN6Qr/CCTXI9X
YqrA6vRba93rUuuy/2AWtTHFZizD0sU43n9mMOuzxCSrZrY6OlE4UG7ctvsNMTf5
pl4s1LUP2Dn7ZXmxFnlYCe9/1Y3YXH3bUnbNU/bXFUsUIg6mwyJbdvFFn9aSe/BH
JxCbu44eS/T/0yG2Rbk7qqhKT+P8CDVblmRRv0Exve2AhizkVK32Tiv0+6WVIOzQ
QTDVBDCRScDZbTVyk2d408rCJgC57w==
=iLKP
-----END PGP SIGNATURE-----

--TFD2HmYut63ln2GZ--

