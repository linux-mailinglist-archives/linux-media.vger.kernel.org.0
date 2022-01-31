Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39A64A5054
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 21:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377994AbiAaUjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 15:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378035AbiAaUjn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 15:39:43 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE180C06173D
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 12:39:41 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id u6so29342945lfm.10
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 12:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=np4e6RD8bcxsxGDFQSQ6Wvj5x603dmmfdRkFqggTL3M=;
        b=Q4SKA5IdjOz/7QFJ4Z0X+4KOqGhoQSt94SjvwcSaCX0K1amQag2xp72Y70oVzIJGcV
         OlkNrq8mgz77qJTAyhk2ZhTUD8l59Ruv4ESJDIgK8PuM7cGAVMVlvhnSbXjs1Dm1PTRY
         daLdGSWYyMbdN4r/Q81TPuibY9bOCHGirpuyJzlZctK9lV4ipEdM3h6KtXdmooqEnaO1
         9TU2+AahMi3PpeYAKqyXsqLYMZt1e9n35LLp01tdvQKnUokZaNrpMl6TkYBgT1VVpPCZ
         lRqC1mC2TjZojYuydSDAxZMEl9jlC4KhGpqQRvRQzjGFHnHmWYcjF/NYXWXpESIunHpQ
         FsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=np4e6RD8bcxsxGDFQSQ6Wvj5x603dmmfdRkFqggTL3M=;
        b=SywXCCOwWkbeE/DMPGBVyVflYZHruJHD4iCkS6CnBA5loR/BpYSCFMBp3hMdTYGqAZ
         UiAIbcaaOAWPg5HtJsfmqUjqsZNYMqgUv84ZafYEx2nMiCuZFNL84LCZ2qMi5vuGdbfr
         bO8AjWqy4pnLo/JnCNqh0BW67MAW2/OQIJE4KHAWDkDTLuXELfsH0xz+5KaTcQ7cLZ9C
         5Z3qEu6vKAO8yfuaGanUesNsrarG9OIqnB2NmLl/FQKJ+npTdo+JocLaWvADGIGm7OVW
         qJmgAjrNQwJRysHkBPvzBk22XgNNNBf8jjLlkDlFp74XA3P5kJmltFgrzTQaZ/iVLclA
         YdKA==
X-Gm-Message-State: AOAM530j1OV98jvlBUzoUGrvfbcVX5SIk83hA+aYGm/01Bix9XUoxNuB
        ItpaaIE461+w3qRQiV+xy1YbEvtmqQ5MAXTcd2UENA==
X-Google-Smtp-Source: ABdhPJwujbhq+i0qTNRuZ+BiGkLSicKWY8TPo9L2LEzw9/qgpOhmUj+SNSa3a4Mh4JMV8MtM6PSgZiAXNhoauP0uUk4=
X-Received: by 2002:a05:6512:4012:: with SMTP id br18mr15944158lfb.533.1643661580262;
 Mon, 31 Jan 2022 12:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20220129150604.3461652-1-jordy@pwning.systems>
In-Reply-To: <20220129150604.3461652-1-jordy@pwning.systems>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 31 Jan 2022 12:39:29 -0800
Message-ID: <CALAqxLU58UYLRNrf4C7t4_SmSa1aUVaDj4SP=zCPfb9m6HBUNw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix potential spectre v1 gadget
To:     Jordy Zomer <jordy@pwning.systems>
Cc:     linux-kernel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 29, 2022 at 7:06 AM Jordy Zomer <jordy@pwning.systems> wrote:
>
> It appears like nr could be a Spectre v1 gadget as it's supplied by a
> user and used as an array index. Prevent the contents
> of kernel memory from being leaked to userspace via speculative
> execution by using array_index_nospec.
>
> Signed-off-by: Jordy Zomer <jordy@pwning.systems>
> ---
>  drivers/dma-buf/dma-heap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 56bf5ad01ad5..8f5848aa144f 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -14,6 +14,7 @@
>  #include <linux/xarray.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
> +#include <linux/nospec.h>
>  #include <linux/uaccess.h>
>  #include <linux/syscalls.h>
>  #include <linux/dma-heap.h>
> @@ -135,6 +136,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>         if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
>                 return -EINVAL;
>
> +       nr = array_index_nospec(nr, ARRAY_SIZE(dma_heap_ioctl_cmds));
>         /* Get the kernel ioctl cmd that matches */
>         kcmd = dma_heap_ioctl_cmds[nr];

Thanks for submitting this! It looks sane to me.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
