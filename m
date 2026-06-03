Return-Path: <linux-media+bounces-63659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VvEaMLWKIGqB4wAAu9opvQ
	(envelope-from <linux-media+bounces-63659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:12:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91763B0ED
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:12:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I4KvvT4m;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63659-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63659-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C61930621A7
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF371400E07;
	Wed,  3 Jun 2026 20:12:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F92FC898
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:12:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517528; cv=none; b=C5NQR9PlTacfderT2qnLPpWFLFpcVfh2tx9bjJOK/1cy1zuYmAGxKwyWnWibkyJ/Rq3TF6fv7QjDn53D2fl3m/HLq3ioU5sQMxn55DFy8z78mPiitZ/YehbOkNTbiQcl1dnpKAMo/jArnTrTywZbn7NRtZYSqSX3EmeedSg/apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517528; c=relaxed/simple;
	bh=Sj52kvC3qySkOiFqvGX7DcZ0jiCbUArH0p1n7RwwIlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oA9s8qJ4nGw3ILXQxV+x/H8qeUqPaG+sYMsETdBp5d92f5meTwQNAxAGOlv3E6sJdVfZKZFlhhwNjEzKkoa0OATKEUdJNd7V0+BSwrcsZDvH83Fox8biJGL6ECc6tIMtUAsS0B51uLfRqyFIO48fkLba4XTwjlP0C4Vofl/UWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4KvvT4m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95721F00893;
	Wed,  3 Jun 2026 20:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780517527;
	bh=uTmkFJOI5OW01oTAbxR1CUU7b0YJAbjQdmCctl5t3SU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4KvvT4mWTKHd8IULlwhyEAkp+rOpNiroanrATpwWc9if0yBLsMrX2/cfBnBm33Jh
	 KJlZWJvLZFAdI9m2MHeeyLu1jkDGyPOON0uhBIFP6CXq7xJPSFXObw39EQryR/+3tU
	 NNf79npkTlfAOs8AgZodMsueAo6Rvv3cdMtvbpB8gHxn3r38D8PzWieBH910jZylNG
	 +ZgR8HQPdkDHiAM5RNYlrhH6Wq4mZT7K0m7X5L0V+6m0hRTx+Lzb74Pm6+vIvBfHIJ
	 bQNlvi+i2KJUlkTLjCcgB+ne8RcNln/Mfw9FScDlmYyPBTyGAhOeyS3mHwveODIsdT
	 284AYNrGGV1iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 6/6] rust: drm: gem: Introduce
 shmem::Object::sg_table()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603195210.693856-7-lyude@redhat.com>
References: <20260603195210.693856-7-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:12:06 +0000
Message-Id: <20260603201206.C95721F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63659-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:ojeda@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E91763B0ED

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] `SGTableMap::drop` unconditionally frees the scatter/gather ta=
ble, which corrupts memory for imported dma-buf GEM objects.
- [Critical] Concurrent device unbind and GEM object destruction causes a U=
se-After-Free of the GEM object and its dma_resv lock in `SGTableMap::drop`.
- [High] `SGTableMap` fails to pin the shmem GEM object backing pages, expo=
sing the SG table to being purged by the shrinker and causing a NULL pointe=
r dereference. It also leaks the `pages_use_count` on drop.
--

commit 8870abbe2654a7715fcd51335a14b62f57e22680
Author: Lyude Paul <lyude@redhat.com>
rust: drm: gem: Introduce shmem::Object::sg_table()

