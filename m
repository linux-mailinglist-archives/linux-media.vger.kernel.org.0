Return-Path: <linux-media+bounces-37426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47BB00D7F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68B0D56549B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFBC2FE302;
	Thu, 10 Jul 2025 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YdqVQcih"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B832274669;
	Thu, 10 Jul 2025 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181762; cv=none; b=ID5zOa4LH4w/qCAJpU9S4W7qk6Xvax6hwgL/msEE3iCIq4/lErWbNNSO5iP14DkorK2xsMr7ri1K511VCeQcRPsb9eBzAFNrkNPW/pD/IBhPGjgz0GMkT50dyg9UpBwlvEPjBw0UzHV/kdQF1341qY4hhqSazNFYe+dpEcyguxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181762; c=relaxed/simple;
	bh=/m7Yvb1GQ92ZP9wcycE50DuEyBAZqjalLylQQmPR5yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXKbER2zVJ4TdDwcZuzKpsDf87cVmuEQrSXkOynVyWLIz3+raGRef+3clE+xJ85Zxs0PAdLr6rUGSvZRX/ab5ukQN7Zn5E5R/Yr8giBsDyIUgQaNdeoibrBRPWZ40oYOw8HUFmePyYXgi8JwLj+C+M13GOIKV1UlZPLJE6/8uwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YdqVQcih; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E96A0EFE;
	Thu, 10 Jul 2025 23:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752181728;
	bh=/m7Yvb1GQ92ZP9wcycE50DuEyBAZqjalLylQQmPR5yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdqVQcihg4U8nFaO65GHKXvDSsXvArItXAmZ+xuYWnvXCHV2Wtfc6xO6pDbwxjyh+
	 k9fNI/VDZ8eWgKGNdPh+lGgXWd5yvTBTPbD4ppd+Tkxl977Ux5Bpm9M1WSpTOnxf+F
	 W9uHnJktqFpUEwhS7D1m6UgHzy3AjqMHnr9i/t2w=
Date: Fri, 11 Jul 2025 00:08:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com, tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Message-ID: <20250710210846.GF22436@pendragon.ideasonboard.com>
References: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
 <20250710131107.69017-2-hardevsinh.palaniya@siliconsignals.io>
 <20250710183356.GA3026892-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710183356.GA3026892-robh@kernel.org>

On Thu, Jul 10, 2025 at 01:33:56PM -0500, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 06:40:58PM +0530, Hardevsinh Palaniya wrote:
> > From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > 
> > Add bindings for Omnivision OV2735 sensor.
> > 
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> > ---
> >  .../bindings/media/i2c/ovti,ov2735.yaml       | 115 ++++++++++++++++++
> >  1 file changed, 115 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> > new file mode 100644
> > index 000000000000..d9d01db88844
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2735.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OmniVision OV2735 Image Sensor
> > +
> > +maintainers:
> > +  - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > +
> > +description: |
> 
> Don't need '|' if no formatting to preserve.
> 
> > +  The OmniVision OV2735 is a 2MP (1920x1080) color CMOS image sensor controlled
> > +  through an I2C-compatible SCCB bus. it outputs RAW10 format and uses a 1/2.7"
> > +  optical format.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov2735
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: XVCLK clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xvclk
> > +
> > +  avdd-supply:
> > +    description: Analog Domain Power Supply
> > +
> > +  dovdd-supply:
> > +    description: I/O Domain Power Supply
> > +
> > +  dvdd-supply:
> > +    description: Digital Domain Power Supply
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: Reset Pin GPIO Control (active low)
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: |
> 
> Same here.
> 
> > +      Active-low enable pin. Labeled as 'PWDN' in the datasheet, but acts as
> > +      an enable signal. During power rail ramp-up, the device remains powered
> > +      down. Once power rails are stable, pulling this pin low powers on the
> > +      device.
> > +
> > +  port:
> > +    description: MIPI CSI-2 transmitter port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            items:
> > +              - const: 1
> > +              - const: 2
> > +
> > +        required:
> > +          - data-lanes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - avdd-supply
> > +  - dovdd-supply
> > +  - dvdd-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3399-cru.h>

Unused.

> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera-sensor@3c {
> > +            compatible = "ovti,ov2735";
> > +            reg = <0x3c>;
> > +            clocks = <&ov2735_clk>;
> > +
> > +            assigned-clocks = <&ov2735_clk>;
> > +            assigned-clock-parents = <&ov2735_clk_parent>;
> > +            assigned-clock-rates = <24000000>;

I think you can drop those three properties from the example, they don't
add much value. Or you could switch to a clock generated by the SoC
(an RK3399 based on the #include above), in which case assigning the
rate makes sense.

> > +
> > +            avdd-supply = <&ov2735_avdd>;
> > +            dovdd-supply = <&ov2735_dovdd>;
> > +            dvdd-supply = <&ov2735_dvdd>;
> > +
> > +            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> > +            enable-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                cam_out: endpoint {
> > +                    remote-endpoint = <&mipi_in_cam>;
> > +                    data-lanes = <1 2>;
> > +                };
> > +            };
> > +        };
> > +    };

-- 
Regards,

Laurent Pinchart

