Return-Path: <linux-media+bounces-13567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797890D66E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556DA1C21FEB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2D81C698;
	Tue, 18 Jun 2024 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YJFPBTT3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D6TTVwl7"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4205DDA6;
	Tue, 18 Jun 2024 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722883; cv=none; b=KL7uYPylE9LSTui5Hdc1AqOPq92d/fP5yetld8It+UzCRwbgR0adCvYVOiXv6Rv3G08Shhzcx5fPnbxspFvJyG/f2s51UGMmoTAAR0iU31lZAt3aE7suh5EV+6aUvEZlRTPm0btchFyKtH3HnCGnmuFKB+BWvgiDlxqK471LfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722883; c=relaxed/simple;
	bh=GuJRFhsBewTP/AyCF8ZXkR0RrfRRGnAb8lgOBcmkLkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXziRDonxvYYRiCHnpsFPyegQvUx+RGErGJmxVa9haapMufkmSCI+WhPCTV7o8gk4/KOs3W5yX2p1sj+k4OIA1WyvZcTyCBlC/zLnl91MNUfbK1jMrFYJOfbnPnTEeqeRMbrvel8wpWnWRZPCrIYrQocRw5jjIhCpbGpe+liON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YJFPBTT3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D6TTVwl7; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 97D9811401F4;
	Tue, 18 Jun 2024 11:01:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 18 Jun 2024 11:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718722878;
	 x=1718809278; bh=RVHjj4yYUDE/tJbcR5uSfnjW+IhJKni/0TnQliIPNVw=; b=
	YJFPBTT3GBVvPEFzK9E8q2cqejMBQRPYgj8aoAkAAHIJ8cbEAIQopwf8VCcD94n7
	E4MnJ87c3tL/Hcc6PWVmvYIlZp5FwAG6a/LY0zyUw9VCw+L3c7x782DgJvyviKpv
	p2mNKGgtmPr8sug82/JKBRRnsn0SqmY2tCdqqWDfxAylK08XxlrKmeHcnE6PCRYo
	RbLh8Gc1TmagLh0R22ZsQZyFm30RYkhkYj9jBTeo7KEjdgY0whhczmA7C6qjO5i5
	MgDA/ThQFlBLN5uBGdbDE4TVwBmONLvOH9tIKnqMLjbpQJ82GfcZGZYhH+HcFss8
	zh10Mp9lafXMLTFi5MFnRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718722878; x=
	1718809278; bh=RVHjj4yYUDE/tJbcR5uSfnjW+IhJKni/0TnQliIPNVw=; b=D
	6TTVwl72TkatIZ1g4wKeqTtm6KskYnImr5oRTiBVCmjHgRfsq6TeWPE/hiWzUZK4
	tCLjWb92PN9l3xJwikigNnE4sILO+3w8go3gntGhT8O2Rvra91AhLwTGl+L/Dvy3
	w5C443BnB7AJHVcBDjko411SHvN2XAg0W7Ndx3fwiDf26n7EPLdj8urXZvSELCrp
	i15NoxFXJHQfTpyP23o4mbjaa48T7Gjy+3R4mLNvPGnXevCxvVwMSKGfKXrZlhin
	1ILLpyc55ZqI2LAslGgyComB2xfTNFBGB3adp5lSspyUDpvin6oOUZDS9aJS7Lju
	zbeEiRPoeLPpvlpmgmJxQ==
X-ME-Sender: <xms:PaFxZrdvMREQZ4hHiVhzYVlv61D1EOLKvOFvVge3BvIIAhFV8TDADA>
    <xme:PaFxZhMXFbOjF-xjppbzAJaIcO_fUYgUQyOrmn6Ru9-1PQOWaT-SfNOkevclC_b5J
    vqZaQUp2VFUhY2WRWs>
X-ME-Received: <xmr:PaFxZkg9mulQwUTwEs1gtZ6Xhusgh_2zSLjQ2udaML7LyKYBhEOE6P_q9KdUkcKqn6yhHvRs7LDU7e8uIJKSJzjpZg4e3Mo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:PaFxZs8z_jxdIlCPsnZFNMcgDJReXdnsI5WxfQZkbF8WOvPUJZJ4rw>
    <xmx:PaFxZnvN39tbKQiDdYoL0bvWycEvMylD4v69bw4qd1E9Pn8b7xtHFQ>
    <xmx:PaFxZrGbMUkGfpJCfBFJ0FfXL_AESd_2xZOEdfjVG7IcKNIGO0sR0A>
    <xmx:PaFxZuPhyTO9WDvl3PPRIDa7aSZSjPMae2rO7aqTp6I6VBoG78emZg>
    <xmx:PqFxZrgwxqr-xFnR15kFaCsSSVakBxVh7CTYaqlr8MYGk0OdZsZPgCrK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:01:17 -0400 (EDT)
Date: Tue, 18 Jun 2024 17:01:14 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
Message-ID: <20240618150114.GR382677@ragnatech.se>
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>
 <20240618144101.GB17243@pendragon.ideasonboard.com>
 <20240618145113.GC17243@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618145113.GC17243@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your review.

On 2024-06-18 17:51:13 +0300, Laurent Pinchart wrote:
> On Tue, Jun 18, 2024 at 05:41:03PM +0300, Laurent Pinchart wrote:
> > Hi Geert,
> > 
> > On Wed, Apr 17, 2024 at 03:34:36PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Apr 17, 2024 at 2:06 PM Niklas Söderlund wrote:
> > > > Some R-Car SoCs are capable of capturing RAW10. Add support for it
> > > > using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> > > > format to express RAW10 unpacked to users.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > 
> > > Thanks for your patch!
> > > 
> > > I am no VIN or V4L2 expert, but the register bits LGTM, so
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > 
> > > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > > @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
> > > >         case MEDIA_BUS_FMT_Y8_1X8:
> > > >                 vnmc |= VNMC_INF_RAW8;
> > > >                 break;
> > > > +       case MEDIA_BUS_FMT_Y10_1X10:
> > > > +               vnmc |= VNMC_INF_RGB666;
> > > 
> > > The actual meaning of this bit is not uniform across all SoCs.
> > > On R-Car V3U it means (partial) 16 bpp, on R-Car Gen3 it means 18 bpp.
> > 
> > The INF bits have different meanings depending on the VIN input. What
> > you refer to above for V3U is for the CSI-2 input, while for the rest of
> > Gen3 you quote the values for the parallel input. Value 111 is
> > documented as "prohibit" for the CSI-2 input on the rest of Gen3.
> 
> To be precise, for V3U the documentation indicates "Input from Channel
> Selector", not CSI-2. V3U has no parallel input.

Yes it's getting a tad complex, but there is no issue here is there?  
This patch extends struct struct rvin_info with a new raw10 bool which 
indicates if raw10 is supported, or not. If it's not supported the 
driver rejects the MEDIA_BUS_FMT_Y10_1X10 in format validation.

> 
> The macros for the INF bits mix names for different types of inputs, it
> could be a good idea to clean this up.

There are so many things in this driver I would like to clean up and are 
working on. The first step is to clean up the async and VIN group mess, 
there are patches for that on the list. Once that is done I'm planing to 
refactor the init functions and defines, one per generation in different 
files to make it more clear how things look on the different generations.

> 
> > > > +               break;
> > > >         default:
> > > >                 break;
> > > >         }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

