Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0166D7CB1
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 14:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237879AbjDEMdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 08:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237787AbjDEMdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 08:33:44 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06A31BD0
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 05:33:39 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5005c57f95cso43686a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Apr 2023 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680698018; x=1683290018;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLn0ogcl0BF5IqyMl3PAUGbH0jpqq1AyfGbugR/InEw=;
        b=Kj+iccolbVQfKM6jZP2rJr6vvKgZMe4H0SxVgfuZYTm3PnXPF0cVqAqxe80FPLqr+F
         L2MfX8A/pL0ohBy6Oshpt/8+orS19AKvmmkHGmmxImCIAvDHKY0BgnTDUZGzcVxDepO9
         EUSOhBxht69OnVyx6WqSCLMw6BX1kJjJ9TuYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680698018; x=1683290018;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLn0ogcl0BF5IqyMl3PAUGbH0jpqq1AyfGbugR/InEw=;
        b=zbbcgucmILNd6ep43Mt7CK0PqwhIMTlnxYow+sfuqueZdZoSwd0zPJwlHZvIMXsIYh
         rYuVpdxh1kPIr0noG2tNG81C8RD7rVr0+HHnojyGYvHO/AFqVFBNPIx0t907caF9T5Oo
         l3UkvbC+PnzIseh4ZY00IuV2e8DrElJD1+GLO74uXOf03pyIGcCKaGraobgCE2DEgAcF
         9O13OAtw7vg/3b7fzisqS/hXSqOLSh3A+s7de9CK0+LqtAOr+Yy6t8j71Ct58uwMXFPN
         TTdhRV8kWNG+TYj3f9ihXR5XK0rs7ajS5/88n48/hSgHf3xgpH+tBYsiIxVPnfuWC2h2
         qq1Q==
X-Gm-Message-State: AAQBX9dRfBNqxehoMQMmyvJ4Axh7ZYFm4Jtvq04MGahzKrMFTkU6jRjA
        TxacMTwHD5kldAEtU4Kj5/T9vQ==
X-Google-Smtp-Source: AKy350ZhdduIanzLnwpHgJZbwRaxsW16jBrBpTeCLciV2XUS3BdaanzgWlA2CYXsm/8QSGFPkEXSjA==
X-Received: by 2002:a05:6402:34c8:b0:502:367:d5b8 with SMTP id w8-20020a05640234c800b005020367d5b8mr1906388edc.4.1680698018440;
        Wed, 05 Apr 2023 05:33:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906938200b00948a57aac08sm3761007ejx.204.2023.04.05.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:33:37 -0700 (PDT)
Date:   Wed, 5 Apr 2023 14:33:35 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 09/18] rust: drm: syncobj: Add DRM Sync Object
 abstraction
