Return-Path: <linux-media+bounces-20806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D699BB7B0
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 15:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0326B1C21FA7
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 14:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6EB1B3939;
	Mon,  4 Nov 2024 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V+ZUwnRH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E504C62E;
	Mon,  4 Nov 2024 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730354; cv=none; b=SH6UFQiXkuV3orwt/fQ7g4LwalzITb66qNABPeSbxHAq+JfKRdUaC9mlx7oAjnxrGa1ODvlgaAeGcbyC1zqUEXQYzS4+ofn4ys2vLA63hx2FUvwsBjHG08+kdnekYvOteIUs+Azj8hsRpmWLUwDYO5t1pv3viqDc6Lnm6MXmblU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730354; c=relaxed/simple;
	bh=sS+G9PWl/JXj24MraEyWFce8g/yj3gwYkmWyEtoo900=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCYjJSTcgY0NKawaZ2JNIPlvlWGkFRztmyEE2M99dewcvWLLGsv2rI3/+YxZ8oDW0gex6tdCUECcDfS7XW++wAgACHtS4I/+ZcAw2yDC1g8vM16KYUqagiyRIxWKUomVSLEVwUtAObc3kiU2KWwK+DRRsvm32J1Bl+A1GcEvfec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V+ZUwnRH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0500A526;
	Mon,  4 Nov 2024 15:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730730343;
	bh=sS+G9PWl/JXj24MraEyWFce8g/yj3gwYkmWyEtoo900=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+ZUwnRHC/hy0Ov6BRoQoKRSvNMpcnL5GBt4RiJsvQDOMgx/0Po+U/YFDznhNAJNR
	 OKWEMk5Pj8JoOB7rh7YprV6nSAod6XAl70Zv+fFMAUJZ0vRNAOPRX9wwu+F8SMGsPP
	 6wOxkoK7TQLz0O5rUb+PUwYgMcNm3UxqZtbpnTWA=
Date: Mon, 4 Nov 2024 16:25:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [EXT] Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for
 OX05B1S sensor driver
Message-ID: <20241104142543.GA27775@pendragon.ideasonboard.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>
 <20241029115747.GL22600@pendragon.ideasonboard.com>
 <7cee3358-bf8c-4ae5-a688-12ff18d4b7e0@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cee3358-bf8c-4ae5-a688-12ff18d4b7e0@nxp.com>

Hello Mirela,

On Wed, Oct 30, 2024 at 08:02:44AM +0200, Mirela Rabulea wrote:
> On 29.10.2024 13:57, Laurent Pinchart wrote:
> >>> +
> >>> +  orientation: true
> >>> +  rotation: true
> >>
> >> I think you can drop both of these too.
> >
> > Aren't they needed given that the binding ends with
> >
> > additionalProperties: false
> >
> > ?
>
> I added orientation & rotation properties in order to support 
> orientation and rotation controls, libcamera warns about those (optional 
> requirements last time I checked).

The orientation and rotation properties should certainly be specified in
DT sources. They are standardized in video-interface-devices.yaml which
Bryan pointed out you should reference. If you're not familiar yet with
with how the YAML schemas used for DT bindings reference core schemas,
now would be a good time to have a look at it :-)

In a nutshell, you'll find that all properties need to be properly
defined with appropriate constraints, and properties shared by multiple
devices have constraints defined in core schemas. Some are included
automatically and are applied based on property names, other need a
manual $ref. You can have a look at
https://github.com/devicetree-org/dt-schema.git to see core schemas that
get automatically selected, they specify "select: true". For example the
schemas defining the reg or clocks properties don't have to be manually
referenced.

Bryan's comment about dropping the orientation and rotation properties
was related to the fact that the video-interface-devices.yaml schema
defines them already. With "unevaluatedProperties: false", you won't
need to specify "orientation: true". With "additionalProperties: false",
you will. It's a good idea to learn about the difference between those
two and how they really work.

> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >
> > The device requires a clock, shouldn't the clocks property be required ?
> 
> I intentionally left the clock optional, because NXP has a converter 
> board which supports both ox05b1s and os08a20 sensor, and the converter 
> board has an oscillator, and we are using that, not the SOC clock.

That's fine, you can have a fixed clock node in DT to model that. DT
bindings describe the intrinsic needs of a particular device. If the
sensor requires a clock, I think it should be mandatory. If the sensor
itself could operate without an external clock (i.e. if it had an
internal oscillator) then the property could be optional.

> Here is how the module looks like for os08a20 for imx8mp:
> 
> https://docs.nxp.com/bundle/AN13712/page/topics/os08a20_sensor_module.html
> 
> There's a newer revision for the converter board for imx95, sorry but I 
> do not have a link for that.
> 
> For imx8mp, we used in the past the clock from the SOC, then switched to 
> the external clock (from the converter board).
> 
> I think Omnivision has their own module.
> 
> So, I thought leaving the clock as optional allows for more flexibility.
> 
> >>> +  - port
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +    i2c {
> >>> +        #address-cells = <1>;
> >>> +        #size-cells = <0>;
> >>> +
> >>> +        ox05b1s: ox05b1s@36 {
> >>> +            compatible = "ovti,ox05b1s";
> >>> +            reg = <0x36>;
> >>> +            reset-gpios = <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW>;
> >
> > This isn't specified in the bindings. Does the example validate ?
> 
> Apparently yes, I mean dt_binding_check passed:
> 
> $ rm Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.example.dtb
> 
> $ make dt_binding_check DT_CHECKER_FLAGS=-m 
> DT_SCHEMA_FILES=ovti,ox05b1s.yaml
>    DTC [C] 
> Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.example.dtb
> 
> I have dtschema-2024.10.dev6+g12c3cd5.
> 
> 
> The "reset-gpios" is described in this binding, as the GPIO connected to 
> the XSHUTDOWN pin.

Ah sorry, Bryan dropped that part from his reply, so I didn't notice it.

> The <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW> is what works for imx95 
> ("nxp,pcal6408"), for imx8mp this works:
> 
> reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;

-- 
Regards,

Laurent Pinchart

