Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB19F3B402D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 11:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhFYJVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 05:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhFYJVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 05:21:03 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA57C061767
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:18:42 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id i189so11767582ioa.8
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LBMCAr9OKqALolsPvG/hgiqJf+IHkCzRrkHtVCzFpxE=;
        b=ob50Ex0HjQCoOkMNVmluHAgAaQH9NhdOoxgXaIDEsZdgEj7hY/1X11UkiuHjGffdxk
         UP13uAbtMSWwmFK1P0n0L4uXFzeez19ofKRm0p6d5YI7/wV/Whk8PZPQFO8d5eZYu14C
         9SAox7Kb/sy+kEsApd65BjGP5Ib6vlXhRsgLNTCM+ifOxdmWgSWujpy9laQRpODdbQSD
         SXOiAl3qc674P5MV4pgtxMnkl3p1q0B/uQukjrX0EEJHWS9O6TWx1LYPR/g/aIh4UId9
         HA9LGwivz2oJZoXaRmNJF8oLWjdfhmVkM0c7n9IlSSMppDE2IJvr6KNq2ZiZ+Bf3O1AM
         P3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LBMCAr9OKqALolsPvG/hgiqJf+IHkCzRrkHtVCzFpxE=;
        b=PMU4NJx7HbGQaZJYSE907Ssozju7zBUIYqEBVAaZXWr24tJ47lGPiHSkjyZy/JC6sd
         +L/4SjsqY/O1MzKGWw+F3ctphxvLf4GulvtXoFZBiiITcRMarlvKUIKhK+sAL0/fNKlk
         z6LVyszfQs9oistklCrupI/czJMfqannWcpuZ1DwAu7ND+f3cWGAPGMI3wgpz/gadeKz
         OSglh0k2+NRygUxXNCkvi+earuakYrq4eh92F5PqaZT26fW0RkPA76FKgID72Nafw7wI
         Dw5oKCY93A1f1EuxHr8DuYa72MgES8Xvx3dIBpRk31XSloAKvbmMnLJPlssKkB2KZci9
         j/8w==
X-Gm-Message-State: AOAM531CDI3Zjll8GQ+K10tjGzXtt+SrJh99+gH+VddeFz3Jjx7b07aI
        uYkm+HGsPuiwsM8TMcpVM6Ewu6/pIGYotw49+ZpvUw==
X-Google-Smtp-Source: ABdhPJzXQKU1EzX4BFVg8dVoXcM3fiNW3KrSUfOxXlDn19TSDuB4Lacx66wn42utjbq8sAVkmPvRuUGazUTUoMbdXsg=
X-Received: by 2002:a6b:6209:: with SMTP id f9mr7971317iog.109.1624612721478;
 Fri, 25 Jun 2021 02:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com> <1624428350-1424-3-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1624428350-1424-3-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 25 Jun 2021 17:18:30 +0800
Message-ID: <CA+Px+wW89v3micrkgNDvxGAad4P+JfRHKnLdPN__qVrV3i-j+w@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: mtk-jpegenc: use component framework to manage
 jpg HW
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Mtk jpeg encoder has several hardware, one HW may register a device
> node; use component framework to manage jpg HW device node,
> in this case, one device node could represent all jpg HW.
Can roughly understand.  But could you rephrase your sentences?

>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
>  #include <soc/mediatek/smi.h>
> +#include <linux/component.h>
Maintain the alphabetical order.

