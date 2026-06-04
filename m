Return-Path: <linux-media+bounces-63789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E9S5Ea+AIWo+HgEAu9opvQ
	(envelope-from <linux-media+bounces-63789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 15:42:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A216406D4
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 15:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IBHe1fmA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63789-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63789-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BEE330D8AA6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8939B47D95E;
	Thu,  4 Jun 2026 13:25:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D443DA4E;
	Thu,  4 Jun 2026 13:25:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579527; cv=none; b=np1MutBbkNrm3ZqvOQgciwsnn83MxEBj5fcAyu21O+cIt0gZz76AJgqdZX18IV+1t16yHjrlLTLKiA1SFttzN8wGu6mLNfHZNGA+voDhPzE/tODwxL53ZEDL28dQIxqR/HGiInRUkExB24YsFHWielbu/57taGdtWEKFZcf+2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579527; c=relaxed/simple;
	bh=HKeFVD8lwilJ61/9ZkSoF6Z6KRBZUndwbAzNV/sw3IY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=US7dR/2tS0Tc6qYeaodobriuZxESxCbl497Wh5JVqxTN88YZbGmp/w+PiWHgxKNRax+3sBdhbz0PG4ImZe0YoKWrzWLPvmAAh0T5CRjNgcjysGHCjIIq4vomVMVbTmznP1Aa2byZo0YEery5m71lGSy+ijTSntMesFE9StVxPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBHe1fmA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D971F00898;
	Thu,  4 Jun 2026 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579525;
	bh=qlQij+VDTTP3ZvbjE5k4vvhLH/DNgI7reApsvnTxVoc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=IBHe1fmAC8iMdLdxYgxl0M78EObVs/QYGXWdc/WCHfEPWbw1ChvNh/EyOWM/D0n2k
	 7iNFkgMAD0XIJIn62sEB+Add4oUz5TAmRdRlN+67wLd+kvtGWPATKCg09p9H52gU5R
	 OajUnykzwUUb9D3lq3r4nkPfoD4Hg93s6mxCBVkJikFg5IpwK3SNa8d4MlrF64idXF
	 jpuw35iKLfMvyEwWnwhAFwW/9nLubnmwzLoADPwofPCbAUj37hqnEuj70SlHQ1BrEh
	 nPQ3mlcFDmpzShJ10qBkP30hZJdUdHL9TGGUkiKV4B5Ao+Cn21G0kNJlcHBpT5Mgdo
	 k9sotwcAGqjcw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 15:25:19 +0200
Message-Id: <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <driver-core@lists.linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Simona Vetter" <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Benno Lossin" <lossin@kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, "Asahi Lina"
 <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
References: <20260603195210.693856-1-lyude@redhat.com>
 <20260603195210.693856-5-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-5-lyude@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63789-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2A216406D4

On Wed Jun 3, 2026 at 9:42 PM CEST, Lyude Paul wrote:
> When writing up some rust code that used faux devices for unit testing, I
> noticed that we never actually added the Bound device context to
> faux::Registration's AsRef<device::Device> implementation. This being sai=
d:
> the Registration object itself is proof that a driver is bound to the
> device - so this should be safe.

Yes, it should be, but the reasons are non-trivial and should be part of th=
e
safety comment below.

  - faux_match() always returns 1, and probe runs synchronously
    (PROBE_FORCE_SYNCHRONOUS)

  - suppress_bind_attrs =3D true on faux_driver prevents userspace-triggere=
d
    unbind via sysfs

  - mem::forget(Registration) is not a problem; if the Registration is leak=
ed,
    the faux device stays bound forever

> Signed-off-by: Lyude Paul <lyude@redhat.com>

I can pick this through the driver-core tree already, as it seems this it n=
ot
needed by this series. Feel free to resend as individual patch for thus pur=
pose.

> ---
>  rust/kernel/faux.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
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
>  ///
>  /// [`struct faux_device`]: srctree/include/linux/device/faux.h
>  pub struct Registration(NonNull<bindings::faux_device>);
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
> --=20
> 2.54.0


