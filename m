Return-Path: <linux-media+bounces-22133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4359DA3DB
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599F9163F0E
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE15718858E;
	Wed, 27 Nov 2024 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4Z9PMUH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5F13C816;
	Wed, 27 Nov 2024 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695951; cv=none; b=dtOXZikznkCRSP5n98g1o/GKYNIxadNcQlC3h7W5oIWJmKf1EOhn7sH7JM73wfWU29GopUteg7vMMJru3u5XI0uE5y2kQme9B9T3zHG/s0v2S3zSLa+71ozoabiiPutB0/fKXK2IFU9n9fOOqT0ei/nyFiw/cuSiEgcsAQXORfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695951; c=relaxed/simple;
	bh=s+JsxTyZU4NpOFUjLzg5ACpO3wWpBUA6GI5rB7y91d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8I5aGLHsdJbDa2eIrUDQB661gmUZ7ER7GMwm9wlH/YVC7+WPEW124Ia6YOIDDtdFO+iyp8UQLbkDsMv9YZdpSu4+VkoGZxdZQO+A66MwZ4TgNK03HBQirUBGZ4tDUaaBJWComOGCWsBXJRPxHPme6KB2Zxddmggn59XI9cUP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4Z9PMUH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C614FC4CECC;
	Wed, 27 Nov 2024 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732695950;
	bh=s+JsxTyZU4NpOFUjLzg5ACpO3wWpBUA6GI5rB7y91d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4Z9PMUHqihqUiqbCxITzkMYqF+ZK/MHJpHkvOhIDujsKDIHgRBO+gCjEhyWVHi3g
	 GZRqRfkkNqcnBmrJyBWIJgg3mpaG1S0v+YO14x4gK61vIhEBxzzt/MrxAX1cK6NPzM
	 GO0c158Uk/Oy7lrd9YnTaTNO/mR+xdI/jYv32u8JomHAx9jS0AucVzD8wEKk+S3Iun
	 46oCy2TbmtmHrDdEwXXTFSfjFmbLxMqnNd/puf70N5ANOudH3Vgn6XaD59Zzo94WrR
	 0LHYazWJGt155BhHZIoyEjm5i0iV4zJyJrwKvVxD66GI5VZkR+jmD0cEilTIZ3n6PX
	 16F8jBGyG3heg==
Date: Wed, 27 Nov 2024 09:25:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org, 
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com, 
	robert.chiras@nxp.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com, alain.volmat@foss.st.com, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, alexander.stein@ew.tq-group.com, 
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de, 
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Message-ID: <oj3y3bx2ojah3meyc5ttnm2j2jjx4fq6xezbxkz265cygcilct@avdydgmfcltc>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-2-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126155100.1263946-2-mirela.rabulea@nxp.com>

On Tue, Nov 26, 2024 at 05:50:57PM +0200, Mirela Rabulea wrote:
> Add bindings for Omnivision OX05B1S sensor.
> Also add compatible for Omnivision OS08A20 sensor.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> 
> Changes in v2:
> 	Small updates on description
> 	Update subject, drop "bindings" and "driver"
> 	Just one binding patch (squash os08a20 bindings)
> 	Re-flow to 80 columns.
> 	Drop clock name (not needed in case of single clock)
> 	Make the clock required property, strictly from sensor module point of view, it is mandatory (will use a fixed clock for nxp board)
> 	Add regulators: avdd, dvdd, dovdd
> 	Add $ref: /schemas/media/video-interface-devices.yaml
> 	Drop assigned-clock* properties (defined in clocks.yaml)
> 	Keep "additionalProperties : false" and orientation/rotation (unevaluatedProperties: false was suggested, but only orientation/rotation are needed from video-interface-devices.yaml)

I don't understand why you did not follow that advice. Reasoning is not
really correct - if this is video interface device, then we expect
entire schema to be somehow applicable. You will now get the same review
comment.

> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    items:

You can drop items here, for simpler code.

> +      - enum:
> +          - ovti,ox05b1s
> +          - ovti,os08a20

Keep alphabetical order.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (24 MHz)
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to XSHUTDOWN pin. Active low.

"Active low XSHUTDOWN pin". No need to repeat that GPIO phandle is a
reference to the GPIO.


> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Power for analog circuit (2.8V)
> +
> +  dovdd-supply:
> +    description: Power for I/O circuit (1.8V)
> +
> +  dvdd-supply:
> +    description: Power for digital circuit (1.2V)
> +
> +  orientation: true
> +
> +  rotation: true

Drop these two and use unevaluatedProperties: false at the end.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description: MIPI CSI-2 transmitter port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            anyOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +        required:
> +          - data-lanes
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port

Supplies should be required. Devices rarely work without power.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ox05b1s@36 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof


