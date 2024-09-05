Return-Path: <linux-media+bounces-17653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0B96D231
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ADB81F29DB0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A718194AD6;
	Thu,  5 Sep 2024 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="aB6zsmLT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VugtY2xi"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125741898E4;
	Thu,  5 Sep 2024 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525195; cv=none; b=I9GUbtcueT483VA7s1/vC8pYuu8rj3twUBX5uQ7t/1ZFt0FKtNykEz4oiEuNIcmoRczOz/NzSgAdm/a07xKs0sb/uJUAQowC1/gP4JGxWIDl1CdOExsedqhKMs1Ai/LvJOAf2FKOjdqb0uq204xkdOcUIJWd/ZxYuCfsox0egqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525195; c=relaxed/simple;
	bh=kGdVf3qo9k1gCYwsKx6yKPqGhxh/Vd7vdgw+3LLgjgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDsvAUP9gDTMcm1N64/Pwu6eotszPaJLIuD1P9D/VGIZC2FyAv9A3RgsI1KHzBoM/gW+xgglTi+L8199aNJasZC3VkjmaLqT6/u/V6Xx6FUShXuhIKUyCDRN2EXodnC59+mVTlV6DIllbbNoiBqKeEY2Gjd327jBBlz0BwBjyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=aB6zsmLT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VugtY2xi; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 376DD114025D;
	Thu,  5 Sep 2024 04:33:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 05 Sep 2024 04:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725525193; x=
	1725611593; bh=zGSwkm/0b+Yg9/6KAThHY5kiKR2ZHgtclxl8/SMSTTk=; b=a
	B6zsmLTJHx/sBLDHdAeC1x7Y29e18WaFclGsvcZbikJexhCmVlgRBL/Vk2B60YjW
	ev6v6dSdsKWLQJJtDO42vWi7D5EYVFsY2YFR3hZ0HueJ+C+OAi0svgEHEOEU3YIl
	jLn9xgKbQyd+asDek4voCN4B+R0ztuk0KO3jMXzmJXDQ69UrUQPUJTDNu9DmStKo
	eOM+b1Gx/iTaGiEvLF7SiXMQVKDDM6SDayEZna7msM2aEfwC2wmgZSVhoISORAXH
	2bjh4ewY8va63tvREXu3YXem7ZazUyc/B8BFZqSlNfHVdQ0S5tH2vQP2v7fhFif/
	RiJK1fgixsyfM2/ywa2bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725525193; x=1725611593; bh=zGSwkm/0b+Yg9/6KAThHY5kiKR2Z
	Hgtclxl8/SMSTTk=; b=VugtY2xiPr0qp8/flK0OLuGNgS2AMstjuD4HlXxdfk/8
	5wqyAVs0nGmKYdrljlMTd+wb4huzeFCrVHQHJJ/jtQB++w+12xtkX21xIHZ74V0f
	l93lR29lGUkuzPidPQtfBdK3RPMDyWycljzyGWkU/OGUeGq1Mda5VF3crw2fyFOS
	TlMpsdq2byjZvCslmH1CKlp+UozgVJamdejHWVsC+8JLfYMUq17eOp4lZJUedBI7
	eZhM/dubMIB9/BiG4RrWcrEIY2LiRSf1LGfH7aPrMDx4a64DVz7+AbuYeY71XfW/
	57tJBcsZaNTzxm0al3qSeBhu8QXUcZDuFT2QMO/FUg==
X-ME-Sender: <xms:yWzZZnyAG0_DwJ03OmbeKFaMLmDDIXbYWOTQSs7p76NLz1u7DUUi0w>
    <xme:yWzZZvQ4a6alloQH_LTZgIIB-hPFIu1C7zHM0yhR6v9UyUHHmtuAbS6ZIGr6x2dZE
    xV3VLYak8fzoxLkl2c>
