Return-Path: <linux-media+bounces-66560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h1Q3LdUmSGqgmwAAu9opvQ
	(envelope-from <linux-media+bounces-66560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 23:17:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E46705B4E
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 23:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i8LjiFqh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66560-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66560-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36819303182A
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 21:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C0E33F36D;
	Fri,  3 Jul 2026 21:16:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E222C9D
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 21:16:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113416; cv=none; b=tqlwznB6ZaYX52jdjy6ypvvLfT8xDl51TKm2ZRguXZ9s8gnB8V9n+oJE4rF1rivXcQ6fDgRck+mnx1OBPrZlRee5zqk7siJhMxkD3xuCZzVwUz2fJ63iDAT5djV/vOUz2P10xselVk2O9eDX0LLX5fQVLVNpcJ0mCsk8fIzwRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113416; c=relaxed/simple;
	bh=cCkQjCePSHb28HQ2XyzUAFDSIIkdoakr3w3MVImbm6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwDrS3vHs8FE6plm1mYNuiD1epT8ucsxj9MWYBh/Sj0QjJXRYO8Dl34v5ScoFiyvW2lUsmaVk4KEP72LVbbqYatjzqv6bQ8lh9mxOf3wb8fBhiodZI1h5VKxTS8p+LErhMd32xfIV9tW/Lgvg5KOkQG+ycqBc4vLaWeP9LIBKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8LjiFqh; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493be1b9564so6986775e9.2
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 14:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783113414; x=1783718214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C4eCszeuptfMVD03Bd+mf3Rmau3oAhlB5q7FtJvbpYM=;
        b=i8LjiFqh5EoZSxBpxrDqKOAkMrdQ0gNVu+qanDBXhMGCg01oHwb+vlCzvyptN/LuOF
         tmPwvalqmdDZkCnKTlpZGeueW42uxpOKho2EwKztdf8N3Fboj4Hz8kaQ6e4Urll/FuXu
         tKLrrJN9wLtC5Ko1KfteBrY5ftuHbrYNPBYt3XpZzZA2J79IcBYlfg4/C7aQdaPZeHTQ
         lTQHkydxOuHsrhMn3lDYMFaf6Xdze1MBRhY5ahjLH+qHK6Yevl0wglMobKPPFBUxBZSR
         dtj9HrSbGUM8Z8pfjD3LrkM13v0LjUcc9OXZpdR2SvHwM1TNStNDMA8SUYTya63kntps
         kEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783113414; x=1783718214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4eCszeuptfMVD03Bd+mf3Rmau3oAhlB5q7FtJvbpYM=;
        b=HVwmNZyqvvr0SK18iHYknI6p8UnUoUnBsMuNiT9llJmNUZ+W9tlsJVeC3u/gWvSm6N
         zkbqb80NXQSfnTrHVRoptGBzey5UJUX3OeeIZBlpR17Zietb/iw5k81vALY991COLmsy
         9vpmyCT9ZsOWhdl0l8QILu+T2DCWlOq33IMKwfb6HsANC86osRcyldk3izoQCJG6D/c9
         3UZlr+M9oVDolIhTHusWzg/yJmp/LHb1hlnx/W9ZabpLMys/dcOvsNdp4UFOU9Xj0wAO
         k5QIYuhkTPXuO+srHYO58fd3wfH+HfZYAF/d1xsN+VZtdImf63c0gbsmaDrneKpJ4zeP
         RHPw==
X-Forwarded-Encrypted: i=1; AFNElJ85n6Q6jckjnY8e6gjQKu6USuPETCFkd6AatfVD59VXLwLjh+np+AVKIs/K2NLFZr55K45UrOnjkuq+sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdAd5j8j/14CEkhoFSV7AUz986ZPNvQ03228rVFBlBqHH0ee9y
	wb3AV6leckE0YOac37OlVYk0hB0+G+9NZPwCo78L0F1aXORHEraTJOQe
X-Gm-Gg: AfdE7cmIt2MGjj0nxiW7GHYqurTQeurGoMQ7MldJesCCsk5Zgv+D9MKxkup5AghW2gk
	JRNgx0RParO+TCMoNh5sRHt3mQ0EpzNKcxcW2cvDZegYuLRYfhd+MMM1CuuE5aQOBR72l7k1yFC
	wzv9mD9+BTsXI/No9BpezKzOId0JCcpIn945VOLhgmqyVZf1c10nF/OYgkqMOuxS9d3hrbMKKg9
	f3/cPmbvGG/defMk4cvE31JHuiFN0SlLD6dIYceaF37fnaq5RiP/YVdETNB0KNmCtS8BkHx06pV
	MBi8r0NB0DhDEyK+qbsDLR1taFfqp5xYj/ZLUTOWbrAgH1iDRPy6MVboEjwZ8uzsGKf6Xx0D4a0
	iTvl8mspEtpuz6ScgIktQQPFnfwrBcBMPBp6N1WBuUTc2njFtc4A3E/gp3/N1NTXrIwuUdYo0sr
	NCf3PrsgGhNY9cuGi1tPPDewmYWrfiCiUCrWYf+XQdseSwjzMyAvRjAk9l
X-Received: by 2002:a05:600c:c1c8:10b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-493d11fafa3mr6498625e9.37.1783113413568;
        Fri, 03 Jul 2026 14:16:53 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm247973145e9.13.2026.07.03.14.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 14:16:53 -0700 (PDT)
Date: Fri, 3 Jul 2026 22:16:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Carlier <devnexen@gmail.com>, dan.scally@ideasonboard.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <20260703221651.41669d55@pumpkin>
In-Reply-To: <akd8E5jr722oTm49@zed>
References: <20260702103453.348056-1-devnexen@gmail.com>
	<akd8E5jr722oTm49@zed>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66560-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pumpkin:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06E46705B4E

On Fri, 3 Jul 2026 11:44:31 +0200
Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hi David,
>    thanks for sending a patch to address this issue
> 
> On Thu, Jul 02, 2026 at 11:34:53AM +0100, David Carlier wrote:
> > mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
> > into the ISP registers four at a time by casting the zone_weights array
> > to u32 and dereferencing it. The array sits at offset 10 within the
> > parameter block, so it is only 2-byte aligned: the u32 access is
> > unaligned, which is undefined behaviour and can fault on strict-align
> > configurations or once the loop is auto-vectorised.  
> 
> well, I don't there is a risk of undefined behaviour on ARMv8, it's
> just less efficient
> 
> >
> > The cast also reads the four weights in host byte order before they are
> > written to the little-endian register, so on big-endian hosts the four
> > weights packed into each register end up in the wrong byte lanes.  
> 
> Also we don't have any endianess issue as the IP is only found on
> little endian systems
> 
> >
> > Read the weights with get_unaligned_le32() instead, which is both
> > alignment-safe and fixes the byte order regardless of host endianness.
> >  
> 
> mmm, I read in Documentation/core-api/unaligned-memory-access.rst
> that:
> 
> ------------------------------------------------------------------------------
> 	u32 value = get_unaligned((u32 *) data);
> 
> These macros work for memory accesses of any length (not just 32 bits as
> in the examples above). Be aware that when compared to standard access of
> aligned memory, using these macros to access unaligned memory can be costly in
> terms of performance.
> 
> If use of such macros is not convenient, another option is to use memcpy(),
> where the source or destination (or both) are of type u8* or unsigned char*.
> Due to the byte-wise nature of this operation, unaligned accesses are avoided.
> ------------------------------------------------------------------------------
> 
> Which seems to suggest, if the issue here is performances, we should
> aim for something different ? (honest question here, any kind of
> guidance is appreciated)
> 
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Cc: stable@vger.kernel.org  
> 
> If it's only about performances, does this qualifies as a fix ?
> 
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index de0e9d898..1aaf64dde 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -6,6 +6,7 @@
> >   */
> >  #include <linux/media/arm/mali-c55-config.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/unaligned.h>
> >
> >  #include <media/media-entity.h>
> >  #include <media/v4l2-dev.h>
> > @@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> >  	 * of overwriting other registers.
> >  	 */
> >  	for (unsigned int i = 0; i < 56; i++) {
> > -		val = ((u32 *)params->zone_weights)[i]
> > +		val = get_unaligned_le32(&params->zone_weights[i * 4])
> >  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;  

On LE with HAVE_EFFICIENT_UNALIGNED_ACCESS the latter generates what you
expect the former to generate.
But gcc can unroll loops and use (IIRC) 'rdp' to read two registers at once.
That will crash and burn.

The best thing would be to have a union of the two arrays with the
member marked __packed to remove the padding before it.

> 
> 
> We could do:
> 
>         memcpy(&val, &params->zone_weights[4 * i], 4);

Some of the KASAN (etc) builds might make a mess of that.
Without compiler optimisations of memcpy() it is horrid.

>         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> 
>         mali_c55_ctx_write(mali_c55, addr,
>                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> 
> Or this could be an alternative:
> 
>         const u8 *w = &params->zone_weights[4 * i];
> 
>         val = w[0] | w[1] << 8 | w[2] << 16 | w[3] << 24;

That is a possible implementation of get_unaligned_le32() no point
doing it explicitly.

A late enough gcc will convert that to a 32bit memory read (with any
byteswap in the read or after) if unaligned accesses are supported.
Otherwise you get byte loads, shifts and ors.

	David

>         addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> 
>         mali_c55_ctx_write(mali_c55, addr,
>                            val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
> 
> What do you think ?
> 
> >  		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> >
> > --
> > 2.53.0
> >
> >  
> 


