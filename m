Return-Path: <linux-media+bounces-21017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3669BEFA5
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 14:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2CE280BE8
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 13:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0265C201026;
	Wed,  6 Nov 2024 13:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l7cFdtyr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B17200CBB;
	Wed,  6 Nov 2024 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901486; cv=none; b=mhdETCglv0pVvxwXMlnxmBtY1ZjHwL+s62932ZCkmWNqRAkgZcvE413QmAoIbiIvqrdEF911E7SD00TR0NGN4O1xfe4HdtCxzVLHBTaP0tQJ4vFtHnEmOSx7fbn7vDl5iCQKC8k30Wu2xhBZcUlDrvuxc9u5XXyy5TsxYX7DA3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901486; c=relaxed/simple;
	bh=JHxLQgSLWdft8dSzdvbt7oLzbR8ccNpS8nioRv0vsWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBEuswAIYTZQsFTRxaZD/28sl0jc+dXQeM97rghqIQ6PJOXvt3Tdv79mNKirhqWn4RiwzDvrQLF5/R7jpf1OZq5iXimX6ttwp9wDPg1GgQziRmA8f4dkjxwWaeHynxIF7fpDT+pBG/YHuWoJR519SVPXXKDj9vscIVesMlMTaCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l7cFdtyr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60E85475;
	Wed,  6 Nov 2024 14:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730901474;
	bh=JHxLQgSLWdft8dSzdvbt7oLzbR8ccNpS8nioRv0vsWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7cFdtyrLuTL573iQmGDrUByPoITVRPQxVYPi2KCf4Z/HiY8P4yZM8J5yLQi1eEJa
	 HEU2+dt6x9zxxzatiMNtPjyM60RInhwTuyv+f9hEaoEkuOzFo7oaEZuMTvHN7fPsCz
	 RVAjsnjvYS14JVV9hzz6PM2uqTSBptXcZWDCBsek=
Date: Wed, 6 Nov 2024 15:57:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20241106135756.GI9369@pendragon.ideasonboard.com>
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
 <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lag7gfpuj2hdxw6i5pumaivxl5rylt2hztd57rynjestffwool@ate7u3zhrgfn>

Hi Krzysztof,

On Wed, Nov 06, 2024 at 01:15:23PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
> > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> > 
> > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v8:
> > 
> > 	- Added the video clock back in. Now that we have actual hardware it's
> > 	  clear that it's necessary.
> > 	- Added reset lines 
> > 	- Dropped R-bs
> 
> These are trivial, so I wish you kept the review... but since you ask,
> then comment further
> 
> I recommend using b4, so your cover letter changelog comes with nice
> links to previous versions. I scrolled through entire cover letter for
> this (for me that's almost the only point of cover letter) and could
> not find them. Anyway, just a remark.
> 
> 
> ...
> 
> > +  resets:
> > +    items:
> > +      - description: vclk domain reset
> > +      - description: aclk domain reset
> > +      - description: hclk domain reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: vresetn
> 
> drop "reset", it's redundant and rather come here with logical name. I
> wonder what "n" means as well. It's not a GPIO to be "inverted"...

The aresetn and hresetn names come directly from a hardware manual
(vresetn seems to be called rstn in that document though). As far as I
understand, they are the names of the external signals of the IP core.
I tend to pick the hardware names for clock and reset names. That makes
it easier for integrators, and from a driver point of view it doesn't
change much as DT names are just a convention anyway.

That being said, if there's a good reason to do otherwise (such as
standardizing property names to make handling through common code
possible), that's fine too.

> I wonder about reset domains for clocks as well... is this just gate
> clock misrepresented?

No, those are real reset signals. There can be clock gates external to
the IP, and those are handled by the clock providers. The IP has three
domains of logical that are synchronous to three different clocks, and
they have one reset signal each, hence the description mentioning "clock
domain".

-- 
Regards,

Laurent Pinchart

