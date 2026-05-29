Return-Path: <linux-media+bounces-63066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCOoCU7kGWrrzggAu9opvQ
	(envelope-from <linux-media+bounces-63066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 21:09:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8390607B98
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 21:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA0D23088CBB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6913C343893;
	Fri, 29 May 2026 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4DXPHQW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86B367B83
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 18:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780081064; cv=none; b=Kz0tKeJpuxpzpY6aixmivAvuyOJQmtJv+Wps1ekKTO1RrKxlsIDFYwWFRZ2IL09G6a59YKk9ibZk17SJkE9YMwZ4xxHSpxMlU5C4TORZQ58J2DdjMyIXn71tDDdUjPSf6NYvCRPwNQ4u5FPIrZeclbcGpmGxH9Gq/EmudPJOlZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780081064; c=relaxed/simple;
	bh=hP7ranI3lmQbKW/j/c1DAndIAJ6Z3YQaS6SiK/HVo58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oI2ckYtoat4t7JCepsKQEnTLWs1I2YvZ35rjhsz/egOQicAmnHiB5VVrjSI07Zv+01m44jvugOxMTike//WIh9/WT0t5yGJdREw3xBJgV1kodKw+GLJJBUr0u8C6ouG448iYLMC3KvpOCoWI8ezYRkCGoIaXtwL42MwWY+XyiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4DXPHQW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461FC1F00893;
	Fri, 29 May 2026 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780081063;
	bh=X45ZnyQjSxPE/6sn2Pjm3fzXiJYMMExzDFN/s/GiS4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4DXPHQWKWL4ug90ejxdBus2EjaFKHYA5artCEWFLnhLQWdC85Iim2JotdUttSt+I
	 q4/puCon3wU7qVkBal2FgxvTjREbw++0wws5pr9A037ZWz1DjY+KwpbwnXQMpksBWq
	 Nj8etd8NB70AaEVAfz7qT1SXeq2OMXm12iqiWGl1Zr5NCx+xS5elt25hGr49hEg6GR
	 1aADq+YZCCJTQgWJAEpGaR7HEsEsvoKJ0kXprklnDQ69hqePlqKxPoUmnnkoYpEOyG
	 43umkNWVDnG06C8tsdr6srx1M67oUJKYxjyS6/PomNfFFociU2lDZT/t+E6Q7y7EtK
	 JH0i/8hoJXZWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/6] rust: drm: gem/shmem: Add DmaResvGuard helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260529183702.677677-3-lyude@redhat.com>
References: <20260529183702.677677-3-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 18:57:42 +0000
Message-Id: <20260529185743.461FC1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63066-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: B8390607B98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DmaResvGuard implicitly implements Send, violating kernel mutex se=
mantics.
- [Low] Incorrect usage of `#[inline(always)]` instead of `#[inline]` on ab=
straction methods.
--

commit fc13853f3e1172f001c387fb113a67682cd08b9d
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem/shmem: Add DmaResvGuard helper

This commit introduces a temporary DmaResvGuard helper struct to make
locking and unlocking the dma_resv lock for GEM shmem objects easier.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 8b7de136ab1f9..a116b0752e46a 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs

[ ... ]

> @@ -233,3 +236,29 @@ impl<T: DriverObject> driver::AllocImpl for Object<T=
> {
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
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

[Severity: High]
Does this implicitly implement the Send trait if Object<T> implements Sync?

Since this guard drops a kernel ww_mutex in its Drop implementation, moving
the guard to a different thread and unlocking it there would violate the
kernel mutex API contracts. The task that acquires the lock must be the same
task that releases it, otherwise it triggers a kernel warning or panic.

Should this struct include a PhantomData<*mut ()> or
kernel::types::NotThreadSafe marker to explicitly opt out of being Send?

> +
> +impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but does this require the inline(always) attribute?

According to the Rust subsystem coding guidelines, inline(always) should
only be used for functions utilizing build_assert!() that depend on
function parameters. Small abstractions that merely forward to C bindings
should use the standard inline attribute.

> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `=
object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_m=
ut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
> +    #[inline(always)]

[Severity: Low]
This isn't a bug, but similarly here, could this use the standard inline
attribute instead of inline(always)?

> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation=
 of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D2

