Return-Path: <linux-media+bounces-28385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD9A65E51
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 20:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83A4A7ABD28
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 19:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E819E1EFF97;
	Mon, 17 Mar 2025 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JqMuCFPB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZsWAigZa"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DF1C6FF7;
	Mon, 17 Mar 2025 19:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742240667; cv=none; b=dm3O/4+AkiVjxig47Ut6vyA3zyXCyZ5giY948XNvkQQCJl0nWwVF66IEVZvUplDhOZz5P/+o8fotnH81Zm3721AqQs0wSzjGyWGCW844BuibBMpG/E/R/Rcke+wLEQSgXV/+G3hH8uqsxAFaWVNIfIq1eaNlOOMtZmjkLdeFX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742240667; c=relaxed/simple;
	bh=e6pKxjRpOywJYjLXV9cUmzm3EkOq+DyNe+4o7auCxhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lzb5RTHnupcAWt3aekHnGWexfsMdAxRSuYzx/kijEYBfzMFtdeD/fCMTrtL4xnalOuJ6vcCzzdhApJtozaG8DcJWPeqSJEkqmjo9PGz8kVtFVaXNGLQA6U6eCvmE0IByfytZUg7hQy4TEmt+xsrsQRD0NK4uX4Qito76Txrg74k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JqMuCFPB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZsWAigZa; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6004311401BE;
	Mon, 17 Mar 2025 15:44:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 17 Mar 2025 15:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742240663;
	 x=1742327063; bh=3FmmIDjQM+RHX1Lvf7nP6PhbyWa8+bI1w43RRWznJ2g=; b=
	JqMuCFPBNwYmSgrxLgQM8RjvFFnHo5OJ3cxcVR0XMgm7TuwC9wMK0jnL6OzGlq9v
	aqsVoKp1otmjFcXn1HZL8oWQiFrzQwzkP7nsGtpzZtwjmRsVMEhynEaKVHnyXX3z
	rmkLe/FxFcgZNZI0QCqc5OtU7qO+LSzWdeU7t9nbOAOL0+LZ4wG+Kc/uMivbl80u
	NcZ10oRik3VwQIQ23hDEw5+M+4GN1B52YJUEnFt72/oi0r+pZqGbqmI6NumLGKHY
	rHEewpiQUzw7E1v3yJ97yLN3iOl8NIiO1HAt9D+IV6xmKacTDMkRSzPjaNRq4JNw
	1TzQM6Q4K6Rmj0tirUuz2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742240663; x=
	1742327063; bh=3FmmIDjQM+RHX1Lvf7nP6PhbyWa8+bI1w43RRWznJ2g=; b=Z
	sWAigZasCYA+Oby5335c7cPIsdqWFXx0rKPzl22MkHCdZCxnR1AKOA6LB9lxsIC0
	PQK1lc3juygdEc+YBk3gJHcZ1n0mZegYuwdK2D4Oz+5M5SVr4MukBPOlbtfHEVLK
	k1VW0jr3+qPHoRYL/ZaETZ2zPcnehf2DXx6cUIWCk+clLgZ77Kn6Wg6EGzFiro0B
	/NTIvKphkpVq0qan6KgRiwiiYzNDD+zdL4lTmbO8UCj2I+eM4/uhWsFMX7VTOqRE
	AnTPyg1Hk1s8ttrNgRu81/AQQUQdQvAyAIpVIaraW1JRZwVSXEHJoayA0pBCQfC7
	xJJdZIs+72AAShV6Vi5rw==
X-ME-Sender: <xms:lnvYZ7Vy6SqHfzWCeBw4LCC9hhokB8LM54FHJXB1yOCS5yq2jHUOHQ>
    <xme:lnvYZzmRRv_adClB2xRhitLvdOE9BNHHcq4lp5KvSFSFYulyZ1LNGtLOXbR1NORiv
    RFGRdI65BsMklslvvQ>
