Return-Path: <linux-media+bounces-36912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D3AFA784
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 21:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 252D517880C
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 19:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CD629DB88;
	Sun,  6 Jul 2025 19:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tpu8IClv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA828F5;
	Sun,  6 Jul 2025 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751831169; cv=none; b=Dz28TmudCKJTCBGodZAHbBx3jwLT46948mzV75O1od3oYMUPMthj+DV3yrOllA07Ln4qF4mzi1G5hU8+zhrYos5Om1ZOP50OiVTmZE/2RvX/5qUA4fB05uhlmGcyiwvEUnmlc8DUnEyFf3ZaLv3S720/coYEKYnzNpAz/ekvB14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751831169; c=relaxed/simple;
	bh=muok25vvzi3aapzULz2DmAYuvuxd/xWUME7SzpyvA78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd/lwHfU81U0tMObgMIWDtRlXSfjjLqZi1V3ocPmdofWBEEQWDuOjYSXopzBqAE8PC7PCncST7IKXq4EaIWRf15vOl2E632AKzTtkZQQTP0hijJ5NviBB6TPd2706LKr3z8MrRSw+9Q14H3T6K6Rko4jWay4/R4+mIahXRQofas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tpu8IClv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6333EC78;
	Sun,  6 Jul 2025 21:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751831130;
	bh=muok25vvzi3aapzULz2DmAYuvuxd/xWUME7SzpyvA78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpu8IClvp7iVfzfr7SDICHcfa0T4TQJtBwrwblpqeMCDKgjduIDf8zR9YERFlJbgJ
	 s4rLbVOCf590PwdVQlfAezffsrbHq3Xp7NLdW+7gDZFnQd/ukq6kJ6KKBnozGddxIy
	 O/mA1hrMt8SCR9BP24MaMr6tnRA+ujghrxsTRFYE=
Date: Sun, 6 Jul 2025 22:45:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Will Whang <will@willwhang.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SONY IMX585 SENSOR DRIVER" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
Message-ID: <20250706194528.GA1821@pendragon.ideasonboard.com>
References: <20250702063836.3984-1-will@willwhang.com>
 <20250702063836.3984-2-will@willwhang.com>
 <20250702092858.GA15241@pendragon.ideasonboard.com>
 <CAFoNnrxquDp_yx_HSOe00cVDMcw2G+rTZs8x8RgOD3RO=tq-XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFoNnrxquDp_yx_HSOe00cVDMcw2G+rTZs8x8RgOD3RO=tq-XA@mail.gmail.com>

Hi will,

On Sat, Jul 05, 2025 at 11:55:04PM -0700, Will Whang wrote:
> Hi Laurent,
> 
> Thank you for the feedback, very much appreciated!
> Reply inline.
> (Resend this email for reply all)

Please reply in plain-text only, as HTML e-mails get filtered out by
kernel mailing lists.

> On Wed, Jul 2, 2025 at 2:37 AM Laurent Pinchart wrote:
> > On Wed, Jul 02, 2025 at 07:38:33AM +0100, Will Whang wrote:
> > > Document the devicetree binding for the Sony IMX585.  The schema
> > > covers the CSI-2 data-lanes, the optional 'mono-mode' flag,
> > > and the internal-sync properties used by the driver.
> > >
> > > Signed-off-by: Will Whang <will@willwhang.com>
> > > ---
> > >  .../bindings/media/i2c/sony,imx585.yaml       | 120 ++++++++++++++++++
> > >  MAINTAINERS                                   |   8 ++
> > >  2 files changed, 128 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > >
> > > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > > new file mode 100644
> > > index 000000000..d050d1642
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > > @@ -0,0 +1,120 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2024 Ideas on Board Oy
> >
> > Unless there's something I'm not aware of, I don't think Ideas on Board
> > wrote this. You can use your own copyright.
> 
> Yeah sorry about this, I've updated this one.
> 
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx585.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX585 Sensor
> > > +
> > > +maintainers:
> > > +  - Will Whang <will@willwhang.com>
> > > +
> > > +description:
> > > +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > > +
> >
> > You should add
> >
> > allOf:
> >   - $ref: /schemas/media/video-interface-devices.yaml#
> >
> > here to support generic sensor properties. You will need to replace
> >
> > additionalProperties: false
> >
> > with
> >
> > unevaluatedProperties: false
> >
> > below.
> 
> Updated.

You don't need to reply to individual review comments if you agree with
them and update the code. By only replying to the points that require
discussions, the conversation is easier to read.

> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx585
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: xclk
> >
> > When there's a single clock you can drop clock-names.
> >
> Updated.
> 
> > > +
> > > +  clock-frequency:
> > > +    enum: [ 74250000, 37125000, 72000000, 27000000, 24000000 ]
> >
> > The clock-frequency property is frowned upon for sensors in DT. If the
> > aim is to set the frequency of the clock, it should be done through
> > assigned-clocks and assigned-clock-rates. If the aim is to convey the
> > clock frequency to the driver, it should be done by calling
> > clk_get_rate() in the driver.
> 
> The aim is to set the frequency for the driver to handle different clock frequencies,
> currently the driver is using clk_get_rate() but because it only supports
> these frequencies I thought I need to list the valid options here.

