Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC0F2B84FC
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 20:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgKRTg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 14:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgKRTg2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 14:36:28 -0500
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC61C0613D4;
        Wed, 18 Nov 2020 11:36:26 -0800 (PST)
Received: by mail-vk1-xa41.google.com with SMTP id e8so759638vkk.8;
        Wed, 18 Nov 2020 11:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oycl9rXnrPavfA5bPND3v6cuTejfQRr5MJa/4Z/zAec=;
        b=qdLG7jhNUoxN8DlG6k27zxeTP/luVeWx57IAyLfJPv33lazYi8MjkP6FuAhYOfid/D
         4WVyEjCN6fSaPHTUe+jF7Lhor8R+6+IOkNjd+7nLoLs9mNaI+zjl0ecaeFpswUzhiogH
         ovcPUPWsYMrciYcXDBn2OeutfGJe2Cpp72iLFEqkFGtk5Lr9WQo+o85Mn4xYOLeVOj3v
         0SiMbKKPrbgQrfajxY1wMJPxvsWSFvciwodc/W0MvGBWyMtxbYqMhWsXaaq1qUoQs4ja
         hghNVv07P7nRu/WIZkZHSjZEH+bIpMtmAg5VssSfl9S250NgsuAFKeO0dcX/Eji5e3wi
         MGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oycl9rXnrPavfA5bPND3v6cuTejfQRr5MJa/4Z/zAec=;
        b=nXLhdmbF0CvFtsJdO73qvoza5uYcIRkqzS86zbWSXM1i0VIpNQeLUJLkLUwb48vx+h
         28uRC4nMzWyznE62UWquyJqI+KFYdSFazh+fwrFrqoDBZNgz0i8DnH1z+WWllyLA82ly
         p+rjdZ02AdsVGp8X5JaXBprSUFvGbs9Kg0uPtKCVjupZCaBoPNp7jG8x2O1oxCnS+l8e
         9bWKnorNH2hEn58KBiZn7uEJ3Z3yB/HWMTNpaZLvASZ3VYrFrbCf6A7aZFTK/DNpvAua
         U1QVfAt/UeknVEnIa4ds7RRyby2IECgwxYQchvUUR57mQWh3O6ILvFi+POrJGP4eP2lj
         7EyQ==
X-Gm-Message-State: AOAM533TFnk1z5PIbSuS2k3x+WcidKWkG2Nv7Q0jinSAghkeME7sTOjg
        mjKK9DqQvMAWO8I7O5eEkNGthIxMi0Wu1Vjj1rc=
X-Google-Smtp-Source: ABdhPJxrhhmloucaf7V96PGI/m/7uAmESZdIb0lRcvIUTFDFBaSYYW8Dh8zApbOmcfkmyoxw3AlrWp6w6Oa61Bzz2BU=
X-Received: by 2002:a1f:3f52:: with SMTP id m79mr3183264vka.23.1605728185660;
 Wed, 18 Nov 2020 11:36:25 -0800 (PST)
MIME-Version: 1.0
References: <1604455331-28031-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1604455331-28031-1-git-send-email-jrdr.linux@gmail.com>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Thu, 19 Nov 2020 01:06:14 +0530
Message-ID: <CAFqt6zZ3HouweyeKGUbeF9ix+SXvBUrRB6ks3hozRofwtUaUtA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Fixed error handling path
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        Greg KH <gregkh@linuxfoundation.org>, gustavoars@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, daniel.m.jordan@oracle.com,
        Michel Lespinasse <walken@google.com>
Cc:     linux-media@vger.kernel.org,
        "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 4, 2020 at 7:32 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Inside alloc_user_pages() based on flag value either pin_user_pages()
> or get_user_pages_fast() will be called. However, these API might fail.
>
> But free_user_pages() called in error handling path doesn't bother
> about return value and will try to unpin bo->pgnr pages, which is
> incorrect.
>
> Fix this by passing the page_nr to free_user_pages(). If page_nr > 0
> pages will be unpinned based on bo->mem_type. This will also take care
> of non error handling path.
>
> Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory
> allocation")
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:
>     Added review tag.

Any further comment ? If no, can we get this patch in queue for 5.11 ?
>
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index f13af23..0168f98 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -857,16 +857,17 @@ static void free_private_pages(struct hmm_buffer_object *bo,
>         kfree(bo->page_obj);
>  }
>
> -static void free_user_pages(struct hmm_buffer_object *bo)
> +static void free_user_pages(struct hmm_buffer_object *bo,
> +                           unsigned int page_nr)
>  {
>         int i;
>
>         hmm_mem_stat.usr_size -= bo->pgnr;
>
>         if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
> -               unpin_user_pages(bo->pages, bo->pgnr);
> +               unpin_user_pages(bo->pages, page_nr);
>         } else {
> -               for (i = 0; i < bo->pgnr; i++)
> +               for (i = 0; i < page_nr; i++)
>                         put_page(bo->pages[i]);
>         }
>         kfree(bo->pages);
> @@ -942,6 +943,8 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
>                 dev_err(atomisp_dev,
>                         "get_user_pages err: bo->pgnr = %d, pgnr actually pinned = %d.\n",
>                         bo->pgnr, page_nr);
> +               if (page_nr < 0)
> +                       page_nr = 0;
>                 goto out_of_mem;
>         }
>
> @@ -954,7 +957,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
>
>  out_of_mem:
>
> -       free_user_pages(bo);
> +       free_user_pages(bo, page_nr);
>
>         return -ENOMEM;
>  }
> @@ -1037,7 +1040,7 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
>         if (bo->type == HMM_BO_PRIVATE)
>                 free_private_pages(bo, &dynamic_pool, &reserved_pool);
>         else if (bo->type == HMM_BO_USER)
> -               free_user_pages(bo);
> +               free_user_pages(bo, bo->pgnr);
>         else
>                 dev_err(atomisp_dev, "invalid buffer type.\n");
>         mutex_unlock(&bo->mutex);
> --
> 1.9.1
>
