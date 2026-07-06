Return-Path: <linux-media+bounces-66753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4NXkH2+iS2qzXQEAu9opvQ
	(envelope-from <linux-media+bounces-66753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 14:41:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF4710A4E
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 14:41:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Lb55gPqe;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66753-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66753-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8784E303A208
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 12:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D750A42EEAD;
	Mon,  6 Jul 2026 12:40:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1BF42CAE9
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:40:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341602; cv=none; b=ksdbMyBYQAx3pCfU6xWNoicmJZvJ8+njFe36MV+2UzXjx0Ck9YH2stTW2FatLiY3kc5zhRzgNLEdOySzNbCIAvU6gfzVkqvn1hYbEBORui86J3mEJR3Nvr2IEdEmyNEJ1kjzr44y7cnyEjdm6qba2FRavlY9HeSMklX982s3vNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341602; c=relaxed/simple;
	bh=zYe3S0sggIVk85pOfj25HjHwmY8dw7QFPZeguPjE50M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLJOdAyQSQ3Cc72MLJgD7/sfCN44S/jfv8a3SwC3tybRvUNKeqZPETXTy1ZwH0Q4v9JfgXXd0TJyFminEHEL5UgFqnWSZVT9zVDGBQSPffiOFSRCSv2d1e1gyMUWpTbTJeD38F8ZIJhHOJKT4VoUAI5AwQNizEz4lH9QhtY85OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb55gPqe; arc=none smtp.client-ip=209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1297f37073so393581366b.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783341599; x=1783946399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYROaBm9hBQdO+rcbxVHxzRll0eud4BHjs0jm2mBsjQ=;
        b=Lb55gPqei5eJddCcHcibzQh1L1LAyMmBgOtZiOtNnF4xCn2nfXg6yh3luFhw0MmF9o
         ruPu5nRIkcDJh6GlkCC+Nug4+j5owcE9TTJ5MVbRDCSofUZVAZl7B43os616mUy7u4J7
         7LYm/znIMWrvRZk1oET0xjQ8AxWGsN71STG74Il96QHvUgIV9DpqCTyz+hSDk1hJXLSu
         j8BthbsqOKiGlvzvRFUHgw3OH8LqS5yvNL5P1QqkGSq/rue5fE12lPWisTK1zsVbW5fY
         7WDdbhZl0W1jhufMhB9PilywMdVIPAoyYpKD8QrNYu+5xtLcK89AJXZMVOySCC1udWar
         dxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341599; x=1783946399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OYROaBm9hBQdO+rcbxVHxzRll0eud4BHjs0jm2mBsjQ=;
        b=k/oZ/+hFUjeGAXGQYNQEBi/Bz0+ctGjzW3qk1wiTuaYI/vm4/5Rq0yZfyCSFF+SJwL
         OvMsixiKFgFt5u+FFOYcgRHHVx0Ka/dHFT5ea2VfawgkNpk+hf/sfMVdQkdnFZGswPKs
         9WP2dnHomRRn8FsmeeI8FxS88b8JjJ7e4G77VC5iBvQ+3mr/Mx7v7ShhVR2xlL1p9iCF
         XzKw2cpvYSHZi44/0UWWg5bs87B0fcu35/viQyfYXJZAkXV07Q3UoLMt8XegnYnVHW/V
         KR3ZnUAUl5DFht5gvHDcT90ynjY/Jhz92hGhrO3zSwzNGArGYFVuDx9JHDoWriamoiKh
         yfew==
X-Forwarded-Encrypted: i=1; AHgh+RrRIs3GslwDPv5XtgoVX6uRBRfpvG52EXGoQIrCtjhUEurpDBc0q9SkC3uJjo/H7Ot0CAy5QB3K7di5uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjmAT8YnHh8If199fbe029cW3PBbDUbdYrJPlcNGcCubLodLm
	sZ9kU+AU7DtHb1h4idP6Sa+dC3yd62oXLmdJNrJN+3ZkSBemR2Uwm7YS
X-Gm-Gg: AfdE7clxSAre733qfYjYcnjeDcArXPF+baGy/TXmznKnciUr9w9/yiknQJJhtwBXSyc
	4+Qf0FK9eIwMFyJofzjc467y9gXWbt5Rb408+fijcPYSx1UljtkPf8sRT6CTqO3gM5a/0jkk/xb
	F+5LYtB3m32t4s795y3tPVJBN2KCkREvLeD37zG55dp+09yK1jipkHnMC30XXuWt+qqJeWXnNaH
	c/Ta53tmVnrEq+EjJKe9U7Lk+OClXDfV6TyG+u1yp3x199mKMM6gwHfCBfFbNbJMkp8KTRHb0mC
	oZiOauVAaqQ/0uS/03FSo/pBoEOUsrwxG1vYtgZJ4RI6boh7c3AhBvzR7WlbASYV0N4qqWSIy6Y
	uCGlxyji0EVEGwZcUR9RTG23l6qEbWA0KnkLHNc4vU2Sq4XRcPPEUIYbyiOf33Md97a9s8ggnrq
	8XK7Ps4ANPUqCsgNT/hOpY5vuM5Lrfx50Ph0eATBmZYQ5urQ==
X-Received: by 2002:a17:907:e1c5:20b0:bfe:7147:2ebb with SMTP id a640c23a62f3a-c15a68308c0mr16324666b.24.1783341598701;
        Mon, 06 Jul 2026 05:39:58 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c41sm746407766b.59.2026.07.06.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:39:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 13:39:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, David Carlier
 <devnexen@gmail.com>, dan.scally@ideasonboard.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <20260706133956.39a11738@pumpkin>
In-Reply-To: <20260706104652.GB66892@killaraus.ideasonboard.com>
References: <20260702103453.348056-1-devnexen@gmail.com>
	<akd8E5jr722oTm49@zed>
	<20260703221651.41669d55@pumpkin>
	<aks7usxfDajS-W_5@zed>
	<20260706104652.GB66892@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66753-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15AF4710A4E

On Mon, 6 Jul 2026 13:46:52 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Mon, Jul 06, 2026 at 07:38:58AM +0200, Jacopo Mondi wrote:
> > On Fri, Jul 03, 2026 at 10:16:51PM +0100, David Laight wrote:  
> > > On Fri, 3 Jul 2026 11:44:31 +0200 Jacopo Mondi wrote:  
> > > > On Thu, Jul 02, 2026 at 11:34:53AM +0100, David Carlier wrote:  
> > > > > mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
> > > > > into the ISP registers four at a time by casting the zone_weights array
> > > > > to u32 and dereferencing it. The array sits at offset 10 within the
> > > > > parameter block, so it is only 2-byte aligned: the u32 access is
> > > > > unaligned, which is undefined behaviour and can fault on strict-align
> > > > > configurations or once the loop is auto-vectorised.  
> > > >
> > > > well, I don't there is a risk of undefined behaviour on ARMv8, it's
> > > > just less efficient
> > > >  
> > > > > The cast also reads the four weights in host byte order before they are
> > > > > written to the little-endian register, so on big-endian hosts the four
> > > > > weights packed into each register end up in the wrong byte lanes.  
> > > >
> > > > Also we don't have any endianess issue as the IP is only found on
> > > > little endian systems
> > > >  
> > > > > Read the weights with get_unaligned_le32() instead, which is both
> > > > > alignment-safe and fixes the byte order regardless of host endianness.  
> > > >
> > > > mmm, I read in Documentation/core-api/unaligned-memory-access.rst
> > > > that:
> > > >
> > > > ------------------------------------------------------------------------------
> > > > 	u32 value = get_unaligned((u32 *) data);
> > > >
> > > > These macros work for memory accesses of any length (not just 32 bits as
> > > > in the examples above). Be aware that when compared to standard access of
> > > > aligned memory, using these macros to access unaligned memory can be costly in
> > > > terms of performance.
> > > >
> > > > If use of such macros is not convenient, another option is to use memcpy(),
> > > > where the source or destination (or both) are of type u8* or unsigned char*.
> > > > Due to the byte-wise nature of this operation, unaligned accesses are avoided.
> > > > ------------------------------------------------------------------------------
> > > >
> > > > Which seems to suggest, if the issue here is performances, we should
> > > > aim for something different ? (honest question here, any kind of
> > > > guidance is appreciated)
> > > >  
> > > > > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > > > > Cc: stable@vger.kernel.org  
> > > >
> > > > If it's only about performances, does this qualifies as a fix ?
> > > >  
> > > > > Signed-off-by: David Carlier <devnexen@gmail.com>
> > > > > ---
> > > > >  drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > > > index de0e9d898..1aaf64dde 100644
> > > > > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > > > @@ -6,6 +6,7 @@
> > > > >   */
> > > > >  #include <linux/media/arm/mali-c55-config.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > > +#include <linux/unaligned.h>
> > > > >
> > > > >  #include <media/media-entity.h>
> > > > >  #include <media/v4l2-dev.h>
> > > > > @@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> > > > >  	 * of overwriting other registers.
> > > > >  	 */
> > > > >  	for (unsigned int i = 0; i < 56; i++) {
> > > > > -		val = ((u32 *)params->zone_weights)[i]
> > > > > +		val = get_unaligned_le32(&params->zone_weights[i * 4])
> > > > >  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;  
> > >
> > > On LE with HAVE_EFFICIENT_UNALIGNED_ACCESS the latter generates what you
> > > expect the former to generate.
> > > But gcc can unroll loops and use (IIRC) 'rdp' to read two registers at once.
> > > That will crash and burn.
> > >
> > > The best thing would be to have a union of the two arrays with the
> > > member marked __packed to remove the padding before it.  
> > 
> > I'm not sure I got what are the "two arrays" you mentioned here.
> > 
> > params->zone_weights[] is uABI, it's hard to change its definition
> > without really good motivations.
> >   
> > > > We could do:
> > > >
> > > >         memcpy(&val, &params->zone_weights[4 * i], 4);  
> > >
> > > Some of the KASAN (etc) builds might make a mess of that.
> > > Without compiler optimisations of memcpy() it is horrid.
> > >  
> > > >         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > > >
> > > >         mali_c55_ctx_write(mali_c55, addr,
> > > >                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> > > >
> > > > Or this could be an alternative:
> > > >
> > > >         const u8 *w = &params->zone_weights[4 * i];
> > > >
> > > >         val = w[0] | w[1] << 8 | w[2] << 16 | w[3] << 24;  
> > >
> > > That is a possible implementation of get_unaligned_le32() no point
> > > doing it explicitly.
> > >
> > > A late enough gcc will convert that to a 32bit memory read (with any
> > > byteswap in the read or after) if unaligned accesses are supported.
> > > Otherwise you get byte loads, shifts and ors.  
> > 
> > To sum it up: since we can't change uABI easily, the best thing here
> > is not change anything and drop this patch ?  
> 
> Doesn't the patch fix a real problem ?
> 
> Fixing the uABI would be best, but as you mentioned that's more
> difficult (the faulty structure got merged recently in v6.19 and we
> most likely control userspace, but still).

It is certainly possible to change how the structure is described without
changing the binary format.
eg:
	union {
		u8 zone_weights[256];
		u32 zone_weights_32[64] __attribute__((packed));
	};

Quite what has to happen on BE is another matter.

	David

> 
> > > >         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > > >
> > > >         mali_c55_ctx_write(mali_c55, addr,
> > > >                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> > > >
> > > > What do you think ?
> > > >  
> > > > >  		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > > > >  
> 


