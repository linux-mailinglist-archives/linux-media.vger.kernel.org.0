Return-Path: <linux-media+bounces-57674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG5tBnrEymmL/wUAu9opvQ
	(envelope-from <linux-media+bounces-57674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:44:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950F35FE39
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F171302DE08
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3433DEAD8;
	Mon, 30 Mar 2026 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dG95/Z0w"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ACC3DD537;
	Mon, 30 Mar 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896204; cv=pass; b=ddFd/YLtY1oq/Wj5GycT4ewDpLNLTw67AVLmM0Xfcg0kmp505wtUwOTTox0Y0VK4s4T6/l04a9PbhTZfOAnlo1XXfcE7uQweRrnrKlBaj62O5a+GYXz48t/KBesQydacV0wBKifTk12Azp1gnnF8b5/tpZAQnaVQ47NnSwvXP64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896204; c=relaxed/simple;
	bh=DAq3xzXz+H/SY+5LAd2l4vLknQbCV+xzztJjPZBAnvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juIa6Hv2klbf1x3N150zBq39xDhqZCWm1SwFNMHEEQZ9nS730ex4IBAlxiAQeURjR/pJFd8pJR0TmI6EfQDdmxNz9VJBPgsUAVSnlY8SyqcbcduvwVHElkZo7Xg/p3HafowU/3Wferak9kqx4UZtNxm162jXoA/IqbosxoT6ObI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=dG95/Z0w; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774896151; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KoslFo+gJBZZ7WtbYxAjpqh6be4vHe+mM5cnVobkqZHuiHLok0RVvQJOsG4YYgZzIYX6I0J7C5Q/TEtH2x2dGZ4xvdD9UovDvkVhAx+kYJfZvmyXXPl99zSUkws7gamhfD0qMXfPwnRDs9dfkII6CNCsWp5GbnfRAvzMv2uzLX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774896151; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GuOC4iypw7g37FcYekzF34EdjbAOvG3Vaqiy2mH/Dq8=; 
	b=OmNZgQ8GQ95uKv+ffEdJWbJngRzETHYXIFkqE5yvjpBeD9XZC5hy3YR8NEESklGnY/yD0gMnUJ+COUHdfDL2jwMJKWtrfOUPgi+w/utPxluW5ScMXxLRC4rcjA65dyVxtpeTFnShn24wNEgEyLToyoR/i/d8kCgjlrrenONENuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774896151;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=GuOC4iypw7g37FcYekzF34EdjbAOvG3Vaqiy2mH/Dq8=;
	b=dG95/Z0wg5y/PD7+8fk/tJAZHqcghyD+pNHFz0I3NitocFtZrKar2IWmzeBYEzRo
	HsOHTxt8/cHrxrVXT5xBQk4iLDrGQzXiZcRXS6ufToxeYFfYnardkmonjhAapZxa9KT
	cErvKido0bQdXdEsIfmCvULmLoA9u7YrpWk8v5vM=
Received: by mx.zohomail.com with SMTPS id 1774896149284317.51788213609734;
	Mon, 30 Mar 2026 11:42:29 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:42:28 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
Message-ID: <acrEFEIUziQucoJI@um790>
References: <20260316211646.650074-1-lyude@redhat.com>
 <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57674-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,google.com,kernel.org,lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,asahilina.net:email,msgid.link:url,collabora.com:dkim,collabora.com:email,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 7950F35FE39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 02:15:28AM +0100, Danilo Krummrich wrote:
> On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> > Lyude Paul (5):
> >   rust: drm: Add gem::impl_aref_for_gem_obj!
> >   rust: gem: Introduce DriverObject::Args
> 
> Applied to drm-rust-next, thanks!
> 
> > Asahi Lina (2):
> >   rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
> I was about to pick this one up as well, but did run into quite some build
> errors and warnings. I fixed them all up, but I consider this too excessive to
> actually apply the patch. This is the changelog I came up with:
> 
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it,
>         it becomes =m. The Rust kernel crate and its C helpers are always
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
> 
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
> 
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
> 
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
> 
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")].
> 
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
> 
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
> 
>         - Danilo ]
> 
> Please always consider [1] and [2].
> 
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-rust.html#submit-checklist
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
> 
> (@Deborah: I assume you were testing this with Tyr built-in?)

Yes, Tyr used to work around this issue by creating a new config
DRM_TYR_STATIC_DEPS, a bool, which selected DRM_GEM_SHMEM_HELPER.
When we build DRM_TYR as a module, it selected DRM_TYR_STATIC_DEPS so
that DRM_GEM_SHMEM_HELPER always ended up built-in even if Tyr was built
as a module.

