Return-Path: <linux-media+bounces-63844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BCrsAiXVIWqGPQEAu9opvQ
	(envelope-from <linux-media+bounces-63844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:42:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF1F642FB2
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="iw8f/6Gl";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63844-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63844-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7353B303FF0F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 19:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E6D3BFAD3;
	Thu,  4 Jun 2026 19:40:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B713A7F72
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 19:40:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602001; cv=none; b=KH06oKluSIsxgd7quHkrN2GgI7Edt5xoP3CBsg+gs7oz7dl5y2uDoyEhkIuJqGgkBacBPCD45NNk6YA1T3Rlh9MDAiFZfaTtzT6DDHtRwvA91DEhEv/lR1adXX/pFVQiwUeo4nV1NFf2ZU9IHsvbmBFmOvKtT+d+1U9EbhEb1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602001; c=relaxed/simple;
	bh=XAAru9+CjZE4Gdlvlt4EdVshQ3FTxYs+HQYWcWMEul4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EiyZHNMsbv1lv6FJkrIhmDU3P5WwKYZ3vrvU0v7gDHr86/p6mmrjvg9HazDo9ScU6lnkp8v1lbvAn/e0/bvveBenUSpDVFNvo9iXOqDHhwxFIZgdf5/idAx0vVEuUceFOv6oMZT8TyXr25Y6VlvK8M5TACOl/N7S6s6ZjMrsIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw8f/6Gl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1061F00898;
	Thu,  4 Jun 2026 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780602000;
	bh=JUZGVwwj4HQZStIJDtddQfc5ylHGqjVREYOjtLPaXRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iw8f/6GlvMuFSLrZJ89zyVjBcqd9EsmTKjn+ytycT7Ij5oWhuvkaR/itO7ELGTYyD
	 vzYdVKbTQpzBl+T7H/52KMq68K3GEKqktO2PkhjLPQFLaCkr5J0b1oG4VjuvLsGEaB
	 EN6VsXXtI//a2UtPEFTKdJL/CLex4VED0Gq/6GGXsz22hCQ+mQgnAvT37Dvb2FuLht
	 UjjTxMpUgDLfovIMIvjM85lZBX0bPTpMVO1M7cfFkZ0OQliuechBC7bvHLqCbsBkVz
	 pVWTED0GLdDZ6K2QpKXVu2Rar+ZYsve4YNPp0Kckbx4LdMuC1AYiqfoIy68+XNFoX0
	 VWsITjHIAyNyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 3/4] rust: faux: Allow retrieving a bound Device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604192740.659240-4-lyude@redhat.com>
References: <20260604192740.659240-4-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 19:39:59 +0000
Message-Id: <20260604194000.3F1061F00898@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63844-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CF1F642FB2

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `Registration` struct's `# Invariants` documentation was update=
d with a new invariant, but the `// INVARIANT:` comment in the `Registratio=
n::new` constructor was not updated to explain why this new invariant is sa=
tisfied.
- [Low] Typo in the new type invariant comment: it incorrectly states the o=
bject is 'bound to a device' instead of 'bound to a driver'.
--

commit d541fc9c1199eb4e3a390c6348b6b03f9492aacc
Author: Lyude Paul <lyude@redhat.com>

rust: faux: Allow retrieving a bound Device

This commit updates faux::Registration to implement AsRef for a bound
device instead of a generic device. It also adds a new invariant to the
Registration struct to document that the object is proof of a driver being
bound to the device.

> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> index 43b4974f48cd2..20ab638885354 100644
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
This isn't a bug, but there appears to be a typo here. The commit message
states that the Registration object is proof that "a driver is bound to the
device". Should this invariant say it is bound to a "driver" instead of
a "device"?

[Severity: Low]
Since a new invariant was added to the documentation here, does the
// INVARIANT: comment in Registration::new() also need to be updated to
explain why this new invariant is satisfied?

Currently, the comment in Registration::new() only explains the first
invariant:

    // INVARIANT: The device will remain registered until faux_device_destr=
oy()
    // is called, which happens in our Drop implementation.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604192740.6592=
40-1-lyude@redhat.com?part=3D3

