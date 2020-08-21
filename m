Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CD924D2E2
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgHUKge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgHUKgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:36:06 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4E9C061387
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:05 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id z10so238478ooi.10
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y9hO8pxmEe7hqAmT8AdE5vIPJiA41vLnM/PwwD4iMVM=;
        b=b6khi7wPA5JvfMkPVq0QNn7w9EzLfc1j1a7Q42tflRcFU+LCmoPlAymtXwPzSh81Px
         BjWUYJbBjz34MKZ+ETM/ZCZAquOZE57rhopyQi12kJTWXG/ZqLh8gSaXaOu/x82D3OJt
         nzL0nIh2SMqYxZZ+dnafXBmwqTGhagEW+byvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y9hO8pxmEe7hqAmT8AdE5vIPJiA41vLnM/PwwD4iMVM=;
        b=Gu3IGECkcJ2jdrshB2EMwdbEh6nHjsIEoXj1MHN6qBGnWnL5OeOUvsZarBWbuuusqM
         C9jkJDWpCO3DTJ653Z5c8WH/B3PAY1WCrT8v6LOicMYQMU0GiOhQkahYSAAb/Nae0NJ0
         V2CdFtpi0SWngFxy6uNhmyYfbzDOsYMNHuzWQt5qP0Gsz3ucayPuVInI6poSlx84mWAG
         QQuVShHx/YxoBxPcP4lDGJ4xVTaIXYDSLiBSZAHuSRprNq+3b/+7XHKv4fIm8lZvjRxM
         jbLvmTDNJ1Mfv4rMz3oONesBjshqtBh1+F5beAI7EK2H1ojBIbDzgZUWBMb5/nxBDmnU
         9nWw==
X-Gm-Message-State: AOAM533uuaCux+yFL4pj/PwaK4973/j7jpc2PAT7a+XQJqC32iYP4Ix+
        FOxxjzg79rH48HwFv+OT1cr/C5aU5Uv1/SCR
X-Google-Smtp-Source: ABdhPJy7WKcTxkXs30nLiTLys3HvvExT7Jw7ZYlcBel56BqDSNyzsywXIsd4/RF+G1fduVMLLvM2dQ==
X-Received: by 2002:a4a:52c2:: with SMTP id d185mr1665756oob.8.1598006163079;
        Fri, 21 Aug 2020 03:36:03 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id g7sm294228otq.26.2020.08.21.03.36.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 03:36:02 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id e11so1210287otk.4
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:01 -0700 (PDT)
X-Received: by 2002:a9d:7d09:: with SMTP id v9mr1360955otn.97.1598006160962;
 Fri, 21 Aug 2020 03:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-5-acourbot@chromium.org> <CAAEAJfDrF_3Ys_9emvNsiwYV5pSfnLis=PoxSGeeKEWW3RE5yg@mail.gmail.com>
 <CAPBb6MUZFZdkUMvHLtiFz6bmjHVmKhjj=Lfw-nwqEG7JL=WEiQ@mail.gmail.com> <CAAEAJfCcQAg20F6KzXsqL2=x7PF3wO4K7bc9jUhkHwN3GaxfGQ@mail.gmail.com>
In-Reply-To: <CAAEAJfCcQAg20F6KzXsqL2=x7PF3wO4K7bc9jUhkHwN3GaxfGQ@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 21 Aug 2020 19:35:49 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUp83=6wjVhaFMOZpMqfJYAXKVbQgp760PiN+eow=8mjA@mail.gmail.com>
Message-ID: <CAPBb6MUp83=6wjVhaFMOZpMqfJYAXKVbQgp760PiN+eow=8mjA@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] media: mtk-vcodec: venc: support SCP firmware
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

