Return-Path: <linux-media+bounces-42077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FAFB4A583
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 382B23A8732
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA95253356;
	Tue,  9 Sep 2025 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="TM6Aozzh"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115924EF76;
	Tue,  9 Sep 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407100; cv=pass; b=EWIp4BcCAnWpBJmeK6WNhOAIU2/HrM3MQ5kQUEExVgghJNcxHOPOHJ1xbf7R5lxmoHLSiqIASEEWrJWlD/sMafQjG7V2roMeQvM2404wcqezMzgd23XiCL1iIQdhTs9hpwiz15Dm5cug4qvAPzkzh1qUqomoM2zCXpf1vSHnzh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407100; c=relaxed/simple;
	bh=UAlbRau57FLa95xbSqzEkELi2fP5jfjN/IV0/0N6Dd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPUfqh7oNJRSzTrvKg5lpygvq4O/MsnuaKXrg2HQ+zZJFKB/xxyTzgDRMaL82BBEunSARfAbMqcqw0gJbPBnvkxGSdi8NcCgbRgdSzXITJ+tBmTM8R6BqaOZ/q005cx/XtRvkbQrj/5pHVpWW3B3Hgms+AW0pS0sNqXh4gfnBv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=TM6Aozzh; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cLcf85BxtzyQ5;
	Tue,  9 Sep 2025 11:38:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1757407088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cafJFHXmLgV2tuyOB5uga2YykmlqWipvwJGhaBu2g+4=;
	b=TM6AozzhGcIXM7Ah1cx0qibrl2Wh4WPYFqdUpG23dHy/Q88hobRWnOv0q2k3z7gbXw1T4b
	2B60+QHJot6DUiwDS+p1qHX86bhggrFQ0brMoc/lalcJNmCs7tlUW82glaMW3A0NfMtXqL
	vY/PpjnGP7PFJ4N4VMdnZNMVauN0LDU=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1757407088; a=rsa-sha256; cv=none;
	b=PfxDC7zdqKa/iVpQzeaVlgMVy+tnNAKPifWAYpYWPR9ZexhprWwebkQZpHc38IedhZX4r+
	hqByaTfWH8D3h1yPTS+CnW+F4aLegSvpxYHrs02YXSxUAVNeMEdb67b5mYbauGq2j5fPz/
	wr3Ke/lXPh+JmyNcPlV5Qwf1cgz9aKA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1757407088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cafJFHXmLgV2tuyOB5uga2YykmlqWipvwJGhaBu2g+4=;
	b=QalqDfF/ivRbEssOms8x4jVTq4smrnuuLJjPWZ+nHDrz7o5VtSHkoKUrOF1HDO9g6Idqi8
	38LmXE68rngFger8vtceBB7JvXk7CEfUugXl9v95EZB3F9HDoAUZYLox3N0awJrrgRpEVT
	56DjRUyfKk/TtAC+gk28WK9bwQ3F4u4=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E7C67634C93;
	Tue,  9 Sep 2025 11:38:07 +0300 (EEST)
Date: Tue, 9 Sep 2025 11:38:07 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 1/2] media: dt-bindings: i2c: add Himax HM1246 image
 sensor
Message-ID: <aL_nb8J1JNYxLG36@valkosipuli.retiisi.eu>
References: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
 <20250526-hm1246-v2-1-6b882827a3a5@emfend.at>
 <aLq0jJtdaxIpN9CT@valkosipuli.retiisi.eu>
 <b2826079-7db5-4adf-9e2a-e372e977acf3@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2826079-7db5-4adf-9e2a-e372e977acf3@emfend.at>

Hi Matthias,

On Tue, Sep 09, 2025 at 10:32:21AM +0200, Matthias Fend wrote:
> Hi Sakari,
> 
> Thanks for you feedback!
> 
> Am 05.09.2025 um 11:59 schrieb Sakari Ailus:
> > Hi Matthias,
> > 
> > Thanks for the set.
> > 
> > On Mon, May 26, 2025 at 08:59:27AM +0200, Matthias Fend wrote:
> > > Add YAML device tree binding for Himax HM1246 image sensor.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> > > ---
> > >   .../bindings/media/i2c/himax,hm1246.yaml           | 111 +++++++++++++++++++++
> > >   1 file changed, 111 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..8a67de7e3ffcaa9f1acfe443b1e36fffb79dbacf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> > > @@ -0,0 +1,111 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright 2025 Matthias Fend <matthias.fend@emfend.at>
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/himax,hm1246.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Himax HM1246-AWD 1/3.7-Inch megapixel SoC image sensor
> > > +
> > > +maintainers:
> > > +  - Matthias Fend <matthias.fend@emfend.at>
> > > +
> > > +description:
> > > +  The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> > > +  array size of 1296 x 976. It is programmable through an I2C interface and
> > > +  connected via parallel bus.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: himax,hm1246
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: Input reference clock (6 - 27 MHz)
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description: Active low XSHUTDOWN pin
> > > +    maxItems: 1
> > > +
> > > +  avdd-supply:
> > > +    description: Power for analog circuit (3.0 - 3.6 V)
> > > +
> > > +  iovdd-supply:
> > > +    description: Power for I/O circuit (1.7 - 3.6 V)
> > > +
> > > +  dvdd-supply:
> > > +    description: Power for digital circuit (1.5 / 1.8 V)
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +    description: Parallel video output port
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          bus-type:
> > > +            const: 5
> > 
> > Does the device also support e.g. Bt.656? If not, you can drop this.
> 
> It is always a parallel interface. Okay, will remove it.
> > 
> > If the rest of the parallel interface parameter properties aren't
> > mandatory, what are their default values?
> 
> The defaults are:
> hsync-active: 1 (high)
> vsync-active: 1 (high)
> pclk-sample: 0 (falling)
> 
> Should I add the default values? The properties section of the endpoint
> would then look like this:
> 
> properties:
>   hsync-active:
>     default: 1
> 
>   vsync-active:
>     default: 1
> 
>   pclk-sample:
>     default: 0

If these indeed are the typical values, using the defaults makes sense. The
other option is indeed to make them required.

> 
> > 
> > > +
> > > +        required:
> > > +          - bus-type
> 
> Then I should probably remove that too?
> 
> > > +
> > > +    required:
> > > +      - endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - avdd-supply
> > > +  - iovdd-supply
> > > +  - dvdd-supply
> > > +  - port
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/media/video-interfaces.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        sensor@24 {
> > > +            compatible =  "himax,hm1246";
> > > +            reg = <0x24>;
> > > +
> > > +            clocks = <&hm1246_clk>;
> > > +
> > > +            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> > > +
> > > +            avdd-supply = <&hm1246_avdd>;
> > > +            iovdd-supply = <&hm1246_iovdd>;
> > > +            dvdd-supply = <&hm1246_dvdd>;
> > > +
> > > +            orientation = <2>;
> > 
> > It'd be nice to add macros for these in
> > include/dt-bindings/media/video-interfaces.h .
> 
> True. However, since this is not specific to this sensor, I think it's
> something for a separate series.
> Should I omit these properties in this example?

Feel free to keep them.

Such definitions should go to another patch (or even series) in any case.

-- 
Kind regards,

Sakari Ailus

