Return-Path: <linux-media+bounces-17652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71896D1D9
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD1D1F2BDAE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D32196450;
	Thu,  5 Sep 2024 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="dll2UKhe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z8BONe1t"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE71190075;
	Thu,  5 Sep 2024 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524304; cv=none; b=mZCXh30MN+9oZaxvDGKGEyIqlYX8MHHSqBInK73TIxKXBXweYBoTK5+i6u0KeFK+OMH2nkY50fmhuG/KoZn3Iy2UyUcU9PBV6quUjLlxfLUdSlZr1PKlKzQwcZ8v+/9usS8KoWEvWTtri/vup58g56Z4hcKG9v7ew1Plw7kbGpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524304; c=relaxed/simple;
	bh=6P78TQmNI+aVVBGBKjdR/+c5NzOBNGUrUiJlcUZx/mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgYSuriMM/9LCga+0yIeaiao0Zxo+3bWOkN2OsbSb4jueV8Tbj1RCbAIlHTWFuJaxwOeazhm4lhSsnjaI4525zNQCbvmJlmCZ73tMZ5QUNq5TRj34bMujFGQk3L/VLHa59vlAfIMXHdtdbDqwKWp+WoZaYQv2iEh5v4IMbC9Txk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=dll2UKhe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z8BONe1t; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3847D1140148;
	Thu,  5 Sep 2024 04:18:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 05 Sep 2024 04:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725524301; x=
	1725610701; bh=WtwEAKrZrYNRLzgPZ4AVqDwICtzLdQID0hX5HloQEWA=; b=d
	ll2UKheBld8xZn7xfP5XDo30Ak91d0zncH6xgyS6EcJk1sWZBUHh4DokZRcR/Igy
	7tylCoEN3JzM9CWEyHLRW/CuQt3aSApMXci47yLYkSEOyZsT7RUxU/MEdyvXnkMw
	MKQvMmd0ZeikRz7UOqJmx3HcrMzPN2dzyCnAqPjn0LAqAxqrgUdjqyB9bOLQWHDB
	2dXYZKOq6QmdG/IJn3sjK7cd03jRbruV5my85FKV4aKzrjPW3GYG6FGL+RZyB/y+
	t9TLS2P2t6B+RSP/htVqcn4gEqDMqhUSBvmImjb2X35VO1m8MPt58dfn2vH3ds61
	nyWWH8/88j88gR7iD4jvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725524301; x=1725610701; bh=WtwEAKrZrYNRLzgPZ4AVqDwICtzL
	dQID0hX5HloQEWA=; b=Z8BONe1tT4yBkhN2aUY2c4mI2fQdAPdHb/xDOne4EMGD
	SBOs6ZhitVGIlTM/p67+hYIhws9v55oW0uZ9/1e9R1GexCSa5POKBmn5OIcrlDfi
	kKUOrB4HE/MEgZmBcuWR2qMFU39UX+hTs9wanEmp68c3Brsf54cp7Tm10iT1+7vJ
	irjZpbTJDybY6d2CABgTofum8KUPdTdnZhcJ5tgaNjaLHZUIqCa+e1rMqXMQvdto
	4AjqZefMOgQkcW4T3GNW6+T4afYLbKIJofF+//UMrNla3rUNCZ7vZch9zY1HaFNB
	W1EwRa0yVN1T2f4+W+5Yxvl98OZbKQ7+fJRKqN1CTQ==
X-ME-Sender: <xms:TWnZZumR37ykvPpir5EHJJmOk126_GJQg5GyWeX0LRLBdXRAm94vVg>
    <xme:TWnZZl2SCiHw1PoHuL44iOElqGFmcr7-otr01jImQKwZpaOgR7KGJSM3hG5ABy20k
    EpV2mfnvZcOcAWOR48>
X-ME-Received: <xmr:TWnZZso3HByT3ORO2aWsPehBW1_ZZSq3E4szd5o4MjZ5s9yg8oWzjOySIxjQJ9zWZNnOMJhL4_ZONOdnobjQdhUgtjl291g2MBo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihessh
    grkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepueeiueevleefvedttefg
    vdeutdekveduheevffdvhfeluefhgfdtgeeutedtudejnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjphdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    vggumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhope
    grphgrihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidufeelgedquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgv
    thdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TWnZZimpPjErUb-PX7e37cNm4G2_5vHHy5fvyCWjHbx4NXjmHP6nrQ>
    <xmx:TWnZZs2guP9gekben1zbRpXN8leD9-48kUsmzENVuKM66e-RnSa1WQ>
    <xmx:TWnZZptB90Wh407iaVDtp_tzH9BKaPdf_7pPo-4VgEgMD-DgfNOp9w>
    <xmx:TWnZZoXCuUbGB3vrG6SrQ9rvXqUNT6PZ1O1EbsKfYvhgQSMIejTV3Q>
    <xmx:TWnZZtltYZ3GNZzUZFZINzsr1jCQaeYMYXPSK8ALWPnmJXpkuPtz9fTh>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 04:18:19 -0400 (EDT)
Date: Thu, 5 Sep 2024 17:18:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Edmund Raile <edmund.raile@protonmail.com>
Cc: apais@linux.microsoft.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, netdev@vger.kernel.org
Subject: Re: firewire: use sleepable workqueue to handle 1394 OHCI IT/IR
 context events: test 1
