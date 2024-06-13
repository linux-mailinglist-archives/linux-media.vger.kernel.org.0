Return-Path: <linux-media+bounces-13216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E44907EB3
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 00:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42ABEB2104D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 22:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4368714B94C;
	Thu, 13 Jun 2024 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BosEc/lA"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B51369BE;
	Thu, 13 Jun 2024 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718317007; cv=none; b=WRnl9sL0LzqsvM6zYtZ2uYyfKpVqmP5Daayoe8Wx2Uh3PJWn+uFsHvE07lRrFfpPmFRAg2lRcYlS1hUfbvbTk0MdSE5ssUmoXhntt2zDA+LlV648F7d9wbZY7V4j1l45RvpM00l9auaHLJiKMP/TNk2vDfxBmYro6boF430SXl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718317007; c=relaxed/simple;
	bh=H6GHq9+Uf+rJk6Vo53ar+G44bfZAHGauc8k+5SO/pc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx/HyTlVxpHB4qhu1SlYlq21nJNue3jYAauwLk7qfHjR1qghO1D6PNe+84sT9RmfRrUOc8cfmI5+qBrGb1hI+OSJORN0Efd5uVbRBNUsml4V+kysN/XCOc0tGyIfHigV6sek+C3nXS3KPD0IJ2mWReohd7BHV3KWLWfAtESLg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BosEc/lA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718317003;
	bh=H6GHq9+Uf+rJk6Vo53ar+G44bfZAHGauc8k+5SO/pc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BosEc/lA4iOVOZeUH8LC9DYkCcCkQNqnMw22HxRF4RUTLJQ2/W8SHsV1Yc2ZjJcXR
	 sJLzizZghM2BMJtCs9RwbfbTNU46OzUfxDeUFbbCf4tVGalKPC9zEatLs2S7u6bUR6
	 xlVS2zemYr7sRArDKxIIIch6K80PCQa8AYck3wiKwAzMKG9H60SM99GhAPVbRjHtm0
	 sZedgkDlwObcy9bYI9kJCal+xvYBPgmSi2R49nlDqRZKAsRIN5ZMTLW2LTroqyjjck
	 GEMZD+4pVLKsjD/UDViYb1YHSU24df/ijWRkTrqeEiuriUyXTY0gv2InhK/SV04MEY
	 hMAILiQXMpCmg==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FCB73780C6C;
	Thu, 13 Jun 2024 22:16:43 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id DDF9910608F7; Fri, 14 Jun 2024 00:16:42 +0200 (CEST)
Date: Fri, 14 Jun 2024 00:16:42 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/9] arm64: dts: rockchip: Add nodes for NPU and its MMU
 to rk3588s
Message-ID: <rrmiv7lwj2refsmmdijwpccniw5chnyoma2gxcueeemxypbodx@mjpdrbqs37ce>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zspmvcykvofgqjiu"
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>


--zspmvcykvofgqjiu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 03:52:57PM GMT, Tomeu Vizoso wrote:
> See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
>=20
> This is a derivative of NVIDIA's NVDLA, but with its own front-end
> processor.
>=20
> Mostly taken from downstream.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

Looking at the TRM I noticed, that this register is not mapped:

