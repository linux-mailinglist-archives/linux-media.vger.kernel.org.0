Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1235322D05B
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 23:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGXVNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 17:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgGXVNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 17:13:44 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD34C0619E5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 14:13:44 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l4so11247807ejd.13
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFm7DNfbGLvYjSv9x07Vaji51K1GDU8U2+TQceYuWyI=;
        b=NNyViJ/wQjwFw6LJki3EHMdoQI5nOf/jmGvvyFEInwOTHijQpVL81V9s6lEWnMwQTg
         8Xe8Wb7pwEtBOUB2URXFzarRMxNxHY9riLZmIpL3uuambz8C7WXQ1l6rnKy35h4/aszs
         dtCR9kT3+j8D6BuVkxB4ahxFjsYHlNWrysmUs2aX445bVvmLhf0fyvM7DixBEva/b0Gg
         8GQK8UWM13w1dOLUt5E11HAptzq4pHv5ck1izBX33E9JOac87tKV7jD0uAt3UmcqMlia
         WRxVa7IbYYGhlb0l3Tsp7BEn23Lo0g2Ajiu2Emio0EQSoV0/lQ0H18KaDzzAxN942W6v
         R6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFm7DNfbGLvYjSv9x07Vaji51K1GDU8U2+TQceYuWyI=;
        b=GTJ0KV9co+cfwi5f2Fdv3kzxpUDAQGv4H3Zpa2ExZi+DivauUhEoFFInajaSDUN4l5
         uQDXrD1Qk3l7zh1WFDcTMRCySjteFEf7ElUTUOYK5UzEVmjhbVqepP8MK0DfAQALMgWh
         eqz8xqSdSSj1M5P3ZHw5FxXnY4AHAFlj++jF+jOlEGLRiv+3SLm9LgZ1ipxEhPBpfSTN
         CRhZLQ64oSjk609eHGyGguypaDvHiB0pgZP1ABvj0iJAVe7JdNJpMjjGN2HI6CeW0Hyf
         HJRONfbl7LvN30PfeGQ5Mp9dDML5w9/Fgi8GJdetTKnjqI218976nq0J/XYJw8y5F7p6
         oR+w==
X-Gm-Message-State: AOAM531U2H03f8IRTwgO96RImvcvWpdf5QjKw/utmXGm06LBMQ0fVhMs
        qvp6BrD9BmQCHx/x14yJ/3qAQ696uEuUvn8LTFXytg==
X-Google-Smtp-Source: ABdhPJwT5ZxWfpewutr7CWB3WbbmW1spFkYOdERY8K/4TVL5l8PLNs9YmrNRPI/h1K/HcRUNTC6lidITiWhN4RIc5YI=
X-Received: by 2002:a17:907:10d4:: with SMTP id rv20mr11381279ejb.413.1595625222487;
 Fri, 24 Jul 2020 14:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org> <20200713060842.471356-5-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-5-acourbot@chromium.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 24 Jul 2020 18:13:30 -0300
Message-ID: <CAAEAJfDrF_3Ys_9emvNsiwYV5pSfnLis=PoxSGeeKEWW3RE5yg@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] media: mtk-vcodec: venc: support SCP firmware
To:     Alexandre Courbot <acourbot@chromium.org>
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

Hi Alexandre,

I'm slowly making progress on the series. Here's some more comments.

On Mon, 13 Jul 2020 at 03:10, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Support the new extended firmware used by MT8183's encoder.
>

If you could add some more information about the MT8183 encoder
and the extended firmware interface, it would make the review
easier.

