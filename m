Return-Path: <linux-media+bounces-18248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C9977C58
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 11:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51A4F1C24744
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035C31D86EA;
	Fri, 13 Sep 2024 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="HcX1kffT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4PwImb1"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721E18A6D6;
	Fri, 13 Sep 2024 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726220342; cv=none; b=tjjJYJqs9tbQMjvsXG8QSEwB0cCZV7xnVgs+6fMOnzEu36orxotfheBHeFs4NzGl7nzk0WT6eoozVYGRpvyqbz2xce7m6p7v07o7jZyXbkO9hXcwTMKMxv9eLpea3+wgYdfomoGCu+TXrvYs/FaHYkMe/pzL0RkuL+JvzzrqFaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726220342; c=relaxed/simple;
	bh=A2qVBIMYp/2r3CFer6xBiqk5bNkvq3f/Xhhuxq/P0po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gStnrp6ys6MRZDMJ3al5Ft6ELEwyIKphSO0MOAW418TqImtc3vv9HTm4expb1kkyiXGYFEdh/VuEjskPZEMNHl4Q28XtGH/yp8RShnT5mXlkj+nnQkidw1dwyRiuLqLZeswAy6yz5XdGU4JTybVfUbm4DJVy6zKZhUwcSC3Ypg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=HcX1kffT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N4PwImb1; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id C6E8B1380313;
	Fri, 13 Sep 2024 05:38:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 13 Sep 2024 05:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1726220338; x=
	1726306738; bh=K+AlDx1kABcH1bjNHO39XpWBnTf9rTOESmFmUtu1C08=; b=H
	cX1kffT3gCsZo8AGKNkafPUMycPnllN8WmPLz3Onpcfx7YO0aAf3umyQRTO3TGkV
	7wNfcGotSKBxOTmB4fnfYkzDNVUFGEA9oG60zaVOwQmaGOhRYKq0WripbZxmWt0P
	1IymJe/4mIR59TfXSFJs9cpj+LbuAaWlvSfR5yLfqtoAU10uM9x1GrjU3YFTvnI4
	MHksV7cyLq2+YSR9ntus9OlHurj+p4sKYoe24WBskIZcGFy632YkVc1llOAcdqIQ
	wIFkyeBrV9t1PsmygnWQlbHYXdz7fWG7DynapGOidwfWpMhLezjObPw/qnDiyOpF
	foDE1kkKPkV2E20Xc8dJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726220338; x=1726306738; bh=K+AlDx1kABcH1bjNHO39XpWBnTf9
	rTOESmFmUtu1C08=; b=N4PwImb1Y8dtY3Yvdl0JyU0ll9bbD+5QfTwsw8ZoJGrw
	9kkTnH2JCxeuPOh+TkLO2oNrVhVirAUSHg30Zp1xmPfQ7OKzpIyFw7HltEHWCB6l
	NX/8Bju0TjV6Vpchbo/txdvmOEQ1a44gtD6c5zch8EXZWlD5fqJZdy8mcvhNuKLq
	cTyXYxSO5CVkQ+HAEfSlKXBbenHPWjSDSRJz0XCDMTwHmxVihdVfhHQ/VdcbAoWq
	7CwRN34bzjo0S+OE/dNCN2gmB37jBViTEofPl3Qi1jCSW3ETTn9HQiEDJa8fkNDs
	Nj1X7bZFt/1cpnmhcMsG4Qe/JWodvqNYmTYJxI+SIQ==
X-ME-Sender: <xms:MgjkZuGHfqvk9YQjf1X1JztIqEs3eg6EVQaNNOTtEP7yQFd989E1hQ>
    <xme:MgjkZvUcVlw1GV-1wp7QecddrABnrkNs2jmL1mzcLXYTgdcOHB27WWWF8Lw6-9-8_
    gbmS-DCBDXJCeu7JJ8>
X-ME-Received: <xmr:MgjkZoLK6s0QnlUD9d53h_XsEY1X7bJ1MYESpm4ZE_up0g0aJlV2YnyRoKTQroWLCdfp19IIo_-gSu5CyoWVT_CPU70z44MKVonL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihessh
    grkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeu
    ffevveeufedtlefhjeeiieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhho
    tggthhhirdhjphdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepvggumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgt
    phhtthhopegrphgrihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepth
    hifigrihesshhushgvrdguvg
X-ME-Proxy: <xmx:MgjkZoFxpE_q3HpW7obNDw_FUZc7_Ln34uOcTKuGQPGsHtya35QuIQ>
    <xmx:MgjkZkX-LWRIRQTd0aUj3Ro9XsT86bvURayymGs0pzDzpeRx_frMnw>
    <xmx:MgjkZrPdibi_zgMrPML7e7dDkNSxVMAHfsIhvnVBV8L_VrTot0q44Q>
    <xmx:MgjkZr3Ig31IgjdsnlOsY4zqVG7cl8rMmhf5UiPZZ2dq7dvRkz6qdQ>
    <xmx:MgjkZnHOhA9Xlf6OvTSjXfCdK3GeHHBNJ7BzZMvmb_olpb3wOgCwNNG4>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Sep 2024 05:38:56 -0400 (EDT)
Date: Fri, 13 Sep 2024 18:38:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Edmund Raile <edmund.raile@protonmail.com>
Cc: apais@linux.microsoft.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org, tiwai@suse.de
Subject: Re: firewire: use sleepable workqueue to handle 1394 OHCI IT/IR
 context events: test 2
Message-ID: <20240913093852.GA305057@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Edmund Raile <edmund.raile@protonmail.com>,
	apais@linux.microsoft.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org, tiwai@suse.de
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
 <20240912214404.10616-2-edmund.raile@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912214404.10616-2-edmund.raile@protonmail.com>

Hi,

On Thu, Sep 12, 2024 at 09:44:52PM +0000, Edmund Raile wrote:
> Hello Sakamoto-San, I came around to testing your patch [1], after RFT.
> 
> I've had to make the following changes to patch 1/5 again for it to apply to
> mainline (d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f), due to missing b171e20
> from 2009 and a7ecbe9 from 2022.
> 
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
> Then everything applied fine.
> 
> This resulted in 6.11.0-rc6-1-mainline-00326-gd1f2d51b711a-dirty.
> 
> Testing it with TI XIO2213B and RME Fireface 800 so far:
> 
> Initially I had a buffer freeze after 3 hours of continuous ALSA playback
> from mpv:
>   mpv --audio-device=alsa/sysdefault:CARD=Fireface800 Spor-Ignition.flac
> accompanied by stresstest (mprime).
> 
> It didn't freeze/crash the kernel, just the audio buffer kept repeating.
> Gone after power-cycling the interface and restarting playback.
> 
> Can't say with certainty whether it's related, have been unable to replicate
> the issue for the past 3 days (good sign I hope).
> That's why I was holding this message back a bit.
> 
> Kind regards,
> Edmund Raile.
> 
> Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
> Tested-by: Edmund Raile <edmund.raile@protonmail.com>
 
Thank you for your test. I've picked up your Tested-by tag to the
series.


Thanks

Takashi Sakamoto

