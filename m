Return-Path: <linux-media+bounces-63656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p91gAa2JIGpR4wAAu9opvQ
	(envelope-from <linux-media+bounces-63656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:08:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266263B0BA
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JSukIaqG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63656-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63656-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 257B8301B300
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0C33FCB3E;
	Wed,  3 Jun 2026 20:08:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0454028D1
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:08:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517285; cv=none; b=Di+kz9rq3zuEu2VjxFh7zw9BQwcCSv9fpGpJffiIQkjb7G7LpYH3PWU9GGSTrHoYQrhYeaaIjB3UzMJGVkbHk6gRkc7SZjq2EmEQzjAMHyB+USn27SHaLo4jlUWLGoUpBMa23VdcJYp7gy2APJNY/6aO6lIyMAgdOHuNL6UMDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517285; c=relaxed/simple;
	bh=nEDeT2G5pDn0Aa9f9UmyJwGRZqGbHpJfcLl/tnO7IzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=drB6rOgApfie1acDeAVd1gg8Vc+46Iq2tMjrm/W77wUGupFpsjKvqRebYrlp4AiNwGVzfMmhZiqsFyLNZG6rPVxmu3cn0khk9XVgExglmdpC75JqyFz2+Ft4hdE5Xkb67TN9/9SanFkrOc75LyxYNN8cHr30+7fW3RaH2o9lZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSukIaqG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA33F1F00893;
	Wed,  3 Jun 2026 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780517282;
	bh=uQSPaZlgJmI6XFx/JJegYrSbYMwFyKt38QNFbl9JLxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JSukIaqG1j8qO/okjkVoE1QJOayRq/wiNyxFLRzi3msWL6OjWlO4P1ARmQLT+irBb
	 LaphjHqGafCp8wik1VvoIbpo3XGU0D8qZXfW19UvtsBiZn+pzkWBHZbSjMubenwudN
	 HjUlUrmqOhnte7xp4aIv8fFuxNz5H+8psEk3XGF86lxe5r4UdUkx2SOmPaZtkvoxaM
	 DpYQwqn5/Kbr+Sc5ZKJnsuGp+rO3DnYwAjDW6soHGgZXs4bwmfS05VAqlJLoRgP2eQ
	 hCsiBv1ncLuN8b+WyQ56x4ocy35TsoPPkoACryZ8nyzKhde7ZDXoaXK8RDmxh8wsKE
	 pkuNuaQ/EHwGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260603195210.693856-5-lyude@redhat.com>
References: <20260603195210.693856-5-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:08:01 +0000
Message-Id: <20260603200801.DA33F1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63656-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0266263B0BA

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The patch adds a new invariant but fails to provide a corresponding=
 `// INVARIANT:` comment in the constructor `Registration::new`.
- [Low] The newly added invariant text incorrectly states that the object i=
s 'bound to a device'.
- [Low] The `SAFETY` comment in `as_ref` fails to address the new `Device<B=
ound>` guarantee.
--

commit dc0de65744def0c2e91abb89c0b847d0fc4819f1
Author: Lyude Paul <lyude@redhat.com>

rust: faux: Allow retrieving a bound Device

This commit updates the Registration's AsRef implementation to return a
device::Device<device::Bound> instead of device::Device. This reflects
the guarantee that the Registration object acts as proof that a driver
is bound to the device.

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

[Severity: Low]
Is this description completely accurate? Conceptually, devices are bound
to drivers, not to devices. The commit message states "a driver is bound
to the device," so could this comment be updated to say "bound to a driver"
instead?

[Severity: Low]
Since a new invariant was added here, does Registration::new() also need a
new // INVARIANT: comment explaining why this condition holds, to match
the Rust subsystem coding guidelines?

rust/kernel/faux.rs:Registration::new() {
        ...
        // The above function will return either a valid device, or NULL on=
 failure
        // INVARIANT: The device will remain registered until faux_device_d=
estroy() is called, which
        // happens in our Drop implementation.
        ...
}

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

[Severity: Low]
Does this safety comment need to be updated to address the new Bound contex=
t?

The device::Device::from_raw() documentation requires the caller to justify
the chosen DeviceContext (Bound), ensuring the device is bound to a driver
for the duration of the reference. While faux_device_create() in C guarante=
es
driver binding upon success, the safety comment currently doesn't document
why this new requirement is met.

>          unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).=
dev)) }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D4

