Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2214B22E870
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 11:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgG0JGp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 05:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbgG0JGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 05:06:45 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05BBC0619D2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:06:44 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id l27so4629638oti.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGpZXEuRBib6aDpnPcoJB4L6dn8yPsd4V+J/dT3VJmE=;
        b=C6OgC15kKUHOR7+qCyz0EvQdkZDbuiIRKyBlHQA5ceiVAK74V0gN9zMSiXJrWQTg4m
         YVEwFYnhnW3kQ1Jf+G5gDrS40fmoGMeYivGIF3OKs9K634R60M5fJ9/NDUc5BCGhuWl+
         kK8ok51HH7iRlkz77MO2j/GBDTMaaIMQMicdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGpZXEuRBib6aDpnPcoJB4L6dn8yPsd4V+J/dT3VJmE=;
        b=Yu1hdz+0/yeUvZLXQlWKbDqBnhl2tO4QWrDVC4DAqx8cRKrp0t2TxzXPUo8U5tcW3u
         dkpZYNl326v27QHCHWmlKOS/BDmqf/HnZ3X4EBlnhWO3uRHhJeNJ1ZXHiEUqQYAk3x2I
         yceHAEqA+IDFznCB6qribJrMJEoe7gjxCwNDT7txQ2RSUc6FG0vWbnrYv7cBcIuODsos
         u7o4C6aReMbPQqs+gAmoMrkJjvjdPcxC9TVCi1yF3BD0D2l3UDf67poZ7Q6x1lGb/rwZ
         47gFOuZYI+NcrQPiHH36g0By9S9piWxk9VYip5PpnrCCJ/5+FTQFpffbPJJh0pYSs+wl
         66JQ==
X-Gm-Message-State: AOAM531OL0pQZouLEe/Bdg0eDGtLidwQ6ZXupH5NU6RJQuTmL+YocFX1
        aBjhJQ6PiiiiPiyKrMcInCM2F8rBJ10=
X-Google-Smtp-Source: ABdhPJw52j/YoaZuO4jibdXbGL40SxybDVwhvLXJBn0yhA88UP31DFql8gJj+fbRz0jojHm8ZMSHSQ==
X-Received: by 2002:a9d:611d:: with SMTP id i29mr18445172otj.42.1595840803274;
        Mon, 27 Jul 2020 02:06:43 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id v137sm1963276oia.23.2020.07.27.02.06.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 02:06:42 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id t4so13724127oij.9
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 02:06:41 -0700 (PDT)
X-Received: by 2002:a54:4f08:: with SMTP id e8mr6105676oiy.94.1595840801018;
 Mon, 27 Jul 2020 02:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-2-acourbot@chromium.org> <CAAEAJfB6NS2oJU1uiN1kTU-Mhank6-wOUox2qVzRRXEhp3o9Lw@mail.gmail.com>
