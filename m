Return-Path: <linux-media+bounces-63095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 45yfFnRwGmqf4QgAu9opvQ
	(envelope-from <linux-media+bounces-63095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:07:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDB60B4D6
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31CFE302C760
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 05:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2415534B662;
	Sat, 30 May 2026 05:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCxyOpqQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AD82E1EE0
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 05:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780117617; cv=none; b=AO9S6nWUEZB8vJu1J/v+l0CCBTp5UBl2A5UpSXqIeisgK8hgH4JVDqrE3IylIClQ145Me3OAdd8h0vc1iuLP8jKTIa9ednPxWdQ1SlUQ4QVWMQmGEFOx180COkOF9x6HGqhQn7Qfah/0qZg4wEdYD4mI8DpxYZs1+aos0yiaysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780117617; c=relaxed/simple;
	bh=cvP4uX/NT74dxgXZK9f+hLBK8LmC9dEiU7Put7J3lJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H7dt/OoFt9+1Vcwe4oDMNIxrYPoofhc7NpsYtS/avWfnOGelRZzH6Wd3nOBOY749AFSRC9i8qZym+JYJ45xTk0WToS/aQNanEoGuuIClhuyc98SNAR6pHFLLjihnLWOlqi5qaMRDWGjtrvm+9COLNr8nUIsd58tU+9ckjyYKs1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCxyOpqQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8F51F00893;
	Sat, 30 May 2026 05:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780117615;
	bh=rrJ8yTsqyxVCIKr8qQL4McXijOQ2bdZrb4ZvFDqPuRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCxyOpqQjln54xOXwvnQjMH49X+t+Blxdzg+4MCAIi64VLm/0l8v6sgNSNh915Z6U
	 OC38G3kcJ8cD7o3gweVGTmUYLArIPAt7zZw7epecanyLSEANcSrLa8kwmyoYl/8y/Q
	 fJnqzIjBG8Y+D5YxhaOTjIisPgXHz1fFJF/Bf/Bs7mN8nI3NMzYnqPfXZ7nHpPWhPz
	 0sLGETlrnXGlOAAZfIjeew2kXWi2X6MZzlKTEgv/3EWnIAMDBQbzISmdkko26CKmgq
	 5vY6KcPTBkVac+cXK4GuuevFtP8L/qKVPl/reR5gj4HlymmNop0rFHiGkIVv5wW+2q
	 Txe+cYCDDaKPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/6] rust: drm: gem: Add vmap functions to shmem
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260529183702.677677-4-lyude@redhat.com>
References: <20260529183702.677677-4-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 05:06:55 +0000
Message-Id: <20260530050655.8E8F51F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63095-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: D9FDB60B4D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Calling `Object::sg_table()` multiple times sequentially or co=
ncurrently causes a Use-After-Free and Double Free of the GEM object's SG t=
able due to eager evaluation.
- [High] `SGTableMap::drop` can access the `Object` after it has been freed=
 if the device is unbound concurrently with the GEM object's destruction (U=
se-After-Free).
- [High] The `IoCapable` implementation for `VMap` uses non-volatile memory=
 accesses, enabling dangerous compiler optimizations on memory shared with =
hardware.
- [Medium] Using uninterruptible lock `DmaResvGuard` for `vmap` operations.
- [Low] The patch introduces a call to an undefined C function `__drm_gem_s=
hmem_free_sgt_locked`, breaking bisectability.
- [Low] Returning `ENOTSUPP` instead of `EOPNOTSUPP` for unsupported I/O me=
mory allocations.
--

commit ff0ae9dbbc71a4912f8e6e6c487db7df45d250fb
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: Add vmap functions to shmem bindings

This commit adds vmap bindings for gem shmem objects in Rust, introducing
owned and borrowed mappings similar to SGTables.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index a116b0752e46a..494e0d0d8d0d6 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs

[ ... ]

