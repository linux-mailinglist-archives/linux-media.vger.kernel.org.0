Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3D924D297
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgHUKgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgHUKft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:35:49 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D40C061387
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:35:49 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k4so1143838oik.2
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Byvzby1llxcruzsj3OyuSTWoxQgTt17xzrKtgbxngX8=;
        b=V2xwG4HNtfiwcTEvM+eOUgJtUT4hqHMmCb944VuZ7yrG29MjfY6fz9c3sxBeEEZVp2
         P0s9hcx/LY0NfbaBe4Pn++Lvu+J/gW2NSftHgmLlXCh1WsYuynORV/D9mxeC8PC6yEIw
         C1reXI2nSvv+GSmQWUMNPyZyTmMgJSGFbINk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Byvzby1llxcruzsj3OyuSTWoxQgTt17xzrKtgbxngX8=;
        b=sp+BI0Ykrtg3XdjE6gFWFkNzHp3XPiB+L0ACchMG/UrWkhmMtnuN92NjD9TV2R21DI
         en1h2EtbOK8jsxlAkSS7E1Qo2uwquDqzqXzwufQXkqEBQFW2diWGLOD90RVc/AKWxBAZ
         fKeKixtjo2cNkZejahyasjfZXS9t3M2W/Pg0/WsfM3zov7N0KGFc1w/aNW0Ej4AUfj+R
         VZ87YaDOjL/nElTftyA4OSy+9o8VzZy/YDCE7oYMT2Vk4jSO2Dxko9pWAS5uROLqFcUs
         KDFTZk1l4Iik+4oWYGfSyIgUxXPKC5AjWztCIWAfuaztQgqNUE9EtGuR1LemWTsgHqNj
         uMjQ==
X-Gm-Message-State: AOAM532W05PX/f+9ZjuQWJdrs0OR4dlAPkroIF5NqgokfoB5FTBw8w/w
        sThwB7ZCc1dr97e1PGezLeeqg0xZH/s63+i6
X-Google-Smtp-Source: ABdhPJyiP89O1+5EAH5UmiLd+ZBmfZE+70LLtiVVNQyx3pvfDPgLzPJPCG897Pc0zHl+1LC32CI8iQ==
X-Received: by 2002:aca:ed4e:: with SMTP id l75mr1377306oih.44.1598006147055;
        Fri, 21 Aug 2020 03:35:47 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id h21sm237504oib.51.2020.08.21.03.35.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 03:35:46 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id v6so1176223ota.13
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:35:45 -0700 (PDT)
X-Received: by 2002:a9d:5f0c:: with SMTP id f12mr1361858oti.141.1598006145135;
 Fri, 21 Aug 2020 03:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-4-acourbot@chromium.org> <CAAEAJfBO1Sih3r_RqxYCLRxtx6SoDq674zrvqhJiEBJeiDAtvw@mail.gmail.com>
 <CAPBb6MV=oo-a9POY_qedcJYU_qSJ695FwJthBrp3SQUK+g0JvA@mail.gmail.com> <CAAEAJfD6tiJKLNoSJbvJkafLrU8s5Y8mZOg038SuH1QNCO-+_g@mail.gmail.com>
