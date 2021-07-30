Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA353DB5F8
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 11:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238259AbhG3Jcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 05:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238219AbhG3Jcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 05:32:50 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7EDC061765
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 02:32:44 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id l126so10650637ioa.12
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+HszHCjicRVinPAkgiPIP+xtCEpWxlQtRPDlzMA4dw=;
        b=hLiDZgqoc2mqGGzVG0XTePpocnHV5/Z4F12ZRFN7cXNXdnjWsaT3BppF5NYmsP61BN
         5d+/gi6MNMKsOHODssMMcZ4pF+lW11ffAaNCAIdPEehKBxQvLdcTl9VsSrQtzOfzVE1M
         p5EaGNxH1nS0dqgTTROg+3uV58szbOKz3szTpdZNW2XObFCScHoZ5nC26Ujb7kl1vHE7
         CCSZk+ytoZkAwuS+Dn5UD3NpA57UX6bIVGuaENP30GfUiBky6k3Mh1xxgHLa1I7zU8Ws
         al9oa5bIxQoBTlVXnMrGT5QG0O6gsLI+VncLRSbJi6vF6q5YqguXzYN1XfhmrZE/90/h
         v68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+HszHCjicRVinPAkgiPIP+xtCEpWxlQtRPDlzMA4dw=;
        b=Lt3Ruu5qUrPb9KGdOY9p3kAa9ojrA9fYaUk6GBB/e1pZ7juoX1Tdf4tQxKk8HhPYhB
         tidMUG6o64veZAP2UpmVcU5DQMA7/Tdww3QSaofnDYE/zh7Swp4lBu44dUSGJeRYAB0E
         uTwjJJh1l5EWR8gTb8A5UwU6tB2ppXSXosZf/8mOBaupXUJdyZ12gfvthrHWpPKJfT5L
         M4bqPNkk5YDJFx0D8NlMPzIEUCksrTPB65TFrXi3sm7pFJUAX0veVf88m8Q/7BpJQDUl
         j3zeireBSZBSKSjy1bfcEB5vwbnbMCURNSKluBP5/Kvp2BrfJq05rlUZdHl7q23trN43
         Bmrg==
X-Gm-Message-State: AOAM532tCJ3/BY0oEibwATqMpxN8IdQjwDk4iXo76oMjrwybe0MRQN0+
        0bqp00niEcO5B5VaHT2blzIjxcx1Bq1Fvbzalg6yEA==
X-Google-Smtp-Source: ABdhPJwn4Oqi0vXmNn+fAS1CTHv+7Tuqimbyvgc4WZbbOxn28bIgGdkzLLvNTRihvLcZdK06Wgtc8JhqRshJ5S/Y98Q=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr1483427jar.74.1627637564075;
 Fri, 30 Jul 2021 02:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210727101051.24418-1-yunfei.dong@mediatek.com> <20210727101051.24418-5-yunfei.dong@mediatek.com>
In-Reply-To: <20210727101051.24418-5-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 30 Jul 2021 17:32:33 +0800
Message-ID: <CA+Px+wXNRw6aNgpfA8qRd1tw0Tx+0jSj-dG-9_wjmxNOsji7_w@mail.gmail.com>
Subject: Re: [PATCH v3, 04/15] media: mtk-vcodec: Use component framework to
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

