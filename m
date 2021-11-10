Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F6A44BEAE
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhKJKd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhKJKdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:33:25 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A71C061767
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:38 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id z6so2265845pfe.7
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r5DQX2VbHiiinpBFvGUn9gkRcEjjrEuvSqSjaWfXcDI=;
        b=cy/1KPVoDrOt4yjIxt1Buip+V8mWgNg6UYmtGHHJ08/DKQEPhwaYkgH2lsyQyAln8/
         R8GzPx7X8b2yG5twg9UIjYkDsDTwEQEEADIN1kg/Ah5oK+dFzF3R9/S2UAdl7RbbyFDU
         6MERQjvvntRYiXZoMQDWLQPPCf4BU+6LB2Cp61t9N7538FW3qkal5Dm+9kF681JbqjU+
         JWhcuXUT8RXNemHk5gN/Op5Lm0JoIL2A418gG3D3qUH250dSGLbCF/rVRFZ1XUmKVmrt
         LLoi8vFEeipVLd3+GIwBPfDiMw9XNbfJ/vkKCvkgqpmCnYjC7hbqgA6gqXJ7Qr2og0DJ
         PEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r5DQX2VbHiiinpBFvGUn9gkRcEjjrEuvSqSjaWfXcDI=;
        b=xBT9qGBJgMw0baxJT8DDBEUQ4Xc1tLSrDbEU/iNlwt6Gdf2/0CxJSjbHVfIFDsylG8
         HETN5BD+KubUytVF+BKZsZdaqD+8VthNA7kFU9XAu/wF+FQrMfoTh8z/s7qJvX/nEfeH
         sbWmCz6I5OSEJmCnaFm6b4Q1tpI2reMRzF9pUW2VdEe0w/BWNO30TX8N9wSC4A3DB8jT
         rtUvWJQr9bXehVExXs/pWf1a6Im1CQlN2DgmK+Yvq1EYR28mp/itgsKOCytkpPS4lkrh
         B++IteseSY12mTywh/pFTSWy4+beMUPR+qYLFMJswR6xnXbP7NIqWgmzcyGJUutmxavu
         Di4g==
X-Gm-Message-State: AOAM531OARL/mm6tukFJDHuXv646lRxp0xMywICB2TsHA5mUSytkZia9
        taZFIIHmtTOZy2HyRwDaPou4U7h/yuwl3k8CN/EEjw==
X-Google-Smtp-Source: ABdhPJykmPLJ6N71IANWCRh+gpwVTmAkjoBw+f7+zlBkb5XKdRfh/Qb9D78+HxTdnDoFhcUKj8MzfOQAbs+Oli9R2pw=
X-Received: by 2002:a05:6a00:2387:b0:49f:af00:d5d0 with SMTP id
 f7-20020a056a00238700b0049faf00d5d0mr14945380pfc.1.1636540237554; Wed, 10 Nov
 2021 02:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com> <20211109125030.26299-7-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-7-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 10 Nov 2021 18:30:26 +0800
Message-ID: <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
Subject: Re: [PATCH v9, 06/19] media: mtk-vcodec: Manage multi hardware information
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
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 09, 2021 at 08:50:17PM +0800, Yunfei Dong wrote:
> Manage each hardware information which includes irq/power/clk.
> The hardware includes LAT0, LAT1 and CORE.

The commit message doesn't explain the code.  Could you provide some
explanations about how the async mechanism works?  (e.g. A bitmap for
all sub-devices' readiness ...)

> Reported-by: kernel test robot <lkp@intel.com>

Apparently wrong tag.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index b7a51e96d4ba..eb2af42aa102 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -18,19 +18,49 @@
>
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_dec_hw.h"
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vcodec_intr.h"
> -#include "mtk_vcodec_util.h"

Why does mtk_vcodec_util.h need to remove?

> +static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_ctx *ctx)
> + {

Remove the extra space.

> +     struct mtk_vcodec_dev *vdec_dev = ctx->dev;
> +     struct platform_device *pdev = vdec_dev->plat_dev;
> +     struct device_node *subdev_node;
> +     enum mtk_vdec_hw_id hw_idx;
> +     const struct of_device_id *of_id;
> +     int i;
> +
> +     for (i = 0; i < ARRAY_SIZE(mtk_vdec_hw_match); i++) {
> +             of_id = &mtk_vdec_hw_match[i];
> +             subdev_node = of_find_compatible_node(NULL, NULL,
> +                     of_id->compatible);
> +             if (!subdev_node)
> +                     continue;
> +
> +             if (!of_device_is_available(subdev_node)) {
> +                     of_node_put(subdev_node);
> +                     dev_err(&pdev->dev, "Fail to get MMSYS node\n");

I am not sure if the error message makes sense about mentioning MMSYS here.

> +                     continue;
> +             }
> +
> +             hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;

Does it really need to cast twice?

> +             vdec_dev->subdev_node[hw_idx] = subdev_node;
> +
> +             if (!test_bit(hw_idx, vdec_dev->hardware_bitmap)) {
> +                     dev_err(&pdev->dev, "Vdec hw_idx is not ready %d.",
> +                             hw_idx);

I would prefer "Vdec %d is not ready\n".

> +                     return -EINVAL;

-EAGAIN makes more sense.

> +             }
> +     }
> +
> +     return 0;
> +}

