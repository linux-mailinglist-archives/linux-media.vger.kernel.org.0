Return-Path: <linux-media+bounces-13119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F0905EBC
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE3EDB23175
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BD112C522;
	Wed, 12 Jun 2024 22:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YdI+Ufww"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DBE44C7C;
	Wed, 12 Jun 2024 22:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718232493; cv=none; b=aBg/VHbiMwDfMXVOQC4gmeFHNpXSbvPm3+K+c/Bo/H1bwhUb7kFySAFhg0TAaBAPz0xpbInWAkplDzv5xO2V48pKcYPbxmbiBfWA0GTzMM0z09+8iieioEUmR2GSxvZw+g/UisGNdxH9u4KS9YVlnPfowyck2bsjoV7MC7T9n6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718232493; c=relaxed/simple;
	bh=slTU5LrosP9jA6gyzPOGYb5DuXam96FsUPJkA0eU87c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8HyTGnmvo7Y6cXDffnYaooV92eYXQvPTY5MclzjJLLAUS2LfAbkj48oDbPqnlsHVqMHWZT7WCK7OGB/QKmXo64joDzptdNN2lDqjsI1XSxvJbW8wBt+9YXFyC4XxCG3rw7bHgl6mNTZwI9hxULiUKjMozt1yLc4AEWNC5dIXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YdI+Ufww; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718232490;
	bh=slTU5LrosP9jA6gyzPOGYb5DuXam96FsUPJkA0eU87c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdI+UfwwjhGGHwfkzRZpKNwsx3EcImH9qhCnEp2E0jOG++nFpzqghc1+uC9lZrGll
	 I52EF6lnKxaXLZ2WL0CiAMYMZ+Y3DC6wFetyoO3qkclPXNfnxNykjyROZmJjYviAhF
	 tCn63PhCI6MmDcWd3Ictp763TaNgYuXdZ8NHxaeHKdn90tI+bRjJpwCtgG8dj/z1aa
	 oKzzu4nCBVWcqFZttRzw7Tt96SSPu7d8M8owhI02Bfl3Fy0pauPZs80TvKS/Rf1r9a
	 6g6Yg0vtj7u93rwMh4lCf9vFy3HFmwOAlIJ1Zbno7dCYDdLqDZ/GzWS0p/8H+2EzrJ
	 c9QvnObf4j5XA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E33E737813C0;
	Wed, 12 Jun 2024 22:48:09 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 60F5C10608F7; Thu, 13 Jun 2024 00:48:09 +0200 (CEST)
Date: Thu, 13 Jun 2024 00:48:09 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v5 4/5] arm64: dts: rockchip: Add VEPU121 to RK3588
Message-ID: <z7wc4oukjnniaafrxgigamsubst5g5slkbfkk43fde7t5bh3eb@pxpmoq6d6da4>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <20240612173213.42827-5-sebastian.reichel@collabora.com>
 <8705ad6ba987334f8941938bef19752942a08ace.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7tb3yl2u6zo2ceyh"
Content-Disposition: inline
In-Reply-To: <8705ad6ba987334f8941938bef19752942a08ace.camel@collabora.com>