> +void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
> +{
> +       struct mtk_jpeg_ctx *ctx = NULL;
> +       struct vb2_v4l2_buffer *dst_buffer = NULL;
> +       struct list_head *temp_entry = NULL;
> +       struct list_head *pos = NULL;
> +       struct mtk_jpeg_src_buf *dst_done_buf = NULL, *tmp_dst_done_buf = NULL;
Remove the initialization if they don't need to.

> +       unsigned long flags;
> +
> +       ctx = jpeg->hw_param.curr_ctx;
> +       if (!ctx) {
> +               pr_err("%s : %d, comp_jpeg ctx fail !!!\n", __func__, __LINE__);
Use dev_err().

> +               return;
> +       }
> +
> +       dst_buffer = jpeg->hw_param.dst_buffer;
> +       if (!dst_buffer) {
> +               pr_err("%s : %d, comp_jpeg dst_buffer fail !!!\n",
> +                      __func__, __LINE__);
Use dev_err().

> +       if (!(irq_status & JPEG_ENC_INT_STATUS_DONE)) {
> +               pr_err("%s : %d, jpeg encode failed\n", __func__, __LINE__);
Use dev_err().

> +void mtk_jpegenc_timeout_work(struct work_struct *work)
> +{
> +       struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
> +               job_timeout_work.work);
> +       struct mtk_jpeg_ctx *ctx = NULL;
It doesn't need to initialize.

> +static  const struct of_device_id mtk_jpegenc_drv_ids[] = {
Remove the extra space between "static" and "const".

> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +               .data = (void *)MTK_JPEGENC_HW0,
> +       },
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc1",
> +               .data = (void *)MTK_JPEGENC_HW1,
> +       },
Using compatible strings to separate them doesn't sound like a scalable method.

>  #include <linux/kernel.h>
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/component.h>
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
Maintain the alphabetical order.

>  #include "mtk_jpeg_enc_hw.h"
> +#include "mtk_jpeg_core.h"
Maintain the alphabetical order.

> +int mtk_jpegenc_init_pm(struct mtk_jpeg_dev *mtkdev)
> +{
> +       struct platform_device *pdev;
> +       struct mtk_jpegenc_pm *pm;
> +       struct mtk_jpegenc_clk *jpegenc_clk;
> +       struct mtk_jpegenc_clk_info *clk_info;
> +       int i = 0, ret = 0;
They don't need to initialize.

> +       pdev = mtkdev->plat_dev;
> +       pm = &mtkdev->pm;
To be concise, can inline to above when declaring the variables.

> +       jpegenc_clk->clk_num =
> +               of_property_count_strings(pdev->dev.of_node, "clock-names");
> +       if (jpegenc_clk->clk_num > 0) {
> +               jpegenc_clk->clk_info = devm_kcalloc(&pdev->dev,
> +                                                    jpegenc_clk->clk_num,
> +                                                    sizeof(*clk_info),
> +                                                    GFP_KERNEL);
> +               if (!jpegenc_clk->clk_info)
> +                       return -ENOMEM;
> +       } else {
> +               pr_err("Failed to get jpegenc clock count\n");
Use dev_err().
> +               return -EINVAL;
> +       }
Would prefer the block turn to be:

if (... <= 0) {
    ...
    return -EINVAL;
}

... = devm_kcalloc(...);
if (!...)
    return -ENOMEM;

> +       for (i = 0; i < jpegenc_clk->clk_num; i++) {
> +               clk_info = &jpegenc_clk->clk_info[i];
> +               ret = of_property_read_string_index(pdev->dev.of_node,
> +                                                   "clock-names", i,
> +                                                   &clk_info->clk_name);
> +               if (ret) {
> +                       pr_err("Failed to get jpegenc clock name id = %d", i);
Use dev_err().

> +                       return ret;
> +               }
> +
> +               clk_info->jpegenc_clk = devm_clk_get(&pdev->dev,
> +                                                    clk_info->clk_name);
> +               if (IS_ERR(clk_info->jpegenc_clk)) {
> +                       pr_err("devm_clk_get (%d)%s fail",
> +                              i, clk_info->clk_name);
Use dev_err().

> +       pm_runtime_enable(&pdev->dev);
> +       return ret;
return 0;

> +void mtk_jpegenc_release_pm(struct mtk_jpeg_dev *dev)
> +{
> +       pm_runtime_disable(dev->pm.dev);
> +}
Would prefer this function to be more "symmetric" to mtk_jpegenc_init_pm().

For example:

void mtk_jpegenc_release_pm(struct mtk_jpeg_dev *mtkdev)
{
    struct platform_device *pdev = mtkdev->plat_dev;
    pm_runtime_disable(&pdev->dev);
}

That way, it doesn't rely on whether mtkdev->pm is set or not.

> +       ret = devm_request_irq(&pdev->dev, dev->jpegenc_irq,
> +                              irq_handler, 0, pdev->name, dev);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to install dev->jpegenc_irq %d (%d)",
> +                       dev->jpegenc_irq, ret);
> +
> +               return -ENOENT;
How about just returning ret?

> +       }
> +
> +       //disable_irq(dev->jpegenc_irq);
Remove it.

> +       ret = component_add(&pdev->dev, &mtk_jpegenc_hw_component_ops);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to component_add: %d\n", ret);
> +               goto err;
> +       }
How about just returning component_add(...)?

> +err:
> +       mtk_jpegenc_release_pm(dev);
Would expect the platform driver to have a .remove() callback and
invoke the mtk_jpegenc_release_pm() too.

> +static const struct of_device_id mtk_jpegenc_hw_ids[] = {
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +               .data = mtk_jpegenc_hw_irq_handler,
> +       },
> +       {       .compatible = "mediatek,mt8195-jpgenc1",
> +               .data = mtk_jpegenc_hw_irq_handler,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
Had the same concern in dt-bindings patch.  Does it really need
multiple compatible strings to separate?

Also, the block should guard by using CONFIG_OF.

> +struct platform_driver mtk_jpegenc_hw_driver = {
> +       .probe  = mtk_jpegenc_hw_probe,
> +       .driver = {
> +               .name   = "mtk-jpegenc-hw",
> +               .of_match_table = mtk_jpegenc_hw_ids,
Should guard by using of_match_ptr().


Hi, after reading the patch for a while, I realized it is way too big
to me so that I didn't go through too much detail (especially the
component framework part).  Could you further divide the series into
smaller pieces?  For example:
- part i. refactor to make modifying code easier
- part ii. leverage component framework
- part iii. add new code for MT8195
I would expect part i and ii don't change the original behavior.