There's no need to. DT writers are expected to know about the hardware,
you don't need to document here what frequencies the sensor supports. DT
properties are meant to convey information to drivers, and drivers don't
need the clock-frequency property as they can get the clock rate (set
from assigned-clock-rates) from the system.

> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: I2C Address for IMX585
> >
> > You can drop the description, it's always the same for I2C devices.
> 
> Updated.
> 
> > > +
> > > +  VANA-supply:
> > > +    description: Analog power supply (3.3V)
> > > +
> > > +  VDDL-supply:
> > > +    description: Interface power supply (1.8V)
> > > +
> > > +  VDIG-supply:
> > > +    description: Digital power supply (1.1V)
> > > +
> > > +  reset-gpios:
> > > +    description: Sensor reset (XCLR) GPIO
> > > +    maxItems: 1
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            anyOf:
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> >
> > Does that mean that the sensor supports data lane remapping ? I don't
> > see it implemented by the driver. If it's not supported by the hardware,
> > you should use
> >
> >         properties:
> >           data-lanes:
> >             minItems: 1
> >             items:
> >               - const: 1
> >               - const: 2
> >               - const: 3
> >               - const: 4
> >
> > To guarantee the order.
> 
> The driver can only support either 2-lane or 4-lane mode. Updated.
> 
> > > +
> > > +          sync-mode:
> > > +            description: |
> > > +              Select the synchronisation mode of the sensor
> > > +                0 – internal sync, leader (default)
> > > +                1 – internal sync, follower
> > > +                2 – external sync
> > > +            $ref: /schemas/types.yaml#/definitions/uint8
> > > +            enum: [ 0, 1, 2 ]
> >
> > This seems to be a sensor-level property, not an endpoint property. As
> > it's not standard, it should also have a vendor prefix, i.e.
> > sony,sync-mode. I'm wondering, though, if we shouldn't try to
> > standardize it in video-interface-devices.yaml.
>
> Updated, along with the feedback from Krzysztof, I've make the following
> modifications:
>   sony,sync-mode:
>     description:
>       Select the global synchronisation mode of the sensor.
>     $ref: /schemas/types.yaml#/definitions/string
>     enum:
>       - internal-leader
>       - internal-follower
>       - external
>     default: internal-leader

I'll comment on that in v2, when reading how the driver handles external
triggers and synchronization.

> > +
> > > +          link-frequencies:
> > > +            description: Select the MIPI-CSI2 link speed in Mhz
> >
> > You can drop the description, it's already described in
> > video-interfaces.yaml.
> 
> Updated.
> 
> > > +            items:
> > > +              enum: [ 297000000, 360000000, 445500000, 594000000,
> > > +                      720000000, 891000000, 1039500000 ]
> >
> > Are those frequencies the only ones the hardware can support, or do they
> > come from the driver only supporting a fixed set of sensor PLL
> > configurations ? In the latter case I would drop the enumeration.
> 
> Yes, these are the ones that it supports.
> 
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +          - link-frequencies
> > > +
> > > +    required:
> > > +      - endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-frequency
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        imx585@1a {
> > > +            compatible = "sony,imx585";
> > > +            reg = <0x1a>;
> > > +            clocks = <&imx585_clk>;
> > > +            clock-frequency = <24000000>;
> > > +
> > > +            VANA-supply = <&camera_vadd_3v3>;
> > > +            VDDL-supply = <&camera_vdd1_1v8>;
> > > +            VDIG-supply = <&camera_vdd2_1v1>;
> > > +
> > > +            port {
> > > +                imx585: endpoint {
> > > +                    remote-endpoint = <&cam>;
> > > +                    data-lanes = <1 2 3 4>;
> > > +                    link-frequencies = /bits/ 64 <720000000>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index da34c7227..9cc404790 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -23150,6 +23150,14 @@ T:   git git://linuxtv.org/media.git
> > >  F:   Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> > >  F:   drivers/media/i2c/imx415.c
> > >
> > > +SONY IMX585 SENSOR DRIVER
> > > +M:   Will Whang <will@willwhang.com>
> > > +L:   linux-media@vger.kernel.org
> > > +S:   Maintained
> > > +T:   git git://linuxtv.org/media.git
> > > +F:   Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > > +F:   drivers/media/i2c/imx585.c
> > > +
> > >  SONY MEMORYSTICK SUBSYSTEM
> > >  M:   Maxim Levitsky <maximlevitsky@gmail.com>
> > >  M:   Alex Dubov <oakad@yahoo.com>

-- 
Regards,

Laurent Pinchart