Some comments below, I have no idea how this hardware
works, so maybe I won't make sense :-)

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 12 +++
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 34 ++++---
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   | 65 +++++++++++--
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  3 +-
>  .../media/platform/mtk-vcodec/venc_drv_if.h   |  6 ++
>  .../media/platform/mtk-vcodec/venc_ipi_msg.h  | 15 ++-
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 97 +++++++++++++------
>  .../media/platform/mtk-vcodec/venc_vpu_if.h   |  3 +-
>  8 files changed, 181 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index e132c4ec463a..45c8adfc6a0c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -300,6 +300,17 @@ struct mtk_vcodec_ctx {
>
>  };
>
> +/**
> + * struct mtk_vcodec_enc_pdata - compatible data for each IC
> + *
> + * @uses_ext: whether the encoder uses the extended firmware messaging format
> + * @has_lt_irq: whether the encoder uses the LT irq
> + */
> +struct mtk_vcodec_enc_pdata {
> +       bool uses_ext;
> +       bool has_lt_irq;

Instead of this boolean here, I think it might be cleaner
to have a small array of strings, listing the interrupts
each variant requires.

See drivers/staging/media/hantro/rk3288_vpu_hw.c

It's future-proof and even if you don't plan to see
future works: a) we never know and b) cleaner code,
easier to maintain.

