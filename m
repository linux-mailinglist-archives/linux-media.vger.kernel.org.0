Return-Path: <linux-media+bounces-49227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD577CD2C7A
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CCBD300C521
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E77305E2E;
	Sat, 20 Dec 2025 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q4uxg6Vw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E8136349
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224101; cv=none; b=EXlTEauYiJ+NA1tf47gIJOp+CCkhQ2YlOi1GpyOBFRxYiwp66a+zWOmJZRc8Fn0ZzxAiLnLu7mPGuq4U8Ge+CTHm7uYiabQNy7jU+MMpQlXArmCtaGyySCy1K/sOY3an24tORbBwnyjN3C4nyjOBfFCR+NTs6Z8sMtY740kOhSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224101; c=relaxed/simple;
	bh=rqVPjPvOP/eczPJdYGczf1j/6Xtk0OMMW37CAdn8u8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SzQfEcLTbCsN48IDPW6LN22lGZkGJcXtK+ebsm5Q5LZtJF8DLDluPkbo4PMPE/hBXhDcn5Wsj2QR52UiN3ACQbjdr3F9F8lr6uds4XVwNMcs2fq4AC9uM7Da5OGkmrhlPVoQ4bbn2XVCMeZjVsI6p/XskK4UhD5an7Ee1ROzDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q4uxg6Vw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477c49f273fso32938065e9.3
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766224099; x=1766828899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
        b=Q4uxg6Vwu3VxffWrGfyJrv+togy6gbYjxNv/HGQjR3rSamdZ+GiovZ65u+1XkgXjql
         bjSAzqihfbNVN7eY8zGtQeLWut/AeR3Hjd1s1r5yVdL5oU+ePlEzL4zbdROifqe2zgUX
         khxODN+T7l9hXwQtmJbpvokq4NsDy3HlHgBo6SiyGKaOecaxPqEbvvNe0oO0Q/v9hEgy
         HqIdmFXf2eF3anX1KoLlMOKC0HUH+YwclnVyqdUkGPeaGyH3StodtRtjz19uO0hF2v3w
         GVvFmSG72TewQOdTQSC3indiaBToMbo/zwy05oGLgVYBVWOOL9pQvJuonY0QDbjDvNod
         n/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224099; x=1766828899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
        b=JHTImVnpDls+Z2FZaIYmeUG/QI/TlwwG8qZwYLNcGV6Gi3uhNzY5zByegrB2p2bCbc
         HgFOKQmmXdVNE57cFwRrQI4wiLa60UYd/G7JQMUgnUb4394/IEYuXeFPe4cbjmJF78yw
         0aM+AuMlqo0UHlE/86LKi2Xw16O6rhI+2ahFDwj/ZgIIwFBYmhk8nF3D0eBT8pU0/rq6
         2gLElBW7fhzvPrksr3bTcHV5pCAJ3whPJi6x09FAJdu7C/5lPzSoPbTUhgjizUee72wx
         hHFONRo4/eexbRl5TuuDEa/E/KosYUl5lT5atluAhkL4cndxOHbHCrwzb/MlBFliDcTi
         sZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQY2G7wkktVeVhPDZAQWzjyTewUlIWbBuqgUHYWGnjBpN87bjgQUVA8lftOR6xymUX2wLBpFTw2tX4zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZxb7CF+QmK10n6Bg3eef4IpPYe7gvgxDM9lvoxKR74iC+eNr
	6iiEgCHrjQaUjlOOFlVQQ8P+iAS0Ajfw5n9CLNjvt0g0iKwTXaLGpWb2Z6s9UCy2/cMHedVvwWX
	v5oNeLj4oyUcIYuY9oA==
X-Google-Smtp-Source: AGHT+IF/wwyCbmZKrb9+OJuirDYtRZw2m8SWoZaJ0QqeIqy0vt7I3G/xdsnBsD2ylGONwHmPG8Ly7PYUfnT9IJg=
X-Received: from wmbjp12.prod.google.com ([2002:a05:600c:558c:b0:475:decb:4c4d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-47d195667d6mr53518855e9.10.1766224098608;
 Sat, 20 Dec 2025 01:48:18 -0800 (PST)
Date: Sat, 20 Dec 2025 09:48:17 +0000
In-Reply-To: <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com> <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Message-ID: <aUZw4fpWRUWFsb9r@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 19, 2025 at 04:35:00PM +0100, Danilo Krummrich wrote:
> On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> > +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> > +    #[inline]
> > +    pub fn obtain(
> > +        &self,
> > +        obj: &T::Object,
> > +        data: impl PinInit<T::VmBoData>,
> > +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> > +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> > +    }
> 
> Does this method make sense? We usually preallocate a VM_BO, then enter the
> fence signalling critical path and then obtain the VM_BO.

Hmm, but there is something tricky here. When do we add it to the extobj
list, then? If we add it before starting the critical path, then we must
also call drm_gpuvm_bo_obtain_prealloc() before starting the critical
path because obtain must happen before drm_gpuvm_bo_extobj_add(). And
adding it to extobj after signalling the fence seems error prone.

And besides, adding it to the extobj list before the critical path
means that we can have drm_gpuvm_exec_lock() lock the new BO without
having to do anything special - it's simply in the extobj list by the
time we call drm_gpuvm_exec_lock().

> > +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> > +    #[inline]
> > +    fn deref_mut(&mut self) -> &mut T {
> > +        // SAFETY: By the type invariants we may access `core`.
> > +        unsafe { &mut *self.0.core.get() }
> > +    }
> > +}
> 
> Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() and
> data_mut().

That's fair.

> > +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> > +    #[inline]
> > +    fn drop(&mut self) {
> > +        // SAFETY: It's safe to perform a deferred put in any context.
> > +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> 
> This does not need to be deferred, no?

I think what I *actually* want to call here is

	kref_put(&self->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);

like what drm_gpuvm_bo_obtain_prealloc() does as of the first patch in
this series.

> > +    }
> > +}
> > +
> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> 
> How is this different from GpuVmBo? The only object that is not in the GEM list
> should be GpuVmBoAlloc, i.e. the preallocated one.

The difference is whether there is pointer indirection or not.

This type is morally an ARef<GpuVm<T>>, except I don't expose any way
to increment the refcount.

Alice