On Mon, Jul 27, 2020 at 11:08 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> .
>
> On Mon, 27 Jul 2020 at 06:06, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > On Sat, Jul 25, 2020 at 6:13 AM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > Hi Alexandre,
> > >
> > > I'm slowly making progress on the series. Here's some more comments.
> > >
> > > On Mon, 13 Jul 2020 at 03:10, Alexandre Courbot <acourbot@chromium.org> wrote:
> > > >
> > > > From: Yunfei Dong <yunfei.dong@mediatek.com>
> > > >
> > > > Support the new extended firmware used by MT8183's encoder.
> > > >
> > >
> > > If you could add some more information about the MT8183 encoder
> > > and the extended firmware interface, it would make the review
> > > easier.
> >
> > Sure, I'll try to expand that description a bit.
> >
> > >
> > > Some comments below, I have no idea how this hardware
> > > works, so maybe I won't make sense :-)
> > >
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > [acourbot: refactor, cleanup and split]
> > > > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > > > ---
> > > >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 12 +++
> > > >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 34 ++++---
> > > >  .../platform/mtk-vcodec/venc/venc_h264_if.c   | 65 +++++++++++--
> > > >  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  3 +-
> > > >  .../media/platform/mtk-vcodec/venc_drv_if.h   |  6 ++
> > > >  .../media/platform/mtk-vcodec/venc_ipi_msg.h  | 15 ++-
> > > >  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 97 +++++++++++++------
> > > >  .../media/platform/mtk-vcodec/venc_vpu_if.h   |  3 +-
> > > >  8 files changed, 181 insertions(+), 54 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > > index e132c4ec463a..45c8adfc6a0c 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > > @@ -300,6 +300,17 @@ struct mtk_vcodec_ctx {
> > > >
> > > >  };
> > > >
> > > > +/**
> > > > + * struct mtk_vcodec_enc_pdata - compatible data for each IC
> > > > + *
> > > > + * @uses_ext: whether the encoder uses the extended firmware messaging format
> > > > + * @has_lt_irq: whether the encoder uses the LT irq
> > > > + */
> > > > +struct mtk_vcodec_enc_pdata {
> > > > +       bool uses_ext;
> > > > +       bool has_lt_irq;
> > >
> > > Instead of this boolean here, I think it might be cleaner
> > > to have a small array of strings, listing the interrupts
> > > each variant requires.
> > >
> > > See drivers/staging/media/hantro/rk3288_vpu_hw.c
> > >
> > > It's future-proof and even if you don't plan to see
> > > future works: a) we never know and b) cleaner code,
> > > easier to maintain.
> >
> > I tend to agree. Note however that this boolean is supposed to
> > disappear soon as there is another patch (not part of this series)
> > that will split the decoder into two nodes. The reason why we have
> > this boolean is because MT8173 actually controls *2* instances of this
> > encoder (one for H.264, one for VP8) that are actually separate
> > hardware.
> >
>
> Well, if you are planning to get rid of this boolean,
> then ignore the comment.
>
> > MT8183 only has one instance of the encoder (for H.264, that chip has
> > no VP8 support), so I have added this boolean to control this. Once
> > the DT node split happens it will go away.
>
> Will this DT change break compatibility?

