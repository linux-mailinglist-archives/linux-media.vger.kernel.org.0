Return-Path: <linux-media+bounces-13318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6A909C18
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 09:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BC1A281584
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D08A179201;
	Sun, 16 Jun 2024 07:28:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0EB16DEB4;
	Sun, 16 Jun 2024 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718522924; cv=none; b=Ddsydk2zqzGuvMKlmkovMgOqftyK9ShLoDCoeEgVGo6FUcHy3fqHb4KB3IOOHvZkLMaW4U9C+X9W4Xpdbl3LVxs0ebl7lQF+v1Xy4b9xqkh+5vn2CB9Bn7IaHgrcnMJqlnuDwJvwA/Ma+koKtiGnJiNqLxEvNtBt2f1st8wCX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718522924; c=relaxed/simple;
	bh=onAJtnmk6+29s6dUauR5dhJqG7zZiy9rFtztLY7oXC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ON0+lBgYeDjuIb8BpH6FqMFxXjIaKA56rOBKaR9VX4ffjSZIF+jP3i0tu8WRkF3JEqxuAuzwVtgfA+T01DJAGNkFORo/6TUEBQIZL3v3Gdz6A+EJw6SDxPpovShRKLXS9JhIiOnZfKtGRwIcL4ZRCWoIEsFYdvKSNe50c5/Q34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from 79-98-74-242.sys-data.com ([79.98.74.242] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sIkJO-00007I-3M; Sun, 16 Jun 2024 09:28:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
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
Date: Sun, 16 Jun 2024 09:28:25 +0200
Message-ID: <6812626.ejJDZkT8p0@phil>
In-Reply-To: <3666279.iZASKD2KPV@arisu>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se> <3666279.iZASKD2KPV@arisu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 15. Juni 2024, 21:55:54 CEST schrieb Detlev Casanova:
> On Saturday, June 15, 2024 4:25:27 A.M. EDT Jonas Karlman wrote:
> > Hi Detlev,
> > 
> > On 2024-06-15 03:56, Detlev Casanova wrote:
> > > Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> > > 
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > > 
> > >  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
> > >  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
> > >  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 +++++++++++++++++++
> > >  3 files changed, 27 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
> > > c551b676860c..965322c24a65 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > @@ -503,6 +503,10 @@ &pwm1 {
> > > 
> > >  	status = "okay";
> > >  
> > >  };
> > > 
> > > +&rkvdec0 {
> > > +	status = "okay";
> > > +};
> > 
> > Enable of rkvdec0 should probably be split out from the patch that adds
> > the rkvdec0 node to soc dtsi.
> 
> Ack
> 
> > Also why is rkvdec0 only enabled on rock-5b and orangepi-5?
> 
> I only could test on those two but I can enable it on all rk3588 devices.
> 
> > > +
> > > 
> > >  &saradc {
> > >  
> > >  	vref-supply = <&avcc_1v8_s0>;
> > >  	status = "okay";
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > > b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts index
> > > feea6b20a6bf..2828fb4c182a 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> > > @@ -321,6 +321,10 @@ typec5v_pwren: typec5v-pwren {
> > > 
> > >  	};
> > >  
> > >  };
> > > 
> > > +&rkvdec0 {
> > > +	status = "okay";
> > > +};
> > > +
> > > 
> > >  &saradc {
> > >  
> > >  	vref-supply = <&avcc_1v8_s0>;
> > >  	status = "okay";
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> > > 0fecbf46e127..09672636dcea 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > @@ -3034,6 +3034,9 @@ system_sram2: sram@ff001000 {
> > > 
> > >  		ranges = <0x0 0x0 0xff001000 0xef000>;
> > >  		#address-cells = <1>;
> > >  		#size-cells = <1>;
> > 
> > Blank line is missing.
> > 
> > > +		rkvdec0_sram: rkvdec-sram@0 {
> > > +			reg = <0x0 0x78000>;
> > > +		};
> > > 
> > >  	};
> > >  	
> > >  	pinctrl: pinctrl {
> > > 
> > > @@ -3103,6 +3106,22 @@ gpio4: gpio@fec50000 {
> > > 
> > >  			#interrupt-cells = <2>;
> > >  		
> > >  		};
> > >  	
> > >  	};
> > > 
> > > +
> > > +	rkvdec0: video-decoder@fdc38100 {
> > > +		compatible = "rockchip,rk3588-vdec2";
> > > +		reg = <0x0 0xfdc38100 0x0 0x500>;
> > > +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, 
> <&cru
> > > CLK_RKVDEC0_CORE>, +			 <&cru 
> CLK_RKVDEC0_CA>, <&cru
> > > CLK_RKVDEC0_HEVC_CA>;
> > > +		clock-names = "axi", "ahb", "core",
> > > +			      "cabac", "hevc_cabac";
> > > +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru 
> CLK_RKVDEC0_CORE>,
> > > +				  <&cru CLK_RKVDEC0_CA>, <&cru 
> CLK_RKVDEC0_HEVC_CA>;
> > > +		assigned-clock-rates = <800000000>, <600000000>,
> > > +				       <600000000>, <1000000000>;
> > > +		power-domains = <&power RK3588_PD_RKVDEC0>;
> > 
> > iommus and resets should probably be added.
> > 
> > > +		status = "disabled";
> > > +	};
> > 
> > The iommu node for rkvdec0_mmu seem to be missing, is it not required to
> > be able to use memory >4GiB as decoding buffers?
> 
> I need to check if the current rockchip iommu driver will work for this 
> decoder. I remember that the iommu code for AV1 was a bit different, not sure 
> about this rkvdec.
> 
> > I would also consider adding the rkvdec1 node(s), if I am understanding
> > correctly they can both be used in a cluster or completely independent.
> 
> They can be used independently, yes. I'll add rkvdec1 for rk3588 devices 
> (rk3588s only has  1 core)

Please check in with Sebastian Reichel about clusters/independent
controllers. He had a lot of fruitful discussions for the VEPU121/VPU121
support he is working on.

Baseline being, while we want the hw to be described correctly wrt the
multiple instances, we don't generally want to expose them individually
to userspace, because that would then require userspace to do all the
scheduling.



