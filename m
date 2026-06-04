Return-Path: <linux-media+bounces-63847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ZltJvjXIWodPgEAu9opvQ
	(envelope-from <linux-media+bounces-63847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:54:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4316430BC
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:54:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Fxrgdhi+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63847-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63847-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D3ED3020A94
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 19:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E6B3C1974;
	Thu,  4 Jun 2026 19:54:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4439DBF9
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 19:54:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602859; cv=none; b=SkAfyG4J4cjNodT+zOWdfCjeSlbGQieGUMZGVkcky5/RFTml5R4efL79B7iZul39KLtBWWfBIAGcymxiaAkIB9tzVEenf4a3jRY/e+IFl3Cj6eywbVY+848TCq1hu3YXMJaGgw95fJ6evk/Q/mOcVpTzlL+wZIken6OYhdazPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602859; c=relaxed/simple;
	bh=fq1FZq6OMSl+Xc4txOb7aVus/4gyFDWSAry+1woJ86A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twWyUV3yI+vl3HSKXgYjEKe8HW0IdncXetLJRDxNI4T7H8USkTVjL048ThWiTTyVWoqhYFng9IJlIrU35ZVT23wE5EDJswBX5g6/6bpVTibPlmP69U3czhSZlX/aMFD0TLecz6jY9plXQVBrfaipFq7asTwwOyyrhgpw5PUAk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fxrgdhi+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EEA1F00893;
	Thu,  4 Jun 2026 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780602857;
	bh=VlNCEx7fSXTvxEos14U11YA6V7bI6hyrbU6QtXchtsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fxrgdhi+2p3vS6hQdItpxa9NGAEaPheM/rSuxOVOVuna7NoQFoVhwv3Ln5CxXzfM8
	 mFBe5KqHDT3zNmkNJZa+px6SyKNP7UShF1L9V6ud5m0r1DrtIlXimYbRFZvTNuEAfb
	 ZboxQBaTMZtnulrHfRDadGApwSPHUEs5TG0rF1fnVP+POATrYvaFAIMy2+gRxeq+Uc
	 dmq5atuDNRGs1w8OhwTkzpsY1uthCTQwEYUkC4fnTqIN+jJ573MQA3XtNsByacf+Ej
	 p9PeV0Ub0QQQc2PWpwHaLqF4tWVUj2pFediWbL7Z5COjq9QX0jWcVQjaXmCKGMcpFv
	 DwdvbSkF6g/Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 4/4] rust: drm: gem: Introduce
 shmem::Object::sg_table()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604192740.659240-5-lyude@redhat.com>
References: <20260604192740.659240-5-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 19:54:17 +0000
Message-Id: <20260604195417.88EEA1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63847-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B4316430BC

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] SGTableMap::drop frees the scatter-gather table without decremen=
ting the backing pages reference count, causing a permanent memory leak if =
Devres initialization fails.
--

commit 28826d4b9c036cf868c70bbd1c12d628314a0735
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: Introduce shmem::Object::sg_table()

This commit introduces sg_table() to shmem::Object and utilizes a Devres
resource to ensure SGTable mappings are released on driver-unbind.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index a20b0c0dac6bd..f3c893c7fbf4f 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs

[ ... ]

> @@ -270,6 +302,45 @@ pub fn vmap<const SIZE: usize>(&self) -> Result<VMap=
Ref<'_, T, C, SIZE>> {
>      pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMapOwned<T, C=
, SIZE>> {
>          self.make_vmap()
>      }
> +
> +    /// Creates (if necessary) and returns an immutable reference to a s=
catter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory. It is expected that `dev` sh=
ould be a pointer to the
> +    /// same [`device::Device`] which `self` belongs to, otherwise this =
function will return
> +    /// `Err(EINVAL)`.
> +    pub fn sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,
> +    ) -> Result<&'a scatterlist::SGTable> {
> +        if dev.as_raw() !=3D self.dev().as_ref().as_raw() {
> +            return Err(EINVAL);
> +        }
> +
> +        let sgt_res =3D 'out: {

[ ... ]

> +            // If not, finish initializing and return.
> +            self.sgt_res
> +                .populate(Devres::new(dev, SGTableMap::new(self))?);

[Severity: Medium]
If Devres::new() returns an error here, will the newly created SGTableMap
be immediately dropped?

When SGTableMap::new() calls drm_gem_shmem_get_pages_sgt(), it pins the
backing pages by incrementing pages_use_count and caches the new sgt. If the
SGTableMap is dropped during this error path, it frees the SGT without
decrementing pages_use_count, leading to a permanent memory leak of the
backing pages.

> +
> +            // SAFETY: We just populated sgt_res above.
> +            unsafe { self.sgt_res.as_ref().unwrap_unchecked() }
> +        };

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

[Severity: Medium]
Does this code leak the backing pages?

This function frees the SGT and sets shmem->sgt =3D NULL, but it omits a pa=
ired
call to drm_gem_shmem_put_pages_locked(). If this drop is triggered early
(such as when Devres::new() fails in Object::sg_table()), pages_use_count is
permanently incremented.

If the caller retries sg_table() after the failure, it will see
shmem->sgt =3D=3D NULL and increment pages_use_count a second time. When th=
e GEM
object is eventually released, drm_gem_shmem_release() will only decrement =
it
once, failing to reach 0 and triggering a drm_WARN_ON.

> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604192740.6592=
40-1-lyude@redhat.com?part=3D4

