Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A8F231251
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 21:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732656AbgG1TR4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 15:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729133AbgG1TRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 15:17:55 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D002DC0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 12:17:55 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id s144so8581481oie.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsQ2Xj7AJ9j1QK6CR85sgGm7aJ0udfYN+K/GnPLpLbM=;
        b=g7TgRceJkWHA8Gdrz/5KD+CzesTetjdFidS4FAzi4lpvcxWtsQYny19T8XXlUrrkem
         ayzc0GZiIfc70wq8DMNsUX8SusGZt12P7ACPGfEGKD0C0WJhCyYcnX8h3TOI1oSbQDsa
         fF/d3X1Toxt+pY8/Y80l0rRaAjQXO5u+SozqWqlP83Z7gi2VRNJUm4uVE5A0cRWAzzrz
         8nD+ugQN8H2GE+Vyo6tsnep4ZOi9FBb09O4ja0k/y4jwrZdRKH/fdRmPVbNfvgD06wUd
         uI83nG8Fjyqu7mv8GkWniQm7t2kuG+KKR4ytgHHM7ZCi62BRw3V4O4jVv2q8XGOIZ0xK
         EYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsQ2Xj7AJ9j1QK6CR85sgGm7aJ0udfYN+K/GnPLpLbM=;
        b=aSLGr/1XGorSLavGhWtYOzRg/MbLRC68j7EL6HDwbNpeW3SnmhFs3JFoqEF6x20FID
         uLP80LyBffOLM9CawiSNv2640hfMnjZzFUGWszHa1bcxyj+iytBF6qgXqEl3l9OjHQ/F
         rWS7Z+OEZOddCVy30wtjep59VQWb3OTwSRdK/mUmP03RZRzJVB7JXsh9/8QILHsXXO5d
         pAjrxVIXsOM/k9r3VBZcN7IZro7wLazexPzO8WGfQx5e7QLd9dvx9/VMZHz5WuRp4Fpr
         liG69wjfnHSywlYGAc+HitG8WjeJuXbt92vPT3XCQmUxbqR242Vqg3neZ5FrJPb99Zeg
         F2vA==
X-Gm-Message-State: AOAM533zGmqqh9I/5hEehAoS4WcFULg7al7WypA1dGlTKDwhduZn9EG1
        6dUrogyeBkj9WBltVUwJssVJb8/YiwjEw4UULKI97w==
X-Google-Smtp-Source: ABdhPJzG+EYMW8ZqVkQmWbz8HGmD3b012cHdzgtF5YTIcW8bgYYQxe6jtAovZ/LwvvmBrtV7DgJbflOpFiiLYO7ljsQ=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr5015644oif.10.1595963875197;
 Tue, 28 Jul 2020 12:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 28 Jul 2020 12:17:44 -0700
Message-ID: <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 6:10 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Current dma-buf heaps can handle only default CMA. This introduces
> dma_heap_add_cma() function to attach CMA heaps that belongs to a device.
>
> At first, the driver calls of_reserved_mem_device_init() to set
> memory-region property associated with reserved-memory defined as CMA
> to the device. And when the driver calls this dma_heap_add_cma(),
> the CMA will be added to dma-buf heaps.
>
> For example, prepare CMA node named "linux,cma@10000000" and
> specify the node for memory-region property. After the above calls
> in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
> associated with the CMA become available as dma-buf heaps.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++++
>  include/linux/dma-heap.h         |  9 +++++++++
>  2 files changed, 21 insertions(+)

Hey! Sorry for the slow response on this! I just realized I never replied!

> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 626cf7f..5d2442e 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -162,6 +162,18 @@ static int __add_cma_heap(struct cma *cma, void *data)
>         return 0;
>  }
>
> +/* add device CMA heap to dmabuf heaps */
> +int dma_heap_add_cma(struct device *dev)
> +{
> +       struct cma *cma = dev_get_cma_area(dev);
> +
> +       if (!cma)
> +               return -ENOMEM;
> +
> +       return __add_cma_heap(cma, NULL);
> +}
> +EXPORT_SYMBOL_GPL(dma_heap_add_cma);
> +
>  static int add_default_cma_heap(void)
>  {
>         struct cma *default_cma = dev_get_cma_area(NULL);
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 454e354..16bec7d 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -56,4 +56,13 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
>   */
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>
> +#ifdef CONFIG_DMABUF_HEAPS_CMA
> +/**
> + * dma_heap_add_cma - adds a device CMA heap to dmabuf heaps
> + * @dev:       device with a CMA heap to register
> + */
> +int dma_heap_add_cma(struct device *dev);
> +
> +#endif /* CONFIG_DMABUF_HEAPS_CMA */
> +
>  #endif /* _DMA_HEAPS_H */
> --
> 2.7.4

Looks sane to me.  Being able to expose different multiple CMA heaps
is needed, and I agree this way (as opposed to my earlier dts
appraoch) is probably the best approach. The only bit I'm so-so on is
adding the CMA heap specific call in the dma-heap.h, but at the same
time I can't justify adding a whole new header for a single function.

Do you have a upstream driver that you plan to make use this new call?
We want to have in-tree users of code added.

But if so, feel free to add my:
  Acked-by: John Stultz <john.stultz@linaro.org>
To this patch when you submit the driver changes.

thanks
-john
