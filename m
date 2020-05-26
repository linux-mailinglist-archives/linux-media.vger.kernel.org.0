Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065AA1E1DA3
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731512AbgEZItD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgEZItC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:49:02 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF09AC08C5C0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 01:49:02 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id m67so7638286oif.4
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5GNEdvxv7mdO2rvUKQ7g7CQMFrgCJQETUzHF+R0Pghk=;
        b=cWoK90ubt9Zt16ipNusgGtcCLXrJQ2KdR/4phuhXvAOBzyAjlrj1sUOBhNckRmjkFf
         vCbJwaUvP43Z5uJjNjr99Bs3afD//vOVkLzNqQqu3XEqHOEd7YT3O1eJp/N6jbU6ZVD5
         HYK7nHgGjnBIk5uShaJqd5S+fTE941jBuBrRly2RCz4KQfp7xW91XiCB76WmQH2i72oj
         UQQLe/a8+HSy51vBlJA8KkrrpOp1oyfuvMdryQKkY7Y0tuoO8HBa1TlDKXBjD5snNVWH
         WFxuMmECDi/u9csMxvBLqA0UHZuCUpf+NtuyvlNk22vp5aXTvSYN32WL7Uz3sr6wAyYl
         SCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5GNEdvxv7mdO2rvUKQ7g7CQMFrgCJQETUzHF+R0Pghk=;
        b=oTpsy7Aydp8w5iRcyXZQavOybsAoD1gtZUys88R9Lc9kHtEVqSukj21R8EVio7WIUI
         6es6uf4peqpnPzzf4MXwySdjenhgprwD6n+YnnAGnjZTEZUk7rz7H5gcBDsCEGBx/wwK
         Q3gDlsiCE9Cy09sli5Il9DFfeUSziyYuOrIAI4jPB0RIAVSLwhLGZbYZ6ilGyv46e30A
         QU2ZisPfE4H9tNLrWpg8jPm1uawx/jEVW67wUWZeoaV3adTdZBu4/FmXCU8ciQfrhaZX
         JIDf2YxXUUOJaaw+Ci0Q1ttd2sGGbsAel8wobhU8oIwDRdL3XqTyzH7xPsv9TeSkrad3
         2vIw==
X-Gm-Message-State: AOAM531n0V0hsn7RyB9w7dMIvAububTvLD9RJefRk5ksLJrTLBgLbETa
        inNmDR4Qs0AVqRz9Ny2oW94Vw0YUAEOA3ds/VuIGLQ==
X-Google-Smtp-Source: ABdhPJwJA36cZMmOd8c6H2JVZPEEuXqjCAEh8p/lf7fE/+JsyAwMKd+waOHOF0SAK/M0Oi0DQDZLGizYIs16iwRvxuU=
X-Received: by 2002:a05:6808:3dc:: with SMTP id o28mr14010604oie.149.1590482941983;
 Tue, 26 May 2020 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200525233248.434636-1-jhubbard@nvidia.com>
In-Reply-To: <20200525233248.434636-1-jhubbard@nvidia.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 26 May 2020 10:48:50 +0200
Message-ID: <CAHUa44HUPeV6D6cYEKxJmVm68G2ADvMcgEpJ7XkKEAFuteWEHw@mail.gmail.com>
Subject: Re: [PATCH v2] tee: convert get_user_pages() --> pin_user_pages()
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        linux-media@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Tue, May 26, 2020 at 1:32 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> This code was using get_user_pages*(), in a "Case 2" scenario
> (DMA/RDMA), using the categorization from [1]. That means that it's
> time to convert the get_user_pages*() + put_page() calls to
> pin_user_pages*() + unpin_user_pages() calls.
>
> There is some helpful background in [2]: basically, this is a small
> part of fixing a long-standing disconnect between pinning pages, and
> file systems' use of those pages.
>
> [1] Documentation/core-api/pin_user_pages.rst
>
> [2] "Explicit pinning of user-space pages":
>     https://lwn.net/Articles/807108/
>
> Cc: Jens Wiklander <jens.wiklander@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: tee-dev@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Hi,
>
> This fixes the typo ("convert convert") in the subject line, but
> otherwise no changes.
>
> thanks,
> John Hubbard
> NVIDIA
>
>
>  drivers/tee/tee_shm.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Looks good. I've tested this on a HiKey 620 board, no regressions. I'm
picking up this patch.

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index bd679b72bd05..7dffc42d8d5a 100644
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
> +               unpin_user_pages(shm->pages, shm->num_pages);
>                 kfree(shm->pages);
>         }
>
> @@ -226,7 +223,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>                 goto err;
>         }
>
> -       rc = get_user_pages_fast(start, num_pages, FOLL_WRITE, shm->pages);
> +       rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE, shm->pages);
>         if (rc > 0)
>                 shm->num_pages = rc;
>         if (rc != num_pages) {
> @@ -271,16 +268,13 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
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
> +                       unpin_user_pages(shm->pages, shm->num_pages);
>                         kfree(shm->pages);
>                 }
>         }
> --
> 2.26.2
>
