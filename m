Return-Path: <linux-media+bounces-13206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA59078B8
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 18:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B87CE1C20B13
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 16:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4901339A4;
	Thu, 13 Jun 2024 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAP1EmdH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018FA17FD;
	Thu, 13 Jun 2024 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297474; cv=none; b=eVBColMOK4aSDprXhwMGY4zHJkdaMwc2P5pRwFEElg2T2BjelB49o6zVdIzy4FumrqIWtTZiaSM52thuskSwgu+ZQV9Dmsvh7t6AVeblN1NqN7734ed6qs7Tm3SJGnJfPQzhre7snlVzRk7U6UvnI1pKy5C/ku2pMeOgrnma2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297474; c=relaxed/simple;
	bh=AqclkLgO7O3ZBcq/ORHN2o8G8ZYFtWnr+enwKmSDttQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvVPGgTHwLyRSlVzyI8FDoRiVZwwiknpJRjPahC5ujsoavfmg89TRvQG613/T9SZnlxj8O9eC46NKc/E3j2BDmExCR3XdzEG7grUHr5FH0XlTmxHopF1Ot7bfC+/ynNk327rs2ORS3FiBcOu2Re9NARiX/DUya/8/Ki7P+VlLsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAP1EmdH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B43C3277B;
	Thu, 13 Jun 2024 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297473;
	bh=AqclkLgO7O3ZBcq/ORHN2o8G8ZYFtWnr+enwKmSDttQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAP1EmdH6e4rSur0gGQcMy9m++pdFcnJYstl9o+fBm1gU3AeICVzzyjK1F4OBJxO7
	 JZGun/GoFJd/bM3pASp+hMcLVVifVdQhvbeQcqwCgalOFKtrTpHbPHoaVwZMn9Pthv
	 FevjeMbQhvHI5CD6ItFAfoLbs0PxFHil9XLueLbtn0DKGOk+qwnWTpqLFmQO6Qo4dM
	 XMqIbcaYCH5ic+NhejJQjD8TsZchJvFYs+ISpZfIyYAYeQKDKh+Zq15OZci5tESN85
	 R5TsPinydfVEB+SXT2T4ILJm+/+OlxU/n/frFVKGLmWGPHO+I6bU8IZ8vx6FQP00n8
	 eMkFD25JQX1pw==
Date: Thu, 13 Jun 2024 10:51:11 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Conor Dooley <conor@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240613165111.GA2005299-robh@kernel.org>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud>
 <20240610165935.GA382677@ragnatech.se>
 <20240610-yoga-antler-e6447592de16@spud>
 <20240611110617.GD382677@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611110617.GD382677@ragnatech.se>

On Tue, Jun 11, 2024 at 01:06:17PM +0200, Niklas Söderlund wrote:
> On 2024-06-10 22:32:29 +0100, Conor Dooley wrote:
> > On Mon, Jun 10, 2024 at 06:59:35PM +0200, Niklas Söderlund wrote:
> > > Hi Conor,
> > > 
> > > Thanks for your feedback.
> > > 
> > > On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> > > > On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas Söderlund wrote:
> > > > > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > > > > 
> > > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > index 5539d0f8e74d..168cb02f8abe 100644
> > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > @@ -54,6 +54,7 @@ properties:
> > > > >                - renesas,vin-r8a77995 # R-Car D3
> > > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > 
> > > > Your driver patch suggests that this is compatible with the g variant.
> > > 
> > > Currently it is. But that not always be true, I tried to outline this in 
> > > to cover letter.
> > 
> > To be honest, I don't usually read cover letters when reviewing bindings.
> > Information about why things are/are not compatible should be in a
> > commit itself.
> > 
> > >     The V4M capture pipeline is similar to the other Gen4 SoC supported
> > >     upstream already V4H. Currently all futures supported for VIN on V4M are
> > >     also supported by V4H and the driver code can be shared. But as done for
> > >     other R-Car IP bindings a new dedicated binding for V4M is created.
> > >     This have proved prudent in the past where quirks are found even within
> > >     the same generation as more advance use-cases are enabled.
> > 
> > I don't understand how this precludes using the g variant as a fallback
> > compatible. I'm not suggesting that you don't add a specific one for the
> > h variant.
> 
> The bindings have been around for a while and currently there are 25 SoC 
> specific compatibles, one for each SoC supported. Each compatible 
> consist of the SoC model number, not the VIN IP model/version number as 
> no such versioning schema exist.
> 
> The datasheets are specific for each SoC and there are differences 
> between almost every SoC. There are of course lots of similarities 
> between the SoCs and the similarities are cluster around the 3 
> generations (Gen{2,3,4}) supported.
> 
> Using the g variant as fallback in DTS for h variant even if we also add 
> a specific one for h is confusing. As g and h are two different SoC.

Why? That is the very definition of how "compatible" is supposed to 
work.

> The g variant is r8a779g0 which is the SoC name/number for V4H.
> The h variant is r8a779h0 which is the SoC name/number for V4M.
> 
> I think the core of the problem is that there are no versioning schema 
> for the individual IP blocks used on each SoC. For better or worse the 
> bindings for lots of Renesas IPs are centred around SoC name/number and 
> not the individual IP implementations.

We've tried IP version based compatibles before. It doesn't work. Guess 
what, the IP version changes with nearly every SoC. Chip designers have 
no discipline.

Rob

