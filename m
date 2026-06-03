Return-Path: <linux-media+bounces-63658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FMIJMluKIGp44wAAu9opvQ
	(envelope-from <linux-media+bounces-63658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:11:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295563B0E7
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:11:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Z/m6aOe2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63658-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63658-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACC4C307C6F3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA74402B86;
	Wed,  3 Jun 2026 20:11:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0E1D5AD4
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:11:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517462; cv=none; b=CQpE74dD9WxFwt7C2dm3rPOj/A0cz0UVTYkPouTFy4JzHS7Kh3l44CDF3Z/hM5IPtCCc/1lq3mRRKCNdLIMcdXf3SnhRnfGPhWNd/bLQGqtN1TTWuYGAPu3rF8GXfSfWFWPFxx04FdG50by1K8bYaQbypoFCrseD9bWZMyAbbWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517462; c=relaxed/simple;
	bh=INQsvqT5G/g4c/9feNZEskmee/eukg+a7BO3+Oz3xsg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q2c24XIIxYvKFHWV04eE64l6+/qp4NeqqZnlx/VNxNZO4RauKGmqkyfY24Af/IPvxu6WlhlRbAeGFItiy9AHuSXyFw37Pmq4/oKy4cgpsYMx29iBFbnu8E2rwrOLqLFkKsPPHsLGObPTmG6cQ62yGaxQXcIt8DpGBOtRMkIEs8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/m6aOe2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52DE1F00893;
	Wed,  3 Jun 2026 20:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780517461;
	bh=aVOpVkMNC/am4wsav+pCYYReOKw/ESjC7Sm+mlyTAQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/m6aOe24GWl2I1yi+ZSHsWbsbdFSBIfzjgv81TJ69xXAjAvQNJtOd26TAdUv3I9I
	 6CFgZeVvkuYWkDaaVo55fgT3gbxPKPjjhZZZuhw3hCBEIuKKAqieYyB2Shqj7JAC0a
	 UfxbGCDWJmJ/gia9QzbO4y0rDJGtMiuxd8IQ4BwfMLSe3Wk5CynUVdXZHB+G8NeX09
	 xTTP5Atk/t4S6iczBZkvn2Cy04d7yyKNdLebq3FcI86Waw0KypQp13f/fTRqQiYYk6
	 v/79vOiSWjvBo7sFgHWRPixK+xc1PZAjV+fWmGcmmo2N7UCoafOEhHDAAue2egN1XG
	 FfamdOhH7+zJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 3/6] rust: drm: gem: shmem: Add vmap functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260603195210.693856-4-lyude@redhat.com>
References: <20260603195210.693856-4-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:11:00 +0000
Message-Id: <20260603201100.C52DE1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63658-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6295563B0E7

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing volatile memory accesses in `IoCapable` implementation for=
 `VMap`.
- [Medium] Unconditional reservation lock acquisition causes runtime deadlo=
cks when vmapping from locked contexts.
- [Low] Missing `// INVARIANT:` comment when constructing `VMap`.
- [Low] Incorrect safety comment referencing `ARef` in `raw_vunmap`.
--

commit c7d123d2fcea8aeccc045288b1eb2a5cc650d43c
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: shmem: Add vmap functions

This commit adds vmap bindings for GEM shmem objects in Rust. It introduces
functions to create and manage virtual memory mappings for these objects,
including IoCapable implementations for the VMap structure.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 650c34dd8b7a4..1f05a5bc5fe66 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs

[ ... ]

