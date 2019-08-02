Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0327ECA7
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2019 08:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbfHBG3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 02:29:19 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46380 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733171AbfHBG3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Aug 2019 02:29:19 -0400
Received: by mail-io1-f67.google.com with SMTP id i10so36530880iol.13
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2019 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8J0CG6n/mGE9VY7Tzl2V8r1MEJfljCPCP1w3kMFb7gU=;
        b=RjyjBD2oGv8Yelvkiciev/lZ+Q3xXx8QFqdYzdY4aCHOlugQGM86oI6FqZDvirisZ5
         VJ+QLkBMLnRka6ltoYGD5wyPSjpGXQPHFctjuGwd1+UFurx0yvKt9ushEUj8EZV9ix2W
         01tKC6Gaz3MS8M+0E+YLTPk1gYgnaZnSfnfDmi+UFK25mv5gEzSDgABsBJUiG+nhSsUl
         RKT5eQ9kRkeBcJ7gT+NzJThlFQ8TbWheTrXZG+kEcBrFAA6KQockx50ATbHKRl86DAya
         RCLedopliZ67rTczSP3iIMKDggIEdiJgpUtX8J4w3apFv4UIzEajhXW7aw51MfImXOri
         CFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8J0CG6n/mGE9VY7Tzl2V8r1MEJfljCPCP1w3kMFb7gU=;
        b=spJqBx5psGKpJd2BFJxWK/BVF8EjxmxaIeFcIlemecKsehjGEuaJ3x+6rwY+cjtPlO
         si/gACrMFFla64nAD1Zkh++hKf9GqAhwpTwD3ji0/saLOQsNWeSYSLfZtVgE2DJKSCj5
         XFDrChLH4fm/GnCgXQ3mBFeUOGC6NoC1S4rFuJSNPdADVqkAyYn0I4ZrnKd1SLfbkaqE
         NFijVVcL4B8SpxCGChfoxzDvZKypMF2yY322tTWSJ68yVa+PppL65SW++ZaCK7IBolJo
         TnnBckcvHPFq3uRKmF3+mzcDVr49mlE7sjT4pMqyngEmzgjcxUXcf/NOlU3BvxZc2MdS
         TYkg==
X-Gm-Message-State: APjAAAXPmAfddkDfafac0Zk0p1WedFkfpZR9Jrv1rosYG34hRPoJ2DcS
        U9Zn1qdkInZeYTER39Er4AM+tvoymcNjjx140cE6jA==
X-Google-Smtp-Source: APXvYqyCEEQjF5gUAqe0Jy7lkgRv7S109dxiMqY3y1rXR3KgTUxyI68+/GDAwhKmPjZXNLxgfhvOgGBjK0GGgCuPqfQ=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr71226796ioa.33.1564727358352;
 Thu, 01 Aug 2019 23:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190802022005.5117-1-jhubbard@nvidia.com> <20190802022005.5117-17-jhubbard@nvidia.com>
In-Reply-To: <20190802022005.5117-17-jhubbard@nvidia.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Fri, 2 Aug 2019 08:29:07 +0200
Message-ID: <CAHUa44G++iiwU62jj7QH=V3sr4z26sf007xrwWLPw6AAeMLAEw@mail.gmail.com>
Subject: Re: [PATCH 16/34] drivers/tee: convert put_page() to put_user_page*()
To:     john.hubbard@gmail.com
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, ceph-devel@vger.kernel.org,
        devel@driverdev.osuosl.org, devel@lists.orangefs.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kvm@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-block@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, linux-fbdev@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mm@kvack.org, linux-nfs@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-xfs@vger.kernel.org, netdev@vger.kernel.org,
        rds-devel@oss.oracle.com, sparclinux@vger.kernel.org,
        x86@kernel.org, xen-devel@lists.xenproject.org,
        John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 2, 2019 at 4:20 AM <john.hubbard@gmail.com> wrote:
>
> From: John Hubbard <jhubbard@nvidia.com>
>
> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page() or
> release_pages().
>
> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
>
> Cc: Jens Wiklander <jens.wiklander@linaro.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/tee/tee_shm.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

I suppose you're taking this via your own tree or such.

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 2da026fd12c9..c967d0420b67 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -31,16 +31,13 @@ static void tee_shm_release(struct tee_shm *shm)
>
>                 poolm->ops->free(poolm, shm);
>         } else if (shm->flags & TEE_SHM_REGISTER) {
> -               size_t n;
>                 int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
>
>                 if (rc)
>                         dev_err(teedev->dev.parent,
>                                 "unregister shm %p failed: %d", shm, rc);
>
> -               for (n = 0; n < shm->num_pages; n++)
> -                       put_page(shm->pages[n]);
> -
> +               put_user_pages(shm->pages, shm->num_pages);
>                 kfree(shm->pages);
>         }
>
> @@ -313,16 +310,13 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>         return shm;
>  err:
>         if (shm) {
> -               size_t n;
> -
>                 if (shm->id >= 0) {
>                         mutex_lock(&teedev->mutex);
>                         idr_remove(&teedev->idr, shm->id);
>                         mutex_unlock(&teedev->mutex);
>                 }
>                 if (shm->pages) {
> -                       for (n = 0; n < shm->num_pages; n++)
> -                               put_page(shm->pages[n]);
> +                       put_user_pages(shm->pages, shm->num_pages);
>                         kfree(shm->pages);
>                 }
>         }
> --
> 2.22.0
>
