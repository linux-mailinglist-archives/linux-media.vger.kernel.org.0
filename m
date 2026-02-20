Return-Path: <linux-media+bounces-53134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCMRBMmMmGmyJgMAu9opvQ
	(envelope-from <linux-media+bounces-53134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 17:33:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6626216955F
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 17:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 829903090EDC
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DDC34DCE4;
	Fri, 20 Feb 2026 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PLv99rsu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FBTg85ib"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F26244685;
	Fri, 20 Feb 2026 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605175; cv=none; b=dnoHqwUeXHTyDGJ8LHuUBkzr5IKyq4WcVS2H/DNgDBblEHeAvp0ofFczZaWhtlxh01Scp6No1mcO/iDzpSyBB63iM9GrSf96OmzCgLSf3ipC8SFRKpJ1syJf9hUBu6IMC9PictT17qWStz9AR57qMIr130mGd+ZdgKUqmGvgQGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605175; c=relaxed/simple;
	bh=K/vUj5QndZ0p0Xq53HfGGB0/CqZsJE/Wgl5bT/h172A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNL2KM1hscf8J+rgy34CU5D4xcXmZcdn7onfIkjWk5q4I1n5GXm0XLKRnwgBdbjTUK0M9nzE7J/LEt2Z+U6AcZFh8KmVBuySEZcACNn2qdzR8xVZMHLmGCHzovgdfbj2uKfEd3C+p+VThQWWEoPXMOv0o1qBkMO3onCUlxBgWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PLv99rsu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FBTg85ib; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 20 Feb 2026 17:32:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771605165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/vUj5QndZ0p0Xq53HfGGB0/CqZsJE/Wgl5bT/h172A=;
	b=PLv99rsupbTDCvxijbiYBVyFCxYdg5seWfnmiY3AUqQ4Vm0FKOgIvnaToDS5QAs7uFMx+e
	9qnICIrrcO1JMZGZm6TYRLc+hsf5gjNUkwxKOdCPF14XD4ORJtN4BUTXW1PAgcIS/yekSb
	5+d3EevGQl0wFIsRgvkQYGJpX+GAjX6xjVFnAuXh8xOCdCU1qzz6Z6Ks2h0DtSIYSMZN0d
	QA3x35dIkrjJOVGCBU4Z3ebKoM+ZMdIgcYMFba/OQX58gHc1GfGxP26/D8HHxufENTyF/O
	B+unStUj9ljtYjJuR7yWrFV592k0PiLj/2IUOqKckRXRIWB2hRVaWMOh2ENsWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771605165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/vUj5QndZ0p0Xq53HfGGB0/CqZsJE/Wgl5bT/h172A=;
	b=FBTg85ibjBdEBodB7zChmpfZEJnXvXQ80h/HpbKIWWgrIf2UNerA5j/Lts/wQtkAeVLIaZ
	oyKgsUi18mjYExCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: Ding Yihan <dingyihan@uniontech.com>, dwlsalmeida@gmail.com, 
	mchehab@kernel.org, linmag7@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
Message-ID: <20260220173107-952529f5-6e68-4f7f-a55c-60e04912d236@linutronix.de>
References: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
 <20260220145236-d4661904-0ed8-4c04-8bdd-09f537b70ba4@linutronix.de>
 <m2fr6v5unu.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m2fr6v5unu.fsf@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53134-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[uniontech.com,gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6626216955F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 03:58:13PM +0100, Abd-Alrhman Masalkhi wrote:
> On Fri, Feb 20, 2026 at 14:56 +0100, Thomas Weißschuh wrote:

(...)

> >> Thomas, would it be worth submitting a separate patch now to fix
> >> `vidtv_ts_pcr_write_into()` to prevent future KMSAN errors? Or would you
> >> prefer this to be addressed together in Abd-Alrhman's v2?
> >
> > Doing it together sounds better. This is not urgent anyways in my opinion.
> > But on the other hand I am just a random guy whose commit got wrongly blamed
> > in the original Fixes tag and I don't know anything about this subsystem.
> >
> Sorry, I have misunderstood how the 'Fixes' tag works.

No need to be sorry. I didn't want to come across grumpy, but wanted to
express that I am just a bystander and have no authority over this code.


Thomas

