Return-Path: <linux-media+bounces-47977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6809C98102
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BDDD4E16AE
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C71E3321C7;
	Mon,  1 Dec 2025 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RJMoTVd0"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F80636D518;
	Mon,  1 Dec 2025 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603291; cv=none; b=RpXLXmoWgUOFsrbHyhBmWulRGzDbwHxxhULUBWWnCnG8bq2SVSfud4P0v+ROA1o2Nd2Vl7v5J78PiBB1X4oNbE3qlWK9Qgc/4Gi7Lhrfvdicsy7XR0atAMBgKfKW/4fZfgb7tc/n1w1tVx5jDuvZJmuo2XuyTjW3cICENRzYayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603291; c=relaxed/simple;
	bh=lsYAXutbtw/iz/SMvQah9OSKwK1PxezAs0nN4NUZzsg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q0OhiXck74CuOSkt/ic6ZmxfiYvJGgac5u1rmVpvE44zjfGiyiOJYHcm0mpppK4mpF8Dldivo1N9X4cYpyunqZ7Br4hycG+dP8HFNeePBZsRWo1dbWq3SKojBWvc2+uNEcXgMaGUkhvorfbuIKGv9feAhV3HezH/axGHmtT2z+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RJMoTVd0; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dKnyS2nxQz9t7d;
	Mon,  1 Dec 2025 16:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764603280; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgphQImo2CsCBeaCQs8YEn7VRVszdQcY1N+6nFeVvP0=;
	b=RJMoTVd0KT3Am/i7RHmcUdZ67k5CBi+kZl9EEsPD2iE2f9yWC00VfQQQO2/mLq4ICSbzFl
	WAgy6uiwm5pAQ/ojek1ecv4MOkfHekA8bbcJEUryGB6pq2RPO4M1OsPyMEueel5O26+hmQ
	1/Llt1MOxBbvN1T+1THDoJ3uMwBzjAdVCGqsJRpQqWGidV9YTkEODLrJG3lF2NQaTChQFM
	8EQx/2yicrNHVndvn8SZOZt8pBkFq0PkJMIje+VIJbUQIwj/DVsVjuF0sPdR/z03JastDN
	27Bj6re/HOL2ghT0W3FwWx28bTsxjfM09+AT6/QUN2rkgn2aZ5cf+RJcK0oSug==
Message-ID: <8eaab4c04fad84bde279ee2cd228fac4f84c5184.camel@mailbox.org>
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add
 dma_fence_check_and_signal()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 16:34:32 +0100
In-Reply-To: <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
	 <20251201105011.19386-4-phasta@kernel.org>
	 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
	 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
	 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b98572e8d9faed18a8e
X-MBO-RS-META: 51juwjpfinahneyw9wwu3nc86zzu6ucz

On Mon, 2025-12-01 at 16:20 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 14:55, Philipp Stanner wrote:
> > On Mon, 2025-12-01 at 14:23 +0100, Christian K=C3=B6nig wrote:
> > > On 12/1/25 11:50, Philipp Stanner wrote:
> > > > The overwhelming majority of users of dma_fence signaling functions
> > > > don't care about whether the fence had already been signaled by som=
eone
> > > > else. Therefore, the return code shall be removed from those functi=
ons.
> > > >=20
> > > > For the few users who rely on the check, a new, specialized functio=
n
> > > > shall be provided.
> > > >=20
> > > > Add dma_fence_check_and_signal(), which signals a fence if it had n=
ot
> > > > yet been signaled, and informs the user about that.
> > > >=20
> > > > Add a counter part, dma_fence_check_and_signal_locked(), which does=
n't
> > > > take the spinlock.
> > > >=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0drivers/dma-buf/dma-fence.c | 44 ++++++++++++++++++++++++++++=
+++++++++
> > > > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 2 ++
> > > > =C2=A02 files changed, 46 insertions(+)
> > > >=20
> > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fenc=
e.c
> > > > index 96d72ffc0750..146de62887cf 100644
> > > > --- a/drivers/dma-buf/dma-fence.c
> > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > @@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *=
fence)
> > > > =C2=A0}
> > > > =C2=A0EXPORT_SYMBOL(dma_fence_signal_locked);
> > > > =C2=A0
> > > > +/**
> > > > + * dma_fence_check_and_signal_locked - signal the fence if it's no=
t yet signaled
> > > > + * @fence: the fence to check and signal
> > > > + *
> > > > + * Checks whether a fence was signaled and signals it if it was no=
t yet signaled.
> > > > + *
> > > > + * Unlike dma_fence_check_and_signal(), this function must be call=
ed with
> > > > + * &struct dma_fence.lock being held.
> > > > + *
> > > > + * Return: true if fence has been signaled already, false otherwis=
e.
> > > > + */
> > > > +bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
> > >=20
> > > I'm seriously considering to nuke all the unlocked variants of dma_fe=
nce functions and just make it mandatory for callers to grab the lock manua=
lly.
> > >=20
> >=20
> > You mean "nuke the *locked* variants.
>=20
> Sorry, that wasn't specific enough.
>=20
> What I meant was making the locked variants the default instead of the un=
locked ones.

