Return-Path: <linux-media+bounces-64605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ouUZEcfrKmrJzQMAu9opvQ
	(envelope-from <linux-media+bounces-64605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:09:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34A673DDD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:09:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=XNcIsfeV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64605-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64605-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52E763482EC2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8253947ECD2;
	Thu, 11 Jun 2026 17:02:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C33466B6A;
	Thu, 11 Jun 2026 17:02:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781197347; cv=pass; b=Ro7EiiebohNEdoWqFQ01QqyaRGGSHRkBO3GLj6xQnQ4boePiz+UWjJBOrE/AnD6+J+GKyg9eiejYum8rreBh3689NDm9JiwBFGvB5sBgioGlnocBhqXK0m5iJe7v2tx8HZQ+gzmWz5IEwwnHkCGr9lSfiitmxKDHPUx4NH0+gmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781197347; c=relaxed/simple;
	bh=KvO/8tOq/x4OWqcl8EDLYXSMOuXx/yEXP6t/c8yN1us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzrU944yA0zsbELA7YPU62DdbIL/kJTpzDTatHh23RC2vZqnIHKcoR8pIoIo3vWJYpwTWDKqpTzK/Zqbu7ZNMJRYZEnePr1hiAQwVb+Olig6Yr37FTATQYP8d0serXXmsg+GLtMq7nhgiCCDjd6VOzs6UgyngXLab/auARUz488=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=XNcIsfeV; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1781197283; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JEa515L5eioPTrrthXNlAnWUVojm6OHfMSyG/7d7rU8toMzLV2Y39VxoMnK6t7pnecWjFs1TMSbsxGPxJi3nG0Dev3pBLxRLJVL8skJeufgcgOt+YXv3HJvYWbF+272NFRgle2mpGhtUcdPm7kfDoP00E17RJdSOoVIqlRQImrw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781197283; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2fJfyqbH35YYbgEIjIgvDNDQswgvPgvQ2KhSG/JJtTQ=; 
	b=Qo6AfqUY6p6bT18Ox+zyLXn7fpRtnJCx5UPqhZlK5blt9syZ8qxoN4CVNyL5jNPk4IVKbLUCWr1ehosZDClBG8zXdt47zUwlWFSxpUVwNuV5ypnKw0H/+fJWEm42T/FvCwe2P+8bKOhBhzMcR5hdnTw40aACmBJJxK2qraMUxrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781197283;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=2fJfyqbH35YYbgEIjIgvDNDQswgvPgvQ2KhSG/JJtTQ=;
	b=XNcIsfeVt5XfcVZDmUv/90Wn9Ua7M7fiX+C/2lWJsFw80uYQ8qUYBG5FxNxD6yWd
	ax7P0IuJzICtxZ6TLYU1mmlL8BxnF5/U1DPBXP661iW0c8pedAf0j4KhLUcLStinTis
	izD5QLqlU0HLmIObeqrR9NRoknIABMnuDQo/jtbg=
Received: by mx.zohomail.com with SMTPS id 1781197281571203.9158288337478;
	Thu, 11 Jun 2026 10:01:21 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:01:20 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add vmap functions
Message-ID: <airp4AHxiJKWn5tr@um790>
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610162433.923550-3-lyude@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-64605-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,nvidia.com:email,collabora.com:dkim,collabora.com:from_mime,um790:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB34A673DDD

On Wed, Jun 10, 2026 at 12:21:29PM -0400, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> ---
> V7:
> * Switch over to the new iosys map bindings that use the Io trait
> V8:
> * Get rid of iosys_map bindings for now, only support non-iomem types
> * s/as_shmem()/as_raw_shmem()
> V9:
> * Get rid of some outdated comments I missed
> * Add missing SIZE check to raw_vmap()
> * Add a proper unit test that ensures that we actually validate SIZE at
>   compile-time.
>   Turns out it takes only 34 lines to make a boilerplate DRM driver for a
>   kunit test :)
> * Add unit tests
> * Add some missing #[inline]s
> V10:
> * Correct issue with iomem error path
>   We previously called raw_vunmap() if we got an iomem allocation, but
>   raw_vunmap() was written such that it assumed all allocations were sysmem
>   allocations. Fix this by just making raw_vunmap() accept a iosys_map.
> V11:
> * Use Alexandre's clever solution to remove the macros we were using for
>   maintaining two different VMap types.
> * Change the order of items in Object<T> to ensure that sgt_res is always
>   dropped before obj.
> * Fix typo in Object.raw_vmap()
> * s/raw_vmap()/make_vmap()/
>   Deduplicate code a bit more as well by using more generics here
> V15:
> * Add these patches back
> * We only have one VMap type now!
> * Use ObjectConfig::default() in unit tests since we unbroke it.
> V16:
> * Fix huge rebase error I made and did not notice that squashed 1.5 patches
>   together that were definitely not supposed to be squashed
> * Update old commit message
> V17:
> * Rebase
> * Fix format of commit message title
> V19:
> * Drop outdated safety comment
> * Move impl_vmap_io_capable! definition to right before it gets used
> * Add missing `` in rustdoc for VMap type
> * Add a bunch of missing `` in make_vmap()
> * Remove one outdated safety comment about reading vaddr_iomem
> * Add some missing periods in safety comments in make_vmap().
> * Use read_volatile/write_volatile() instead of read()/write() to prevent
>   compiler reordering.
> * Remove impl argument from impl_vmap_io_capable!()
> * Check .owner() and .maxsize() in compile_time_vmap_sizes()
> * Use more varied pattern in vmap_io()
> V20:
> * Add missing Send/Sync implementations for VMap
> * Use #[inline] not #[inline(always)]
> * Add missing invariant comment to VMap instantiation
> * Make sure that kunit test doesn't fail on big endian
> 
>  rust/kernel/drm/gem/shmem.rs | 337 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 336 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 090c5d869fdb7..68a1ce3330b11 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -20,6 +20,11 @@
>          Registered, //
>      },
>      error::to_result,
> +    io::{
> +        Io,
> +        IoCapable,
> +        IoKnownSize, //
> +    },
>      prelude::*,
>      sync::aref::ARef,
>      types::{
> @@ -28,7 +33,9 @@
>      },
>  };
>  use core::{
> +    ffi::c_void,
>      marker::PhantomData,
> +    mem::MaybeUninit, //
>      ops::{
>          Deref,
>          DerefMut, //
> @@ -39,6 +46,7 @@
>      },
>  };
>  use gem::{
> +    BaseObject,
>      BaseObjectPrivate,
>      DriverObject,
>      IntoGEMObject, //
> @@ -200,6 +208,79 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
>          // SAFETY: We're recovering the Kbox<> we created in gem_create_object()
>          let _ = unsafe { KBox::from_raw(this) };
>      }
> +
> +    /// Attempt to create a vmap from the gem object, and confirm the size of said vmap.
> +    fn make_vmap<'a, R, const SIZE: usize>(&'a self) -> Result<VMap<T, R, C, SIZE>>
> +    where
> +        R: Deref<Target = Self> + From<&'a Self>,
> +    {
> +        // INVARIANT: We check here that the gem object is at least as large as `SIZE`.
> +        if self.size() < SIZE {
> +            return Err(ENOSPC);
> +        }
> +
> +        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
> +        let guard = DmaResvGuard::new(self);
> +
> +        // SAFETY: `drm_gem_shmem_vmap()` can be called with the DMA reservation lock held.
> +        to_result(unsafe {
> +            bindings::drm_gem_shmem_vmap_locked(self.as_raw_shmem(), map.as_mut_ptr())
> +        })?;
> +
> +        // Drop the guard explicitly here, since we may need to call `raw_vunmap()` (which
> +        // re-acquires the lock).
> +        drop(guard);
> +
> +        // SAFETY: The call to `drm_gem_shmem_vmap_locked()` succeeded above, so we are guaranteed
> +        // that map is properly initialized.
> +        let map = unsafe { map.assume_init() };
> +
> +        // XXX: We don't currently support iomem allocations
> +        if map.is_iomem {
> +            // SAFETY: The vmap operation above succeeded, guaranteeing that `map` points to a valid
> +            // memory mapping.
> +            unsafe { self.raw_vunmap(map) };
> +
> +            Err(ENOTSUPP)
> +        } else {
> +            Ok(VMap {
> +                // INVARIANT: `addr` remains valid for as long as `owner` does, which extends to the
> +                // lifetime of `VMap` itself.
> +                // SAFETY: We checked that this is not an iomem allocation, making it safe to read
> +                // vaddr.
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
> +    /// - The caller promises that `map` is a valid vmap on this gem object.
> +    /// - The caller promises that the memory pointed to by map will no longer be accesed through
> +    ///   this instance.
> +    unsafe fn raw_vunmap(&self, mut map: bindings::iosys_map) {
> +        let _guard = DmaResvGuard::new(self);
> +
> +        // SAFETY:
> +        // - This function is safe to call with the DMA reservation lock held.
> +        // - The caller promises that `map` is a valid vmap on this gem object.
> +        unsafe { bindings::drm_gem_shmem_vunmap_locked(self.as_raw_shmem(), &mut map) };
> +    }
> +
> +    /// Creates and returns a virtual kernel memory mapping for this object.
> +    #[inline]
> +    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, C, SIZE>> {
> +        self.make_vmap()
> +    }
> +
> +    /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
> +    #[inline]
> +    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMapOwned<T, C, SIZE>> {
> +        self.make_vmap()
> +    }
>  }
>  
>  impl<T: DriverObject, C: DeviceContext> Deref for Object<T, C> {
> @@ -263,7 +344,6 @@ struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext = Registered>(
>  
>  impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C> {
>      #[inline]
> -    #[expect(unused)]
>      fn new(obj: &'a Object<T, C>) -> Self {
>          // SAFETY: This lock is initialized throughout the lifetime of `object`.
>          unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
> @@ -279,3 +359,258 @@ fn drop(&mut self) {
>          unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
>      }
>  }
> +
> +/// A reference to a virtual mapping for an shmem-based GEM object in kernel address space.
> +///
> +/// # Invariants
> +///
> +/// - The size of `owner` is >= SIZE.
> +/// - The memory pointed to by `addr` remains valid at least until this object is dropped.
> +pub struct VMap<D, R, C = Registered, const SIZE: usize = 0>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +    addr: *mut c_void,
> +    owner: R,
> +}
> +
> +/// An alias type for a reference to a shmem-based GEM object's VMap.
> +pub type VMapRef<'a, D, C, const SIZE: usize = 0> = VMap<D, &'a Object<D, C>, C, SIZE>;
> +
> +/// An alias type for an owned reference to a shmem-based GEM object's VMap.
> +pub type VMapOwned<D, C, const SIZE: usize = 0> = VMap<D, ARef<Object<D, C>>, C, SIZE>;
> +
> +impl<D, R, C, const SIZE: usize> VMap<D, R, C, SIZE>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +    /// Borrows a reference to the object that owns this virtual mapping.
> +    #[inline]
> +    pub fn owner(&self) -> &Object<D, C> {
> +        &self.owner
> +    }
> +}
> +
> +impl<D, R, C, const SIZE: usize> Drop for VMap<D, R, C, SIZE>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY:
> +        // - Our existence is proof that this map was previously created using self.owner.
> +        // - Since we are in Drop, we are guaranteed that no one will access the memory
> +        //   through this mapping after calling this.
> +        unsafe {
> +            self.owner.raw_vunmap(bindings::iosys_map {
> +                is_iomem: false,
> +                __bindgen_anon_1: bindings::iosys_map__bindgen_ty_1 { vaddr: self.addr },
> +            })
> +        };
> +    }
> +}
> +
> +// SAFETY: VMaps are safe to send across threads.
> +unsafe impl<D, R, C, const SIZE: usize> Send for VMap<D, R, C, SIZE>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +}
> +
> +// SAFETY: VMaps are safe to access from multiple threads.
> +unsafe impl<D, R, C, const SIZE: usize> Sync for VMap<D, R, C, SIZE>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +}
> +
> +impl<D, R, C, const SIZE: usize> Io for VMap<D, R, C, SIZE>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +    #[inline]
> +    fn addr(&self) -> usize {
> +        self.addr as usize
> +    }
> +
> +    #[inline]
> +    fn maxsize(&self) -> usize {
> +        self.owner.size()
> +    }
> +}
> +
> +impl<D, R, C, const SIZE: usize> IoKnownSize for VMap<D, R, C, SIZE>
> +where
> +    D: DriverObject,
> +    C: DeviceContext,
> +    R: Deref<Target = Object<D, C>>,
> +{
> +    const MIN_SIZE: usize = SIZE;
> +}
> +
> +macro_rules! impl_vmap_io_capable {
> +    ($ty:ty) => {
> +        impl<D, R, C, const SIZE: usize> IoCapable<$ty> for VMap<D, R, C, SIZE>
> +        where
> +            D: DriverObject,
> +            C: DeviceContext,
> +            R: Deref<Target = Object<D, C>>,
> +        {
> +            #[inline]
> +            unsafe fn io_read(&self, address: usize) -> $ty {
> +                let ptr = address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_read` guarantees that address is a valid
> +                // address within the bounds of `Self` of at least the size of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::read_volatile(ptr) }
> +            }
> +
> +            #[inline]
> +            unsafe fn io_write(&self, value: $ty, address: usize) {
> +                let ptr = address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_write` guarantees that address is a valid
> +                // address within the bounds of `Self` of at least the size of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::write_volatile(ptr, value) }
> +            }
> +        }
> +    };
> +}
> +
> +impl_vmap_io_capable!(u8);
> +impl_vmap_io_capable!(u16);
> +impl_vmap_io_capable!(u32);
> +#[cfg(CONFIG_64BIT)]
> +impl_vmap_io_capable!(u64);
> +
> +#[kunit_tests(rust_drm_gem_shmem)]
> +mod tests {
> +    use super::*;
> +    use crate::{
> +        drm::{
> +            self,
> +            UnregisteredDevice, //
> +        },
> +        faux,
> +        page::PAGE_SIZE, //
> +    };
> +
> +    // The bare minimum needed to create a fake drm driver for kunit
> +
> +    #[pin_data]
> +    struct KunitData {}
> +    struct KunitDriver;
> +    struct KunitFile;
> +    #[pin_data]
> +    struct KunitObject {}
> +
> +    const INFO: drm::DriverInfo = drm::DriverInfo {
> +        major: 0,
> +        minor: 0,
> +        patchlevel: 0,
> +        name: c"kunit",
> +        desc: c"Kunit",
> +    };
> +
> +    impl drm::file::DriverFile for KunitFile {
> +        type Driver = KunitDriver;
> +
> +        fn open(_dev: &drm::Device<KunitDriver>) -> Result<Pin<KBox<Self>>> {
> +            Ok(KBox::new(Self, GFP_KERNEL)?.into())
> +        }
> +    }
> +
> +    impl gem::DriverObject for KunitObject {
> +        type Driver = KunitDriver;
> +        type Args = ();
> +
> +        fn new<C: DeviceContext>(
> +            _dev: &drm::Device<KunitDriver, C>,
> +            _size: usize,
> +            _args: Self::Args,
> +        ) -> impl PinInit<Self, Error> {
> +            try_pin_init!(KunitObject {})
> +        }
> +    }
> +
> +    #[vtable]
> +    impl drm::Driver for KunitDriver {
> +        type Data = KunitData;
> +        type File = KunitFile;
> +        type Object<Ctx: DeviceContext> = Object<KunitObject, Ctx>;
> +
> +        const INFO: drm::DriverInfo = INFO;
> +        const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor] = &[];
> +    }
> +
> +    fn create_drm_dev() -> Result<(faux::Registration, UnregisteredDevice<KunitDriver>)> {
> +        // Create a faux DRM device so we can test gem object creation.
> +        let data = try_pin_init!(KunitData {});
> +        let dev = faux::Registration::new(c"Kunit", None)?;
> +        let drm = UnregisteredDevice::new(dev.as_ref(), data)?;
> +
> +        Ok((dev, drm))
> +    }
> +
> +    #[test]
> +    fn compile_time_vmap_sizes() -> Result {
> +        let (_dev, drm) = create_drm_dev()?;
> +
> +        let obj = Object::<KunitObject, _>::new(&drm, PAGE_SIZE, ObjectConfig::default(), ())?;
> +
> +        // Try creating a normal vmap
> +        obj.vmap::<PAGE_SIZE>()?;
> +
> +        // Try creating a vmap that's smaller then the size we specified
> +        let vmap = obj.vmap::<{ PAGE_SIZE - 100 }>()?;
> +
> +        // Verify the owner matches
> +        assert!(ptr::eq(vmap.owner(), obj.deref()));
> +
> +        // Verify the max size matches the actual object size
> +        assert_eq!(vmap.maxsize(), PAGE_SIZE);
> +
> +        // Make sure creating a vmap that's too large fails
> +        assert!(obj.vmap::<{ PAGE_SIZE + 200 }>().is_err());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn vmap_io() -> Result {
> +        let (_dev, drm) = create_drm_dev()?;
> +
> +        let obj = Object::<KunitObject, _>::new(&drm, PAGE_SIZE, ObjectConfig::default(), ())?;
> +
> +        let vmap = obj.vmap::<PAGE_SIZE>()?;
> +
> +        vmap.write8(0xDE, 0x0);
> +        assert_eq!(vmap.read8(0x0), 0xDE);
> +        vmap.write32(0xFEDCBA98, 0x20);
> +
> +        assert_eq!(vmap.read32(0x20), 0xFEDCBA98);
> +
> +        // Ensure the ordering in memory is correct
> +        let offsets = (0x20..0x23).into_iter();

Hi Lyude, i've got a clippy error here that "into_iter()" is redundant
because it converts a Range<usize> into a Range<usize>.

> +        let expected = 0xFEDCBA98_u32.to_ne_bytes().into_iter();
> +        for (offset, expected) in offsets.zip(expected) {
> +            assert_eq!(vmap.read8(offset), expected);
> +        }
> +
> +        Ok(())
> +    }
> +}
> -- 
> 2.54.0
> 

