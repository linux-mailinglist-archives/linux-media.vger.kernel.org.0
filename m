Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB7046117B
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 10:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245748AbhK2KAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 05:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238140AbhK2J6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 04:58:43 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F30C06175F
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 01:37:22 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 132so22150582qkj.11
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h5KHLBYpwHVLJmQRJ+a2RZr2V0rOrITf1iTJaEhyq+I=;
        b=fxU1GHxrSAChQ4YoBsGlhW0ioncX9rISxXRWfWXTAvEb4z4KC9Cm+ADVe2ykY6n3dO
         m7NGhb0hhvoZVkQalVLheDpjSjrr7rN5TdAn2XRYA6hJM71n10LmZklUIWTygHFoq0q4
         cvBjO3MJAwR5eIO4499p/Tt3N/WSpsm6rTjKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5KHLBYpwHVLJmQRJ+a2RZr2V0rOrITf1iTJaEhyq+I=;
        b=El6HwRxZQYIY3aSb82jLtzJP1Xxjac3mLbm3VDYeWUsyn7lDpeAdlPCQww0ZM3JrRm
         SWeBu66ROZ6Gb1rfg0XhEjd42Vl1/ZDEHXPtQIx9a8XynxvFe1kzp5mQ+ve220ofbYBB
         nEGlXdDrymPraFaBVUob1oCjPbpfQ6KokQvXanccjg23jwV32ARZaSZUo0u9DKe/jxLg
         za8dobKcs/Zl4UGvZ+kRZpsa6TWcQDAyPyUBdPSM512y1Mbf6wGrA/G1Zx2v20YYpiHU
         tq9MvdfCzjxBBoNBgB6NMYSWZKTnfE7xRpxtfbInRz8u3Q//jLW3Td+ZQyG/+N90mBTF
         BtNw==
X-Gm-Message-State: AOAM5300SyH+eiMaWVa+ZYDlUtlIxBRdl/VGWWBqcbjf/AZNnHo2PqVy
        A1mad50a/Dqfj+OCof2+MPMtaiNA/9cr132k
X-Google-Smtp-Source: ABdhPJxtL2WI6RtwSLl4x/qac9T7HntFQMwSB/IKMNOOrNZqwOxY/53p8sGxVFvpciyQnheJKZH0AA==
X-Received: by 2002:a05:620a:bce:: with SMTP id s14mr35707913qki.482.1638178641686;
        Mon, 29 Nov 2021 01:37:21 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id s10sm7503109qke.132.2021.11.29.01.37.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 01:37:21 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id v203so40451890ybe.6
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 01:37:20 -0800 (PST)
X-Received: by 2002:a25:3c5:: with SMTP id 188mr34562556ybd.174.1638178640461;
 Mon, 29 Nov 2021 01:37:20 -0800 (PST)
MIME-Version: 1.0
References: <a8932f2c-5342-2cd8-9b98-1db0de756190@xs4all.nl>
In-Reply-To: <a8932f2c-5342-2cd8-9b98-1db0de756190@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 29 Nov 2021 18:37:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AtvWRWQkihCaK06s+Q7ROo2g9aREej_c+PTgisD3F8ew@mail.gmail.com>
Message-ID: <CAAFQd5AtvWRWQkihCaK06s+Q7ROo2g9aREej_c+PTgisD3F8ew@mail.gmail.com>
Subject: Re: [PATCH] vb2: warn for or disable the CMA + USERPTR combination
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 8:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> If one or more pages of the user-allocated buffer memory were
> allocated in CMA memory, then when the buffer is prepared any
> attempt to pin such pages will fail since user-allocated pages
> in CMA memory are supposed to be moveable, and pinning them in
> place would defeat the purpose of CMA.
>
> CONFIG_CMA is typically only used with embedded systems, and
> in that case the use of DMABUF is preferred.
>
> So warn for this combination, and also add a new config option
> to disable USERPTR support altogether if CONFIG_CMA is set.
>
> I've chosen to put this under a config option since disabling
> it unconditionally might cause userspace breakage.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Should USERPTR just be disabled unconditionally if CONFIG_CMA is set?
> Feedback would be welcome.
>
> I noticed this issue when testing on a VM instance which had CMA
> set and had 4 GB memory allocated to it. The test-media regression
> test started failing because of this issue. Increasing the memory
> to 16 GB 'solved' it, but that's just papering over the real problem.
> Hence this patch.
> ---
>  drivers/media/common/videobuf2/Kconfig         | 11 +++++++++++
>  .../media/common/videobuf2/videobuf2-core.c    | 18 ++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/media/common/videobuf2/Kconfig b/drivers/media/common/videobuf2/Kconfig
> index d2223a12c95f..d89042cbb5cf 100644
> --- a/drivers/media/common/videobuf2/Kconfig
> +++ b/drivers/media/common/videobuf2/Kconfig
> @@ -7,6 +7,17 @@ config VIDEOBUF2_CORE
>  config VIDEOBUF2_V4L2
>         tristate
>
> +config VIDEOBUF2_DISABLE_USERPTR_AND_CMA
> +       bool "Disable use of V4L2 USERPTR streaming if CMA is enabled"
> +       depends on CMA
> +       depends on VIDEOBUF2_V4L2
> +       help
> +         Say Y here to disable V4L2 USERPTR streaming mode if CMA is enabled.
> +         If some of the pages of the buffer memory were allocated in CMA memory,
> +         then attempting to pin those pages in place will fail with an error.
> +
> +         When in doubt, say N.
> +
>  config VIDEOBUF2_MEMOPS
>         tristate
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 2266bbd239ab..17166d4212d0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -662,6 +662,20 @@ static int __verify_userptr_ops(struct vb2_queue *q)
>             !q->mem_ops->put_userptr)
>                 return -EINVAL;
>
> +#ifdef CONFIG_CMA
> +       /*
> +        * If one or more pages of the user-allocated buffer memory were
> +        * allocated in CMA memory, then when the buffer is prepared any
> +        * attempt to pin such pages will fail since user-allocated pages
> +        * in CMA memory are supposed to be moveable, and pinning them in
> +        * place would defeat the purpose of CMA.
> +        *
> +        * CONFIG_CMA is typically only used with embedded systems, and
> +        * in that case the use of DMABUF is preferred.
> +        */
> +       pr_warn_once("The USERPTR I/O streaming mode is unreliable if CMA is enabled.\n");
> +       pr_warn_once("Use the DMABUF I/O streaming mode instead.\n");
> +#endif
>         return 0;
>  }
>
> @@ -2399,6 +2413,10 @@ int vb2_core_queue_init(struct vb2_queue *q)
>         if (WARN_ON(q->supports_requests && q->min_buffers_needed))
>                 return -EINVAL;
>
> +#ifdef CONFIG_VIDEOBUF2_DISABLE_USERPTR_AND_CMA
> +       q->io_modes &= ~VB2_USERPTR;
> +#endif
> +
>         INIT_LIST_HEAD(&q->queued_list);
>         INIT_LIST_HEAD(&q->done_list);
>         spin_lock_init(&q->done_lock);
> --
> 2.33.0
>

I think this is a good first step. I wonder if we should explore the
possibility of officially declaring USERPTR deprecated in the
documentation?

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