Message-ID: <20240905081817.GC486563@workstation.local>
Mail-Followup-To: Edmund Raile <edmund.raile@protonmail.com>,
	apais@linux.microsoft.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, netdev@vger.kernel.org
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
 <20240904204531.154290-1-edmund.raile@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904204531.154290-1-edmund.raile@protonmail.com>

Hi,

Thanks for your test.

On Wed, Sep 04, 2024 at 08:45:51PM +0000, Edmund Raile wrote:
> Hello Sakamoto-San, I very much appreciate the idea and effort to take on the tasklet conversion in small steps instead of all-at-once!
> 
> I also thank you for the CC, I'd like to be the testing canary for the coal mine of firewire ALSA with RME FireFace!
> The ALSA mailing list is a bit overwhelming and I'll likely unsubscribe so a direct CC for anything I can test is a good idea.
> 
> Trying to apply patch 1 of 5 to mainline, your kernel tree appears to be out of sync with mainline!
> It was missing b171e20 from 2009 and a7ecbe9 from 2022!
> I hope nothing else important is missing!
 
Yes. The series of changes is prepared for the next merge window to
v6.12 kernel. It is on the top of for-next branch in linux1394 tree.
You can see some patches on v6.12-rc2 tag.

https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git/log/?h=for-next

> Since in fw_card_initialize, ret is tested to be 0 we'd need an else instead, is this correct?
> 
> I edited these functions of patch 1, now everything applies just fine:
> 
> @@ -571,11 +571,28 @@ void fw_card_initialize(struct fw_card *card,
>  }
>  EXPORT_SYMBOL(fw_card_initialize);
>  
> -int fw_card_add(struct fw_card *card,
> -		u32 max_receive, u32 link_speed, u64 guid)
> +int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
> +		unsigned int supported_isoc_contexts)
>  {
> +	struct workqueue_struct *isoc_wq;
>  	int ret;
>  
> +	// This workqueue should be:
> +	//  * != WQ_BH			Sleepable.
> +	//  * == WQ_UNBOUND		Any core can process data for isoc context. The
> +	//				implementation of unit protocol could consumes the core
> +	//				longer somehow.
> +	//  * != WQ_MEM_RECLAIM		Not used for any backend of block device.
> +	//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
> +	//  * == WQ_SYSFS		Parameters are available via sysfs.
> +	//  * max_active == n_it + n_ir	A hardIRQ could notify events for multiple isochronous
> +	//				contexts if they are scheduled to the same cycle.
> +	isoc_wq = alloc_workqueue("firewire-isoc-card%u",
> +				  WQ_UNBOUND | WQ_HIGHPRI | WQ_SYSFS,
> +				  supported_isoc_contexts, card->index);
> +	if (!isoc_wq)
> +		return -ENOMEM;
> +
>  	card->max_receive = max_receive;
>  	card->link_speed = link_speed;
>  	card->guid = guid;
> @@ -584,9 +601,13 @@ int fw_card_add(struct fw_card *card,
>  
>  	generate_config_rom(card, tmp_config_rom);
>  	ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
>  	if (ret == 0)
>  		list_add_tail(&card->link, &card_list);
> +	else
> +		destroy_workqueue(isoc_wq);
> +
> +	card->isoc_wq = isoc_wq;
> 
>  	mutex_unlock(&card_mutex);
> 
>  	return ret;
> @@ -709,7 +729,9 @@ void fw_core_remove_card(struct fw_card *card)
>  {
>  	struct fw_card_driver dummy_driver = dummy_driver_template;
>  	unsigned long flags;
>  
> +	might_sleep();
> +
>  	card->driver->update_phy_reg(card, 4,
>  				     PHY_LINK_ACTIVE | PHY_CONTENDER, 0);
>  	fw_schedule_bus_reset(card, false, true);
> @@ -719,6 +741,7 @@ void fw_core_remove_card(struct fw_card *card)
>  	dummy_driver.free_iso_context	= card->driver->free_iso_context;
>  	dummy_driver.stop_iso		= card->driver->stop_iso;
>  	card->driver = &dummy_driver;
> +	drain_workqueue(card->isoc_wq);
>  
>  	spin_lock_irqsave(&card->lock, flags);
>  	fw_destroy_nodes(card);
> 
> Building a kernel with the patch produced 6.11.0-rc6-1-mainline-00019-g67784a74e258-dirty.
> Testing it with TI XIO2213B and RME Fireface 800 so far > 1 hour reveals no issues at all.
> ALSA streaming works fine:
>   mpv --audio-device=alsa/sysdefault:CARD=Fireface800 Spor-Ignition.flac
> 
> Though I haven't the faintest clue how to measure CPU usage impact of the patch, it looks like it would be neglible.
> 
> As of finishing this, I noticed you released [2] https://lore.kernel.org/lkml/20240904125155.461886-1-o-takashi@sakamocchi.jp/T/
> I'll get around to testing that one too, but tomorrow at the earliest.
> 
> Kind regards,
> Edmund Raile.
> 
> Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
> Tested-by: Edmund Raile <edmund.raile@protonmail.com>

If using v6.11 kernel, it is convenient to use my remote repository to
backport changes for v6.12. But let you be careful to the history of
changes anyway.

* https://github.com/takaswie/linux-firewire-dkms/


Thanks

Takashi Sakamoto

