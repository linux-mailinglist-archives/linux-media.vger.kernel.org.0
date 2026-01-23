Return-Path: <linux-media+bounces-51388-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMJBOXgsc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51388-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF07234C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E7B3032991
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641A033EB09;
	Fri, 23 Jan 2026 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4EKDgjqc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gQutqfq/"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2FA340DAB;
	Fri, 23 Jan 2026 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155465; cv=none; b=T3fonqdfO5JCEkdu6NetERxH9jAh5mklSpKP5tpz7be5gNlUANE98t4WeVCLXe83NAIktq3P97DasNg2k66lgMTcRMNmq3BFjuWqtsNopnMpX0Pk2A4jl3vwgr/0L8NWk6s9rgvfVZQ0SuGwfkp2IFuPyJqmxfMb9BDUj4CtHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155465; c=relaxed/simple;
	bh=3cUidOW1qw3tdfGX7hczekAJlTc7yZok8kLMLVbwegM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOV1OjLzrVKjuxHDog+lrFFn67BYqWPQp3mXPfZ+JVSfAquAInPSBTi2NbBL8TDJU/hkFH1M2csVqZumdTKkcwLUxvb6bo7aSpMtB0eyCGTHnn6ENIKqqr/3vVLaEsnU4b+7sFt/I14c1EDTiQjqgZz4GbyEsJGdvu/N5PKyU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4EKDgjqc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gQutqfq/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 23 Jan 2026 09:04:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769155463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3cUidOW1qw3tdfGX7hczekAJlTc7yZok8kLMLVbwegM=;
	b=4EKDgjqc65ynw3jTbnVMmx2eV0z9h7x53Ys9tgdchx+GecKum8eqNkRrtBjAk/xiBepEPo
	eb+WQa7ei/VrpvajEHrPKrVPhSMdwC/4CjQicnmHr5za777+OAjQEKnOJzK97yXiIpsKMO
	7KFcDzsMw90QyBvdOLAGauA7PCI+iazFt9VmTHSdS7QOQonoY0No6lXdhYzMq3yhpJ/E9j
	qvrcMEL38bdmFH2gZFiEDaPrJkrT5mMDtkD1jZ6TG7MKpz+nLoecjxLkEc23FXv19hPtQN
	Na8y62WDCwfMAwFbImxsYD55sMXcGWOvB0FBM39V7x//sUEnrF1ZgutGGw8ayA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769155463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3cUidOW1qw3tdfGX7hczekAJlTc7yZok8kLMLVbwegM=;
	b=gQutqfq/MEH15/IzNexdULpLWKNJcdKbDWXVZhF8G8oJ4V9qLDfv2gLSD9K9de7XbvuhUz
	s9Z3CvsIzfffo4AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v2 3/3] media: dw100: Fix kernel oops with PREEMPT_RT
 enabled
Message-ID: <20260123080421._9VjDlE4@linutronix.de>
References: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-0-ea1e29f18cf1@ideasonboard.com>
 <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-3-ea1e29f18cf1@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-3-ea1e29f18cf1@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51388-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 67FF07234C
X-Rspamd-Action: no action

On 2026-01-22 15:44:58 [+0100], Stefan Klug wrote:
=E2=80=A6
> There is one caveat though: During development regular "dw100
> 32e30000.dwe: Interrupt error: 0x1" errors occurred due to
> DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being set. This only happened on
> non PREEMPT_RT setups when the interrupt handler was manually forced to
> be threaded. On PREEMPT_RT systems (where the interrupt handler is now
> implicitly threaded) this error was never seen.

This not something I would expect. If it is forced-threaded it is
forced-threaded on both (RT && !RT) so it should behave the same. It
might be related who it is handled (order wise) with the other (related)
interrupts in the system. Anyway. Removing that flag is the right flag
to do.

> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