This commit introduces a Devres-managed SGTableMap to ensure that
scatterlist mappings for GEM shmem objects are released upon driver
unbind. It adds the sg_table() method to shmem::Object which is intended
to pin the object and return its scatter/gather table.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 1f05a5bc5fe66..dff90771eb34a 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
[ ... ]
> @@ -189,18 +210,25 @@ extern "C" fn free_callback(obj: *mut bindings::drm=
_gem_object) {
>          // - DRM always passes a valid gem object here
>          // - We used drm_gem_shmem_create() in our create_gem_object cal=
lback, so we know that
>          //   `obj` is contained within a drm_gem_shmem_object
> -        let this =3D unsafe { container_of!(obj, bindings::drm_gem_shmem=
_object, base) };
> -
> -        // SAFETY:
> -        // - We're in free_callback - so this function is safe to call.
> -        // - We won't be using the gem resources on `this` after this ca=
ll.
> -        unsafe { bindings::drm_gem_shmem_release(this) };
> +        let base =3D unsafe { container_of!(obj, bindings::drm_gem_shmem=
_object, base) };
> =20
>          // SAFETY:
>          // - We verified above that `obj` is valid, which makes `this` v=
alid
>          // - This function is set in AllocOps, so we know that `this` is=
 contained within a
>          //   `Object<T, C>`
> -        let this =3D unsafe { container_of!(Opaque::cast_from(this), Sel=
f, obj) }.cast_mut();
> +        let this =3D unsafe { container_of!(Opaque::cast_from(base), Sel=
f, obj) }.cast_mut();
> +
> +        // We need to drop `sgt_res` first, since doing so requires that=
 the GEM object is still
> +        // alive.
> +        // SAFETY:
> +        // - We verified above that `this` is valid.
> +        // - We are in free_callback, guaranteeing we have exclusive acc=
ess to `this`.
> +        unsafe { &mut (*this).sgt_res }.reset();

[Severity: Critical]
Does this leave a window for a use-after-free if the device unbinds
concurrently?

If the devres subsystem is already running SGTableMap::drop() in another
thread during device unbind, sgt_res.reset() could silently fail to remove
the action. The callback would then proceed to free the GEM object while
SGTableMap::drop() is still dereferencing and locking it.

> +
> +        // SAFETY:
> +        // - We're in free_callback - so this function is safe to call.
> +        // - We won't be using the gem resources on `this` after this ca=
ll.
> +        unsafe { bindings::drm_gem_shmem_release(base) };
[ ... ]
> +impl<T: DriverObject, C: DeviceContext> Drop for SGTableMap<T, C> {
> +    fn drop(&mut self) {
> +        // SAFETY: `obj` is always valid via our type invariants
> +        let obj =3D unsafe { self.obj.as_ref() };
> +        let _lock =3D DmaResvGuard::new(obj);
> +
> +        // SAFETY: We acquired the lock needed for calling this function=
 above
> +        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_sh=
mem()) };

[Severity: Critical]
Is it safe to unconditionally free the scatter/gather table here?

If the GEM object was imported from a dma-buf, the scatter/gather table
belongs to the exporter. Calling __drm_gem_shmem_free_sgt_locked() directly
without checking drm_gem_is_imported() seems like it might illegally free
the exporter's memory.

[Severity: High]
Could this drop implementation also leak the pages_use_count?

Calling __drm_gem_shmem_free_sgt_locked() alone doesn't seem to drop the
page use count acquired during SGTableMap::new(). Should this also call
drm_gem_shmem_put_pages_locked() to balance the counts?

> +    }
> +}
> +
> +impl<T: DriverObject, C: DeviceContext> SGTableMap<T, C> {
> +    fn new(obj: &Object<T, C>) -> impl Init<Self, Error> {
> +        // INVARIANT:
> +        // - We call drm_gem_shmem_get_pages_sgt_locked below and check =
whether or not it
> +        //   succeeds, fulfilling the invariant of SGTableMap that the o=
bject's `sgt` field is
> +        //   initialized.
> +        // SAFETY:
> +        // - `obj` is fully initialized, making this function safe to ca=
ll.
> +        from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(obj.=
as_raw_shmem()) })?;

[Severity: High]
Does this expose the object to being purged by the DRM LRU shrinker?

The Object::sg_table() documentation mentions this will pin the object in
memory, but drm_gem_shmem_get_pages_sgt() only increments the
pages_use_count, not the pages_pin_count. If userspace marks the object as
MADV_DONTNEED, the shrinker could purge it and set shmem->sgt to NULL.

Could this lead to a NULL pointer dereference later in SGTableMap::drop()
when it passes the pointer to __drm_gem_shmem_free_sgt_locked()?

> +
> +        Ok(Self { obj: obj.into() })
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D6

