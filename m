Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86A43BCB4D
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhGFLDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhGFLDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:43 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9B1C061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:01:04 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id q2so9215847iot.11
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HHpMaVaRdcfE11Iv9zB2/7DEGNbwGm556b5Rknsy4U=;
        b=sZaUCdrrS3e1iP5DPMjU61A5DEXd+QmYzjBzm1GL2Me4/JyUDJN0ev3edXVJGIGmkm
         8l7fy5hX3An2cIInjdvXVT9Tn+5aQnD3MzSPn8V2wnLhPFsbWWHF577BOAPtkRnqGHtf
         W2LlWCGJz3xMgpRK8DgdIFHn15khciULuguy/j56gDktDWMlJ45x71MEV7Qo728tSvmb
         AJrZ3DqI254Ds24HVNPXhN9HDro7EUgxHUZNbPHejS1s2amJgmlCsT8dMQ2zVO3TGrYN
         Vj6kB29JnaR2v1rPV6e9t1AVzsVUzHxteeYGlSl2cQR7UcDuyR6XSPdYxdt1FvspOGNE
         lnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HHpMaVaRdcfE11Iv9zB2/7DEGNbwGm556b5Rknsy4U=;
        b=gLsvKNVtEtN6e1b2M5yOe5mVrEzR6f6EjoEfTYp/tqBkj1Ku5d8P7K1ecLMFOr2t1R
         /cYMeT9gKP65Tx6+6KomiXShQRC/xItRv9lARJmJR5jw3anOl2FYwQKDuadgObxHxKY/
         YTZmTF8hB8gsppV+2XUhwsp+l7hay9qaJ1r8W62HoBn/slprwE3QXUtnh27nUJ+fgQpT
         MKYBM6T6/8n78+7zqOY3oLN+A5hdUiR/3fZgIV0gnq3jkEXfi3WTxUBiyeH0RhiCrQlo
         J9pQgOfkTOkeuL64kPvngSaafP6gKuN2aXGCa2btWh/SOJLpn2XKJN0mv7/4JW+EqPtd
         wJlQ==
X-Gm-Message-State: AOAM531d0EqlUlO+SkC5DzVuAR804z4BcvQPCKcmZXC231mJYhS1stTW
        09Wz5N7QHetuPML57d0vNkhVCElX8WowI693Vl0irw==
X-Google-Smtp-Source: ABdhPJyd/zvHxz1L15JJizqajXWHQOOj/R3I+VJVejLEkbQuqbmJ5EorzShywsBzz0vI7SHNU/hc0pqJ92aAQ3OEINM=
X-Received: by 2002:a02:c73b:: with SMTP id h27mr9187900jao.126.1625569263462;
 Tue, 06 Jul 2021 04:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com> <1625038079-25815-8-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-8-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:52 +0800
Message-ID: <CA+Px+wXt0QFi+AsMmFvwhPZe8ef3sfAJFrVkdgaofUMMHeQ3Vg@mail.gmail.com>
Subject: Re: [PATCH v2,7/9] media: mtk-jpegenc: Use component framework to
 manage each hardware information
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
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

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
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
> +       {},
> +};
Should be guarded by CONFIG_OF.