X-ME-Received: <xmr:yWzZZhXQIkEnkDGQLgIEGYm3lshN7V97xVQhWCxw9lhkSuVStgUKvLM9JGOn5drz9q80aqLfhemChk0-NJuI9UJWQW2HIc1BBfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeeileejheejuedvgefh
    teevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhho
    tggthhhirdhjphdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhifigrihesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsoh
    hunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghprghisheslhhi
    nhhugidrmhhitghrohhsohhfthdrtghomhdprhgtphhtthhopegvughmuhhnugdrrhgrih
    hlvgesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yWzZZhjjBFH1fJPPBz37WksJSTgJIBVhHPDaByGd_gpQKHAducOTWw>
    <xmx:yWzZZpAFgEnJY4XfU9KEjNDdxODWeGJCVoF3IX_rfatFFMbt_GAeMw>
    <xmx:yWzZZqJaKNIwyDhjHRuBSSY0iHE7fFzXM6TrELooMHfj02nmZmrMFA>
    <xmx:yWzZZoC0kTgGcIGxlefUbRNOM0bMGEG1N9ywZUUlkRvdDNvx6S61wQ>
    <xmx:yWzZZjDopFgs21W5cE3Mjf7UDezaFt3iOHBkC33vSYAACfN9dSAyzO7F>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 04:33:11 -0400 (EDT)
Date: Thu, 5 Sep 2024 17:33:09 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de, linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org, apais@linux.microsoft.com,
	edmund.raile@protonmail.com, linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/5] firewire: use sleepable workqueue to handle 1394
 OHCI IT/IR context events
Message-ID: <20240905083309.GA488601@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, tiwai@suse.de,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	apais@linux.microsoft.com, edmund.raile@protonmail.com,
	linux-media@vger.kernel.org, netdev@vger.kernel.org
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904125155.461886-1-o-takashi@sakamocchi.jp>

On Wed, Sep 04, 2024 at 09:51:49PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series of changes updates my previous RFT[1] to apply for v6.12
> kernel. For the detail, please refer to the previous one.
> 
> To Iwai-san, this series includes the change for sound subsystem as
> well. All of changes are specific to ALSA firewire stack, so I would
> like to send it to Linus as the part of firewire subsystem updates if
> you do not mind it.
> 
> Changes from the RFT:
> * WQ_FREEZABLE is newly supported in the workqueue
> * Improve code comment in IEC 61883-1/6 packet streaming engine
> * Avoid dead lock in the calls of workqueue sync API
> 
> [1] https://lore.kernel.org/lkml/20240901110642.154523-1-o-takashi@sakamocchi.jp/
> 
> 
> Regards
> 
> Takashi Sakamoto (5):
>   firewire: core: allocate workqueue to handle isochronous contexts in
>     card
>   firewire: core: add local API to queue work item to workqueue specific
>     to isochronous contexts
>   firewire: ohci: operate IT/IR events in sleepable work process instead
>     of tasklet softIRQ
>   firewire: core: non-atomic memory allocation for isochronous event to
>     user client
>   ALSA: firewire: use nonatomic PCM operation
> 
>  drivers/firewire/core-card.c             | 33 ++++++++++++--
>  drivers/firewire/core-cdev.c             |  4 +-
>  drivers/firewire/core-iso.c              | 30 ++++++++++++-
>  drivers/firewire/core.h                  | 14 +++++-
>  drivers/firewire/ohci.c                  | 57 +++++++++++++++++++-----
>  include/linux/firewire.h                 |  3 ++
>  sound/firewire/amdtp-stream.c            | 34 +++++++++++---
>  sound/firewire/bebob/bebob_pcm.c         |  1 +
>  sound/firewire/dice/dice-pcm.c           |  1 +
>  sound/firewire/digi00x/digi00x-pcm.c     |  1 +
>  sound/firewire/fireface/ff-pcm.c         |  1 +
>  sound/firewire/fireworks/fireworks_pcm.c |  1 +
>  sound/firewire/isight.c                  |  1 +
>  sound/firewire/motu/motu-pcm.c           |  1 +
>  sound/firewire/oxfw/oxfw-pcm.c           |  1 +
>  sound/firewire/tascam/tascam-pcm.c       |  1 +
>  16 files changed, 157 insertions(+), 27 deletions(-)

I applied all of them to for-next branch.


Regards

Takashi Sakamoto

