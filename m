Return-Path: <linux-media+bounces-13560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0C90D3B7
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B439D1F25F79
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0919D14EC5C;
	Tue, 18 Jun 2024 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EeqgOsBk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tdzCR9j/"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA2014EC51;
	Tue, 18 Jun 2024 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719081; cv=none; b=r/4ByWkoFD/0Ptq/HpfBMKRIdxTC0jf4d/KHStVNU/K6QpSR+nHc7JhG9V0Uuj7elVvwRlZmi59g27e9UDSUhYeRvua5zmeuqCGZgYshHisaBpCxxMmATAWdbTrf9s0TB/9tot5yLNwysLLhPzDkn93FAQSdMqGTpNoS8WLlV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719081; c=relaxed/simple;
	bh=rzsqE1D7VkqsWf9I4B8YvfpxsM+ZgF02Nz3TWMDravc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKHfm/HTLFYcNGkT6X8OWb3QBO23tNQGaive5BoKPnehzQAfdavPlPXSvTlm/SqQANDhTYAq+q0VwaVQAv3s1N7wJJrhkdJhYPDIEKpyp+qZ+cpp9K3UdF3HzPGFmArN1wDBAXmGmJ1Hh4MEUX3DfNv7Hv3ecOfuHgdLOc2Mng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EeqgOsBk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tdzCR9j/; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A6FE31140270;
	Tue, 18 Jun 2024 09:57:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 18 Jun 2024 09:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718719076;
	 x=1718805476; bh=NToRqhzCizf7uTTXzhxvLeBaN6sx9H8Z+41x2Ds80ck=; b=
	EeqgOsBkI1cUKAuNonVIc2zTyNtvRacTlzhjI2/wn6Kab9457mHtFZ0VUWm011Ro
	SEqaJqfi8RIAZXoXbAWTZl3jvMIxmNRZbvzqxz73RfqnXZKlF8Gf98WkuRrU05nl
	kktV5hYX3REhMZWMTLQBGjkngH9pshZU48gVU+PRViyDA9GmBiLP2cn3/FAbpc6K
	hRvJery1MOyzlA7yb9aj8JZZyhsyi00bIkmowLIAZYuERp6LUanPJcq52kfRSX0I
	u1C1ccuOpPvUqtrSKhwGBLLDO74U4omWle+wkB1C3D7o+JVkNKDGcX9ArZ9zNqB7
	XRD+5M+BkqgYNmX2w6WVBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718719076; x=
	1718805476; bh=NToRqhzCizf7uTTXzhxvLeBaN6sx9H8Z+41x2Ds80ck=; b=t
	dzCR9j/bLDuA4RkDPGE745/6Pq1MzxVb+3RuByRJPWqDPer+Arz4JCvUvlRCGf+4
	vlatN3tW9YpE9pq5jZHZuRw3BjZATclrxXsm54As6zh/Hv8u+CL+BhgZf6F0D9CX
	W8Fh789gso9WX+Dr2uayodA3I9b3U6BYcKTlnVMJ6kZcbtb9IGcnqDvRjY/zU51l
	jWGSERe/pGEXFI+4EDcySv0w232XVXf9mlUFKq+Zfu0EHYHX7ctmticdjMi1Mnpg
	yMSjxdUwUTdNflqZRpoQIlaOoXsD44/jEOLrGe9NDmHZhnNL5pekc5qJJXfIfeXQ
	gT8sdvkKih5horT5XLKow==
X-ME-Sender: <xms:ZJJxZsCiDrIWWjJUIctwLFPhT9yGtVEoPvA4KsjFd_QrlmOYUnyP2w>
    <xme:ZJJxZujnacfv07yCEADmfb3_BiuecuHUGq2bw1Msaor9YMPSGLQZtOPca3IAFahdh
    WnszbbteGGm4saAK9w>
X-ME-Received: <xmr:ZJJxZvmFsv-a1jPzmG6Lwjcpd6B4QLOeSaN36wgh2px48UXBcZ802JCymIBhZmoxigoy2d9f_-nmSktnHCQn1I9IBT647VE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:ZJJxZiwt0PcsdeuVWbvnYjdCz3jw6hLgZfZsOzjNBzveAfG7l-MXGg>
    <xmx:ZJJxZhSIDJXAlGuS2-1qfCVJCGqQqtON7Va2f0N3ESMo1doL3omlMA>
    <xmx:ZJJxZtaE7gMTFWKpVWLEVEvob3BTAQrAWDE3Jneo5_YxRaGXXJEiyw>
    <xmx:ZJJxZqRkzHMCvPBbkQnGGXXNUdHhPYTbrT6QcUH8tTxuoxrMA2T0yw>
    <xmx:ZJJxZmJHtaofSTIeDss6SVlNCN1ZbNdNd6v3XyFlxt5BacHde2vtAFOZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 09:57:55 -0400 (EDT)
