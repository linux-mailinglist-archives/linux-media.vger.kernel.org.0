Return-Path: <linux-media+bounces-53128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJXIEEBomGmJHgMAu9opvQ
	(envelope-from <linux-media+bounces-53128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 14:57:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA916818D
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 14:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2488304AACC
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 13:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98B432D0EE;
	Fri, 20 Feb 2026 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zXdiJrmI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tLNVnrJK"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AEA349B15;
	Fri, 20 Feb 2026 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595789; cv=none; b=O618qkOSNomv+UDhXQ31tZEQFGdjUsnC9x8TBuM2057BG6B0/sMh+8782ZSagTVz49n+wGk4jsFgaxSA5wvoXV5aoeUzFSFUnEy2dQWPGdmB6gap48Ex9YLSmahvu/ytGVq4atguYCSzPm2MdagOiclck2m80UKe6SPrQZ23jyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595789; c=relaxed/simple;
	bh=79QfWa4xEPObhgT5gUnpeO8jf1TH+8RsUW6JKKMuIyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9A38CxbFvOJZSK9jeDhRaze7DoQEIpwqQAji24k87FXquTeFGhrdpSuMLiHVBMqHVmEbDr6FYT89ufCoSzyQLO8kYDZRHKs0D3FNFSe3nGGDMFqa0UxnjqK8pN/MC+3qYAUvtXqlBbZuMcPyzCcUjES2+1mWfZ0Z0m2gtTTCOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zXdiJrmI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tLNVnrJK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 20 Feb 2026 14:56:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771595786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iUHTyt9lTiErOyGCHV16t81SCGHDobYkKA+5/HwX6Xg=;
	b=zXdiJrmII38lZvRQphdN9AGuEQDrJr9nwjT/8Cd/4/Ztm3l0MQ5OhMfhTKNwd9Zmv35te4
	EeFx8d1lea/F3EULxq+Vh0ZESTiOpig2PxtlFyFHeA11B6YGdbl4/1ISZisASyNxN+MJ5N
	oMX2x1v+LTHaoSAwBTvzh93mDA5DyJ12iabLk6auiK6aghZeV/D/LfdkhuixxWtYTk0TdK
	2SPIun0QFQ10jezEZEyW22jvMS+geHa/j4poRFEJGySjbi4CKgRh1Fvx5atB9bdPlSHEuy
	E0s4f6Ej4Jn/djYkMBAuC1SCB1jfUQZO8TUVgb59M9YqyXFHtYPDDzriGLiI9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771595786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iUHTyt9lTiErOyGCHV16t81SCGHDobYkKA+5/HwX6Xg=;
	b=tLNVnrJKMvQV6crnD4VbniqSuGiC6rrCCODf0pUXIzTt+kXz8a8PXnS1pQ4VOXdKAyrGsA
	wyecT9guNu8dLZAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ding Yihan <dingyihan@uniontech.com>
Cc: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>, dwlsalmeida@gmail.com, 
	mchehab@kernel.org, linmag7@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
Message-ID: <20260220145236-d4661904-0ed8-4c04-8bdd-09f537b70ba4@linutronix.de>
References: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-53128-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CCA916818D
X-Rspamd-Action: no action

Hi Yihan Ding,

On Fri, Feb 20, 2026 at 09:39:45PM +0800, Ding Yihan wrote:
> While looking into this exact same syzbot report, I noticed that 
> `vidtv_ts_pcr_write_into()` in the same file also suffers from the
>  exact same pass-by-value anti-pattern (passing `struct pcr_write_args` by value). 

Good catch.
 
> Since `pcr_write_args` also contains implicit padding, it remains a potential trigger
>  for identical KMSAN uninit-value warnings during fuzzing in the future.

The fact that the report is about implicit padding is valuable information.
It should be part of the commit message.

> Also, regarding Thomas's concern about modifying shared data: passing the struct 
> as a `const pointer` (e.g., `const struct null_packet_write_args *`) 
> would perfectly guarantee that the state remains read-only.

Agreed.

> Thomas, would it be worth submitting a separate patch now to fix
> `vidtv_ts_pcr_write_into()` to prevent future KMSAN errors? Or would you
> prefer this to be addressed together in Abd-Alrhman's v2?

Doing it together sounds better. This is not urgent anyways in my opinion.
But on the other hand I am just a random guy whose commit got wrongly blamed
in the original Fixes tag and I don't know anything about this subsystem.


Thomas