In-Reply-To: <CAAEAJfD6tiJKLNoSJbvJkafLrU8s5Y8mZOg038SuH1QNCO-+_g@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 21 Aug 2020 19:35:34 +0900
X-Gmail-Original-Message-ID: <CAPBb6MV4bk4iYR6NkX+pttMA3SEyPsWCgk-iwRmAYKmDjXtPRA@mail.gmail.com>
Message-ID: <CAPBb6MV4bk4iYR6NkX+pttMA3SEyPsWCgk-iwRmAYKmDjXtPRA@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] media: mtk-vcodec: add SCP firmware ops
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 11:09 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Mon, 27 Jul 2020 at 06:06, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > On Thu, Jul 23, 2020 at 6:40 AM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> > > >
> > > > From: Yunfei Dong <yunfei.dong@mediatek.com>
> > > >
> > > > Add support for communicating with the SCP firmware, which will be used
> > > > by MT8183.
> > > >
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > [acourbot: refactor, cleanup and split]
> > > > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > > > ---
> > > >  drivers/media/platform/Kconfig                |  1 +
> > > >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
> > > >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
> > > >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
> > > >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
> > > >  5 files changed, 65 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > > > index c57ee78fa99d..f0dbe048efea 100644
> > > > --- a/drivers/media/platform/Kconfig
> > > > +++ b/drivers/media/platform/Kconfig
> > > > @@ -256,6 +256,7 @@ config VIDEO_MEDIATEK_VCODEC
> > > >         select VIDEOBUF2_DMA_CONTIG
> > > >         select V4L2_MEM2MEM_DEV
> > > >         select VIDEO_MEDIATEK_VPU
> > > > +       select MTK_SCP
> > > >         help
> > > >             Mediatek video codec driver provides HW capability to
> > > >             encode and decode in a range of video formats
> > > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > > index 4f07a5fcce7f..5b5765b98e57 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > > @@ -225,6 +225,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> > > >         if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> > > >                                   &rproc_phandle)) {
> > > >                 fw_type = VPU;
> > > > +       } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> > > > +                                        &rproc_phandle)) {
> > > > +               fw_type = SCP;
> > > >         } else {
> > > >                 mtk_v4l2_err("Could not get vdec IPI device");
> > > >                 return -ENODEV;
> > > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > > > index 4340ea10afd0..42530cd01a30 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > > > @@ -233,6 +233,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> > > >         if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> > > >                                   &rproc_phandle)) {
> > > >                 fw_type = VPU;
> > > > +       } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> > > > +                                        &rproc_phandle)) {
> > > > +               fw_type = SCP;
> > > >         } else {
> > > >                 mtk_v4l2_err("Could not get venc IPI device");
> > > >                 return -ENODEV;
> > > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > > > index 967bb100a990..f2a62ea62fc6 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > > > @@ -19,6 +19,7 @@ struct mtk_vcodec_fw {
> > > >         enum mtk_vcodec_fw_type type;
> > > >         const struct mtk_vcodec_fw_ops *ops;
> > > >         struct platform_device *pdev;
> > > > +       struct mtk_scp *scp;
> > > >  };
> > > >
> > > >  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
> > > > @@ -71,6 +72,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
> > > >         .ipi_send = mtk_vcodec_vpu_ipi_send,
> > > >  };
> > > >
> > > > +static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
> > > > +{
> > > > +       return rproc_boot(scp_get_rproc(fw->scp));
> > > > +}
> > > > +
> > > > +static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
> > > > +{
> > > > +       return scp_get_vdec_hw_capa(fw->scp);
> > > > +}
> > > > +
> > > > +static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
> > > > +{
> > > > +       return scp_get_venc_hw_capa(fw->scp);
> > > > +}
> > > > +
> > > > +static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
> > > > +                                       u32 dtcm_dmem_addr)
> > > > +{
> > > > +       return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
> > > > +}
> > > > +
> > > > +static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
> > > > +               mtk_vcodec_ipi_handler handler, const char *name, void *priv)
> > > > +{
> > > > +       return scp_ipi_register(fw->scp, id, handler, priv);
> > > > +}
> > > > +
> > > > +static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
> > > > +               unsigned int len, unsigned int wait)
> > > > +{
> > > > +       return scp_ipi_send(fw->scp, id, buf, len, wait);
> > > > +}
> > > > +
> > > > +static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
> > > > +       .load_firmware = mtk_vcodec_scp_load_firmware,
> > > > +       .get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
> > > > +       .get_venc_capa = mtk_vcodec_scp_get_venc_capa,
> > > > +       .map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
> > > > +       .ipi_register = mtk_vcodec_scp_set_ipi_register,
> > > > +       .ipi_send = mtk_vcodec_scp_ipi_send,
> > > > +};
> > > > +
> > > >  static void mtk_vcodec_reset_handler(void *priv)
> > > >  {
> > > >         struct mtk_vcodec_dev *dev = priv;
> > > > @@ -94,6 +137,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> > > >         const struct mtk_vcodec_fw_ops *ops;
> > > >         struct mtk_vcodec_fw *fw;
> > > >         struct platform_device *fw_pdev = NULL;
> > > > +       struct mtk_scp *scp = NULL;
> > > >
> > > >         switch (type) {
> > > >         case VPU:
> > > > @@ -106,6 +150,14 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> > > >                 vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
> > > >                                     dev, rst_id);
> > > >                 break;
> > > > +       case SCP:
> > > > +               ops = &mtk_vcodec_rproc_msg;
> > > > +               scp = scp_get(dev->plat_dev);
> > > > +               if (!scp) {
> > > > +                       mtk_v4l2_err("could not get vdec scp handle");
> > > > +                       return ERR_PTR(-EPROBE_DEFER);
> > >
> > > I suspect the EPROBE_DEFER should be returned by scp_get
> > > itself instead.
> >
> > scp_get() is a function of of mtk_scp remoteproc driver, so even if we
> > decide this is desirable (which I am not convinced, as the current
> > code leaves the freedom to decide how the absence of SCP should be
> > interpreted to the driver) this is beyond the scope of this series.
> >
>
> How can the consumer decide if it should defer probing or not?

Fair point. Looking at the code of scp_get(), the only failure points
are of_parse_phandle() and of_find_device_by_node(), which both return
NULL upon failure. So I cannot think of a way that could make
scp_get() decide to return EPROBE_DEFER vs. another error code, which
is probably why it just returns NULL for the moment.

Now that means that the code above also has no reason to make that
decision, and EPROBE_DEFER is probably not valid for all cases. For
now I don't see how we could improve this however.


>
> > >
> > > > +               }
> > > > +               break;
> > > >         default:
> > > >                 mtk_v4l2_err("invalid vcodec fw type");
> > > >                 return ERR_PTR(-EINVAL);
> > > > @@ -118,6 +170,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> > > >         fw->type = type;
> > > >         fw->ops = ops;
> > > >         fw->pdev = fw_pdev;
> > > > +       fw->scp = scp;
> > > >
> > > >         return fw;
> > > >  }
> > > > @@ -129,6 +182,9 @@ void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
> > > >         case VPU:
> > > >                 put_device(&fw->pdev->dev);
> > > >                 break;
> > > > +       case SCP:
> > > > +               scp_put(fw->scp);
> > >
> > > Interestingly scp_put is a wrapper around put_device :-)
> > > Perhaps not a reason to violate the layering.
> >
> > I don't see what is wrong with the current code? If SCP is in use, we
> > use SCP functions to manage it. If in the future SCP involves in such
> > a way that we need to do more than a put_device(), we are covered. Or
> > am I missing something?
>
> Oh, nothing wrong. I just found it interesting that scp_put was
> just wrapping put_device. Nothing to fix really.
>
> Thanks!
> Ezequiel
