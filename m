Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA0B1FB1D1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 15:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgFPNRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 09:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgFPNRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 09:17:19 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891F5C061573
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 06:17:19 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id k15so15879435otp.8
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzMbHCBVqOXYNcr+qlbWYXnu4pNfFFS2FAbZ34pmgSc=;
        b=FiMajHQm7L6DE7XhIjtgClVw9dM6cFiUMth6qMwoC0Emy3gOzr89rNweEqq8RXT2rm
         pOgmOB4uLk0vlKKD5iVRMmwYIBZGPwAHQZI+Dviz/nlvIE+3qu6k6FVURyqCv9s7P6aS
         Zzk9wgbThOGRYsnJ0OSaaZL0J6mVMCZGcrofs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzMbHCBVqOXYNcr+qlbWYXnu4pNfFFS2FAbZ34pmgSc=;
        b=hIlXxd7sRm8T2Bpln/pWhJPaWzfXNEr6nSLSxUGuJsf1OzEt+axVHOq2EZ3ZruMNJ1
         KVgMPrC84oGsONZEAPnBhoeZ2xfQXblP1dI6aMFdXtZb5EZETVm5QQCtEAqrvgNsg9Vk
         aeyUTYe6NSP0+PLb8R2cWig9Shi6qkDEVgVmS/yUkSNplk5WMhmNBtP5ZtzxcKmRvufH
         CKUe2vude+sHlP54OOk6E0vVYWuEie4omQ6zSaCfbKiJvOw5nRBt93yFhMDmxUeHzuJC
         mcHvpcEYoB6NjHq2hlfYtMhl+3cAdWPOOWeRDRGg0AYnmxmwXK8R54NN6Id9EG+tYDlH
         UIBQ==
X-Gm-Message-State: AOAM531roCpgi6Z/OGm9AVv26+xFkTSz/XgKI9VORyG6X/FnVJm3+mRK
        Pxw7o1TqbVFVkM5YAlUu1c91AJrorAY=
X-Google-Smtp-Source: ABdhPJxcM53dyXuBUffrtlKUU1m1p5RCOWZ1ONIiCKDOkXme83YyeH30aTbJPN8gcFRcV69OkyAQqQ==
X-Received: by 2002:a05:6830:1310:: with SMTP id p16mr2176413otq.249.1592313438026;
        Tue, 16 Jun 2020 06:17:18 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id z6sm4056839oth.26.2020.06.16.06.17.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 06:17:17 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id q188so4071713ooq.4
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 06:17:16 -0700 (PDT)
X-Received: by 2002:a4a:6156:: with SMTP id u22mr2286731ooe.50.1592313436257;
 Tue, 16 Jun 2020 06:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org> <20200520082723.96136-3-acourbot@chromium.org>
 <1591613234.18435.8.camel@mtksdaap41>