Message-ID: <ZC1qn/VCVpudivh9@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-9-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-9-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 07, 2023 at 11:25:34PM +0900, Asahi Lina wrote:
> DRM Sync Objects are a container for a DMA fence, and can be waited on
> signaled, exported, and imported from userspace. Add a Rust abstraction
> so Rust DRM drivers can support this functionality.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers.c                  | 19 ++++++++++
>  rust/kernel/drm/mod.rs          |  1 +
>  rust/kernel/drm/syncobj.rs      | 77 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 98 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 705af292a5b4..b6696011f3a4 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -12,6 +12,7 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_syncobj.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-fence.h>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 8e906a7a7d8a..11965b1e2f4e 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -20,6 +20,7 @@
>  
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_syncobj.h>
>  #include <linux/bug.h>
>  #include <linux/build_bug.h>
>  #include <linux/device.h>
> @@ -461,6 +462,24 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_drm_vma_node_offset_addr);
>  
> +void rust_helper_drm_syncobj_get(struct drm_syncobj *obj)
> +{
> +	drm_syncobj_get(obj);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_drm_syncobj_get);
> +
> +void rust_helper_drm_syncobj_put(struct drm_syncobj *obj)
> +{
> +	drm_syncobj_put(obj);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_drm_syncobj_put);
> +
> +struct dma_fence *rust_helper_drm_syncobj_fence_get(struct drm_syncobj *syncobj)
> +{
> +	return drm_syncobj_fence_get(syncobj);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_drm_syncobj_fence_get);
> +
>  #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
>  
>  void rust_helper_drm_gem_shmem_object_free(struct drm_gem_object *obj)
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 73fab2dee3af..dae98826edfd 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -8,3 +8,4 @@ pub mod file;
>  pub mod gem;
>  pub mod ioctl;
>  pub mod mm;
> +pub mod syncobj;
> diff --git a/rust/kernel/drm/syncobj.rs b/rust/kernel/drm/syncobj.rs
> new file mode 100644
> index 000000000000..10eed05eb27a
> --- /dev/null
> +++ b/rust/kernel/drm/syncobj.rs
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM Sync Objects
> +//!
> +//! C header: [`include/linux/drm/drm_syncobj.h`](../../../../include/linux/drm/drm_syncobj.h)
> +
> +use crate::{bindings, dma_fence::*, drm, error::Result, prelude::*};
> +
> +/// A DRM Sync Object
> +///
> +/// # Invariants
> +/// ptr is a valid pointer to a drm_syncobj and we own a reference to it.
> +pub struct SyncObj {
> +    ptr: *mut bindings::drm_syncobj,
> +}
> +
> +impl SyncObj {
> +    /// Looks up a sync object by its handle for a given `File`.
> +    pub fn lookup_handle(file: &impl drm::file::GenericFile, handle: u32) -> Result<SyncObj> {
> +        // SAFETY: The arguments are all valid per the type invariants.
> +        let ptr = unsafe { bindings::drm_syncobj_find(file.raw() as *mut _, handle) };

Just an aside, but the semantics of this are nasty: You're not allowed to
hold any locks while calling this. We have runtime checks for that (if you
enable lockdep), but I don't see any way to encode that on the rust side
and check it at compile time :-/

> +
> +        if ptr.is_null() {
> +            Err(ENOENT)
> +        } else {
> +            Ok(SyncObj { ptr })
> +        }
> +    }
> +
> +    /// Returns the DMA fence associated with this sync object, if any.
> +    pub fn fence_get(&self) -> Option<Fence> {
> +        let fence = unsafe { bindings::drm_syncobj_fence_get(self.ptr) };
> +        if fence.is_null() {
> +            None
> +        } else {
> +            // SAFETY: The pointer is non-NULL and drm_syncobj_fence_get acquired an
> +            // additional reference.
> +            Some(unsafe { Fence::from_raw(fence) })
> +        }
> +    }
> +
> +    /// Replaces the DMA fence with a new one, or removes it if fence is None.
> +    pub fn replace_fence(&self, fence: Option<&Fence>) {
> +        unsafe {
> +            bindings::drm_syncobj_replace_fence(
> +                self.ptr,
> +                fence.map_or(core::ptr::null_mut(), |a| a.raw()),
> +            )
> +        };
> +    }
> +
> +    /// Adds a new timeline point to the syncobj.
> +    pub fn add_point(&self, chain: FenceChain, fence: &Fence, point: u64) {
> +        // SAFETY: All arguments should be valid per the respective type invariants.
> +        // This takes over the FenceChain ownership.
> +        unsafe { bindings::drm_syncobj_add_point(self.ptr, chain.into_raw(), fence.raw(), point) };
> +    }
> +}
> +
> +impl Drop for SyncObj {
> +    fn drop(&mut self) {
> +        // SAFETY: We own a reference to this syncobj.
> +        unsafe { bindings::drm_syncobj_put(self.ptr) };
> +    }
> +}
> +
> +impl Clone for SyncObj {
> +    fn clone(&self) -> Self {
> +        // SAFETY: `ptr` is valid per the type invariant and we own a reference to it.
> +        unsafe { bindings::drm_syncobj_get(self.ptr) };

So yeah syncobj are refcounted because they're shareable uapi objects (you
can pass them around as fd), but that really should be entirely the
subsystems business, not for drivers.

This is kinda like drm_file, which is also refcounted (by virtue of
hanging of struct file), but the refcounting is entirely handled by the
vfs and all drivers get is a borrowed reference, which nicely bounds the
lifetime to the callback (which is usually an ioctl handler). I think we
want the same semantics for syncobj, because if a driver is hanging onto a
syncobj for longer than the ioctl. If my rust understanding is right we'd
get that by dropping Clone here and relying on lookup_handle only being
able to return stuff that's bound by the drm_file?

People are talking about drivers holding onto syncobj for longer, but I'm
still not sold on the idea that this is any good and doesn't just bend the
dma_fence and syncobj rules a bit too much over the breaking point. For
kernel drivers it really should be just a different way to lookup and
return dma_fence from the ioctl, pretty much matching what you could also
do with sync_file (but since syncobj provides generic compat ioctl to
convert to/from sync_file drivders only need to handle syncobj).
-Daniel


> +        SyncObj { ptr: self.ptr }
> +    }
> +}
> +
> +// SAFETY: drm_syncobj operations are internally locked.
> +unsafe impl Sync for SyncObj {}
> +unsafe impl Send for SyncObj {}
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