Would it need to call of_node_put() in the error handling path?

> +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> +{

I would rather not call them "params".  They are more like "resources".

> +     struct platform_device *pdev = dev->plat_dev;
> +     int ret;
> +
> +     ret = mtk_vcodec_get_reg_bases(dev);
> +     if (ret)
> +             return ret;
> +
> +     if (!dev->vdec_pdata->is_subdev_supported) {
> +             dev->dec_irq = platform_get_irq(pdev, 0);
> +             if (dev->dec_irq < 0) {
> +                     dev_err(&pdev->dev, "failed to get irq number");
> +                     return dev->dec_irq;
> +             }
> +
> +             irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> +             ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> +                     mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
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

I would prefer:

if (dev->vdec_pdata->is_subdev_supported)
    return 0;

And decrease the indent level by 1 for the following blocks.

> @@ -329,6 +377,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>               goto err_event_workq;
>       }
>
> +     ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> +             &pdev->dev);
> +     if (ret) {
> +             mtk_v4l2_err("Master device of_platform_populate failed.");

s/Master/Main/

Doesn't it need to reference `is_subdev_supported` before populating?

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> new file mode 100644
> index 000000000000..745be12548ef
[...]
> +const struct of_device_id mtk_vdec_hw_match[] = {
> +     {
> +             .compatible = "mediatek,mtk-vcodec-lat",
> +             .data = (void *)MTK_VDEC_LAT0,
> +     },
> +     {
> +             .compatible = "mediatek,mtk-vcodec-core",
> +             .data = (void *)MTK_VDEC_CORE,
> +     },
> +     {},
> +};
> +EXPORT_SYMBOL_GPL(mtk_vdec_hw_match);

Introducing new compatible strings.  Need a dt-bindings patch for them.

> +static int mtk_vdec_hw_probe(struct platform_device *pdev)
> +{
[...]
> +     subdev_dev->reg_base[VDEC_HW_MISC] =
> +             devm_platform_ioremap_resource_byname(pdev, "misc");
> +     if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
> +             ret = PTR_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC]);
> +             goto err;
> +     }

Resource "misc" needs a dt-bindings patch to explain how to use/specify it.

> +     hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;

Does it really need to cast twice?

> +     if (hw_idx < MTK_VDEC_HW_MAX) {
> +             main_dev->subdev_dev[hw_idx] = subdev_dev;
> +             subdev_dev->hw_idx = hw_idx;
> +             subdev_dev->main_dev = main_dev;
> +             subdev_dev->reg_base[VDEC_HW_SYS] =
> +                     main_dev->reg_base[VDEC_HW_SYS];
> +             set_bit(subdev_dev->hw_idx, main_dev->hardware_bitmap);
> +     }

mtk_vcodec_subdev_device_check() doesn't check the value of
of_id->data.  Does it make more sense to align the implementation?  If
hw_idx is equal to or bigger than MTK_VDEC_HW_MAX, shall it print
warning messages for example.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
[...]
> +#define VDEC_HW_ACTIVE 0x10
> +#define VDEC_IRQ_CFG 0x11
> +#define VDEC_IRQ_CLR 0x10
> +#define VDEC_IRQ_CFG_REG 0xa4

If only mtk_vcodec_dec_hw.c uses them, could they move to the file?

> @@ -423,6 +436,11 @@ struct mtk_vcodec_enc_pdata {
>   * @pm: power management control
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
> + *
> + * @subdev_dev: subdev hardware device
> + * @subdev_node: subdev node
> + *
> + * @hardware_bitmap: used to record hardware is ready or not
>   */
>  struct mtk_vcodec_dev {
>       struct v4l2_device v4l2_dev;
> @@ -460,6 +478,11 @@ struct mtk_vcodec_dev {
>       struct mtk_vcodec_pm pm;
>       unsigned int dec_capability;
>       unsigned int enc_capability;
> +
> +     void *subdev_dev[MTK_VDEC_HW_MAX];
> +     struct device_node *subdev_node[MTK_VDEC_HW_MAX];
> +
> +     DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);

I would prefer to use name `subdev_bitmap`.
