Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A07224AD71
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 05:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgHTDq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 23:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHTDq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 23:46:57 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDED8C061384
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 20:46:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id i80so236882lfi.13
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIchUN4tOHyQmoooHagLeI7lJ2WK7JXkWyfuUiGtb4U=;
        b=cdrzd8DIJ9+V4zbbpYRCDfD/ME6MRUgMWO1v+hngvJLZ6QUHqpxtZhfVChVn0KV1YI
         L16g+IBo/PcqaRGEJl1cra6LI2AVjcny64WifYbPZns6gz6+gFxxWmxtlYj9HZzTAjzi
         BLiUryBAwPeKKrJyDbZyYfUZn14Q00tasLilhAt3bb1/JduHvrKlC9mZ8Dy1D7L17NKj
         J/zdlCU1JZncuPj6GELWF7xGpoLwcnEEUUaZeVMFcp2KDqvBeq5sZJhL66J0DMYEsSH/
         4USCC9pPciz4YakEK4jaCTAAIs6B1to8yLLUVxaW6MFEgIPb3iymIqt865iHYfT68diA
         OPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIchUN4tOHyQmoooHagLeI7lJ2WK7JXkWyfuUiGtb4U=;
        b=n7C4eH63DhR6klNOdmWvcTfFCa43fmF1rG7FXR+ACavAJXO2hAxVyjmdDFeSLv4Rm1
         nBtVfl1lQyA43m6vXZzZT+04GXDHno1NNyjgNXTQoqd1ag28CYJ8cQT1LVAvMxClwHD/
         FQAR2IFTdJ58t0AZPzpPvmr/RXBDhm7gXkv2xB+v2MOLmGAagan0IA2Fc9QQjjSrlVX+
         Z2nQYpKp3ysa7JisnlTH/2ZNW5Tk6VmA0ffySmdo8Ewex7AWEF5pqM4JAL8CtT5AtS22
         BO7X04tbyULxHnDIICHF42S20bFor/0rKBapPkK6Bdf9RELu+G70fSsZzXC1FyRg3NXM
         rW2A==
X-Gm-Message-State: AOAM530YJBHxIFCukMdO2I51VbohuNMlcM+AbNX5tIoBanRlWsRKRCz1
        n+wpk2sDdab3xFX+wD0mzxDrG2cFQK8THGXy1xeXGAyViOgQiCoY
X-Google-Smtp-Source: ABdhPJyh8nJHRDA1mfQUy8hmEEmCfXfd0QzynbDBcUhoqQgBHFkqmr86v4MdYm3HWWb1KXvShlGfk8bos1w9MFj/vlw=
X-Received: by 2002:ac2:5383:: with SMTP id g3mr576386lfh.45.1597895214380;
 Wed, 19 Aug 2020 20:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200819175134.19261-1-krzk@kernel.org>
In-Reply-To: <20200819175134.19261-1-krzk@kernel.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 20 Aug 2020 09:16:40 +0530
Message-ID: <CAO_48GGjS6rAU1ojTDc9RA6e8nS4PRKOJEBzu-Vpc69x+7ykyg@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] dma-buf: Fix kerneldoc of dma_buf_set_name()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Krzystof,

On Wed, 19 Aug 2020 at 23:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix W=1 compile warnings (invalid kerneldoc):
>
>     drivers/dma-buf/dma-buf.c:328: warning: Function parameter or member 'dmabuf' not described in 'dma_buf_set_name'

Thanks for the patch; I will apply it to drm-misc.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/dma-buf/dma-buf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 1699a8e309ef..58564d82a3a2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -316,9 +316,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   * name of the dma-buf if the same piece of memory is used for multiple
>   * purpose between different devices.
>   *
> - * @dmabuf [in]     dmabuf buffer that will be renamed.
> - * @buf:   [in]     A piece of userspace memory that contains the name of
> - *                  the dma-buf.
> + * @dmabuf: [in]     dmabuf buffer that will be renamed.
> + * @buf:    [in]     A piece of userspace memory that contains the name of
> + *                   the dma-buf.
>   *
>   * Returns 0 on success. If the dma-buf buffer is already attached to
>   * devices, return -EBUSY.
> --
> 2.17.1
>

Best,
Sumit