On Tue, Jul 27, 2021 at 06:10:40PM +0800, Yunfei Dong wrote:
> +static struct component_match *mtk_vcodec_match_add(
> +     struct mtk_vcodec_dev *vdec_dev)
> + {
Remove the extra space before {.

> +     struct platform_device *pdev = vdec_dev->plat_dev;
> +     struct component_match *match = NULL;
> +     int i;
> +
> +     for (i = 0; i < ARRAY_SIZE(mtk_vdec_drv_ids); i++) {
> +             struct device_node *comp_node;
> +             enum mtk_vdec_hw_id comp_idx;
> +             const struct of_device_id *of_id;
Failed to see benifits to declare here in the case.  To be neat, move
the variable declaration to the beginning of function.

> +
> +             comp_node = of_find_compatible_node(NULL, NULL,
> +                     mtk_vdec_drv_ids[i].compatible);
> +             if (!comp_node)
> +                     continue;
If moving of_id assignment to the beginning of for-loop, use of_id->compatible.

> +
> +             if (!of_device_is_available(comp_node)) {
> +                     of_node_put(comp_node);
> +                     dev_err(&pdev->dev, "Fail to get MMSYS node\n");
> +                     continue;
> +             }
> +
> +             of_id = &mtk_vdec_drv_ids[i];
> +             if (!of_id) {
> +                     dev_err(&pdev->dev, "Failed to get match node\n");
> +                     return ERR_PTR(-EINVAL);
> +             }
Move the block to the beginning of for-loop.  Looking to other blocks
around, does it make more sense to use `continue` instead of `return`?

> +
> +             comp_idx = (enum mtk_vdec_hw_id)of_id->data;
> +             mtk_v4l2_debug(4, "Get component:hw_id(%d),vdec_dev(0x%p),comp_node(0x%p)\n",
> +                     comp_idx, vdec_dev, comp_node);
> +             vdec_dev->component_node[comp_idx] = comp_node;
> +
> +             component_match_add_release(&pdev->dev, &match, mtk_vdec_release_of,
> +                     mtk_vdec_compare_of, comp_node);
> +             of_node_put(comp_node);
I thought it shouldn't call of_node_put(...) which is already
delegated to component framework (mtk_vdec_release_of).

> +     }
> +
> +   return match;
Fix the indent.

> +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> +{
> +     struct platform_device *pdev = dev->plat_dev;
> +     int ret;
> +
> +     ret = mtk_vcodec_get_reg_bases(dev);
> +     if (ret)
> +             return ret;
> +
> +     if (!dev->is_comp_supported) {
> +             dev->dec_irq = platform_get_irq(pdev, 0);
> +             if (dev->dec_irq < 0) {
> +                     dev_err(&pdev->dev, "failed to get irq number");
> +                     return dev->dec_irq;
> +             }
> +
> +             irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> +             ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> +                             mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
> +             if (ret) {
> +                     dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
> +                             dev->dec_irq, ret);
> +                     return ret;
> +             }
> +
> +             ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
> +             if (ret < 0) {
> +                     dev_err(&pdev->dev, "failed to get mt vcodec clock source");
> +                     return ret;
> +             }
> +     }
> +
> +     return ret;
To be concise, return 0.

> +     comp_node =
> +             of_find_compatible_node(NULL, NULL, "mediatek,mtk-vcodec-core");
> +     if (!comp_node)
> +             dev->is_comp_supported = false;
> +     else
> +             dev->is_comp_supported = true;
> +     of_node_put(comp_node);
Looking up "mediatek,mtk-vcodec-core" to determine if it uses
component framework sounds like a sub-optimal method.

> @@ -311,7 +429,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>               MTK_VCODEC_DEC_NAME);
>       video_set_drvdata(vfd_dec, dev);
>       dev->vfd_dec = vfd_dec;
> -     platform_set_drvdata(pdev, dev);
>
>       dev->m2m_dev_dec = v4l2_m2m_init(&mtk_vdec_m2m_ops);
>       if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
> @@ -362,8 +479,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>       mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
>               vfd_dec->num);
>
> -     return 0;
> +     if (dev->is_comp_supported) {
> +             ret = mtk_vcodec_init_master(dev);
> +             if (ret < 0)
> +                     goto err_component_match;
> +     } else {
> +             platform_set_drvdata(pdev, dev);
> +     }
Has asked the same question in [1].  Why it removes the
platform_set_drvdata() above?  mtk_vcodec_init_master() also calls
platform_set_drvdata().

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20210707062157.21176-4-yunfei.dong@mediatek.com/

> +     return 0;
> +err_component_match:
> +     video_unregister_device(vfd_dec);
Why video_unregister_device()?  It is already called [2].

[2]: https://elixir.bootlin.com/linux/v5.14-rc3/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c#L344

> @@ -379,9 +505,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  err_dec_alloc:
>       v4l2_device_unregister(&dev->v4l2_dev);
>  err_res:
> -     mtk_vcodec_release_dec_pm(&dev->pm);
Shouldn't remove it.  mtk_vcodec_init_dec_params() also needs to undo
in the path.

Refactoring them to mtk_vcodec_init_dec_params() makes the error
handling more complicated.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 973b0b3649c6..d6bb723db106 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -17,6 +17,11 @@
>  #include <media/videobuf2-core.h>
>  #include "mtk_vcodec_util.h"
>
> +#define VDEC_HW_ACTIVE       0x10
> +#define VDEC_IRQ_CFG 0x11
> +#define VDEC_IRQ_CLR 0x10
> +#define VDEC_IRQ_CFG_REG     0xa4
If moving to mtk_vcodec_dec_hw.h or mtk_vcodec_dec_hw.c makes more sense?
