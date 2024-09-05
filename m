Return-Path: <linux-media+bounces-17651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE296D17F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0181028484F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1368419AD78;
	Thu,  5 Sep 2024 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="fSV3ku58";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c/ze+Nxl"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1A1953BD;
	Thu,  5 Sep 2024 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523701; cv=none; b=ljhxZ9Pq6nKxsTUGJE44TYq+ku8D+jdyPJFFy2A5PpB2T/kHQvVmqCcAp7HzZHoLozcZ/vLz8yj2RyeXuaWaGm6IqH+RSpnflyJiscmSf44laf/IgnWCQZG+hBV3RPm/xo7JVcc6HCkrS1NYvRSG/6cUTOxUe4Mx4HSDNZ+MAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523701; c=relaxed/simple;
	bh=cDSl++WbhPKheKOm65JgUG2BlQqGmO32fKNmPF4z69I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mErSh9Bfb8wYhL2rBSYw33ruANp0G6PaFWwCbJhbFrqLcVFb4vm0Euj9S2Pr5JofSiCOGMCnbtBndIN4/5T/ZUyYev6HivowwlPN3JSSpxNOtTqdZ7l/Pr6W6QUC2LDpAIiI2LbNZ8EqAN0Iv2FMmioZXuJ1vh9DrpMJ/PU0qbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=fSV3ku58; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c/ze+Nxl; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 9E9FF13801A3;
	Thu,  5 Sep 2024 04:08:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 05 Sep 2024 04:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725523698; x=
	1725610098; bh=j4AgOZ0wmoM/fYwYOc/9vZwPtMt4Ej9xaGbc6RD3J0U=; b=f
	SV3ku58DdsatkZ8Q6VFLzLSl/LL1wnYZHZJILO9vZ7PLXdgz3iAWgn28F3UafP11
	bQtC4QnIOgImz3HjPESGn4gqQ75p4GwgcGP0BElWhx80liFNG3KlPihO/AfKJin8
	6apiU6vP8c0NzePlKeSgjjpNPf8upNq7J7wvb3pgLTqz1I9YnR/qEKB6p16AFyqg
	ZogtRPVRzC0ZY+wRWjtMe4rDNSTrDlVz2BklDF0qYoexeWS+F8jOqXT5/r+a7ira
	F6/qbvTGbFFPmlgV5WZQ1ubRizOHqWk0Qn1MSuMVvpacMWP8rkpR07F1X3Nl38E/
	9l1f8lqh8wwj9VIk/MIdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725523698; x=1725610098; bh=j4AgOZ0wmoM/fYwYOc/9vZwPtMt4
	Ej9xaGbc6RD3J0U=; b=c/ze+NxlvkYMURjn/H8+bBUkWVVAyslbSea4lNH2Itqi
	mQKW7/zinL7b2cuatfDgf6wgyq0nJhNdRJvTntclXq6qx2fjv7eSPEoFvRI68azL
	IajJMmON4ywpB2uwWcqV4yaACrjA7J8MCsy2O6dj/kcPI3A/o6SEThxzOPFikAfO
	NbRG5qnOIbM15+lEhFGvg1UrG7f4bw6wDKyEcd5TsLSPluJbwFSVm75FxIynofQX
	TP/c2CmY9CHf1a9ngw/lJ8O075hxljC05sfZteODAGKuh+8BzVSNOhC4L1Pu3cbv
	OQ1YvtmGEZ0K1t+r7AEBrCCU5nUEkQezAEqOHjhbow==
X-ME-Sender: <xms:8mbZZgdAEHqLpkZMgNJeUVHQdAj_io8nS4QT-Oij5k3nt5Qg66KekA>
    <xme:8mbZZiOp2_KZTxa3-wjxVaNsID8A43BKj1DrSFssND_rFql1cB8vHOgL7IH4dTrkZ
    DdSNjQPcXtQJiVeIkw>
X-ME-Received: <xmr:8mbZZhjOIP_xH6IrKRJdZ4uVoxJQX_pyL88ZBbPJouR9dd14M1T1SR3xlSTVdpf2hqc3IsbibJmBG7DCfv0dYT4KOgaUwP_q3vI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehlecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhr
    ohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrg
    hmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveev
    ueeftdelhfejieeitedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
    ihdrjhhppdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnug
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphgrihhssehlihhnuhig
    rdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepvggumhhunhgurdhrrghilhgvse
    hprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8mbZZl-8JC1YgRc3FXVMhC6l3JXU2jdl77L_ZMTglqeo_8EB-iT-Zg>
    <xmx:8mbZZstSuX8JaT_SHhtx61hmAK1zoPZgwwPKqyrI7lYP3JmopALXLA>
    <xmx:8mbZZsE-VcBw7E332VBbR_XKGUI5OQ2e7g5F1OZqMQZjaR7mkdS8oA>
    <xmx:8mbZZrOvNiXvrtfMaJ1A-X5dsa5rljC6EUqki8siZ0LCWCJbNEgSRw>
    <xmx:8mbZZh_CXRelP_NF2xG0NWgoLMYpghnq-L9AxuHiOTAyD_pSTTmIQNTG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 04:08:16 -0400 (EDT)
Date: Thu, 5 Sep 2024 17:08:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	apais@linux.microsoft.com, edmund.raile@protonmail.com,
	linux-media@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 5/5] ALSA: firewire: use nonatomic PCM operation
Message-ID: <20240905080814.GB486563@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, apais@linux.microsoft.com,
	edmund.raile@protonmail.com, linux-media@vger.kernel.org,
	netdev@vger.kernel.org
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
 <20240904125155.461886-6-o-takashi@sakamocchi.jp>
 <87wmjrh06d.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmjrh06d.wl-tiwai@suse.de>

On Wed, Sep 04, 2024 at 06:07:54PM +0200, Takashi Iwai wrote:
> On Wed, 04 Sep 2024 14:51:54 +0200,
> Takashi Sakamoto wrote:
> > 
> > In the former commits, the callback of isochronous context runs on usual
> > work process. In the case, ALSA PCM device has a flag, nonatomic, to
> > acquire mutex lock instead of spin lock for PCM substream group.
> > 
> > This commit uses the flag. It has an advantage in the case that ALSA PCM
> > application uses the large size of intermediate buffer, since it takes
> > too long time even in tasklet softIRQ to process many of isochronous
> > packets, then result in the delay of system event due to disabled IRQ so
> > long. It is avertible to switch to nonatomic operation.
> > 
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> Feel free to take my ack:
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

Thanks for your ack ;)


Regards

Takashi Sakamoto

