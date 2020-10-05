Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FD0282F13
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 05:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgJEDcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 23:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgJEDcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 23:32:45 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C58DC0613CE
        for <linux-media@vger.kernel.org>; Sun,  4 Oct 2020 20:32:45 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x14so7448364oic.9
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2020 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sf78nyT0NmBrjFhF/2XhwPPL+2uXLT33f/t1fNeaDec=;
        b=gf6+m4YWcBDxmSk0HBWtr60eVrFKnlCIg1M+DUXpz8nlr/ohLVLU/207vqgDr+49g0
         iS1TpFNq2LRcBUUHcHVmIv4gb0HxIG605sOJ9gyZ39vPIDLFdftlWCFnDj2iRVNrtbur
         JpgPQEKniFedzMmyz3pNnLPa5hYrOoJ+mqvYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sf78nyT0NmBrjFhF/2XhwPPL+2uXLT33f/t1fNeaDec=;
        b=f0B6sdz9TDd+MIEranRBjZ1enbXu570PImQAISvwBY+SE65AObIpikcm3HA/i5oTZe
         jXlxKu3QqdkWN1rNw5n0zhv/1Q0NNJ9hSD9DdztAoGzOMFFn7DyL/wrELW5Vpt3RvKRD
         ufnuD24n8NTL3ZTeEsBobm1vm49Awzk59Y/YiokRQQQoNpYWRiMUuoqT4jp8J/v2bNAZ
         XXRs1byLh3CxVxsnZiKLDZPTYveF6i/X2Z6nDmAncQfN8kzE4J8ldK+Y/hZgy9McHPyR
         V6pRqjnNsGVm2asabYnKAJogSBGhms04ozXyS6PcLGa3beZfZozsuQVkabS6SvE1mezw
         K5MA==
X-Gm-Message-State: AOAM531QgLIeSpo+wt6oqUgfLoClZcABOlowdonEBpPhxu2VxNNAr1Dd
        6Mlff/gN2+lqo4zw+kYZg0WOJs9GXSkSMTA5
X-Google-Smtp-Source: ABdhPJxS0WnyXh3Ym8nlXdT8ziMAapDEvBXAV3z34IkPOEnkAAIo4DPZ804J9OwgcE+bFEmnCjYy+A==
X-Received: by 2002:aca:170a:: with SMTP id j10mr2700082oii.82.1601868764085;
        Sun, 04 Oct 2020 20:32:44 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 187sm2037913oie.42.2020.10.04.20.32.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2020 20:32:43 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 60so7334191otw.3
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2020 20:32:43 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr9828746otl.36.1601868762506;
 Sun, 04 Oct 2020 20:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
In-Reply-To: <20201004122234.802044-1-acourbot@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 5 Oct 2020 12:32:30 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXbTRBBsqcKi-hUtw+pYTVrM2WXBBrEzeTyqqO=B3vuYw@mail.gmail.com>
Message-ID: <CAPBb6MXbTRBBsqcKi-hUtw+pYTVrM2WXBBrEzeTyqqO=B3vuYw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 4, 2020 at 9:22 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
>
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
>
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
>
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Forgot to send the changelog, so here it is:

Changes since v1:
* Added Acked-by from Randy.
* Fixed typo in Kconfig description.