Date: Tue, 18 Jun 2024 15:57:53 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240618135753.GQ382677@ragnatech.se>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud>
 <20240610165935.GA382677@ragnatech.se>
 <20240610-yoga-antler-e6447592de16@spud>
 <20240611110617.GD382677@ragnatech.se>
 <20240613165111.GA2005299-robh@kernel.org>
 <CAMuHMdUQr0pzhL6Tq=R_TTUSu5wDZO-sWQHkuLg4C=xv9TyoWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUQr0pzhL6Tq=R_TTUSu5wDZO-sWQHkuLg4C=xv9TyoWQ@mail.gmail.com>

Hi All,

On 2024-06-13 21:35:13 +0200, Geert Uytterhoeven wrote:
> Hi Rob, Conor,
> 
> On Thu, Jun 13, 2024 at 6:51 PM Rob Herring <robh@kernel.org> wrote:
> > On Tue, Jun 11, 2024 at 01:06:17PM +0200, Niklas Söderlund wrote:
> > > On 2024-06-10 22:32:29 +0100, Conor Dooley wrote:
> > > > On Mon, Jun 10, 2024 at 06:59:35PM +0200, Niklas Söderlund wrote:
> > > > > On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> > > > > > On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas Söderlund wrote:
> > > > > > > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > > > > > >
> > > > > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > > index 5539d0f8e74d..168cb02f8abe 100644
> > > > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > > > @@ -54,6 +54,7 @@ properties:
> > > > > > >                - renesas,vin-r8a77995 # R-Car D3
> > > > > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > > >
> > > > > > Your driver patch suggests that this is compatible with the g variant.
> > > > >
> > > > > Currently it is. But that not always be true, I tried to outline this in
> > > > > to cover letter.
> > > >
> > > > To be honest, I don't usually read cover letters when reviewing bindings.
> > > > Information about why things are/are not compatible should be in a
> > > > commit itself.
> > > >
> > > > >     The V4M capture pipeline is similar to the other Gen4 SoC supported
> > > > >     upstream already V4H. Currently all futures supported for VIN on V4M are
> > > > >     also supported by V4H and the driver code can be shared. But as done for
> > > > >     other R-Car IP bindings a new dedicated binding for V4M is created.
> > > > >     This have proved prudent in the past where quirks are found even within
> > > > >     the same generation as more advance use-cases are enabled.
> > > >
> > > > I don't understand how this precludes using the g variant as a fallback
> > > > compatible. I'm not suggesting that you don't add a specific one for the
> > > > h variant.
> > >
> > > The bindings have been around for a while and currently there are 25 SoC
> > > specific compatibles, one for each SoC supported. Each compatible
> > > consist of the SoC model number, not the VIN IP model/version number as
> > > no such versioning schema exist.
> > >
> > > The datasheets are specific for each SoC and there are differences
> > > between almost every SoC. There are of course lots of similarities
> > > between the SoCs and the similarities are cluster around the 3
> > > generations (Gen{2,3,4}) supported.
> > >
> > > Using the g variant as fallback in DTS for h variant even if we also add
> > > a specific one for h is confusing. As g and h are two different SoC.
> >
> > Why? That is the very definition of how "compatible" is supposed to
> > work.
> >
> > > The g variant is r8a779g0 which is the SoC name/number for V4H.
> > > The h variant is r8a779h0 which is the SoC name/number for V4M.
> > >
> > > I think the core of the problem is that there are no versioning schema
> > > for the individual IP blocks used on each SoC. For better or worse the
> > > bindings for lots of Renesas IPs are centred around SoC name/number and
> > > not the individual IP implementations.
> >
> > We've tried IP version based compatibles before. It doesn't work. Guess
> > what, the IP version changes with nearly every SoC. Chip designers have
> > no discipline.
> 
> The R-Car V4M capture pipeline is similar to e.g. the R-Car V4H capture
> pipeline. But it is not identical, hence the different compatible values.
> AFAIU, for the current feature-set, the driver does not need to handle
> the differences.  But that may change later...

How can I best move forward here? The proposed compatible is not a IP 
block specific one, but a SoC specific one. This is the design used for 
the R-Car video capture pipeline and we already use 25 of them to 
support different SoCs in the R-Car Gen1, Gen2, Gen3 and Gen4 families 
using the schema proposed in this patch.

If I understand the feedback correctly there is not so much an issue 
with adding this new compatible. Rather that the driver do not use a 
fallback compatible as currently the compatible added by this patch, as 
the driver currently treats it the same as another SoC in the R-Car Gen4 
family. Have I understand the issue correctly?

If so, then yes the driver currently treats it the same as another Gen4 
SoC. But we already know there are differences between the video capture 
pipeline in these SoCs, however the driver do not yet cover these parts.  
So going the fallback compatible route now could create comp ability 
issues down the road. Is it not better to do the specific thing now and 
avoid that issue all together?

-- 
Kind Regards,
Niklas Söderlund

