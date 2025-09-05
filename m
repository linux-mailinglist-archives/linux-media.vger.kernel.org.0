Return-Path: <linux-media+bounces-41850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2671B45C5B
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 17:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 378BE3B82B8
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 15:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235A22C21D0;
	Fri,  5 Sep 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CJO5fkgn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569931B81B;
	Fri,  5 Sep 2025 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085582; cv=pass; b=QwaHKrdsMLiqd6HN32g9NnB//7SFjT79eTBQIGaojrOJkP2yIVYotfgh+CPeAk/xuH0ghvIXacQIaJ/bjQpgnEa9kpoDINkyu+dvZtLKAXuGL8mdYr5BATFT2NG90kv/DHrGFfuncTn3rx8mLE7zLEGaoPC1vuEvwSH2HAUfAWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085582; c=relaxed/simple;
	bh=TQ1Yli/mjvLpY76C5SbFhJX/Muh/7iPRfCGOv9erSQw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oJB7DFzBGbvm002TBtm5vYYWrzcFAOTRGAb/6Xg9DklLDUHnI0URNfwRq21x5b64w9LC44tit121DCyP7qYS9HSIFXjBaOjjKQm/y1FXDpXmFo9jt1oA658N3PYAPlhwReLbsxEDFRbqfrPN7TqLBkZ31UH/H5rHo4RrkNtByPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CJO5fkgn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757085547; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JGlElhOkLBJPIeqbwCoHjSjJ5NI7enbdWrKyrw8q+sY0J7oK8hfY9lIgNoLH8yZ1YDdxLOnOCB2ZXWfD7+fF2XQDuicLZl5lPi7Nx9nL/ggaiXXlPU4ThbaVnQEtRmNwxB7d83fTENPmwvowYjvQy56L4UCvgVnvAXmAxcvze4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757085547; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WvMWIb097CAfEDcALNW+hr4jEjolOIJhOGMsgheYVik=; 
	b=hfYLkWeLSn8haeiazMARP7lJh0oiOjboJdyhHyOWT0p7GbkIYWwzoYX6ZqXV2ziLsF5/Udk9lnaaGlgwH9w+Y4DV3457zMDjP0f8sQzcgYsOZY91ghdfLTV16VgkaDEZ8eE5saN4Q1FJOX7ibBgFy5FagWWdTRdL4+vrJGOSBfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757085547;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=WvMWIb097CAfEDcALNW+hr4jEjolOIJhOGMsgheYVik=;
	b=CJO5fkgnV/OpTh5xLkfsJmyl1URRXq8Jwyl2Hjo+uvk/WOvg8fMrttWXzUpr3jbs
	U+S6Ldw2zcEdCgblxfAqAqNgRfyef4jqn7gjFhk0vcsi2F3N5edqvUKDaXelKQxgyp9
	NyRzvjHp307Wl0lDivuM3YdHi5iA6phdFBtaAwnA=
Received: by mx.zohomail.com with SMTPS id 1757085544614181.09692545870018;
	Fri, 5 Sep 2025 08:19:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 14/14] rust: drm: gem: Add BaseObject::prime_export()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-15-lyude@redhat.com>
Date: Fri, 5 Sep 2025 12:18:47 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Asahi Lina <lina+kernel@asahilina.net>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linux-media"@vger.kernel.org (ope>),
	"moderated list:DMA BUFFER SHARING  FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linaro-mm-sig"@lists.linaro.org (mod>)
Content-Transfer-Encoding: quoted-printable
Message-Id: <282C2384-D046-43E3-88DE-70A130961D93@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-15-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> We just added an export() callback that GEM objects can implement, but
> without any way of actually exporting a DmaBuf<T>. So let's add one by
> introducing bindings for drm_gem_prime_export().
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/dma_buf.rs     |  1 -
> rust/kernel/drm/gem/mod.rs | 24 +++++++++++++++++++++++-
> 2 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
> index a66829afcd129..a2086918efd17 100644
> --- a/rust/kernel/dma_buf.rs
> +++ b/rust/kernel/dma_buf.rs
> @@ -20,7 +20,6 @@ unsafe impl Send for DmaBuf {}
> // SAFETY: `struct dma_buf` is thread-safe
> unsafe impl Sync for DmaBuf {}
>=20
> -#[expect(unused)]
> impl DmaBuf {
>     /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
>     ///
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 1ac25fc6d527b..75ffd5541e84c 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -11,7 +11,7 @@
>     bindings, dma_buf,
>     drm::driver::{AllocImpl, AllocOps},
>     drm::{self, private::Sealed},
> -    error::{to_result, Result},
> +    error::{from_err_ptr, to_result, Result},
>     prelude::*,
>     types::{ARef, AlwaysRefCounted, Opaque},
> };
> @@ -225,6 +225,28 @@ fn lookup_handle<D, F, O>(file: &drm::File<F>, =
handle: u32) -> Result<ARef<Self>
>         Ok(unsafe { ARef::from_raw(obj.into()) })
>     }
>=20
> +    /// Export a [`DmaBuf`] for this GEM object using the DRM prime =
helper library.
> +    ///
> +    /// `flags` should be a set of flags from =
[`fs::file::flags`](kernel::fs::file::flags).
> +    fn prime_export(&self, flags: u32) -> Result<DmaBuf<Self>> {
> +        // SAFETY: `as_raw()` always returns a valid pointer to an =
initialized `drm_gem_object`.
> +        let dma_ptr =3D unsafe { =
bindings::drm_gem_prime_export(self.as_raw(), flags as i32) };
> +
> +        // `drm_gem_prime_export()` returns either an error pointer, =
or a valid pointer to an
> +        // initialized `dma_buf` on success.
> +        let dma_ptr =3D from_err_ptr(dma_ptr)?;
> +
> +        // SAFETY:
> +        // - We checked that dma_ptr is not an error, so it must =
point to an initialized dma_buf
> +        // - We used drm_gem_prime_export(), so `dma_ptr` will remain =
valid until a call to
> +        //   `drm_gem_prime_release()` which we don't call here.
> +        let dma_buf =3D unsafe { dma_buf::DmaBuf::from_raw(dma_ptr) =
};
> +
> +        // INVARIANT: We used drm_gem_prime_export() to create this =
dma_buf, fulfilling the
> +        // invariant that this dma_buf came from a GEM object of type =
`Self`.
> +        Ok(DmaBuf(dma_buf.into(), PhantomData))
> +    }
> +
>     /// Creates an mmap offset to map the object from userspace.
>     fn create_mmap_offset(&self) -> Result<u64> {
>         // SAFETY: The arguments are valid per the type invariant.
> --=20
> 2.50.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