Well, no :D

What you want to do is:
- Delete / deprecate the *locked* variants
- Force all users to take the fence lock manually, then use the (now
all unlocked) dma fence functions.

ACK?

>=20
> >=20
> > Why, though? Aren't they enough for most users?
> > I suppose you have all those subtle races in mind..
>=20
> Yeah, exactly that.
>=20
> >=20
> > > > +{
> > > > +	bool ret;
> > > > +
> > > > +	ret =3D dma_fence_test_signaled_flag(fence);
> > > > +	dma_fence_signal_locked(fence);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
> > > > +
> > > > +/**
> > > > + * dma_fence_check_and_signal - signal the fence if it's not yet s=
ignaled
> > > > + * @fence: the fence to check and signal
> > > > + *
> > > > + * Checks whether a fence was signaled and signals it if it was no=
t yet signaled.
> > > > + * All this is done in a race-free manner.
> > > > + *
> > > > + * Return: true if fence has been signaled already, false otherwis=
e.
> > > > + */
> > > > +bool dma_fence_check_and_signal(struct dma_fence *fence)
> > >=20
> > > So I think we should name this one here dma_fence_check_and_signal_un=
locked() and drop the postfix from the locked variant.
> >=20
> > postfix?
> >=20
> > Well, now, IDK. Can't we, for this series, keep the _locked() variant
> > so that it's congruent with all the other dma_fence code?
>=20
> Good point. That thought was not really related to this series here.

OK, then let's progress with this here for now.


P.

>=20
> >=20
> > And then later if you want to force manual locking you can add that
> > kernel-wide in a separate series, since it'll be a discussion-worthy,
> > bigger chunk of work.
> >=20
> > That's cleaner, and my series here won't prevent that once merged.
> >=20
> > >=20
> > > > +{
> > > > +	unsigned long flags;
> > > > +	bool ret;
> > > > +
> > > > +	spin_lock_irqsave(fence->lock, flags);
> > > > +	ret =3D dma_fence_check_and_signal_locked(fence);
> > > > +	spin_unlock_irqrestore(fence->lock, flags);
> > >=20
> > > Could this use guard(fence->lock, flags) ?
> >=20
> > guard? You mean a lockdep guard? Do you have a pointer to someplace in
> > dma_fence who does what you mean / want?
>=20
> E.g. like guard(spinlock_irqsave)(&fence->lock);
>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_check_and_signal);
> > > > +
> > > > =C2=A0/**
> > > > =C2=A0 * dma_fence_signal - signal completion of a fence
> > > > =C2=A0 * @fence: the fence to signal
> > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > index 19972f5d176f..0504afe52c2a 100644
> > > > --- a/include/linux/dma-fence.h
> > > > +++ b/include/linux/dma-fence.h
> > > > @@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void)=
 {}
> > > > =C2=A0#endif
> > > > =C2=A0
> > > > =C2=A0int dma_fence_signal(struct dma_fence *fence);
> > > > +bool dma_fence_check_and_signal(struct dma_fence *fence);
> > > > +bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
> > > > =C2=A0int dma_fence_signal_locked(struct dma_fence *fence);
> > > > =C2=A0int dma_fence_signal_timestamp(struct dma_fence *fence, ktime=
_t timestamp);
> > > > =C2=A0int dma_fence_signal_timestamp_locked(struct dma_fence *fence=
,
> > >=20
> >=20
>=20


