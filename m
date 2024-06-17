Return-Path: <linux-media+bounces-13448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855D90B39E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7A62829CD
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB2F15748B;
	Mon, 17 Jun 2024 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KqzVY2sQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2922156F55;
	Mon, 17 Jun 2024 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634740; cv=none; b=SpqMctCG0Yz92DXwpagiuirI3SFe03+uZTV2S2p3mmz+OOuG8kd8ei/fcM9nA0ME4A95+6I0Vl9kaU9Py/0wVD49pGHlsyfUeZAUMH8sgOCNnUytyonZpuz2DHbhcRezuzZo5fWAK3zSDM83McO6Fv8sOaff5sLUPLRT4XPBvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634740; c=relaxed/simple;
	bh=805DLgkp9pR7BeifN0rM2FT3I1kdmGmIhRj7kRB0Zhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jpn9FKc2DLxhVu5+3yz7sou9GLRFue/aM7StsmIMAFWLYCeZ0BJnQc5KRNa5IMUnPIx+YxYb0Vbcwy7IvvRLtyo/KV7m9QOFvE2ucdfzxE9dyo72O3EPhRbBw4mX1x1McQmji0ywdTQdoY3fHPZ4F/FsIcte8j7vHQ9TWu6+rIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KqzVY2sQ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718634736;
	bh=805DLgkp9pR7BeifN0rM2FT3I1kdmGmIhRj7kRB0Zhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KqzVY2sQkQgxM1g0h0c23h5ij2HG8f8AV/Ym+S20KO01NnqkbmiOihwxv3etswF9P
	 PIV1181mU2H9M+Ax3Gqfvy2Is8KFW7RKjOiAhR5xHiw8f3iMVnUJA8wBuBatSloa3r
	 xc1y6tDBotm/DarwfxchCa0YsTgzsd8hCrpCT9tk9cFsJ6v5fQCDzM/1KzCZnnOiw8
	 5sc/5smxFCXxYb0jVdc2Za+kyEORzM8ctPxEa2R90Ngj+6W03bfDujvgsTeizZcm1X
	 b8Vv38uiMY//KKN/jxjPp9pKJf0qAnDe/MvatkU2utIcuTBnCJFJqXImx/4JsOyC+q
	 Eleoy86hyQpFg==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE28737812FD;
	Mon, 17 Jun 2024 14:32:13 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject:
 Re: [PATCH 3/3] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Mon, 17 Jun 2024 10:31:47 -0400
Message-ID: <4516494.Mh6RI2rZIc@arisu>
Organization: Collabora
In-Reply-To: <6812626.ejJDZkT8p0@phil>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <3666279.iZASKD2KPV@arisu> <6812626.ejJDZkT8p0@phil>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5950169.R56niFO833";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5950169.R56niFO833
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>
Date: Mon, 17 Jun 2024 10:31:47 -0400
Message-ID: <4516494.Mh6RI2rZIc@arisu>
Organization: Collabora
In-Reply-To: <6812626.ejJDZkT8p0@phil>
MIME-Version: 1.0