> +static struct component_match *mtk_jpegenc_match_add(struct mtk_jpeg_dev *jpeg)
> +{
> +       struct device *dev = jpeg->dev;
> +       struct component_match *match = NULL;
> +       int i;
> +       char compatible[128] = {0};
It doesn't need to be initialized.

> +
> +       for (i = 0; i < ARRAY_SIZE(mtk_jpegenc_drv_ids); i++) {
> +               struct device_node *comp_node;
> +               enum mtk_jpegenc_hw_id comp_idx;
> +               const struct of_device_id *of_id;
> +
> +               memcpy(compatible, mtk_jpegenc_drv_ids[i].compatible,
> +                      sizeof(mtk_jpegenc_drv_ids[i].compatible));
Shouldn't rely on the source length.  Also needs to use strcpy-family
for better handling the NULL terminator.

> +               if (!of_device_is_available(comp_node)) {
> +                       of_node_put(comp_node);
> +                       v4l2_err(&jpeg->v4l2_dev, "Fail to get jpeg enc HW node\n");
To be consistent, use "Failed".

> +               of_id = of_match_node(mtk_jpegenc_drv_ids, comp_node);
> +               if (!of_id) {
> +                       v4l2_err(&jpeg->v4l2_dev, "Failed to get match node\n");
> +                       return ERR_PTR(-EINVAL);
Shouldn't it call of_node_put() before returning?

> +               comp_idx = (enum mtk_jpegenc_hw_id)of_id->data;
> +               v4l2_info(&jpeg->v4l2_dev, "Get component:hw_id(%d),jpeg_dev(0x%p),comp_node(0x%p)\n",
> +                         comp_idx, jpeg, comp_node);
> +
> +               jpeg->component_node[comp_idx] = comp_node;
> +
> +               component_match_add_release(dev, &match, mtk_vdec_release_of,
> +                                           mtk_vdec_compare_of, comp_node);
Shouldn't it need to break if it already found?

> +       if (!jpeg->variant->is_encoder) {
> +               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +               jpeg->reg_base[MTK_JPEGENC_HW0] =
> +                       devm_ioremap_resource(&pdev->dev, res);
If !is_encoder, why is it still using MTK_JPEGENC_HW0?

> +               if (IS_ERR(jpeg->reg_base[MTK_JPEGENC_HW0])) {
> +                       ret = PTR_ERR(jpeg->reg_base[MTK_JPEGENC_HW0]);
> +                       return ret;
Just return the PTR_ERR if it doesn't need to goto.

> -       pm_runtime_enable(&pdev->dev);
> +       if (jpeg->variant->is_encoder) {
> +               match = mtk_jpegenc_match_add(jpeg);
> +               if (IS_ERR_OR_NULL(match))
> +                       goto err_vfd_jpeg_register;
> +
> +               video_set_drvdata(jpeg->vdev, jpeg);
> +               platform_set_drvdata(pdev, jpeg);
> +               ret = component_master_add_with_match(&pdev->dev,
> +                                                     &mtk_jpegenc_ops, match);
> +               if (ret < 0)
> +                       goto err_vfd_jpeg_register;
Shouldn't it call of_node_put() for un-doing mtk_jpegenc_match_add()?

> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -125,6 +125,8 @@ struct mtk_jpegenc_pm {
>   * @larb:              SMI device
>   * @job_timeout_work:  IRQ timeout structure
>   * @variant:           driver variant to be used
> + * @irqlock:           spinlock protecting for irq
> + * @dev_mutex:         the mutex protecting for device
The patch adds more than 2 fields in the struct.  They also need short
descriptions here.

>   */
>  struct mtk_jpeg_dev {
>         struct mutex            lock;
> @@ -136,12 +138,18 @@ struct mtk_jpeg_dev {
>         void                    *alloc_ctx;
>         struct video_device     *vdev;
>         struct device           *larb;
> -       struct delayed_work job_timeout_work;
>         const struct mtk_jpeg_variant *variant;
>
> +       struct clk              *clk_jpeg;
It is not used.

>  /**
>   * struct mtk_jpeg_fmt - driver's internal color format data
>   * @fourcc:    the fourcc code, 0 if not applicable
> @@ -194,6 +204,7 @@ struct mtk_jpeg_q_data {
>   * @enc_quality:       jpeg encoder quality
>   * @restart_interval:  jpeg encoder restart interval
>   * @ctrl_hdl:          controls handler
> + * @done_queue_lock:   spinlock protecting for buffer done queue
Probably put in the wrong patch?

> +int mtk_jpegenc_init_pm(struct mtk_jpeg_dev *mtkdev)
> +{
> +       struct platform_device *pdev;
> +       struct mtk_jpegenc_pm *pm;
> +       struct mtk_jpegenc_clk *jpegenc_clk;
> +       struct mtk_jpegenc_clk_info *clk_info;
> +       int i, ret;
> +
> +       pdev = mtkdev->plat_dev;
> +       pm->dev = &pdev->dev;
> +       pm = &mtkdev->pm;
> +       pm->mtkdev = mtkdev;
> +       jpegenc_clk = &pm->venc_clk;
Could they be inlined to above where the variables are declared.
