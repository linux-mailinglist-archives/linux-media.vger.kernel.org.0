Return-Path: <linux-media+bounces-64913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4xyzBuEDMGo6LwUAu9opvQ
	(envelope-from <linux-media+bounces-64913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:53:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D33686DEC
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mYkBhX1D;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64913-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64913-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D47B23004073
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01F13F4DD3;
	Mon, 15 Jun 2026 13:53:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3EC2E7BB6
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 13:53:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531607; cv=none; b=LAHr2eW8dU/hk1KP5eadBPWRFqDQ5DZ41QZIWJDooTlbG9R53EniQIikntanQ2WFVhEf0ZcoT2qIhbaNSyHWB7dm6NXBDO5XbWuqqicKU8YFbkb0XfnLf8ugxtbHN3T/RoF0L8NbgPXMXPiE7tsLHwcFGbN45WI5w7ryybyOyf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531607; c=relaxed/simple;
	bh=v2XMI6rt6Wcagz/ONLCx/bmlovqImrX7MjP59W4xvL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9R700N4IU3yyI1zphwndEsTLLAeSyA3IWsePEuihiqev7Yg2i3FPaug4AgHt9l9lnBf7R0tESUhCKHOkX8v+Chkm33qw2jLOHOr91s2GvbKPpNOj9vg075jsJ0WNwKBLR/A5nsgxT/zoIMQiT3HgnLovoIWcNUKdbzEMST2u4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYkBhX1D; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccce57762cso40783086d6.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781531605; x=1782136405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTkflnFzBxrBA+AhdgmOSHDMHBNlmdvBwLVRtYBoOe0=;
        b=mYkBhX1DRtSLTAeh68MhUPHeruGbidnZcKRRpF1TC5CcOdxfpjqXhw4sZ2wG5bJ4oZ
         1BeNvchP5XknsKJfw3eav47d3sF/qhIbIxkfK2iREuM1UHmb8qcBNDY/YUK6ZQbuCMUO
         KyYR+zZz2sUv2ArQEk6Oe7I9S4jXooZUjoRIor43ttNCg6i5DIV7G/vc4tUACqldL/vR
         Z9+Q0TxIXt+Y2lQYMY/G0PUrp6jXYrz3mCmwtwkb8b4qx7Uc7Ze0P0+x11xGBLcj3p2n
         ulHPeTB5Q/I897/4gLjp1DVnSb/9UKvLxPb37gGoETUe11XijsguQ7c/rkvqVjGPNBbg
         7YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781531605; x=1782136405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTkflnFzBxrBA+AhdgmOSHDMHBNlmdvBwLVRtYBoOe0=;
        b=I8Qe0ATf8dQbUgB3mH19bdBUw57i34ncMtxV5dEvGxNzT3ticvYrFjEK4oz+xfGf5P
         eb1rGl0Mj40cfsZXnMjdbg1LC7bpz1b63NXOyJk4EbaeOq1dtdgXVrx5AxMFhUj0lMvj
         hLeB/YaTWIN6eJ0vYU4lfSHlbgS+F4qUqmKM7P9C5aL3MJkcgSARVkc1B1Yyx0MTdxV9
         bnU2XXiXydl19UmBiQorM9YcfObX/5Ln28P9tmGa3Nxo9Us3HjNBamNEOE+NFLwYvUtB
         +UnSfwiRrsH7j5eQMOAf2aTz66tTV6IROI72k1UMQO20Khv8Y0KBj7/9Hat8gEIZF58U
         sg8w==
X-Forwarded-Encrypted: i=1; AFNElJ+d5LOnMj0qfhYk8J0dyN+JpI60WpGEeOdhStsT/khz1fVCFtL7pI5R5zN8x28f/EaDuNBQ2pI7IcBs1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKabzscnUm5+dDHTIhG/0EYsLsUnF76WVKnVZdUrYjFVxmR/j
	OpOhFqcmSjLax+SKBabVGwmHWJayw18e3xHH4UNqGby/4oG/Pr3UqV6p
X-Gm-Gg: Acq92OEEZKs+nToS7SShD7GUaNYMGulOU+ElbY4FHRjLocMv/aY4Knl3rVkphf1ahpk
	0i4AFHJxfv2WsJbMC8RNigl8HLmAFPQhpy3hnP/wf5JKYFZT8VB+3Vu2DyQzkef5UUKVAwGAn5F
	BBMFnOwr22wZtzP4y25gftfHmsXPe/oE6Dzc1rnDk24QxoRiSsWS4oXtc669zPnXea3u68HxRoB
	VC9d5b0KOUd/beRfzZXXEkQXECCDLg+NGrrCl9hh8ZwKgVS2INtdYoWli/8WdemdYGPKK+B+hG+
	+JQmzhr7PLaMF71mMgOty0TGf5bpJ6Vd9CmAxEwzX5G66TU48ySykxuvQ0bfEnod5jujOPxe6vg
	j3c8X6c503GcgZ8FIAWT7tmmnkA9WDdLx56xvb2THcdVSXaI/1ars2VmJnQD0Yj6MY3StBaEX2w
	eC3t5eBr/XAybfU9Be
X-Received: by 2002:a05:6214:4382:b0:8cb:e81b:576f with SMTP id 6a1803df08f44-8d44c6a62f5mr191044646d6.5.1781531604652;
        Mon, 15 Jun 2026 06:53:24 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d304b5df2fsm114856286d6.34.2026.06.15.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:53:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 16:53:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>, Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajADzfIcMxTecOsv@stanley.mountain>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
 <ai_d0B8YOZAwnqu_@ashevche-desk.local>
 <ai_kfgkuDYcFd0bG@stanley.mountain>
 <ajAC6E3Pc0edjySZ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAC6E3Pc0edjySZ@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64913-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:dawei.feng@seu.edu.cn,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:keescook@chromium.org,m:corbet@lwn.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[seu.edu.cn,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,chromium.org,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12D33686DEC

On Mon, Jun 15, 2026 at 04:49:28PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 15, 2026 at 02:39:42PM +0300, Dan Carpenter wrote:
> > On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > The bug was first flagged by an experimental analysis tool we are
> > > > developing for kernel memory-management bugs while analyzing
> > > > v6.13-rc1. The tool is still under development and is not yet publicly
> > > > available. Manual inspection confirms that the bug is still present in
> > > > v7.1-rc7.
> > > > 
> > > > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > > > an Intel Atom ISP platform with the required camera sensor hardware to
> > > > test with, no runtime testing was able to be performed.
> > > 
> > > These last two paragraphs do not suit the commit message. Please, drop them
> > > here and better to describe all this in the cover letter (if not yet).
> > 
> > This is how the documentation says to write commit messages.
> > 
> > https://lore.kernel.org/all/ahgaOigklcDCYvRp@stanley.mountain/
> 
> Isn't it enough to have in the cover letter?
> 
> Thanks for commenting there, but I would insist to move these two paragraphs
> from the commit message here. Maybe Kees is okay with that, I'm thinking that
> this is too much (since we have lore archives).

To me the "An x86_64 allyesconfig build showed no new warnings" information
adds no value at all.  It is assumed and if you didn't do that then a lot
of people are going to know and complain.

regards,
dan carpenter