> +};
> +
>  /**
>   * struct mtk_vcodec_dev - driver data
>   * @v4l2_dev: V4L2 device to register video devices for.
> @@ -348,6 +359,7 @@ struct mtk_vcodec_dev {
>         spinlock_t irqlock;
>         struct mtk_vcodec_ctx *curr_ctx;
>         void __iomem *reg_base[NUM_MAX_VCODEC_REG_BASE];
> +       const struct mtk_vcodec_enc_pdata *venc_pdata;
>
>         struct mtk_vcodec_fw *fw_handler;
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 42530cd01a30..922bc8883811 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -244,6 +244,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         if (IS_ERR(dev->fw_handler))
>                 return PTR_ERR(dev->fw_handler);
>
> +       dev->venc_pdata = of_device_get_match_data(&pdev->dev);
>         ret = mtk_vcodec_init_enc_pm(dev);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
> @@ -278,21 +279,24 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 ret = -EINVAL;
>                 goto err_res;
>         }
> +       disable_irq(dev->enc_irq);
>

I am aware this is not an issue with this patch:
requesting an interrupt and then immediately
disabling the interrupt looks racy.

Now, I haven't need this pattern myself,
but from a quick grep I think you want to do:

        irq_set_status_flags(irq, IRQ_NOAUTOEN);
        ret = devm_request_irq(dev, irq, ...

Perhaps something to fix (probably in another patch,
before this one).

> -       dev->enc_lt_irq = platform_get_irq(pdev, 1);
> -       ret = devm_request_irq(&pdev->dev,
> -                              dev->enc_lt_irq, mtk_vcodec_enc_lt_irq_handler,
> -                              0, pdev->name, dev);
> -       if (ret) {
> -               dev_err(&pdev->dev,
> -                       "Failed to install dev->enc_lt_irq %d (%d)",
> -                       dev->enc_lt_irq, ret);
> -               ret = -EINVAL;
> -               goto err_res;
> +       if (dev->venc_pdata->has_lt_irq) {
> +               dev->enc_lt_irq = platform_get_irq(pdev, 1);
> +               ret = devm_request_irq(&pdev->dev,
> +                                      dev->enc_lt_irq,
> +                                      mtk_vcodec_enc_lt_irq_handler,
> +                                      0, pdev->name, dev);
> +               if (ret) {
> +                       dev_err(&pdev->dev,
> +                               "Failed to install dev->enc_lt_irq %d (%d)",
> +                               dev->enc_lt_irq, ret);
> +                       ret = -EINVAL;
> +                       goto err_res;
> +               }
> +               disable_irq(dev->enc_lt_irq); /* VENC_LT */
>         }
>
> -       disable_irq(dev->enc_irq);
> -       disable_irq(dev->enc_lt_irq); /* VENC_LT */
>         mutex_init(&dev->enc_mutex);
>         mutex_init(&dev->dev_mutex);
>         spin_lock_init(&dev->irqlock);
> @@ -373,8 +377,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> +static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> +       .has_lt_irq = true,
> +};
> +
>  static const struct of_device_id mtk_vcodec_enc_match[] = {
> -       {.compatible = "mediatek,mt8173-vcodec-enc",},
> +       {.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index 7a00f050ec36..050787b2896c 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -24,6 +24,16 @@ static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
>  #define H264_FILLER_MARKER_SIZE ARRAY_SIZE(h264_filler_marker)
>  #define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
>
> +/*
> + * enum venc_h264_frame_type - h264 encoder output bitstream frame type
> + */
> +enum venc_h264_frame_type {
> +       VENC_H264_IDR_FRM,
> +       VENC_H264_I_FRM,
> +       VENC_H264_P_FRM,
> +       VENC_H264_B_FRM,
> +};
> +
>  /*
>   * enum venc_h264_vpu_work_buf - h264 encoder buffer index
>   */
> @@ -137,7 +147,8 @@ struct venc_h264_inst {
>         struct mtk_vcodec_mem work_bufs[VENC_H264_VPU_WORK_BUF_MAX];
>         struct mtk_vcodec_mem pps_buf;
>         bool work_buf_allocated;
> -       unsigned int frm_cnt;
> +       u32 frm_cnt;    /* declared as u32 to properly overflow */

This looks like it's fixing some issue not related to the 8183
or the extended firmware. Perhaps you can add a
more details comment?

> +       unsigned int skip_frm_cnt;
>         unsigned int prepend_hdr;
>         struct venc_vpu_inst vpu_inst;
>         struct venc_h264_vsi *vsi;
> @@ -327,6 +338,22 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
>         return irq_status;
>  }
>
> +static int h264_frame_type(struct venc_h264_inst *inst)
> +{
> +       if ((inst->vsi->config.gop_size != 0 &&
> +               (inst->frm_cnt % inst->vsi->config.gop_size) == 0) ||
> +               (inst->frm_cnt == 0 && inst->vsi->config.gop_size == 0)) {
> +               /* IDR frame */
> +               return VENC_H264_IDR_FRM;
> +       } else if ((inst->vsi->config.intra_period != 0 &&
> +               (inst->frm_cnt % inst->vsi->config.intra_period) == 0) ||
> +               (inst->frm_cnt == 0 && inst->vsi->config.intra_period == 0)) {
> +               /* I frame */
> +               return VENC_H264_I_FRM;
> +       } else {
> +               return VENC_H264_P_FRM;  /* Note: B frames are not supported */
> +       }
> +}
>  static int h264_encode_sps(struct venc_h264_inst *inst,
>                            struct mtk_vcodec_mem *bs_buf,
>                            unsigned int *bs_size)
> @@ -337,7 +364,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
>         mtk_vcodec_debug_enter(inst);
>
>         ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
> -                            bs_buf, bs_size);
> +                            bs_buf, bs_size, NULL);
>         if (ret)
>                 return ret;
>
> @@ -364,7 +391,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
>         mtk_vcodec_debug_enter(inst);
>
>         ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
> -                            bs_buf, bs_size);
> +                            bs_buf, bs_size, NULL);
>         if (ret)
>                 return ret;
>
> @@ -410,13 +437,24 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>  {
>         int ret = 0;
>         unsigned int irq_status;
> +       struct venc_frame_info frame_info;
>
>         mtk_vcodec_debug_enter(inst);
> -
> +       /* Overflowing back to 0 is ok and expected here */
> +       inst->frm_cnt++;
> +       mtk_vcodec_debug(inst, "frm_cnt++ = %d\n ", inst->frm_cnt);
> +       frame_info.frm_cnt = inst->frm_cnt;
> +       frame_info.skip_frm_cnt = inst->skip_frm_cnt;
> +       frame_info.frm_type = h264_frame_type(inst);

Ditto: Is this chunk related to the new support,
or is this addressing some current issue?

> +       mtk_vcodec_debug(inst, "frm_cnt++ = %d,skip_frm_cnt =%d,frm_type=%d.\n",
> +               frame_info.frm_cnt, frame_info.skip_frm_cnt,
> +               frame_info.frm_type);
>         ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
> -                            bs_buf, bs_size);
> -       if (ret)
> +                            bs_buf, bs_size, &frame_info);
> +       if (ret) {
> +               inst->frm_cnt--;
>                 return ret;
> +       }
>
>         /*
>          * skip frame case: The skip frame buffer is composed by vpu side only,
> @@ -427,19 +465,19 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>                 memcpy(bs_buf->va,
>                        inst->work_bufs[VENC_H264_VPU_WORK_BUF_SKIP_FRAME].va,
>                        *bs_size);
> -               ++inst->frm_cnt;
> +               ++inst->skip_frm_cnt;
>                 return ret;
>         }
>
>         irq_status = h264_enc_wait_venc_done(inst);
>         if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
>                 mtk_vcodec_err(inst, "irq_status=%d failed", irq_status);
> +               inst->frm_cnt--;
>                 return -EIO;
>         }
>
>         *bs_size = h264_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
>
> -       ++inst->frm_cnt;
>         mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
>                          inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
>
> @@ -464,6 +502,7 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
>
>  static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
>  {
> +       const bool is_ext = ctx->dev->venc_pdata->uses_ext;
>         int ret = 0;
>         struct venc_h264_inst *inst;
>
> @@ -473,8 +512,9 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
>
>         inst->ctx = ctx;
>         inst->vpu_inst.ctx = ctx;
> -       inst->vpu_inst.id = IPI_VENC_H264;
> +       inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
>         inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx, VENC_SYS);
> +       inst->frm_cnt = 0xffffffff;
>
>         mtk_vcodec_debug_enter(inst);
>
> @@ -629,7 +669,12 @@ static int h264_enc_set_param(void *handle,
>                 inst->prepend_hdr = 1;
>                 mtk_vcodec_debug(inst, "set prepend header mode");
>                 break;
> -
> +       case VENC_SET_PARAM_FORCE_INTRA:
> +       case VENC_SET_PARAM_GOP_SIZE:
> +       case VENC_SET_PARAM_INTRA_PERIOD:
> +               inst->frm_cnt = 0xffffffff;
> +               inst->skip_frm_cnt = 0;
> +               fallthrough;
>         default:
>                 ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
>                 break;
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 6426af514526..11abb191ada5 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -302,7 +302,8 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
>
>         mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size);
> +       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
> +                            NULL);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> index 52fc9cc812fc..51b52625ca22 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
> @@ -92,6 +92,12 @@ struct venc_enc_param {
>         unsigned int gop_size;
>  };
>

How about a comment here documenting this struct?

> +struct venc_frame_info {
> +       unsigned int frm_cnt;           /* per frame update */
> +       unsigned int skip_frm_cnt;      /* per frame update */

