Return-Path: <linux-media+bounces-31675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C05CCAA8768
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 17:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E54CD7A3897
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 15:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973881DDA2D;
	Sun,  4 May 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuqPCzj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764611FAA;
	Sun,  4 May 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746373634; cv=none; b=h2SdTLw9N0Z6Qgj/uGQzBR7Ey7gw1UfKO1SZg1+xB2O9vRaMtUbKZCRgvlpklawkkTMNv8jTx8Volq7DL9/Q0GAqJ+76P6ilHdTMDYlUYP14pbK9mn9uSZIRaT0Lu7hfXH/swhrGG6PcIXU0i5XgVamwBUyYVCkm1gIqZQOTwPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746373634; c=relaxed/simple;
	bh=IQ3rkY0ClJBZ1s4b7NYJjJJo6icnC/Xa7LT8OWSym/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXCfAU9euFI+qg0TYDcovoqbV69FsFv//qM2H8nLUCE6yiiw0zHJGqvQoJ+bl3BZ7uNCNODC4dcHU+wL5LXuRrJxV18HWuzfsl0+2yv5S+s9zh7Vag/jjBpd1KiJCWfaTKaLtGrznrwjomqsBt32zuxQoX2LpFFlI3ThcnKIi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuqPCzj+; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso370039039f.3;
        Sun, 04 May 2025 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746373631; x=1746978431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCB11Y01+XCfvS4lsOkPaiVFvB4yeAtymGdAMyAi5Zc=;
        b=fuqPCzj+ueX6qHUI95W5tfRLCX8BIZjPO90Z/qrwqK0uFwt9ClhBcQGo1wSgkcmuLX
         hLkxBHVdvYiTyXJV10+5sJXFNTPLm8DEbdX7oZdeQAQl8cnRKz1sTNMuogHwjDxd3QpW
         d+GsdDytAYWKBHVz1kp7zFEvh14c/rRRgTiuAv+TWzsgHZ2nTIBmqTc5OSPpBYhnf6Pk
         T0XMtaZD8E1MMIFTCdj2Nd0TnmG+yy92i7bXIsL5bJXf600fW2yQ9wDKiPJjnH0o9u4K
         o6HKxG9EQags+bu3u1p1qTV1/JpUEpwlvCJMtNxe8PZlQF78/t9vGcByVXed0kpvY8oI
         +CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746373631; x=1746978431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCB11Y01+XCfvS4lsOkPaiVFvB4yeAtymGdAMyAi5Zc=;
        b=vr7XFZzY0Kljt/4Ynm8eIpCm752RknOGke9rmc+ui6f+bhlwtbn/Tf5ifhN+awFWCj
         xQFavyKY0yWzOhUjkfiRpkP0tmV8Xi9WXVE0I9YMSh6A1jh/e/5+nt8B9N9OWm38dymA
         npsjxqnt9haC3F8LwPVTS9QYn4ogwRh31BPJderQDNXFViGHlpcDrs6zm8rocd5R+skm
         671WWfRslQWp3MqQdK55Bd5lLGHGiOEDeACnT3uz1cC+WMgPClUNe5IZ4prH1pLNaqFb
         BB9X9K4oJAMDrKJKxV35sTfb8d2XuGE7IrBgL9KTWQF5zpkdEzTKywevYOOuHIRZz8OM
         DfNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1QGXbutp6HL9w1ooZzR932ntYqdxVpUGALGlu6ZfEZP/LmrV3ZwBYklWROT70lT/JsCKbJsoQZFVjpFVi@vger.kernel.org, AJvYcCUUzaRmVTJ14WCMs4YR9LmpyUl0y+8Pe6LNOdGmlPlK/aFPEb0irKpdRP+dXyu8ZH0fKgNNtXvT8wbUR4k=@vger.kernel.org, AJvYcCWacZg+hqbd+6sbBTI3R/kyD5dIDbf8+LKB80wS+ccMKrRS4jmxLLT5w7I0BqcltcUJR7mvb2i086sIufPx@vger.kernel.org, AJvYcCWvBgNqtKz1UicPH4vqj5bMXN3e/gGxlatPj/cM94fC9xWodgeYrvHh+vSb1gnRKAfi74/1OZGa@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdnNS0S5hLFOAG9qwKN4yAW+4QWWplwWplIoXliz1OQz2o+qy
	aRr87bP5IBAqKCuvwDdUPyLAWE6fbuJHX+9W9/efVcxlRZcKcitR42Cb8Q+Zl2Q1z5RRNDxqpax
	b16KDoFdULfVYyGrcZj3anjAQQ8I3/g==
