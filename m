Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F6927BA9A
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 04:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgI2CEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 22:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgI2CEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 22:04:52 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530EBC061755;
        Mon, 28 Sep 2020 19:04:52 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y190so2026978vsy.1;
        Mon, 28 Sep 2020 19:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iDhv+ozgLfJpz4ReM/64bivezuXaXXhI3uaVkJqD6ls=;
        b=ElzTpIglC+vmQlt1o4Loci+G0xfVId1TvwEqqaq9K2WDKtIa9s/LqIro0Fr2c73mVn
         kmhkY9wYhFBx8SLb+/vdoOGgOLpEv8t6yt8jtquj71p3kzrlKl+Wl+REsmWjuuZ1XBUD
         TMLpUWCLSaojzcxUGI4TIWNmUb0MH8Krs0tUvv8CAjBtoak+oQQ21aC5RfyLBIpJ3C55
         mPtRWvnb9PjSzLLQn0xBj8juntZIieZH7daRO0vmOv70RxDXTKXUMWsfo9rdlpUglp73
         VjmwWGFYZJGsHB64AqjSAdayBHKQkf3SzoRzMHpuVWbwG2L9vT/AxdfHrO+o6iiVip3B
         LPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iDhv+ozgLfJpz4ReM/64bivezuXaXXhI3uaVkJqD6ls=;
        b=UB7yyfgfPhLVD37HQWH1Eb8oyxG68J5gys1zBcgFBsIFXi77MaZc7TKsjTIEj8x6H6
         iJUiKv2kQnSwn3kCq4pD8w60/eUQJ/7HS7ifMRPcZisUxg6bflYigB+MOg3GC9GXXIDg
         xiH3fUaoxYCOKUMtJicLORoSxBR9FqHFWSvXiUzZ4OdISXCJyuDSemRKPjzGD3SndLx9
         Vdgihyrsc4TNtISe+VO9GlF3RqP9TzD6GXwxy5haCa67R38yP51wuW6wYq2BNof9bMYL
         LWrg7iN76uAq4G1BJ8rxsDiuiS0FJrtsAljGxswFJ9keUa7bU67T49dH8hTQuaDdJKTO
         wlcw==
X-Gm-Message-State: AOAM531sQenUbFzKysHTPYihXZCxbL2IZZ6V3NPRvsXqfl23h0sd7CNk
        yhFVZk59CwY75QcAxJF1lF699QZoIhdF8TK8SQ8=
X-Google-Smtp-Source: ABdhPJyr6ao6JKY3kh4wo/uPStmXsu/G2ImOGPcqB6umN+lBpwROmdYRQa76oJabfTEMI8k+KK7JQYiXMJJ5NntMMhM=
X-Received: by 2002:a67:1bc4:: with SMTP id b187mr1540419vsb.59.1601345091353;
 Mon, 28 Sep 2020 19:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <1601219284-13275-1-git-send-email-jrdr.linux@gmail.com> <20200928083757.GA18329@kadam>
In-Reply-To: <20200928083757.GA18329@kadam>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Tue, 29 Sep 2020 07:34:39 +0530
Message-ID: <CAFqt6zZaf=+JcUuxKdoEj1vMs5MOsb1iYKStmwKiKLW8bbcnYQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Fixed error handling path
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        Greg KH <gregkh@linuxfoundation.org>,
        daniel.m.jordan@oracle.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Michel Lespinasse <walken@google.com>, gustavoars@kernel.org,
        linux-media@vger.kernel.org,
        "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,


On Mon, Sep 28, 2020 at 2:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sun, Sep 27, 2020 at 08:38:04PM +0530, Souptick Joarder wrote:
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
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > index f13af23..0168f98 100644
> > --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > @@ -857,16 +857,17 @@ static void free_private_pages(struct hmm_buffer_object *bo,
> >       kfree(bo->page_obj);
> >  }
> >
> > -static void free_user_pages(struct hmm_buffer_object *bo)
> > +static void free_user_pages(struct hmm_buffer_object *bo,
> > +                         unsigned int page_nr)
> >  {
> >       int i;
> >
> >       hmm_mem_stat.usr_size -= bo->pgnr;
>                               ^^^^^^^^^^^
> This is still a problem.  It needs to be hmm_mem_stat.usr_size -= page_nr.

In failure path, it is hmm_mem_stat.usr_size += bo->pgnr.
I think, hmm_mem_stat.usr_size -= bo->pgnr is correct as per existing code.
Do you think that needs to be changed ?

>
> regards,
> dan carpenter
>
> >
> >       if (bo->mem_type == HMM_BO_MEM_TYPE_PFN) {
> > -             unpin_user_pages(bo->pages, bo->pgnr);
> > +             unpin_user_pages(bo->pages, page_nr);
> >       } else {
> > -             for (i = 0; i < bo->pgnr; i++)
> > +             for (i = 0; i < page_nr; i++)
> >                       put_page(bo->pages[i]);
> >       }
> >       kfree(bo->pages);
>
