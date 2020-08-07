Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC64523E520
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 02:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgHGA1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 20:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgHGA1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 20:27:54 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F106C061575
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 17:27:54 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id x69so312232qkb.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2020 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DGA8+gwrB3sAonXBmChAGNY7ZvvzV2hTqZrY8zZK8EE=;
        b=Xso+VvmrMIUE21k+VszWrrK9Wx9Dkz6fhw6UZwNM31KX0l0YZsv4hPHNk6NsBhrO4/
         EhySBd8R4ixubMzTBx47NcLptPEQcc9nhOQRSp68KR5MF7H5V+wmK/wQWIIHDavV0fkZ
         SBKvHvdritZ9w4z/GVNAyhuj5yZkOHVWHB5YiuwjLvq9gihTrGRPhgrFnz6kLD7KFFmc
         hyuKGOnA8rf9hKzlwP+5JbQlcQvsg8aQEn+cF8l1n95oGqvimoPoe8kUzqyAJdVU/T6M
         VFIfkNNn2/SGiyNeFabIps/1SCSDV1oMpNeo24un+tlqQ9PIyRVW8Wu29+Ri2l+HBok/
         n9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DGA8+gwrB3sAonXBmChAGNY7ZvvzV2hTqZrY8zZK8EE=;
        b=kPI2LoJwYyq5sOJI4cu2+jgXR3dGfTwRIZw1gCXtVujkmpubdAAxYBvh5Dorgqkwrc
         NFMH5CIaQr+kPKqkWLi7vSZODFLsk5j/cCGv/wTgo/NoIRVqKbb8bJo7Z2F5lInVpeB3
         4Vf4+u6H4acnkoB0SCGM5ofstHPT7oqvKuMY83HS6lidbfhjwvLpSqkqjW7aVFRyXOWr
         gzzAnrF0DbAhvQjqHicpZVXc+zxdE/bQXrKnwluKIoiSu5NYA/SKwCghEHj7TtADt73w
         IvuR7pQgQtKp4Iu802YEE9RDbB8ASMBZkAgSFSaYJVqkcebs4NkJFvfVqxW3deixMEt3
         S5bg==
X-Gm-Message-State: AOAM530TTOuoxX1Cn+vJQq/XfOvbPd/B5NPYLIGFawaC2fxwNXoHnZvT
        gji2iOTBy+wTH9gFjKYMUxY9AmMjFr9cy2AUAEOh7g==
X-Google-Smtp-Source: ABdhPJxYSpi1BHzeBCHwCIqOzLWVTcTjGnDSiBqngNyrcb+IxPDN8WOHCv0iGeIsP7xXL3Opes7weirBZfL8IM+8VEk=
X-Received: by 2002:a37:a088:: with SMTP id j130mr11365723qke.147.1596760073565;
 Thu, 06 Aug 2020 17:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200805112655.17696-1-colin.king@canonical.com>
In-Reply-To: <20200805112655.17696-1-colin.king@canonical.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Thu, 6 Aug 2020 17:27:17 -0700
Message-ID: <CA+wgaPPL_sdo+fkQa3pqNmTadg9X6mfJZy5nyR5YTt4L6pHWtg@mail.gmail.com>
Subject: Re: [PATCH] staging: ion: fix spelling mistake in function name
 "detatch" -> "detach"
To:     Colin King <colin.king@canonical.com>
Cc:     Laura Abbott <labbott@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 5, 2020 at 4:26 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the function name ion_dma_buf_detatch.
> Fix it by removing the extraneous t.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks Colin!
Acked-by: Hridya Valsaraju <hridya@google.com>

>  drivers/staging/android/ion/ion.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 3c9f09506ffa..e1fe03ceb7f1 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c
> @@ -205,8 +205,8 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
>         return 0;
>  }
>
> -static void ion_dma_buf_detatch(struct dma_buf *dmabuf,
> -                               struct dma_buf_attachment *attachment)
> +static void ion_dma_buf_detach(struct dma_buf *dmabuf,
> +                              struct dma_buf_attachment *attachment)
>  {
>         struct ion_dma_buf_attachment *a = attachment->priv;
>         struct ion_buffer *buffer = dmabuf->priv;
> @@ -331,7 +331,7 @@ static const struct dma_buf_ops dma_buf_ops = {
>         .mmap = ion_mmap,
>         .release = ion_dma_buf_release,
>         .attach = ion_dma_buf_attach,
> -       .detach = ion_dma_buf_detatch,
> +       .detach = ion_dma_buf_detach,
>         .begin_cpu_access = ion_dma_buf_begin_cpu_access,
>         .end_cpu_access = ion_dma_buf_end_cpu_access,
>  };
> --
> 2.27.0
>
