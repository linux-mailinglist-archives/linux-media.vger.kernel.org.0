Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F214003A6
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 18:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350141AbhICQsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350083AbhICQsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 12:48:13 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1622C061575
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 09:47:12 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id i28so10467452ljm.7
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3SbG8sX/0ZzQsMJDjp4NMB1XLP9fPSRfuxnRQ0qJ6ZQ=;
        b=h96jPvB1VF8aXmsyKYTK3pyMfkjlr4jae/eMazr84KKEVE3WPPzLi2drfZe0sltNls
         ezB2zs40eBbOBAXGEZgOIBC/h9TYpHxHyV9nqS09K3LiD89aE2JMppnmeBY2mrvEMKxc
         vIH5g7LBEYPFVstKUTFJLfFel+honSYDWbJZaoE+GV+VdCFmQcIqwmyg0XxY3b8BMj2c
         YS0SrgO4m0l7CqlY79p/FdLyjpU3CcIOGbV6VR/tfo2w/3mbglFhvWKq5g1HLR0GEGmw
         Wt/1hfZqzflI3KNZZZ8AHcrEYVSJzdk/v6pPtL6LNUO0YHz8P2AvUL/46173JDZ2Qv6u
         zvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3SbG8sX/0ZzQsMJDjp4NMB1XLP9fPSRfuxnRQ0qJ6ZQ=;
        b=RIOCACQ8NQZBrmqUzyd/ugooKZjcwZ8q2hRmefA/Fbll75gNOu293kT/i8PK1p+/VV
         ckVqYNS42k5u8O85Ca7syfVt2P2oiK2+KoZploufaTANt+22iAkqab2muUCkymEeXRPt
         H0lEY+ZAj3KLduWToNs7qbaCQMdEOkZxt1ov05LwZunYzwpgQTFeNah6nmC6GDxJU6aU
         Q9/vw9oOkClphj1xWP3sUiL+MIMeHzypScbZcrznTNlswEEBCp+/zI87oOF3e6VSguAy
         YWNbPltmvD+u3rHI1whNW3ziUl0BKxOj9WKvKllhTxPb61IuoFy1X2ptpCRcbCiln3i5
         nyLA==
X-Gm-Message-State: AOAM530J3pgNz/1eXhosx7uwTLqW8zLlQ/VKjl36KCiGRYPK46fapWjq
        4iXWji8rR/M+q/5WgvwDMm13EEyw7F6I1eJJl2TFjg==
X-Google-Smtp-Source: ABdhPJwNAt83j9fd+RPScqWuwfEU2cw02u/Mf4m+X7BGCDeel+rBomwbplyiuXmf8qSWEvlZ/A+44IrmpEVPwQGr418=
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr3538184ljk.121.1630687631028;
 Fri, 03 Sep 2021 09:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210902124913.2698760-1-geert@linux-m68k.org>
In-Reply-To: <20210902124913.2698760-1-geert@linux-m68k.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Fri, 3 Sep 2021 22:16:59 +0530
Message-ID: <CAO_48GF3OL9+x-jdEXN9kYZaS2kBgAq0MNmGYfxKasPWcmJWaA@mail.gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: Add missing dependencies on DMA_SHARED_BUFFER
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hridya Valsaraju <hridya@google.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Geert,

On Thu, 2 Sept 2021 at 18:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>         Hi Sumit, Christian,
>
> This patch series adds missing dependencies on DMA_SHARED_BUFFER to
> various options of DMA-BUF, and drops a bogus select.
>
> As drivers/dma-buf/Kconfig contains interleaved options that select or
> depend on DMA_SHARED_BUFFER, they can't be wrapped inside a big
> "if DMA_SHARED_BUFFER / endif" block.

Thanks for catching these issues and the patch-set. LGTM!

I'll apply them over.
>
> Thanks!
>
> Geert Uytterhoeven (3):
>   dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
>   dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
>   dma-buf: DMABUF_SYSFS_STATS should depend on DMA_SHARED_BUFFER
>
>  drivers/dma-buf/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds

Best,
Sumit.
