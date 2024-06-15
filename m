Return-Path: <linux-media+bounces-13308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8599099C0
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 21:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECD91F21DEA
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 19:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482CF5FDA5;
	Sat, 15 Jun 2024 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RLqKJHwU"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1517727;
	Sat, 15 Jun 2024 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718481388; cv=none; b=UKyC+PSKJ5xxZM5Nb0MfItqWgLDskU6jYhq4WN4m2utkeGMVTD7b9D/tOzcLdkz0ZrB8YY8N75aXyJjK2gSiVTuukeC66O9lM9Wo6FrW0nogLHOCyieFweO/vfoiaLB+wdCt71mQMZG1Lyq7HSe8/2Ch4UYEYauQTQtKkw7f/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718481388; c=relaxed/simple;
	bh=xNO14OMu4RMUHJ88tczXpu5W1FWZU9yDa/2tMm16kug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSMJZ9NSWc8XxIlIuIb9yCLzGh/Gew7YPhTlzCx76maRMAsh0YdvTDEQnVP6ezu43zx5kTyKl3KbiAp9TSKkvh3UGDgWImwbMgJprKTSkMlDRLB5RFhE3zAS4l4+KobXsG0Nkxv+1K9Ena8a8ZGvd5H0LaBOTjtXsWJtkPhl3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RLqKJHwU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718481385;
	bh=xNO14OMu4RMUHJ88tczXpu5W1FWZU9yDa/2tMm16kug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLqKJHwUFLL717LjcXOauWuhRgH5MXcRgp04zrm1HZ6HYiX0jgelTAID+kQImnQgO
	 AEpFqLGyoRT1viGo8P1bZLcqZ8vrYebNP/ygvqtS2Cjn74nSFJZ9Fe83KhtRYQCPMk
	 axxsOU2tR93qbklHAh2TXhl1aPFnyp09sxicnq8ky3foJpafY1DP1CoBhzfYX3NxxQ
	 +YLbo7oDICq3l0wfoE74oz/TFPluDgnYTtGYbRjdkL4cFiO+HsthCaC9N+1FXn2UOs
	 9ySU9eOH8Na6TwvpZAESLZkMR52+a8YSoMjcJqnE/I44qsf3G9TJFGH648zoGhnS3X
	 SO9PPQKZitEyw==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4796F37810CD;
	Sat, 15 Jun 2024 19:56:22 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
Date: Sat, 15 Jun 2024 15:55:54 -0400
Message-ID: <3666279.iZASKD2KPV@arisu>
Organization: Collabora
In-Reply-To: <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-4-detlev.casanova@collabora.com>
 <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3365379.PYKUYFuaPT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3365379.PYKUYFuaPT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Date: Sat, 15 Jun 2024 15:55:54 -0400
Message-ID: <3666279.iZASKD2KPV@arisu>
Organization: Collabora
In-Reply-To: <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se>
MIME-Version: 1.0

On Saturday, June 15, 2024 4:25:27 A.M. EDT Jonas Karlman wrote:
> Hi Detlev,
> 
> On 2024-06-15 03:56, Detlev Casanova wrote:
> > Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
> >  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
> >  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 +++++++++++++++++++
> >  3 files changed, 27 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
> > c551b676860c..965322c24a65 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -503,6 +503,10 @@ &pwm1 {
> > 
> >  	status = "okay";
> >  
> >  };
> > 
> > +&rkvdec0 {
> > +	status = "okay";
> > +};
> 
> Enable of rkvdec0 should probably be split out from the patch that adds
> the rkvdec0 node to soc dtsi.

Ack

> Also why is rkvdec0 only enabled on rock-5b and orangepi-5?

I only could test on those two but I can enable it on all rk3588 devices.

> > +
> > 
> >  &saradc {
> >  
> >  	vref-supply = <&avcc_1v8_s0>;
> >  	status = "okay";
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts index
> > feea6b20a6bf..2828fb4c182a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > @@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
> > 
> >  	};
> >  
> >  };
> > 
> > +&rkvdec0 {
> > +	status = "okay";
> > +};
> > +
> > 
> >  &saradc {
> >  
> >  	vref-supply = <&avcc_1v8_s0>;
> >  	status = "okay";
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> > 0fecbf46e127..09672636dcea 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > @@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
> > 
> >  		ranges = <0x0 0x0 0xff001000 0xef000>;
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> 
> Blank line is missing.
> 
> > +		rkvdec0_sram: rkvdec-sram@0 {
> > +			reg = <0x0 0x78000>;
> > +		};
> > 
> >  	};
> >  	
> >  	pinctrl: pinctrl {
> > 
> > @@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
> > 
> >  			#interrupt-cells = <2>;
> >  		
> >  		};
> >  	
> >  	};
> > 
> > +
> > +	rkvdec0: video-decoder@fdc38100 {
> > +		compatible = "rockchip,rk3588-vdec2";
> > +		reg = <0x0 0xfdc38100 0x0 0x500>;
> > +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, 
<&cru
> > CLK_RKVDEC0_CORE>, +			 <&cru 
CLK_RKVDEC0_CA>, <&cru
> > CLK_RKVDEC0_HEVC_CA>;
> > +		clock-names = "axi", "ahb", "core",
> > +			      "cabac", "hevc_cabac";
> > +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru 
CLK_RKVDEC0_CORE>,
> > +				  <&cru CLK_RKVDEC0_CA>, <&cru 
CLK_RKVDEC0_HEVC_CA>;
> > +		assigned-clock-rates = <800000000>, <600000000>,
> > +				       <600000000>, <1000000000>;
> > +		power-domains = <&power RK3588_PD_RKVDEC0>;
> 
> iommus and resets should probably be added.
> 
> > +		status = "disabled";
> > +	};
> 
> The iommu node for rkvdec0_mmu seem to be missing, is it not required to
> be able to use memory >4GiB as decoding buffers?

I need to check if the current rockchip iommu driver will work for this 
decoder. I remember that the iommu code for AV1 was a bit different, not sure 
about this rkvdec.

> I would also consider adding the rkvdec1 node(s), if I am understanding
> correctly they can both be used in a cluster or completely independent.

They can be used independently, yes. I'll add rkvdec1 for rk3588 devices 
(rk3588s only has  1 core)

Regards,
Detlev.

> Also on RK3582/RK3583 one (or both) of the decoder cores may be marked
> as bad, yet the remaining one can still be used independently. The idea
> will be that bootloader fixup the DT and disabled/delete-node the bad
> core(s).
> 
> Regards,
> Jonas
> 
> >  };
> >  
> >  #include "rk3588s-pinctrl.dtsi"


--nextPart3365379.PYKUYFuaPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZt8coACgkQ5EFKUk4x
7bYSZAf9HE0Pqz9VRNj22zYuIX9rUQHkPjcoJLaLx88/ISlIfKmejKHlF9i+vcb0
K5s8aHUn71O4PKsmo+yMDK55zuS995D8vW8K4OIitd2MatVrO2e2HuyKdMaxmprg
xOLQ4LuW5dnf7IuAmuGxSDmLXraodzc2I5Ful1znOEW1QMxfhobF/z8TIPSLK5Ey
R2R3RbswD18k2P5yLslBR1ZuXmAj0IrPMzYUiGG5bpY+CA5as1C39XOM7eJdNXri
Fc85gDG1rC083K9lyY/pjoGXrC5cTgqEFF/boPOWfaPadqfv4KYdVU52+Z0Nb7Hu
N6bbB22cEiUh1Ye10hwwOjBQMUX3Ag==
=MgQS
-----END PGP SIGNATURE-----

--nextPart3365379.PYKUYFuaPT--




