Return-Path: <linux-media+bounces-63137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNT3FlD4GmrH+AgAu9opvQ
	(envelope-from <linux-media+bounces-63137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:46:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A622860D91D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA0883019C8D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BEA2D3225;
	Sat, 30 May 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDJFDxN6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1B250BEC
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780152340; cv=none; b=Gj+/buqpvFeOGa0BQTcPB9rsEJpeyMEmuwkO5heWplAEffifuYdc2ZnRY0X/ZRHdk1mHqZUPu6Xk5tXMgyQKK/1uXdbQsXv6bJt3Ab+0reVhEkdYWbaPiSA04RbQqdhNmSQSQt4dkQslzinUD9uC3YBFpAmBaNaffFfOULoJOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780152340; c=relaxed/simple;
	bh=ozUwYXcEFWxu04+fqtxivLHvapi1adEAQ2Jkxo1jkno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J7g8mqeb75xk4tjT/35QF03v1xVcSzN74Xyv4CrWOSwSd+69Fg+S0iAatNGYZaVjM/hAGNypbhOl1eBA1w6PKoztpOmiH1SAZKSDs/31jD6I+byi0qaasq9RiGcsvRxrU7BQqhUOCHaIMqZqUM9iDOhBJpnIxar8N6+A2RswDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDJFDxN6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3EA1F00893;
	Sat, 30 May 2026 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780152339;
	bh=Z3IVHgXppubXihmyJFwsCA4Hb8miO0ZRxVzScYjlROs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fDJFDxN65HddEeVgNzWTRefkuaUMXZUrqVkghzxmiqWvKgUAaTKA3bnt3yKrXhrjK
	 +J03AYL0UPuc6Io1ArFU1/CFNHcGTWfvvcnA2K9vxW+p3mC0x2s/I4ssjiGoDYIYum
	 IksmYwL072Gb3r/SjfIK2LRTyWPOPBiOJxb15rBIXzC0+98PGmhAaBjwqfKULQkl+e
	 XEl2oI4e8DCpkcJQqWvjSBva2aJkXLcchz0zmcfYyl+bgVKt08ic15sdJYKdOwtIjL
	 XeG5BrNi4VI1/WHv6Q5+o6Sobo4tl/UjDfCmB34g5qqQ1BxE7SbMEgosQeGhwIBF0V
	 x8YXU1OkOaJeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] rust: types: implement ForeignOwnable for ARef<T>
Reply-To: sashiko-reviews@lists.linux.dev
To: "Philipp Stanner" <phasta@kernel.org>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260530143541.229628-3-phasta@kernel.org>
References: <20260530143541.229628-3-phasta@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:45:38 +0000
Message-Id: <20260530144538.DF3EA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63137-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: A622860D91D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#[inline]` annotations on small forwarding trait methods i=
n `ForeignOwnable` implementation for `ARef<T>`.
--

commit 62543d419c62c8206acbd8b76f07e5198b71442e
Author: Danilo Krummrich <dakr@kernel.org>

rust: types: implement ForeignOwnable for ARef<T>

This commit implements ForeignOwnable for ARef<T>, making it possible for C
code to own an ARef<T>. It sets BorrowedMut to &T to match the shared
ownership semantics of the underlying reference-counted type.

> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index 9989f56d06052..82907383c44b5 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs

[ ... ]

> +    type Borrowed<'a> =3D &'a T;
> +    type BorrowedMut<'a> =3D &'a T;
> +
> +    fn into_foreign(self) -> *mut c_void {

[Severity: Low]
This isn't a bug, but should this method be annotated with #[inline]?
According to the Rust subsystem guidelines, small forwarding functions in
abstractions should be annotated with #[inline].

> +        ARef::into_raw(self).as_ptr().cast()
> +    }
> +
> +    unsafe fn from_foreign(ptr: *mut c_void) -> Self {

[Severity: Low]
This isn't a bug, but should from_foreign() also have an #[inline]
annotation since it is a small wrapper method?

> +        // SAFETY: The safety requirements of this function ensure that =
`ptr` comes from a previous
> +        // call to `Self::into_foreign`.
> +        let ptr =3D unsafe { NonNull::new_unchecked(ptr.cast()) };
> +
> +        // SAFETY: `ptr` came from `into_foreign`, which consumed an `AR=
ef` without decrementing
> +        // the refcount, so we can transfer the ownership to the new `AR=
ef`.
> +        unsafe { ARef::from_raw(ptr) }
> +    }
> +
> +    unsafe fn borrow<'a>(ptr: *mut c_void) -> &'a T {

[Severity: Low]
This isn't a bug, but similar to the above, should borrow() be annotated
with #[inline]?

> +        // SAFETY: The safety requirements of this method ensure that th=
e object remains alive and
> +        // immutable for the duration of 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> &'a T {

[Severity: Low]
This isn't a bug, but does borrow_mut() need an #[inline] annotation here
as well?

> +        // SAFETY: The safety requirements for `borrow_mut` are a supers=
et of the safety
> +        // requirements for `borrow`.
> +        unsafe { <Self as ForeignOwnable>::borrow(ptr) }
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530143541.2296=
28-2-phasta@kernel.org?part=3D1

