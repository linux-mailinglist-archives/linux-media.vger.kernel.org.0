Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5298549463C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 04:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358395AbiATDtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 22:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358387AbiATDtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 22:49:09 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2317EC06173E
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 19:49:09 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id p27so16689448lfa.1
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AZnU5cEeFyaFBnpj/0CbEtA8JHuWrnQecXMIYCnzB/o=;
        b=ErV1kJfadCu1b5wgD6aEviZCSAk41KIjnGh8WYn8aHbrfBmz/Z03LAGBXFW2rQaPAJ
         8nUEBpkWeomoODmY334NhCZOU+o0EljJbg8u2iyiFqhQzZA+efnPNwuXwUbmf0s5v/T1
         kCYeVe9Uk4rKeiAhQV0qJH3LNcIRAZLLfIB4l+8HBTpN2EbhE7OMo9MsZ1jJFtNumTI7
         6nq4zktXZrLgMTkM/3rhi6H2v1j+XohmCPmuRZ67scdSpSHYsD2JZXkUmKHOEB9cL3zx
         lOz0lnwWIRRBoK8mzCl56IReSHCns1DzoysZ5ToPrtmXJlo7ywMjgvALaTMfHs/M01U3
         VAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AZnU5cEeFyaFBnpj/0CbEtA8JHuWrnQecXMIYCnzB/o=;
        b=snF1AdZBFODcPkH+1glxdx5FH98kaifyu1knPkSyNhbqLBQXsxTIhLvAC+D8hjWLH/
         a+g66DKBiNycLMTzuB/sVY3aTPrGlu06fDDHCd3JZOE8REXTvN4fTKFBbG3cJuGYw9a5
         95GkDzwUJh73iRGEsq/erj4R7gLeBAYfFtgj0/xybylFxqbGmt9pwCEd1fqYBKlKuP1M
         l/DbE5Sn6WrTJ5YyWPEkcv1adAbGL+kqSyE81np83p2+iXw3p46wYk6523y8kUrQwrmh
         E63X7GPLfhRbQrKguyS4cm/Eb8Npzbqbsg/A3dJyOyH5nPZt6ZnarwyVgztfPh0gEhv6
         qdeQ==
X-Gm-Message-State: AOAM5338QcLnJ8ZNV6PHTxCQS6tJl0pvKQVI2qZK0PJLCzcb9cj9qtM6
        m0+3cDXLz5NSo+ZwJGOrFZv4jQWl+YgGuhIzHBS5pQ==
X-Google-Smtp-Source: ABdhPJx0/Bt4Fv7Zhtxsw2WH0QARsie3jQTiwGG/ZBJTXsXxHRBXcquj3uP0/ZLAIBtBfzPMkNDAYvLD72ukCtWU1g8=
X-Received: by 2002:a05:6512:3e1f:: with SMTP id i31mr25221311lfv.661.1642650547311;
 Wed, 19 Jan 2022 19:49:07 -0800 (PST)
MIME-Version: 1.0
References: <CALAqxLUtK8V9LgC-DY+tkzFYyWfzF+JhbrLZk6UhEG57HQBDSA@mail.gmail.com>
 <20220120033450.90164-1-guangming.cao@mediatek.com>
In-Reply-To: <20220120033450.90164-1-guangming.cao@mediatek.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 19 Jan 2022 19:48:55 -0800
Message-ID: <CALAqxLW5uEZCGHGk3rYoiOGzN5XMKb39JzoPB1iEX9k3UsiT-A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Add a size check for allocation
To:     guangming.cao@mediatek.com
Cc:     benjamin.gaignard@linaro.org, bo.song@mediatek.com,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        jianjiao.zeng@mediatek.com, labbott@redhat.com,
        libo.kang@mediatek.com, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        lmark@codeaurora.org, matthias.bgg@gmail.com,
        michael.j.ruhl@intel.com, mingyuan.ma@mediatek.com,
        sumit.semwal@linaro.org, wsd_upstream@mediatek.com,
        yf.wang@mediatek.com, caoguangming34@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 19, 2022 at 7:34 PM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>
> Add a size check for allocation since the allocation size should be
> always less than the total DRAM size on system heap.
> And it can prevent consuming too much time for invalid allocations.
>
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..bd6f255620e2 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -347,6 +347,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>         struct page *page, *tmp_page;
>         int i, ret = -ENOMEM;
>
> +       /*
> +        * Size check. The "len" should be less than totalram since system_heap
> +        * memory is comes from system. Adding check here can prevent consuming
> +        * too much time for invalid allocations.
> +        */
> +       if (len >> PAGE_SHIFT > totalram_pages())
> +               return -EINVAL;

Thanks so much for revising and sending this along! It looks good to me.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks again
-john
