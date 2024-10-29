Return-Path: <linux-media+bounces-20521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471279B48C9
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05CA6283C14
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 11:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09A7205AAD;
	Tue, 29 Oct 2024 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VGSDR/IN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2347464;
	Tue, 29 Oct 2024 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203078; cv=none; b=sK0JpSxq322SiEC8gQAPXRD56UIpqbc5rhLGROeKuD5zTPIxrIoet80fs1RpkpAIfnQE5lMC9AKWxP7s3yARkcEVzXy6XcX1/cpv7r5pHkJJ2WmwG5Irx7HKALjZobH0ITlIgYbz3a2IY2uC73A3mUC263nma06JBbOzxodoDcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203078; c=relaxed/simple;
	bh=2TwDGfdJRGaajj9HXuIbgGLUTQdCfSxdpZ8MwSLLNuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZtq6QW6YWaO4UQ1q+3PwTesUxmhasXokBwXgK8Pc74NW0IQAdZGoEm6aya7md/3fVHiLWY40pf9zQOunclxww11HlFivNeTZa/B2JymGIfKwnDxGLtnH7PgvmZ6+W+2PBRRiIXupR6kopOX57qm9nBXFf0z0ioqBB7c/Hkpm7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VGSDR/IN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 272B5AF;
	Tue, 29 Oct 2024 12:57:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730203071;
	bh=2TwDGfdJRGaajj9HXuIbgGLUTQdCfSxdpZ8MwSLLNuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VGSDR/INadHaQNirHNNGf+s04/TKd2Zwp9LUMUFAEe04FLNVBr1E5w8KTK9Ro5CCR
	 aGc8RubLrprvUaA7osa5J2gUiSCeeul9OfwmzS+aK+m/4Irs6ELkii+kM//DjCSu6W
	 Ui4rOJZajrNwYKJX8soq/3/Q5ToXdeNZQuncC0DY=
Date: Tue, 29 Oct 2024 13:57:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
Message-ID: <20241029115747.GL22600@pendragon.ideasonboard.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>

On Tue, Oct 29, 2024 at 11:44:33AM +0000, Bryan O'Donoghue wrote:
> On 28/10/2024 19:06, Mirela Rabulea wrote:
> > Add bindings for OX05B1S sensor driver
> > 
> > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >   .../bindings/media/i2c/ovti,ox05b1s.yaml      | 109 ++++++++++++++++++
> >   1 file changed, 109 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
> > new file mode 100644
> > index 000000000000..d47e1950f24d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (C) 2024, NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OX05B1S Image Sensor
> > +
> > +maintainers:
> > +  - Mirela Rabulea <mirela.rabulea@nxp.com>
> > +
> > +description: |-
> > +  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size

Reflow to 80 columns.

> > +  of 2592 x 1944. It is programmable through I2C interface.
> > +  The sensor output is available via CSI-2 serial data output.
> > +
> 
> You should add
> 
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> 
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - ovti,ox05b1s
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description: Input clock (24 MHz)
> > +    items:
> > +      - const: csi_mclk

If there's a single clock you can drop the name.

How about regulators ?

> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +
> > +  assigned-clock-parents:
> > +    maxItems: 1
> > +
> > +  assigned-clock-rates:
> > +    maxItems: 1
> > +
> 
> assigned-clock* should be dropped.
> 
> https://lore.kernel.org/all/20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org/

Agreed.

> > +
> > +  orientation: true
> > +  rotation: true
> 
> I think you can drop both of these too.

Aren't they needed given that the binding ends with

additionalProperties: false

?

> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +    description: MIPI CSI-2 transmitter port
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            anyOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +        required:
> > +          - data-lanes
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg

The device requires a clock, shouldn't the clocks property be required ?

> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ox05b1s: ox05b1s@36 {
> > +            compatible = "ovti,ox05b1s";
> > +            reg = <0x36>;
> > +            reset-gpios = <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW>;

This isn't specified in the bindings. Does the example validate ?

> > +            orientation = <2>;
> > +            rotation = <0>;
> > +            status = "okay";
> 
> You should include assigned-clock* here in the example.

Is that mandatory ? I'd rather omit it, I think it only adds noise.

> > +
> > +            port {
> > +                ox05b1s_mipi_0_ep: endpoint {
> > +                    remote-endpoint = <&mipi_csi0_ep>;
> > +                    data-lanes = <1 2 3 4>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...

-- 
Regards,

Laurent Pinchart