> @@ -197,6 +205,80 @@ extern "C" fn free_callback(obj: *mut bindings::drm_=
gem_object) {
>          // SAFETY: We're recovering the Kbox<> we created in gem_create_=
object()
>          let _ =3D unsafe { KBox::from_raw(this) };
>      }
> +
> +    /// Attempt to create a vmap from the gem object, and confirm the si=
ze of said vmap.
> +    fn make_vmap<'a, R, const SIZE: usize>(&'a self) -> Result<VMap<T, R=
, C, SIZE>>
> +    where
> +        R: Deref<Target =3D Self> + From<&'a Self>,
> +    {
> +        // INVARIANT: We check here that the gem object is at least as l=
arge as `SIZE`.
> +        if self.size() < SIZE {
> +            return Err(ENOSPC);
> +        }
> +
> +        let mut map: MaybeUninit<bindings::iosys_map> =3D MaybeUninit::u=
ninit();
> +        let guard =3D DmaResvGuard::new(self);

[Severity: Medium]
Could unconditionally acquiring the DMA reservation lock here lead to a dea=
dlock
if make_vmap() is called while the lock is already held? In the DRM subsyst=
em,
it is common to vmap a GEM object while its lock is already held, such as
during a commit pipeline or inside drm_exec().

> +
> +        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reserva=
tion lock held
> +        to_result(unsafe {
> +            bindings::drm_gem_shmem_vmap_locked(self.as_raw_shmem(), map=
.as_mut_ptr())
> +        })?;
> +
> +        // Drop the guard explicitly here, since we may need to call raw=
_vunmap() (which re-acquires
> +        // the lock).
> +        drop(guard);
> +
> +        // SAFETY: The call to drm_gem_shmem_vmap_locked succeeded above=
, so we are guaranteed that
> +        // map is properly initialized.
> +        let map =3D unsafe { map.assume_init() };
> +
> +        // XXX: We don't currently support iomem allocations
> +        if map.is_iomem {
> +            // SAFETY:
> +            // - The vmap operation above succeeded, guaranteeing that `=
map` points to a valid
> +            //   memory mapping.
> +            // - We checked that this is an iomem allocation, making it =
safe to read vaddr_iomem
> +            unsafe { self.raw_vunmap(map) };
> +
> +            Err(ENOTSUPP)
> +        } else {
> +            Ok(VMap {

[Severity: Low]
Should there be an INVARIANT comment here explaining why the memory validity
invariant is satisfied? The VMap struct documentation has an Invariants sec=
tion
stating that the memory remains valid until dropped, so constructing it req=
uires
an explanation of how the invariant is met.

> +                // SAFETY: We checked that this is not an iomem allocati=
on, making it safe to read
> +                // vaddr
> +                addr: unsafe { map.__bindgen_anon_1.vaddr },
> +                owner: self.into(),
> +            })
> +        }
> +    }
> +
> +    /// Unmap a vmap from the gem object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller promises that `map` is a valid vmap on this gem obj=
ect.
> +    /// - The caller promises that the memory pointed to by map will no =
longer be accesed through
> +    ///   this instance.
> +    unsafe fn raw_vunmap(&self, mut map: bindings::iosys_map) {
> +        let _guard =3D DmaResvGuard::new(self);

[Severity: Medium]
Will unconditionally acquiring the lock here cause a deadlock if a VMap obj=
ect
is dropped while the reservation lock is already held?

> +
> +        // SAFETY:
> +        // - This function is safe to call with the DMA reservation lock=
 held.
> +        // - Our `ARef` is proof that the underlying gem object here is =
initialized and thus safe to
> +        //   dereference.

[Severity: Low]
Does this safety comment incorrectly reference an ARef? The raw_vunmap func=
tion
takes a standard shared reference to self, so there is no ARef involved in =
its
signature, and the safety actually relies on the reference itself guarantee=
ing
the object is alive.

> +        unsafe { bindings::drm_gem_shmem_vunmap_locked(self.as_raw_shmem=
(), &mut map) };
> +    }

[ ... ]

> +macro_rules! impl_vmap_io_capable {
> +    ($impl:ident, $ty:ty) =3D> {
> +        impl<D, R, C, const SIZE: usize> IoCapable<$ty> for $impl<D, R, =
C, SIZE>
> +        where
> +            D: DriverObject,
> +            C: DeviceContext,
> +            R: Deref<Target =3D Object<D, C>>,
> +        {
> +            #[inline(always)]
> +            unsafe fn io_read(&self, address: usize) -> $ty {
> +                let ptr =3D address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_read` guarantees t=
hat address is a valid
> +                // address within the bounds of `Self` of at least the s=
ize of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::read(ptr) }

[Severity: High]
Since GEM shmem buffers are mapped into both CPU and GPU address spaces, ca=
n the
compiler optimize away or reorder these standard non-volatile memory access=
es?

The equivalent C API uses READ_ONCE for system memory. Would using
ptr::read_volatile enforce the necessary volatile semantics to prevent
potential issues when interacting with the GPU?

> +            }
> +
> +            #[inline(always)]
> +            unsafe fn io_write(&self, value: $ty, address: usize) {
> +                let ptr =3D address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_write` guarantees =
that address is a valid
> +                // address within the bounds of `Self` of at least the s=
ize of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::write(ptr, value) }

[Severity: High]
Similarly to io_read, can the compiler optimize or delay this non-volatile
write?

Would using ptr::write_volatile match the WRITE_ONCE semantics from the C A=
PI
and prevent the compiler from caching values or reordering the accesses?

> +            }
> +        }
> +    };
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D3

