Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30A24A5835
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 09:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbiBAIF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 03:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiBAIF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 03:05:26 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F68C06173B
        for <linux-media@vger.kernel.org>; Tue,  1 Feb 2022 00:05:26 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id c15so22878976ljf.11
        for <linux-media@vger.kernel.org>; Tue, 01 Feb 2022 00:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p0PJJMIRjpabG82Db2BkgEWkwXsmVMEfTVi2vjGRhtw=;
        b=izEqZAN6elcstfVcTg/tMHTABwgB/UMX/WOkNRN//agL7z/6AQ8IQpDwjRbjFiOFyW
         NSBjTU+DIpdkHEZSRFsK6dVcNOQXPRBlm+IInH2I4wUMQzKZVRtRzB0KgyZg3h/sWkIF
         P+52Df+wsBiYo+fABOASc+LW2G3zz9xmANft5nYdfMcrNmXe9eCuLBu7ufKU7t845c0w
         qDT1+SS6cYJ+t5Acbj+TXosOfeB5NFVfglRyE7tANu/CnIgwimMAw8vHGbNFYvo9eoDv
         /ap5CD/+2MDDcxr82vy5XgYwsoCyOoR3ymgxdDClfxnWzEMk4tdJbPN0uZwLLmOONJyV
         v1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p0PJJMIRjpabG82Db2BkgEWkwXsmVMEfTVi2vjGRhtw=;
        b=ijr9PS6dpMJSxjGlcxJOyNDAcXl8CCqqZGeuis4zGUuNnMAvw66+AowdPPiTqzypSe
         7yWNBG8vLt15/j+O1sD0VEdbzRdJKpLJLqspcn9bFK+yhaX8cGK6t8rQ5XrDgNwQjvM4
         7bpjiMff5u4OWMWKtr7VH1g708i0Tq+in+mu2A251/OONf18UqMXzqhslmMly9KJNusK
         4uioY06cxZK8rsBm9n8tsU1UC0D3xd8u8fzXNB+ezeyYwf1fbrYaJbnlAO6BPxfSHCIv
         sZjKc0bUUmeOqTtRTJ+KYB4wZ8CwB0rkcgIwnYaurHtHpliBuX/V1Sd6kt0Li7yMA9za
         kKWA==
X-Gm-Message-State: AOAM533UffdqG8iB6UPL3qk0QZI5Aek/3P70geEDfwPML83cYMEY57e0
        GBh/Xu5C9Xw4wq5qnz4Eg3Bt4FpVMifJv9D9dzX2ng==
X-Google-Smtp-Source: ABdhPJxZwJ8f1U9XZiyGVaA6XDvnmQLDIfQhyp8AtRxgE5A16/QfHpbjmzbDOUwB09+DzDui2DpTkgQ/ryAXMams73Q=
X-Received: by 2002:a2e:a405:: with SMTP id p5mr15566025ljn.121.1643702724483;
 Tue, 01 Feb 2022 00:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20220129150604.3461652-1-jordy@pwning.systems> <CALAqxLU58UYLRNrf4C7t4_SmSa1aUVaDj4SP=zCPfb9m6HBUNw@mail.gmail.com>
In-Reply-To: <CALAqxLU58UYLRNrf4C7t4_SmSa1aUVaDj4SP=zCPfb9m6HBUNw@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 1 Feb 2022 13:35:12 +0530
Message-ID: <CAO_48GGw3bfLdLArCMHNUsiGK_brHZ3D2dQd19wJj2_FoggCUA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix potential spectre v1 gadget
To:     John Stultz <john.stultz@linaro.org>
Cc:     Jordy Zomer <jordy@pwning.systems>, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jordy,

On Tue, 1 Feb 2022 at 02:09, John Stultz <john.stultz@linaro.org> wrote:
>
> On Sat, Jan 29, 2022 at 7:06 AM Jordy Zomer <jordy@pwning.systems> wrote:
> >
> > It appears like nr could be a Spectre v1 gadget as it's supplied by a
> > user and used as an array index. Prevent the contents
> > of kernel memory from being leaked to userspace via speculative
> > execution by using array_index_nospec.
> >
> > Signed-off-by: Jordy Zomer <jordy@pwning.systems>
Thanks very much for your patch; I've pushed it to drm-misc-fixes, so
we should see it in mainline soon.

> > ---
> >  drivers/dma-buf/dma-heap.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 56bf5ad01ad5..8f5848aa144f 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/xarray.h>
> >  #include <linux/list.h>
> >  #include <linux/slab.h>
> > +#include <linux/nospec.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/syscalls.h>
> >  #include <linux/dma-heap.h>
> > @@ -135,6 +136,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
> >         if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
> >                 return -EINVAL;
> >
> > +       nr = array_index_nospec(nr, ARRAY_SIZE(dma_heap_ioctl_cmds));
> >         /* Get the kernel ioctl cmd that matches */
> >         kcmd = dma_heap_ioctl_cmds[nr];
>
> Thanks for submitting this! It looks sane to me.
>
> Acked-by: John Stultz <john.stultz@linaro.org>
>
> thanks
> -john


Best,
Sumit.
