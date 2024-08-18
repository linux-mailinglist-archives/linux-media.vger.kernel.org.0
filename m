Return-Path: <linux-media+bounces-16420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ABE955E64
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F64C1C20CBB
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 17:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFC014D282;
	Sun, 18 Aug 2024 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aqFBXiUW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E0947F69;
	Sun, 18 Aug 2024 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724003450; cv=none; b=msvu788rwiAsAH4vaHBG9POVeqk6dYs+HCDynXH0l9h7gQu8NlWoYTdnSQ1/gUQyIqS6R/RmP1txSuDOanoAAX3rO47P39heqAV7moCFt0GmB3zFLl6mluDfx3gCq/fzmGkv+KOBh99gj+dayKqPA2LpAXR0a7vsjJrgX6hSQI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724003450; c=relaxed/simple;
	bh=WYvTQfBxGwe7O+sDt3SBJSreYzdxuTsdbfJrve5XdNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYK9imTBzhHxqja973bordjTiG1bUwLLXIFx6pD99QwcjPKZOBN3HaU1OoSLJnGB8mMGmLae5WMS6afn49y8E0LX509l85rm8ERN4SLRa3MjLE+0q5ZVHup+EoGbCNJAJbrG6otH8s5sNH6/FnOCLBwWiqRbIoaNI/sgXDCer+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aqFBXiUW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD3DD541;
	Sun, 18 Aug 2024 19:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724003387;
	bh=WYvTQfBxGwe7O+sDt3SBJSreYzdxuTsdbfJrve5XdNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqFBXiUWr9RQ8pIg4v0buCYIkJM3clBjpndqDPudPmEcpNgT+xgyxEEYAEcwVMH3E
	 OPfBZ67sWyxXNln1GuYPe9NVoCf04lMpeKrX8GzUXBg1lVm5/Ev/b9I8e0Ahc8mDNZ
	 Ml/VZW7qoHd+mNO1+uDya2oRaDzdbobjCMFE1W9Q=
Date: Sun, 18 Aug 2024 20:50:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: renesas,fcp: add top-level
 constraints
Message-ID: <20240818175020.GE29465@pendragon.ideasonboard.com>
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
 <20240818173758.GA29465@pendragon.ideasonboard.com>
 <286524f7-d240-4675-bfff-599ce8e4b16c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <286524f7-d240-4675-bfff-599ce8e4b16c@linaro.org>

On Sun, Aug 18, 2024 at 07:45:55PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 19:37, Laurent Pinchart wrote:
> > On Sun, Aug 18, 2024 at 07:29:36PM +0200, Krzysztof Kozlowski wrote:
> >> Properties with variable number of items per each device are expected to
> >> have widest constraints in top-level "properties:" block and further
> >> customized (narrowed) in "if:then:".  Add missing top-level constraints
> >> for clocks and clock-names.
> > 
> > In this specific case I think it's fine, but generally speaking, how do
> > you handle that rule when different variants have completely different
> > clocks, not just lack some of the clocks ?
> 
> I don't understand the problem. We handle it as usual, as in all
> bindings. Here there is no such case, thus names go to the top.

That answers the question, the clock names would still be
variant-specific in that case.

While the change here won't cause validation failures, I think it's
confusing to define the clock names at the top level, knowing they don't
apply to some of the variants, if we don't also define the description
there. I'd move either both or neither.

> >>  
> >> -  clock-names: true
> >> +  clock-names:
> >> +    items:
> >> +      - const: aclk
> >> +      - const: pclk
> >> +      - const: vclk
> >>  
> >>    iommus:
> >>      maxItems: 1
> >> @@ -71,11 +77,6 @@ allOf:
> >>              - description: Main clock
> >>              - description: Register access clock
> >>              - description: Video clock
> >> -        clock-names:
> >> -          items:
> >> -            - const: aclk
> >> -            - const: pclk
> >> -            - const: vclk
> > 
> > Any specific reason to move the clock names but not the descriptions ?
> > The assymetry bothers me.
> 
> The other variant does not have description of the first clock, so
> moving it would be incorrect. Moving names is correct, because other
> variant does not have clock-names at all.

I don't think it's incorrect, when the FCP has a single clock, it's the
main clock.

-- 
Regards,

Laurent Pinchart

