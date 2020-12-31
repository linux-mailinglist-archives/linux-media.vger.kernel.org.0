Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE8C2E7FF0
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 13:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgLaMgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 07:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgLaMgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 07:36:02 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B985C061573;
        Thu, 31 Dec 2020 04:35:22 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id x2so17284095ybt.11;
        Thu, 31 Dec 2020 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mXeVoFxs+745Wn6735e+UTYyK3Qp5zeb9a5sClBGG1s=;
        b=oC9xhQ1dG3zjyvFnxOaAiL7i12X1Uon3b46xKKmXQIjNbdhTjhmfyai6RNvG9H7V7E
         fZpUFKJU+zGCwaclDJL2PrgIwrw+3pTzcjaiLmTG/sA3WJHwuhQOIp6Eqyqc4mGK2M6u
         JLt3tXsipUhbI7y87pYHRSsclIKYXSFnRNcoU36BI5IyYaMd1C5yEeMGsL9kzbNvasM1
         IlOH8LhzOB5GgxDla8QaqJeG4CQbWiVoD61i/QCZglal7+2ObbwGhPUCsTvWLInjVzJ+
         SSrlzR284MAD8vKLuFRxdnWlduDvMD3ruS7uICW4sEPWk/hTQwgxR69Rn1j3swtoivss
         p8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mXeVoFxs+745Wn6735e+UTYyK3Qp5zeb9a5sClBGG1s=;
        b=d1cRSSBp1/mTA4vBJvfgdjh8ftMOSbckWQh+o/j9qJyuv4P6ODy0xk7cTDg//0fOxT
         gfXUnwkIhHMD8IY9b95ZQx0+PqUOLGittk/k+CJshZBfHGgQT/+Umk5J25Rs9ja+t8i6
         VZeCM0djxMEU26DOvziE/+juAM74C7vFDOptBPayjr3BLTMW6jgZV+oct6m89cXIOAeL
         X6PxNCDJasz2tzlZ3ah50ro570Bs13r0TIsdCPCkDJ12Rbn88PiRm9BHXArSnu7OPf3p
         8Nc+QxZmdxS1OnbXFe64VEkdlqaD3eEvkrDt7LM5mvIsDBoU8MzlGOBoLXRdgAummpKC
         EIuw==
X-Gm-Message-State: AOAM5334N2w7yesgPA7BdezJwadaN6pratNHskslNBc73FNGLy7y9OJa
        PA4dvK7C7suSfWRRZdO9uZ9p0ieQ8dqjSJOh69PSjn2IpcDW6g==
X-Google-Smtp-Source: ABdhPJz9dLs9E9IoS3g7I2E47i4ZpH5DoAIvMoVlA0ks9MGZ3DQXhgq0Sj9ASlKbTaUPB23zhjkzV6Yqp0moO//3Bu0=
X-Received: by 2002:a25:5f07:: with SMTP id t7mr81698226ybb.395.1609418121278;
 Thu, 31 Dec 2020 04:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20201228135104.28566-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201228135104.28566-1-zhengyongjun3@huawei.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 31 Dec 2020 12:34:55 +0000
Message-ID: <CA+V-a8tAbXFxJsJ4MUgQa2rVRiW4P_OkHCmJFM5kNgfMqoRrDg@mail.gmail.com>
Subject: Re: [PATCH -next] media: platform: davinci: Use DEFINE_SPINLOCK() for spinlock
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zheng,

Thank you for the patch.

On Mon, Dec 28, 2020 at 1:50 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/media/platform/davinci/vpif.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
> index 5e67994e62cc..f1ce10828b8e 100644
> --- a/drivers/media/platform/davinci/vpif.c
> +++ b/drivers/media/platform/davinci/vpif.c
> @@ -41,7 +41,7 @@ MODULE_ALIAS("platform:" VPIF_DRIVER_NAME);
>  #define VPIF_CH2_MAX_MODES     15
>  #define VPIF_CH3_MAX_MODES     2
>
> -spinlock_t vpif_lock;
> +DEFINE_SPINLOCK(vpif_lock);
>  EXPORT_SYMBOL_GPL(vpif_lock);
>
>  void __iomem *vpif_base;
> @@ -437,7 +437,6 @@ static int vpif_probe(struct platform_device *pdev)
>         pm_runtime_enable(&pdev->dev);
>         pm_runtime_get(&pdev->dev);
>
> -       spin_lock_init(&vpif_lock);
>         dev_info(&pdev->dev, "vpif probe success\n");
>
>         /*
> --
> 2.22.0
>
