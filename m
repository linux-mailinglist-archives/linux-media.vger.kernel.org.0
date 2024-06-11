Return-Path: <linux-media+bounces-12940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037E9039AC
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F732864E6
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F88B7407C;
	Tue, 11 Jun 2024 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lTSbI3Nv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OEQVy8z/"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19BE57E;
	Tue, 11 Jun 2024 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103984; cv=none; b=JM07bvPwK84mMis5ou17rhr+4BwebDLv+ribW9tTXU0zdag8ck6xKUSiNNAHyvytLzGXlcu2FbI55O4sSfc3nHbmIPMhFmVC3h2N94DsLM75viVU5qlvgJa/bdMhoTdxJLzo+gnh+0nUYtni1t4meRMimdVB6//dkFanympmy2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103984; c=relaxed/simple;
	bh=kCcTvWtKYC3z662/qvikpyrrZjkSxbPYnTXNnjhU9Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQoR4xDh7HJ4tgz2t9VWYgSjylUMh62dtE0hAujjnZvFkRz7Dzct50pMN++8gqack15o8quk9l5V11RzYveccvILX89GFFmkzT0RSjWhj9QgWt5+8fMnpm0E7wx2UpbnL+kw46lKBdhF5FFWjCqH3r4ygWwTRH9GhTq/zoC2sEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lTSbI3Nv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OEQVy8z/; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 15A2A11401A4;
	Tue, 11 Jun 2024 07:06:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 11 Jun 2024 07:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718103980;
	 x=1718190380; bh=SX9RnFxbOSvQkwauOjq0Z1bd6M9f7vAYP+2UOw1ai5A=; b=
	lTSbI3NvavzQqdV56tcv7OdFkidDhj4TXiPU/ySpyRub3sKZOM5ItdX0nvFgGFt7
	sfP3jbvxMypGXCh9vWSDa+XLQsigXXK6mglNiNMC4abzg3thtMCf+o5WEPF5jFaW
	XPesTfuTb2qCX++d66REpOy0ArNE9/6wgON3Ye1ter7nrmNh4TfOAIxiEeJ1AaR+
	CsYbNeSbrAFRy8K8eSbO3txVJrRqdOmJzFWQJY1Q/bKPlFhLJOw9c3hq5GfLLYyb
	eyPituPtdEdDcfzXeKQ57O6JfhxBWig1ZYgWfYVqkHoa9mSqaC0adR+ct8Fzu06Y
	EfaMU2Y6Kalsc7T+nyeHmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718103980; x=
	1718190380; bh=SX9RnFxbOSvQkwauOjq0Z1bd6M9f7vAYP+2UOw1ai5A=; b=O
	EQVy8z/MecFTzPzqOTNkiyjKf6DV2A3DU9S85/nD1xh4YUGXo1FeMBLa7ORjxKl8
	qj5Qyi4PEjGM17CxradD52FHJMC1/8COSAlcIlBwqaiW8PuZQiBrmft6oQjADt+j
	YROpZek4QsLAJx7PGy8+WgCWEXkYD1FoyN/pG4JdH8DUHo7rtSdmVfd2Qrq2zu1o
	a5NqWHDYpMoBulTQSF32fT+UulbcIElVT32Vo9Q/tUn0zKcHJR6oZ9TlX8BxqT9S
	lypdptirhIdCIo1O49uYT4betAFNzWvkOV4c0u1cuWhhycyNM9uWfhrqukflvK6D
	gLoFCFBvpIWwJMnG6I8gQ==
X-ME-Sender: <xms:qy9oZiczjLA-r-YtezYCJkJV2nXhRGBnw1KbQdEtCn_I7fbAV37QJQ>
    <xme:qy9oZsPtkGN3PcWbFSHCIsHrIcKWabee6R5yVe-WHKZ6Y-VCR27k7MpQPYgNOKZ0l
    9SYvFdvYzfm3EJatg8>
X-ME-Received: <xmr:qy9oZjjGdtvbwT7lKYjfdtgvwsE7p-TWGRMJKNXF16DyZVjLLbUztebMam4Riazv5cGAq_eBZe8WCtIb63pD6JEMNxmVsR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:qy9oZv8hLLjcYKoL6WNKb4kcwE2wbZ1pDwTpFJaF6NyzIEyENMvvXg>
    <xmx:qy9oZutXrcYUdS409VB2guLlxpYWeQ-55rz4Z0Gel96goZTrwEn13w>
    <xmx:qy9oZmEtVqzujrpXNhp_M0NLM1hA9HCCl1nmkeEIQcXNeNzaSNa0Kg>
    <xmx:qy9oZtMJgDNhkZOxT9C_3met0bSFcp4Bwl3Iryi3jptkidGjJuP0nA>
    <xmx:rC9oZoLAGUCHomY3Mf82AbS31fAIKSruZ9GpRZeBedQ0vR2y9f0bCcRw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 07:06:19 -0400 (EDT)
Date: Tue, 11 Jun 2024 13:06:17 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240611110617.GD382677@ragnatech.se>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud>
 <20240610165935.GA382677@ragnatech.se>
 <20240610-yoga-antler-e6447592de16@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610-yoga-antler-e6447592de16@spud>

On 2024-06-10 22:32:29 +0100, Conor Dooley wrote:
> On Mon, Jun 10, 2024 at 06:59:35PM +0200, Niklas Söderlund wrote:
> > Hi Conor,
> > 
> > Thanks for your feedback.
> > 
> > On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> > > On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas Söderlund wrote:
> > > > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > > > 
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > index 5539d0f8e74d..168cb02f8abe 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > @@ -54,6 +54,7 @@ properties:
> > > >                - renesas,vin-r8a77995 # R-Car D3
> > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > 
> > > Your driver patch suggests that this is compatible with the g variant.
> > 
> > Currently it is. But that not always be true, I tried to outline this in 
> > to cover letter.
> 
> To be honest, I don't usually read cover letters when reviewing bindings.
> Information about why things are/are not compatible should be in a
> commit itself.
> 
> >     The V4M capture pipeline is similar to the other Gen4 SoC supported
> >     upstream already V4H. Currently all futures supported for VIN on V4M are
> >     also supported by V4H and the driver code can be shared. But as done for
> >     other R-Car IP bindings a new dedicated binding for V4M is created.
> >     This have proved prudent in the past where quirks are found even within
> >     the same generation as more advance use-cases are enabled.
> 
> I don't understand how this precludes using the g variant as a fallback
> compatible. I'm not suggesting that you don't add a specific one for the
> h variant.

The bindings have been around for a while and currently there are 25 SoC 
specific compatibles, one for each SoC supported. Each compatible 
consist of the SoC model number, not the VIN IP model/version number as 
no such versioning schema exist.

The datasheets are specific for each SoC and there are differences 
between almost every SoC. There are of course lots of similarities 
between the SoCs and the similarities are cluster around the 3 
generations (Gen{2,3,4}) supported.

Using the g variant as fallback in DTS for h variant even if we also add 
a specific one for h is confusing. As g and h are two different SoC.

The g variant is r8a779g0 which is the SoC name/number for V4H.
The h variant is r8a779h0 which is the SoC name/number for V4M.

I think the core of the problem is that there are no versioning schema 
for the individual IP blocks used on each SoC. For better or worse the 
bindings for lots of Renesas IPs are centred around SoC name/number and 
not the individual IP implementations.

-- 
Kind Regards,
Niklas Söderlund

