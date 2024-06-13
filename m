Return-Path: <linux-media+bounces-13207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA399079AE
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 19:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B737A281D96
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 17:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B019514A0BC;
	Thu, 13 Jun 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="llsDK23Y"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D56D145FFD;
	Thu, 13 Jun 2024 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299288; cv=none; b=rhQcDJ0kE7xMESAWKTzVnNiU51QPLCAbnIW4GBng1gm3g43LjmOrFmDHIA8PlMdzQhjwVOXnwM9JP16O4S5mFELM2cnZwm3VYqU8gxXKK6zKsWbD3YNS9oVwY7dJgcwYGNj5pFGok6senXuv9V3/rxxkYpqDkxIhHjj/791Wd9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299288; c=relaxed/simple;
	bh=oQpR3WqnngfQNJeUbEy88r36UtSxS3u5kZrjD+GeDi0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+vmUTvUB6FkQfMnLmnY/zQSzOv/n4z/SW7WIS4S/fSKnux4WkKtVYAN5IiXVnkBUb3VNcBBWLCIN70Q9kJxCPpilX2izt5estqt8X8nMRWvaGEFrXznjzw77PBBCfpaFQduV2cCfpPiyeC1YtM2G9jFS/WlemIjsVSQIImOluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=llsDK23Y; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718299284;
	bh=oQpR3WqnngfQNJeUbEy88r36UtSxS3u5kZrjD+GeDi0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=llsDK23YX1btoiKV3FQ9dsccXLlI05kxWEIs0kEr0eIOhxZ/T5Yjxd12/qEsK61ds
	 yvLDsaU542aYUx60VvJPvGIdPerlpY9+QfijAuOlUHs4l9mQDe6QGku80UXhPfQoXu
	 N3vA8ZZI1uYDM3Vaidr4MmfJJcKFmmhd0RwqHsrtfiodk7tekw5hiuMdN0cwhKu0c/
	 9fnwXbRY1tPP1vRb3I9VDqginw4NghLU7IpLZC8xrXJnMG0vncSfQ531ygQoqFortR
	 3jkkwvUHTeAKJap9MgyzmUfRnCjG2iLuxJIS92V1OwWzrzfnpcGE8Xccu+fz7Yj4n1
	 UkQ9CNAEnV82Q==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BCA943781139;
	Thu, 13 Jun 2024 17:21:18 +0000 (UTC)
Message-ID: <c9d1704ee28d1dc3d187308b03cb5278c1bf723b.camel@collabora.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: rockchip: Add VEPU121 to RK3588
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
Date: Thu, 13 Jun 2024 13:21:04 -0400
In-Reply-To: <20240613135034.31684-6-sebastian.reichel@collabora.com>
References: <20240613135034.31684-1-sebastian.reichel@collabora.com>
	 <20240613135034.31684-6-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 13 juin 2024 =C3=A0 15:48 +0200, Sebastian Reichel a =C3=A9crit=C2=
=A0:
> From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>=20
> RK3588 has 4 Hantro G1 encoder-only cores. They are all independent IP,
               Hantro H1

H1 is the encoder core, G1 is the decoder core, and this exists as a combo =
on
this platform (vpu121).

> but can be used as a cluster (i.e. sharing work between the cores).
> These cores are called VEPU121 in the TRM. The TRM describes one more
> VEPU121, but that is combined with a Hantro H1. That one will be handled
> using the VPU binding instead.
>=20
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/=
dts/rockchip/rk3588s.dtsi
> index 6ac5ac8b48ab..dd85d4e55922 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -1159,6 +1159,86 @@ power-domain@RK3588_PD_SDMMC {
>  		};
>  	};
> =20
> +	vepu121_0: video-codec@fdba0000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdba0000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&vepu121_0_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	vepu121_0_mmu: iommu@fdba0800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdba0800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
> +	vepu121_1: video-codec@fdba4000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdba4000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&vepu121_1_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	vepu121_1_mmu: iommu@fdba4800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdba4800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
> +	vepu121_2: video-codec@fdba8000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdba8000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&vepu121_2_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	vepu121_2_mmu: iommu@fdba8800 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdba8800 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +		#iommu-cells =3D <0>;
> +	};
> +
> +	vepu121_3: video-codec@fdbac000 {
> +		compatible =3D "rockchip,rk3588-vepu121";
> +		reg =3D <0x0 0xfdbac000 0x0 0x800>;
> +		interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
> +		clock-names =3D "aclk", "hclk";
> +		iommus =3D <&vepu121_3_mmu>;
> +		power-domains =3D <&power RK3588_PD_VDPU>;
> +	};
> +
> +	vepu121_3_mmu: iommu@fdbac800 {
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


