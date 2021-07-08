Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625333BF7ED
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 12:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhGHKHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 06:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhGHKHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 06:07:40 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B295DC06175F
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 03:04:58 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b18so6061201ilf.8
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IYDrTEMCDwnKyJ3pPqsfquwkNIQ3KZz5NeM09+NirQ=;
        b=WT0IEe21WXTnQTiqpmOB+Z7yiM37k35gUjaW8q23hwFIywW2R2O7AFYBYWpcVr/+Es
         YmKVFiMUfMAiwklQ2WYfEOX+1AzVmj9HIlAtY5tP3B/D370620P9O8uqI4w7idZcoJzb
         mFD6oAx2w9DekQ0F48e2kH5ZJzTFTxb41fXfnwqRcmracyx6S+h4KwMD8p/N1Qb7aOlr
         QM0+8o+Ciq5rgy6rSpW62cXas0FgzJvkZrwnmnyZkccPk8Z7zXjQl4SSv+4PEgROGeqW
         UULK4pSaFMwqw6SHGqyAPdwIusNrevhgnIybsjDnZmKlBwOvpBQMvDoGL7ssMgG/5joI
         iBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IYDrTEMCDwnKyJ3pPqsfquwkNIQ3KZz5NeM09+NirQ=;
        b=lvfkmFWle84UiR5hlaV9lHQCUB3w1Zx1nO4E7dDzMEFB43hwSxGZy5RUYmN6RfRtWq
         OK7l6BlHtKB2EEFNHZakd6b4jIUk402NnBEvzXnByMnjPvtYaW37yRKkhx/e/bwOW1Gz
         WFU/N3tpw/2dpYN6ky0t57vnV4Ka8K6mYIapvAaWuIdC18VQn6YlmbZ4kfzWcHRWMPL8
         NUp/h3s5WPr54IiwONRcwoxmzdCJurMHe4hWosrfb1fERiE3dZmWqJSMBw8YBOTYq5Sc
         dKJJuJwaX5qDQCdqNu7EXt9We1UelDgWNonyqa6qMxUXN7EECEd1TrbQAp5wvyn+01Fg
         3NZQ==
X-Gm-Message-State: AOAM530n4tb8YArQegkOv3E0uO7vqQAEdWix6zMOU8wyB9fJzOx210qb
        y7+FB34Iie1wBSJ/5LqwhSBgs/G/wnYSbvUzd2sJGg==
X-Google-Smtp-Source: ABdhPJykFqOjvbJ+tFHq+BR1iCn1BjA6c7p322S2tesr3rVOsU1F53n/ypS9lwQRgEvCQ2UtyFJ6k21/OShkUAaPpd8=
X-Received: by 2002:a92:de12:: with SMTP id x18mr21843666ilm.302.1625738697789;
 Thu, 08 Jul 2021 03:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com> <20210707062157.21176-4-yunfei.dong@mediatek.com>
In-Reply-To: <20210707062157.21176-4-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 8 Jul 2021 18:04:46 +0800
Message-ID: <CA+Px+wX+mT5fzJegoPc=4RRowVQ9PSievqMn+-20vTvmy6Dq2A@mail.gmail.com>
Subject: Re: [PATCH v1, 03/14] media: mtk-vcodec: Use component framework to
 manage each hardware information
To:     Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> +#include "mtk_vcodec_util.h"
> +
>  #include <media/videobuf2-core.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-mem2mem.h>
The changes look like independent ones.  If any .c files need the
headers, include them in the .c files instead of here.

