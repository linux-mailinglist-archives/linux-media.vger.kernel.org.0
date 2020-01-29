Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 430E414C84D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 10:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgA2Jqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 04:46:30 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50514 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgA2Jqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 04:46:30 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so5470583wmb.0;
        Wed, 29 Jan 2020 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=al6msNrr1e7Fd/KciL8bEh7cwwwNLZSyBSiCZpA4ETU=;
        b=aqdrnLxB+KxT3yGzlHTXVf+Ix+4LpEGQMYzU6WYrFTK6uoKAeQJMPyS4P1qcoVtK2R
         xJIOOL53A5yDilhU45TI5hCJ2nkrUBdTmUzDbI7zUy9glygCTGm77blsYPqt48UBy5SM
         8aT25qcI+JsvgTJiTbWYDmM8148J8KoTi/9qaKnjmwUApDtDnKzgyLD3p3KlGn+qu7pV
         QxlkgNQgh3tubkXQyQbunnwyj39iAx7GRGCab0NdLG6qkYm3RN0P9QsX1/OG1SoAZlvc
         Xkwl1iHwLJk/Na6VY2jsHjsrMZE3+IMItarNk0Hm2/fPmrCK+ri/g/ML6l6bhbH3EK9L
         tuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=al6msNrr1e7Fd/KciL8bEh7cwwwNLZSyBSiCZpA4ETU=;
        b=dYsl5P+oInvuQQ9JjlraLyTmVW6tntQxYPGcRXEM6eDgqlBGWnfJoksUxl+3b9Rr3Z
         Z9c6lK9tTQIgpm8h2Mq0PnZTVREbMp7XywE3P6E0kczH4uZvHstF2JerR+ipsqVyS76g
         O8yL/TaqQ/hh/mDCbpVqH8uZt7dRFtr7/jqCvKRSOc6kvI6vt2jB3WxwWBSkz66exWGW
         KpSbn0KZooUOnG6X1VTE6/bORQnRCYQuGhHc8/2pdz0V3w6VPbJCCSo7l6j4DSWNb3+1
         lruCajFmC4cY77kefbZrc9pT+8Jmg68QKwgFRukT0qPPdjt6zbX7/SnuyQZBq061SL5Y
         uBlg==
X-Gm-Message-State: APjAAAUSGRxmN1BXF7L+nRINJW0xokfQU7pZO4RnHpvXXuS2mCkl4bbM
        7CipAoN+/OlTUWzftvNIQqc=
X-Google-Smtp-Source: APXvYqwt8+agV8bjA4Z1olKQ+WUI2s8AW0z6cfsqeh5Wr1CWSxlT1EVsjTbL2k2P0+s72RdTbPa8cg==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr10179663wma.94.1580291186370;
        Wed, 29 Jan 2020 01:46:26 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id w13sm2118757wru.38.2020.01.29.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 01:46:25 -0800 (PST)
Date:   Wed, 29 Jan 2020 10:46:24 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport in
 device tree
Message-ID: <20200129094624.GD2479935@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
In-Reply-To: <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
> Tegra210 contains VI controller for video input capture from MIPI
> CSI camera sensors and also supports built-in test pattern generator.
>=20
> CSI ports can be one-to-one mapped to VI channels for capturing from
> an external sensor or from built-in test pattern generator.
>=20
> This patch adds support for VI and CSI and enables them in Tegra210
> device tree.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 ++++++++++++++++++++=
+++++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2597.dtsi
> index b0095072bc28..ec1b3033fa03 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -10,6 +10,14 @@
>  			status =3D "okay";
>  		};
> =20
> +		vi@54080000 {
> +			status =3D "okay";
> +		};
> +
> +		csi@0x54080838 {
> +			status =3D "okay";
> +		};
> +
>  		sor@54580000 {
>  			status =3D "okay";
> =20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index 48c63256ba7f..c6107ec03ad1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -136,9 +136,38 @@
> =20
>  		vi@54080000 {
>  			compatible =3D "nvidia,tegra210-vi";
> -			reg =3D <0x0 0x54080000 0x0 0x00040000>;
> +			reg =3D <0x0 0x54080000 0x0 0x808>;
>  			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  			status =3D "disabled";
> +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> +
> +			clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> +			clock-names =3D "vi";
> +			resets =3D <&tegra_car 20>;
> +			reset-names =3D "vi";
> +		};
> +
> +		csi@0x54080838 {
> +			compatible =3D "nvidia,tegra210-csi";
> +			reg =3D <0x0 0x54080838 0x0 0x2000>;
> +			status =3D "disabled";
> +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_CILAB>,
> +					  <&tegra_car TEGRA210_CLK_CILCD>,
> +					  <&tegra_car TEGRA210_CLK_CILE>;
> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_P>,
> +						 <&tegra_car TEGRA210_CLK_PLL_P>,
> +						 <&tegra_car TEGRA210_CLK_PLL_P>;
> +			assigned-clock-rates =3D <102000000>,
> +					       <102000000>,
> +					       <102000000>;
> +
> +			clocks =3D <&tegra_car TEGRA210_CLK_CSI>,
> +				 <&tegra_car TEGRA210_CLK_CILAB>,
> +				 <&tegra_car TEGRA210_CLK_CILCD>,
> +				 <&tegra_car TEGRA210_CLK_CILE>;
> +			clock-names =3D "csi", "cilab", "cilcd", "cile";
> +
>  		};

Can this be a child of the vi node? Looking at the register ranges it
seems like these are actually a single IP block. If they have separate
blocks with clearly separate functionality, then it makes sense to have
CSI be a child node of VI, though it may also be okay to merge both and
have a single node with the driver doing all of the differentiation
between what's VI and what's CSI.

Looking at later chips, the split between VI and CSI is more explicit,
so having the split in DT for Tegra210 may make sense for consistency.

I know we've discussed this before, but for some reason I keep coming
back to this. I'll go through the other patches to see if I can get a
clearer picture of how this could all work together.

Thierry

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xVGwACgkQ3SOs138+
s6Htyw/+JrPQnVn82x/J0IALFgng73ubFhAn1ygQEOqCVn2aaRoq4OaGnWpxZRj1
SpQs7FBqzYAkbl8XlAUEc8evI0WmQgk6UYutPXVaqnMNMLAryL7hpgaCOsm/y058
81yVFJ+Me1nOZgJmdqKtJfN41h2WPvwwZDdfWpZ8zJzzG+wiCP4OWd9szMup9nzA
FwjDpR3Nyk32ALJxxKXmw3PtrUfE0VzlWR2/ByMolxjtZ6H66sjPHoyO6QgdmKQo
IqRgtvpucSuUDU1Jvs1AYG47uPqsVuD/i7UqukPWHPEO1I4LdtPgS7wdLekBPNqZ
NmQ13J/CpfaaPak47Inqe1yUy17Fs7jWBIimneQzzhD4wY8gn6i6CgRRgOEMqhZl
4R/lxF32owCYHyeyCU0aBo56osX8xD3Gplt8MRLSDolDpbdsdajPJNBEQcdbyQu8
rUS9rxvcuHWJX7sghguZy54P3aEHiUgHuSw4sFVfbgorZpz0xPX0ZUa6XpIpb0Mp
Gg1SlMsIY16JQEXIikgzxwRTKaN2PDcblDscY6W9QOOzSE87g3Hr6V82murkl5PM
2OjfExlpjSr6Tf50WB0jSm4xWlSerJlozODQo/7TPmCjhBFSB4IE92gtZhvEJuLP
7R6g41M/X2rI6YtE8wxFc7dg4I92twzPnZzxEZhN87lIE6B83CA=
=ccse
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
