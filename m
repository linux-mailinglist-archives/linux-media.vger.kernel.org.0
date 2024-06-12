Return-Path: <linux-media+bounces-13107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDD905CAE
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A90D2872A2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8815984D29;
	Wed, 12 Jun 2024 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IWbVAQlh"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD484A50;
	Wed, 12 Jun 2024 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718223666; cv=none; b=GyPk6/hdoMySI975yreUIXTU8IOn4YYqtGy9mVIfraCNJEhmNPmBAU7DPqkwhl/NH/gn/fCK7KcOGtC5XdxLbb30S5M47J4ZkL5sgzyCi59OkHiynkh7FRGSjgBOTqYkC/8KZzQ2UC3P6s4IkfoL/yCzWgTjzz11DvT98enygn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718223666; c=relaxed/simple;
	bh=PHlVC2D76puZdSZINuqZtuUlXaqfJ96wvZFNLjvHtfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rOhStKHVwmI3O1FzpxPZI4nA3z57vf4RH3jiWetMSAMau8bjP9BrjUQDcC8wzSiQZXCHFOQREvZ91OSI2UGuyh6SJKUdsdrUP/Ae60GZfImd2uFOsIeQcVLwOw/VpPdCftwlfObpTEvPpFRNYx1HTGL+85D9mvJTDrdNvKfZoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IWbVAQlh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718223661;
	bh=PHlVC2D76puZdSZINuqZtuUlXaqfJ96wvZFNLjvHtfc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IWbVAQlhH95bx5fqaubBcoIIS0eDvUAbqa+C4wjuNtjD7IQdVD6HTT0fdSMesayjk
	 IwYl7CC8Pn6XIh+NtQB82xCNCazbeEnYAHE1fxMYinG2Ww6u4DUrimbf4x84l/du7m
	 30R4M3bN3R/n24geqRNthBfVLdFJI0fSW5eKGPyUiLpsYmp7oJ90aOI03ZezUB26YA
	 /a3VZP/zhCR0wFnBJqmKVxKA2Z55VQmtuB+e3uzBd30iWAr0M05aq9eFoQbsVnDibt
	 0ckK7keaAroSCMHFV7Pk4mliY1MPvcWqSA2wJHGalbKlrfBnyRntsYLPXpkinx5Bwn
	 bKFmxetDKvvpQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F0517378020D;
	Wed, 12 Jun 2024 20:20:59 +0000 (UTC)
Message-ID: <8705ad6ba987334f8941938bef19752942a08ace.camel@collabora.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: rockchip: Add VEPU121 to RK3588
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Heiko Stuebner
 <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Jianfeng Liu
 <liujianfeng1994@gmail.com>, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 kernel@collabora.com
Date: Wed, 12 Jun 2024 16:20:57 -0400
In-Reply-To: <20240612173213.42827-5-sebastian.reichel@collabora.com>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
	 <20240612173213.42827-5-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sebastian,

Le mercredi 12 juin 2024 =C3=A0 19:15 +0200, Sebastian Reichel a =C3=A9crit=
=C2=A0:
> From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>=20
> RK3588 has 4 Hantro G1 encoder-only cores. They are all independent IP,
> but can be used as a cluster (i.e. sharing work between the cores).
> These cores are called VEPU121 in the TRM. The TRM describes one more
> VEPU121, but that is combined with a Hantro H1. That one will be handled
> using the VPU binding instead.
>=20
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/=
dts/rockchip/rk3588s.dtsi
> index 6ac5ac8b48ab..9edbcfe778ca 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -1159,6 +1159,86 @@ power-domain@RK3588_PD_SDMMC {
>  		};
>  	};
> =20
> +	jpeg_enc0: video-codec@fdba0000 {
> +		compatible =3D "rockchip,rk3588-vepu121";

As discussed earlier, VEPU121 is an modifier Hantro H1 encoder core that al=
so
supports VP8 and H.264 encoding (even though RK vendor kernel only expose t=
hem
for jpeg encoding). The compatible follow this idea, shall we change the al=
ias
now ?

Nicolas

> +		reg =3D <0x0 0xfdba0000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&jpeg_enc0_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	jpeg_enc0_mmu: iommu@fdba0800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdba0800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
> +	jpeg_enc1: video-codec@fdba4000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdba4000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&jpeg_enc1_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	jpeg_enc1_mmu: iommu@fdba4800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdba4800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
> +	jpeg_enc2: video-codec@fdba8000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdba8000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&jpeg_enc2_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	jpeg_enc2_mmu: iommu@fdba8800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdba8800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
> +	jpeg_enc3: video-codec@fdbac000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdbac000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&jpeg_enc3_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	jpeg_enc3_mmu: iommu@fdbac800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdbac800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
>  	av1d: video-codec@fdc70000 {
>  		compatible =3D "rockchip,rk3588-av1-vpu";
>  		reg =3D <0x0 0xfdc70000 0x0 0x800>;


