Return-Path: <linux-media+bounces-17044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4D962B22
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 17:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63291284010
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77C41A08C0;
	Wed, 28 Aug 2024 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtlyIXZl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5491DA32;
	Wed, 28 Aug 2024 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857559; cv=none; b=JkWoitQePJpL0P6TQeoGg5mxPihPvtwqBfec1/BIIooEDr+6e4/hWQueIKQp+2sMUsxysbbuZjRebHrvvvMdB5IabSR8wiBhBMq1yMY319qKWrAqP46goNgYXbBEhFMBcxPuGSaP6Y01bJ1a/+JlO49eEtb1Cdlnaqns3GS5lCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857559; c=relaxed/simple;
	bh=6Vo1aKkY0Rdj6AZrKv1kbReR++M9czmdnc21wj24QlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsCRwBt281TR7meYuZDvU1uK19ljexrIzxGR0Exf0XqcbxmaP4xKu/NWpgEgaIDul4vXQPMBlUthWl2r950wk9M5rs9Gq2I7YTKA8UEhB/iePNjE+g2AZQo0yN5UbZhM2sF5jge3BcSrNxCFoHApnGvXEmdwIcB9LXwJnVaPaOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtlyIXZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CDAC4CEC1;
	Wed, 28 Aug 2024 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857558;
	bh=6Vo1aKkY0Rdj6AZrKv1kbReR++M9czmdnc21wj24QlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtlyIXZldOMARdAO3Q11fY81fJQfKJPNjKpbDcjLD0l4+jCjPohFdEvLkJBwp3X7l
	 QmV8e+UOb4DhNx95fEARbw+HJXjcArzBDzs8IstHOJIiYl/IyC4GeGOUpN3JCY4FDa
	 yEuRsFVtLad1CxjXieE63mm/ZizdYgaetD4CLGhfDKEIDEsmdOzIUvZx57hzzC0GJU
	 X1d0SNGvt/B/IPYeEuMt0gICfKXy/rGt6o/r7PU75vg9C0qE4pXQHf4nfyyqWArZz5
	 IcI4nTQ+WOGhNs6fbSJNE3g+R5v51/R26zrk6SA/t3AJqJyFb1cYF2aFu3NlSo5V+K
	 RfhEGX0+ZyI3g==
Date: Wed, 28 Aug 2024 10:05:56 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <20240828150556.GB3680498-robh@kernel.org>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
 <20240827081233.GE2636928@fsdn.se>
 <20240827213441.GA30398@pendragon.ideasonboard.com>
 <9e18bbf4-ae22-4d53-a998-67ad5807d72b@kernel.org>
 <20240828105008.GJ30398@pendragon.ideasonboard.com>
 <530102e8-e638-49c1-a0ac-960c51d4f3dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <530102e8-e638-49c1-a0ac-960c51d4f3dc@kernel.org>

On Wed, Aug 28, 2024 at 01:06:37PM +0200, Krzysztof Kozlowski wrote:
> On 28/08/2024 12:50, Laurent Pinchart wrote:
> > On Wed, Aug 28, 2024 at 07:36:35AM +0200, Krzysztof Kozlowski wrote:
> >> On 27/08/2024 23:34, Laurent Pinchart wrote:
> >>> On Tue, Aug 27, 2024 at 10:12:33AM +0200, Niklas Söderlund wrote:
> >>>> On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas Söderlund wrote:
> >>>>>> The ISP Channel Selector IP is the same for all current Gen4 devices.
> >>>>>> This was not known when adding support for V3U and V4H and a single SoC
> >>>>>> specific compatible was used.
> >>>>>>
> >>>>>> Before adding more SoC specific bindings for V4M add a family compatible
> >>>>>> fallback for Gen4. That way the driver only needs to be updated once for
> >>>>>> Gen4, and we still have the option to fix any problems in the driver if
> >>>>>> any testable differences between the SoCs are found.
> >>>>>>
> >>>>>> There are already DTS files using the V3U and V4H compatibles which
> >>>>>> needs to be updated to not produce a warning for DTS checks. The driver
> >>>>>> also needs to kept the compatible values to be backward compatible , but
> >>>>>> for new Gen4 SoCs such as V4M we can avoid this.
> >>>>>>
> >>>>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>>>>> ---
> >>>>>> * Changes since v1
> >>>>>> - New in v2.
> >>>>>> ---
> >>>>>>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
> >>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>>>>> index 33650a1ea034..730c86f2d7b1 100644
> >>>>>> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> >>>>>> @@ -22,6 +22,7 @@ properties:
> >>>>>>        - enum:
> >>>>>>            - renesas,r8a779a0-isp # V3U
> >>>>>>            - renesas,r8a779g0-isp # V4H
> >>>>>> +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> >>>>>
> >>>>> Adding generic fallback post-factum is odd, does not feel reliable.
> >>>>> Instead use specific compatibles as fallbacks.
> >>>>
> >>>> I agree, it feels a bit odd. But this was the road we hammered out at 
> >>>> great pain for how to be able to move forward with this issue for the 
> >>>> other IP block involved in video capture for R-Car Gen4, VIN [1]. This 
> >>>> just mirrors that long discussion decision for the R-Car CSISP.
> >>>>
> >>>> I would hate to have different solutions for the two.
> >>>>
> >>>> 1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
> >>>>    https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se/
> >>>
> >>> The compatible fallback for VIN has been added following a request from
> >>> Conor and Rob, so it would be nice if the three of you could agree to
> >>> achieve consistency in the bindings :-)
> >>
> >> Don't twist our answers. You need fallback, but specific, not family.
> >> There was a countless number of answers from Rob that specific
> >> compatibles are preferred.
> >>
> >> Look, Conor's reply:
> >>
> >> https://lore.kernel.org/all/20240620-gating-coherent-af984389b2d7@spud/
> >> Do you see family fallback? I think "r8a779g0" is SoC.
> >>
> >> Look here:
> >> https://lore.kernel.org/all/20240610-screen-wolverine-78370c66d40f@spud/
> >>
> >> Or here
> >> https://lore.kernel.org/all/20240624-rented-danger-300652ab8eeb@wendy/
> >> where Conor agrees against!
> >>
> >> So let me actually NAK it - you got multiple comments on VIN to use
> >> specific compatible.
> > 
> > Krzysztof, this tone is not acceptable, regardless of the technical
> > argument. Period.
> 
> Except elevated arguments I don't think the tone is not acceptable.

You cannot control nor change how someone interprets your tone, so there 
is little point in arguing about it. But it would be worthwhile to 
reflect on the comment.

> Anyway, please provide references supporting your statement that Conor
> and Rob encouraged using generic (not specific) fallback compatible.

Encouraged? Certainly not, but tolerated or allowed, yes. Every other 
Renesas binding reflects that.

Rob