On Sunday, June 16, 2024 3:28:25 A.M. EDT Heiko Stuebner wrote:
> Am Samstag, 15. Juni 2024, 21:55:54 CEST schrieb Detlev Casanova:
> > On Saturday, June 15, 2024 4:25:27 A.M. EDT Jonas Karlman wrote:
> > > Hi Detlev,
> > > 
> > > On 2024-06-15 03:56, Detlev Casanova wrote:
> > > > Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> > > > 
> > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > > ---
> > > > 
> > > >  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
> > > >  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
> > > >  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19
> > > >  +++++++++++++++++++
> > > >  3 files changed, 27 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
> > > > c551b676860c..965322c24a65 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > > @@ -503,6 +503,10 @@ &pwm1 {
> > > > 
> > > >  	status = "okay";
> > > >  
> > > >  };
> > > > 
> > > > +&rkvdec0 {
> > > > +	status = "okay";
> > > > +};
> > > 
> > > Enable of rkvdec0 should probably be split out from the patch that adds
> > > the rkvdec0 node to soc dtsi.
> > 
> > Ack
> > 
> > > Also why is rkvdec0 only enabled on rock-5b and orangepi-5?
> > 
> > I only could test on those two but I can enable it on all rk3588 devices.
> > 
> > > > +
> > > > 
> > > >  &saradc {
> > > >  
> > > >  	vref-supply = <&avcc_1v8_s0>;
> > > >  	status = "okay";
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > > > b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts index
> > > > feea6b20a6bf..2828fb4c182a 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > > > @@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
> > > > 
> > > >  	};
> > > >  
> > > >  };
> > > > 
> > > > +&rkvdec0 {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > 
> > > >  &saradc {
> > > >  
> > > >  	vref-supply = <&avcc_1v8_s0>;
> > > >  	status = "okay";
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > > b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> > > > 0fecbf46e127..09672636dcea 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > > @@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
> > > > 
> > > >  		ranges = <0x0 0x0 0xff001000 0xef000>;
> > > >  		#address-cells = <1>;
> > > >  		#size-cells = <1>;
> > > 
> > > Blank line is missing.
> > > 
> > > > +		rkvdec0_sram: rkvdec-sram@0 {
> > > > +			reg = <0x0 0x78000>;
> > > > +		};
> > > > 
> > > >  	};
> > > >  	
> > > >  	pinctrl: pinctrl {
> > > > 
> > > > @@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
> > > > 
> > > >  			#interrupt-cells = <2>;
> > > >  		
> > > >  		};
> > > >  	
> > > >  	};
> > > > 
> > > > +
> > > > +	rkvdec0: video-decoder@fdc38100 {
> > > > +		compatible = "rockchip,rk3588-vdec2";
> > > > +		reg = <0x0 0xfdc38100 0x0 0x500>;
> > > > +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>,
> > 
> > <&cru
> > 
> > > > CLK_RKVDEC0_CORE>, +			 <&cru
> > 
> > CLK_RKVDEC0_CA>, <&cru
> > 
> > > > CLK_RKVDEC0_HEVC_CA>;
> > > > +		clock-names = "axi", "ahb", "core",
> > > > +			      "cabac", "hevc_cabac";
> > > > +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru
> > 
> > CLK_RKVDEC0_CORE>,
> > 
> > > > +				  <&cru CLK_RKVDEC0_CA>, <&cru
> > 
> > CLK_RKVDEC0_HEVC_CA>;
> > 
> > > > +		assigned-clock-rates = <800000000>, <600000000>,
> > > > +				       <600000000>, 
<1000000000>;
> > > > +		power-domains = <&power RK3588_PD_RKVDEC0>;
> > > 
> > > iommus and resets should probably be added.
> > > 
> > > > +		status = "disabled";
> > > > +	};
> > > 
> > > The iommu node for rkvdec0_mmu seem to be missing, is it not required to
> > > be able to use memory >4GiB as decoding buffers?
> > 
> > I need to check if the current rockchip iommu driver will work for this
> > decoder. I remember that the iommu code for AV1 was a bit different, not
> > sure about this rkvdec.
> > 
> > > I would also consider adding the rkvdec1 node(s), if I am understanding
> > > correctly they can both be used in a cluster or completely independent.
> > 
> > They can be used independently, yes. I'll add rkvdec1 for rk3588 devices
> > (rk3588s only has  1 core)
> 
> Please check in with Sebastian Reichel about clusters/independent
> controllers. He had a lot of fruitful discussions for the VEPU121/VPU121
> support he is working on.

Yes, basically, it makes the driver check for all nodes with the same 
compatible and list the instances in the same device instance.
If multicore is not supported, the other instances can simple be ignored.

See here: https://lore.kernel.org/linux-kernel/20240613135034.31684-4-sebastian.reichel@collabora.com/

> Baseline being, while we want the hw to be described correctly wrt the
> multiple instances, we don't generally want to expose them individually
> to userspace, because that would then require userspace to do all the
> scheduling.

Yes, so Sebastien's patch will allow the device tree to have the 2 cores but 
only one visible by the userspace (even when multicore decoding is not 
supported)
--nextPart5950169.R56niFO833
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZwSNMACgkQ5EFKUk4x
7bY40wf8CPB1cOTqNL4/SRVRvFjp+r2vL+RGt8BTQ+YJhKfJalFBQZhm4a6NfpOZ
I/vY+oQGG7Fw71b+dN7hsMfZQjwV2brQ74RpnA4rUZE70qtMSwFJ77zZjIi6PTIc
TKHbG2Y64D1kREJ6oth1eWR+vs4DvGSi3oO6G7mal5sQvm5nxI8LHCKTQzED1BZ0
52GKtGbl+vM/MHYEmfLPK7d5rzEX/attsFNvnY2iFDC8kGsU8DnZpburOQK1dKdh
Ty43ugRdRrgerCVgjdvBr96sVAS+pB/8oQiBhiKHd+P1bNKz7y32mwrrZOYDBv/B
4zoAQgxaAoY/WYZFJ1BMk4sZb1EAeg==
=jqLk
-----END PGP SIGNATURE-----

--nextPart5950169.R56niFO833--




