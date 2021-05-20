Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACAA738B76F
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbhETTYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237886AbhETTYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:24:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26BDC061574;
        Thu, 20 May 2021 12:23:31 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id c196so9248857oib.9;
        Thu, 20 May 2021 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k8jbqnkIhb6Scb2ilNgSqrLUoD8EKnp1ewooO1thaYY=;
        b=ky35ahVtuQfQMvjOeiiTTPbXaYneyr4RFONeMzlHZyexsj5rX8XhdDpXsJiz3dYVul
         wYEKc3B8k42wdypOpMotQdOBiW6RXqUf466s1oEBZQU6IkBUzqApaFH279BKcODv9hry
         PkF70uZo9+I53o7qHAZUR34SlhlZoBHznh7PXCQFdZ4P27ZO3q0mS1oAkkk6diq9K7wA
         H0TVgKnJXqieJQMfk5bah0AGLFSycfWfD1VdIj7QrdhLZc3kUcsgrJHYSJ5WnDM3V1ln
         buTBOgiEZaYLxzGvxv+fah+PD2XV36vh3/drhElt98f6HpQPL7x3i7dthMbIZ7mDX0/o
         QpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k8jbqnkIhb6Scb2ilNgSqrLUoD8EKnp1ewooO1thaYY=;
        b=r0nyKadkVAFx8nADUa8z2Vk7NZhhhnZH3OKMEwvgWly6yqSzXCFuCbI5Vx1auvx+JJ
         CZ6DipMmyv+aHdUr2zKVc2B802vGqbw5/eaY2f/W9S6SrV2fKsyFoRIK3GJzRBn142fu
         cbns3UB071xASMgCU9S914iBGtGw5Ouc6LhcUQCiZqELjp+kqhyQpGAi5y+5QtkFXE6y
         kuI1EK9TSpnB3rxTDQJCFJ6DcEM+Kpw+Mmb35kgf8Kz17G8bYCpmGJVc1V3M2VManZiO
         aMyAc82iUl8WwVMfgmUnD6OKv4gjq4+aq7RvpFIRHV09r+xFdwitG25F2XfhidAQmL3X
         +Jyg==
X-Gm-Message-State: AOAM531fbsyZ+tVODq01OUGa0l8jRr9cK2ekc6WXgcdHMoz7JfZ/H3FN
        ukwpkJF3Gpz20Nu29TXq44bSzwlV2n5d1kyTtlA=
X-Google-Smtp-Source: ABdhPJy+NQtM83k5lhJDRCaPOOpyGysTMYGPd3KkfE/RldWsZC16fzPXRl9aFd4m2P2dyrXamOmLBaNBTAo1U4tUMGA=
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr4210776oie.120.1621538611248;
 Thu, 20 May 2021 12:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-33-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-33-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:23:20 -0400
Message-ID: <CADnq5_OMyd3JpAhjAsBmZGCNTqWTV4ZSOcvTv6jJCAokBg0y=Q@mail.gmail.com>
Subject: Re: [PATCH 32/38] drm/amd/amdgpu/sdma_v4_0: Realign functions with
 their headers
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

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:764: warning: expecting prototype=
 for sdma_v4_0_page_ring_set_wptr(). Prototype was for sdma_v4_0_ring_set_w=
ptr() instead
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:830: warning: expecting prototype=
 for sdma_v4_0_ring_set_wptr(). Prototype was for sdma_v4_0_page_ring_set_w=
ptr() instead
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v4_0.c
> index d197185f77890..ae5464e2535a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -754,7 +754,7 @@ static uint64_t sdma_v4_0_ring_get_wptr(struct amdgpu=
_ring *ring)
>  }
>
>  /**
> - * sdma_v4_0_page_ring_set_wptr - commit the write pointer
> + * sdma_v4_0_ring_set_wptr - commit the write pointer
>   *
>   * @ring: amdgpu ring pointer
>   *
> @@ -820,7 +820,7 @@ static uint64_t sdma_v4_0_page_ring_get_wptr(struct a=
mdgpu_ring *ring)
>  }
>
>  /**
> - * sdma_v4_0_ring_set_wptr - commit the write pointer
> + * sdma_v4_0_page_ring_set_wptr - commit the write pointer
>   *
>   * @ring: amdgpu ring pointer
>   *
> --
> 2.31.1
>
