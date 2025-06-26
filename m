Return-Path: <linux-media+bounces-36035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE4AEA619
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 21:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFA81C271FC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73682EF672;
	Thu, 26 Jun 2025 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZLozK05F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBC32EE60F;
	Thu, 26 Jun 2025 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964880; cv=none; b=lqXSChwHLnNGFSZjV4xhJTm5UYPsTU97ZbppNwdKyq3ul/999+3iWgx+pWZfRNl5wqWgOERkcCluSnAJk1puP+rn+95SGVfIxqIO98AFbKe4mO3sGiHUdVF825RSe6DOFy8I+z9JiAKl/mZTCrlKtHRnsh0ilw2LV7XuYL+kOFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964880; c=relaxed/simple;
	bh=QFv5xOdIO9YMb/Q6Up40wb0DTN/RO9nljOjrTLjNYME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfMPXe2d/oo5pzsGK3lRPUCKC4FT7W8bISo7u2BZrPYVIBYOsKkjGg3hSW6DOQjQiI9j7hsv72QMC4DhBQj6BHlPXc+k2MJiW5AA6T2FKvomLqAttQ6PtxeR1vCKySNRVjVByKxmxXC2604LwW8GWDBDYqZYNY1PLGTxQ6eElMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZLozK05F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8BE886A6;
	Thu, 26 Jun 2025 21:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750964857;
	bh=QFv5xOdIO9YMb/Q6Up40wb0DTN/RO9nljOjrTLjNYME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLozK05F1pbgW0RXy0Uw67OCWx7l6nUCEiXFffp000ufRyJkr82VB92QOTVW85KI8
	 ZjYpZN937zGmIRSlNPuZ4qrbSXQQyCwt2+mZWTqSX/5k2XEF4+Vwy8WuRvvRYa+gTW
	 xcQWlKmV14/RZhN7qGugkrUqC7KPMIU6Zb7qc5Lo=
Date: Thu, 26 Jun 2025 22:07:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add bindings for AP1302
 and AR0144
Message-ID: <20250626190733.GB30016@pendragon.ideasonboard.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
 <20250623224109.GD15951@pendragon.ideasonboard.com>
 <aFrxSOapkQ/QIXT8@lizhi-Precision-Tower-5810>
 <20250624185404.GD20757@pendragon.ideasonboard.com>
 <aFsAY1Nz2bIFH+t+@lizhi-Precision-Tower-5810>
 <20250626124002.GJ8738@pendragon.ideasonboard.com>
 <aF1uKaJyxFMx48HN@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aF1uKaJyxFMx48HN@lizhi-Precision-Tower-5810>

