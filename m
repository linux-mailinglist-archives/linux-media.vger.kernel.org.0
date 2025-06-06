Return-Path: <linux-media+bounces-34210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46CACFEF4
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6C3166E4A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DAA286413;
	Fri,  6 Jun 2025 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="g4nk5EID";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AQeOZkyu"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88013283FFB;
	Fri,  6 Jun 2025 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201233; cv=none; b=ixPWXU9h4bamWp7xYZQlzIX0ivg8n4+l8xXwKlGk9J7LSnWHVPrxEaNbgi+wuu7H2UmtFLffkspMwZGu6tnmlbzT+Oy4zVq+WfRcoWWun516ePGrBlbA2j6hhfcIeG6TtmzNqjM23puEFBtshPwdvu1SAyI5Rs/DbgFSRcKSk2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201233; c=relaxed/simple;
	bh=elNmMcEm/GGOUK2tIhv3CbPxIzdJsRFiJtW0NPFKiHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC9MAzGmvem29KZMh6keEBOXFJwalNluW+VVKm41PicP2KTEFmDkmmlXZ/9VeZBeZq32kZ3BLWyMw4HnEj7Bw1brov4nDRxSuX3Midv3fxupGdT60BTlCfxNWaR4POkKe5F4STrS1ZzwAFXVYxkfPes/E+Xi0UH/BPc4GPOe1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=g4nk5EID; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AQeOZkyu; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A01B25400D8;
	Fri,  6 Jun 2025 05:13:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Jun 2025 05:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749201229;
	 x=1749287629; bh=vtUO92tCX2BijpLTXVd3ne6ezZessOK7OBV0E6sLs9M=; b=
	g4nk5EIDmRl1FqCYFrxe6UaXfclYBwvaaldd6OgUMVhpbBGTdGgsuSvUJ2xKx9J/
	hcRbVWgyQ6WY0CZiTRyPVIAIJvolB6+PG/bXMvCsQJ4VahaM23faBUV2x8gkfP4S
	4GQygoMxiXoeLZIEQy7DkviyIxkjXh2F3Mu5PaBbtaIyp4BagppIiCjbvnB8aOGK
	ZhdsgN07YlKk+DQw86YVzaQ+1aBT0VNVGQN0evgb7mNEWCRBcLoVvQEEsoyULj3W
	4h3IO0tS336YLwxu5KynWKQL0mF5jsqPlE0t73thG1qKaW+vxvg7jANHMD5P7LkL
	SNLw+zQ3czg421/OJdmVaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749201229; x=
	1749287629; bh=vtUO92tCX2BijpLTXVd3ne6ezZessOK7OBV0E6sLs9M=; b=A
	QeOZkyu739PvxS0Qltll99Ab3jXhoU9j+/Ve8inBanH4BghprX2mBLdNCGCudwgp
	NDwAEVomS5loVexW9WePV4bZwU9yr4tYj7glva7CwKDualwmGZbW1N+lSUFIAumd
	wzSvWMUK3o2cIqmO3Pkb2T1TuC8JAEuwE8vHJs658wbCpklXI265xTjvNnJ+f4Qv
	kKZch/dojCtL0pfMppUcCI5qGjWsrGvgutW7rBiEBqbdwFrWF5lpuwDsBg4Z1UJm
	fK/IB3Ha/AJlA5BfhKaIiFNdGIt8Q5DZ0GkHNe0jxNduUUWNL1smKOC40HSkGB6/
	8ZRWxj8Thzx0/Yzu8NQHg==
X-ME-Sender: <xms:TLFCaGZcg86-HsU6R1gW_apH4nV0jUZZHBRpvnc1gAsGGwnlcmDBhQ>
    <xme:TLFCaJYX8Nw0_Ip12EsGXLDCFAi_o9ICp87RxFPtru5rxcHIVXX4-mDpsGEcGurzV
    RyCJcyYTr0qiPPg5SI>
