Return-Path: <linux-media+bounces-63096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s8H+KT1yGmrJ4QgAu9opvQ
	(envelope-from <linux-media+bounces-63096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:14:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D060B4E4
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70BD9304D730
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 05:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB12A34E779;
	Sat, 30 May 2026 05:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKPn95zq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54527874F
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 05:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118071; cv=none; b=BQxHsCaElkiPLSkHQzGxRsJRlfvM4BAzDuWfq7ajoSpw1MFLpu9Fw3fy5pL2AuMd9AYKv6pSaflZJd2LTdDOlIVtz6BfzmtGNLV76XKqS62dB0gXFu4zzmgU9yTH+rhp1PwF8Rn2uyQndWF9YqiZWKgYY3AsWFHx3D71E0flWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118071; c=relaxed/simple;
	bh=fBM2DX7ysOsd5qnhVmf9PkK07JkAUPJ/88RZ+hN7zBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CpECqGthOJ1M/M/WGD6rtcol9u6qVdHi4c4T1kCWTLO3CpdVeLI3jTn1Yx+HeQoDhFZVxsK5ruQha0YbUhagvKkHwbrh5bz28d2IaPeBZ3K8HPFcv7WQHhM8sReNPE2QUpTzXk42ojsVPyeh1U2fqoPIOMFv5c8NjE+B4leIre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKPn95zq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829BC1F00893;
	Sat, 30 May 2026 05:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780118069;
	bh=RZAtlADttIM0GVN9i7tDNEq9k9IZ+XMpchh80kjF9/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NKPn95zq6/7wb7XqbZO0sXOOdzSWAUhigEiGUYqVPEDcuGTNmpTTgWKkCHyfwQ9RR
	 3ZaSfIRMUugBPtdIYsAT1gG20QVpVX+2tIAO6raIYM0BUxAcwRfKrDVD2Y1Dr1CUzv
	 cF8J2myZ1mNtfaakHkdL4O/s76XaYnNWEHQ71IVVjILbgbGKGeM0stTne65myUhdVF
	 vtm9XKYuvysi9+a8UWGtpNZkELF0+Z7CaennLIoLjTd2FTyB7n1WT5wG1WQPZ6t4F2
	 35EOnLj3z4UbXr60+ymuMDjUfO7KuPGD3Qn6VaAqBQBX3ivgrLjfbs6MR8szDeUYtW
	 5/iWmkNmbK8rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/6] rust: faux: Allow retrieving a bound Device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260529183702.677677-5-lyude@redhat.com>
References: <20260529183702.677677-5-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 05:14:29 +0000
Message-Id: <20260530051429.829BC1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63096-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: E80D060B4E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `Registration` invariant lacks an `// INVARIANT:=
` justification at construction, contains a semantic typo, and the correspo=
nding `// SAFETY:` comment in `as_ref()` was not updated to justify the str=
icter `Device<Bound>` context.
--

commit 17a5a14d96ef7eb6b2fce7469b897ce1072bac56
Author: Lyude Paul <lyude@redhat.com>

rust: faux: Allow retrieving a bound Device

This commit updates faux::Registration to implement AsRef for the stricter
Device<Bound> context rather than the default Device. It also adds a new
invariant to document that Registration is proof of the bound state.

> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> index 43b4974f48cd2..e0856b2964a2c 100644
> --- a/rust/kernel/faux.rs
> +++ b/rust/kernel/faux.rs
> @@ -25,7 +25,8 @@
>  ///
>  /// # Invariants
>  ///
> -/// `self.0` always holds a valid pointer to an initialized and register=
ed [`struct faux_device`].
> +/// - `self.0` always holds a valid pointer to an initialized and regist=
ered [`struct faux_device`].
> +/// - This object is proof that the object described by this `Registrati=
on` is bound to a device.

[Severity: Medium]
This isn't a bug, but there appears to be a semantic typo in the invariant=
=20
wording. The documentation states "bound to a device", but the Registration
object represents the device itself. Could this be corrected to "bound to a
driver" to match the commit message?

Also, since a new invariant was added to Registration, does
Registration::new() need an updated // INVARIANT: comment to explain why
this new invariant is satisfied at construction?

According to the Rust subsystem guidelines, when a struct has an Invariants
section, its construction site should document why the invariants hold:

rust/kernel/faux.rs:Registration::new() {
    ...
    // INVARIANT: The device will remain registered until faux_device_destr=
oy()
    // is called, which happens in our Drop implementation.
    Self(ptr)
}

>  ///
>  /// [`struct faux_device`]: srctree/include/linux/device/faux.h
>  pub struct Registration(NonNull<bindings::faux_device>);

[ ... ]

> @@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
>      }
>  }
> =20
> -impl AsRef<device::Device> for Registration {
> -    fn as_ref(&self) -> &device::Device {
> +impl AsRef<device::Device<device::Bound>> for Registration {
> +    fn as_ref(&self) -> &device::Device<device::Bound> {
>          // SAFETY: The underlying `device` in `faux_device` is guarantee=
d by the C API to be
>          // a valid initialized `device`.
>          unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).=
dev)) }

[Severity: Medium]
Does the // SAFETY: comment here need to be updated to justify why returning
the stricter Device<Bound> context is valid?

The current comment justifies instantiating a Device from a raw pointer, but
does not explain how the caller is guaranteed that the device is actually in
the Bound state, which the device abstraction delegates to the caller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D4

