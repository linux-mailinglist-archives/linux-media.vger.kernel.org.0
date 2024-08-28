Return-Path: <linux-media+bounces-17043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9F962AAB
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4A01C20C23
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C406719DF8D;
	Wed, 28 Aug 2024 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCdB3/fF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C343B1BC;
	Wed, 28 Aug 2024 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724856406; cv=none; b=MT2M+ebno6muU0uB7pynbs77PbxUQyM44ikfE7bpTRLAteZ7NaqUtORh+dVjSSl5Dh+WMlS6h0BSUJa2FEoeXdXzDzG91qVpmdyRoZ+ZqDJWwSpPKMnrAaKyoTpXdXH/6/zs/HHWHftSeherrum4B8YfRT5PR7vCm4nGKq6m0Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724856406; c=relaxed/simple;
	bh=N5TGGxSycG5gUcWZtnwDNyns4qOEMnnt0eP/rT0BOKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXN16IIg2ebs1AniYF6yOG0smFEJSeZWfMRDYX5Uft6zbLATav/sRa+eYP8sRfurjmb6IbYm89vRGwLThytABKIjlNdVQA1AoSL6kV7trz7MFCIA748xEIz77+R+7M12hnmiEYxApLnPgIs/6VRwqEwwWEgcsIIeHUZoXYVcR84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCdB3/fF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAE4C4CED4;
	Wed, 28 Aug 2024 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724856406;
	bh=N5TGGxSycG5gUcWZtnwDNyns4qOEMnnt0eP/rT0BOKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCdB3/fF7rrwY9SRfhTqdBHwXaM9ofu21x04HHlagX73fP8XPAXZSl0WJHqArY7EV
	 2pF2zmmp0cmFDJtJ+FshYiUJQb6jpd8HkMzk7AqZwJ3TH4jBj1xvjlcx5zslVnNx7z
	 aMa3GkK1dbfHjhBNP/Aqky9ZfXNeLjEU2BPvshNtk14mVtuvFXGuUSxqYiA3xiuKZQ
	 ezYjTWrXHJ1VzuKMfNwvlwQzn4Zt36wi7lz/4B+m5ETP+rqOu5kz9QOiBMgKEAkBeG
	 2BAqCDYgWzRW7Mlfavi4tkH8+xoBJBZgEEv3DikDoOrhkIjpyQGjo6KyiCaL9VXdZ2
	 svBtXA2JyQ8xQ==
Date: Wed, 28 Aug 2024 09:46:44 -0500
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
Message-ID: <20240828144644.GA3680498-robh@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
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

Preferred, definitely. But preferred is not absolute. The Renesas 
bindings have consistently followed the above style for some time. For 
the most part that has worked out it seems (based on Geert's slides 
linked in one of the threads). If you want to continue that here, it's 
not something I care to argue about.

However, I have to agree that adding the fallback after the fact is not 
ideal. Why design it where you have to carry renesas,r8a779g0-isp and 
renesas,rcar-gen4-isp in the driver forever when you could have 0 driver 
changes instead? The problem with genericish fallbacks is you have to 
know the future. Am I going to have a family of chips with the same 
block? It's much easier to just say "oh, this new chip is compatible 
with this old chip".


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

But he ultimately Acked it.

> 
> So let me actually NAK it - you got multiple comments on VIN to use
> specific compatible.

This doesn't help anything. You've made your point without it.

Rob

