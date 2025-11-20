Return-Path: <linux-media+bounces-47456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A4C72F88
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 78D102A4EF
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AB6301482;
	Thu, 20 Nov 2025 08:53:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86A2AEF5
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628802; cv=none; b=onhnWDwVP+JtBJduCsfE9hrnjyTgbQPRZHpcH5ipgMVkuCLTFdwjp8LLh7xOuLda/DedTr8hURzjupq6V++8+Oe2KuZWR6ACpZf4CNvOX05XtoMu/ZG6VHGaBV++I6v7hbubYtGTaO330/E8n7EGUw7f21FMQVfmd1Ent8EiNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628802; c=relaxed/simple;
	bh=u+tUqV58sHcSyq09Jq44vf4tuWh+YWc21D3uipfTX9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh0HSYcIBvKbJwQULNXY/fLAOoiRt9kdesLwYUa+AvKk98CHBl32546/3hhVUW+6srovtmPM7Geq9SbuSXeSvnm1yLXv9Oxk6vbGRL8x0EF1PJ5Jg3S3dc+cGL7G5gmpWHpSrrvhBOcjhDlco2qR2s9ShqNth6zrJjQ06QyY+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM0PY-0003if-0V; Thu, 20 Nov 2025 09:53:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM0PX-001O9B-1R;
	Thu, 20 Nov 2025 09:53:03 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM0PX-00Dy6a-10;
	Thu, 20 Nov 2025 09:53:03 +0100
Date: Thu, 20 Nov 2025 09:53:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/4] media: dt-bindings: adi,adv7180: add VPP and CSI
 register maps
Message-ID: <aR7W76sUxs2gm1LL@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
 <20251119-b4-adv7180-vpp-sub-device-v2-1-86a7790b63ab@pengutronix.de>
 <20251120-calm-invisible-bullmastiff-ceaf71@kuoka>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-calm-invisible-bullmastiff-ceaf71@kuoka>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Thu, 20 Nov 2025 09:04:48 +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 19, 2025 at 05:25:51PM +0100, Michael Tretter wrote:
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> > index dee8ce7cb7ba..dbbbe76291bc 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> > @@ -30,7 +30,27 @@ properties:
> >            - adi,adv7282-m
> >  
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: main register map
> > +      - description: CSI register map
> > +      - description: VPP register map
> > +    description:
> > +      The ADV7180 family may have up to three register maps. All chips have
> > +      the main register map. The availability of the CSI and VPP register maps
> > +      depends on the chip variant.
> > +
> > +      The addresses of the CSI and VPP register maps are programmable by
> > +      software. They depend on the board layout and other devices on the I2C
> > +      bus and are determined by the hardware designer to avoid address
> > +      conflicts on the I2C bus.
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: main
> > +      - enum: [ csi, vpp ]
> > +      - enum: [ csi, vpp ]
> 
> Last entry must be:
> 
> const: vpp
> 
> We do not allow flexible order... but the problem is that your if:then:
> does not match above at all. You do not have three items anywhere.

I'm not entirely sure, if I correctly understand that comment.

The adi,adv7280-m and adi,adv7282-m have all three items and don't need
an if:then:. Do I have explicitly define the binding with three items,
too?

The chip has the following variants:

adi,adv7180:     main
adi,adv7180cp:   main
adi,adv7180st:   main
adi,adv7182:     main
adi,adv7280:     main, vpp
adi,adv7280-m:   main, csi, vpp
adi,adv7281:     main, csi
adi,adv7281-m:   main, csi
adi,adv7281-ma:  main, csi
adi,adv7282:     main, vpp
adi,adv7282-m:   main, csi, vpp

If I make the last entry (vpp) const, I allow exactly these variants.

For the adi,adv7280-m compatible, the following combinations would be
valid or invalid:

adi,adv7280-m:   main

is valid, because only main is mandatory. For csi and vpp, the default
addresses are used.

adi,adv7280-m:   main, vpp

is valid, because the second entry may be vpp. For csi, the default
address is used.

adi,adv7280-m:   main, vpp, csi

is invalid, because the entries must be in the defined order, and
flexible order is not possible.

Is this correct and matches the binding definition?

Thanks!

Michael

> 
> 
> >  
> >    powerdown-gpios:
> >      maxItems: 1
> > @@ -138,6 +158,58 @@ allOf:
> >        required:
> >          - ports
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - adi,adv7180
> > +              - adi,adv7180cp
> > +              - adi,adv7180st
> > +              - adi,adv7182
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +
> > +        reg-names:
> > +          maxItems: 1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - adi,adv7281
> > +              - adi,adv7281-m
> > +              - adi,adv7281-ma
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +
> > +        reg-names:
> > +          items:
> > +            - const: main
> > +            - enum: [ csi ]
> 
> const
> 
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - adi,adv7280
> > +              - adi,adv7282
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +
> > +        reg-names:
> > +          items:
> > +            - const: main
> > +            - enum: [ vpp ]
> 
> const
> 
> > +
> >  examples:

