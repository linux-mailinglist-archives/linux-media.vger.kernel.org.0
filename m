Return-Path: <linux-media+bounces-27532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3004AA4F2F4
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 01:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66753188582F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 00:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3694D4AEE0;
	Wed,  5 Mar 2025 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EZ6NjMtB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9A32C85
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 00:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741135711; cv=none; b=L/eIdgXa7jqt4ZuPa4tb5zrYeJlj1KiaNS/nPU9L+x4os2GlsNu6IcoWa3zzVNnnz5YtcK9z5mr0SOYnE3e3BjICienyCtEoE4MCautTJw4ggQGKoE74uLmMs7pBHdr0B8Abyyo/D7UEn5F4Cr+Bq2UV5cUeWJu7FoUYHM40vjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741135711; c=relaxed/simple;
	bh=l8hOYfBwUIt4CU6TvmqlsZSPKBWt7NZAO4uGMUF/+So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIU5mpmOAL5fgG6Zikocngjt2CvcfYrEGBpFMKn1YMV2fS9hjirxt4jf+O1T0w/6i8EuxtGAFI68/IO1S/tsYUscIK95LLVvgD0+d5guTC/fT6KmKoqbUSCM3nFMESypUsrfKkm+zt1Z9CsQ5M/wnROb/m1TR3mMDemfr7Nx5Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EZ6NjMtB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ba8a87643so24485e9.0
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741135708; x=1741740508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpdfKf6RfaEe0n4JSWIwj1bvttMewhoSuLGnC7ajBRY=;
        b=EZ6NjMtB+b+xP+tYPmgxMpkmueOAZD6bajU8e22g02dEiHFJD8VwtSU7gfvpazmLZA
         SOQXPaBaTllksfYzIVhDJfrvynjxdrwEozPwO8QiFPBHqbaEbPsdnGTPnsYVi9Z2QDXH
         Q76vZVA0YEsP3g2WyTHF4X5bZ2+7pbvZqCz2iCa1Ge6lF6hkkMvPfD7InJYlJQl0KnSP
         TVhFGgAIEM4wW8M5WtIWFa+C15Im5r1XZLLsbf19Hwbsu1fpS8HgTFkcpmF3Vlg9KRe9
         U8extPjqoFuTXRROea+qU6so3QQi1ouR2NbmFP5zVdkTRpxhlx+s+wUMNK+q0R7C1ybF
         vJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741135708; x=1741740508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpdfKf6RfaEe0n4JSWIwj1bvttMewhoSuLGnC7ajBRY=;
        b=ReV+jsvLZvDlJu3apLCWzAifekt4vuaqHPOsegcgH4oeYOrw8VyMoArYXVqREcQb/q
         5eSY801GyRcEARafxXCtzLiz0H3xr2FSnBWWYUD2bYLAGLxwl+QB6BSYW95cAiw4X4wZ
         xNDVtmKj2OdhitRdM2HRHjantxSlBACYPkqFivtfuo18CWgoOO0TVeIx6I72LqCebHn6
         doc6o49mTi7P8YXXbfak/S8SApwsjNudjWXaDZ6BJmlpftxZ0bRqDpNgd0xLyOUOkkXC
         Tt47CHXpTsBve/cYSQAU+rshGrLq+TUuOhBYCI6veyPP2+bCqTwdkf/l7zABdXKW7sHM
         8TXA==
X-Forwarded-Encrypted: i=1; AJvYcCUjZzadh9hMnL0Q0hl2n043GZv+CAh1X36flyOxsgHJ0ga0NXxLq0/STZIlK2iGYrs3pV1LpbnvO8NYgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzduxxmzxy1er7x50SacHFhA0KlcsepbKOjI6eas/DZtmqL0f30
	VLXzrfsWDgav6+I/rmRcbpTv+tMhfjozdiZ3eq6fTjhbVR6OfJHSF9+6ayZfxa8iMx2IsFN2UEP
	kVm+jLjG8/FYb3dDq6mBeHaB51yYkximELdEq
X-Gm-Gg: ASbGncv+TzkWgFc4R/HAgACAggyJAI7G3wlfmKe5gW/h1mn5nI1x4X15T6BzGgvKvD+
	wuQNaaLNRZUF7k6/e/LJnOa/opY1uwn0Ne7qP7BPxmZge4JyOrdHTcXUMudtQntDZxs3dj8UY0m
	wh3cGG044Y1nlAFq+3iUpaQVUWI1d4BXnd4s2YgvBDOJWaBQTeyYtTDZDl
X-Google-Smtp-Source: AGHT+IHS/CmjXgegGcxmRpNS98l46ZS6jKoa5Lns8rQL3j5jNusGGs4P4kOCp/wB0pBcvC4rGkpBgAWFwp9wMlZaewY=
X-Received: by 2002:a05:600c:a20e:b0:439:7fc2:c7ad with SMTP id
 5b1f17b1804b1-43bd360dd0bmr264395e9.7.1741135707908; Tue, 04 Mar 2025
 16:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303160249.118549-1-mripard@kernel.org>
In-Reply-To: <20250303160249.118549-1-mripard@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 4 Mar 2025 16:48:16 -0800
X-Gm-Features: AQ5f1Jq3ZGx0qLsX7f-KsnmsL9RZFbs2tncfnAJKVdS694Nl6LlvniytB56xX18
Message-ID: <CABdmKX2bA3R3RTvzaRTj5313o5cxdhf8b30YTNNKFq5Bqs09=Q@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: dma-buf: heaps: Add heap name definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:02=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
>
> ---
>
> Changes from v2:
>   - Remove exhaustive list of names for platforms, and just mention the
>     alternatives.
>   - Add MAINTAINERS entry
>
> Changes from v1:
>   - Add the mention that the cma / reserved heap is optional.
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 25 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  MAINTAINERS                                   |  1 +
>  3 files changed, 27 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> new file mode 100644
> index 000000000000..5b92d69646f6
> --- /dev/null
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -0,0 +1,25 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +Allocating dma-buf using heaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They =
are
> +typically used to allocate buffers from a specific allocation pool, or t=
o share
> +buffers across frameworks.
> +
> +Heaps
> +=3D=3D=3D=3D=3D
> +
> +A heap represent a specific allocator. The Linux kernel currently suppor=
ts the

"represents"

> +following heaps:
> +
> + - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s

Period at the end?

This description is my understanding of the current state of things, so:
Reviewed-by: T.J. Mercier <tjmercier@google.com>

