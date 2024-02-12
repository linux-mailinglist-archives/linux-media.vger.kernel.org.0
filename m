Return-Path: <linux-media+bounces-4959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E6850F2F
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CEDB1F21789
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594A9FBFC;
	Mon, 12 Feb 2024 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLGKvnqy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E76910A05;
	Mon, 12 Feb 2024 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707728265; cv=none; b=bO/g3ie8myKkdQhAsHHDaaXeg9fKctfkujRZT8uAQhlL5HlBIAqXu18PpxGeW5F38v0egb3Ibdpv4KhvhEaSFzbKSfP3wdeVWTr3TDrH/p+l+wINfXd3bDRCojOBa4Z24dH08gT6tjYkcD8zQPUFd57AFDv3QJDEAQr/salh588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707728265; c=relaxed/simple;
	bh=VpAcm8I4B6sqWBhRxKg2OVcwD8ua00X+sBl4Cq5AcDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLVUfvfnP06lr73V56pQP3E1POXIEVn0ZdKT6NaOPz9J31WnAuspAQpQ+2h9M/ZlVIojZsKyWkhCNsdZdqPcWfa0kdSnAAFF7uGmDEw9dvl7b63g60giRM9z0RFZ5iHEk/XMyyqpE4wcZ1K4nufBezsjAdCrgSV/e1RFclM9Abo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rLGKvnqy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 007A463B;
	Mon, 12 Feb 2024 09:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707727862;
	bh=VpAcm8I4B6sqWBhRxKg2OVcwD8ua00X+sBl4Cq5AcDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLGKvnqy9GlhAaXkbF/CXks3yEkqNdtweGdSZi1CGl2o713fozSgMMvcoRe/wiS3B
	 tPGBQG1OTo3tvEZirFmHaGbYD3FCrDJLFEoReduw7EIiMkV89CJnq6sJMvxdR6PRky
	 8w91bvo42/sOLygqm6OGtiEydvFea6AXA4bGhxZM=
Date: Mon, 12 Feb 2024 09:50:59 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	devicetree@vger.kernel.org
Subject: Re: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry
 Pi PiSP Back End
Message-ID: <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
 <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>

Hi Krzysztof

On Mon, Feb 12, 2024 at 09:12:11AM +0100, Krzysztof Kozlowski wrote:
> On 09/02/2024 17:48, Jacopo Mondi wrote:
> > Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> > signal processor.
> >
> > Datasheet:
> > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> >
>
>
> > +---
> > +$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
> > +
> > +maintainers:
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> > +  - David Plowman <david.plowman@raspberrypi.com>
> > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +  - Naushir Patuck <naush@raspberrypi.com>
> > +  - Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
>
> I assume all folks are fine being here?
>

I admint I haven't ask any single one of them, and I listed all of
them thinking of "maintainers of PiSP", but when it comes to bindings
only we can shorten the list if preferred ?

> > +
> > +description: |
> > +  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
> > +  processor that fetches images in Bayer or Grayscale format from DRAM memory
> > +  in tiles and produces images consumable by applications.
> > +
> > +  The full ISP documentation is available at:
> > +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,pispbe
>
> Nothing more specific? No model name, no version? It's quite generic
> compatible which in general should not be allowed. I would assume that
> at least version of Pi could denote some sort of a model... unless
> version is detectable?
>

The driver matches on a version register and that should be enough to
handle quirks which are specific to an IP revision in the driver
itself.

Considering how minimal the integration with the SoC is (one clock, one
interrupt and one optional iommu reference) even if we'll get future
revisions of the SoC I don't think there will be any need to match on
a dedicated compatible for bindings-validation purposes.

However I understand that to be future-proof it's good practice to
allow a more flexible scheme, so we can have a generic fallback and a
revision-specific entry.

Would

  compatible:
    items:
      - enum:
        - raspberrypi,pipspbe-bcm2712
      - const: raspberrypi,pispbe

do in this case ?

Also, let's see what RPi think as they are certainly more informed
than me on what a good revision-specific match could be

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: isp_be
>
> You can skip clock-names if they have only one entry and it matches
> block name. Quite useless.
>

ack

> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    rpi1 {
>
> soc {
>

Are you sure ? This will only ever live in the 'rp1' node.

> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        isp: pisp_be@880000  {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> so: isp@
>
> and drop unused label

ok

Thanks
  j

PS:
on v6.8-rc1 I'm seeing

LINT    Documentation/devicetree/bindings
usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files]
                [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v]
                [FILE_OR_DIR ...]

when running dt_binding_check

My setup should be reasonably up-to-date, is it me only seeing this ?


>
> > +             compatible = "raspberrypi,pispbe";
> ds,
> Krzysztof
>

