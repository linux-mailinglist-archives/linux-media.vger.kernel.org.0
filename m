Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2244011E1
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 00:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbhIEVuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 17:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbhIEVug (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 17:50:36 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36134C061575;
        Sun,  5 Sep 2021 14:49:33 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id f15so9752785ybg.3;
        Sun, 05 Sep 2021 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NwQdXnAL/L2wqj03cB02tipih39S6IhR8GqXOW+Ly4E=;
        b=KcQs13uHPX0Bc0O+J1qgG2YRqOa6Mha/i5r9DQBuRVHTaeOErcMJCrW/+jzqDyEqSg
         RUCABjVaUIHkwRTrn67QefTFheSyxT8VWqGw1x4ldoKC3/1fvjZrOcn/ah74pZBFehqo
         mdQeeEJFSZJZRyPgAlQzkONG0MQaE0Lg4ZsQUydqg8JfXFv90NDm6i7pN6ZL6WRKteDI
         +JMPff7Z7bH5Ip9nwMbQdozhPegeKcR1ypcLKXOAi0MRCK2Ioiv6RaOBH+9qy8zaEO58
         b1VxYeLVjJBrNHgf201ULKQd9L8QH+4TnxA0WNbzNhlU3GUEewRKqL05bOfTnhe79N70
         3Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NwQdXnAL/L2wqj03cB02tipih39S6IhR8GqXOW+Ly4E=;
        b=G5IUuKK3gRd5aEKUBZZajtZtofOmw9BNEcVCTdQ4w3CFGrW1qkTH/vYbY7qJJAcvbx
         TPbDO9BR2zgvW8aqrWxuYiVJmO1aXmdhBR4PfFHFzY3IXF9prKpxs2KXWD7gkoQhtN3K
         R3NEOxKt6kp3PvmaTetvS6kjKdNl0fOLozmPR/6VQsbw1baGDPRSB4ZyToU3bP61xfoT
         JUj2e4pLBDyx8259Oh9XmMALRw3mlTXzT51Zk+ZGLGnjVsDs3LVN3x/6Jx7GVcyffmRS
         nR6SYZiUCahFgi7NVwGR3dlLSFEcnzfMrlb7XWpVFHosZ/uzVpwDgd7WsjjjGsVPZNCe
         U+dQ==
X-Gm-Message-State: AOAM531rkR4dqnzCn8DE2rP0jZGEf8QTwv9Q3nsNGzm/kwXaQeUm+R3X
        irMMdEjlWSYzIiNlVlz5uiqyy79AqZTSuLLpfow=
X-Google-Smtp-Source: ABdhPJyIXx8bes+RI4fZGapRDLqwoE0/4nhmXZGIZ8KotmhNJ+8Ppvale+u+coh0eaOpKpuCR5RdYwpH21vcQx0sJgI=
X-Received: by 2002:a05:6902:1101:: with SMTP id o1mr12262132ybu.218.1630878572538;
 Sun, 05 Sep 2021 14:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210901050725.5273-1-caihuoqing@baidu.com>
In-Reply-To: <20210901050725.5273-1-caihuoqing@baidu.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 5 Sep 2021 22:49:06 +0100
Message-ID: <CA+V-a8sw+r_7py40021J5Snep_hChwHiBEOPKZ4Vu=6vXUJ4eQ@mail.gmail.com>
Subject: Re: [PATCH] media: am437x: Make use of the helper function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Wed, Sep 1, 2021 at 6:10 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 48bb0c93729c..2dfae9bc0bba 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -2393,7 +2393,6 @@ static int vpfe_probe(struct platform_device *pdev)
>         struct vpfe_config *vpfe_cfg;
>         struct vpfe_device *vpfe;
>         struct vpfe_ccdc *ccdc;
> -       struct resource *res;
>         int ret;
>
>         vpfe = devm_kzalloc(&pdev->dev, sizeof(*vpfe), GFP_KERNEL);
> @@ -2411,8 +2410,7 @@ static int vpfe_probe(struct platform_device *pdev)
>         vpfe->cfg = vpfe_cfg;
>         ccdc = &vpfe->ccdc;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       ccdc->ccdc_cfg.base_addr = devm_ioremap_resource(&pdev->dev, res);
> +       ccdc->ccdc_cfg.base_addr = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(ccdc->ccdc_cfg.base_addr)) {
>                 ret = PTR_ERR(ccdc->ccdc_cfg.base_addr);
>                 goto probe_out_cleanup;
> --
> 2.25.1
>