> @@ -170,22 +196,123 @@ extern "C" fn free_callback(obj: *mut bindings::dr=
m_gem_object) {
>          // - We verified above that `obj` is valid, which makes `this` v=
alid
>          // - This function is set in AllocOps, so we know that `this` is=
 contained within a
>          //   `Object<T>`
> -        let this =3D unsafe { container_of!(Opaque::cast_from(this), Sel=
f, obj) }.cast_mut();
> +        let this =3D unsafe { container_of!(Opaque::cast_from(base), Sel=
f, obj) }.cast_mut();
> +
> +        // We need to reset `sgt_res` first, since doing so requires tha=
t the GEM object is still
> +        // alive.
> +        // SAFETY:
> +        // - We verified above that `this` is valid.
> +        // - `&mut (*this)` does not implement Unpin.
> +        unsafe { Pin::new_unchecked(&mut (*this).sgt_res) }.reset();

[Severity: High]
If the device is unbound concurrently with the GEM object's destruction, do=
es
this reset() allow the devres callback to access the Object after it has
been freed? Since the devres callback might already be executing and has
extracted the value, reset() could complete without waiting, proceeding to
free the Object memory while SGTableMap::drop later dereferences the freed
pointer.

> +
> +        // SAFETY:
> +        // - We're in free_callback - so this function is safe to call.
> +        // - We won't be using the gem resources on `this` after this ca=
ll.
> +        unsafe { bindings::drm_gem_shmem_release(base) };
> =20
>          // SAFETY: We're recovering the Kbox<> we created in gem_create_=
object()
>          let _ =3D unsafe { KBox::from_raw(this) };
>      }
> +
> +    /// Attempt to create a vmap from the gem object, and confirm the si=
ze of said vmap.
> +    fn make_vmap<'a, R, const SIZE: usize>(&'a self) -> Result<VMap<T, R=
, SIZE>>
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
Is it safe to use the uninterruptible DmaResvGuard::new() here? This is a
user-triggerable path (creating a vmap), and acquiring the dma_resv lock
uninterruptibly might cause unkillable tasks during heavy lock contention.
The C helper drm_gem_shmem_vmap uses the interruptible version.

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

[Severity: Low]
Should this return EOPNOTSUPP instead? ENOTSUPP is an internal kernel
error code that shouldn't be returned to userspace, as it can cause
unexpected behavior in libc if propagated through an ioctl.

> +        } else {
> +            Ok(VMap {
> +                // SAFETY: We checked that this is not an iomem allocati=
on, making it safe to read
> +                // vaddr
> +                addr: unsafe { map.__bindgen_anon_1.vaddr },
> +                owner: self.into(),
> +            })
> +        }
> +    }

[ ... ]

> +    pub fn sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,
> +    ) -> Result<&'a scatterlist::SGTable> {
> +        if dev.as_raw() !=3D self.dev().as_ref().as_raw() {
> +            return Err(EINVAL);
> +        }
> +
> +        match self.sgt_res.init(Devres::new(dev, SGTableMap::new(self)))=
 {

[Severity: Critical]
Could this lead to a double-free of the SG table? In Rust, function
arguments are evaluated eagerly. SGTableMap::new(self) executes
unconditionally before LazyInit::init checks if it is already initialized.

If sgt_res is already initialized, init() will return AlreadyInit, and the
newly instantiated SGTableMap argument will be dropped. The Drop impl for
SGTableMap unconditionally frees the shared shmem->sgt, which would leave
the first SGTableMap instance holding a dangling reference.

> +            Ok(ret) | Err(LazyInitError::AlreadyInit(ret)) =3D> Ok(ret.a=
ccess(dev)?),
> +            Err(LazyInitError::DuringInit(e)) =3D> Err(e),
> +        }
> +    }
>  }

[ ... ]

> +macro_rules! impl_vmap_io_capable {
> +    ($impl:ident, $ty:ty) =3D> {
> +        impl<D, R, const SIZE: usize> IoCapable<$ty> for $impl<D, R, SIZ=
E>
> +        where
> +            D: DriverObject,
> +            R: Deref<Target =3D Object<D>>,
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
Does using standard non-volatile ptr::read() enable dangerous compiler
optimizations here? The memory mapped via a GEM object is shared with
hardware and is often mapped as Write-Combine. Standard accesses might
allow the compiler to hoist reads out of loops or split reads. The C
implementation uses READ_ONCE() to prevent this.

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
Similarly, does ptr::write() risk the compiler eliminating stores it
deems dead? Using WRITE_ONCE() would ensure the memory accesses happen
exactly as specified for hardware-shared memory.

> +            }
> +        }
> +    };
> +}

[ ... ]

> +impl<T: DriverObject> Drop for SGTableMap<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: `obj` is always valid via our type invariants
> +        let obj =3D unsafe { self.obj.as_ref() };

[Severity: High]
If the devres callback executes this concurrently with
Object::free_callback resetting the sgt_res, is it possible that this
dereferences a raw pointer to an Object that has just been freed?

> +        let _lock =3D DmaResvGuard::new(obj);
> +
> +        // SAFETY: We acquired the lock needed for calling this function=
 above
> +        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_sh=
mem()) };

[Severity: Low]
Does this break bisectability? The function
__drm_gem_shmem_free_sgt_locked() does not seem to be defined in the C
headers at this commit.

> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D3

