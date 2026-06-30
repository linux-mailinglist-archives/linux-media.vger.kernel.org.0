Return-Path: <linux-media+bounces-66065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DMEHJY6VQ2rOcgoAu9opvQ
	(envelope-from <linux-media+bounces-66065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:08:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E856E2A24
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=W8+LwmEt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66065-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66065-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B3743047D02
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D346C1C68F;
	Tue, 30 Jun 2026 10:07:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F83E867F;
	Tue, 30 Jun 2026 10:06:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814021; cv=none; b=gnzEzeDydh+qwGbKg2KVfodsZACyA9r3sxgrjek6GvXTI1D/iVqnWr7hnyXe2FPs/m85Tk7/yRhRYT1hwzwKInvGZNn/Qsl5/Up3fgE0yQ7ZqGdiZPL3la+fHt4S6iIKIIbeFfnwkRlJvonwIFsCeKfxdeeKn6vWqJui2tMP0og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814021; c=relaxed/simple;
	bh=PMHaeNMqHxs/E7sVPo0Mz4q3LV/e/UXIFj9+XPRPwFo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIe9oLUo+9mGbuc8gNG49XHd27C1ALUypQhPOL333Ix8DjkilqhBJuCOw5Z0v5PnVphPn7uat0Ku8DGqgRbyMUbjKXE09KBT5kbNwcAhxZH2uqlOeZFkQPuj8bY2wRY/4+imWnLxTO+7EOUVo4f8cdaTPln5nhbET/uavZPro2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W8+LwmEt; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gqJhn2GDNz9sl7;
	Tue, 30 Jun 2026 12:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782814009; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHHdALHFYJG7pNBaHmpNDc9IMidTp6lhFofr75a95j8=;
	b=W8+LwmEt5WKSVKe+0YDgIgVlWLf0hqegpzzh+qAge4EnGTBL/nmC7ekto29tIeINT9cupA
	W5HKNizl5CD2vH+n/mm9OY+vFYUE1bd4mMAIlgXTfPSwYQIh2z4rm/FGcIGfZ5MsfgIZho
	VI23SgqRXsLXpCAjKSTgEJHaS5MaYff4/8PHzHTVHaczKaNSPSIWlHPJ1ytlmfX8YOMRyQ
	NvGRj6ECw30R/k3hy34TeENDEL7LUqFNM12qlecKTFMdLQFXIYqcEl3y2VAO20zirqokQf
	aW09pUyPJJELqzT3pVltj16FXu2z+jXXIuR0IvwoPo9MAZHRqUK4KI6A5FP/7Q==
Message-ID: <9f7fa57610d3d94324e09dc936f5f7f3c3d390d3.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Protect entity->last_scheduled with
 spinlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner	
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich	 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Tue, 30 Jun 2026 12:06:41 +0200
In-Reply-To: <1941b3c5-2ef1-4da9-aa20-a11d771274f1@igalia.com>
References: <20260626081942.2122144-2-phasta@kernel.org>
	 <1941b3c5-2ef1-4da9-aa20-a11d771274f1@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 0358df815d185da7b20
X-MBO-RS-META: bai59bkqca6doojgn198bd7q8yiq6yhh
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-66065-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06E856E2A24

On Tue, 2026-06-30 at 10:23 +0100, Tvrtko Ursulin wrote:
>=20
> On 26/06/2026 09:19, Philipp Stanner wrote:
> > The entity->last_scheduled field has always been set and read with
> > special RCU functions in addition to memory barriers. There is no
> > obvious reason for that, since the entity lock is available and taken a=
t
> > all places that evaluate the last_scheduled field. The only exception i=
s
> > drm_sched_entity_error(), which is not performance critical in any way.
>=20
> I agree this looks odd since all call sites apart from=20
> drm_sched_entity_error() use=20
> "rcu_dereference_check(entity->last_scheduled, true);" ie. "ignore" the R=
CU.
>=20
> Btw this was added in:
>=20
> commit 70102d77ff22dd88a0111b1c3bac5099ac5d0425
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:=C2=A0=C2=A0 Mon Apr 17 17:32:11 2023 +0200
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 drm/scheduler: add drm_sched_entity_error and us=
e rcu for=20
> last_scheduled
>=20
> You may want to add this as a reference in the commit message.

I did git-blame for that commit. It looks like this:

    drm/scheduler: add drm_sched_entity_error and use rcu for last_schedule=
d
   =20
    Switch to using RCU handling for the last scheduled job and add a
    function to return the error code of it.

It's a good example of why I think it's so vital to write verbose
commit messages. The only way to find out why this was added is to ask
the author, if he's still around [which is the case in this case].

I can't see the value of adding a link? That commit says "add foo" and
my commit says "remove foo because it achieves nothing".

> I guess it relied on dma-fence RCU destruction to enable lockless=20
> lookups from the AMD submit path. Given how many other locks we have in=
=20
> those paths it is probably noise to have one more so maybe it is a win=
=20
> to remove some barriers and those rcu_dereference_check-true lines. I
> think Christian will need to comment.

My argument is more that locks are the right tool to use unless there
is proof to the contrary.

>=20
> > Improve robustness, readability and maintainability by replacing RCU an=
d
> > barriers with the lock.
> >=20
> > As a preparational step, while at it, also guard spsc_queue_pop() with
> > the lock, since spsc_queue is deprecated and supposed to be replaced
> > with a locked list.
>=20
> You would have said to split the logical changes into separate patches.

Me? :D

In this case, a lock that did not exist is added from nowhere. But I
tend to think that you are right. We could leave spsc_queue lockless
for now. That's cleaner.

>=20
> >=20

[=E2=80=A6]

> >=20
> > =C2=A0 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_=
entity *entity)
> > =C2=A0 {
> > +	/* Helper to avoid dropping the reference while the entity lock is he=
ld,
> > +	 * just to have some more robustness.
> > +	 */
> > +	struct dma_fence *prev_last_scheduled;
> > =C2=A0=C2=A0	struct drm_sched_job *sched_job;
> > =C2=A0=20
> > =C2=A0=C2=A0	sched_job =3D drm_sched_entity_queue_peek(entity);
> > @@ -523,19 +532,20 @@ struct drm_sched_job *drm_sched_entity_pop_job(st=
ruct drm_sched_entity *entity)
> > =C2=A0=C2=A0	if (entity->guilty && atomic_read(entity->guilty))
> > =C2=A0=C2=A0		dma_fence_set_error(&sched_job->s_fence->finished, -ECANC=
ELED);
> > =C2=A0=20
> > -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> > -	rcu_assign_pointer(entity->last_scheduled,
> > -			=C2=A0=C2=A0 dma_fence_get(&sched_job->s_fence->finished));
> > +	spin_lock(&entity->lock);
> > +	prev_last_scheduled =3D entity->last_scheduled;
> > +	entity->last_scheduled =3D dma_fence_get(&sched_job->s_fence->finishe=
d);
> > =C2=A0=20
> > -	/*
> > -	 * If the queue is empty we allow drm_sched_entity_select_rq() to
> > -	 * locklessly access ->last_scheduled. This only works if we set the
> > -	 * pointer before we dequeue and if we a write barrier here.
> > +	/* A recent rework required taking the spinlock above. Since spsc_que=
ue
> > +	 * is scheduled for removal as per the DRM-TODO-list, we access it he=
re
> > +	 * locked already to prepare for that cleanup.
> > +	 *
> > +	 * TODO: Fully replace spsc_queue with a locked (h)list.
> > =C2=A0=C2=A0	 */
> > -	smp_wmb();
> > -
> > =C2=A0=C2=A0	spsc_queue_pop(&entity->job_queue);
> > +	spin_unlock(&entity->lock);
> > =C2=A0=20
> > +	dma_fence_put(prev_last_scheduled);
> > =C2=A0=C2=A0	drm_sched_rq_pop_entity(entity);
>=20
> Notice the entity->lock ends up cycled twice for no good reason (second=
=20

Getting rid of hard to understand barriers + RCU *is* a _very_ good
reason.

> is in drm_sched_rq_pop_entity()). So I would suggest you somehow reduce=
=20
> that to once. Probably just pull out entity->lock out of the=20
> drm_sched_rq_pop_entity() to drm_sched_entity_pop_job()?

Can you see danger in sense of a significant performance regression
because of that?

>=20
> I guess if you do that then the "while at it" part of the commit message=
=20
> can be "upgraded" to "spsc_queue_pop() being under the lock as a=20
> consequence of the rework" and then no need to split it.

I agree with you that it should be *downgraded* instead.


>=20
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Jobs and entities might have different lifecycles. Sinc=
e we're
> > @@ -561,21 +571,15 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> > =C2=A0=C2=A0	if (spsc_queue_count(&entity->job_queue))
> > =C2=A0=C2=A0		return;
> > =C2=A0=20
> > -	/*
> > -	 * Only when the queue is empty are we guaranteed that
> > -	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
> > -	 * enforce ordering we need a read barrier here. See
> > -	 * drm_sched_entity_pop_job() for the other side.
> > -	 */
> > -	smp_rmb();
> > -
> > -	fence =3D rcu_dereference_check(entity->last_scheduled, true);
> > +	spin_lock(&entity->lock);
> > +	fence =3D entity->last_scheduled;
> > =C2=A0=20
> > =C2=A0=C2=A0	/* stay on the same engine if the previous job hasn't fini=
shed */
> > -	if (fence && !dma_fence_is_signaled(fence))
> > +	if (fence && !dma_fence_is_signaled(fence)) {
> > +		spin_unlock(&entity->lock);
>=20
> Have you tried with lockdep to see if there are any hidden lock=20
> inversions with this?

As far as I could grep really no one touches the entity lock (which is
not surprising, since the entire drm_sched design resolves around the
central philosophy: "NEVER use a spinlock unless you absolutely have
to". When you look at the old code and documentation, you see that
locks were really only ever used to protect lists.

Anyways. This is the scheduler's fence. It can never implement any
callback to someone who might interfere with the entity lock, can it?

>=20
> I also wonder if we could demote this to a flag check only and remove
> any doubt. I don't think opportunistic signalling matter in this code pat=
h.

With the new fence API, where we can bypass the ops, that would
probably be the more canonical code. But that's then indeed something
for a separate patch.


P.

