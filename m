Return-Path: <linux-media+bounces-17650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D428696D15C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F5201F26CE6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618C41925A6;
	Thu,  5 Sep 2024 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="LNdlcJgK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SUXkaApn"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3427194A5C;
	Thu,  5 Sep 2024 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523639; cv=none; b=E0GYtycAxtr84n+n/B0omTxtNn9JTlcp+jWxEYDKxt311WfBxzRgyVOYB1cw7DkGLAE4IM9IurqDVsGaL57ZJiy/4QeGJzWOjhruHesCiRFIGKW2AgEmBI1DJF0gPMUlp9nCriok2Nqknw2kuYMQU60Rxw/d43nPVMiphu5I53k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523639; c=relaxed/simple;
	bh=/0Srw9faAkR80FJZ3pNjoVSnuxYwnQ61yqJ5t8P5dAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnDwXiAQ9SlSkAloQ4G1Ewp7qs6yBiWbNvSoilocjJKcRUIWC0XuMqIRGrOoLmWJsX7vZU/UmnU0NGGe2SkbhxU3ufmF3eZgV1UeOmLXNqq3aE0htksXfbfMyLjmc8sbIK+vVmuxhS3ZB+1nrCAR1LRwd6AGbgUj/T+uFBV7zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=LNdlcJgK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SUXkaApn; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 182731140249;
	Thu,  5 Sep 2024 04:07:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 05 Sep 2024 04:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725523636; x=
	1725610036; bh=R9OqHUYObyHmjZ5zACODisN0iOW3W/ne9P/nnV9dH94=; b=L
	NdlcJgKcpdAw3pBK/60nePccVwcuUroE0sZ0p3je66NW0uMCB0u5zz6u+sGB8c58
	pXV0JIuWPscmQpsAfsH2kCFxH4GiZPWbANLEy/NjS/+xWaWIQ1aw2JbD1KqmyBqr
	w/5dil2/dvt8/mPtUJcqsGYjl0RjoVJ8dq9KJz9E47xyd/A6nWFSrrnZo+iVTITK
	S0JhsBgzcjopATx1oZH2mmdh1Je7e0DhOVJQD08PXdd06z2bNg+1tRkiPtJMQwod
	9Ofx002/ca1kqp9+qxvpUNxyrnbCTQa/KsnaH16DFc2i3nkyBBMSXvMT/CMvL5mX
	oykG/pKLvd+WI/3lp6jaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725523636; x=1725610036; bh=R9OqHUYObyHmjZ5zACODisN0iOW3
	W/ne9P/nnV9dH94=; b=SUXkaApn7st0pqM2XDF6q0frAq3pJT867iY8OKQblSHw
	DNeHw6kLmOs98v+S8ff42QoZCdfg32oUvbQdLzmLQ+Yjy6zZuPITNFyUtDs3fMS1
	PRh2sfLkAw6We7f+S4lBLMhf1jrkFISuUTkrGNzOpOQVQVtoJXpdOZbf7YyGmAlO
	ZHS2Xf5pp2a7Oz5grv9B1RZZIjlVR9QbqRLJTl77s7DPz2f1wi50iGGXVXiK5PtJ
	TBEvM0KZRxNy/0n0x/eYVUqXXn6yJ0oHNlp/P9QmyglknbGP3v4JUCtg/ZXGFFxb
	CyXW1cJ6BW1rleNitZ/9Arnxa3Iv1ikpWFbV+Lag/A==
X-ME-Sender: <xms:s2bZZhh0H468FzkUzhkMHUpSmansRr1mngO_1Zaah5ZXwSCLyeuOqg>
    <xme:s2bZZmAayOPc5nNptb2kb-52DMHTpGj5IAqjDd6R6VGhgbzoRjvCmciwutLszxzYE
    adsrCkdXhH0SemvKbU>
X-ME-Received: <xmr:s2bZZhHTxUt1hUU-99aR3IZkWqpz3p-tnS4jc0ocVEWdqOW4ac3YynjUKIn83XaE4PwCLmnThnHbNHmC2AvnPaLAJgKKmCQjlfY>
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
X-ME-Proxy: <xmx:s2bZZmSQa5VfbW_0nYxiRvkAiyRvN2aVsMZsNE3uz9IBD5oFx6yC6g>
    <xmx:s2bZZuwW-lIuzktjJWD_gLNL35He48yu36FBDrjWB1iArzWbRPLJ6A>
    <xmx:s2bZZs5mik-w8SoFwgKQGBCFppU2YecHEP_PyCtLQ0cSr159ifnswQ>
    <xmx:s2bZZjxr0BIIL2rqC8PzzZjukhmT-bPCiiWDTUC0_3_yM9GAADr7EQ>
    <xmx:tGbZZpz87EuUvnF7ctkbjb1RHC7Dru3SgAkUbQbxLVmb-0DK_19-lS0n>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 04:07:13 -0400 (EDT)
Date: Thu, 5 Sep 2024 17:07:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	apais@linux.microsoft.com, edmund.raile@protonmail.com,
	linux-media@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/5] firewire: core: add local API to queue work item to
 workqueue specific to isochronous contexts
Message-ID: <20240905080711.GA486563@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, apais@linux.microsoft.com,
	edmund.raile@protonmail.com, linux-media@vger.kernel.org,
	netdev@vger.kernel.org
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
 <20240904125155.461886-3-o-takashi@sakamocchi.jp>
 <87y147h07b.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y147h07b.wl-tiwai@suse.de>

Hi,

On Wed, Sep 04, 2024 at 06:07:20PM +0200, Takashi Iwai wrote:
> On Wed, 04 Sep 2024 14:51:51 +0200,
> Takashi Sakamoto wrote:
> > 
> > In the previous commit, the workqueue is added per the instance of fw_card
> > structure for isochronous contexts. The workqueue is designed to be used by
> > the implementation of fw_card_driver structure underlying the fw_card.
> > 
> > This commit adds some local APIs to be used by the implementation.
> > 
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > ---
> >  drivers/firewire/core-iso.c | 30 ++++++++++++++++++++++++++++--
> >  drivers/firewire/core.h     | 10 ++++++++++
> >  include/linux/firewire.h    |  1 +
> >  3 files changed, 39 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
> > index 101433b8bb51..af76fa1823f1 100644
> > --- a/drivers/firewire/core-iso.c
> > +++ b/drivers/firewire/core-iso.c
> > @@ -211,21 +211,47 @@ EXPORT_SYMBOL(fw_iso_context_queue_flush);
> >  
> >  int fw_iso_context_flush_completions(struct fw_iso_context *ctx)
> >  {
> > +	int err;
> > +
> >  	trace_isoc_outbound_flush_completions(ctx);
> >  	trace_isoc_inbound_single_flush_completions(ctx);
> >  	trace_isoc_inbound_multiple_flush_completions(ctx);
> >  
> > -	return ctx->card->driver->flush_iso_completions(ctx);
> > +	might_sleep();
> > +
> > +	// Avoid dead lock due to programming mistake.
> > +	if (WARN_ON(current_work() == &ctx->work))
> > +		return 0;
> 
> Maybe WARN_ON_ONCE() would be safer if it's supposed to be called
> frequently.  Otherwise it can spam too much.
> Ditto for fw_iso_context_stop().

Thanks for your suggestion. Indeed, the kernel API would be called so
frequently, and the *_ONCE macro would be safer. I'll post another patch
for it, since posting updated series of changes to all of receivers is a
bit cumbersome to me...


Thanks

Takashi Sakamoto