On Thu, Jun 26, 2025 at 11:58:33AM -0400, Frank Li wrote:
> On Thu, Jun 26, 2025 at 03:40:02PM +0300, Laurent Pinchart wrote:
> > On Tue, Jun 24, 2025 at 03:45:39PM -0400, Frank Li wrote:
> > > On Tue, Jun 24, 2025 at 09:54:04PM +0300, Laurent Pinchart wrote:
> > > > On Tue, Jun 24, 2025 at 02:41:12PM -0400, Frank Li wrote:
> > > > > On Tue, Jun 24, 2025 at 01:41:09AM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Jun 23, 2025 at 03:17:37PM -0400, Frank Li wrote:
> > > > > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > >
> > > > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> > > > > > > connect RAW sensors (AR0144).
> > > > > > >
> > > > > > > Add corresponding DT bindings.
> > > > > > >
> > > > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > > Previous try:
> > > > > > > https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> > > > > > >
> > > > > > > Change in v3:
> > > > > > > - Move sensors under ports
> > > > > > > - use compatible string to indentify connected raw sensors
> > > > > > > - Add onnn,ar0144.yaml
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
> > > > > > >  .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
> > > > > > >  MAINTAINERS                                        |   9 ++
> > > > > > >  3 files changed, 235 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > > new file mode 100644
> > > > > > > index 0000000000000..6b745dcf3fd3f
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > > @@ -0,0 +1,151 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > > > > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > > > > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > > > > > +  Frames are output side by side or on two virtual channels.
> > > > > > > +
> > > > > > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > > > > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > > > > > +  from the host.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: onnn,ap1302
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description:
> > > > > > > +          Reference to the CLK clock.
> > > > > > > +
> > > > > > > +  reset-gpios:
> > > > > > > +    items:
> > > > > > > +      - description:
> > > > > > > +          Reference to the GPIO connected to the RST pin (active low).
> > > > > > > +
> > > > > > > +  standby-gpios:
> > > > > > > +    items:
> > > > > > > +      - description:
> > > > > > > +          Reference to the GPIO connected to the STANDBY pin (active high).
> > > > > > > +
> > > > > > > +  enable-gpios:
> > > > > > > +    items:
> > > > > > > +      - description:
> > > > > > > +          Reference to the GPIO connected to the EN pin (active high).
> > > > > > > +
> > > > > > > +  dvdd-supply: true
> > > > > > > +
> > > > > > > +  hmisc-supply: true
> > > > > > > +
> > > > > > > +  smisc-supply: true
> > > > > > > +
> > > > > > > +  ports:
> > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > +    unevaluatedProperties: false
> > > > > > > +
> > > > > > > +    patternProperties:
> > > > > > > +      "^port@[01]":
> > > > > > > +        description:
> > > > > > > +          Sensors connected to the first and second input, if no sensor
> > > > > > > +          connect, isp generate test pattern. The compatible string under
> > > > > > > +          port@0 and port@1 have to be the same.
> > > > > > > +
> > > > > > > +        allOf:
> > > > > > > +          - $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +          - $ref: onnn,ar0144.yaml
> > > > > >
> > > > > > You can't do that, that's plain wrong, sorry. There are issue raised in
> > > > > > the review of v2, please try to understand the problem and propose a
> > > > > > solution there. This is not what we need.
> > > > >
> > > > > After review previous thread, Rob suggest use compatible string instead
> > > > > vendor specific onnn,model property. I also think Rob's suggest is good
> > > > > because compatible already descript the raw sensor model, needn't involve
> > > > > new property for it and we can reuse other property like xxx-supply.
> > > > >
> > > > > Your concern is that port0 and port1 have to be the same. Rob suggest check
> > > > > at the code to make sure both are the same.
> > > > >
> > > > > I think Rob may have method to add restriction at binding doc to make dts
> > > > > have the same compatble string.
> > > > >
> > > > > Anything what I misssed?
> > > >
> > > > The discussion died out in that thread, I didn't have time to reply
> > > > right away, and then the mails got buried in my inbox. My bad.
> > > >
> > > > The sensor node does not describe a device in the traditional DT sense,
> > > > as the AP1302 completely hides the sensor from the host.
> > >
> > > Yes, but still need some informations like xxx-supply
> >
> > That's right, DT needs to provide information to describe how the sensor
> > is controlled by the AP1302.
> >
> > > > The DT node,
> > > > and its properties, need to be interpreted in the context of the AP1302
> > > > DT binding. Use a "compatible" property, beside duplicating a value and
> > > > introducing room for mistakes, is misleading, as "compatible" implies
> > > > that the node is meant to go through the standard matching procedure
> > > > with drivers. Sure, we could use a "compatible" property without letting
> > > > the operating system match it with drivers, but it would still be
> > > > misleading. I don't see any advantage in using "compatible".
> > >
> > > According to what I worked with Rob, DT don't care how driver probe device
> > > driver, and what they most care is how hardware components connected.
> > >
> > > Use "compatible"'s benefit is if sensor direct connect to Soc or other ISP,
> > > needn't add new property. improve reusability.
> >
> > I don't see how it improves reusability, no. There is no generic code
> > that will parse the "compatible" property for a sensor behind the
> > AP1302.
> 
> - reuse one yaml to do dtb check. For example, new vddio-supply for ar0144
> added. Needn't add two places, one for standalone and the other for connect
> to ISP.

But you need different properties when connecting the sensor to the SoC
or to the external ISP.

