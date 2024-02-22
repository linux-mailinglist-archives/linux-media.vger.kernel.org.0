Return-Path: <linux-media+bounces-5677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B686006E
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 19:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90E03282A82
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 18:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2B7157E7C;
	Thu, 22 Feb 2024 18:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQMEjuoO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A04776E;
	Thu, 22 Feb 2024 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625270; cv=none; b=Dj97rHxu143ex7NhhBISySdIEElsqmqQl1DOCM+mXmoiOAPJFt7i6DKUhhTlTE7Lboaask7fXnSkMoUFqXvWrAVgaQE9HA6Sy1q5vu61Vn0AmOmwjQPOGGtKwMz5HH4JIcwCji8H0OyS618/61gjo8GdMoVRJ3DaiDLWxsCeSPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625270; c=relaxed/simple;
	bh=h1lolQG3CknY7raZfk8+CNEwZOWLkLis21EvkQNNH18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAzPVbmCZFHYOBc/0kQTXQAtBH7rgzjgWFHQcpgP/UEyR/+k79FkKkHKooDXewS98Tgntpkr7Y1K2JZZzVt6QFen2GpGD+/363edWYGpqzpEY7dYc2AEuWCTw1V5jzr6TqMc3ajjYqRv0ym9Jk1XGsYPVCNfg5Jac24vvOi+YD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQMEjuoO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65223C433F1;
	Thu, 22 Feb 2024 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708625270;
	bh=h1lolQG3CknY7raZfk8+CNEwZOWLkLis21EvkQNNH18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQMEjuoO6gwmb3k8WiqH5UwzucSEhfh1r71oCRcNYrP6JbnL97B8L6P4QrT4YZ0U9
	 Ty5lQxNqtddENVrBQDlP9fUngFAJxg8iq4fP9uG9pFrW74gDOWK/oBqzplz1x3i8LK
	 IxYzPmTRyA04u7www9yQGNfsuWAO4cKvqmEn6mmbuiV+mgNu5m1aPl/i6QmK3U5spg
	 k7LM51yXpGR1g2TPQ/ivUw8dr6up7ISMvCdNt8symFKvdy9KB/VsySfIshn5hUn0vp
	 jJZIduXQJWgHgXseTe4cQ5ZBkpxELAhBYArpZx4nYNGvm3aj+Yhu8fBVsHMTGX+4yo
	 BBo5e5t2IW8pA==
Date: Thu, 22 Feb 2024 11:07:47 -0700
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240222180747.GA3518860-robh@kernel.org>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <20240214142825.GA7873@pendragon.ideasonboard.com>
 <20240214-velcro-pushy-0cbd18b23361@spud>
 <20240215110205.GD7873@pendragon.ideasonboard.com>
 <e06b0792-187d-454b-aa62-d9c1e797df17@ideasonboard.com>
 <20240216132755.GA20376@pendragon.ideasonboard.com>
 <f5e63a8b-fb6c-449f-8ec3-26aed5b11b95@ideasonboard.com>
 <20240216-caboose-poison-3052a4bb9eaf@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216-caboose-poison-3052a4bb9eaf@spud>

On Fri, Feb 16, 2024 at 07:07:58PM +0000, Conor Dooley wrote:
> On Fri, Feb 16, 2024 at 02:45:31PM +0000, Dan Scally wrote:
> 
> > > > > > > > +      - description: ISP AXI clock
> > > > > > > > +      - description: ISP AHB-lite clock
> > > > > > > These two other clocks look good to me.
> > > > > > > 
> > > > > > > > +
> > > > > > > > +  clock-names:
> > > > > > > > +    items:
> > > > > > > > +      - const: vclk
> > > > > > > > +      - const: aclk
> > > > > > > > +      - const: hclk
> > > > > > Why not "video" "axi" "ahb-lite"? There's 3 useful letters between the
> > > > > > tree clock names you've provided - they're all clocks, so having "clk"
> > > > > > in them is just noise :)
> > > > > As far as I understand, the names proposed by Dan come directly from the
> > > > > IP core documentation.
> > > > This is the case, but I do take Conor's point that more descriptive names might be nicer - if I'm
> > > > honest I just didn't think about it particularly given "Xclk" is such a common name for them
> > > > already, but having been poked into thinking about it I do agree.
> > > Isn't the usual practice in DT bindings is to name GPIOs, clocks and reset
> > > signals based on the hardware documentation ?
> > 
> > 
> > Ah - I don't know honestly. If that's so then yeah - these are the names the documentation prescribes.
> 
> If a direct doc match is what you're going for, then sure, keep it.

pclk, aclk, and hclk are generally the names used for APB, AXI, and AHB 
bus clocks, so I'd stick with them. Though we also have cases of the bus 
names used... 

Rob