X-ME-Received: <xmr:TLFCaA8nE5EvrWvl-dBVpVom_WyJYwGqOB0Vmx0crdQ7zdmLAN6ejvWe_ycbjnkYgN6C7yBVXPZF8ZHpL1jUmqAIammY8NPJVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
    ohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:TLFCaIqH9kLhNIbq4czPkaj_CcyUE6RgCeG4k4-JINWihpfaLEzLPQ>
    <xmx:TLFCaBp2Ody_KXz4g6C667QWwVTDbeGDKjZhH0aCeQn6aUUWRW7b0Q>
    <xmx:TLFCaGRBcVHCcS-fB7TGIUb9z3jOmfj044npqqBL7FANxPAYRPZHRw>
    <xmx:TLFCaBpBxuAgQQL0oFctK1eAcMhpOAi5uy2_RRGdwF_Vth0tRG2VoQ>
    <xmx:TbFCaEES03mtSTQBSoWWf_f5MNeqtGXFcLXH2dFlMqGpMdBjkPwGH3DJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 05:13:48 -0400 (EDT)
Date: Fri, 6 Jun 2025 11:13:38 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Fix stride setting for RAW8 formats
Message-ID: <20250606091338.GC3849429@ragnatech.se>
References: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>
 <62b34d44-14d3-4096-ba13-edd53bd3eb7c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62b34d44-14d3-4096-ba13-edd53bd3eb7c@ideasonboard.com>

Hi Tomi,

On 2025-05-30 15:08:56 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/04/2025 21:33, Niklas Söderlund wrote:
> > Earlier versions of the datasheet where unclear about the stride setting
> > for RAW8 capture formats. Later datasheets clarifies that the stride
> > only process in this mode for non-image data. For image data the full
> > stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
> > Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".
> 
> Looking at the V4H manual, I see:
> 
> "
> RAW: 8 Bits and Embedded 8-Bit Non-Image Data, User Defined 8-bit Data
> 
> The 8-bit RAW image data format, Embedded 8-bit non image data and User
> Defined 8-bit data format are shown below. Notes: 1. These data are
> transferred by 2-Byte unit.
> "
> 
> and
> 
> "
> RAW: 8 Bits (16 Bits/Pixel) Data
> 
> The 8-bit RAW (16 bits/pixel) image data format is shown below.
> Notes: 1. These data are transferred by 2-Byte unit.
> "
> 
> I don't see "RAW: 8 Bits". In both cases above the text says "2-byte unit".

I agree this is all priorly documented. My understanding and this fix 
comes from the two diagrams attached to the two different sections you 
point out.

In the first case "(12) RAW: 8 Bits and Embedded 8-Bit Non-Image Data, 
User Defined 8-bit Data" the diagram (for even number of pixels) shows 
two pixels being transferred in a 16-bit space, concatenated one after 
the other.

In the second case "(21) RAW: 8 Bits (16 Bits/Pixel) Data" the diagram 
shows one pixel being transferred in a 16-bit space, and the upper 8 
bits being set to 0.

Without this fix the 8-bit raw frames I can grab from IMX219 and IMX462 
on V4H are jumbled. I suspect maybe we need to teach the VIN driver to 
support both modes as this have an effect on your setup. How do your 
output images look with this fix?

What I can't figure out is what is different at the VIN stage. All RAW 
8-bit media bus formats sets VnMC.INF to b100 (Embedded 8-bit non Image 
Data or RAW8 input) which would suggest the first case is always used.  
The only case where the second case could be used is for the RAW10 
formats where VnMC.INF is set to b111 (RAW8 (16 bits/pixel) or RAW10 or 
RAW12 or RAW14 or RAW16 or RGB565).

The only source I can think of is that our sensors somehow transmit 
8-bit data differently, but I'm not sure how we can check that theory.  
But if we can then we could use different media bus codes to address 
both scenarios. What do you think?

> 
>  Tomi
> 
> > 
> > Remove the special case from pixel formats that carry image data and
> > treat it as any other image format.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 ----------------
> >  1 file changed, 16 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index f8394be8a922..fdf0f86c801f 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -680,22 +680,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
> >  
> >  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
> >  	stride = vin->format.bytesperline / fmt->bpp;
> > -
> > -	/* For RAW8 format bpp is 1, but the hardware process RAW8
> > -	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
> > -	 */
> > -	switch (vin->format.pixelformat) {
> > -	case V4L2_PIX_FMT_SBGGR8:
> > -	case V4L2_PIX_FMT_SGBRG8:
> > -	case V4L2_PIX_FMT_SGRBG8:
> > -	case V4L2_PIX_FMT_SRGGB8:
> > -	case V4L2_PIX_FMT_GREY:
> > -		stride /= 2;
> > -		break;
> > -	default:
> > -		break;
> > -	}
> > -
> >  	rvin_write(vin, stride, VNIS_REG);
> >  }
> >  
> 

-- 
Kind Regards,
Niklas Söderlund