But now Tyr can just select RUST_DRM_GEM_SHMEM_HELPER directly.

(We still have the same work around for DRM_GPUVM perhaps it could
use the same solution).

> 
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.
> 
> commit 2dc69d77944dbd1494d2b10a4b134b7fead1c8e7
> Author: Asahi Lina <lina+kernel@asahilina.net>
> Date:   Mon Mar 16 17:16:13 2026 -0400
> 
>     rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
>     The DRM shmem helper includes common code useful for drivers which
>     allocate GEM objects as anonymous shmem. Add a Rust abstraction for
>     this. Drivers can choose the raw GEM implementation or the shmem layer,
>     depending on their needs.
> 
>     Signed-off-by: Asahi Lina <lina@asahilina.net>
>     Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>     Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>     Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>     Link: https://patch.msgid.link/20260316211646.650074-6-lyude@redhat.com
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it,
>         it becomes =m. The Rust kernel crate and its C helpers are always
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
> 
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
> 
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
> 
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
> 
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")].
> 
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
> 
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
> 
>         - Danilo ]
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0d0657dd1b41..0f68446c9122 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -258,6 +258,13 @@ config DRM_GEM_SHMEM_HELPER
>  	help
>  	  Choose this if you need the GEM shmem helper functions
> 
> +config RUST_DRM_GEM_SHMEM_HELPER
> +	bool
> +	depends on DRM && MMU
> +	select DRM_GEM_SHMEM_HELPER
> +	help
> +	  Choose this if you need the GEM shmem helper functions In Rust
> +
>  config DRM_SUBALLOC_HELPER
>  	tristate
>  	depends on DRM
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 563863d96d38..eda8f50d3a3c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -34,6 +34,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <kunit/test.h>
>  #include <linux/auxiliary_bus.h>
> @@ -63,6 +64,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/ioport.h>
> +#include <linux/iosys-map.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
> index fe226f7b53ef..65f3f22b0e1d 100644
> --- a/rust/helpers/drm.c
> +++ b/rust/helpers/drm.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> 
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_vma_manager.h>
> 
>  #ifdef CONFIG_DRM
> @@ -21,4 +22,57 @@ rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
>  	return drm_vma_node_offset_addr(node);
>  }
> 
> -#endif
> +#ifdef CONFIG_DRM_GEM_SHMEM_HELPER
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_free(struct drm_gem_object *obj)
> +{
> +	return drm_gem_shmem_object_free(obj);
> +}
> +
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_print_info(struct drm_printer *p, unsigned int indent,
> +					    const struct drm_gem_object *obj)
> +{
> +	drm_gem_shmem_object_print_info(p, indent, obj);
> +}
> +
> +__rust_helper int
> +rust_helper_drm_gem_shmem_object_pin(struct drm_gem_object *obj)
> +{
> +	return drm_gem_shmem_object_pin(obj);
> +}
> +
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
> +{
> +	drm_gem_shmem_object_unpin(obj);
> +}
> +
> +__rust_helper struct sg_table *
> +rust_helper_drm_gem_shmem_object_get_sg_table(struct drm_gem_object *obj)
> +{
> +	return drm_gem_shmem_object_get_sg_table(obj);
> +}
> +
> +__rust_helper int
> +rust_helper_drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
> +				      struct iosys_map *map)
> +{
> +	return drm_gem_shmem_object_vmap(obj, map);
> +}
> +
> +__rust_helper void
> +rust_helper_drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
> +					struct iosys_map *map)
> +{
> +	drm_gem_shmem_object_vunmap(obj, map);
> +}
> +
> +__rust_helper int
> +rust_helper_drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	return drm_gem_shmem_object_mmap(obj, vma);
> +}
> +
> +#endif /* CONFIG_DRM_GEM_SHMEM_HELPER */
> +#endif /* CONFIG_DRM */
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 527d86f4ce92..58eb0a3d5686 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -26,6 +26,9 @@
>      ptr::NonNull, //
>  };
> 
> +#[cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER)]
> +pub mod shmem;
> +
>  /// A macro for implementing [`AlwaysRefCounted`] for any GEM object type.
>  ///
>  /// Since all GEM objects use the same refcounting scheme.
> @@ -60,6 +63,8 @@ unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
>          }
>      };
>  }
> +#[cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), allow(unused))]
> +pub(crate) use impl_aref_for_gem_obj;
> 
>  /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
>  /// [`DriverObject`] implementation.
> @@ -216,7 +221,7 @@ fn create_mmap_offset(&self) -> Result<u64> {
>  impl<T: IntoGEMObject> BaseObject for T {}
> 
>  /// Crate-private base operations shared by all GEM object classes.
> -#[expect(unused)]
> +#[cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))]
>  pub(crate) trait BaseObjectPrivate: IntoGEMObject {
>      /// Return a pointer to this object's dma_resv.
>      fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> new file mode 100644
> index 000000000000..d025fb035195
> --- /dev/null
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -0,0 +1,228 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DRM GEM shmem helper objects
> +//!
> +//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/drm/drm_gem_shmem_helper.h)
> +
> +// TODO:
> +// - There are a number of spots here that manually acquire/release the DMA reservation lock using
> +//   dma_resv_(un)lock(). In the future we should add support for ww mutex, expose a method to
> +//   acquire a reference to the WwMutex, and then use that directly instead of the C functions here.
> +
> +use crate::{
> +    container_of,
> +    drm::{
> +        device,
> +        driver,
> +        gem,
> +        private::Sealed, //
> +    },
> +    error::to_result,
> +    prelude::*,
> +    types::{
> +        ARef,
> +        Opaque, //
> +    }, //
> +};
> +use core::{
> +    ops::{
> +        Deref,
> +        DerefMut, //
> +    },
> +    ptr::NonNull,
> +};
> +use gem::{
> +    BaseObjectPrivate,
> +    DriverObject,
> +    IntoGEMObject, //
> +};
> +
> +/// A struct for controlling the creation of shmem-backed GEM objects.
> +///
> +/// This is used with [`Object::new()`] to control various properties that can only be set when
> +/// initially creating a shmem-backed GEM object.
> +#[derive(Default)]
> +pub struct ObjectConfig<'a, T: DriverObject> {
> +    /// Whether to set the write-combine map flag.
> +    pub map_wc: bool,
> +
> +    /// Reuse the DMA reservation from another GEM object.
> +    ///
> +    /// The newly created [`Object`] will hold an owned refcount to `parent_resv_obj` if specified.
> +    pub parent_resv_obj: Option<&'a Object<T>>,
> +}
> +
> +/// A shmem-backed GEM object.
> +///
> +/// # Invariants
> +///
> +/// `obj` contains a valid initialized `struct drm_gem_shmem_object` for the lifetime of this
> +/// object.
> +#[repr(C)]
> +#[pin_data]
> +pub struct Object<T: DriverObject> {
> +    #[pin]
> +    obj: Opaque<bindings::drm_gem_shmem_object>,
> +    /// Parent object that owns this object's DMA reservation object.
> +    parent_resv_obj: Option<ARef<Object<T>>>,
> +    #[pin]
> +    inner: T,
> +}
> +
> +super::impl_aref_for_gem_obj!(impl<T> for Object<T> where T: DriverObject);
> +
> +// SAFETY: All GEM objects are thread-safe.
> +unsafe impl<T: DriverObject> Send for Object<T> {}
> +
> +// SAFETY: All GEM objects are thread-safe.
> +unsafe impl<T: DriverObject> Sync for Object<T> {}
> +
> +impl<T: DriverObject> Object<T> {
> +    /// `drm_gem_object_funcs` vtable suitable for GEM shmem objects.
> +    const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> +        free: Some(Self::free_callback),
> +        open: Some(super::open_callback::<T>),
> +        close: Some(super::close_callback::<T>),
> +        print_info: Some(bindings::drm_gem_shmem_object_print_info),
> +        export: None,
> +        pin: Some(bindings::drm_gem_shmem_object_pin),
> +        unpin: Some(bindings::drm_gem_shmem_object_unpin),
> +        get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
> +        vmap: Some(bindings::drm_gem_shmem_object_vmap),
> +        vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> +        mmap: Some(bindings::drm_gem_shmem_object_mmap),
> +        status: None,
> +        rss: None,
> +        #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
> +        // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on the C side.
> +        vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> +        evict: None,
> +    };
> +
> +    /// Return a raw pointer to the embedded drm_gem_shmem_object.
> +    fn as_raw_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
> +        self.obj.get()
> +    }
> +
> +    /// Create a new shmem-backed DRM object of the given size.
> +    ///
> +    /// Additional config options can be specified using `config`.
> +    pub fn new(
> +        dev: &device::Device<T::Driver>,
> +        size: usize,
> +        config: ObjectConfig<'_, T>,
> +        args: T::Args,
> +    ) -> Result<ARef<Self>> {
> +        let new: Pin<KBox<Self>> = KBox::try_pin_init(
> +            try_pin_init!(Self {
> +                obj <- Opaque::init_zeroed(),
> +                parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
> +                inner <- T::new(dev, size, args),
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        // SAFETY: `obj.as_raw()` is guaranteed to be valid by the initialization above.
> +        unsafe { (*new.as_raw()).funcs = &Self::VTABLE };
> +
> +        // SAFETY: The arguments are all valid via the type invariants.
> +        to_result(unsafe { bindings::drm_gem_shmem_init(dev.as_raw(), new.as_raw_shmem(), size) })?;
> +
> +        // SAFETY: We never move out of `self`.
> +        let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
> +
> +        // SAFETY: We're taking over the owned refcount from `drm_gem_shmem_init`.
> +        let obj = unsafe { ARef::from_raw(NonNull::new_unchecked(new)) };
> +
> +        // Start filling out values from `config`
> +        if let Some(parent_resv) = config.parent_resv_obj {
> +            // SAFETY: We have yet to expose the new gem object outside of this function, so it is
> +            // safe to modify this field.
> +            unsafe { (*obj.obj.get()).base.resv = parent_resv.raw_dma_resv() };
> +        }
> +
> +        // SAFETY: We have yet to expose this object outside of this function, so we're guaranteed
> +        // to have exclusive access - thus making this safe to hold a mutable reference to.
> +        let shmem = unsafe { &mut *obj.as_raw_shmem() };
> +        shmem.set_map_wc(config.map_wc);
> +
> +        Ok(obj)
> +    }
> +
> +    /// Returns the `Device` that owns this GEM object.
> +    pub fn dev(&self) -> &device::Device<T::Driver> {
> +        // SAFETY: `dev` will have been initialized in `Self::new()` by `drm_gem_shmem_init()`.
> +        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
> +    }
> +
> +    extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
> +        // SAFETY:
> +        // - DRM always passes a valid gem object here
> +        // - We used drm_gem_shmem_create() in our create_gem_object callback, so we know that
> +        //   `obj` is contained within a drm_gem_shmem_object
> +        let this = unsafe { container_of!(obj, bindings::drm_gem_shmem_object, base) };
> +
> +        // SAFETY:
> +        // - We're in free_callback - so this function is safe to call.
> +        // - We won't be using the gem resources on `this` after this call.
> +        unsafe { bindings::drm_gem_shmem_release(this) };
> +
> +        // SAFETY:
> +        // - We verified above that `obj` is valid, which makes `this` valid
> +        // - This function is set in AllocOps, so we know that `this` is contained within a
> +        //   `Object<T>`
> +        let this = unsafe { container_of!(Opaque::cast_from(this), Self, obj) }.cast_mut();
> +
> +        // SAFETY: We're recovering the Kbox<> we created in gem_create_object()
> +        let _ = unsafe { KBox::from_raw(this) };
> +    }
> +}
> +
> +impl<T: DriverObject> Deref for Object<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> DerefMut for Object<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +impl<T: DriverObject> Sealed for Object<T> {}
> +
> +impl<T: DriverObject> gem::IntoGEMObject for Object<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_gem_object {
> +        // SAFETY:
> +        // - Our immutable reference is proof that this is safe to dereference.
> +        // - `obj` is always a valid drm_gem_shmem_object via our type invariants.
> +        unsafe { &raw mut (*self.obj.get()).base }
> +    }
> +
> +    unsafe fn from_raw<'a>(obj: *mut bindings::drm_gem_object) -> &'a Object<T> {
> +        // SAFETY: The safety contract of from_gem_obj() guarantees that `obj` is contained within
> +        // `Self`
> +        unsafe {
> +            let obj = Opaque::cast_from(container_of!(obj, bindings::drm_gem_shmem_object, base));
> +
> +            &*container_of!(obj, Object<T>, obj)
> +        }
> +    }
> +}
> +
> +impl<T: DriverObject> driver::AllocImpl for Object<T> {
> +    type Driver = T::Driver;
> +
> +    const ALLOC_OPS: driver::AllocOps = driver::AllocOps {
> +        gem_create_object: None,
> +        prime_handle_to_fd: None,
> +        prime_fd_to_handle: None,
> +        gem_prime_import: None,
> +        gem_prime_import_sg_table: Some(bindings::drm_gem_shmem_prime_import_sg_table),
> +        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
> +        dumb_map_offset: None,
> +    };
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e0837ffc91bf..40de00ce4f97 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -38,6 +38,7 @@
>  #![feature(const_option)]
>  #![feature(const_ptr_write)]
>  #![feature(const_refs_to_cell)]
> +#![feature(const_refs_to_static)]
>  //
>  // Stable since Rust 1.84.0.
>  #![feature(strict_provenance)]