RKNN_global_operation_enable
Address: Operational Base + offset (0xF008)

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 53 +++++++++++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/=
dts/rockchip/rk3588s.dtsi
> index 6ac5ac8b48ab..a5d53578c8f6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -2665,6 +2665,59 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells =3D <2>;
>  		};
>  	};
> +
> +	rknn: npu@fdab0000 {
> +		compatible =3D "rockchip,rk3588-rknn", "rockchip,rknn";
> +		reg =3D <0x0 0xfdab0000 0x0 0x9000>,
> +		      <0x0 0xfdac0000 0x0 0x9000>,
> +		      <0x0 0xfdad0000 0x0 0x9000>;
> +		interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names =3D "npu0_irq", "npu1_irq", "npu2_irq";
> +		clocks =3D <&scmi_clk SCMI_CLK_NPU>, <&cru ACLK_NPU0>,
> +			 <&cru ACLK_NPU1>, <&cru ACLK_NPU2>,
> +			 <&cru HCLK_NPU0>, <&cru HCLK_NPU1>,
> +			 <&cru HCLK_NPU2>, <&cru PCLK_NPU_ROOT>;
> +		clock-names =3D "clk_npu",
> +			      "aclk0", "aclk1", "aclk2",
> +			      "hclk0", "hclk1", "hclk2",
> +			      "pclk";
> +		assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> +		assigned-clock-rates =3D <200000000>;
> +		resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_A_RKNN1>, <&cru SRST_A_RKNN=
2>,
> +			 <&cru SRST_H_RKNN0>, <&cru SRST_H_RKNN1>, <&cru SRST_H_RKNN2>;
> +		reset-names =3D "srst_a0", "srst_a1", "srst_a2",
> +			      "srst_h0", "srst_h1", "srst_h2";
> +		power-domains =3D <&power RK3588_PD_NPUTOP>,
> +				<&power RK3588_PD_NPU1>,
> +				<&power RK3588_PD_NPU2>;
> +		power-domain-names =3D "npu0", "npu1", "npu2";
> +		iommus =3D <&rknn_mmu>;
> +		status =3D "disabled";
> +	};
> +
> +	rknn_mmu: iommu@fdab9000 {
> +		compatible =3D "rockchip,rk3588-iommu";
> +		reg =3D <0x0 0xfdab9000 0x0 0x100>,
> +		      <0x0 0xfdaba000 0x0 0x100>,
> +		      <0x0 0xfdaca000 0x0 0x100>,
> +		      <0x0 0xfdada000 0x0 0x100>;
> +		interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names =3D "npu0_mmu", "npu1_mmu", "npu2_mmu";
> +		clocks =3D <&cru ACLK_NPU0>, <&cru ACLK_NPU1>, <&cru ACLK_NPU2>,
> +			 <&cru HCLK_NPU0>, <&cru HCLK_NPU1>, <&cru HCLK_NPU2>;
> +		clock-names =3D "aclk0", "aclk1", "aclk2",
> +			      "iface0", "iface1", "iface2";
> +		#iommu-cells =3D <0>;
> +		power-domains =3D <&power RK3588_PD_NPUTOP>,
> +				<&power RK3588_PD_NPU1>,
> +				<&power RK3588_PD_NPU2>;
> +		power-domain-names =3D "npu0", "npu1", "npu2";
> +		status =3D "disabled";
> +	};
>  };
> =20
>  #include "rk3588s-pinctrl.dtsi"
>=20
> --=20
> 2.45.2
>=20
>=20

--zspmvcykvofgqjiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZrb8cACgkQ2O7X88g7
+pp7Cg/+NCeY7EqR6sVyOOVSi/PrBFnVjcHw6BjQgMwiP8UMdW034jc+YCDpUOtM
GLyYAe491EldwputLm6HNquT4/ad0/28h0HVzXHKeu6ulTga/j5rNV79GYyDhwTJ
h+ror+9q3BquIkAjiKc9wPEQyL32hr0eBom8Q1yzPwEcF140VO/StE/YRC+aeZca
UZ8f4lfJnR8M8TIb7uV4KWIkPDSbJtqxoYWseX5+Z0xDdnkIScgP0MgleLcsJIr5
m+3OC/Ln+jjRZq5uEaN19gHWeMZS2YJX4q79TYCc/qbztzXQWpahLoMnx7ZahUDN
Nwb/wQF12rOO4Pxiveex6Z9rkf1PQz/Vy6G1AQM7XQSpZcTt7Qi+bqcuSzKDiBXB
KDFKOyvbRbRshWrTUTep6IkrL4Y+RIezL9k06JTA6iRX8jcininTf4ZZ8EDpKgJl
+houmNpaxasXiknJfcFltFDKYT09WTLUNaTi7MszTCSt0Spk/dXhHXmcczOWK/Q1
3aVL56LpdzKZIby//ncK2VZxTZv1eLhEMdTeU5FlvzfyFBU7HwqTfAzyrKOUvu1j
q0UmDYg7x0w9y/eeBY8BSGF81h223yUb2hg2BDIXJw8fLZQQrnjSnemyBgjtJ0Cn
Smr9JW2zV38Lq64iR5WiETtr/hrVZe0PiVhyqWGsxS1PRPIGpZ4=
=qyNK
-----END PGP SIGNATURE-----

--zspmvcykvofgqjiu--

