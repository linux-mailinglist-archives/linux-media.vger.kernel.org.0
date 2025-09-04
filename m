Return-Path: <linux-media+bounces-41773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 638ABB43CA9
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C82E11C21259
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 13:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D8301006;
	Thu,  4 Sep 2025 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tfIcCaTD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6022FE05F
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991407; cv=none; b=QsbLueOMO8VV77Wi3DrHaXSiOQHO2DUHFcKeQZh9KO7A3XiIC+28cz+4SJDeo/Y/UIQOPPJTfZZH0GJHNhH68w2fXIggwYIaopCg8F302M06D/wiO9EhmWjLaeEimgVyBDg1hrrvGRiaS7oLegfcS/h7QtvOX+XAzHzJKLbxJfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991407; c=relaxed/simple;
	bh=aa/yg978l0hp656ZEYGts+dDXE6SPkPYz7Q3QwwfGGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nh6uYxtioHGqc40CA+MsoCA5r0JC/5T28SId9sFoMy/BimPWzXWk12uTu7WyF9vusY7v0PTTzUOrPmUadhuJAQR95a95AB/VuSmHYlmAEICPD++QVzX1YN+IYYLzw/iH2tyBej4xMuLaNCO7PzxstV8JbA7CmZJg4tWHjqWtw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tfIcCaTD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3dea538b826so817803f8f.2
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756991404; x=1757596204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUmGcnb9DOoFKF6N0qbvgApw3pjqcT4j1CgQZsy8ec8=;
        b=tfIcCaTDXfGHtHbu+OU/RAJCaIPkXvfxqjwYQJWI7WUy2gSo6krZ7SEA4sAnQHpBsG
         sy/s5nfnVFv7XcQgdAPXZ/K6Y/idlH4/dd9pivmZGfHGga6WXyR81zMmR6Y4IRmvalfu
         3XBAA6ZJ2lqzCWccj0wWI4JZm4RdgMieEYCPgIrhz75ZggZwe1am3ULdpmMPmiyJB58H
         02vxJbHpLm3yXAo0fA7IfyZ3YUkOl1tW5vEP/cHfJPj9yK3esO9eJKJ0ecOplhhfgkfA
         d57CAGz58C8HShOEEXAWS87wGOplO3QFwvLc5EBhc6kVhnLiUSzU9Oe9lySxWyDJa2Tp
         +IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991404; x=1757596204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUmGcnb9DOoFKF6N0qbvgApw3pjqcT4j1CgQZsy8ec8=;
        b=SRWHKYDvJfh+mmAwN86HmPcbgz0g8DlBBQ/0hA807aGG0WuPlZU0tdHEH6B+3ctRdp
         xfPMi5CO8A+zfW+YU2DzHclC8Gk5LJ2wZjgHfYJ21Yl0ljzIN0xI1mlobMGKDHc9Wrno
         YSIi1SzazNKKUlfxHw+VXEnEEtDlX/CQhf1ZgucyuipwHyP23INcYq+Cz2PvhpaxJumI
         mz2lihwD7UIK4pub7TvpXwZQv4FHAmbx23nxJJPCIV3ee833Yu4V5Hk7cyjX3MF7KP07
         O4td+Ok0axJmcH4f3nswfoJJcX94dWKKQVOFAzXmgliItlB3iVK3JktOBMDMLUgZAZd0
         gD6g==
X-Forwarded-Encrypted: i=1; AJvYcCWsUp5XI+NCxrW78k8caBLDzGg9MGJ04DXQPt6y5LNW2mG/wvkwrDD2C4AHljH+LfbBvhHd8eRj3FjHTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzItr3QLpJ4COc7vYCYrOsHoSgbdRgaVJAA4ZUkP8webIEB1PmU
	VKG4JSYEQ9UD8vcc7qAnynyqGcCTG+GKFZlBR5cNQKG1qhVrsLs8LjA9mqyG+M9fsTezNoD1zHQ
	dnb4lI5qLoMHg6ufUaBlMF3Le7KYDIT8yDTjNBR6i
X-Gm-Gg: ASbGnctJJRQRWUrb6W5IMV60RyhrsN68ks/OBM2/juA1JtCeKaLHmync53+qg4zMp7N
	cGOIIYWqb6HurS+YTymnFDfRmhNqEVRSQklMb/LlKCLPQUG7bytb4FnXxwCKjxgUVfvS/DvoWra
	ad+iZlYP8+j1tQG1ePmiZ5ah8O7HBGAexzsHDQOIpa78Qrtc1u4yHHJhLOP+DtdGYkewcKa9AZI
	7JpVRuzSctOtcMtpzRdI/9QkYkWW02MUCSNWxq/IpOHQijcwJW46m4N4urpSS5e1HsHiVc7k1iG
	gJ4XJ8oOrqU=
X-Google-Smtp-Source: AGHT+IFHJ2ZrBugJMZBEfCi74IIrGqgkQHBE6XqdlI+XjphUPOfhoV+znXePJUYjgikhYscUmFzUrXSIaK4FVkPPW1w=
X-Received: by 2002:a05:6000:1ac8:b0:3e1:2d70:6785 with SMTP id
 ffacd0b85a97d-3e12d706fa9mr1875838f8f.31.1756991404184; Thu, 04 Sep 2025
 06:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829224116.477990-1-lyude@redhat.com> <20250829224116.477990-7-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-7-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Sep 2025 15:09:51 +0200
X-Gm-Features: Ac12FXy8H7G6oV4EU2UIFIgA0FDxXvR6Hytw96Q6mBmUHCGBN96sbfN9dB0h2Kk
Message-ID: <CAH5fLgjFePwYmyivpU-Vk2KbKtu7t5DJ1cZUJmEQ_Y+Dgynk9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] rust: drm: gem: Add raw_dma_resv() function
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 12:42=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> For retrieving a pointer to the struct dma_resv for a given GEM object. W=
e
> also introduce it in a new trait, BaseObjectPrivate, which we automatical=
ly
> implement for all gem objects and don't expose to users outside of the
> crate.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index ec36cd9ea69ed..f901d4263ee87 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -186,6 +186,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
>
>  impl<T: IntoGEMObject> BaseObject for T {}
>
> +/// Crate-private base operations shared by all GEM object classes.
> +#[expect(unused)]
> +pub(crate) trait BaseObjectPrivate: IntoGEMObject {
> +    /// Return a pointer to this object's dma_resv.
> +    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `as_gem_obj()` always returns a valid pointer to the =
base DRM gem object
> +        unsafe { (*self.as_raw()).resv }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> BaseObjectPrivate for T {}

I think this use of a trait is somewhat of an antipattern. I would
probably have suggested a standalone method instead.

Alice

