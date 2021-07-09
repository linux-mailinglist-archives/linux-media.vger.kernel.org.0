Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08743C21CF
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhGIJwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhGIJwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:52:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4856C0613DD;
        Fri,  9 Jul 2021 02:49:53 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id nd37so15144626ejc.3;
        Fri, 09 Jul 2021 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0aJWJwlheU/lxeAZzdOHAS4FN13/EFK+YqXAzvN5kvA=;
        b=d695sFGxQwFyekLevettu75ZqH6H5Lwg4BPfxmn7KqfSAeO742acSx2XsIp2ooAH07
         Ib/H1TkwCzk4EnU0br94r0XTKBQMR6f/ZZGRDeok8NGXm/Q/jXbc7MEP9P/ywvr55ETe
         Bl75SKxi0lFTIlJgphm8/ZLloSPWEePoYnlGuyLZL40+Q1u9jjEkoYY3zs2jC5+/lf0V
         bUwc88keTa7+G279yWQHMBlW4OC0GkF7g8xB3JRANMvd/JnD0JjUFjikzUzVjyJzYYvP
         pLu4gbqBMlDSBkMZH4u4xI0wFkV0WBQ+OCWcqTvvqshnSwQh1FgDS+qr8u2HmQ0tyF+O
         eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0aJWJwlheU/lxeAZzdOHAS4FN13/EFK+YqXAzvN5kvA=;
        b=ffH3sXZD4FOqMe/b/ogrF3z0bJXp5Q7cfx+5t2sqLynG4UdObhMIZizbOuTqQtqbMx
         2rqvaTrFqhqf625o5s5Wd+uZWrrHvOXfpUgmXQxWQZegERteMHCWnBmyNSOb3mlXNR1c
         3rvNOtQeXEZlHdt3k+wGryXxYyWWPlJ9ld7bxEhafsa6i0y6EicnQGJcqW5KF5eQfwjC
         BkFlWTb5c/cEgu3Zkt7pnk49FTfBySyJPdosrKk2FI9y313N9ZCCIYxINHNlz2fsUB3O
         wKtQFzTR+K7hKltwaTIv9vYOkhdm7tqMEKDhImN99C4IM9rNCHXftfhSpK5yAjvomHC1
         hA1A==
X-Gm-Message-State: AOAM531EPkuzW+eX0Z/KVf+QxNzEOhmOFNf9Q+Xty9yAlAMTnDyVQdGj
        MDpEMR/Gq9e7SbRXtspeOHcZjFF3xEfMmstfbjY=
X-Google-Smtp-Source: ABdhPJyxMIZfMRItVQXXR8ywaQSFGfyISBm/1wxd9gGEGyjz1aO+QsdZ7kuRIFPTSt395NzQYK2DF5WSH6xQ53GQkZ0=
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr37123721ejz.73.1625824192379;
 Fri, 09 Jul 2021 02:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <YOfu5Zb2kpN/0Prn@mwanda>
In-Reply-To: <YOfu5Zb2kpN/0Prn@mwanda>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Fri, 9 Jul 2021 17:49:26 +0800
Message-ID: <CAD-N9QV-x3pzwN4HvpR9w04NnVHs1aafASQvD+gpTWg01K_YUw@mail.gmail.com>
Subject: Re: [PATCH] media: rockchip/rga: fix a use after free in rga_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 9, 2021 at 2:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The video_device_release() frees the "vfd" pointer so passing it to
> video_unregister_device() on the next line results in a use after free.
> Calling video_unregister_device() on a device that hasn't been
> registered is supposed to be a no-op so that can be removed.  The paths
> with to goto unreg_video_dev have a memory leak and should be updated to
> goto rel_vdev instead.
>
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index bf3fd71ec3af..37f7fd060c38 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -863,12 +863,12 @@ static int rga_probe(struct platform_device *pdev)
>         if (IS_ERR(rga->m2m_dev)) {
>                 v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
>                 ret = PTR_ERR(rga->m2m_dev);
> -               goto unreg_video_dev;
> +               goto rel_vdev;
>         }
>
>         ret = pm_runtime_resume_and_get(rga->dev);
>         if (ret < 0)
> -               goto unreg_video_dev;
> +               goto rel_vdev;
>
>         rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
>         rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
> @@ -904,8 +904,6 @@ static int rga_probe(struct platform_device *pdev)
>
>  rel_vdev:
>         video_device_release(vfd);
> -unreg_video_dev:
> -       video_unregister_device(rga->vfd);
>  unreg_v4l2_dev:
>         v4l2_device_unregister(&rga->v4l2_dev);
>  err_put_clk:

From the analysis of rga_probe and rga_remove function, the init and
cleanup functions are in pairs as follows:

        pm_runtime_enable(rga->dev);

        ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);

        vfd = video_device_alloc();

        rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);

        rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
                                           &rga->cmdbuf_phy, GFP_KERNEL,
                                           DMA_ATTR_WRITE_COMBINE);

        rga->src_mmu_pages =
                (unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
        rga->dst_mmu_pages =
                (unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);

        ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
        ......
        video_unregister_device(rga->vfd);

        free_pages((unsigned long)rga->src_mmu_pages, 3);
        free_pages((unsigned long)rga->dst_mmu_pages, 3);

        dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
                       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);

        v4l2_m2m_release(rga->m2m_dev);

        video_device_release(rga->vfd);

        v4l2_device_unregister(&rga->v4l2_dev);

        pm_runtime_disable(rga->dev);

So I think the error handling code is more complex than this patch. ;(

> --
> 2.30.2
>