--7tb3yl2u6zo2ceyh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 04:20:57PM GMT, Nicolas Dufresne wrote:
> Hi Sebastian,
>=20
> Le mercredi 12 juin 2024 =E0 19:15 +0200, Sebastian Reichel a =E9crit=A0:
> > From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> >=20
> > RK3588 has 4 Hantro G1 encoder-only cores. They are all independent IP,
> > but can be used as a cluster (i.e. sharing work between the cores).
> > These cores are called VEPU121 in the TRM. The TRM describes one more
> > VEPU121, but that is combined with a Hantro H1. That one will be handled
> > using the VPU binding instead.
> >=20
> > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 80 +++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boo=
t/dts/rockchip/rk3588s.dtsi
> > index 6ac5ac8b48ab..9edbcfe778ca 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > @@ -1159,6 +1159,86 @@ power-domain@RK3588_PD_SDMMC {
> >  		};
> >  	};
> > =20
> > +	jpeg_enc0: video-codec@fdba0000 {
> > +		compatible =3D "rockchip,rk3588-vepu121";
>=20
> As discussed earlier, VEPU121 is an modifier Hantro H1 encoder core that =
also
> supports VP8 and H.264 encoding (even though RK vendor kernel only expose=
 them
> for jpeg encoding). The compatible follow this idea, shall we change the =
alias
> now?

Makes sense. Do you have any preference for the alias Heiko?
Maybe vepu121_0 / vepu121_0_mmu?

-- Sebastian

>=20
> Nicolas
>=20
> > +		reg =3D <0x0 0xfdba0000 0x0 0x800>;
> > +		interrupts =3D <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
> > +		clock-names =3D "aclk", "hclk";
> > +		iommus =3D <&jpeg_enc0_mmu>;
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +	};
> > +
> > +	jpeg_enc0_mmu: iommu@fdba0800 {
> > +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> > +		reg =3D <0x0 0xfdba0800 0x0 0x40>;
> > +		interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
> > +		clock-names =3D "aclk", "iface";
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +		#iommu-cells =3D <0>;
> > +	};
> > +
> > +	jpeg_enc1: video-codec@fdba4000 {
> > +		compatible =3D "rockchip,rk3588-vepu121";
> > +		reg =3D <0x0 0xfdba4000 0x0 0x800>;
> > +		interrupts =3D <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
> > +		clock-names =3D "aclk", "hclk";
> > +		iommus =3D <&jpeg_enc1_mmu>;
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +	};
> > +
> > +	jpeg_enc1_mmu: iommu@fdba4800 {
> > +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> > +		reg =3D <0x0 0xfdba4800 0x0 0x40>;
> > +		interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
> > +		clock-names =3D "aclk", "iface";
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +		#iommu-cells =3D <0>;
> > +	};
> > +
> > +	jpeg_enc2: video-codec@fdba8000 {
> > +		compatible =3D "rockchip,rk3588-vepu121";
> > +		reg =3D <0x0 0xfdba8000 0x0 0x800>;
> > +		interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
> > +		clock-names =3D "aclk", "hclk";
> > +		iommus =3D <&jpeg_enc2_mmu>;
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +	};
> > +
> > +	jpeg_enc2_mmu: iommu@fdba8800 {
> > +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> > +		reg =3D <0x0 0xfdba8800 0x0 0x40>;
> > +		interrupts =3D <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
> > +		clock-names =3D "aclk", "iface";
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +		#iommu-cells =3D <0>;
> > +	};
> > +
> > +	jpeg_enc3: video-codec@fdbac000 {
> > +		compatible =3D "rockchip,rk3588-vepu121";
> > +		reg =3D <0x0 0xfdbac000 0x0 0x800>;
> > +		interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
> > +		clock-names =3D "aclk", "hclk";
> > +		iommus =3D <&jpeg_enc3_mmu>;
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +	};
> > +
> > +	jpeg_enc3_mmu: iommu@fdbac800 {
> > +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> > +		reg =3D <0x0 0xfdbac800 0x0 0x40>;
> > +		interrupts =3D <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks =3D <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
> > +		clock-names =3D "aclk", "iface";
> > +		power-domains =3D <&power RK3588_PD_VDPU>;
> > +		#iommu-cells =3D <0>;
> > +	};
> > +
> >  	av1d: video-codec@fdc70000 {
> >  		compatible =3D "rockchip,rk3588-av1-vpu";
> >  		reg =3D <0x0 0xfdc70000 0x0 0x800>;
>=20

--7tb3yl2u6zo2ceyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZqJagACgkQ2O7X88g7
+pqxQQ//VsqbXgRf3YcGI2GRUh9bHPx0q7Xdz6/WkO2lH5GIiYtUzHNwPRi//qMF
ZZZhvluCdhOV5T/JXb3itDzqSD8EKYDvHnQcASYBI6G2crL+NBbz6+Wzoc2y70us
FXv3ZNb4lDc4vdA4ShsQA9hlhXdGzOp/7rreDCCEaY8bNQhU+Rhof9jxWJ8iiamv
ohr6GGqWqFVWfiL/52+OWMir739DlX8ZWtPXQolmASgwegJ4n414+b8b/y9oUG89
w56ph/UxeGVk90EInOlyeWztBAvbPINdQPjNSwOBuyhzpYomTGqUF1ddiFc5JNaA
yfblq7KpmdejI4pO4uqedHr9nRPqbEp+WFg2r1Mcda1kgVGvvJfSMb80k9ta+G+t
JdN5I46B+qY5GP2l38q8Q8JrMnW2JOsKBX3EKVN56GQICJEdWQ2xs556frOG7E/m
Zc2fkOZRZcCLmpwo8D5LN+3SkH/W9TieEndhpQNdywfeB9liAAF9v/Krx2PJ1dHx
zB1gqIYh7IVm6wEHpXyjTmPz+ojsoQPLnNVQNNU6kUjNsYX1WWPHqHAL1jw5nsg4
2yyx150ixipyUyvCz931EF02u3DP7z0oeTM419G5XzXjF9WXats0OXFCsXUuhNED
II2k0oglhpgKP2rowX9SugUs5Hc8dLffggRLlP1QdL90U1rRiSw=
=UAah
-----END PGP SIGNATURE-----

--7tb3yl2u6zo2ceyh--

