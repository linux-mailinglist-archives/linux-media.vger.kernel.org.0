Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD383A3B12
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 06:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhFKEfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 00:35:05 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:47006 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhFKEfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 00:35:05 -0400
Received: by mail-lf1-f43.google.com with SMTP id m21so6578451lfg.13
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BL7wwDaE4EopB7RkjbdBsNrvrzyStVzJ+eECImab9V8=;
        b=lrK/fMQoR3Vm9tVm5ZFY4Iz3lGCN0Tv+1wOejKEMQrk/HKh7Sfln8F9wUxLYSiEyvp
         dnFp0ZaI9BZpfbGSrXKVcdvLy+BEnHCtxHZBhKWVZGVt9aVou9KH3glQbtWkZCUTqDRL
         NDFBuPc8y04i7r6s3pA3GsvEB0PiA02LJcx6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BL7wwDaE4EopB7RkjbdBsNrvrzyStVzJ+eECImab9V8=;
        b=koyKzdm1MxBsIyePnbCoCOZY2yVWHgy8XobxublyQLbVlW5IwMI3oqoApMQAO0GB9q
         1xPKvbCSNhaOsGnyVzxmK0vmedIDdBpnNTOX/HgpsgM1qkuViDCJB6WCU44vTjM4Kzc7
         VFUVHvKPibcBxZG52qviV8H/p0jh9rDhNBV4J4NAmry1BWrxu+MGwxJbEIKdMX+FS9A2
         sVU7jT/MRsWq0A94eG7WyoQiwBFwUqQfjitSrGlcVp6GWyJOProxj7KTBokc9FRLFyC5
         bKocJ+cpLbGtbvxOMEHMSTFLcnlH83sJoit+XY+dJKo6XRABGFiB6rPaoLKNBKSw8bui
         BHwA==
X-Gm-Message-State: AOAM530fC2maGwiDGnildU1o1F8K5jz7GI6W01gn7OXYoMvZ+aAWlorG
        YMMuef478gRlZ+ARtHq3JWr1BbA+b9kJQ7U1h5BwCQ==
X-Google-Smtp-Source: ABdhPJwJpKhxZ6dLTwfknmcTnSO7Rmt13bbg3wcsXIs7ra12LdsI3N5sB+pUnQO0vVRG6tMNRWtRQds/5kNyoJC73IQ=
X-Received: by 2002:a19:9145:: with SMTP id y5mr1368993lfj.444.1623385911180;
 Thu, 10 Jun 2021 21:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210611040145.2085329-1-eizan@chromium.org> <20210611140124.v2.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
In-Reply-To: <20210611140124.v2.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 11 Jun 2021 12:31:39 +0800
Message-ID: <CAGXv+5Fn=YZK2zuiFHGi7pX6aiih0DNcNQ1QFi6L8FtX174EcQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] media: mtk-mdp: treat rdma@14001000 specially when probing
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     linux-kernel@vger.kernel.org, houlong.wei@mediatek.com,
        enric.balletbo@collabora.com, yong.wu@mediatek.com,
        chunkuang.hu@kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Jun 11, 2021 at 12:05 PM Eizan Miyamoto <eizan@chromium.org> wrote:
>
> ... Instead of depending on the presence of a mediatek,vpu property in
> the device node.
>
> This property was originally added to link to the vpu node so that the
> mtk_mdp_core driver could pass the right device to
> vpu_wdt_reg_handler(). However in a previous patch in this series,
> the driver has been modified to search the device tree for that node
> instead.
>
> This property was also used to indicate the primary MDP device, so that
> it can be passed to the V4L2 subsystem as well as register it to be
> used when setting up queues in the open() callback for the filesystem
> device node that is created. In this case, assuming that the primary
> MDP device is the one with a specific name at a specific address seems
> useable because the alternative is to add a property to the device tree
> which doesn't actually represent any facet of hardware (i.e., this
> being the primary MDP device is a software decision). In other words,
> this solution is equally as arbitrary, but doesn't add a property to
> a device node which is unrelated to the hardware present.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 15 ++++-----------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++++++
>  2 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 59911ee063c1..77ddc18c90e2 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -146,17 +146,11 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  {
>         struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>         struct mtk_mdp_dev *mdp = data;
> -       struct device_node *vpu_node;
>
>         mtk_mdp_register_component(mdp, comp);
>
> -       /*
> -        * If this component has a "mediatek-vpu" property, it is responsible for
> -        * notifying the mdp master driver about it so it can be further initialized
> -        * later.
> -        */
> -       vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -       if (vpu_node) {
> +       if (strcmp(dev->of_node->full_name, "rdma@14001000") == 0) {
> +               /* This is the primary MDP device node. */

This seems quite fragile as it likely doesn't hold true across different SoCs.
You would then end up with a bunch of of_device_is_compatible() and
name checking
combinations.

Would it make more sense to check against DT aliases? Since this
device already has
the mdp-rdma0 alias associated with it, we could mandate some alias
naming scheme
going forward?


ChenYu

>                 int ret;
>
>                 ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> @@ -172,9 +166,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>                 }
>
>                 /*
> -                * presence of the "mediatek,vpu" property in a device node
> -                * indicates that it is the primary MDP rdma device and MDP DMA
> -                * ops should be handled by its DMA callbacks.
> +                * MDP DMA ops will be handled by the DMA callbacks associated with this
> +                * device;
>                  */
>                 mdp->rdma_dev = dev;
>         }
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 523e3c2798e1..be7d35b3e3ff 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -157,6 +157,12 @@ static int mtk_mdp_master_bind(struct device *dev)
>                 goto err_component_bind_all;
>         }
>
> +       if (mdp->rdma_dev == NULL) {
> +               dev_err(dev, "Primary MDP device not found");
> +               status = -ENODEV;
> +               goto err_component_bind_all;
> +       }
> +
>         vpu_node = of_find_node_by_name(NULL, "vpu");
>         if (!vpu_node) {
>                 dev_err(dev, "unable to finddrivers/soc/mediatek/mtk-mmsys.c vpu node");
> --
> 2.32.0.272.g935e593368-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
