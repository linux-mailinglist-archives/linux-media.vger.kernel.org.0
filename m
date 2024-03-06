Return-Path: <linux-media+bounces-6606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41738742C7
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 23:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9774F1C22A46
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 22:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D901BDCE;
	Wed,  6 Mar 2024 22:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F9yWS9FK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A63D1B947;
	Wed,  6 Mar 2024 22:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709764188; cv=none; b=bpraJOsPZLjORrP/AzG0SwT+2MTS6mVSESRN0pa77XE7NC/vR3EArcE7QpwiR/qFSlCnfycSnl/s2aKosOj6qJAwe9KFPUt/oq4+SEw2WYyp+47XamLC1RN6sYVQj5b8/F7WzaI/LwQ5r4Me+e11IkUeg84Io9g2tRAKw+xO3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709764188; c=relaxed/simple;
	bh=SIExaGqBB9kZ6UJuSpJW7ZRFchpGQhlPFKL2lD+j7SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4TwgGIrWLamr98Utd+U6jJ0JfzEhqXgslp35mtlZpQiOJvntJXut0+g+GmHCx9kLUyBezRe+lH4HOygrVP5uy29e1TBTlWrn/6tGXv1UtnQENyglCO2Z0B/zyNGynZb8OZ47CxCK5Uh5v9024rUy46ete9jtQMliQin+VeukBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F9yWS9FK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (bl13-23-38.dsl.telepac.pt [85.246.23.38])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF729524;
	Wed,  6 Mar 2024 23:29:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709764166;
	bh=SIExaGqBB9kZ6UJuSpJW7ZRFchpGQhlPFKL2lD+j7SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9yWS9FKV0sqQp1zgmz34WkokZpOuIvJ2x9cTvjOf76tkMb7fRssCrf8Jnf3kFi9E
	 w2fUk0vS1vuIB11r1c8IdFnCqGsRAoW3Bg/5hTDuYiZ+29MFitwW2jlxHxoeJpxhBr
	 JKvBu0V+xEfrdf7V8GbQPvetGF3fAnX3Y7iIibeE=
Date: Thu, 7 Mar 2024 00:29:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Message-ID: <20240306222944.GA17754@pendragon.ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-8-jacopo.mondi@ideasonboard.com>
 <20240301215857.GO30889@pendragon.ideasonboard.com>
 <zxx7o4zssgerlfhoczbledpmjvr5q2qfzogoytqxc353bulemq@ceo2gwinda3l>
 <CAEmqJPpopGbDJsRkOsd-ph41_Ac6H50DvcwoE0i6hWyVBr=Kkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPpopGbDJsRkOsd-ph41_Ac6H50DvcwoE0i6hWyVBr=Kkw@mail.gmail.com>

On Wed, Mar 06, 2024 at 11:42:51AM +0000, Naushir Patuck wrote:
> On Tue, 5 Mar 2024 at 15:25, Jacopo Mondi wrote:
> > On Fri, Mar 01, 2024 at 11:58:57PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 23, 2024 at 05:30:09PM +0100, Jacopo Mondi wrote:
> > > > Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> > > > signal processor.
> > > >
> > > > Datasheet:
> > > > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >  .../bindings/media/raspberrypi,pispbe.yaml    | 63 +++++++++++++++++++
> > > >  1 file changed, 63 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> > > > new file mode 100644
> > > > index 000000000000..d7839f32eabf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> > > > @@ -0,0 +1,63 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
> > > > +
> > > > +maintainers:
> > > > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +
> > > > +description: |
> > > > +  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
> > > > +  processor that fetches images in Bayer or Grayscale format from DRAM memory
> > > > +  in tiles and produces images consumable by application.
> > >
> > > s/application/applications/
> > >
> > > > +
> > > > +  The full ISP documentation is available at:
> > >
> > > s/:$//
> > >
> > > > +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - brcm,bcm2712-pispbe
> > > > +      - const: raspberrypi,pispbe
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > >
> > > As this is a SoC IP with only memory and register interfaces, I would
> > > expect two clocks to be present, one for the register interface (AHB ?
> > > AXI4-Lite ?) and one for the memory interfaces (AXI4 ?). While the
> > > register interface clock is likely always enabled (in all cases that
> > > matter in practice) in the BCM2712, I'm not sure this can be guaranteed
> > > for future integration in different SoCs. Should we plan for this, and
> > > either define two clocks already (with one of them being optional), or
> > > name the single clock ?
> > >
> > > I know v1 named this clock "isp_be", and the name was dropped upon
> > > Krzysztof's request, but I think naming the single clock "axi" or "aclk"
> > > (assuming that one of them would be the right name) would be fine for
> > > the reason explained above.
> >
> > The PiSP datasheet does not offer many information on the IP
> > integration, only a small graph with the memory interfacing, but no
> > clocks.
> >
> > However your reasoning makes sense, and unless someone from RPi
> > suggests the contrary, I'll do so
> 
> There is only a single clock that clocks the whole BE block, so does
> the clock need to be explicitly named?  If it does, perhaps we can
> just use "clk" as this is not explicitly an AXI or APB clock?

If there's really a single clock then I don't think it needs to be
named. I was expecting there would be a clock for the register
interface, separate from the processing clock.

> > > > +
> > > > +  iommus:
> > > > +    maxItems: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - clocks
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > > +
> > > > +        isp@880000  {
> > > > +             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
> > > > +             reg = <0x10 0x00880000  0x0 0x4000>;
> > >
> > > Double space, I don't know if that's on purpose.
> >
> > Ofc it was not.
> >
> > > > +             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > > > +             clocks = <&firmware_clocks 7>;
> > > > +             iommus = <&iommu2>;
> > > > +        };
> > > > +    };

-- 
Regards,

Laurent Pinchart

