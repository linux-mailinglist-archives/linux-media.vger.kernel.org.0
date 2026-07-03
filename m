Return-Path: <linux-media+bounces-66464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bMh6FYnLR2rHfQAAu9opvQ
	(envelope-from <linux-media+bounces-66464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:47:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075170393D
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:47:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=io7+jonG;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66464-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66464-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A53273001FAE
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 14:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04472566F7;
	Fri,  3 Jul 2026 14:47:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A212367D3;
	Fri,  3 Jul 2026 14:47:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090041; cv=none; b=EnJ/cACpgaTaOUwVYlxtu3L2Cl78HZLVSCVFvOBACyE03cf3f19pyEcmJl2Ck7y3lCyaOC6MafH51LaYuMkQD039QsTumY7XygyJuzIgn3lWjjtp9u+zpKmSabwv9ND580GOfQ3OWVtm7XqkU8yhWjHnEXf4ByneZWFwrfzo7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090041; c=relaxed/simple;
	bh=+HDwmqQSBX74ngF8fA1/ZQudrL7YpXc1werdMy1usCc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aw2oiCWlBodGEXvhUCIbmQ9HYG5ojZrt05hUJDzj3KeS/urwepfFgRyiEDldK1fzgF4ZnnfihTxFYX1MRBQ32SIxRm34/ay39+7H34rwwLKA4SXuSSKRkuAfamyB+0+R9M6MYRrHWLz5LNvazmW0wISut6+nW7YzAQ4XGXd43Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=io7+jonG; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gsGmz2K5wz9tnx;
	Fri,  3 Jul 2026 16:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783090035; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NstNPI3Yl6z18ZLCBhwhl1e5laiGgCjywIQQ7XGoi0w=;
	b=io7+jonG4i0IEqFYwLqSYd+32vedj9DY2NWtA1mzHCnvAc2BSryG1YISMX2GQuRcO/KMa2
	jdlBGbLphY0sw8hn9xOOrASIYZ/inh4ONINCbqkZznQvo16Wv/53mgZiWT+bidQR4JXC/n
	R75nqK/NFKogTdQCXwajFzGuYvxM+EuSYEVRE4gwA2Z0Vy2DIHDADJy+iGXMiUdXXyFIWm
	nP8vXCauQ/5delyYBfE58/m3C7mRqHOObLC00TXUnsa6+6mkbNwpcc4jgOUpedXRQtK4jT
	YqJMIIdvXhWEAWbu55oonfxHFWTdWsUUcqd8D9Av+QmRVy/XzgupscUmCmRxIQ==
Message-ID: <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard	 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie	 <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal	 <sumit.semwal@linaro.org>,
 Marco Pagani <marco.pagani@linux.dev>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Fri, 03 Jul 2026 16:47:08 +0200
In-Reply-To: <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
References: <20260701085920.3253248-2-phasta@kernel.org>
	 <20260701085920.3253248-3-phasta@kernel.org>
	 <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 8bx1aetxqqwi14hyoz5m6dj1nbunchzx
X-MBO-RS-ID: 33ffcc438f0fff36951
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66464-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[ursulin.net,kernel.org,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,igalia.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5075170393D

On Fri, 2026-07-03 at 12:27 +0100, Tvrtko Ursulin wrote:
>=20
> On 01/07/2026 09:59, Philipp Stanner wrote:
> > The entity->last_scheduled field has always been set and read with
> > special RCU functions in addition to memory barriers.
> >=20
> > This was added in
> >=20
> > commit 70102d77ff22 ("drm/scheduler: add drm_sched_entity_error and use=
 rcu for last_scheduled")
> >=20
> > however, no proper justification for that mechanism was provided. There
> > seems to be no obvious reason, since the entity lock is available and
> > taken at all places that evaluate the last_scheduled field. The only
> > exception is drm_sched_entity_error(), which is not performance critica=
l
> > in any way.
> >=20
> > Improve robustness, readability and maintainability by replacing RCU an=
d
> > barriers with the lock.
>=20
> First thing, and regardless of other strands of discussion, I think it=
=20
> should be squashed with 3/5 instead of that one undoing the introduction=
=20
> of lock-unlock-lock-unlock.

I agree that there should not be a do-undo pattern, but I don't want to
squash that, it's quite a distinctive action. One patch adds locks, the
other moves them.

But what I can do is move that patch before =E2=84=961 here so that it beco=
mes
understandable as a preparational commit.

>=20
> For what the main topic is concerned, I really like the removal of all=
=20
> the rcu_dereference_check(, true) lines and the memory barriers.
>=20
> But I also think the commit message should explain better what code=20
> paths are now taking an extra lock - under which circumstances is the
> lock now taken for all scheduler users, and which amdgpu paths use=20
> drm_sched_entity_error() a lot so could be affected. I doubt it creates=
=20
> a measurable performance impact but it needs to be explained.

I think it can detail which functions will now be locked; but
mentioning the users would be overkill and is uncommon for API reworks.

>=20
> I am also happy to give it a spin on the Steam Deck to see if I can=20
> observe anything.

Could be interesting.

>=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++++--------=
------
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++---
> > =C2=A0 2 files changed, 25 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index c51101ec70c1..91aec20611ad 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -135,7 +135,6 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> > =C2=A0=C2=A0	entity->num_sched_list =3D num_sched_list;
> > =C2=A0=C2=A0	entity->sched_list =3D num_sched_list > 1 ? sched_list : N=
ULL;
> > =C2=A0=C2=A0	entity->rq =3D &sched_list[0]->rq;
> > -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > =C2=A0=C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> > =C2=A0=C2=A0	init_completion(&entity->entity_idle);
> > =C2=A0=20
> > @@ -201,10 +200,10 @@ int drm_sched_entity_error(struct drm_sched_entit=
y *entity)
> > =C2=A0=C2=A0	struct dma_fence *fence;
> > =C2=A0=C2=A0	int r;
> > =C2=A0=20
> > -	rcu_read_lock();
> > -	fence =3D rcu_dereference(entity->last_scheduled);
> > +	spin_lock(&entity->lock);
> > +	fence =3D entity->last_scheduled;
> > =C2=A0=C2=A0	r =3D fence ? fence->error : 0;
> > -	rcu_read_unlock();
> > +	spin_unlock(&entity->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	return r;
> > =C2=A0 }
> > @@ -287,9 +286,10 @@ void drm_sched_entity_kill(struct drm_sched_entity=
 *entity)
> > =C2=A0=C2=A0	/* Make sure this entity is not used by the scheduler at t=
he moment */
> > =C2=A0=C2=A0	wait_for_completion(&entity->entity_idle);
> > =C2=A0=20
> > -	/* The entity is guaranteed to not be used by the scheduler */
> > -	prev =3D rcu_dereference_check(entity->last_scheduled, true);
> > +	spin_lock(&entity->lock);
> > +	prev =3D entity->last_scheduled;
> > =C2=A0=C2=A0	dma_fence_get(prev);
> > +	spin_unlock(&entity->lock);
> > =C2=A0=C2=A0	while ((job =3D drm_sched_entity_queue_pop(entity))) {
> > =C2=A0=C2=A0		struct drm_sched_fence *s_fence =3D job->s_fence;
> > =C2=A0=20
> > @@ -381,8 +381,7 @@ void drm_sched_entity_fini(struct drm_sched_entity =
*entity)
> > =C2=A0=C2=A0		entity->dependency =3D NULL;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> > -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > +	dma_fence_put(entity->last_scheduled);
> > =C2=A0=C2=A0	drm_sched_entity_stats_put(entity->stats);
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_entity_fini);
> > @@ -507,6 +506,10 @@ drm_sched_job_dependency(struct drm_sched_job *job=
,
> > =C2=A0=20
> > =C2=A0 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_=
entity *entity)
> > =C2=A0 {
> > +	/* Helper to avoid dropping the reference while the entity lock is he=
ld,
> > +	 * just to have some more robustness.
> > +	 */
>=20
> I don't get this comment. Neither the placement or the content.

It explains the purpose of the variable 'prev_last_scheduled', which
exists so that a reference does not drop under lock protection.


P.

