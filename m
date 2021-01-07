Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA34B2ED276
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 15:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbhAGOdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 09:33:23 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:43222 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729567AbhAGOdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 09:33:23 -0500
Received: from relay13.mail.gandi.net (unknown [217.70.178.233])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id AD20E3B1D00;
        Thu,  7 Jan 2021 14:25:26 +0000 (UTC)
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay13.mail.gandi.net (Postfix) with ESMTPSA id A88428000D;
        Thu,  7 Jan 2021 14:24:23 +0000 (UTC)
Date:   Thu, 7 Jan 2021 15:24:23 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Add RGA support to the PX30
Message-ID: <X/cZlxkQUKRY4Hf+@aptenodytes>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
 <20210107134101.195426-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IppPXotpNrpDAaCR"
Content-Disposition: inline
In-Reply-To: <20210107134101.195426-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--IppPXotpNrpDAaCR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 07 Jan 21, 14:40, Paul Kocialkowski wrote:
> The PX30 features a RGA block: add the necessary node to support it.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts=
/rockchip/px30.dtsi
> index 2695ea8cda14..e056d1c32cc8 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1106,6 +1106,17 @@ vopl_mmu: iommu@ff470f00 {
>  		status =3D "disabled";
>  	};
> =20
> +	rga: rga@ff480000 {
> +		compatible =3D "rockchip,px30-rga", "rockchip,rk3288-rga";
> +		reg =3D <0x0 0xff480000 0x0 0x10000>;
> +		interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;

Looks like this trailing 0 shouldn't be here. Will fix in v2.

Cheers,

Paul

> +		clocks =3D <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> +		clock-names =3D "aclk", "hclk", "sclk";
> +		power-domains =3D <&power PX30_PD_VO>;
> +		resets =3D <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> +		reset-names =3D "core", "axi", "ahb";
> +	};
> +
>  	qos_gmac: qos@ff518000 {
>  		compatible =3D "syscon";
>  		reg =3D <0x0 0xff518000 0x0 0x20>;
> --=20
> 2.30.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--IppPXotpNrpDAaCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/3GZcACgkQ3cLmz3+f
v9Gt2gf/arpDpZLEP4HaikNA893L8x+KyyjlaREZnnG5cbWbSWcvqi7dA/EpQPr1
PzVNIOV0cGyeW7niPdksrjZ6TW6ZrbjzjsujtBg4Pk/o06AAnXvJavNSXJRwlxy3
ges/kOzUgpIaDow+4TVMUFZaF5OfvrPI4fldt4kTEhgdWWAmi+JqkMusHt4PY8/s
O92fjtV/VbPQKsTdXz/wUvw4u9dbWCiCLmN+2VQmWAgXrkh4QwZ43P3iRtUCmwBB
F59EiFpXhCw2z0s/uedGkDp5M2SY+ENEXGCwFLSIv/FkS28kMmSjmO7D2QtnCDsE
MDisahYUzr1e9YvbPgmCDn0i7GyyUg==
=+GZK
-----END PGP SIGNATURE-----

--IppPXotpNrpDAaCR--
