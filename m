Return-Path: <linux-media+bounces-67187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WvzbLHbCT2rSnwIAu9opvQ
	(envelope-from <linux-media+bounces-67187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:47:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B9A73312C
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:47:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hmA0qLCc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67187-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67187-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82C1E3017248
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C762942668E;
	Thu,  9 Jul 2026 15:46:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90E54723
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 15:46:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612007; cv=none; b=KeIEPFuR+OQb8sxEzUIAoLmSgoOg4Qr0+wHjW33pK1HC0X8AzV6BPD88SbZuZ2tTd7u7q8WDfBrTbxKjWBVzZd+Qy+2OCMVFta9HTn1SQU7ayyHWwdOXe40E57mRacMo3xQFpJLYs5jGAhUMVLUvN7GayZkVxyXVusrwlIgkuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612007; c=relaxed/simple;
	bh=YWBKUDKRZRPtU+PtzWhqbylWfF/NGc3GC8ecVfV7g+s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4TqvNvGW/a2Td22o/SIDgJsp2hNTwv0HUuEwka7Nl2zkDy6uIxzfaeZdl4eKs7wWNrgeMmrJPtchQ4NMbQnVcrQbumENwSKD+bB8E+374vYbCrvzKmlzFpMtfaS67EcnKaSf6JVlbk3DGwvgTjZ2bRsQZZGNu6xLK+hpdUzYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmA0qLCc; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so8933675e9.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783612003; x=1784216803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26eVrUBn/cVkx7Rxtr9TR48JaobyoAImvrhEAkxHe1E=;
        b=hmA0qLCcaQ4vAVGLb6e+Vf5CmWDwbjipK7ZBbQLjcXKSH5lF9ODPkBn5BbjeL/U/ed
         m2oIjZtgxDH6+4T8IVIuu3GMDhWFW1OXYvlEBsG2HCl0JWMNg8akuBKPMFXAzULb6Jk1
         igTLMl4QS5v4IjKbDETn3cEjbekir67GOYMYYb7dnA2nle1BkwPNfWG/aboOGwgQa93B
         0zdW1YUU9Mn4yxYxqD+rV8W+DXpKUsEUm00z5rQLnwfZnfWtzdbkK9OCoYhTT+dfz4u+
         2gutfZblAFaSvi3KBUMNAeOPULQaf8BRrI3wzcjO5Bhujb/NBUCuv4IghpmLCuv9Fyc6
         NjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612003; x=1784216803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26eVrUBn/cVkx7Rxtr9TR48JaobyoAImvrhEAkxHe1E=;
        b=qpAkfNsEpj1WbYZRX7G9K/q8sl+5OfnAKzb3nK4t7pKPlC/z5IscE3FrGWFHoFVuKe
         W2JnlVV0Db+KC2VP/oMRlJSnQL+RluuSQJmxICBQk4Afvag654y5nGLk9BiyzvloFwS5
         WpSTLUkLWEImCUAksUbmQb6t55MEx+5Je6+eNKoBHt8ePKK7uKnDsAHVBCGn1vbTEAGB
         M8E/xtDRTURd2H9pnpHiZvqOIjb3fMH1Au2p8oWXl2zpO6oXS7FYOw1+M2VEIGJ6Qm+t
         wmvHtLA6vF8bcp/DSGV/JuLhhD6oXim8EUPflqiOl4rH6QtpV29s4QaBKRfnfooI6rcB
         fM9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpV5NhEIYa4zhx6VnN7e0gOPiX9qiuQa5/eF/ApmGp3kr0/BL4zHtWCYSDjFwnCAwtnFju1Ppcf6ZKhig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgPkwg7f5rEfteEG/aPfYznjYpP4By9D6G/fyeboDHT3H+Ipm
	sOtb3ntJAdGp/aQDt5PO/zca4RpUiczzwTq/ZhY7sNk+LyyQLvOkrhaEVsV95AnH
X-Gm-Gg: AfdE7cl05BeaoGX/DZUqbVQe4pMMdW/a7k0eWQYmCL5UAK0+nlGyNNsjYMnOl+mo2y9
	fPfx1a3CV7P84y4qkcj86D6xSbzL5i3g06ReE9m3JfpRvow0tMf26/C4zKpmn6z8D314MlgxpMt
	lQDf2t/Xl8vEO7+yrvn+wTkAnIx+RtpHyJ5kTnOZjwF3ZAfu4HA50aSSpbhSzcAVLoZ76525sOF
	oyE9goUvkgllywV4XIEuCpigUdwm7/dGlSFxgZNgvZl0hhUxQ36WlVIOOCcuk+rpGdELOC1gG9u
	8OtB0EjdUF/4dlzUXRV0o14MuoXzX3ixcvu9J2fILbHYwSucwcd/Sbt0QMR+neTxudtz51kpq4W
	NQf0EQic6XfDemt+fmz5L5IyZuMv6p7Xsr4VIH4g6P+MARfX5mDBUdlD/kLrNYJS6hVgDNjF+hM
	oR72CdU/x0ACRk6P2nnbGcoDVWiWz18PPXa9UlxQagf4b7BQ==
X-Received: by 2002:a05:600c:6286:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493e68f0746mr70686575e9.33.1783612002553;
        Thu, 09 Jul 2026 08:46:42 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm50085771f8f.19.2026.07.09.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:46:42 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:46:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David CARLIER <devnexen@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, dan.scally@ideasonboard.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <20260709164640.1dba64bf@pumpkin>
In-Reply-To: <CA+XhMqz2oTTy2kY_4uqvJRnoXb0am5h6hXnLFM4EPQ7Yb6N-pw@mail.gmail.com>
References: <20260702103453.348056-1-devnexen@gmail.com>
	<akd8E5jr722oTm49@zed>
	<20260703221651.41669d55@pumpkin>
	<aks7usxfDajS-W_5@zed>
	<20260706104652.GB66892@killaraus.ideasonboard.com>
	<20260706133956.39a11738@pumpkin>
	<aku6R_EI0kLUqD8e@zed>
	<CA+XhMqz2oTTy2kY_4uqvJRnoXb0am5h6hXnLFM4EPQ7Yb6N-pw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67187-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pumpkin:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27B9A73312C

On Thu, 9 Jul 2026 06:00:58 +0100
David CARLIER <devnexen@gmail.com> wrote:

> > Does it ?  
> [...]
> > seems to clarify this is a non-issue ?  
> 
> I think you're right that there's no runtime fault: arm64 has
> HAVE_EFFICIENT_UNALIGNED_ACCESS and runs with SCTLR.A off, so the
> unaligned load doesn't trap. It's really just a C-level thing - the
> (u32 *) cast is UB and -fsanitize=alignment would moan - rather than a
> real bug, which is why v2 already dropped Fixes:/stable.
> 
> > I still see zone_weights[] at offset 10 which is not 4 bytes aligned.
> > What have I missed ?  
> 
> I don't think you missed anything - the union isn't trying to move the
> array, offset 10 has to stay. The idea is just the __packed member: it
> makes zone_weights_32[i] an alignment-1 read, so the compiler does the
> right thing (a plain LDR on arm64) with no cast, no get_unaligned() and
> no memcpy(). Same 240-byte layout, and it also avoids David's KASAN
> concern about memcpy().

I think you'll also find that gcc will generate a real call to memcpy()
on both sparc64 and riscv64 (and possibly all architectures that fault
misaligned accesses) even if the char[] is at an aligned structure offset.
Either that or, if you include the (u32) cast, it will assume the pointer
is a valid 'u32' pointer and generate faulting misaligned access. 
So while this is arm64 specific code it is a bad idea in general.

> 
> So if you'd like it cleaned up, in mali-c55-config.h:
> 
>       union {
>               __u32 zone_weights_32[56] __attribute__((__packed__));

Should be MALI_C55_MAX_ZONES/4.

>               __u8  zone_weights[MALI_C55_MAX_ZONES];
>       };
> 
> and index zone_weights_32[i] in the driver.

That is the safe way to do it.

Even on x86 I've fallen foul of misaligned data traps when gcc has
used simd instructions to unroll a loop.
I knew the buffer could be unaligned, but needed a sum of all the
32bit words (to set a checksum). Worked find until it didn't...

	David


> And if you'd rather not
> carry the uapi churn for something that isn't a fault, I'm equally happy
> to just drop it - whichever you prefer.
> 
> Cheers