> - use of_device_is_compatible(). Anyway need proptery to identify connected
> module. Assume we use 'module'. The property name 'module' itself is
> equivalence to 'compatible'.  But whole DT schema is base on 'compatible'
> to match relatied yaml file. If use 'module' here, have to dupicate all
> property restriction at two place.

Same comment as above. When connected to the SoC, the AR0144 will have a
set of mandatory properties. When connected to the AP1302, the set of
mandatory properties is different. This just can't work as-is. The
AR0144 is an I2C device, and its DT bindings are meant for a DT node
instantiated as an I2C device, as a child of an I2C controller. When
connected to the external ISP the situation is different.

>   If use module here, it may face fallback problem. If new module, ar0145.
> we have to update binding, code and dts. If use compatible string, just
> need update binding and dts.
> 
>  'compatible's problem is that many people may miss-leading need a driver
> to match it.

"compatible" means *software*-compatible.

> > > > Regardless, you should *not* reference the ar0144.yaml. A DT binding for
> > > > the AR0144 (see below for a link to proper DT binding for this sensor)
> > > > would need to describe the device from the point of view of the host.
> > >
> > > DT have not concept about view of the host. It looks like hardware schematic,
> > > just descript how difference hardware components connected together.
> >
> > I don't think that's quite right. DT describes the system from the point
> > of view of the host. It's quite apparent when you look at the tree
> > structure, devices are arranged based on what control bus they are
> > connected to.
> 
> This is implement phenomenon. From concept of DT, there are not such limition.
> driver can grab some children nodes to send to remote async core, like m33.

I disagree with this, it's by design in DT.

> > > > Here you need to describe it from the point of view of the AP1302, which
> > > > is very different.
> > >
> > > what different?
> >
> > The sensors are fully controlled by the AP1302. They need to be
> > identified first and foremost in order to load the correct AP1302
> > firmware, and also to know which power supplies to control. That's about
> > it, there's no driver matching the sensors, there will be no device
> > corresponding to them in the operating system.
> 
> Actually, ap1302 driver create one device (maybe not necessary) for it.

I'd like to do away with that, but the Linux regulator framework makes
it difficult.

> > The data that needs to be provided in DT when the same sensor is
> > connected directly to the SoC or when it is connected to the AP1302 is
> > different, as you can see in the DT binding I posted for the AR0144. I
> > understand your confusion as the hardware component is the same, but
> > from a DT point of view it's two very different things.
> 
> I checked
> https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/
> 
> The property is the same. The only difference is that AP1302 have not used
> all properties.

That's not true. Look at the reg property. In your patch it's used to
indicate which port the of the AP1302 the sensor is connected to. When
connected to a SoC, it indicates the I2C address. That's not the same
things, you can't use the same bindings.

> Assume in future, AP1302 can support over 100 kinds RAW sensor. It will
> be big efforts to duplicate such property in AP1302's binding doc.

There won't be 100's of sensors, the AP1302 only supports onsemi
sensors, and only a subset of them.

> And if there are other ISP chips, it will become NxM 's problem.

Different ISPs will have different requirements. Look at the THP7312 for
instance, it has DT bindings upstream, and doesn't need to declare power
supplies for the sensor.

I'm sorry, but using the DT bindings designed for a camera sensor
connected to a host to describe the same camera sensor abstracted by an
external ISP (or any other component, really) is not a workable
solution.

