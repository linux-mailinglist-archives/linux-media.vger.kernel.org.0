Return-Path: <linux-media+bounces-66722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jIKoNIyJS2oyVAEAu9opvQ
	(envelope-from <linux-media+bounces-66722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 308EB70F85A
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:55:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WcvtDMPh;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66722-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66722-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F173089FDA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 10:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D45737BE7F;
	Mon,  6 Jul 2026 09:50:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-199.mailbox.org (mout-p-199.mailbox.org [80.241.56.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFCA422526;
	Mon,  6 Jul 2026 09:50:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331448; cv=none; b=U6QLcQ6Y9rhmhb1wDX74I9QXYrct3ipymD0d7lsxmgjM/M1IzzVNmb6zB8s/YYha3V01AbbH9b7HRRu4HGU/fAK70eq1boRpkBlyz1VnVeu7RiIcNwnzvR5apgjAcxRNbNLPRkS1WUMXaaBFyi2KVjmxnuHI5rnlBuHLmj8k9X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331448; c=relaxed/simple;
	bh=ktWCjjYsuacPpq6GWgtpQ87La5bDezQk61Vet7YzDlU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A39XQG+Dl03v5mkFUxl+EhePJC3CGfw0XYHJzbfYygi4EE2tQZC5/Xw1uPdgx6vB92HOkNqQB+CUdt7gfKkj8Se2a9q4PdOV2AGwiX4QZnExPA2EXBNxl8N9sODszFBVKFrfZIUgQRxPvfR57dMYPNwZuP7f8ZU5B3CIWihfMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WcvtDMPh; arc=none smtp.client-ip=80.241.56.162
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-199.mailbox.org (Postfix) with ESMTPS id 4gtztS34TszKnTJ;
	Mon, 06 Jul 2026 11:42:56 +0200 (CEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gtztQ5lTCz8skM;
	Mon, 06 Jul 2026 11:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783330974; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJ9jd7Zxu199hkJd1xLE7QEc/TjACmfRv6CygkoHVoQ=;
	b=WcvtDMPhCBewiHaBykCEOoSvuswegK7PLcuOYlytMHKbFR6ZZUVbBCgpotaZwg3Agw2hWF
	aTI3aIwp6TuopQUTf+yRrpo37hATExHA/kwl4OJ1SArEfPRP5/N2KE+8tMaYbOqlDyym2C
	HVp5Hw4RKl9QIzaI5sSFYtR9IOgIN5T0v9zlXy5AVNXleeBkXUQtv+UoCDv5OjSlQdDPe8
	1j8CNWuNQ01iSSthj/FL3aqJv1eKhVcgX0NUIi1R6tS3yaFOGPSzAWe9cC+Cg0Qkxmg3qm
	psZ7SL+0yWgIcUilk5UyCFTYIgpMNnK5BmNcm3HskTgN0mwJVxjrZwDhc+83ZA==
Message-ID: <0af946b7bef6958f103598083919bbf933423676.camel@mailbox.org>
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich	 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marco Pagani <marco.pagani@linux.dev>, Boris Brezillon	
 <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 06 Jul 2026 11:42:47 +0200
In-Reply-To: <ce33edbb-11dd-4722-bb87-d16155f35a75@igalia.com>
References: <20260701085920.3253248-2-phasta@kernel.org>
	 <20260701085920.3253248-3-phasta@kernel.org>
	 <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
	 <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
	 <ce33edbb-11dd-4722-bb87-d16155f35a75@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: df8126bf0d27855a51c
X-MBO-RS-META: f8ykmoj3beju11nmnkzj8i63r46bck87
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66722-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,ursulin.net,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 308EB70F85A

On Mon, 2026-07-06 at 09:45 +0100, Tvrtko Ursulin wrote:
> On 03/07/2026 15:47, Philipp Stanner wrote:
> >=20
> >=20
> > I think it can detail which functions will now be locked; but
> > mentioning the users would be overkill and is uncommon for API reworks.
>=20
> Here I disagree quite strongly. Given the patch is making strong claims=
=20
> that the lockless access was added for no obvious reason, and that we
> have now established the lockless helper is in fact used on the=20
> submission paths, it is really required that those strong claims are=20
> backed by a concrete analysis instead of just saying "not performance
> critical in any way".

This is a strong case for the reversal of the burden of proof.

The entire code base of drm_sched has been designed on the computer
science premise of locks being evil. That's why literally all
synchronization primitives except for locks have been used where
possible, including undefined behavior. The designers tried as hard as
they could to avoid locks.

That is clearly proven by the fact that in all original data type
definitions, the only components that were locked were always lists,
since those are the structures where you really cannot avoid a lock in
most cases.

The aversion to locking was so great that they designed spsc_queue,
which uses at least as many as expensive instructions as a lock + list
would have needed, and its correctness is not proven, nor are its
behavior and rules neither documented or proven.

It's not up to the faction who wants to use correct locking and phase
out UB to prove that the locklessness is bad, but to whomever added the
locklessness to prove why it is good, i.e., necessary =E2=80=93 which was n=
ot
done here, neither in comments nor commit message. So the reasonable
assumption is that it's simply a leftover from a flawed, broken design.

And the kernel-workflow is that things are always on-list for a while
before being merged is that parties who do have concerns and who can
point out problems have time to do so. Which is of course open to you:
do you see a performance-regression problem with this patch, and if so,
where?

Anyways:
 * Correct me if I'm wrong, but it would seem the only driver-usage
   which could see a *new* lock in its path is
   drm_sched_entity_error(), for which you yourself agree that it's
   irrelevant performance-wise. Should we still list the user's of that
   function?
 * The other relevant user path, drm_sched_job_arm() via
   drm_sched_entity_select_rq(), must already be called under a common
   driver lock for drm_sched_entity_push_job(), and _select_rq()
   already takes the entity lock. So any significant regression here is
   hyper unlikely.
 * The only other contender is the job pull path, which runs serially,
   by 1 work item at one point in time.
 * drm_sched_entity_kill() / _fini() are used in user context teardown
   path. Performance irrelevant.

I can offer to add the list above for the justification of why removing
the half-undefined behavior is good.

Or what exactly would you want to see documented? "amdgpu uses
drm_sched_job_arm() and now sees a lock-critical section longer by 3
instructions. etnaviv uses drm_sched_job_arm() and now=E2=80=A6"?




P.

