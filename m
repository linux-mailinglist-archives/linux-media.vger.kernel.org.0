Return-Path: <linux-media+bounces-14117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC5916F6C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 19:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60BFA1C25B4E
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 17:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58A17554C;
	Tue, 25 Jun 2024 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dE11m+b9"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FC147C74;
	Tue, 25 Jun 2024 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719337285; cv=none; b=NSJ9ck4E8cJgOxtKiUMa7rlZ7ZFk87SZo0JTN/DQ+OAYl/WXoXPpfwQ5wofN46td688IsY+RJKrEQ62kz4sRE69D3M0ITDKNCYRcOunIZc9ka+zLTdGjSLCK6FbLQJWjKQiBvheAnfTFwsTSsR7TTDT9q9e15OcQuIppaxL2IXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719337285; c=relaxed/simple;
	bh=SpYw8cVTSv38pw6L8vipG+mNWuwy7NhLdes7jhapxkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XW6zarm7OTvl0IbjktfKMbrOqfHp4W2D88J/4Xw56U+S13Ti1n/V8bbLoPxH1ZX1h2xmc/nbdf+edjVkK3clkV6go9S6RVdAoIHC37X9E3HhkeiV3KEugwb1o/MOI04UMolLdEsB1eK4BtqeGKfHJb9eigOZMqIUPIg3zqr8qm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dE11m+b9; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719337281;
	bh=SpYw8cVTSv38pw6L8vipG+mNWuwy7NhLdes7jhapxkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dE11m+b9R+OmHNCOvAAv2nVgeF4NEMdaQ6vSfJmG72Y+wcDrPdrFLYlbT09ESEhtP
	 xE6eyg4+gcSzSFk10/ej1H/K+yowQU82DTwd1J6NHDElfi+4GoGMbmVL00aNYf/thX
	 jOB07m0lBUx2l24vCqk/O8DKl7KvtNvj9+dLZK9wq9xTiAXi1w9Tb0b0RxVvfmuu8w
	 YNp2w6yMFola0bikNbzZ3sVk2fIw4BZ1N9s2+4wwLAk7BcgZJi8KP48tQg+dC5GV87
	 zCK7HSsEEjC6a+CQ2ZRwjrOm03dnrYp932k1K8mO1WnRY9cxYIg9edekhBi+cCLuOL
	 z7TSs0Mw8vPPA==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0BEEB378000A;
	Tue, 25 Jun 2024 17:41:17 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject:
 Re: [PATCH v3 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
Date: Tue, 25 Jun 2024 13:40:50 -0400
Message-ID: <3228705.5fSG56mABF@arisu>
Organization: Collabora
In-Reply-To: <311770c3-d3ea-4650-ae11-7c278e043d0a@kwiboo.se>
References:
 <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-5-detlev.casanova@collabora.com>
 <311770c3-d3ea-4650-ae11-7c278e043d0a@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5952195.MhkbZ0Pkbq";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5952195.MhkbZ0Pkbq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Date: Tue, 25 Jun 2024 13:40:50 -0400
Message-ID: <3228705.5fSG56mABF@arisu>
Organization: Collabora
In-Reply-To: <311770c3-d3ea-4650-ae11-7c278e043d0a@kwiboo.se>
MIME-Version: 1.0

Hi Jonas,

On Thursday, June 20, 2024 11:00:49 A.M. EDT Jonas Karlman wrote:
> Hi Detlev,
> 
> On 2024-06-20 16:19, Detlev Casanova wrote:
> > Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 48 +++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> > 6ac5ac8b48ab..9c44c99125b4 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
> > 
> >  		ranges = <0x0 0x0 0xff001000 0xef000>;
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> > 
> > +
> > +		vdec0_sram: rkvdec-sram@0 {
> > +			reg = <0x0 0x78000>;
> > +			pool;
> > +		};
> > +
> > +		vdec1_sram: rkvdec-sram@1 {
> > +			reg = <0x78000 0x77000>;
> > +			pool;
> > +		};
> > 
> >  	};
> >  	
> >  	pinctrl: pinctrl {
> > 
> > @@ -2665,6 +2675,44 @@ gpio4: gpio@fec50000 {
> > 
> >  			#interrupt-cells = <2>;
> >  		
> >  		};
> >  	
> >  	};
> > 
> > +
> > +	vdec0: video-decoder@fdc38100 {
> 
> This and the vdec1 node should probably be added between
> 
>   pmu: power-management@fd8d8000
> 
> and
> 
>   av1d: video-codec@fdc70000
> 
> to follow reg order.
> 
> Also I am wondering if the nodes should be named
> 
>   video-codec@fdc38000
> 
> and
> 
>   video-codec@fdc40000
> 
> to match "1.1 Address Mapping" in TRM and the actual base address for
> the VDPU381 IP and video-codec is used for other codec nodes.
> 
> > +		compatible = "rockchip,rk3588-vdec";
> > +		reg = <0x0 0xfdc38100 0x0 0x500>;
> 
> For existing rkvdec1 devices the cache regs is also included in the
> range, should cache regs also be included for rkvdec2?, e.g.:
> 
>   reg = <0x0 0xfdc38100 0x0 0x600>;
> 
> And maybe it also should include the link list regs, e.g.:
> 
>   reg = <0x0 0xfdc38000 0x0 0x700>;
> 
> or possible:
> 
>   reg = <0x0 0xfdc38000 0x0 0x100>,
>         <0x0 0xfdc38100 0x0 0x500>,
>         <0x0 0xfdc38600 0x0 0x100>;
> 
> Something like that may be a better description of the hw.

Would it make sense to also add reg-names then ?
reg-names = "link", "function", "cache";

Detlev.

> > +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, 
<&cru
> > CLK_RKVDEC0_CA>, +			 <&cru CLK_RKVDEC0_CORE>, <&cru
> > CLK_RKVDEC0_HEVC_CA>;
> > +		clock-names = "axi", "ahb", "cabac", "core", 
"hevc_cabac";
> > +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru 
CLK_RKVDEC0_CORE>,
> > +				  <&cru CLK_RKVDEC0_CA>, <&cru 
CLK_RKVDEC0_HEVC_CA>;
> > +		assigned-clock-rates = <800000000>, <600000000>,
> > +				       <600000000>, <1000000000>;
> > +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, 
<&cru
> > SRST_RKVDEC0_CA>, +			 <&cru SRST_RKVDEC0_CORE>, <&cru
> > SRST_RKVDEC0_HEVC_CA>;
> > +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> > +			      "rst_core", "rst_hevc_cabac";
> 
> Do we need to include the rst prefix in the reset name?, does not look
> like other DT/bindings normally include rst in their name.
> 
> > +		power-domains = <&power RK3588_PD_RKVDEC0>;
> > +		sram = <&vdec0_sram>;
> > +	};
> > +
> > +	vdec1: video-decoder@fdc40100 {
> 
> Same as above.
> 
> > +		compatible = "rockchip,rk3588-vdec";
> > +		reg = <0x0 0xfdc40100 0x0 0x500>;
> 
> Same as above.
> 
> Regards,
> Jonas
> 
> > +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, 
<&cru
> > CLK_RKVDEC1_CA>, +			 <&cru CLK_RKVDEC1_CORE>, <&cru
> > CLK_RKVDEC1_HEVC_CA>;
> > +		clock-names = "axi", "ahb", "cabac", "core", 
"hevc_cabac";
> > +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru 
CLK_RKVDEC1_CORE>,
> > +				  <&cru CLK_RKVDEC1_CA>, <&cru 
CLK_RKVDEC1_HEVC_CA>;
> > +		assigned-clock-rates = <800000000>, <600000000>,
> > +				       <600000000>, <1000000000>;
> > +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, 
<&cru
> > SRST_RKVDEC1_CA>, +			 <&cru SRST_RKVDEC1_CORE>, <&cru
> > SRST_RKVDEC1_HEVC_CA>;
> > +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> > +			      "rst_core", "rst_hevc_cabac";
> > +		power-domains = <&power RK3588_PD_RKVDEC1>;
> > +		sram = <&vdec1_sram>;
> > +	};
> > 
> >  };
> >  
> >  #include "rk3588s-pinctrl.dtsi"


--nextPart5952195.MhkbZ0Pkbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZ7ASIACgkQ5EFKUk4x
7ba5dwf/RdfDrZB8mD/RDu84s+6YT5Jip9mee5p9Fi0EC75O5KteglNHTpcUCm15
y6/KblK2i8JCLcSGbqX18YBPuezNdOnHdjJq5Dgv6oYlqKVrQkE0AAOfdbY5Yrd9
513emUmA1CV6yfwXMWR8BWNAphh9osoCGhIOlIfvtFQV+50LRF6Vp3X/JkH/Wj0S
AZWY2Jp3MxX1qr6MVCAyau/NT1Gj775M8kilIKy+njYqBSX2ob0czNNpQVTElvZw
HWDZ7ZWL6XcCUWu6zeWJmHCMIy316fKzfbJPLWz0oASb7XxEKZ2cZ2xTOO9hNk5M
znC8qElWyebrFyyVk2A5sc7twyAQOg==
=A5Jn
-----END PGP SIGNATURE-----

--nextPart5952195.MhkbZ0Pkbq--




