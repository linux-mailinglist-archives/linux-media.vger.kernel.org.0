Return-Path: <linux-media+bounces-28503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1886A69368
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59041B62B80
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA5B1C5F25;
	Wed, 19 Mar 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="reZMeO2s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F201957FF;
	Wed, 19 Mar 2025 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742397570; cv=none; b=epL31AX810anhh2ShcrbhSLAdXcL2rGmJrwyoY+Gp369iR1unGjmw2L4WG/ikCoaIKtYaw6l4g/gScIgE0duq5FXwucq60Yv1rclB34ooHrBpHzVsaI2fh98DpUOYCmRW6tjr7pfGGKO0T05S5uSdEgREGurYx52uIjqDWUaTvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742397570; c=relaxed/simple;
	bh=75KZOsEBxSbCczYa0jJTN/upYNwqdtyGsR4PPJi/iXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCZtNkH+wVtxTeZ7cwgps0+HHC7BF2XJRtKTE03CLOo0OONbT3bpo3HE9VD3aC+00poxQSQJIYkK0BxsMripevXIJmmbl+YCdPsWCLpIGO+uAf3hdKVHX9ey4UxSYdvTXYt+b/jHTmkF6lV9WHysmJb9n2gcSDqXm0RfoFOhJtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=reZMeO2s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08B661E6;
	Wed, 19 Mar 2025 16:17:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742397464;
	bh=75KZOsEBxSbCczYa0jJTN/upYNwqdtyGsR4PPJi/iXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=reZMeO2sgxiQKkPpJQnJEXfxYJeeBej9uPSDGv2o2iVkPQGAY3q1sg/R9rYPtRR/n
	 JMHlCu8GGVLBTmhW2PJNrlcFXkFKa6pE+Mngb/+ou+PhzVElFrfLS2djiHoI9pJN0A
	 tBBYmC2ds0+RkNSCKHKxIleqN55gdWHFivl3UUSA=
Date: Wed, 19 Mar 2025 16:19:23 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function
 block
Message-ID: <gwkedvxrab62uyusei55nhaylekr46btmzwh6tc3vuaeomaa6g@xoo4jrofknqz>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
 <hwj6d3ll75magopi5oak4zmboy5dol3ztv3isd6wvrxmvbkx4b@ayjumbqmuk3l>
 <20250319150745.GE949127@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250319150745.GE949127@ragnatech.se>

Hi Niklas

On Wed, Mar 19, 2025 at 04:07:45PM +0100, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your feedback.
>
> On 2025-03-19 15:50:00 +0100, Jacopo Mondi wrote:
> > Hi Niklas
> >
> > On Sat, Mar 15, 2025 at 04:27:03PM +0100, Niklas Söderlund wrote:
> > > All ISP instances on V3U have both a channel select and core function
> > > block, describe the core region in addition to the existing cs region.
> > >
> > > The interrupt number already described intended to reflect the cs
> > > function but did incorrectly describe the core block. This was not
> >
> > I can't find the interrupt mapping table for V3U, so this is the only
> > thing I can't check
>
> Page number 820, or search for "SPI 152" (fist one).
>

Uh, thanks

