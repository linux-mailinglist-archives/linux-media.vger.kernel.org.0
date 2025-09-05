Return-Path: <linux-media+bounces-41852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA84B45CA6
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 17:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5F553A80C5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 15:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598252F7AD7;
	Fri,  5 Sep 2025 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZf5dAID"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A262F15D3;
	Fri,  5 Sep 2025 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757086478; cv=none; b=JXCX5S3BtaAEOPO/AZKC5Aw2jPCs63DT3r9XM05RvM7Hols52ArOs4PlREXioC/iu1++Fvh2Di6SUiac9dUdTQJ5uYlNoFiTRiTLGbm4VrhA5PTg2/q42QSNVMc+JCjJYz5OBQc9p9xC3KP4e0l/gagNBFFqCYOtoRqVTIjK5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757086478; c=relaxed/simple;
	bh=S2f4zsIVkSVZX6263AtP4FMC2mXV744EV7vcHdcxvFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DM1vQw7ljbuDMbE/CPrM5a9NeEzisdIWVvL5di+76pRbNPnes5kxpIz+rj0lesbUDYIVBnE9olO9fNCCPcs9dpM5x2+IEbkGUlZstSzU+gccxDoSro+t13CcS/pO396VCoVJEXTLn0Tgq3wVwUP4QWuN7ZAnVMvLJS7D20/7ylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZf5dAID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FB7C4CEF1;
	Fri,  5 Sep 2025 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757086478;
	bh=S2f4zsIVkSVZX6263AtP4FMC2mXV744EV7vcHdcxvFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZf5dAIDALZlpnlmorOcqX3O1MGgtWtRZyVieJ+6MsMxP5YD1Q4QFHkgp1Vmntr6C
	 wvPgaa1NLQiDAngT9jt9lKUU1wIiwiuNyxnEOarNr5lRwAMQJ4aXAuUBXL3YNsLKhi
	 dRxiXVQL7Bd7lIv8/Y8Vd/zbd6htZe8bktPgBmflpgd73LEOdGzpHUxeungKUbVvGU
	 O3I7FiHp/ADxKKQHPvIXMKVZ3J/a97+jB5Pz92nJvsb7kuKequ1onDHT8CLiL4YHS/
	 8r76zT7Emhrny/U3xZPoE9R228e0LdSFRJQpnIqCd1gx+HF2WjfhzOTYwLihlA1KK6
	 bakXfsYfKkkKA==
Date: Fri, 5 Sep 2025 10:34:37 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250905153437.GA970284-robh@kernel.org>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
 <20250905151739.GA953718-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905151739.GA953718-robh@kernel.org>

On Fri, Sep 05, 2025 at 10:17:39AM -0500, Rob Herring wrote:
> On Fri, Sep 05, 2025 at 09:59:29AM +0200, Aleksandrs Vinarskis wrote:
> > Introduce common generic led consumer binding, where consumer defines
> > led(s) by phandle, as opposed to trigger-source binding where the
> > trigger source is defined in led itself.
> > 
> > Add already used in some schemas 'leds' parameter which expects
> > phandle-array. Additionally, introduce 'led-names' which could be used
> > by consumers to map LED devices to their respective functions.
> 
> Please update the existing user dropping the type $ref and indicate how 
> many entries (i.e. "maxItems: 1").

Nevermind, I see you did...

> 
> > 
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..077dbe3ad9ff3fa15236b8dd1f448c00271e4810
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common leds consumer
> > +
> > +maintainers:
> > +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> > +
> > +description:
> > +  Some LED defined in DT are required by other DT consumers, for example
> > +  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> > +  approach which is typically used as 'soft' binding, referencing LED
> > +  devices by phandle makes things simpler when 'hard' binding is desired.
> > +
> > +  Document LED properties that its consumers may define.
> > +
> 
> select: true
> 
> 
> > +properties:
> > +  leds:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      A list of LED device(s) required by a particular consumer.
> > +    items:
> > +      maxItems: 1

Also, the select is going to cause a problem with nodes named 'leds', so 
it will need to be:

leds:
  oneOf:
    - type: object
    - $ref: /schemas/types.yaml#/definitions/phandle-array
      ...

> > +
> > +  led-names:
> > +    description:
> > +      A list of device name(s). Used to map LED devices to their respective
> > +      functions, when consumer requires more than one LED.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    leds {
> > +        compatible = "gpio-leds";
> > +
> > +        privacy_led: privacy-led {
> > +            color = <LED_COLOR_ID_RED>;
> > +            default-state = "off";
> > +            function = LED_FUNCTION_INDICATOR;
> > +            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> > +        };
> > +    };
> > +
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      camera@36 {
> > +        compatible = "ovti,ov02c10";
> > +        reg = <0x36>;
> > +
> > +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&cam_rgb_default>;
> > +
> > +        led-names = "privacy-led";
> > +        leds = <&privacy_led>;
> > +
> > +        clocks = <&ov02e10_clk>;
> > +
> > +        assigned-clocks = <&ov02e10_clk>;
> > +        assigned-clock-rates = <19200000>;
> > +
> > +        avdd-supply = <&vreg_l7b_2p8>;
> > +        dvdd-supply = <&vreg_l7b_2p8>;
> > +        dovdd-supply = <&vreg_cam_1p8>;
> > +
> > +        port {
> > +          ov02e10_ep: endpoint {
> > +            data-lanes = <1 2>;
> > +            link-frequencies = /bits/ 64 <400000000>;
> > +            remote-endpoint = <&csiphy4_ep>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > 
> > -- 
> > 2.48.1
> > 

