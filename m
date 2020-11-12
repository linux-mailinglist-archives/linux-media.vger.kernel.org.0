Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC69E2B1025
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 22:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgKLVXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 16:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgKLVXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 16:23:06 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90967C0613D1;
        Thu, 12 Nov 2020 13:23:05 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 10so6471056wml.2;
        Thu, 12 Nov 2020 13:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iDeWKLTvLVXueA9I1Hg6ZkwkqjSWwRDb6/Z4CA5NQ/8=;
        b=JmTWPaS6VtxbigLB/Kdjx7+7z/bD39Gco5F+WzLpOvkF3vovJZOoFhVbpUux3Mjqlx
         pa56sZBqCT58iHZzvD+v7ec1n1+eLdPpOeazo/9ulCq8GAXhfydiZem0cdWnJrOE/94w
         Y3pcFe54t+pIEvE+vjAB9SZO+lVfLwQmuAOu2ShpG4Ib0GNrl5+qdSbb2t5hURqPPAtk
         kru8L9m5UfXBrjHb5YZPwlUymgiEUmBgHOZozOtQE5hz1nJmF+iGQyLwdJNCAfk1fPyY
         SF+Ydsrpk6Irf85X8Q7MyZGDqNq/EF3RlQp34ob8ItAtzdds+DRtSHEqs64aCY3c42+K
         4ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iDeWKLTvLVXueA9I1Hg6ZkwkqjSWwRDb6/Z4CA5NQ/8=;
        b=fyA993fBWpjzs+YqUXZKm9y/oCNsN1y6sJOwr9lfKYLHYt5b4jeOa+nINOZMdEw6/f
         6E1cINpKB+DTPGJXkXEC7jPrJVSg5RLwk6VM5DMAW6U5MH6yIT/PVjfVU1Z8CyjJuKWG
         8k+YBOdIL+xjATy1rJhvWyvoTqlwELAuH0F24Yf0Cr5TxJgxvDA3GNNosXZQF0yCpO1W
         //cMq8P8rPY84IM+KFNQnWgx2isT7ieMFRkemoKxs5bGSgdhf8nFHx572nC46VMQFJBW
         DjluIgCHTIhHv3Isv3q5W/8xdoMgeA4j9Hq1BJLFOXM8nzkkBX+6p+q2YBe1KjwX03cF
         TxHg==
X-Gm-Message-State: AOAM533xR6kr7OoO+aPIdt6uTWMDnFLTu05qDhC4iSOKjWlqfEa20paA
        yV79f7x0IStIEcSjo9SW8G9BxEmW1qro6jXfwOJnFs9a
X-Google-Smtp-Source: ABdhPJx9+W77N9obO5EO6OxepQDEljnSUfHhN/Y8CNhGe5A4w1Aodk8W0JcsfhUJYkS+q4yMhRzWEZA51XzG/dISDn4=
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr1584566wmh.46.1605216184230;
 Thu, 12 Nov 2020 13:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org> <20201112190039.2785914-13-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-13-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Nov 2020 16:22:53 -0500
Message-ID: <CADnq5_PLP2OBx_XRb=ui2r6-tgZFmK7eo-MUtX3oQc2mGh6wpA@mail.gmail.com>
Subject: Re: [PATCH 12/30] drm/amd/amdgpu/amdgpu_ttm: Demote non-conformant
 kernel-doc headers, fix slightly lacking ones
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 2:01 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter=
 or member 'bo' not described in 'amdgpu_move_blit'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter=
 or member 'evict' not described in 'amdgpu_move_blit'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter=
 or member 'new_mem' not described in 'amdgpu_move_blit'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter=
 or member 'old_mem' not described in 'amdgpu_move_blit'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:522: warning: Function parameter=
 or member 'adev' not described in 'amdgpu_mem_visible'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:522: warning: Function parameter=
 or member 'mem' not described in 'amdgpu_mem_visible'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter=
 or member 'bo' not described in 'amdgpu_bo_move'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter=
 or member 'evict' not described in 'amdgpu_bo_move'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter=
 or member 'ctx' not described in 'amdgpu_bo_move'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter=
 or member 'new_mem' not described in 'amdgpu_bo_move'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter=
 or member 'hop' not described in 'amdgpu_bo_move'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:658: warning: Function parameter=
 or member 'bdev' not described in 'amdgpu_ttm_io_mem_reserve'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:658: warning: Function parameter=
 or member 'mem' not described in 'amdgpu_ttm_io_mem_reserve'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:751: warning: Function parameter=
 or member 'bo' not described in 'amdgpu_ttm_tt_get_user_pages'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:751: warning: Function parameter=
 or member 'pages' not described in 'amdgpu_ttm_tt_get_user_pages'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:855: warning: Function parameter=
 or member 'ttm' not described in 'amdgpu_ttm_tt_get_user_pages_done'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:892: warning: Function parameter=
 or member 'ttm' not described in 'amdgpu_ttm_tt_set_user_pages'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:892: warning: Function parameter=
 or member 'pages' not described in 'amdgpu_ttm_tt_set_user_pages'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:906: warning: Function parameter=
 or member 'bdev' not described in 'amdgpu_ttm_tt_pin_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:906: warning: Function parameter=
 or member 'ttm' not described in 'amdgpu_ttm_tt_pin_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:944: warning: Function parameter=
 or member 'bdev' not described in 'amdgpu_ttm_tt_unpin_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:944: warning: Function parameter=
 or member 'ttm' not described in 'amdgpu_ttm_tt_unpin_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1029: warning: Function paramete=
