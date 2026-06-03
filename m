Return-Path: <linux-media+bounces-63657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tm9EJfWJIGpg4wAAu9opvQ
	(envelope-from <linux-media+bounces-63657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:09:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C663B0CE
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:09:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Luk5+5Yt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63657-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63657-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44BA1307BC30
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0E384CD6;
	Wed,  3 Jun 2026 20:09:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E892B3FFADB
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517359; cv=none; b=RmZjZz4aHwhtZUHHNDvXaXN/cbrhQ/y79gh8iAhIq7zvNRxuDbqSJMcpELM3I6S8zC3vI811YEdKDUnj6mU5/WWVoW19D0KbBUPokC/sU29csapX1Rxd4D80SfknOIEBFj5EgOX1rjsw3dou7o9wSnkWmiPAMfUAj9iKkKfVA1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517359; c=relaxed/simple;
	bh=guXqLo/f3sruaHQCZxxXTIWE90BVsJC6RT+x5fJZmxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X2Y9pOIHpIz772Lq+QEQvj8bdqe+JmTNkiLmjH+OZNkJCsnWim/mlx3utJpKCeemfix1Md/LhjYqJPH1K0l7m6Ob2NZMOYmK4EGy14qLYICu3OASHpILEs+Gm0lNo73ztGBJQqgusEzXiH3kztCLXfYQf5I9Vgmxg9CPgSh0A9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Luk5+5Yt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6160D1F00898;
	Wed,  3 Jun 2026 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780517358;
	bh=TS9gw5sig3r6AEW+16+3ihjUnBCsJZH8VLOYIKHHf1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Luk5+5Ytif7WabMmotZjvh32fzVOhc5mCBWE6gge3fMvTbhbY17TncKUu0RdEu9JU
	 SX4cbE1lfbBseTgY3TSZ//p7Wh10aPAQxagUPOUg+3xqgodS8gcFnsMs1m12nk2Y0d
	 5Hh536Kkb/oP0swbOsvP7OpgZyKFF45+CtCNjCqYF4LcTEQ9j/PO+iK7yqouPtf0AE
	 DvvSR1zLf+DD2J5cHG2ct893rb3EsEkh4Fx9jrHFRxIl78xUKzt2TAPYsoOL6ttvvH
	 lq2e9VTqVYl8ueITxqNv/fY1kpsjBoTCZVqUvtO+x3WgSBcAx3pYYwH6e6l4SGX8CD
	 kHMcSUPAUVvtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 2/6] rust: drm: gem: shmem: Add DmaResvGuard helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260603195210.693856-3-lyude@redhat.com>
References: <20260603195210.693856-3-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:09:17 +0000
Message-Id: <20260603200918.6160D1F00898@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63657-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E4C663B0CE

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `DmaResvGuard` implicitly implements `Send`, allowing the lock to =
be sent to and unlocked by a different thread, violating kernel locking rul=
es.
- [Medium] `DmaResvGuard` lacks the `#[must_use]` attribute, which can lead=
 to accidental immediate lock drops.
- [Low] Incorrect use of `#[inline(always)]` instead of `#[inline]` on abst=
raction functions.
--

commit 35ca0f9ce4df1005935e123463429a164cf640a5
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: shmem: Add DmaResvGuard helper

Just a temporary holdover to make locking/unlocking the dma_resv lock much
easier.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 084b798ce795b..650c34dd8b7a4 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs

[ ... ]

> @@ -244,3 +247,29 @@ impl<T: DriverObject, C: DeviceContext> driver::Allo=
cImpl for Object<T, C> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shme=
m object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have s=
uch bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext =3D Registered=
>(&'a Object<T, C>);

[Severity: High]
Does `DmaResvGuard` implicitly implement `Send`, allowing the lock to be
acquired in one thread, sent to another thread, and unlocked there?

Since `Object<T, C>` implements `Sync`, the shared reference `&'a Object<T,=
 C>`
is `Send`. However, `bindings::dma_resv_unlock` internally calls
`ww_mutex_unlock()`, which requires the mutex to be unlocked by the exact
same task that locked it.=20

Should this struct include `NotThreadSafe` (or `PhantomData<*mut ()>`) to
ensure it cannot be sent across threads?

[Severity: Medium]
Could this struct also be annotated with `#[must_use]`?=20

Without it, if a caller writes `DmaResvGuard::new(obj);` instead of=20
`let _guard =3D DmaResvGuard::new(obj);`, the lock is acquired and immediat=
ely
released at the end of the statement, leaving the rest of the scope
unprotected without triggering a compiler warning.

> +
> +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but according to the Rust coding guidelines, shouldn't sm=
all
abstraction functions or binding wrappers like this be annotated with `#[in=
line]`
rather than `#[inline(always)]`?=20

`#[inline(always)]` is generally reserved for functions using `build_assert=
!()`
that depend on function parameters.

> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T, C>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `=
object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_m=
ut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject, C: DeviceContext> Drop for DmaResvGuard<'a, T,=
 C> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but similar to the new() function above, should this
be `#[inline]` instead of `#[inline(always)]`?

> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation=
 of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D2