> ---
>  drivers/media/platform/Kconfig                | 10 +--
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>  2 files changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d5..98eb62e49ec2 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
>         depends on MTK_IOMMU || COMPILE_TEST
>         depends on VIDEO_DEV && VIDEO_V4L2
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>         select VIDEOBUF2_DMA_CONTIG
>         select V4L2_MEM2MEM_DEV
> -       select VIDEO_MEDIATEK_VPU
> -       select MTK_SCP
>         help
>             Mediatek video codec driver provides HW capability to
> -           encode and decode in a range of video formats
> -           This driver rely on VPU driver to communicate with VPU.
> +           encode and decode in a range of video formats on MT8173
> +           and MT8183.
> +
> +           Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
> +           also be selected. Support for MT8183 depends on MTK_SCP.
>
>             To compile this driver as modules, choose M here: the
>             modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> index 6c2a2568d844..23a80027a8fb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> @@ -13,6 +13,7 @@ struct mtk_vcodec_fw_ops {
>                             mtk_vcodec_ipi_handler handler, const char *name, void *priv);
>         int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
>                         unsigned int len, unsigned int wait);
> +       void (*release)(struct mtk_vcodec_fw *fw);
>  };
>
>  struct mtk_vcodec_fw {
> @@ -22,6 +23,8 @@ struct mtk_vcodec_fw {
>         struct mtk_scp *scp;
>  };
>
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
> +
>  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
>  {
>         return vpu_load_firmware(fw->pdev);
> @@ -64,6 +67,27 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
>         return vpu_ipi_send(fw->pdev, id, buf, len);
>  }
>
> +static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
> +{
> +       put_device(&fw->pdev->dev);
> +}
> +
> +static void mtk_vcodec_vpu_reset_handler(void *priv)
> +{
> +       struct mtk_vcodec_dev *dev = priv;
> +       struct mtk_vcodec_ctx *ctx;
> +
> +       mtk_v4l2_err("Watchdog timeout!!");
> +
> +       mutex_lock(&dev->dev_mutex);
> +       list_for_each_entry(ctx, &dev->ctx_list, list) {
> +               ctx->state = MTK_STATE_ABORT;
> +               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
> +                              ctx->id);
> +       }
> +       mutex_unlock(&dev->dev_mutex);
> +}
> +
>  static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>         .load_firmware = mtk_vcodec_vpu_load_firmware,
>         .get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
> @@ -71,8 +95,13 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>         .map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
>         .ipi_register = mtk_vcodec_vpu_set_ipi_register,
>         .ipi_send = mtk_vcodec_vpu_ipi_send,
> +       .release = mtk_vcodec_vpu_release,
>  };
>
> +#endif  /* IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU) */
> +
> +#if IS_ENABLED(CONFIG_MTK_SCP)
> +
>  static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
>  {
>         return rproc_boot(scp_get_rproc(fw->scp));
> @@ -107,6 +136,11 @@ static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
>         return scp_ipi_send(fw->scp, id, buf, len, wait);
>  }
>
> +static void mtk_vcodec_scp_release(struct mtk_vcodec_fw *fw)
> +{
> +       scp_put(fw->scp);
> +}
> +
>  static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
>         .load_firmware = mtk_vcodec_scp_load_firmware,
>         .get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
> @@ -114,23 +148,10 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
>         .map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
>         .ipi_register = mtk_vcodec_scp_set_ipi_register,
>         .ipi_send = mtk_vcodec_scp_ipi_send,
> +       .release = mtk_vcodec_scp_release,
>  };
>
> -static void mtk_vcodec_reset_handler(void *priv)
> -{
> -       struct mtk_vcodec_dev *dev = priv;
> -       struct mtk_vcodec_ctx *ctx;
> -
> -       mtk_v4l2_err("Watchdog timeout!!");
> -
> -       mutex_lock(&dev->dev_mutex);
> -       list_for_each_entry(ctx, &dev->ctx_list, list) {
> -               ctx->state = MTK_STATE_ABORT;
> -               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
> -                              ctx->id);
> -       }
> -       mutex_unlock(&dev->dev_mutex);
> -}
> +#endif  /* IS_ENABLED(CONFIG_MTK_SCP) */
>
>  struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>                                            enum mtk_vcodec_fw_type type,
> @@ -143,16 +164,22 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>
>         switch (type) {
>         case VPU:
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
>                 ops = &mtk_vcodec_vpu_msg;
>                 fw_pdev = vpu_get_plat_device(dev->plat_dev);
>                 if (!fw_pdev) {
>                         mtk_v4l2_err("firmware device is not ready");
>                         return ERR_PTR(-EINVAL);
>                 }
> -               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
> +               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler,
>                                     dev, rst_id);
>                 break;
> +#else
> +               mtk_v4l2_err("no VPU support in this kernel");
> +               return ERR_PTR(-ENODEV);
> +#endif
>         case SCP:
> +#if IS_ENABLED(CONFIG_MTK_SCP)
>                 ops = &mtk_vcodec_rproc_msg;
>                 scp = scp_get(dev->plat_dev);
>                 if (!scp) {
> @@ -160,6 +187,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>                         return ERR_PTR(-EPROBE_DEFER);
>                 }
>                 break;
> +#else
> +               mtk_v4l2_err("no SCP support in this kernel");
> +               return ERR_PTR(-ENODEV);
> +#endif
>         default:
>                 mtk_v4l2_err("invalid vcodec fw type");
>                 return ERR_PTR(-EINVAL);
> @@ -180,14 +211,7 @@ EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
>
>  void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
>  {
> -       switch (fw->type) {
> -       case VPU:
> -               put_device(&fw->pdev->dev);
> -               break;
> -       case SCP:
> -               scp_put(fw->scp);
> -               break;
> -       }
> +       fw->ops->release(fw);
>  }
>  EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
>
> --
> 2.28.0.806.g8561365e88-goog
>
