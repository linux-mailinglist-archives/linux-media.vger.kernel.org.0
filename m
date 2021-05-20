Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E76C38B6D1
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbhETTO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbhETTO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:14:27 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C771C061574;
        Thu, 20 May 2021 12:13:04 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id v22so17436002oic.2;
        Thu, 20 May 2021 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f1HOQI0BiwYrzUbgtBfaRLayWrin0jlbAh0a0ONBLOo=;
        b=uQBkLZJqm0DE/dKM+x7eb9gLh8/XDQt5USaoCAeW2WbEHrTj2uym/bC+wCmhG0gcl4
         v4NQnxVANDznwTrUF2WAxSaLDVfwZPjcLsiIUd7gsifdF2O/K+9d/qSdM6vpL8UzCQ2/
         73uBQdlN03hLEV+x5rSZqiIJ5du8gB+Fgd9odvQcpXzIPrTOB/QGQ9IXdoDesyE8sy52
         kfTPxvTssaqnqYUnD5b3xYlU05n8y4dO7HzRUksofF4xi+w4eDcv4jFMSjbhQpef7aRE
         3zbqsXANWhvcqhHJDz3Qn1pw7IL/xwiWgYZDEcs/RBTUJ1t8qLRcLfZsz6YLEMgo8I/0
         DINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f1HOQI0BiwYrzUbgtBfaRLayWrin0jlbAh0a0ONBLOo=;
        b=ia41hAVHGaG2bdxLxe3Dx5o6xkM4fsnj5Rs4q7gwizy7E89U9uKxoeZ+1ub2gZAcu9
         2z/by/eSDLssH8fBp4HN/ApFWpT8h9oDXp/B6WSB4SVo7S/ysHtBJ5x7JTmjG58m9Qq3
         cm5ymYup8m+beD0lr/Nb69QiiE+ebc8Uo19V+T6s+qqmG/fvgTQtjSckYs1g4voKpXys
         dGk2woVb00cfjYhOAEv3+bMFvEJCvwlKZRybRHyj0ZPsJzhPBcxwiXuHZaGm+oDZrbYU
         wldTS9s60hx03eCkcKpD5VJ1giZgFpIRZQB3UaYkzDXbAdT1tetJb1FwlOlOACZ6KbB4
         KiYQ==
X-Gm-Message-State: AOAM532EPFSPT9G2cqEH+Muib1MnhZuAkzbhd2qi/g9ONhYRQOszWDqz
        75RiX9/6vr4b3oViwZXCn2VO8+SkW5bCVDNVCD0=
X-Google-Smtp-Source: ABdhPJxpLtprybsUn1KTxq9uRURqDKRbgBwQ5gkvNzCxNnBiUHkZOfWu506pJSfVTEeY/5X+bvFi9I9ic2wihYDZZHc=
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr4186705oie.120.1621537983767;
 Thu, 20 May 2021 12:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-14-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-14-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:12:52 -0400
Message-ID: <CADnq5_NPpWbDwOffhShmWGTydz+fu0K-OQ=HO81+tcOWKzaicQ@mail.gmail.com>
Subject: Re: [PATCH 13/38] drm/amd/amdgpu/cik_sdma: Fix a few incorrectly
 named functions
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
        Evan Quan <evan.quan@amd.com>,
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
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:735: warning: expecting prototype =
for cik_sdma_vm_copy_pages(). Prototype was for cik_sdma_vm_copy_pte() inst=
ead
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:762: warning: expecting prototype =
for cik_sdma_vm_write_pages(). Prototype was for cik_sdma_vm_write_pte() in=
stead
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:792: warning: expecting prototype =
for cik_sdma_vm_set_pages(). Prototype was for cik_sdma_vm_set_pte_pde() in=
stead
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:814: warning: expecting prototype =
for cik_sdma_vm_pad_ib(). Prototype was for cik_sdma_ring_pad_ib() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/=
amdgpu/cik_sdma.c
> index c4bb8eed246d6..c8ebd108548d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -720,7 +720,7 @@ static int cik_sdma_ring_test_ib(struct amdgpu_ring *=
ring, long timeout)
>  }
>
>  /**
> - * cik_sdma_vm_copy_pages - update PTEs by copying them from the GART
> + * cik_sdma_vm_copy_pte - update PTEs by copying them from the GART
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> @@ -746,7 +746,7 @@ static void cik_sdma_vm_copy_pte(struct amdgpu_ib *ib=
,
>  }
>
>  /**
> - * cik_sdma_vm_write_pages - update PTEs by writing them manually
> + * cik_sdma_vm_write_pte - update PTEs by writing them manually
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> @@ -775,7 +775,7 @@ static void cik_sdma_vm_write_pte(struct amdgpu_ib *i=
b, uint64_t pe,
>  }
>
>  /**
> - * cik_sdma_vm_set_pages - update the page tables using sDMA
> + * cik_sdma_vm_set_pte_pde - update the page tables using sDMA
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> @@ -804,7 +804,7 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib =
*ib, uint64_t pe,
>  }
>
>  /**
> - * cik_sdma_vm_pad_ib - pad the IB to the required number of dw
> + * cik_sdma_ring_pad_ib - pad the IB to the required number of dw
>   *
>   * @ring: amdgpu_ring structure holding ring information
>   * @ib: indirect buffer to fill with padding
> --
> 2.31.1
>
