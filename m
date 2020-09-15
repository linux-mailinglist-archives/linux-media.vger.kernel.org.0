Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84E026A34F
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 12:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgIOKkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 06:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgIOKjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 06:39:53 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E562C06174A
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 03:39:51 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id o8so2767967otl.4
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ulpeSnyY5/ewevGEpTqNXhDdyzWhPxYuGEnSEK0qUFE=;
        b=ig5tEx0h7bfKi5EybZqA+C68o6gYUIfa+RfL190q/C/6enFMceUUZeuDygc7lBryyo
         Y39LD8nxmbQQ2ZpJi/7Bu1MrZHh+9AmFkAC82cd1/Ss7084QYOZc1Q6UWRtMFDibGKuJ
         Yhfx18xPVi60zG4gPhH/H78zP9lEy3I29XQis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ulpeSnyY5/ewevGEpTqNXhDdyzWhPxYuGEnSEK0qUFE=;
        b=epfEa5HUytnHS6ih6FPa7fBTt5JyoSMJYEgeTl9oSPEMx9ap7+GXKAaIQWk0ATaZVD
         shPpqMJXZtV13LBnJYUL2vJH6AqlDmAUNyTorWDT3Bq/3lDJbdu6Xm023Ew+eZ2JPELw
         igpM5uzyHzK56Kcyvs9DXLBmRoT9icjn8hpd9YGJecZmNOnXVIJt6cwVEejCwpwfVq3l
         RDDRPK7RBh30rXS0cTCX6D7PA8jewaUc4toiSp8Rtp/stRlYtaYUMUpm4gMk+q8LlKl0
         4HrQDHsSkFr+0ObtPRTbAr5nEkbNGxE9jmNhG66VZZdThj3VdRu1bEGRpLsOXnHNyJrF
         1dRA==
X-Gm-Message-State: AOAM532YpwnBv/5mrAu+G7DyfiyKKrNpRN61VNwxRhpJdmomQaS4gJMA
        zScREEjt5k3jcwEBn6Lq7M+GiuDRKbG9NOjBC+ulTQ==
X-Google-Smtp-Source: ABdhPJzbKPKIRS8EfyunRCEi31t2CsfncQrKriVKuMZ+LvqfMKqrLvYa64Bhcsp3AhwdlFX/YDNiySv4RihZaKzNLEU=
X-Received: by 2002:a05:6830:1e56:: with SMTP id e22mr11974578otj.303.1600166390649;
 Tue, 15 Sep 2020 03:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com> <20200914132920.59183-2-christian.koenig@amd.com>
In-Reply-To: <20200914132920.59183-2-christian.koenig@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 15 Sep 2020 12:39:39 +0200
Message-ID: <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported dma-buf"
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 14, 2020 at 3:29 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This reverts commit 26d3ac3cb04d171a861952e89324e347598a347f.
>
> We need to figure out if dma_buf_mmap() is valid or not first.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

The trouble is that doing dma-buf mmap by looking at the struct pages
behind the sg list and just inserting those into userspace doesn't
really work any better. You still won't get the unmap_mapping_range
and hence pte shoot-down. So maybe dma_buf_mmap forwarding doesn't
work, but this doesn't make it any better.

Also commit message should probably explain a bit the context here,
not a lot of people have been in our private discussion on this.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 0a952f27c184..cd727343f72b 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -594,9 +594,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, st=
ruct vm_area_struct *vma)
>         /* Remove the fake offset */
>         vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
>
> -       if (obj->import_attach)
> -               return dma_buf_mmap(obj->dma_buf, vma, 0);
> -
>         shmem =3D to_drm_gem_shmem_obj(obj);
>
>         ret =3D drm_gem_shmem_get_pages(shmem);
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