X-ME-Received: <xmr:lnvYZ3ZjcV3bpKoOm6aKY9PG_4g-mgy_zwtoPeYLchrrst8fD6a1Q7HkpZ7BUAxB74K3G0ZWFYyd3c94LR59FsedRUAUs-B7wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepkhhriihkse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrh
    drsggvpdhrtghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnhhlpdhrtghpthht
    ohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:lnvYZ2XJTvIjBv2fhuKktxQxNJyDki8BEFymEoPjECmmoFlCLXgevQ>
    <xmx:lnvYZ1lC3G8eJYCH0C2cnEk8hrcvxtaqlPsM_SqK__Pl6mwOP5A_5w>
    <xmx:lnvYZzfSVl2ZjrGD3hGkWgpew___Wbj6ITa7k3GzYXYNBxRxllLkPg>
    <xmx:lnvYZ_F8Jq4EYrzF5yfQVdfy7tEuaH007rK9AF-8So4GpH8t9wFeZw>
    <xmx:l3vYZ69HjrRjWaoaML-sHbbLPYMZAW0FV_z8_sMrqmCPhMe6YUE3lDNr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 15:44:21 -0400 (EDT)
Date: Mon, 17 Mar 2025 20:44:19 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <20250317194419.GB949127@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-furry-independent-clam-33db01@krzk-bin>
 <20250317115006.GB868399@ragnatech.se>
 <5876368b-1549-4ce0-af43-80f712f457c8@kernel.org>
 <20250317153726.GC919085@ragnatech.se>
 <CAMuHMdXU4JxDe-L+UcUwzndariz=mfed7UyVXW2Mv0yggXZw4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXU4JxDe-L+UcUwzndariz=mfed7UyVXW2Mv0yggXZw4w@mail.gmail.com>

Hi Geert,

Thanks for your feedback.

On 2025-03-17 20:21:14 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, 17 Mar 2025 at 16:37, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2025-03-17 15:57:31 +0100, Krzysztof Kozlowski wrote:
> > > On 17/03/2025 12:50, Niklas Söderlund wrote:
> > > > On 2025-03-17 12:33:07 +0100, Krzysztof Kozlowski wrote:
> > > >> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas Söderlund wrote:
> > > >>>    ports:
> > > >>>      $ref: /schemas/graph.yaml#/properties/ports
> > > >>> @@ -103,10 +138,14 @@ properties:
> > > >>>  required:
> > > >>>    - compatible
> > > >>>    - reg
> > > >>> +  - reg-names
> > > >>>    - interrupts
> > > >>> +  - interrupt-names
> > > >>>    - clocks
> > > >>> +  - clock-names
> > > >>>    - power-domains
> > > >>>    - resets
> > > >>> +  - reset-names
> > > >>
> > > >> Another point, this will spawn bunch of warnings for no real reason.
> > > >> Just drop all the xxx-names from properties and from here.
> > > >
> > > > I'm sorry maybe I'm missing something, but if I drop them from
> > > > properties how can I add checks to makesure the names are either "cs" or
> > >
> > > Why do you need to check for the names? There will be no names, so
> > > nothing to check for.
> >
> > Ahh I see. But I would like to have names if possible.
> >
> > The driver is backward compatible with the old bindings, and going
> > forward we have better bindings with names. All users are updated in the
> > next commits in this series so the warnings will go way rather quickly.
> 
> Note that the driver does not _have_ to obtain the "cs" clock by name,
> as it will always be the first clock anyway ("make dtbs_check" will
> sort-of enforce that).  So you can simplify the code by obtaining
> the first clock without specifying a name, and the second (optional)
> clock with a name.

I understand that, and for this fix this would be acceptable. I'm just 
trying to think a head, something I should have done when first writing 
these bindings...

I'm fearing a scenario where we will need to add a 3rd reg region or 
clock. I don't think we will need that for the compatible values we have 
here, but then I never though we get the documentation that now allows 
us to describe the second region...

If you and Krzysztof are happy without names I can move forward with 
that too, I'm just trying to learn from my mistakes ;-) I will give it a 
few days and then head down this road without names.

-- 
Kind Regards,
Niklas Söderlund

