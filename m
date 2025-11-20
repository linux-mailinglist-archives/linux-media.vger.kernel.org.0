Return-Path: <linux-media+bounces-47486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E84C73DC4
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73D024E6553
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 12:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C036E3314DF;
	Thu, 20 Nov 2025 12:01:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212A271A6D
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640081; cv=none; b=TCz6JFao/J7KOTnlAdMiacAMyPECboXdhIGr3iHWq3cxavPIZW1EtI2U3xlRjxE3E4BZPOAUwJDcoq0gYdVGUEtkJVuUgOc2hgBkrDJNnEiWwI8o9Y/iuZDRCrEaI+fj1r2dE4UtdEQ+AB1k/ZdbAs5zRypYQBmIVhpZveTsEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640081; c=relaxed/simple;
	bh=KJsQC5O9cBTtiYQW8uUwYST5pWYTTuZxIoDDqSTU33Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbkAMhofcSqyChQ80Y7yqxNjNRfhiMxrp8IqDpUjewDEWEG83G1CwhxARSjaa5aBCTDk+Ml5OPFsLDccN7Ov/j4H2nyHygPYJVZ6nNBD6dKlWL5Tsxgok3IUhzszknUYX/6AOMbIip7ccoBGPgHxIYndo4kas0nu/xnZLHOORaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM3LU-0006rr-Rj; Thu, 20 Nov 2025 13:01:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM3LU-001PVg-1C;
	Thu, 20 Nov 2025 13:01:04 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM3LU-00E0d2-0v;
	Thu, 20 Nov 2025 13:01:04 +0100
Date: Thu, 20 Nov 2025 13:01:04 +0100
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
Message-ID: <aR8DAObqhSh5BJky@pengutronix.de>
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
 <aR7W76sUxs2gm1LL@pengutronix.de>
 <bdc6a80f-3d26-420e-8c83-839f06c365a5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdc6a80f-3d26-420e-8c83-839f06c365a5@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Thu, 20 Nov 2025 10:05:43 +0100, Krzysztof Kozlowski wrote:
> On 20/11/2025 09:53, Michael Tretter wrote:
> > On Thu, 20 Nov 2025 09:04:48 +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Nov 19, 2025 at 05:25:51PM +0100, Michael Tretter wrote:
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> >>> index dee8ce7cb7ba..dbbbe76291bc 100644
> >>> --- a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> >>> @@ -30,7 +30,27 @@ properties:
> >>>            - adi,adv7282-m
> >>>  
> >>>    reg:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - description: main register map
> >>> +      - description: CSI register map
> >>> +      - description: VPP register map
> >>> +    description:
> >>> +      The ADV7180 family may have up to three register maps. All chips have
> >>> +      the main register map. The availability of the CSI and VPP register maps
> >>> +      depends on the chip variant.
> >>> +
> >>> +      The addresses of the CSI and VPP register maps are programmable by
> >>> +      software. They depend on the board layout and other devices on the I2C
> >>> +      bus and are determined by the hardware designer to avoid address
> >>> +      conflicts on the I2C bus.
> >>> +
> >>> +  reg-names:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - const: main
> >>> +      - enum: [ csi, vpp ]
> >>> +      - enum: [ csi, vpp ]
> >>
> >> Last entry must be:
> >>
> >> const: vpp
> >>
> >> We do not allow flexible order... but the problem is that your if:then:
> >> does not match above at all. You do not have three items anywhere.
> > 
> > I'm not entirely sure, if I correctly understand that comment.
> > 
> > The adi,adv7280-m and adi,adv7282-m have all three items and don't need
> > an if:then:. Do I have explicitly define the binding with three items,
> > too?
> 
> Which comment? That third item cannot be csi? What is odd here?
> 
> 
> > 
> > The chip has the following variants:
> > 
> > adi,adv7180:     main
> > adi,adv7180cp:   main
> > adi,adv7180st:   main
> > adi,adv7182:     main
> > adi,adv7280:     main, vpp
> > adi,adv7280-m:   main, csi, vpp
> > adi,adv7281:     main, csi
> > adi,adv7281-m:   main, csi
> > adi,adv7281-ma:  main, csi
> > adi,adv7282:     main, vpp
> > adi,adv7282-m:   main, csi, vpp
> 
> So where is csi as third item?
> 
> Anyway, you also miss minItems in your if:then: cases.

The minItems in the if:then: cases would be the same as in the top level
definition. Do I have to override the minItems if it's the same?

> 
> > 
> > If I make the last entry (vpp) const, I allow exactly these variants.
> > 
> > For the adi,adv7280-m compatible, the following combinations would be
> > valid or invalid:
> > 
> > adi,adv7280-m:   main
> > 
> > is valid, because only main is mandatory. For csi and vpp, the default
> > addresses are used.
> > 
> > adi,adv7280-m:   main, vpp
> > 
> > is valid, because the second entry may be vpp. For csi, the default
> > address is used.
> > 
> > adi,adv7280-m:   main, vpp, csi
> > 
> > is invalid, because the entries must be in the defined order, and
> > flexible order is not possible.
> > 
> > Is this correct and matches the binding definition?
> 
> It does not match your code.

If I change the last entry to

	- const: csi

to disallow vpp as a third item (which is compliant to the example), the
binding is fine. Correct?

Michael

