Return-Path: <linux-media+bounces-63655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vszzGfyJIGpi4wAAu9opvQ
	(envelope-from <linux-media+bounces-63655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:09:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D363B0D6
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:09:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kurd6kWA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63655-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63655-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C94C53046E85
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C519402BAE;
	Wed,  3 Jun 2026 20:07:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4E37C0FE
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:07:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517227; cv=none; b=HjWnUaAcoX1qvR8fYJmWnQ3juAeFNUUGu9I+6xUXTpsdhIbeoaKlNDrREQwWOXj6JFqJzCGDSlj+t6qT1dwUxf/uhOQ/udumZ6RmTLTrBGi7OaxrRdF2R14gbIcU4yzzSGRwQYfCj4rgqPsS8UCWdxu+rgIR3DrLfukUnyNHCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517227; c=relaxed/simple;
	bh=kkP7/N2KzJxp+G0D/7QLQRQyC+ILRlddwcRDWNiCgGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KxJU6zDciy7HaRxtSRvTK1o3iKlrwbVGZnSRIYrX77wDkbGmqUzyI5VzuNR0DmcQGUymPjDCjf/WYvNlClNhjVFwMy8buIKqtGuuyLc+hQhIy/4hwdbaIo3ByV01Yup9L4lpoWm3wggrwOsJVoGzM2XeTQ3pemWxeqSFFOE/O1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kurd6kWA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CB21F00893;
	Wed,  3 Jun 2026 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780517226;
	bh=yghsa0hjEwEirBB5gl0hVOLDV3trofVlReWLQ9p+5g0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kurd6kWA+NOgRiM9ntE9yHqFCFtN6cYdDi+RpDkdaJyx2iCb2NU8PZT83vrfgBPdp
	 aPNC2cwbfjcdEHEuUi9x0rIPqJfTTgrmC8aMI+DLxp0+86BanJi7faLxbwgNcMSJsU
	 5H+pGT+W7cwxo2Pu7sQ2vt9q74Gah8XG6kmTgr/Y+zHjKfl5/x2dE2jxs4kk4y8vKK
	 y3asbuhJKjS9zA3PyRfrMwrxZxKNDmtjEUXIq4ddox1glHK7d6P4xza/ZK4/h6UXJC
	 g6B5xvezdiNdWckKscd/gg8WJxVsM80gbM1oSuMHvJpMldt1jHGWmgmpQ1lmoqqdnR
	 JWTWXfhjb5FgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603195210.693856-6-lyude@redhat.com>
References: <20260603195210.693856-6-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:07:05 +0000
Message-Id: <20260603200706.18CB21F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63655-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:ojeda@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B81D363B0D6

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Potential double-drop vulnerability (Use-After-Free) if the inner =
value's Drop implementation panics.
- [Low] Incorrect use of inline annotations for abstraction functions.
- [Low] The top-level docstring for `SetOnce` is contradicted by the newly =
added `reset` function.
--

commit 7a51e89f6588dab952d801924de16b34983e224f
Author: Lyude Paul <lyude@redhat.com>

rust: sync: Add SetOnce::reset()

This function simply drops the contents of the SetOnce, given a mutable
reference - since that proves we have exclusive access to the SetOnce.
Additionally, update the invariants for SetOnce to make it clear as to why
this is safe.

> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> index 139cef05e935f..d6e4fc2695673 100644
> --- a/rust/kernel/sync/set_once.rs
> +++ b/rust/kernel/sync/set_once.rs
> @@ -15,7 +15,7 @@
>  ///
>  /// # Invariants
>  ///
> -/// - `init` may only increase in value.
> +/// - `init` may only increase in value, unless modified through a mutab=
le reference.
>  /// - `init` may only assume values in the range `0..=3D2`.

[Severity: Low]
Since this patch adds the ability to reset and repopulate the container,
does the top-level struct documentation for SetOnce also need updating?

The struct docstring guarantees that the container can be populated at most
once and remains populated by the same object for its lifetime, which
appears to be contradicted by the new reset() method.

[ ... ]

> @@ -110,17 +110,61 @@ pub fn copy(&self) -> Option<T>
>      {
>          self.as_ref().copied()
>      }
> +
> +    /// # Safety
> +    ///
> +    /// If this function returns `true`, `self` must be freed or `init` =
must be reset to `0`.
> +    unsafe fn drop_val(&mut self) -> bool {

[Severity: Low]
This isn't a bug, but according to the Rust subsystem coding guidelines,
should small abstraction functions like drop_val() be annotated with
the #[inline] attribute?

> +        if *self.init.get_mut() !=3D 2 {
> +            return false;
> +        }
> +
> +        let value =3D self.value.get_mut();
> +        // SAFETY: Via our type invariants, `init` =3D=3D 2 means `value=
` is initialized.
> +        unsafe { value.assume_init_drop() };
> +
> +        true
> +    }
> +
> +    /// Unset the [`SetOnce`].
> +    ///
> +    /// After this function is called, the [`SetOnce`] is empty and unin=
itialized. This function is
[ ... ]
> +    pub fn reset(&mut self) -> bool {

[Severity: Low]
This isn't a bug, but should reset() also have an #[inline] annotation
following the subsystem guidelines for small abstraction functions?

> +        // SAFETY: We write `0` to init below if this returns true.
> +        let dropped =3D unsafe { self.drop_val() };
> +        if dropped {
> +            // INVARIANT:
> +            // - We set `init` back to 0 through a mutable reference.
> +            // - We dropped `value` above.
> +            *self.init.get_mut() =3D 0;
> +        }
> +
> +        dropped
> +    }

[Severity: High]
Could this code sequence lead to a double-drop use-after-free if the
inner value's drop implementation panics?

If drop_val() is called and value.assume_init_drop() panics, the process
will unwind. Because *self.init.get_mut() =3D 0 is only executed after
drop_val() returns successfully, init will remain 2.

During the unwind, the SetOnce drop implementation would execute:

SetOnce::drop() -> drop_val()

Since init is still 2, drop_val() would call value.assume_init_drop()
again on the already-dropped memory.

>  impl<T> Drop for SetOnce<T> {
> +    #[inline(always)]
>      fn drop(&mut self) {

[Severity: Low]
This isn't a bug, but the Rust subsystem guidelines note that
#[inline(always)] should only be used for functions utilizing
build_assert!() that depend on function parameters.

Should this just be a standard #[inline] attribute instead?

> -        if *self.init.get_mut() =3D=3D 2 {
> -            let value =3D self.value.get_mut();
> -            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
> -            // contains a valid value. We have exclusive access, as we h=
old a `mut` reference to
> -            // `self`.
> -            unsafe { value.assume_init_drop() };
> -        }
> +        // SAFETY: We are dropping this value.
> +        unsafe { self.drop_val() };
>      }
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D5