X-Gm-Gg: ASbGncsNjP8BXR+WgvpYgajAg4yr4GL+M9nWv9+7dX8dejH9lg3lQj3fLwK6CxksEZi
	XkU7/QUoGKFjkv7eNrST2mepfOthU2KIZVLWxRgu8pPqJymngNoFS5xfVtGZZcW7B0jFSbsi2vC
	vPA9FJaUYgKmsO6ny+82EvoQ==
X-Google-Smtp-Source: AGHT+IF/JevtdssqiOoRgkiDW7LjLg2KSxw2gMBFdDf7RqHjZEb8cdLxhaA4CtAfXBLkKoc+S9iAwAL7qHV7dCcoc84=
X-Received: by 2002:a05:6e02:1889:b0:3d4:6ff4:2608 with SMTP id
 e9e14a558f8ab-3da5b2a3507mr46309295ab.12.1746373631447; Sun, 04 May 2025
 08:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424032751.3511768-1-haoxiang_li2024@163.com>
In-Reply-To: <20250424032751.3511768-1-haoxiang_li2024@163.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 4 May 2025 08:46:59 -0700
X-Gm-Features: ATxdqUHXwmSDwj980iTtQyggMLmzSvs4wue8EqnhIc3dPv_RZ4ci2s_gz9Q7m7A
Message-ID: <CAF6AEGssqH9yEV=gXjmsmLx_haAemjT9jHT1k6ZyXOHskRnucg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/msm: fix a potential memory leak issue in submit_create()
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: quic_abhinavk@quicinc.com, lumag@kernel.org, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 8:28=E2=80=AFPM Haoxiang Li <haoxiang_li2024@163.co=
m> wrote:
>
> The memory allocated by msm_fence_alloc() actually is the
> container of msm_fence_alloc()'s return value. Thus, just
> free its return value is not enough.
> Add a helper 'msm_fence_free()' in msm_fence.h/msm_fence.c
> to do the complete job.
>
> Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/msm/msm_fence.c      | 7 +++++++
>  drivers/gpu/drm/msm/msm_fence.h      | 1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fe=
nce.c
> index d41e5a6bbee0..72641e6a627d 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -183,6 +183,13 @@ msm_fence_alloc(void)
>         return &f->base;
>  }
>
> +void msm_fence_free(struct dma_fence *fence)
> +{
> +       struct msm_fence *f =3D to_msm_fence(fence);
> +
> +       kfree(f);
> +}
> +
>  void
>  msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fe=
nce.h
> index 148196375a0b..635c68629070 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -82,6 +82,7 @@ bool msm_fence_completed(struct msm_fence_context *fctx=
, uint32_t fence);
>  void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>
>  struct dma_fence * msm_fence_alloc(void);
> +void msm_fence_free(struct dma_fence *fence);
>  void msm_fence_init(struct dma_fence *fence, struct msm_fence_context *f=
ctx);
>
>  static inline bool
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 3e9aa2cc38ef..213baa5bca5e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -56,7 +56,7 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>
>         ret =3D drm_sched_job_init(&submit->base, queue->entity, 1, queue=
);
>         if (ret) {
> -               kfree(submit->hw_fence);
> +               msm_fence_free(submit->hw_fence);

`struct dma_fence base` is the first field in `struct msm_fence`, so
to_msm_fence() is just a pointer cast.  Ie. it is fine to pass it to
kfree() as-is

BR,
-R

>                 kfree(submit);
>                 return ERR_PTR(ret);
>         }
> --
> 2.25.1
>

