Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19E038B751
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238137AbhETTVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238018AbhETTVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:21:40 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F65C0613CE;
        Thu, 20 May 2021 12:20:19 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id j75so17389753oih.10;
        Thu, 20 May 2021 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PfgwTVkMgiwTa2ZUJi4Rqpy4DzXkVzihsc1UndFlxZA=;
        b=NKXl/O4Ah4nhqRZkqVf7JWT06B7xn241Wl6InCIzbJbLIuLi4vfTnaDrtlDTjxDQVi
         n30NCGYnAoGxnSG/VWuWTQ+YK7PcX9F9m5Xpy8FvszrYZNU3ITT17+QkEfw/+eCQ+Pkt
         mLk4rneTHZwhebapO0piSnDF2/cEBjYQY/NbDQitSmHZSiZ11NWAPqW8C3iOPpcFafJN
         qCP9cMoArj2JNtrRctLNjX6fyLtrTmYEkwu0AHzbJOi4N+RnXc2su55cSnse9MAWxLBJ
         z0h7NrAKCgvhrjjYExJ3ftsS1HKoD+9OnT8mPmjAez+Vncw+mZOevxqJhe1TsUGEAEbS
         mq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PfgwTVkMgiwTa2ZUJi4Rqpy4DzXkVzihsc1UndFlxZA=;
        b=W0FmVYcdL04lB7gn6B/KQ/uJUjP/BcjbrfZgaQXb8KlBRLrdS+vi3moQNX/Pz/nB6O
         ZxXQL8T+rzjHAUeWo0WzvRm/ndxYM4OuawQV0a1qFl7dgTdZKCTgoEMvMjXzKgphz+ok
         9PhV9Pd2wkPMI/MkMLPzgpbvB9QBjHgRnSS558/nzWy3LWf1Uma8WlGsWoUcz+2Ue8Zk
         TjA/AtILYRJZDRUrDWjbd4OP2+mzGhfDbN6/M/Fsm/WUAbT/AVnPoPpLdLU+fA81aGMA
         64gSTy68prrwqe0/FFqBDbMpjZvM4ShV3Z6FXyZv9DGkcuKDm673hUAsTpXgePx3nx4G
         0U+w==
X-Gm-Message-State: AOAM5324th0V2pnOtdQMjTTBJ6se3aEt/j6VcXfnmUW4SKG1l0lvH9B8
        Ar77L0N3kMj83T7a7dUCPyXGCUMnFb1ooQaMM6uDkMXt
X-Google-Smtp-Source: ABdhPJwvc46ikCv5xL8krtN+XasKLQNxgGwSb0z9zUHEbeOTG8SunshtMqXtCUQ8+ULgPYLiJCxGyKV39ZYg0zNwFbc=
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr4203881oie.120.1621538418645;
 Thu, 20 May 2021 12:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-27-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-27-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:20:07 -0400
Message-ID: <CADnq5_PaefTWkWnOPTJMTgL-zocXtB9wGnK30PiZG2iNAA=oOw@mail.gmail.com>
Subject: Re: [PATCH 26/38] drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste issue
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:955: warning: expecting prototype=
 for gmc_v8_0_gart_fini(). Prototype was for gmc_v10_0_gart_fini() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v10_0.c
> index f02dc904e4cfe..105ed1bf4a88c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -947,7 +947,7 @@ static int gmc_v10_0_sw_init(void *handle)
>  }
>
>  /**
> - * gmc_v8_0_gart_fini - vm fini callback
> + * gmc_v10_0_gart_fini - vm fini callback
>   *
>   * @adev: amdgpu_device pointer
>   *
> --
> 2.31.1
>