> +               comp_node = of_find_compatible_node(NULL, NULL,
> +                       mtk_vdec_drv_ids[i].compatible);
> +               if (!comp_node)
> +                       continue;
> +
> +               if (!of_device_is_available(comp_node)) {
> +                       of_node_put(comp_node);
> +                       dev_err(&pdev->dev, "Fail to get MMSYS node\n");
> +                       continue;
> +               }
> +
> +               of_id = of_match_node(mtk_vdec_drv_ids, comp_node);
> +               if (!of_id) {
Doesn't it need to call of_node_put(comp_node)?

> +static int mtk_vcodec_init_master(struct mtk_vcodec_dev *dev)
> +{
> +       struct platform_device *pdev = dev->plat_dev;
> +       struct component_match *match;
> +       int ret = 0;
ret doesn't need to be initialized.

> +       match = mtk_vcodec_match_add(dev);
> +       if (IS_ERR_OR_NULL(match))
> +               return -EINVAL;
> +
> +       platform_set_drvdata(pdev, dev);
Why does platform_set_drvdata() need to be here?  The function neither
creates pdev nor dev.

> +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> +{
> +       struct platform_device *pdev = dev->plat_dev;
> +       struct resource *res;
> +       int ret = 0;
ret doesn't need to be initialized.

> +       if (!dev->is_support_comp) {
> +               res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +               if (res == NULL) {
!res, res is not used BTW.

> +               dev->dec_irq = platform_get_irq(dev->plat_dev, 0);
Check return value.

> +               irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> +               ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> +                               mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
> +                               dev->dec_irq,
> +                               ret);
Can join to previous line.

> +       if (!of_find_compatible_node(NULL, NULL, "mediatek,mtk-vcodec-core"))
> +               dev->is_support_comp = false;
> +       else
> +               dev->is_support_comp = true;
Need a DT binding document patch for the attribute.

Does it really need to call of_find_compatible_node() for parsing an
attribute?  If so, it needs to call of_node_put() afterward.

> @@ -319,7 +434,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 MTK_VCODEC_DEC_NAME);
>         video_set_drvdata(vfd_dec, dev);
>         dev->vfd_dec = vfd_dec;
> -       platform_set_drvdata(pdev, dev);
Why does it need to remove platform_set_drvdata()?

> @@ -370,8 +484,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
>                 vfd_dec->num);
>
> -       return 0;
> +       if (dev->is_support_comp) {
> +               ret = mtk_vcodec_init_master(dev);
> +               if (ret < 0)
> +                       goto err_component_match;
> +       } else {
> +               platform_set_drvdata(pdev, dev);
> +       }
mtk_vcodec_init_master() also calls platform_set_drvdata().  What is
the difference?

> +       /* clear interrupt */
> +       writel((readl(vdec_misc_addr) | VDEC_IRQ_CFG), vdec_misc_addr);
> +       writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR), vdec_misc_addr);
Can remove 1 parenthese pair.

> +static int mtk_vdec_comp_probe(struct platform_device *pdev)
> +{
> +       struct mtk_vdec_comp_dev *dev;
> +       int ret;
> +
> +       dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return -ENOMEM;
> +
> +       dev->plat_dev = pdev;
> +       spin_lock_init(&dev->irqlock);
> +
> +       ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
To be concise, use pdev.

> +       dev->reg_base[VDEC_COMP_MISC] =
> +               devm_platform_ioremap_resource(pdev, 0);
Confusing about the index 0, where:
VDEC_COMP_SYS = 0
VDEC_COMP_MISC = 1

> +#ifndef _MTK_VCODEC_DEC_HW_H_
> +#define _MTK_VCODEC_DEC_HW_H_
> +
> +#include <linux/component.h>
Does it really need to include component.h?

> +/**
> + * enum mtk_comp_hw_reg_idx - component register base index
> + */
> +enum mtk_comp_hw_reg_idx {
> +       VDEC_COMP_SYS,
> +       VDEC_COMP_MISC,
> +       NUM_MAX_COMP_VCODEC_REG_BASE
The name is suboptimal.  How about VDEC_COMP_MAX or VDEC_COMP_LAST?

> +#include <linux/component.h>
> +#include <linux/io.h>
>  #include <linux/platform_device.h>
>  #include <linux/videodev2.h>
>  #include <media/v4l2-ctrls.h>
The newly added code in the file doesn't look like it needs anything
from component.h and io.h.

> @@ -404,6 +422,7 @@ struct mtk_vcodec_enc_pdata {
>   *
>   * @fw_handler: used to communicate with the firmware.
>   * @id_counter: used to identify current opened instance
> + * @is_support_comp: 1: using compoent framework, 0: not support
is_support_comp is a boolean.  Use true and false instead of 1 and 0.

> @@ -422,6 +441,10 @@ struct mtk_vcodec_enc_pdata {
>   * @pm: power management control
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
> + *
> + * comp_dev: component hardware device
> + * component_node: component node
> + * comp_idx: component index
To be neat, missing "@" before each symbol name.