> >
> > > noticed until now as the driver do not make use of the interrupt for the
> > > cs block.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > The rest looks good
> >
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 60 +++++++++++++++++------
> > >  1 file changed, 44 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > index f1613bfd1632..95ff69339991 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > @@ -2588,13 +2588,20 @@ du_out_dsi1: endpoint {
> > >  		isp0: isp@fed00000 {
> > >  			compatible = "renesas,r8a779a0-isp",
> > >  				     "renesas,rcar-gen4-isp";
> > > -			reg = <0 0xfed00000 0 0x10000>;
> > > -			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > > -			clocks = <&cpg CPG_MOD 612>;
> > > +			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> > > +			reg-names = "cs", "core";
> >
> > However, won't the presence of a "core" part trigger the probing of
> > the forthcoming RPP core support, which should not support V3U as far
> > I understood ?
>
>
> Correct the RPPX1 library will be given the change to probe on V3U, it
> will detect it's not an RPPX1 gracefully not create an ISPCORE on V3U.
> This describes the hardware, and there is an ISP core mapped at this
> address, not just the same as on the others ;-) The driver is prepared
> for this.
>

Ack, just wanted to validat that

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> >
> > > +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "cs", "core";
> > > +			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
> > > +			clock-names = "cs", "core";
> > >  			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> > > -			resets = <&cpg 612>;
> > > +			resets = <&cpg 612>, <&cpg 16>;
> > > +			reset-names = "cs", "core";
> > >  			status = "disabled";
> > >
> > > +			renesas,vspx = <&vspx0>;
> > > +
> > >  			ports {
> > >  				#address-cells = <1>;
> > >  				#size-cells = <0>;
> > > @@ -2672,13 +2679,20 @@ isp0vin07: endpoint {
> > >  		isp1: isp@fed20000 {
> > >  			compatible = "renesas,r8a779a0-isp",
> > >  				     "renesas,rcar-gen4-isp";
> > > -			reg = <0 0xfed20000 0 0x10000>;
> > > -			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > > -			clocks = <&cpg CPG_MOD 613>;
> > > +			reg = <0 0xfed20000 0 0x10000>, <0 0xfee00000 0 0x100000>;
> > > +			reg-names = "cs", "core";
> > > +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "cs", "core";
> > > +			clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> > > +			clock-names = "cs", "core";
> > >  			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> > > -			resets = <&cpg 613>;
> > > +			resets = <&cpg 613>, <&cpg 17>;
> > > +			reset-names = "cs", "core";
> > >  			status = "disabled";
> > >
> > > +			renesas,vspx = <&vspx1>;
> > > +
> > >  			ports {
> > >  				#address-cells = <1>;
> > >  				#size-cells = <0>;
> > > @@ -2756,13 +2770,20 @@ isp1vin15: endpoint {
> > >  		isp2: isp@fed30000 {
> > >  			compatible = "renesas,r8a779a0-isp",
> > >  				     "renesas,rcar-gen4-isp";
> > > -			reg = <0 0xfed30000 0 0x10000>;
> > > -			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> > > -			clocks = <&cpg CPG_MOD 614>;
> > > +			reg = <0 0xfed30000 0 0x10000>, <0 0xfef00000 0 0x100000>;
> > > +			reg-names = "cs", "core";
> > > +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "cs", "core";
> > > +			clocks = <&cpg CPG_MOD 614>, <&cpg CPG_MOD 18>;
> > > +			clock-names = "cs", "core";
> > >  			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
> > > -			resets = <&cpg 614>;
> > > +			resets = <&cpg 614>, <&cpg 18>;
> > > +			reset-names = "cs", "core";
> > >  			status = "disabled";
> > >
> > > +			renesas,vspx = <&vspx2>;
> > > +
> > >  			ports {
> > >  				#address-cells = <1>;
> > >  				#size-cells = <0>;
> > > @@ -2840,13 +2861,20 @@ isp2vin23: endpoint {
> > >  		isp3: isp@fed40000 {
> > >  			compatible = "renesas,r8a779a0-isp",
> > >  				     "renesas,rcar-gen4-isp";
> > > -			reg = <0 0xfed40000 0 0x10000>;
> > > -			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> > > -			clocks = <&cpg CPG_MOD 615>;
> > > +			reg = <0 0xfed40000 0 0x10000>, <0 0xfe400000 0 0x100000>;
> > > +			reg-names = "cs", "core";
> > > +			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "cs", "core";
> > > +			clocks = <&cpg CPG_MOD 615>, <&cpg CPG_MOD 19>;
> > > +			clock-names = "cs", "core";
> > >  			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
> > > -			resets = <&cpg 615>;
> > > +			resets = <&cpg 615>, <&cpg 19>;
> > > +			reset-names = "cs", "core";
> > >  			status = "disabled";
> > >
> > > +			renesas,vspx = <&vspx3>;
> > > +
> > >  			ports {
> > >  				#address-cells = <1>;
> > >  				#size-cells = <0>;
> > > --
> > > 2.48.1
> > >
>
> --
> Kind Regards,
> Niklas Söderlund