In-Reply-To: <CAAEAJfB6NS2oJU1uiN1kTU-Mhank6-wOUox2qVzRRXEhp3o9Lw@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 27 Jul 2020 18:06:27 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVcr18k4xx71=9vmuCaqCwSdzkwO6X8yFP2v5SfFGqkKw@mail.gmail.com>
Message-ID: <CAPBb6MVcr18k4xx71=9vmuCaqCwSdzkwO6X8yFP2v5SfFGqkKw@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] media: mtk-vcodec: abstract firmware interface
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 23, 2020 at 6:23 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > MT8183's codec firwmare is run by a different remote processor from
> > MT8173. While the firmware interface is basically the same, the way to
> > invoke it differs. Abstract all firmware calls under a layer that will
> > allow us to handle both firmware types transparently.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > [pihsun: fix error path and add mtk_vcodec_fw_release]
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > Reviewed-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  50 ++---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   5 +-
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  47 ++---
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 172 ++++++++++++++++++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  36 ++++
> >  .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
> >  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
> >  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
> >  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
> >  .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
> >  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
> >  .../platform/mtk-vcodec/venc/venc_h264_if.c   |  15 +-
> >  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   8 +-
> >  .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
> >  .../media/platform/mtk-vcodec/venc_vpu_if.c   |  17 +-
> >  .../media/platform/mtk-vcodec/venc_vpu_if.h   |   5 +-
> >  21 files changed, 290 insertions(+), 103 deletions(-)
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> > index 37b94b555fa1..b8636119ed0a 100644
> > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -12,7 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
> >                 vdec_vpu_if.o \
> >                 mtk_vcodec_dec.o \
> >                 mtk_vcodec_dec_pm.o \
> > -
> > +               mtk_vcodec_fw.o
> >
> >  mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> >                 venc/venc_h264_if.o \
> > @@ -25,5 +25,3 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> >
> >  mtk-vcodec-common-y := mtk_vcodec_intr.o \
> >                 mtk_vcodec_util.o\
> > -
> > -ccflags-y += -I$(srctree)/drivers/media/platform/mtk-vpu
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 97a1b6664c20..4f07a5fcce7f 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -20,7 +20,7 @@
> >  #include "mtk_vcodec_dec_pm.h"
> >  #include "mtk_vcodec_intr.h"
> >  #include "mtk_vcodec_util.h"
> > -#include "mtk_vpu.h"
> > +#include "mtk_vcodec_fw.h"
> >
> >  #define VDEC_HW_ACTIVE 0x10
> >  #define VDEC_IRQ_CFG   0x11
> > @@ -77,22 +77,6 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
> >         return IRQ_HANDLED;
> >  }
> >
> > -static void mtk_vcodec_dec_reset_handler(void *priv)
> > -{
> > -       struct mtk_vcodec_dev *dev = priv;
> > -       struct mtk_vcodec_ctx *ctx;
> > -
> > -       mtk_v4l2_err("Watchdog timeout!!");
> > -
> > -       mutex_lock(&dev->dev_mutex);
> > -       list_for_each_entry(ctx, &dev->ctx_list, list) {
> > -               ctx->state = MTK_STATE_ABORT;
> > -               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ERROR",
> > -                               ctx->id);
> > -       }
> > -       mutex_unlock(&dev->dev_mutex);
> > -}
> > -
> >  static int fops_vcodec_open(struct file *file)
> >  {
> >         struct mtk_vcodec_dev *dev = video_drvdata(file);
> > @@ -144,21 +128,20 @@ static int fops_vcodec_open(struct file *file)
> >         if (v4l2_fh_is_singular(&ctx->fh)) {
> >                 mtk_vcodec_dec_pw_on(&dev->pm);
> >                 /*
> > -                * vpu_load_firmware checks if it was loaded already and
> > -                * does nothing in that case
> > +                * Does nothing if firmware was already loaded.
> >                  */
> > -               ret = vpu_load_firmware(dev->vpu_plat_dev);
> > +               ret = mtk_vcodec_fw_load_firmware(dev->fw_handler);
> >                 if (ret < 0) {
> >                         /*
> >                          * Return 0 if downloading firmware successfully,
> >                          * otherwise it is failed
> >                          */
> > -                       mtk_v4l2_err("vpu_load_firmware failed!");
> > +                       mtk_v4l2_err("failed to load firmware!");
> >                         goto err_load_fw;
> >                 }
> >
> >                 dev->dec_capability =
> > -                       vpu_get_vdec_hw_capa(dev->vpu_plat_dev);
> > +                       mtk_vcodec_fw_get_vdec_capa(dev->fw_handler);
> >                 mtk_v4l2_debug(0, "decoder capability %x", dev->dec_capability);
> >         }
> >
> > @@ -228,6 +211,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >         struct mtk_vcodec_dev *dev;
> >         struct video_device *vfd_dec;
> >         struct resource *res;
> > +       phandle rproc_phandle;
> > +       enum mtk_vcodec_fw_type fw_type;
> >         int i, ret;
> >
> >         dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > @@ -237,19 +222,21 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >         INIT_LIST_HEAD(&dev->ctx_list);
> >         dev->plat_dev = pdev;
> >
> > -       dev->vpu_plat_dev = vpu_get_plat_device(dev->plat_dev);
> > -       if (dev->vpu_plat_dev == NULL) {
> > -               mtk_v4l2_err("[VPU] vpu device in not ready");
> > -               return -EPROBE_DEFER;
> > +       if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> > +                                 &rproc_phandle)) {
> > +               fw_type = VPU;
> > +       } else {
> > +               mtk_v4l2_err("Could not get vdec IPI device");
> > +               return -ENODEV;
> >         }
> > -
> > -       vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_dec_reset_handler,
> > -                       dev, VPU_RST_DEC);
> > +       dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, VPU_RST_DEC);
> > +       if (IS_ERR(dev->fw_handler))
> > +               return PTR_ERR(dev->fw_handler);
> >
> >         ret = mtk_vcodec_init_dec_pm(dev);
> >         if (ret < 0) {
> >                 dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
> > -               return ret;
> > +               goto err_dec_pm;
> >         }
> >
> >         for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
> > @@ -352,6 +339,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >         v4l2_device_unregister(&dev->v4l2_dev);
> >  err_res:
> >         mtk_vcodec_release_dec_pm(dev);
> > +err_dec_pm:
> > +       mtk_vcodec_fw_release(dev->fw_handler);
> >         return ret;
> >  }
> >
> > @@ -376,6 +365,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
> >
> >         v4l2_device_unregister(&dev->v4l2_dev);
> >         mtk_vcodec_release_dec_pm(dev);
> > +       mtk_vcodec_fw_release(dev->fw_handler);
> >         return 0;
> >  }
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > index 5a6ec8fb52da..36dfe3fc056a 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > @@ -12,7 +12,6 @@
> >
> >  #include "mtk_vcodec_dec_pm.h"
> >  #include "mtk_vcodec_util.h"
> > -#include "mtk_vpu.h"
> >
> >  int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> >  {
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 9fd56dee7fd1..e132c4ec463a 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -309,13 +309,13 @@ struct mtk_vcodec_ctx {
> >   * @m2m_dev_dec: m2m device for decoder
> >   * @m2m_dev_enc: m2m device for encoder.
> >   * @plat_dev: platform device
> > - * @vpu_plat_dev: mtk vpu platform device
> >   * @ctx_list: list of struct mtk_vcodec_ctx
> >   * @irqlock: protect data access by irq handler and work thread
> >   * @curr_ctx: The context that is waiting for codec hardware
> >   *
> >   * @reg_base: Mapped address of MTK Vcodec registers.
> >   *
> > + * @fw_handler: used to communicate with the firmware.
> >   * @id_counter: used to identify current opened instance
> >   *
> >   * @encode_workqueue: encode work queue
> > @@ -344,12 +344,13 @@ struct mtk_vcodec_dev {
> >         struct v4l2_m2m_dev *m2m_dev_dec;
> >         struct v4l2_m2m_dev *m2m_dev_enc;
> >         struct platform_device *plat_dev;
> > -       struct platform_device *vpu_plat_dev;
> >         struct list_head ctx_list;
> >         spinlock_t irqlock;
> >         struct mtk_vcodec_ctx *curr_ctx;
> >         void __iomem *reg_base[NUM_MAX_VCODEC_REG_BASE];
> >
> > +       struct mtk_vcodec_fw *fw_handler;
> > +
> >         unsigned long id_counter;
> >
> >         struct workqueue_struct *decode_workqueue;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 4d31f1ed113f..4340ea10afd0 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -21,7 +21,7 @@
> >  #include "mtk_vcodec_enc_pm.h"
> >  #include "mtk_vcodec_intr.h"
> >  #include "mtk_vcodec_util.h"
> > -#include "mtk_vpu.h"
> > +#include "mtk_vcodec_fw.h"
> >
> >  module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
> >  module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
> > @@ -101,22 +101,6 @@ static irqreturn_t mtk_vcodec_enc_lt_irq_handler(int irq, void *priv)
> >         return IRQ_HANDLED;
> >  }
> >
> > -static void mtk_vcodec_enc_reset_handler(void *priv)
> > -{
> > -       struct mtk_vcodec_dev *dev = priv;
> > -       struct mtk_vcodec_ctx *ctx;
> > -
> > -       mtk_v4l2_debug(0, "Watchdog timeout!!");
> > -
> > -       mutex_lock(&dev->dev_mutex);
> > -       list_for_each_entry(ctx, &dev->ctx_list, list) {
> > -               ctx->state = MTK_STATE_ABORT;
> > -               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
> > -                               ctx->id);
> > -       }
> > -       mutex_unlock(&dev->dev_mutex);
> > -}
> > -
> >  static int fops_vcodec_open(struct file *file)
> >  {
> >         struct mtk_vcodec_dev *dev = video_drvdata(file);
> > @@ -159,10 +143,10 @@ static int fops_vcodec_open(struct file *file)
> >
> >         if (v4l2_fh_is_singular(&ctx->fh)) {
> >                 /*
> > -                * vpu_load_firmware checks if it was loaded already and
> > +                * load fireware to checks if it was loaded already and
> >                  * does nothing in that case
> >                  */
> > -               ret = vpu_load_firmware(dev->vpu_plat_dev);
> > +               ret = mtk_vcodec_fw_load_firmware(dev->fw_handler);
> >                 if (ret < 0) {
> >                         /*
> >                          * Return 0 if downloading firmware successfully,
> > @@ -173,7 +157,7 @@ static int fops_vcodec_open(struct file *file)
> >                 }
> >
> >                 dev->enc_capability =
> > -                       vpu_get_venc_hw_capa(dev->vpu_plat_dev);
> > +                       mtk_vcodec_fw_get_venc_capa(dev->fw_handler);
> >                 mtk_v4l2_debug(0, "encoder capability %x", dev->enc_capability);
> >         }
> >
> > @@ -235,6 +219,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >         struct mtk_vcodec_dev *dev;
> >         struct video_device *vfd_enc;
> >         struct resource *res;
> > +       phandle rproc_phandle;
> > +       enum mtk_vcodec_fw_type fw_type;
> >         int i, j, ret;
> >
> >         dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > @@ -244,19 +230,21 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >         INIT_LIST_HEAD(&dev->ctx_list);
> >         dev->plat_dev = pdev;
> >
> > -       dev->vpu_plat_dev = vpu_get_plat_device(dev->plat_dev);
> > -       if (dev->vpu_plat_dev == NULL) {
> > -               mtk_v4l2_err("[VPU] vpu device in not ready");
> > -               return -EPROBE_DEFER;
> > +       if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> > +                                 &rproc_phandle)) {
> > +               fw_type = VPU;
> > +       } else {
> > +               mtk_v4l2_err("Could not get venc IPI device");
> > +               return -ENODEV;
> >         }
> > -
> > -       vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset_handler,
> > -                               dev, VPU_RST_ENC);
> > +       dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, VPU_RST_ENC);
> > +       if (IS_ERR(dev->fw_handler))
> > +               return PTR_ERR(dev->fw_handler);
> >
> >         ret = mtk_vcodec_init_enc_pm(dev);
> >         if (ret < 0) {
> >                 dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
> > -               return ret;
> > +               goto err_enc_pm;
> >         }
> >
> >         for (i = VENC_SYS, j = 0; i < NUM_MAX_VCODEC_REG_BASE; i++, j++) {
> > @@ -377,6 +365,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >         v4l2_device_unregister(&dev->v4l2_dev);
> >  err_res:
> >         mtk_vcodec_release_enc_pm(dev);
> > +err_enc_pm:
> > +       mtk_vcodec_fw_release(dev->fw_handler);
> >         return ret;
> >  }
> >
> > @@ -401,6 +391,7 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
> >
> >         v4l2_device_unregister(&dev->v4l2_dev);
> >         mtk_vcodec_release_enc_pm(dev);
> > +       mtk_vcodec_fw_release(dev->fw_handler);
> >         return 0;
> >  }
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > index 3e2bfded79a6..ee22902aaa71 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > @@ -12,8 +12,6 @@
> >
> >  #include "mtk_vcodec_enc_pm.h"
> >  #include "mtk_vcodec_util.h"
> > -#include "mtk_vpu.h"
> > -
> >
> >  int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
> >  {
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > new file mode 100644
> > index 000000000000..967bb100a990
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > @@ -0,0 +1,172 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include "mtk_vcodec_fw.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "mtk_vcodec_drv.h"
> > +
> > +struct mtk_vcodec_fw_ops {
> > +       int (*load_firmware)(struct mtk_vcodec_fw *fw);
> > +       unsigned int (*get_vdec_capa)(struct mtk_vcodec_fw *fw);
> > +       unsigned int (*get_venc_capa)(struct mtk_vcodec_fw *fw);
> > +       void * (*map_dm_addr)(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr);
> > +       int (*ipi_register)(struct mtk_vcodec_fw *fw, int id,
> > +               mtk_vcodec_ipi_handler handler, const char *name, void *priv);
> > +       int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
> > +               unsigned int len, unsigned int wait);
> > +};
> > +
> > +struct mtk_vcodec_fw {
> > +       enum mtk_vcodec_fw_type type;
> > +       const struct mtk_vcodec_fw_ops *ops;
> > +       struct platform_device *pdev;
> > +};
> > +
> > +static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
> > +{
> > +       return vpu_load_firmware(fw->pdev);
> > +}
> > +
> > +static unsigned int mtk_vcodec_vpu_get_vdec_capa(struct mtk_vcodec_fw *fw)
> > +{
> > +       return vpu_get_vdec_hw_capa(fw->pdev);
> > +}
> > +
> > +static unsigned int mtk_vcodec_vpu_get_venc_capa(struct mtk_vcodec_fw *fw)
> > +{
> > +       return vpu_get_venc_hw_capa(fw->pdev);
> > +}
> > +
> > +static void *mtk_vcodec_vpu_map_dm_addr(struct mtk_vcodec_fw *fw,
> > +                                       u32 dtcm_dmem_addr)
> > +{
> > +       return vpu_mapping_dm_addr(fw->pdev, dtcm_dmem_addr);
> > +}
> > +
> > +static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
> > +               mtk_vcodec_ipi_handler handler, const char *name, void *priv)
> > +{
> > +       /*
> > +        * The handler we receive takes a void * as its first argument. We
> > +        * cannot change this because it needs to be passed down to the rproc
> > +        * subsystem when SCP is used. VPU takes a const argument, which is
> > +        * more constrained, so the conversion below is safe.
> > +        */
> > +       ipi_handler_t handler_const = (ipi_handler_t)handler;
> > +
> > +       return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
> > +}
> > +
> > +static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
> > +               unsigned int len, unsigned int wait)
> > +{
> > +       return vpu_ipi_send(fw->pdev, id, buf, len);
> > +}
> > +
> > +static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
> > +       .load_firmware = mtk_vcodec_vpu_load_firmware,
> > +       .get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
> > +       .get_venc_capa = mtk_vcodec_vpu_get_venc_capa,
> > +       .map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
> > +       .ipi_register = mtk_vcodec_vpu_set_ipi_register,
> > +       .ipi_send = mtk_vcodec_vpu_ipi_send,
> > +};
> > +
> > +static void mtk_vcodec_reset_handler(void *priv)
> > +{
> > +       struct mtk_vcodec_dev *dev = priv;
> > +       struct mtk_vcodec_ctx *ctx;
> > +
> > +       mtk_v4l2_err("Watchdog timeout!!");
> > +
> > +       mutex_lock(&dev->dev_mutex);
> > +       list_for_each_entry(ctx, &dev->ctx_list, list) {
> > +               ctx->state = MTK_STATE_ABORT;
> > +               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
> > +                               ctx->id);
> > +       }
> > +       mutex_unlock(&dev->dev_mutex);
> > +}
> > +
> > +struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> > +                                          enum mtk_vcodec_fw_type type,
> > +                                          enum rst_id rst_id)
> > +{
> > +       const struct mtk_vcodec_fw_ops *ops;
> > +       struct mtk_vcodec_fw *fw;
> > +       struct platform_device *fw_pdev = NULL;
> > +
> > +       switch (type) {
> > +       case VPU:
> > +               ops = &mtk_vcodec_vpu_msg;
> > +               fw_pdev = vpu_get_plat_device(dev->plat_dev);
> > +               if (!fw_pdev) {
> > +                       mtk_v4l2_err("firmware device is not ready");
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> > +               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
> > +                                   dev, rst_id);
> > +               break;
> > +       default:
> > +               mtk_v4l2_err("invalid vcodec fw type");
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> > +       if (!fw)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       fw->type = type;
> > +       fw->ops = ops;
> > +       fw->pdev = fw_pdev;
> > +
> > +       return fw;
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
> > +
> > +void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
> > +{
> > +       switch (fw->type) {
> > +       case VPU:
> > +               put_device(&fw->pdev->dev);
> > +               break;
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
> > +
>
> What are these symbols exported for?

This driver is made of three modules: mtk_vcodec_common,
mtk_vcodec_dec and mtk_vcodec_enc. These functions are used by both
the encoder and decoder module, so they need to be exported.

There is mistake in the patch though that I noticed while
investigating your comment: the file defining these functions
(mtk_vcodec_fw.c) is linked against the mtk_vcodec_dec module while it
should be part of mtk_vcodec_common, so thanks for asking. :)