It probably will, but the conclusion on the thread that discussed this
(sorry, can't find it) was that there is no other way. Basically this
DT update is triggered by a IOMMU change that is incompatible with the
current DT. This is not a convenience change for this driver.

>
> > In the meantime, maybe we
> > can try to handle this better by looking at the number of interrupts
> > provided by the DT and enabling/disabling that extra interrupt based
> > on that. It will be 2 for MT8173 and 1 for MT8183, so that should work
> > fine.
> >
> > >
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct mtk_vcodec_dev - driver data
> > > >   * @v4l2_dev: V4L2 device to register video devices for.
> > > > @@ -348,6 +359,7 @@ struct mtk_vcodec_dev {
> > > >         spinlock_t irqlock;
> > > >         struct mtk_vcodec_ctx *curr_ctx;
> > > >         void __iomem *reg_base[NUM_MAX_VCODEC_REG_BASE];
> > > > +       const struct mtk_vcodec_enc_pdata *venc_pdata;
> > > >
> > > >         struct mtk_vcodec_fw *fw_handler;
> > > >
> > > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > > > index 42530cd01a30..922bc8883811 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > > > @@ -244,6 +244,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> > > >         if (IS_ERR(dev->fw_handler))
> > > >                 return PTR_ERR(dev->fw_handler);
> > > >
> > > > +       dev->venc_pdata = of_device_get_match_data(&pdev->dev);
> > > >         ret = mtk_vcodec_init_enc_pm(dev);
> > > >         if (ret < 0) {
> > > >                 dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
> > > > @@ -278,21 +279,24 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> > > >                 ret = -EINVAL;
> > > >                 goto err_res;
> > > >         }
> > > > +       disable_irq(dev->enc_irq);
> > > >
> > >
> > > I am aware this is not an issue with this patch:
> > > requesting an interrupt and then immediately
> > > disabling the interrupt looks racy.
> > >
> > > Now, I haven't need this pattern myself,
> > > but from a quick grep I think you want to do:
> > >
> > >         irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > >         ret = devm_request_irq(dev, irq, ...
> > >
> > > Perhaps something to fix (probably in another patch,
> > > before this one).
> >
> > Nice suggestion, thanks. I will test and add a patch to this series.
> >
> > >
> > > > -       dev->enc_lt_irq = platform_get_irq(pdev, 1);
> > > > -       ret = devm_request_irq(&pdev->dev,
> > > > -                              dev->enc_lt_irq, mtk_vcodec_enc_lt_irq_handler,
> > > > -                              0, pdev->name, dev);
> > > > -       if (ret) {
> > > > -               dev_err(&pdev->dev,
> > > > -                       "Failed to install dev->enc_lt_irq %d (%d)",
> > > > -                       dev->enc_lt_irq, ret);
> > > > -               ret = -EINVAL;
> > > > -               goto err_res;
> > > > +       if (dev->venc_pdata->has_lt_irq) {
> > > > +               dev->enc_lt_irq = platform_get_irq(pdev, 1);
> > > > +               ret = devm_request_irq(&pdev->dev,
> > > > +                                      dev->enc_lt_irq,
> > > > +                                      mtk_vcodec_enc_lt_irq_handler,
> > > > +                                      0, pdev->name, dev);
> > > > +               if (ret) {
> > > > +                       dev_err(&pdev->dev,
> > > > +                               "Failed to install dev->enc_lt_irq %d (%d)",
> > > > +                               dev->enc_lt_irq, ret);
> > > > +                       ret = -EINVAL;
> > > > +                       goto err_res;
> > > > +               }
> > > > +               disable_irq(dev->enc_lt_irq); /* VENC_LT */
> > > >         }
> > > >
> > > > -       disable_irq(dev->enc_irq);
> > > > -       disable_irq(dev->enc_lt_irq); /* VENC_LT */
> > > >         mutex_init(&dev->enc_mutex);
> > > >         mutex_init(&dev->dev_mutex);
> > > >         spin_lock_init(&dev->irqlock);
> > > > @@ -373,8 +377,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> > > >         return ret;
> > > >  }
> > > >
> > > > +static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> > > > +       .has_lt_irq = true,
> > > > +};
> > > > +
> > > >  static const struct of_device_id mtk_vcodec_enc_match[] = {
> > > > -       {.compatible = "mediatek,mt8173-vcodec-enc",},
> > > > +       {.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
> > > >         {},
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> > > > diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > > > index 7a00f050ec36..050787b2896c 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> > > > @@ -24,6 +24,16 @@ static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
> > > >  #define H264_FILLER_MARKER_SIZE ARRAY_SIZE(h264_filler_marker)
> > > >  #define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
> > > >
> > > > +/*
> > > > + * enum venc_h264_frame_type - h264 encoder output bitstream frame type
> > > > + */
> > > > +enum venc_h264_frame_type {
> > > > +       VENC_H264_IDR_FRM,
> > > > +       VENC_H264_I_FRM,
> > > > +       VENC_H264_P_FRM,
> > > > +       VENC_H264_B_FRM,
> > > > +};
> > > > +
> > > >  /*
> > > >   * enum venc_h264_vpu_work_buf - h264 encoder buffer index
> > > >   */
> > > > @@ -137,7 +147,8 @@ struct venc_h264_inst {
> > > >         struct mtk_vcodec_mem work_bufs[VENC_H264_VPU_WORK_BUF_MAX];
> > > >         struct mtk_vcodec_mem pps_buf;
> > > >         bool work_buf_allocated;
> > > > -       unsigned int frm_cnt;
> > > > +       u32 frm_cnt;    /* declared as u32 to properly overflow */
> > >
> > > This looks like it's fixing some issue not related to the 8183
> > > or the extended firmware. Perhaps you can add a
> > > more details comment?
> >
> > Mmm, let me check that a bit closer because I know MT8183 communicates
> > with the firmware a bit differently, so this may require these fields.
> > But maybe we can split that part into another patch.

Upon second look I think I can refrain from touching this member
altogether. By keeping the original logic we don't need the overflow
property and I think it's better that way. :)

> >
> > >
> > > > +       unsigned int skip_frm_cnt;
> > > >         unsigned int prepend_hdr;
> > > >         struct venc_vpu_inst vpu_inst;
> > > >         struct venc_h264_vsi *vsi;
> > > > @@ -327,6 +338,22 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
> > > >         return irq_status;
> > > >  }
> > > >
> > > > +static int h264_frame_type(struct venc_h264_inst *inst)
> > > > +{
> > > > +       if ((inst->vsi->config.gop_size != 0 &&
> > > > +               (inst->frm_cnt % inst->vsi->config.gop_size) == 0) ||
> > > > +               (inst->frm_cnt == 0 && inst->vsi->config.gop_size == 0)) {
> > > > +               /* IDR frame */
> > > > +               return VENC_H264_IDR_FRM;
> > > > +       } else if ((inst->vsi->config.intra_period != 0 &&
> > > > +               (inst->frm_cnt % inst->vsi->config.intra_period) == 0) ||
> > > > +               (inst->frm_cnt == 0 && inst->vsi->config.intra_period == 0)) {
> > > > +               /* I frame */
> > > > +               return VENC_H264_I_FRM;
> > > > +       } else {
> > > > +               return VENC_H264_P_FRM;  /* Note: B frames are not supported */
> > > > +       }
> > > > +}
> > > >  static int h264_encode_sps(struct venc_h264_inst *inst,
> > > >                            struct mtk_vcodec_mem *bs_buf,
> > > >                            unsigned int *bs_size)
> > > > @@ -337,7 +364,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
> > > >         mtk_vcodec_debug_enter(inst);
> > > >
> > > >         ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
> > > > -                            bs_buf, bs_size);
> > > > +                            bs_buf, bs_size, NULL);
> > > >         if (ret)
> > > >                 return ret;
> > > >
> > > > @@ -364,7 +391,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
> > > >         mtk_vcodec_debug_enter(inst);
> > > >
> > > >         ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
> > > > -                            bs_buf, bs_size);
> > > > +                            bs_buf, bs_size, NULL);
> > > >         if (ret)
> > > >                 return ret;
> > > >
> > > > @@ -410,13 +437,24 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
> > > >  {
> > > >         int ret = 0;
> > > >         unsigned int irq_status;
> > > > +       struct venc_frame_info frame_info;
> > > >
> > > >         mtk_vcodec_debug_enter(inst);
> > > > -
> > > > +       /* Overflowing back to 0 is ok and expected here */
> > > > +       inst->frm_cnt++;
> > > > +       mtk_vcodec_debug(inst, "frm_cnt++ = %d\n ", inst->frm_cnt);
> > > > +       frame_info.frm_cnt = inst->frm_cnt;
> > > > +       frame_info.skip_frm_cnt = inst->skip_frm_cnt;
> > > > +       frame_info.frm_type = h264_frame_type(inst);
> > >
> > > Ditto: Is this chunk related to the new support,
> > > or is this addressing some current issue?
> >
> > I will need to re-read this part to understand which one it is, but
> > will split the patch if it turns out to make sense.

frame_info is introduced by this patch, so I think this block belongs here.

> >
> > >
> > > > +       mtk_vcodec_debug(inst, "frm_cnt++ = %d,skip_frm_cnt =%d,frm_type=%d.\n",
> > > > +               frame_info.frm_cnt, frame_info.skip_frm_cnt,
> > > > +               frame_info.frm_type);
> > > >         ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
> > > > -                            bs_buf, bs_size);
> > > > -       if (ret)
> > > > +                            bs_buf, bs_size, &frame_info);
> > > > +       if (ret) {
> > > > +               inst->frm_cnt--;
> > > >                 return ret;
> > > > +       }
> > > >
> > > >         /*
> > > >          * skip frame case: The skip frame buffer is composed by vpu side only,
> > > > @@ -427,19 +465,19 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
> > > >                 memcpy(bs_buf->va,
> > > >                        inst->work_bufs[VENC_H264_VPU_WORK_BUF_SKIP_FRAME].va,
> > > >                        *bs_size);
> > > > -               ++inst->frm_cnt;
> > > > +               ++inst->skip_frm_cnt;
> > > >                 return ret;
> > > >         }
> > > >
> > > >         irq_status = h264_enc_wait_venc_done(inst);
> > > >         if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
> > > >                 mtk_vcodec_err(inst, "irq_status=%d failed", irq_status);
> > > > +               inst->frm_cnt--;
> > > >                 return -EIO;
> > > >         }
> > > >
> > > >         *bs_size = h264_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> > > >
> > > > -       ++inst->frm_cnt;
> > > >         mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
> > > >                          inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
> > > >
> > > > @@ -464,6 +502,7 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
> > > >
> > > >  static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
> > > >  {
> > > > +       const bool is_ext = ctx->dev->venc_pdata->uses_ext;
> > > >         int ret = 0;
> > > >         struct venc_h264_inst *inst;
> > > >
> > > > @@ -473,8 +512,9 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
> > > >
> > > >         inst->ctx = ctx;
> > > >         inst->vpu_inst.ctx = ctx;
> > > > -       inst->vpu_inst.id = IPI_VENC_H264;
> > > > +       inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> > > >         inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
> > > > +       inst->frm_cnt = 0xffffffff;
> > > >
> > > >         mtk_vcodec_debug_enter(inst);
> > > >
> > > > @@ -629,7 +669,12 @@ static int h264_enc_set_param(void *handle,
> > > >                 inst->prepend_hdr = 1;
> > > >                 mtk_vcodec_debug(inst, "set prepend header mode");
> > > >                 break;
> > > > -
> > > > +       case VENC_SET_PARAM_FORCE_INTRA:
> > > > +       case VENC_SET_PARAM_GOP_SIZE:
> > > > +       case VENC_SET_PARAM_INTRA_PERIOD:
> > > > +               inst->frm_cnt = 0xffffffff;
> > > > +               inst->skip_frm_cnt = 0;
> > > > +               fallthrough;
> > > >         default:
> > > >                 ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
> > > >                 break;
> > > > diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > > > index 6426af514526..11abb191ada5 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> > > > @@ -302,7 +302,8 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
> > > >
> > > >         mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
> > > >
> > > > -       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size);
> > > > +       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
> > > > +                            NULL);
> > > >         if (ret)
> > > >                 return ret;
> > > >
> > > > diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> > > > index 52fc9cc812fc..51b52625ca22 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> > > > +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> > > > @@ -92,6 +92,12 @@ struct venc_enc_param {
> > > >         unsigned int gop_size;
> > > >  };
> > > >
> > >
> > > How about a comment here documenting this struct?
> >
> > Will comment if I can figure out what it is useful for. :)
> >
> > >
> > > > +struct venc_frame_info {
> > > > +       unsigned int frm_cnt;           /* per frame update */
> > > > +       unsigned int skip_frm_cnt;      /* per frame update */
> > >
> > > I'd go for s/cnt/count, it's just 2 bytes
> > > and in the long run it'll make our life easier.
> >
> > Ack.
> >
> > >
> > > > +       unsigned int frm_type;          /* per frame update */
> > > > +};
> > > > +
> > > >  /*
> > > >   * struct venc_frm_buf - frame buffer information used in venc_if_encode()
> > > >   * @fb_addr: plane frame buffer addresses
> > > > diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> > > > index 28ee04ca6241..4cafbf92d9cd 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> > > > +++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> > > > @@ -51,17 +51,22 @@ struct venc_ap_ipi_msg_init {
> > > >   * @vpu_inst_addr:     VPU encoder instance addr
> > > >   *                     (struct venc_vp8_vsi/venc_h264_vsi *)
> > > >   * @param_id:  parameter id (venc_set_param_type)
> > > > - * @data_item: number of items in the data array
> > > > + * @num_data:  number of items in the data array
> > > >   * @data[8]:   data array to store the set parameters
> > > >   */
> > > >  struct venc_ap_ipi_msg_set_param {
> > > >         uint32_t msg_id;
> > > >         uint32_t vpu_inst_addr;
> > > >         uint32_t param_id;
> > > > -       uint32_t data_item;
> > > > +       uint32_t num_data;
> > >
> > > This change looks either out of place, or unneeded.
> > > Or I'm missing something.
> >
> > Yeah, it's just renaming this member to something that makes more
> > sense, "data_item" bringing absolutely no information about what this
> > does. Will make an extra patch for it.
> >
> > >
> > > >         uint32_t data[8];
> > > >  };
> > > >
> > > > +struct venc_ap_ipi_msg_set_param_ext {
> > > > +       struct venc_ap_ipi_msg_set_param base;
> > > > +       uint32_t data_ext[24];
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct venc_ap_ipi_msg_enc - AP to VPU enc cmd structure
> > > >   * @msg_id:    message id (AP_IPIMSG_XXX_ENC_ENCODE)
> > > > @@ -82,6 +87,12 @@ struct venc_ap_ipi_msg_enc {
> > > >         uint32_t bs_size;
> > > >  };
> > > >
> > >
> > > Ditto.
> >
> > Ditto what? :) There is no code change right here.
> >
>
> Oh, sorry. I meant: same feedback about adding a comment
> to the structure.
>
> > >
> > > > +struct venc_ap_ipi_msg_enc_ext {
> > > > +       struct venc_ap_ipi_msg_enc base;
> > > > +       uint32_t data_item;
> > > > +       uint32_t data[32];
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct venc_ap_ipi_msg_deinit - AP to VPU deinit cmd structure
> > > >   * @msg_id:    message id (AP_IPIMSG_XXX_ENC_DEINIT)
> > > > diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> > > > index 53854127814b..6c77bf025172 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> > > > @@ -116,49 +116,81 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static unsigned int venc_enc_param_crop_right(struct venc_vpu_inst *vpu,
> > > > +                                             struct venc_enc_param *enc_prm)
> > > > +{
> > > > +       unsigned int img_crop_right = enc_prm->buf_width - enc_prm->width;
> > > > +
> > > > +       return img_crop_right % 16;
> > > > +}
> > > > +
> > > > +static unsigned int venc_enc_param_crop_bottom(struct venc_enc_param *enc_prm)
> > > > +{
> > > > +       return round_up(enc_prm->height, 16) - enc_prm->height;
> > > > +}
> > > > +
> > > > +static unsigned int venc_enc_param_num_mb(struct venc_enc_param *enc_prm)
> > > > +{
> > > > +       return DIV_ROUND_UP(enc_prm->width, 16) *
> > > > +              DIV_ROUND_UP(enc_prm->height, 16);
> > >
> > > ^^^^
> > > You could define the macroblock size in a macro and
> > > use it in these various places.
> >
> > Ack.
> >
> > >
> > > > +}
> > > > +
> > > >  int vpu_enc_set_param(struct venc_vpu_inst *vpu,
> > > >                       enum venc_set_param_type id,
> > > >                       struct venc_enc_param *enc_param)
> > > >  {
> > > > -       struct venc_ap_ipi_msg_set_param out;
> > > > +       const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> > > > +       size_t msg_size = is_ext ?
> > >
> > > How about you use vpu->id to check for is_ext?
> >
> > Unfortunately vpu->id can be assigned an ipi_id or scp_ipi_id, which
> > are two different namespaces and which values can thus collide. So we
> > cannot use ID for this.
> >
> > >
> > > I feel like querying the "is_ext" property like this
> > > is a layering violation.
> > >
> > > Or maybe better some firmware interface type
> > > should be set in struct venc_vpu_inst,
> > > so the venc_vpu_if driver is aware of its own type.
> >
> > "is_ext" refers to whether the firmware uses an extended version of
> > the protocol to communicate, so using it here seems to be in place.
>
> Hm, maybe my comment wasn't really clear. I was trying
> to point out that both venc_h264_if.c and venc_vpu_if.c
> are using ctx->dev->venc_pdata->uses_ext to get
> the "is_ext".
>
> I.e. I would imagine it's cleaner to:
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index 050787b2896c..1ad25b59356a 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -513,6 +513,7 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
>         inst->ctx = ctx;
>         inst->vpu_inst.ctx = ctx;
>         inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +       inst->vpu_inst.is_ext = is_ext;
>         inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
>         inst->frm_cnt = 0xffffffff;
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index 472503701003..137453d66d8e 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -160,7 +160,7 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>                       enum venc_set_param_type id,
>                       struct venc_enc_param *enc_param)
>  {
> -       const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> +       const bool is_ext = vpu->is_ext;
>         size_t msg_size = is_ext ?
>                 sizeof(struct venc_ap_ipi_msg_set_param_ext) :
>                 sizeof(struct venc_ap_ipi_msg_set_param);
> @@ -228,7 +228,7 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu,
> unsigned int bs_mode,
>                    unsigned int *bs_size,
>                    struct venc_frame_info *frame_info)
>  {
> -       const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> +       const bool is_ext = vpu->is_ext;
>         size_t msg_size = is_ext ?
>                 sizeof(struct venc_ap_ipi_msg_enc_ext) :
>                 sizeof(struct venc_ap_ipi_msg_enc);
>
> IMHO, this makes the structure cleaner, but
> possibly this is just bikeshedding, so feel free to ignore.

Ah, I see now. Well it certainly makes the data more accessible, on
the other hand it also duplicates the same information in different
places. In this case this is not a problem since it doesn't change at
runtime, but as a matter of principle I prefer to avoid such
duplication, lest I acquire the habit of doing it in less safe
contexts. :) However if we want to improve legibility I think a macro
would be a good fit.
