Return-Path: <linux-media+bounces-13120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC41905EC0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2069028252A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A57E12C53B;
	Wed, 12 Jun 2024 22:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M03AXqp+"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19091A34;
	Wed, 12 Jun 2024 22:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718232616; cv=none; b=mHQ/Ubs273OqyuG8AxPOf6KonW5NOzX2JOzp/9Lq+Nx/U/hAjfNPvmiJeuZj4nat3muJMQrZ5b3IUZouj8XVthA8+faVn/zn5GZ33Tcq9ZdqZlS1EVadI9zuKTxKktwCJc01UPuUmTvZ00a/QNcRsvSDmlhZ6MZzAS/QhGtTC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718232616; c=relaxed/simple;
	bh=nQBUQxKVLaOTYlGiXMpfNNkyEXmMpY+rvHsBQVfUZfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfp8w7Ln6BETxf2HevTdfYLWH0ANysoj8YOyNVTtOjZXMWtZ/fPRNhIyzmxshcs9XOmwUbdCFW0XL6ex5OVK3/Ug+AbRZh1O9TpKVg52T5XSQIv1XN//aW6Sn6+oWbepQCLvSTqHxp4WfN+h07wwIgsxXPPphEdO5X90pJLy+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M03AXqp+; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718232613;
	bh=nQBUQxKVLaOTYlGiXMpfNNkyEXmMpY+rvHsBQVfUZfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M03AXqp+0rW3ICY6A8JD8IoVgo1bFtXKycx+4AuMAaSB3Xx9db4TbfBYN8zIqL1aM
	 aHJXiD00mhL6C42dIfMk7SzLj13Lago4wa1/ADh9BRqtdOjjt2dTuxr2BWr/6EUZDY
	 m0iRj5spDVMBHCHupZY+uJ+lfiv/8GGHMd+8qJ0tJPG2njsvx/O7zhmtssO53x64/o
	 SbXHXzO7jfha2HOqbXRxKfTSXxtPN0IWAriKrG6TapdoEtxhftEBtoTbzVN5dIwfUm
	 BFZf7iIOlklNE8pGExqolo1E8m6ywLtN0BB2E2iL58XT0s6hP8D960RrF7wrmPKjGj
	 s5ZiTbtWcmmwg==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2DE7337813C0;
	Wed, 12 Jun 2024 22:50:13 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 9AC8E10608F7; Thu, 13 Jun 2024 00:50:12 +0200 (CEST)
Date: Thu, 13 Jun 2024 00:50:12 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, Hugh Cole-Baker <sigmaris@gmail.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: rockchip: Add VPU121 support for
 RK3588
Message-ID: <r7zxxruucz5agn4wjyugzn6rblodw47n5hufooysx773ub6ccl@ni7l6q2e6d3y>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <20240612173213.42827-6-sebastian.reichel@collabora.com>
 <4207056.GSNtieVc0Q@bagend>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfg47polgte7e7hz"
Content-Disposition: inline
In-Reply-To: <4207056.GSNtieVc0Q@bagend>


--wfg47polgte7e7hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 08:10:30PM GMT, Diederik de Haas wrote:
> On Wednesday, 12 June 2024 19:15:45 CEST Sebastian Reichel wrote:
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> > 9edbcfe778ca..e7e1b456b9b9 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > @@ -1239,6 +1239,27 @@ jpeg_enc3_mmu: iommu@fdbac800 {
> >                 #iommu-cells =3D <0>;
> >         };
> >=20
> > +       vpu: video-codec@fdb50000 {
> > +               compatible =3D "rockchip,rk3588-vpu121",
> > "rockchip,rk3568-vpu"; +               reg =3D <0x0 0xfdb50000 0x0 0x80=
0>;
> > +               interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
> > +               interrupt-names =3D "vdpu";
> > +               clocks =3D <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> > +               clock-names =3D "aclk", "hclk";
> > +               iommus =3D <&vpu_mmu>;
> > +               power-domains =3D <&power RK3588_PD_VDPU>;
> > +       };
> > +
> > +       vpu_mmu: iommu@fdb50800 {
> > +               compatible =3D "rockchip,rk3588-iommu",
> > "rockchip,rk3568-iommu"; +               reg =3D <0x0 0xfdb50800 0x0 0x=
40>;
> > +               interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
> > +               clock-names =3D "aclk", "iface";
> > +               clocks =3D <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> > +               power-domains =3D <&power RK3588_PD_VDPU>;
> > +               #iommu-cells =3D <0>;
> > +       };
> > +
> >         av1d: video-codec@fdc70000 {
>=20
> Shouldn't these nodes come *before*=20
> jpeg_enc0: video-codec@fdba0000=20
> As fdb50000 is lower then fdba0000?

Of course. I will fix that in v6.

-- Sebastian

--wfg47polgte7e7hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZqJiMACgkQ2O7X88g7
+prMHw/+KUizkP3UyEenXwGeOVPBehTauSjXoE/h2KTeuHCzFFm5Xd/WC7tB5Sz+
6T29txSA4Zla5v3P3dP5lwUNqn0PTU5hkfxw3bR/iAlGRLTD8VcYKW7BdC6ow94l
O1hBX1wGP2D/f6l59SvFpF9j8zWRb10xUuzpVLI+1uwY5n01iJWfzxOBMPeWIeHF
8K+XClLnZChzJklVmjlfxleI5Xl8SUQVMCIufwCiX6+WOcqiYIK1KJF0fqQ7zM34
3xwElK9I1limJXCPMnXbu4g3F6GvA90FGoweVHfjOM27tpqibV2z6fXWXg1ztsJ2
ZMOP1bD6oXXqsm8pOJYfc+ClTS5pXUDT1U6yCcfG4RtKAsIoMg86BAgHlBCxEemF
IwxV1hiwol6/do7EehKJaP1zO8VrvtBFIT4TxyvME0M7SBynP278ixgpRBsGh7c+
/pka7BWJx4srb0wrcoeQ3xNeO+ZkeaA3kWHcQR4gQlNqJaQre5xnVHr07i2EipRB
jNSBNgp11NhA5c3Vn4EMgbydVT0Cspl5B9aBQE6eGrywf9JAzCmOKVKyg7WgR+6x
9hmJ2Q+y3K9IDA3WpfanY3xcakaAnP1M29blchf1TQJipn3+n3eQN27pYqpdCVrt
ru6i1eb1EmZ95k3LtEUOV89WJdvIiJDsFSDkToBNcG+miIhrbvQ=
=UnLa
-----END PGP SIGNATURE-----

--wfg47polgte7e7hz--

