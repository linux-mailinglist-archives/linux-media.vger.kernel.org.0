Return-Path: <linux-media+bounces-51402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P+sK5Ywc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:25:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FDB726F4
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C47E53040696
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF35361DB6;
	Fri, 23 Jan 2026 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="40ffXJtq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MW9sJnb9"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304B535DD1A;
	Fri, 23 Jan 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769156651; cv=none; b=CBr6XSvjh8Sxl2uNLMb6yX5r4ixZmAUy7MxbY++VXc+RTTz+Vwtdw8KXzBNfCXOngoZMg2DMh+Q44QZ03DjcjYUL2kogAwVhW/u+OgMlfBhwfGMlVxDduOr+RJYzi8TvH7M8nzzCLNJDo2WHLkOadRqqhVphqTlrfLjLKXYBkC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769156651; c=relaxed/simple;
	bh=SzKgbEXPJVAJ14g4kKLrVSzfHuVCSe0+UTsU1YjX+Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcI5BrhQwV6NeXgoO8szLCWCEq1cWjY1NL2tQ7HHxIMl2KejKnxMIapPq+Wa8iflBGK9JNWyNhCHaLGOfq2BVfy0fS1U022xan8N6X9YQBpKnpSoXv8o7dfVVGIj3pQ7M6KYegIuPrTAwttc8IFTkQV825d7Z9ZAiFLTckSI7EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=40ffXJtq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MW9sJnb9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 23 Jan 2026 09:24:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769156646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzKgbEXPJVAJ14g4kKLrVSzfHuVCSe0+UTsU1YjX+Bg=;
	b=40ffXJtqn+gbxsLhA3vUAR4AakeS1nHwq/AkGKHBFhPiaz2ah/AYuWYtiLDt4OGTlBcARg
	o5pjcakaRsz/0Syivo5occoaPnFnFbaPeFUne8HPjn2Vf+h53Lz6Ltryevg477uJCuy8Ld
	JF9/G7NMlVfDqbvmzlZ7RqYEPe3Ev41evYklXFOFoWZBEs/XQEcxBMafOFjcpfsMDTMpiR
	cmyzam4N2Q6mD1H2x26+4YERLQKKqcKWDq+X/LkqSYmWuewAq2otYrwv9Y0fIXphbFaPqj
	OgzG31bf2Ym8ORjVPjXPQu56XBO6k4Cgw3LEJybtfRHa53u2a0OkR7oVwhkUyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769156646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzKgbEXPJVAJ14g4kKLrVSzfHuVCSe0+UTsU1YjX+Bg=;
	b=MW9sJnb9eVlU59BrTITlX50bTfDJnTZINx3R51BY8wyYCJVbbbwOR8NpyKX7RKGDi+roDx
	LFMfJifepwYcS0BQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
Message-ID: <20260123082405.yx7thGtq@linutronix.de>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
 <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>
 <20260105235921.GI10026@pendragon.ideasonboard.com>
 <20260105193933.40485807@gandalf.local.home>
 <20260106004928.GL10026@pendragon.ideasonboard.com>
 <176771948736.12184.11458532023194713133@localhost>
 <20260112114313.woeZoGZP@linutronix.de>
 <176841135424.20276.2623851494182415213@localhost>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176841135424.20276.2623851494182415213@localhost>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51402-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 36FDB726F4
X-Rspamd-Action: no action

On 2026-01-14 18:22:34 [+0100], Stefan Klug wrote:
> Hi Sebastian,
Hi,

sorry for being late=E2=80=A6

> I did a bit more testing and got results that I fail to completely
> understand.
>=20
> If I enable IRQF_ONESHOT and use the threaded_fn, on a non PREEMPT_RT
> system I regularly observe the timeout message.
>=20
> If I pass irqflags=3D0 and use the hard handler on a PREEMPT_RT system I
> expected the same behavior (as the hard handler gets changed to be
> threaded and implicitely ONESHOT is set). But I don't see the timeout
> messages.

If you have the driver with the removed ONESHOT and boot !RT with
threadirqs then you should have the same behaviour. RT threads all
handler not just one. This might change the behaviour if all interrupts
are served by one CPU and some interrupts are handled prior and have an
effect on this (threaded) one.

> Is there anything else that I need to do on PREEMPT_RT to force the
> threaded behavior besides enabling the config? Or is the irq thread
> running with higher priority and therefore possibly faster?

In both configurations (RT and !RT with threaded interrupts) the
interrupt handed is running at SCHED_FIFO prio 50. This has a higher
priority than the "normal" userland which runs at SCHED_OTHER but the
same priority as the remaining threaded interrupts.

> Running irqflags=3D0 and the hard handler on a non PREEMPT_RT system
> didn't have any negative side effects. So maybe that is really the
> solution...
>=20
> I'll ping Xavier if he has more details on the hardware.
>=20
> Best regards,
> Stefan

Sebastian

