Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DFA2D3360
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 21:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgLHUQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 15:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgLHUQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 15:16:36 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C69CC0613D6;
        Tue,  8 Dec 2020 12:15:56 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id dm12so8853420qvb.3;
        Tue, 08 Dec 2020 12:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4Fyco5bDL0b1+A0R6hLCqPDjj4kiCO+5bu9D2g1+lI=;
        b=dJ4xAje6ekDIJ6XmZmZjkKMybOjqi5CojyEmwj6BdVqiCqmxl1Vm53EK/YDL20COY1
         AsUZsQmPL4qa9+67R3ufDZPdhOoc/76z1CmcTAYThFMFPEnu4/SbeE5ArPRj5kB61v41
         xHkursJgg2yhDZTmDciQthWSwmMyMB2SW6rjZDw00pqjgJyxwrs+8XeHo3gGvSZEm96m
         ITgEW0zJXWpH/VrH/UgwDZHTsbpSyKg/XsXVRfQvizX9YG5mew/97QqdxaV+m+UyIkoM
         RrFM4VulWYccCTfWdRk+FBA+BQ9jMYnonRDvfOsHl63UuYov0+yFGnD6zq49ASq91mui
         TQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4Fyco5bDL0b1+A0R6hLCqPDjj4kiCO+5bu9D2g1+lI=;
        b=hd4IzLGBPOyp2AuPqDZPtxW51VmELi1ltLqgAr0eYP3UtSJ7aw7Qw/MU/9yZSTPNDu
         BmGDe0MWcE4VCGrq3Btg9/5yVn2wV7CZSrvZm9uGD9uV1t9iLulYF/W6Z1vmZbLnbpP6
         aTBWJ6dh+0mHaHdio5aL/3VF2d7uBCWaikis1JqNYzywoC6JJhCUfobTShnYE/YT/8kl
         dBYCe7Li3nb/O7AxFw9pkie1I/MBWomNsUdYX8U4TznI9eX5e7HEJHhsLDmT5QFTk6VS
         nV8rZNtcI4cqb9+CWoD59MwUBy45zwUMFuCj7K4TF+BnGhpA1PA+pfrubjrOZtbJmTVW
         sh4Q==
X-Gm-Message-State: AOAM533xD7ymOLdOWB1fTOEB0kSHjbmB6N+k3xiTLLkUvD3IE2uGWbjX
        Zog3Vs+sL/dKONprm01khr2MPKSwyhVJOHIC3qPSvvjRDQo=
X-Google-Smtp-Source: ABdhPJw7UDJIZ7N5Pm/Kgcza91TI1rb7WJ4XMyk9pIaUTNzYdmYB7lwXmKNCUO2sXUVfsxPLJ3z6IpK2Lca0r8l08Wg=
X-Received: by 2002:a05:6102:a07:: with SMTP id t7mr18112045vsa.30.1607456893158;
 Tue, 08 Dec 2020 11:48:13 -0800 (PST)
MIME-Version: 1.0
References: <1604455331-28031-1-git-send-email-jrdr.linux@gmail.com> <CAFqt6zZ3HouweyeKGUbeF9ix+SXvBUrRB6ks3hozRofwtUaUtA@mail.gmail.com>
In-Reply-To: <CAFqt6zZ3HouweyeKGUbeF9ix+SXvBUrRB6ks3hozRofwtUaUtA@mail.gmail.com>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Wed, 9 Dec 2020 01:18:22 +0530
Message-ID: <CAFqt6zaRhgiktY8RyfDrBwoz18LRtxvThsh_JkASnhsk+5jDaQ@mail.gmail.com>
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

On Thu, Nov 19, 2020 at 1:06 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Wed, Nov 4, 2020 at 7:32 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > Inside alloc_user_pages() based on flag value either pin_user_pages()
> > or get_user_pages_fast() will be called. However, these API might fail.
> >
> > But free_user_pages() called in error handling path doesn't bother
> > about return value and will try to unpin bo->pgnr pages, which is
> > incorrect.
> >
> > Fix this by passing the page_nr to free_user_pages(). If page_nr > 0
> > pages will be unpinned based on bo->mem_type. This will also take care
> > of non error handling path.
> >
> > Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory
> > allocation")
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2:
> >     Added review tag.
>
> Any further comment ? If no, can we get this patch in queue for 5.11 ?

Can we get this patch in the queue for 5.11 ?

> >
> >  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > index f13af23..0168f98 100644
> > --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > @@ -857,16 +857,17 @@ static void free_private_pages(struct hmm_buffer_object *bo,
> >         kfree(bo->page_obj);
> >  }
> >
> > -static void free_user_pages(struct hmm_buffer_object *bo)
> > +static void free_user_pages(struct hmm_buffer_object *bo,
> > +                           unsigned int page_nr)
> >  {
> >         int i;
> >
> >         hmm_mem_stat.usr_size -= bo->pgnr;
> >
> >         if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
> > -               unpin_user_pages(bo->pages, bo->pgnr);
> > +               unpin_user_pages(bo->pages, page_nr);
> >         } else {
> > -               for (i = 0; i < bo->pgnr; i++)
> > +               for (i = 0; i < page_nr; i++)
> >                         put_page(bo->pages[i]);
> >         }
> >         kfree(bo->pages);
> > @@ -942,6 +943,8 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
> >                 dev_err(atomisp_dev,
> >                         "get_user_pages err: bo->pgnr = %d, pgnr actually pinned = %d.\n",
> >                         bo->pgnr, page_nr);
> > +               if (page_nr < 0)
> > +                       page_nr = 0;
> >                 goto out_of_mem;
> >         }
> >
> > @@ -954,7 +957,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
> >
> >  out_of_mem:
> >
> > -       free_user_pages(bo);
> > +       free_user_pages(bo, page_nr);
> >
> >         return -ENOMEM;
> >  }
> > @@ -1037,7 +1040,7 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
> >         if (bo->type == HMM_BO_PRIVATE)
> >                 free_private_pages(bo, &dynamic_pool, &reserved_pool);
> >         else if (bo->type == HMM_BO_USER)
> > -               free_user_pages(bo);
> > +               free_user_pages(bo, bo->pgnr);
> >         else
> >                 dev_err(atomisp_dev, "invalid buffer type.\n");
> >         mutex_unlock(&bo->mutex);
> > --
> > 1.9.1
> >
