Return-Path: <linux-media+bounces-17003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E204962543
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 611AC1C21E69
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 10:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046E016BE3A;
	Wed, 28 Aug 2024 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k+e33O8+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5B5A79B;
	Wed, 28 Aug 2024 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724842222; cv=none; b=AjISVVfLupUvX5japRKyOLzD0A+3K5aOonAN7Mk8lsMkiQH6fDfoZF6EAZrzZ4BNYS1ws0rPWgEQvNUG1TIC+ahF83a0QSZ+kQdlAyBr8xKva5Pd10119aAeNHO/AdkTH7wlyA40aq3O8Af6j3xLMqXXo5OKg/KJFxGNJgDmQNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724842222; c=relaxed/simple;
	bh=gjK3zCwRWXvzWlmgw9OZD91kdRNz7qUGawB3pLkeXvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6/+hgAML6rN/mG9vndsNDegoqpMv97ZzoJIzKa+CMO2DnDRZcL/RfRaTDLmaSBCkLAjt7KO8fAozZ/Sh8nvZ5wI93QCzvHrB1d5yPOi1+QhMdMkOFCJjrAGY+rANMnnrZzQ2e697fVvGBBZbbco5UIlsulVd3GLktsVsLOEfXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k+e33O8+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3176220;
	Wed, 28 Aug 2024 12:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724842146;
	bh=gjK3zCwRWXvzWlmgw9OZD91kdRNz7qUGawB3pLkeXvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+e33O8+t3VJOQSZHK9XOg0/kR2bcqUgFZYmsRkfiYGJIoiqs68kUt+Hw3rKDsZvJ
	 hs3jpAthxd3fITLJMYElu4xbxW+r/b8sUNHrRuggUg18sByk+SjTDApTNrbjP2J+y7
	 yhLchM6MDkIRoi4GH21Jk3LZT1GM5kReY7hJoRrc=
Date: Wed, 28 Aug 2024 13:50:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <20240828105008.GJ30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
 <20240827081233.GE2636928@fsdn.se>
 <20240827213441.GA30398@pendragon.ideasonboard.com>
 <9e18bbf4-ae22-4d53-a998-67ad5807d72b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e18bbf4-ae22-4d53-a998-67ad5807d72b@kernel.org>

On Wed, Aug 28, 2024 at 07:36:35AM +0200, Krzysztof Kozlowski wrote:
> On 27/08/2024 23:34, Laurent Pinchart wrote:
> > On Tue, Aug 27, 2024 at 10:12:33AM +0200, Niklas Söderlund wrote:
> >> On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
> >>> On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas Söderlund wrote:
> >>>> The ISP Channel Selector IP is the same for all current Gen4 devices.
> >>>> This was not known when adding support for V3U and V4H and a single SoC
> >>>> specific compatible was used.
> >>>>
> >>>> Before adding more SoC specific bindings for V4M add a family compatible
> >>>> fallback for Gen4. That way the driver only needs to be updated once for
> >>>> Gen4, and we still have the option to fix any problems in the driver if
> >>>> any testable differences between the SoCs are found.
> >>>>
> >>>> There are already DTS files using the V3U and V4H compatibles which
> >>>> needs to be updated to not produce a warning for DTS checks. The driver
> >>>> also needs to kept the compatible values to be backward compatible , but
> >>>> for new Gen4 SoCs such as V4M we can avoid this.
> >>>>
> >>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>>> ---
> >>>> * Changes since v1
> >>>> - New in v2.
> >>>> ---
> >>>>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>>> index 33650a1ea034..730c86f2d7b1 100644
> >>>> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>>> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>>> @@ -22,6 +22,7 @@ properties:
> >>>>        - enum:
> >>>>            - renesas,r8a779a0-isp # V3U
> >>>>            - renesas,r8a779g0-isp # V4H
> >>>> +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> >>>
> >>> Adding generic fallback post-factum is odd, does not feel reliable.
> >>> Instead use specific compatibles as fallbacks.
> >>
> >> I agree, it feels a bit odd. But this was the road we hammered out at 
> >> great pain for how to be able to move forward with this issue for the 
> >> other IP block involved in video capture for R-Car Gen4, VIN [1]. This 
> >> just mirrors that long discussion decision for the R-Car CSISP.
> >>
> >> I would hate to have different solutions for the two.
> >>
> >> 1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
> >>    https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se/
> > 
> > The compatible fallback for VIN has been added following a request from
> > Conor and Rob, so it would be nice if the three of you could agree to
> > achieve consistency in the bindings :-)
> 
> Don't twist our answers. You need fallback, but specific, not family.
> There was a countless number of answers from Rob that specific
> compatibles are preferred.
> 
> Look, Conor's reply:
> 
> https://lore.kernel.org/all/20240620-gating-coherent-af984389b2d7@spud/
> Do you see family fallback? I think "r8a779g0" is SoC.
> 
> Look here:
> https://lore.kernel.org/all/20240610-screen-wolverine-78370c66d40f@spud/
> 
> Or here
> https://lore.kernel.org/all/20240624-rented-danger-300652ab8eeb@wendy/
> where Conor agrees against!
> 
> So let me actually NAK it - you got multiple comments on VIN to use
> specific compatible.

Krzysztof, this tone is not acceptable, regardless of the technical
argument. Period.

Rob, could you please mediate this ?

-- 
Regards,

Laurent Pinchart