I'd go for s/cnt/count, it's just 2 bytes
and in the long run it'll make our life easier.

> +       unsigned int frm_type;          /* per frame update */
> +};
> +
>  /*
>   * struct venc_frm_buf - frame buffer information used in venc_if_encode()
>   * @fb_addr: plane frame buffer addresses
> diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> index 28ee04ca6241..4cafbf92d9cd 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> @@ -51,17 +51,22 @@ struct venc_ap_ipi_msg_init {
>   * @vpu_inst_addr:     VPU encoder instance addr
>   *                     (struct venc_vp8_vsi/venc_h264_vsi *)
>   * @param_id:  parameter id (venc_set_param_type)
> - * @data_item: number of items in the data array
> + * @num_data:  number of items in the data array
>   * @data[8]:   data array to store the set parameters
>   */
>  struct venc_ap_ipi_msg_set_param {
>         uint32_t msg_id;
>         uint32_t vpu_inst_addr;
>         uint32_t param_id;
> -       uint32_t data_item;
> +       uint32_t num_data;

This change looks either out of place, or unneeded.
Or I'm missing something.

>         uint32_t data[8];
>  };
>
> +struct venc_ap_ipi_msg_set_param_ext {
> +       struct venc_ap_ipi_msg_set_param base;
> +       uint32_t data_ext[24];
> +};
> +
>  /**
>   * struct venc_ap_ipi_msg_enc - AP to VPU enc cmd structure
>   * @msg_id:    message id (AP_IPIMSG_XXX_ENC_ENCODE)
> @@ -82,6 +87,12 @@ struct venc_ap_ipi_msg_enc {
>         uint32_t bs_size;
>  };
>

Ditto.

> +struct venc_ap_ipi_msg_enc_ext {
> +       struct venc_ap_ipi_msg_enc base;
> +       uint32_t data_item;
> +       uint32_t data[32];
> +};
> +
>  /**
>   * struct venc_ap_ipi_msg_deinit - AP to VPU deinit cmd structure
>   * @msg_id:    message id (AP_IPIMSG_XXX_ENC_DEINIT)
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index 53854127814b..6c77bf025172 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -116,49 +116,81 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
>         return 0;
>  }
>
> +static unsigned int venc_enc_param_crop_right(struct venc_vpu_inst *vpu,
> +                                             struct venc_enc_param *enc_prm)
> +{
> +       unsigned int img_crop_right = enc_prm->buf_width - enc_prm->width;
> +
> +       return img_crop_right % 16;
> +}
> +
> +static unsigned int venc_enc_param_crop_bottom(struct venc_enc_param *enc_prm)
> +{
> +       return round_up(enc_prm->height, 16) - enc_prm->height;
> +}
> +
> +static unsigned int venc_enc_param_num_mb(struct venc_enc_param *enc_prm)
> +{
> +       return DIV_ROUND_UP(enc_prm->width, 16) *
> +              DIV_ROUND_UP(enc_prm->height, 16);

^^^^
You could define the macroblock size in a macro and
use it in these various places.

> +}
> +
>  int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>                       enum venc_set_param_type id,
>                       struct venc_enc_param *enc_param)
>  {
> -       struct venc_ap_ipi_msg_set_param out;
> +       const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> +       size_t msg_size = is_ext ?

How about you use vpu->id to check for is_ext?

I feel like querying the "is_ext" property like this
is a layering violation.

Or maybe better some firmware interface type
should be set in struct venc_vpu_inst,
so the venc_vpu_if driver is aware of its own type.

Hopefully I'm making sense :-)

> +               sizeof(struct venc_ap_ipi_msg_set_param_ext) :
> +               sizeof(struct venc_ap_ipi_msg_set_param);
> +       struct venc_ap_ipi_msg_set_param_ext out;
>
>         mtk_vcodec_debug(vpu, "id %d ->", id);
>
>         memset(&out, 0, sizeof(out));
> -       out.msg_id = AP_IPIMSG_ENC_SET_PARAM;
> -       out.vpu_inst_addr = vpu->inst_addr;
> -       out.param_id = id;
> +       out.base.msg_id = AP_IPIMSG_ENC_SET_PARAM;
> +       out.base.vpu_inst_addr = vpu->inst_addr;
> +       out.base.param_id = id;
>         switch (id) {
>         case VENC_SET_PARAM_ENC:
> -               out.data_item = 0;
> +               if (is_ext) {
> +                       out.base.num_data = 3;
> +                       out.base.data[0] =
> +                               venc_enc_param_crop_right(vpu, enc_param);
> +                       out.base.data[1] =
> +                               venc_enc_param_crop_bottom(enc_param);
> +                       out.base.data[2] = venc_enc_param_num_mb(enc_param);
> +               } else {
> +                       out.base.num_data = 0;
> +               }
>                 break;
>         case VENC_SET_PARAM_FORCE_INTRA:
> -               out.data_item = 0;
> +               out.base.num_data = 0;
>                 break;
>         case VENC_SET_PARAM_ADJUST_BITRATE:
> -               out.data_item = 1;
> -               out.data[0] = enc_param->bitrate;
> +               out.base.num_data = 1;
> +               out.base.data[0] = enc_param->bitrate;
>                 break;
>         case VENC_SET_PARAM_ADJUST_FRAMERATE:
> -               out.data_item = 1;
> -               out.data[0] = enc_param->frm_rate;
> +               out.base.num_data = 1;
> +               out.base.data[0] = enc_param->frm_rate;
>                 break;
>         case VENC_SET_PARAM_GOP_SIZE:
> -               out.data_item = 1;
> -               out.data[0] = enc_param->gop_size;
> +               out.base.num_data = 1;
> +               out.base.data[0] = enc_param->gop_size;
>                 break;
>         case VENC_SET_PARAM_INTRA_PERIOD:
> -               out.data_item = 1;
> -               out.data[0] = enc_param->intra_period;
> +               out.base.num_data = 1;
> +               out.base.data[0] = enc_param->intra_period;
>                 break;
>         case VENC_SET_PARAM_SKIP_FRAME:
> -               out.data_item = 0;
> +               out.base.num_data = 0;
>                 break;
>         default:
>                 mtk_vcodec_err(vpu, "id %d not supported", id);
>                 return -EINVAL;
>         }
> -       if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> +       if (vpu_enc_send_msg(vpu, &out, msg_size)) {
>                 mtk_vcodec_err(vpu,
>                                "AP_IPIMSG_ENC_SET_PARAM %d fail", id);
>                 return -EINVAL;
> @@ -172,33 +204,44 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>                    struct venc_frm_buf *frm_buf,
>                    struct mtk_vcodec_mem *bs_buf,
> -                  unsigned int *bs_size)
> +                  unsigned int *bs_size,
> +                  struct venc_frame_info *frame_info)
>  {
> -       struct venc_ap_ipi_msg_enc out;
> +       const bool is_ext = vpu->ctx->dev->venc_pdata->uses_ext;
> +       size_t msg_size = is_ext ?
> +               sizeof(struct venc_ap_ipi_msg_enc_ext) :
> +               sizeof(struct venc_ap_ipi_msg_enc);
> +       struct venc_ap_ipi_msg_enc_ext out;
>
>         mtk_vcodec_debug(vpu, "bs_mode %d ->", bs_mode);
>
>         memset(&out, 0, sizeof(out));
> -       out.msg_id = AP_IPIMSG_ENC_ENCODE;
> -       out.vpu_inst_addr = vpu->inst_addr;
> -       out.bs_mode = bs_mode;
> +       out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
> +       out.base.vpu_inst_addr = vpu->inst_addr;
> +       out.base.bs_mode = bs_mode;
>         if (frm_buf) {
>                 if ((frm_buf->fb_addr[0].dma_addr % 16 == 0) &&
>                     (frm_buf->fb_addr[1].dma_addr % 16 == 0) &&
>                     (frm_buf->fb_addr[2].dma_addr % 16 == 0)) {
> -                       out.input_addr[0] = frm_buf->fb_addr[0].dma_addr;
> -                       out.input_addr[1] = frm_buf->fb_addr[1].dma_addr;
> -                       out.input_addr[2] = frm_buf->fb_addr[2].dma_addr;
> +                       out.base.input_addr[0] = frm_buf->fb_addr[0].dma_addr;
> +                       out.base.input_addr[1] = frm_buf->fb_addr[1].dma_addr;
> +                       out.base.input_addr[2] = frm_buf->fb_addr[2].dma_addr;
>                 } else {
>                         mtk_vcodec_err(vpu, "dma_addr not align to 16");
>                         return -EINVAL;
>                 }
>         }
>         if (bs_buf) {
> -               out.bs_addr = bs_buf->dma_addr;
> -               out.bs_size = bs_buf->size;
> +               out.base.bs_addr = bs_buf->dma_addr;
> +               out.base.bs_size = bs_buf->size;
>         }
> -       if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> +       if (is_ext && frame_info) {
> +               out.data_item = 3;
> +               out.data[0] = frame_info->frm_cnt;
> +               out.data[1] = frame_info->skip_frm_cnt;
> +               out.data[2] = frame_info->frm_type;
> +       }
> +       if (vpu_enc_send_msg(vpu, &out, msg_size)) {
>                 mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_ENCODE %d fail",
>                                bs_mode);
>                 return -EINVAL;
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> index edd411621b68..f9be9cab7ff7 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> @@ -45,7 +45,8 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>                    struct venc_frm_buf *frm_buf,
>                    struct mtk_vcodec_mem *bs_buf,
> -                  unsigned int *bs_size);
> +                  unsigned int *bs_size,
> +                  struct venc_frame_info *frame_info);
>  int vpu_enc_deinit(struct venc_vpu_inst *vpu);
>
>  #endif
> --
> 2.27.0.383.g050319c2ae-goog
>