In-Reply-To: <1591613234.18435.8.camel@mtksdaap41>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 16 Jun 2020 22:17:03 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVFyvoGjNE4xVPTBQzZibQSOuiEgBynror3CAo1W2dkxw@mail.gmail.com>
Message-ID: <CAPBb6MVFyvoGjNE4xVPTBQzZibQSOuiEgBynror3CAo1W2dkxw@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: mtk-vcodec: add SCP firmware ops
To:     Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 8, 2020 at 7:47 PM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
>
> On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > Add support for communicating with the SCP firmware, which will be used
> > by MT8183.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/platform/Kconfig                |  2 +
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
> >  5 files changed, 66 insertions(+)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index c57ee78fa99d..9b11dd6b1ef3 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -256,6 +256,8 @@ config VIDEO_MEDIATEK_VCODEC
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_MEM2MEM_DEV
> >       select VIDEO_MEDIATEK_VPU
> > +     select MTK_SCP
> > +     default n
> >       help
> >           Mediatek video codec driver provides HW capability to
> >           encode and decode in a range of video formats
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 4f07a5fcce7f..5b5765b98e57 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -225,6 +225,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >       if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> >                                 &rproc_phandle)) {
> >               fw_type = VPU;
> > +     } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> > +                                      &rproc_phandle)) {
> > +             fw_type = SCP;
> >       } else {
> >               mtk_v4l2_err("Could not get vdec IPI device");
> >               return -ENODEV;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 4340ea10afd0..42530cd01a30 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -233,6 +233,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >       if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> >                                 &rproc_phandle)) {
> >               fw_type = VPU;
> > +     } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> > +                                      &rproc_phandle)) {
> > +             fw_type = SCP;
> >       } else {
> >               mtk_v4l2_err("Could not get venc IPI device");
> >               return -ENODEV;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > index 967bb100a990..f2a62ea62fc6 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > @@ -19,6 +19,7 @@ struct mtk_vcodec_fw {
> >       enum mtk_vcodec_fw_type type;
> >       const struct mtk_vcodec_fw_ops *ops;
> >       struct platform_device *pdev;
> > +     struct mtk_scp *scp;
> >  };
> >
> >  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
> > @@ -71,6 +72,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
> >       .ipi_send = mtk_vcodec_vpu_ipi_send,
> >  };
> >
> > +static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
> > +{
> > +     return rproc_boot(scp_get_rproc(fw->scp));
>
>
> Does rproc_boot and scp_get_rproc depend on the other kernel module?
> where are they defineded?

rproc_boot() is part of the remoteproc subsystem. scp_get_rproc() is
part of the mtk_scp driver, which is present upstream. This patch also
adds a dependency on MTK_SCP in Kconfig, which ensures both functions
are available.

>
> > +}
> > +
> > +static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
> > +{
> > +     return scp_get_vdec_hw_capa(fw->scp);
> > +}
> > +
> > +static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
> > +{
> > +     return scp_get_venc_hw_capa(fw->scp);
> > +}
> > +
> > +static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
> > +                                     u32 dtcm_dmem_addr)
> > +{
> > +     return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
> > +}
> > +
> > +static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
> > +             mtk_vcodec_ipi_handler handler, const char *name, void *priv)
> > +{
> > +     return scp_ipi_register(fw->scp, id, handler, priv);
> > +}
> > +
> > +static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
> > +             unsigned int len, unsigned int wait)
> > +{
> > +     return scp_ipi_send(fw->scp, id, buf, len, wait);
> > +}
> > +
> > +static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
> > +     .load_firmware = mtk_vcodec_scp_load_firmware,
> > +     .get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
> > +     .get_venc_capa = mtk_vcodec_scp_get_venc_capa,
> > +     .map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
> > +     .ipi_register = mtk_vcodec_scp_set_ipi_register,
> > +     .ipi_send = mtk_vcodec_scp_ipi_send,
> > +};
> > +
> >  static void mtk_vcodec_reset_handler(void *priv)
> >  {
> >       struct mtk_vcodec_dev *dev = priv;
> > @@ -94,6 +137,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> >       const struct mtk_vcodec_fw_ops *ops;
> >       struct mtk_vcodec_fw *fw;
> >       struct platform_device *fw_pdev = NULL;
> > +     struct mtk_scp *scp = NULL;
> >
> >       switch (type) {
> >       case VPU:
> > @@ -106,6 +150,14 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> >               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
> >                                   dev, rst_id);
> >               break;
> > +     case SCP:
> > +             ops = &mtk_vcodec_rproc_msg;
> > +             scp = scp_get(dev->plat_dev);
> > +             if (!scp) {
> > +                     mtk_v4l2_err("could not get vdec scp handle");
> > +                     return ERR_PTR(-EPROBE_DEFER);
> > +             }
> > +             break;
> >       default:
> >               mtk_v4l2_err("invalid vcodec fw type");
> >               return ERR_PTR(-EINVAL);
> > @@ -118,6 +170,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> >       fw->type = type;
> >       fw->ops = ops;
> >       fw->pdev = fw_pdev;
> > +     fw->scp = scp;
> >
> >       return fw;
> >  }
> > @@ -129,6 +182,9 @@ void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
> >       case VPU:
> >               put_device(&fw->pdev->dev);
> >               break;
> > +     case SCP:
> > +             scp_put(fw->scp);
> > +             break;
> >       }
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> > index ff25b0c19f74..ced1b6a10e07 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> > @@ -4,6 +4,7 @@
> >  #define _MTK_VCODEC_FW_H_
> >
> >  #include <linux/remoteproc.h>
> > +#include <linux/remoteproc/mtk_scp.h>
> >
> >  #include "../mtk-vpu/mtk_vpu.h"
> >
> > @@ -11,6 +12,7 @@ struct mtk_vcodec_dev;
> >
> >  enum mtk_vcodec_fw_type {
> >       VPU,
> > +     SCP,
> >  };
> >
> >  struct mtk_vcodec_fw;
>
