Return-Path: <linux-media+bounces-28366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1238A6545C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 15:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC5297A25C6
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 14:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AB124397B;
	Mon, 17 Mar 2025 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bnFmEZYg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pjisEXi5"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9561474D3;
	Mon, 17 Mar 2025 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223196; cv=none; b=WHtcwXrPs6pseCN4Mbo2z05n8NNg7yi0eyKDkS4KXlmTGR/LWtyVuL3BLYIwjr9WjbI1qMhyaD0aEZLukZueiIIOSzJTCKR7KVYwZNB+nDtXrNyZ9/LXB2NzTdA6KOu6o9aK+XiLYaJDDl4yDfIeQZHsb7kC/OY0GZc5L6L9D38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223196; c=relaxed/simple;
	bh=6sOOCt8+U1ZreHofJKHbQZqWeTPucStsu0g8FUMaaQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbxpjIALipslIF4iAoxlhy3j9/+alaPiAz+SJNsS6YESR6MmHplZM1uZHDR8mb0BFI5KpbOlHI0UXOz1um3sWh2pGfAFkJI8a8y/rUpXxz/WOmVWhvaNWQ4dbABR1TF1w6qY6uhBCuR7pfasyVZbK7s4ZZwl8Iy6XJKHXG9YnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bnFmEZYg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pjisEXi5; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 3FFBA114014F;
	Mon, 17 Mar 2025 10:53:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 17 Mar 2025 10:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742223193;
	 x=1742309593; bh=saAMc/2lj19letF+s4rb5dpyWNWUaKSY1JCBnQP4m3g=; b=
	bnFmEZYgFIPtjVWA2/H6JiD/hUigTqZpNB/IleZP/O32IRvjTr+xGmJcTFHAaVjp
	YsNwenAT1VQ7OJCR89bSQwS7lhDO+QaWO0IV47UMKERmcEC5bfuPVxIGv7h3AtuG
	Aez2ei9uMiis3TwBGOCZzs2vrQb4oLlUc/NX8Dm6ysiKK5ITW6x0bBCTc6h27OF9
	28btE6Gz3/L+nUXmYyPxDaDIA5v7dH59XbkbFv2f2o+m1mK7DNIrzIeHJxfUu0XF
	Ing5zl7E4HKg/IstX3C3gkWFHfN4WDryal0wF6Qthi409xPH0InjfUMDrjI3RBZ9
	i4G6uli34bCMG4VTCLo6Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742223193; x=
	1742309593; bh=saAMc/2lj19letF+s4rb5dpyWNWUaKSY1JCBnQP4m3g=; b=p
	jisEXi5cJ74o2FkL5frsVm36/8fF+vM1Fq6kV8+ePRWPErYHXuTHqRVwZbOxiLJM
	/VEH++yBhng8tLWhkxWBZB2rcAMQiDiv/KrA3FjoZf1h6WbTi4U21qjl5eyhx4oQ
	gf5W/LGdjT8FEIED1fyUeVBCoP0PbWJ0h42eydjmqVYiiaSJy3eTuGV3n7uw1u9H
	uR/ZIAKSOectHd5BY8Mb8bQLtKczkYtia1FYhBHXBMmWmeigO2xME0cTrBCZmPaZ
	eMiYesjwwOLU6orEx4BluBNyIK4IJFU6sDpi7Ff7jaCxh92KA3fXmtpun4oOuFw7
	5ue5PD+nQmuC93iIRi6uw==
X-ME-Sender: <xms:WDfYZ6yPWr1BmqBitjP7yyGkX_3wz5jK3YdgsKvVx2QjGaj_5GC_jw>
    <xme:WDfYZ2TQKd-S-DhtohzqL35KSVG_W6ZoL36XtlyjKu-RqJKvsbHP5dJqiLwHnQssx
    d2TvBEqVWgePdTu3bg>
X-ME-Received: <xmr:WDfYZ8Xql2Euq7lrOPPh-d0TadcMyDkyql98t80ieoCLHf17Lzz2vmPhlt2IRERvxpkysxjUHAVDb3ATvlGQ-ge4u3ZSFGqm-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehsrghkrghrih
    drrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghh
    rggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnh
    dorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WDfYZwhgG5Od-7AABLjraJDuf4feoyssa5z-0ZoNOA1yLxzWqHWLug>
    <xmx:WDfYZ8DXku4zyKWaNxpFpQu0coE2cXcu7G77ZBjIIAJ1CfDhZ2bJGQ>
    <xmx:WDfYZxL5QmgCWOBAnxC7aML86SAfxl1ysWcUmZ-Zg25FbqOiq77tAQ>
    <xmx:WDfYZzDKfzvNY6SQQ_3F6a09kmUE3Dtma6_YXWaeg_GCvo-EcsCrig>
    <xmx:WTfYZ-03ew6n_x6YxjYfSxvmxvNQN9E2QiP3KUc3y_Uhpjr1h52UAyTZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 10:53:12 -0400 (EDT)
Date: Mon, 17 Mar 2025 15:53:09 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
Message-ID: <20250317145309.GA919085@ragnatech.se>
References: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se>
 <20250224183938.3800317-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVwnhVuhpawg_KVbe-h1ikoqXcy88M3JJy-nnS6dpH3kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVwnhVuhpawg_KVbe-h1ikoqXcy88M3JJy-nnS6dpH3kA@mail.gmail.com>

Hi Geert

Thanks for your comments.

On 2025-02-27 14:46:24 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, 24 Feb 2025 at 19:40, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Prepare to move Gen2 and earlier models to media controller by
> > generating a unique VIN group id for each VIN instance. On Gen3 and Gen4
> > it is important to have a specific id in the group as media graph routes
> > depend on this. On Gen2 and earlier models all that will matter is to
> > have a unique id in the range.
> >
> > Break out the id generation to a own function keeping the logic for Gen3
> > and Gen4 while generating a sequential id for Gen2 models.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > @@ -114,23 +114,41 @@ static void rvin_group_release(struct kref *kref)
> >         mutex_unlock(&rvin_group_lock);
> >  }
> >
> > +static int rvin_group_get_id(struct rvin_dev *vin)
> > +{
> > +       struct device_node *np;
> > +       unsigned int count;
> > +       u32 id;
> > +
> > +       switch (vin->info->model) {
> > +       case RCAR_GEN3:
> > +               if (!of_property_read_u32(vin->dev->of_node, "renesas,id", &id))
> > +                       return id;
> > +               break;
> 
> Please insert a blank line here.
> 
> > +       default:
> > +               count = 0;
> > +               for_each_matching_node(np, vin->dev->driver->of_match_table) {
> 
> This is a rather expensive operation.
> What about calling ida_alloc() instead?

That is a good idea, did not know about this. I opted to use 
ida_alloc_range() to make sure the ID is in supported range. Thanks for 
the tip.


> And probably moving the code to obtain the ID to rcar_vin_probe()?

Good idea!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