r or member 'bdev' not described in 'amdgpu_ttm_backend_bind'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1029: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_backend_bind'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1029: warning: Function paramete=
r or member 'bo_mem' not described in 'amdgpu_ttm_backend_bind'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1087: warning: Function paramete=
r or member 'bo' not described in 'amdgpu_ttm_alloc_gart'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1146: warning: Function paramete=
r or member 'tbo' not described in 'amdgpu_ttm_recover_gart'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1168: warning: Function paramete=
r or member 'bdev' not described in 'amdgpu_ttm_backend_unbind'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1168: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_backend_unbind'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1214: warning: Function paramete=
r or member 'page_flags' not described in 'amdgpu_ttm_tt_create'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1247: warning: Function paramete=
r or member 'bdev' not described in 'amdgpu_ttm_tt_populate'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1247: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_tt_populate'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1247: warning: Function paramete=
r or member 'ctx' not described in 'amdgpu_ttm_tt_populate'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1291: warning: Function paramete=
r or member 'bdev' not described in 'amdgpu_ttm_tt_unpopulate'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1291: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_tt_unpopulate'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1357: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_tt_get_usermm'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1376: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_tt_affect_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1376: warning: Function paramete=
r or member 'start' not described in 'amdgpu_ttm_tt_affect_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1376: warning: Function paramete=
r or member 'end' not described in 'amdgpu_ttm_tt_affect_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1397: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_tt_is_userptr'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1410: warning: Function paramete=
r or member 'ttm' not described in 'amdgpu_ttm_tt_is_readonly'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1449: warning: bad line:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1454: warning: Function paramete=
r or member 'adev' not described in 'amdgpu_ttm_tt_pte_flags'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1477: warning: Function paramete=
r or member 'bo' not described in 'amdgpu_ttm_bo_eviction_valuable'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1477: warning: Function paramete=
r or member 'place' not described in 'amdgpu_ttm_bo_eviction_valuable'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1787: warning: Function paramete=
r or member 'adev' not described in 'amdgpu_ttm_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1915: warning: Function paramete=
r or member 'adev' not described in 'amdgpu_ttm_late_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1926: warning: Function paramete=
r or member 'adev' not described in 'amdgpu_ttm_fini'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function paramete=
r or member 'f' not described in 'amdgpu_ttm_vram_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function paramete=
r or member 'buf' not described in 'amdgpu_ttm_vram_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function paramete=
r or member 'size' not described in 'amdgpu_ttm_vram_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function paramete=
r or member 'pos' not described in 'amdgpu_ttm_vram_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function paramete=
r or member 'f' not described in 'amdgpu_ttm_vram_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function paramete=
r or member 'buf' not described in 'amdgpu_ttm_vram_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function paramete=
r or member 'size' not described in 'amdgpu_ttm_vram_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function paramete=
r or member 'pos' not described in 'amdgpu_ttm_vram_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function paramete=
r or member 'f' not described in 'amdgpu_ttm_gtt_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function paramete=
r or member 'buf' not described in 'amdgpu_ttm_gtt_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function paramete=
r or member 'size' not described in 'amdgpu_ttm_gtt_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function paramete=
r or member 'pos' not described in 'amdgpu_ttm_gtt_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function paramete=
r or member 'f' not described in 'amdgpu_iomem_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function paramete=
r or member 'buf' not described in 'amdgpu_iomem_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function paramete=
r or member 'size' not described in 'amdgpu_iomem_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function paramete=
r or member 'pos' not described in 'amdgpu_iomem_read'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function paramete=
r or member 'f' not described in 'amdgpu_iomem_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function paramete=
r or member 'buf' not described in 'amdgpu_iomem_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function paramete=
r or member 'size' not described in 'amdgpu_iomem_write'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function paramete=
r or member 'pos' not described in 'amdgpu_iomem_write'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks.  Fixing these up with the proper function parameter
documentation and re-enabling kerneldoc would be a good project for
someone.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 60 +++++++++++++------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 676fb520e0449..b473b13f34f76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -451,7 +451,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *=
adev,
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_move_blit - Copy an entire buffer to another buffer
>   *
>   * This is a helper called by amdgpu_bo_move() and amdgpu_move_vram_ram(=
) to
> @@ -512,7 +512,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object =
*bo,
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move=
_memcpy
>   *
>   * Called by amdgpu_bo_move()
> @@ -536,7 +536,7 @@ static bool amdgpu_mem_visible(struct amdgpu_device *=
adev,
>                 <=3D adev->gmc.visible_vram_size;
>  }
>
> -/**
> +/*
>   * amdgpu_bo_move - Move a buffer object to a new memory location
>   *
>   * Called by ttm_bo_handle_move_mem()
> @@ -649,7 +649,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_io_mem_reserve - Reserve a block of memory during a fault
>   *
>   * Called by ttm_mem_io_reserve() ultimately via ttm_bo_vm_fault()
> @@ -740,7 +740,7 @@ struct amdgpu_ttm_tt {
>  };
>
>  #ifdef CONFIG_DRM_AMDGPU_USERPTR
> -/**
> +/*
>   * amdgpu_ttm_tt_get_user_pages - get device accessible pages that back =
user
>   * memory and start HMM tracking CPU page table update
>   *
> @@ -845,7 +845,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo=
, struct page **pages)
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_userptr_range_done - stop HMM track the CPU page table =
change
>   * Check if the pages backing this ttm range have been invalidated
>   *
> @@ -881,7 +881,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt =
*ttm)
>  }
>  #endif
>
> -/**
> +/*
>   * amdgpu_ttm_tt_set_user_pages - Copy pages in, putting old pages as ne=
cessary.
>   *
>   * Called by amdgpu_cs_list_validate(). This creates the page list
> @@ -896,7 +896,7 @@ void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm,=
 struct page **pages)
>                 ttm->pages[i] =3D pages ? pages[i] : NULL;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_pin_userptr - prepare the sg table with the user pages
>   *
>   * Called by amdgpu_ttm_backend_bind()
> @@ -936,7 +936,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_de=
vice *bdev,
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_unpin_userptr - Unpin and unmap userptr pages
>   */
>  static void amdgpu_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev,
> @@ -1017,7 +1017,7 @@ static int amdgpu_ttm_gart_bind(struct amdgpu_devic=
e *adev,
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_backend_bind - Bind GTT memory
>   *
>   * Called by ttm_tt_bind() on behalf of ttm_bo_handle_move_mem().
> @@ -1075,7 +1075,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_bo_de=
vice *bdev,
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_alloc_gart - Make sure buffer object is accessible either
>   * through AGP or GART aperture.
>   *
> @@ -1136,7 +1136,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object =
*bo)
>         return 0;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_recover_gart - Rebind GTT pages
>   *
>   * Called by amdgpu_gtt_mgr_recover() from amdgpu_device_reset() to
> @@ -1157,7 +1157,7 @@ int amdgpu_ttm_recover_gart(struct ttm_buffer_objec=
t *tbo)
>         return r;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_backend_unbind - Unbind GTT mapped pages
>   *
>   * Called by ttm_tt_unbind() on behalf of ttm_bo_move_ttm() and
> @@ -1206,6 +1206,7 @@ static void amdgpu_ttm_backend_destroy(struct ttm_b=
o_device *bdev,
>   * amdgpu_ttm_tt_create - Create a ttm_tt object for a given BO
>   *
>   * @bo: The buffer object to create a GTT ttm_tt object around
> + * @page_flags: flags to request SG or DMA page directory
>   *
>   * Called by ttm_tt_create().
>   */
> @@ -1235,7 +1236,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct t=
tm_buffer_object *bo,
>         return &gtt->ttm;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_populate - Map GTT pages visible to the device
>   *
>   * Map the pages of a ttm_tt object to an address space visible
> @@ -1280,7 +1281,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
>         return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_unpopulate - unmap GTT pages and unpopulate page arrays
>   *
>   * Unmaps pages of a ttm_tt object from the device address space and
> @@ -1350,7 +1351,7 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_obj=
ect *bo,
>         return 0;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_get_usermm - Return memory manager for ttm_tt object
>   */
>  struct mm_struct *amdgpu_ttm_tt_get_usermm(struct ttm_tt *ttm)
> @@ -1366,7 +1367,7 @@ struct mm_struct *amdgpu_ttm_tt_get_usermm(struct t=
tm_tt *ttm)
>         return gtt->usertask->mm;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_affect_userptr - Determine if a ttm_tt object lays insi=
de an
>   * address range for the current task.
>   *
> @@ -1390,7 +1391,7 @@ bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *tt=
m, unsigned long start,
>         return true;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_is_userptr - Have the pages backing by userptr?
>   */
>  bool amdgpu_ttm_tt_is_userptr(struct ttm_tt *ttm)
> @@ -1403,7 +1404,7 @@ bool amdgpu_ttm_tt_is_userptr(struct ttm_tt *ttm)
>         return true;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_tt_is_readonly - Is the ttm_tt object read only?
>   */
>  bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm)
> @@ -1444,9 +1445,10 @@ uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *tt=
m, struct ttm_resource *mem)
>  /**
>   * amdgpu_ttm_tt_pte_flags - Compute PTE flags for ttm_tt object
>   *
> + * @adev: amdgpu_device pointer
>   * @ttm: The ttm_tt object to compute the flags for
>   * @mem: The memory registry backing this ttm_tt object
> -
> + *
>   * Figure out the flags to use for a VM PTE (Page Table Entry).
>   */
>  uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_=
tt *ttm,
> @@ -1463,7 +1465,7 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_devi=
ce *adev, struct ttm_tt *ttm,
>         return flags;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buff=
er
>   * object.
>   *
> @@ -1774,7 +1776,7 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_dev=
ice *adev)
>         return 0;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_init - Init the memory management (ttm) as well as various
>   * gtt/vram related fields.
>   *
> @@ -1908,7 +1910,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>         return 0;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_late_init - Handle any late initialization for amdgpu_ttm
>   */
>  void amdgpu_ttm_late_init(struct amdgpu_device *adev)
> @@ -1919,7 +1921,7 @@ void amdgpu_ttm_late_init(struct amdgpu_device *ade=
v)
>         amdgpu_bo_free_kernel(&adev->mman.stolen_extended_memory, NULL, N=
ULL);
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_fini - De-initialize the TTM memory pools
>   */
>  void amdgpu_ttm_fini(struct amdgpu_device *adev)
> @@ -2240,7 +2242,7 @@ static const struct drm_info_list amdgpu_ttm_debugf=
s_list[] =3D {
>         {"ttm_page_pool", amdgpu_ttm_pool_debugfs, 0, NULL},
>  };
>
> -/**
> +/*
>   * amdgpu_ttm_vram_read - Linear read access to VRAM
>   *
>   * Accesses VRAM via MMIO for debugging purposes.
> @@ -2275,7 +2277,7 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f,=
 char __user *buf,
>         return result;
>  }
>
> -/**
> +/*
>   * amdgpu_ttm_vram_write - Linear write access to VRAM
>   *
>   * Accesses VRAM via MMIO for debugging purposes.
> @@ -2328,7 +2330,7 @@ static const struct file_operations amdgpu_ttm_vram=
_fops =3D {
>
>  #ifdef CONFIG_DRM_AMDGPU_GART_DEBUGFS
>
> -/**
> +/*
>   * amdgpu_ttm_gtt_read - Linear read access to GTT memory
>   */
>  static ssize_t amdgpu_ttm_gtt_read(struct file *f, char __user *buf,
> @@ -2378,7 +2380,7 @@ static const struct file_operations amdgpu_ttm_gtt_=
fops =3D {
>
>  #endif
>
> -/**
> +/*
>   * amdgpu_iomem_read - Virtual read access to GPU mapped memory
>   *
>   * This function is used to read memory that has been mapped to the
> @@ -2434,7 +2436,7 @@ static ssize_t amdgpu_iomem_read(struct file *f, ch=
ar __user *buf,
>         return result;
>  }
>
> -/**
> +/*
>   * amdgpu_iomem_write - Virtual write access to GPU mapped memory
>   *
>   * This function is used to write memory that has been mapped to the
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
