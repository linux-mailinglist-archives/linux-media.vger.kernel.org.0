Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D524222E9
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 11:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbhJEJ7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbhJEJ72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:59:28 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAA6C061765
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 02:57:36 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id dj4so76790648edb.5
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mcUx6mFpPjRWb+s/DSiH7CSR1lxitUSgQfuJXwjrEzM=;
        b=XxjVUrlzLpLKzpxmT+9cuXU4t7FWXSQ+5JK+kHlkVE+zALIUo6EP0uLi69A7WEhfcs
         Hd630y3z8QG+bgU5PGoV0r4iklRHOhbpy7us9MKQUczYD1lH0yUmu3c7Sw1PX/iwJzLi
         Lf2iDxuAAMZHS9Utm25mtNWFCxVXjd1+hIa7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcUx6mFpPjRWb+s/DSiH7CSR1lxitUSgQfuJXwjrEzM=;
        b=T7mBRwdGj9wMBU+LODUUT8YFcTfnU7Z+kUycpIPyAcXsZnXDpwKlu8Rcst/FUcmOI9
         EDMUFTd6986pc1ddRghB6EY5SMcrX6tRtuH2703EQEenV02aCDSxYWg/TCyyjL/9wxWT
         bRdupBl5DLkRRNlTh7b0gseVEyBmHEHVUr3HneRxHLBc65WGM9YX/+BUvJAj1wluwuVQ
         uIwkVAH0HPa7I9BWHR1EKDxJYmb24P0W6BE2f/ddqG0F5UZOOhFn6d43TuHeq0PnFbWj
         Ktq9w3sr6zbUBi6SG2wFjJRlgzBy9AAnVZogYC0/4GeZGNLq+NMcB82aMZwgCeT0jvqA
         SlYg==
X-Gm-Message-State: AOAM532E1U3zfXMCwLyc1l1uQmHLV8LRGQmpaXKubFTyCFNsmOIg8jLQ
        YgAOQVUSYxlAa3EoEWFseiICbb65718+lg==
X-Google-Smtp-Source: ABdhPJzdo3p5fTDZ0x9Ouwr2lxKiCpGSzTRNcfjIzXMUaofTIml9EpaXK8tA3dE7nsh4XTCpTNOC4g==
X-Received: by 2002:a17:906:5950:: with SMTP id g16mr24377062ejr.149.1633427852800;
        Tue, 05 Oct 2021 02:57:32 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id s3sm7539293eja.87.2021.10.05.02.57.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 02:57:32 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id t8so36406525wri.1
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 02:57:32 -0700 (PDT)
X-Received: by 2002:adf:a184:: with SMTP id u4mr20543894wru.69.1633427851714;
 Tue, 05 Oct 2021 02:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210928034634.333785-1-senozhatsky@chromium.org>
In-Reply-To: <20210928034634.333785-1-senozhatsky@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 5 Oct 2021 18:57:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DLiW23a0U_JjnpvoYmpcbiKbStq7=w=7KvbDP7zLvBaA@mail.gmail.com>
Message-ID: <CAAFQd5DLiW23a0U_JjnpvoYmpcbiKbStq7=w=7KvbDP7zLvBaA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: always set buffer vb2 pointer
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 28, 2021 at 12:46 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> We need to always link allocated vb2_dc_buf back to vb2_buffer because
> we dereference vb2 in prepare() and finish() callbacks.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index b052a4e36961..38767791955d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -600,6 +600,7 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
>
>         buf->dev = dev;
>         buf->dma_dir = vb->vb2_queue->dma_dir;
> +       buf->vb = vb;
>
>         offset = lower_32_bits(offset_in_page(vaddr));
>         vec = vb2_create_framevec(vaddr, size);
> @@ -788,6 +789,8 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>                 return ERR_PTR(-ENOMEM);
>
>         buf->dev = dev;
> +       buf->vb = vb;
> +
>         /* create attachment for the dmabuf with the user device */
>         dba = dma_buf_attach(dbuf, buf->dev);
>         if (IS_ERR(dba)) {
> --
> 2.33.0.685.g46640cef36-goog
>