> > > >  Even if we end up using the compatible property to
> > > > identify the sensor model, that compatible property would *not* match a
> > > > onnn,ar0144.yaml. That's yet another reason for not using "compatible".
> > >
> > > we can add extra restrictions here if need. onnn,ap0144, some time later,
> > > new compatible model onnn,ap0145 appear, we still use
> > >
> > > compatible = "onnn,ap0145", "onnn,ap0144";
> >
> > I'm sorry, I don't see how that's related.
> 
> see first my reply segment.
> 
> > > > > > > +
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +
> > > > >
> > > > > ...
> > > > >
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: ON Semiconductor AP0144 RAW CMOS sensor
> > > > > >
> > > > > > AP0144 seems to be a typo.
> > > > > >
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > > >
> > > > > > Listing people as maintainers when they had nothing to do with
> > > > > > development of a file isn't very polite.
> > > > >
> > > > > It is continue previous thread and copy from ap1302, If you have concern
> > > > > I can put my name here.
> > > >
> > > > It's a separate binding, not part of the previous version.
> > > >
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
> > > > > > > +  ISP.
> > > > > >
> > > > > > How a sensor is used is not relevant for its DT bindings.
> > > > >
> > > > > DT is that descript hardware. Many sensors have SPI and I2C interface, but
> > > > > they use the same binding.
> > > > >
> > > > > DT just descript hardware feature, such as how many clocks, how many power
> > > > > supply. All of property does not related usage at all.
> > > > >
> > > > > Some legacy binding related usage, but that is what try to avoid now.
> > > >
> > > > Yes, so you shouldn't mention the AP1302 here.
> > > >
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    enum:
> > > > > > > +      - onnn,ar0144
> > > > > > > +      - onnn,ar0330
> > > > > > > +      - onnn,ar1335
> > > > > >
> > > > > > There's also no explanation for this.
> > > > >
> > > > > It is just chip's compatible string, what do you want to add? Most compatible
> > > > > string have not descrption.
> > > > >
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  vaa-supply: true
> > > > > > > +
> > > > > > > +  vdd-supply: true
> > > > > > > +
> > > > > > > +  vddio-supply: true
> > > > > > > +
> > > > > > > +  vddpll-supply: true
> > > > > > > +
> > > > > > > +  port:
> > > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +    additionalProperties: false
> > > > > > > +
> > > > > > > +    properties:
> > > > > > > +      endpoint:
> > > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > > > > +  - reg
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - if:
> > > > > > > +      properties:
> > > > > > > +        compatible:
> > > > > > > +          not:
> > > > > > > +            contains:
> > > > > > > +              const: onnn,ar0330
> > > > > > > +    then:
> > > > > > > +      properties:
> > > > > > > +        vddpll-supply: false
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    i2c {
> > > > > > > +        #address-cells = <1>;
> > > > > > > +        #size-cells = <0>;
> > > > > > > +
> > > > > > > +        camera@10 {
> > > > > > > +            compatible = "onnn,ar0144";
> > > > > > > +            reg = <0x10>;
> > > > > > > +            vaa-supply = <&vaa>;
> > > > > > > +            vddio-supply = <&vddio>;
> > > > > > > +            vdd-supply = <&vdd>;
> > > > > >
> > > > > > No input clock, reset signal, ports ?
> > > > >
> > > > > I am not famillar with this sensor, just extract from code. Do you know
> > > > > where download spec?
> > > >
> > > > The datasheet is not public, but I have posted a driver, with DT
> > > > bindings, to the linux-media mailing list. See
> > > > https://lore.kernel.org/linux-media/20240905225308.11267-1-laurent.pinchart@ideasonboard.com
> > > >
> > > > > at least ports is needed.
> > > > >
> > > > > > > +        };
> > > > > > > +    };
> > > > > > > +
> > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > index d6f1670290589..1362d351f2574 100644
> > > > > > > --- a/MAINTAINERS
> > > > > > > +++ b/MAINTAINERS
> > > > > > > @@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
> > > > > > >  S:	Maintained
> > > > > > >  F:	sound/aoa/
> > > > > > >
> > > > > > > +AP1302 ON SEMICONDUCTOR ISP DRIVER
> > > > > > > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > +R:	Frank Li <Frank.Li@nxp.com>
> > > > > > > +L:	linux-media@vger.kernel.org
> > > > > > > +S:	Maintained
> > > > > > > +T:	git git://linuxtv.org/media.git
> > > > > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> > > > > > > +
> > > > > > >  APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
> > > > > > >  M:	William Breathitt Gray <wbg@kernel.org>
> > > > > > >  L:	linux-iio@vger.kernel.org

-- 
Regards,

Laurent Pinchart

