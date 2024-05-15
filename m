Return-Path: <linux-media+bounces-11468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41278C64DC
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 12:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71F11C21DDC
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546AB5BAF0;
	Wed, 15 May 2024 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LuntKrpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ic6aR64+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LuntKrpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ic6aR64+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808C5C603;
	Wed, 15 May 2024 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715768386; cv=none; b=OdKgxgoufBL21F0euW0HatBiNw0Waj6i0UePq/8uT9ck9bociDYXOMI5g5dNmZpapzrnYR4KsMJIXOoEc4VxRNiTnT14339E0Q0Zgs9cdkdFFXITfQm4f9hWq3Y+VN90bW7A8hd6woE0qI0NGxA4vuyCT97Rv1dHnAcGOVEaXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715768386; c=relaxed/simple;
	bh=LydYnHrugQ9OPJ5Ef0+QRMSqn1tnC19RPVdPrv3zY/o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hmux/McgcBG+2KUkMpY45qxB42oFZJAkZF82dT5L3thzDhBpgJbzw/2Co8usOhqkxCvz8bUh6BS1I+OxELp027tv3hVO4Dlg60t2xZ1/91uYdxDJZxRBl52+UOLxZVofpOi/keHxwhpJQut4Gc5sqEqfeThLMzeggJf9tkhP9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LuntKrpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ic6aR64+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LuntKrpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ic6aR64+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4719833A33;
	Wed, 15 May 2024 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=LuntKrpiFO0c3TV3TilWxFY+6ACqhtdTjrgI9mEDVJnMIeh++UG6f7bnw6Nhnp96+Wq1jh
	rkSEi4Tf8r/lJJFdQ2GNA7hDvLi40zf37RH/kkLnX26UOHz8TQj+p+TgPMmeCVloOlRLuH
	uVbxQo7cy30DmknHdjS9cDBrgSpBiFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=Ic6aR64+5T59q/QkWj7My1F1gI0I76pVeHSGYkinZvkHxW1hsrkFisriLEYnbPuBfm5rhl
	TpfNNAGQHtrBsfBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715768383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=LuntKrpiFO0c3TV3TilWxFY+6ACqhtdTjrgI9mEDVJnMIeh++UG6f7bnw6Nhnp96+Wq1jh
	rkSEi4Tf8r/lJJFdQ2GNA7hDvLi40zf37RH/kkLnX26UOHz8TQj+p+TgPMmeCVloOlRLuH
	uVbxQo7cy30DmknHdjS9cDBrgSpBiFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715768383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WcIX7aYgrF5z87fxeBmfRGYcPU8ynjCCVZypleGzlQ=;
	b=Ic6aR64+5T59q/QkWj7My1F1gI0I76pVeHSGYkinZvkHxW1hsrkFisriLEYnbPuBfm5rhl
	TpfNNAGQHtrBsfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5BFB139B3;
	Wed, 15 May 2024 10:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jrUhKz6MRGZoNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 May 2024 10:19:42 +0000
Date: Wed, 15 May 2024 12:19:59 +0200
Message-ID: <87o7975qcw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,	Shengjiu Wang
 <shengjiu.wang@gmail.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Mark Brown <broonie@kernel.org>,	Sebastian Fricke
 <sebastian.fricke@collabora.com>,	Shengjiu Wang <shengjiu.wang@nxp.com>,
	sakari.ailus@iki.fi,	tfiga@chromium.org,	m.szyprowski@samsung.com,
	linux-media@vger.kernel.org,	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,	festevam@gmail.com,	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,	tiwai@suse.com,	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
In-Reply-To: <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430172752.20ffcd56@sal.lan>
	<ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
	<87sez0k661.wl-tiwai@suse.de>
	<20240502095956.0a8c5b26@sal.lan>
	<20240502102643.4ee7f6c2@sal.lan>
	<ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
	<20240503094225.47fe4836@sal.lan>
	<CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
	<22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
	<51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
	<CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
	<cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
	<CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
	<2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
	<CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
	<28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
	<850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
	<c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
	<8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xs4all.nl];
	FREEMAIL_CC(0.00)[xs4all.nl,gmail.com,linux.intel.com,kernel.org,collabora.com,nxp.com,iki.fi,chromium.org,samsung.com,vger.kernel.org,suse.com,alsa-project.org,lists.ozlabs.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Wed, 15 May 2024 11:50:52 +0200,
Jaroslav Kysela wrote:
> 
> On 15. 05. 24 11:17, Hans Verkuil wrote:
> > Hi Jaroslav,
> > 
> > On 5/13/24 13:56, Jaroslav Kysela wrote:
> >> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
> >>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
> >>>>>> mem2mem is just like the decoder in the compress pipeline. which is
> >>>>>> one of the components in the pipeline.
> >>>>> 
> >>>>> I was thinking of loopback with endpoints using compress streams,
> >>>>> without physical endpoint, something like:
> >>>>> 
> >>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
> >>>>> compress capture (send data back to userspace)
> >>>>> 
> >>>>> Unless I'm missing something, you should be able to process data as fast
> >>>>> as you can feed it and consume it in such case.
> >>>>> 
> >>>> 
> >>>> Actually in the beginning I tried this,  but it did not work well.
> >>>> ALSA needs time control for playback and capture, playback and capture
> >>>> needs to synchronize.  Usually the playback and capture pipeline is
> >>>> independent in ALSA design,  but in this case, the playback and capture
> >>>> should synchronize, they are not independent.
> >>> 
> >>> The core compress API core no strict timing constraints. You can eventually0
> >>> have two half-duplex compress devices, if you like to have really independent
> >>> mechanism. If something is missing in API, you can extend this API (like to
> >>> inform the user space that it's a producer/consumer processing without any
> >>> relation to the real time). I like this idea.
> >> 
> >> I was thinking more about this. If I am right, the mentioned use in gstreamer
> >> is supposed to run the conversion (DSP) job in "one shot" (can be handled
> >> using one system call like blocking ioctl).  The goal is just to offload the
> >> CPU work to the DSP (co-processor). If there are no requirements for the
> >> queuing, we can implement this ioctl in the compress ALSA API easily using the
> >> data management through the dma-buf API. We can eventually define a new
> >> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow
> >> handle this new data scheme. The API may be extended later on real demand, of
> >> course.
> >> 
> >> Otherwise all pieces are already in the current ALSA compress API
> >> (capabilities, params, enumeration). The realtime controls may be created
> >> using ALSA control API.
> > 
> > So does this mean that Shengjiu should attempt to use this ALSA approach first?
> 
> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
> data conversion forcefully. It looks like a simple job and ALSA APIs
> may be extended for this simple purpose.
> 
> Shengjiu, what are your requirements for gstreamer support? Would be a
> new blocking ioctl enough for the initial support in the compress ALSA
> API?

If it works with compress API, it'd be great, yeah.
So, your idea is to open compress-offload devices for read and write,
then and let them convert a la batch jobs without timing control?

For full-duplex usages, we might need some more extensions, so that
both read and write parameters can be synchronized.  (So far the
compress stream is a unidirectional, and the runtime buffer for a
single stream.)

And the buffer management is based on the fixed size fragments.  I
hope this doesn't matter much for the intended operation?


thanks,

Takashi

