Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF393BCB47
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhGFLDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbhGFLDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:34 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B65C061760
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:00:55 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id b18so829575ilf.8
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mf1V7YBSH0+8w/rbv+rSEQ/3yayHw9nqaQvqX58hsvw=;
        b=Mwluy9OSv9pZApWbLchbl6PRMI+pLr/JEGuuPBMJqtHNX5qBYpBYXSu8ehRp0I13Ko
         VBnBg1714BD4gYCQu9Vx1kN5uzs5CnOyjy3RbuiIl7ftNTZpht73dIei2KlktRQ8fRUQ
         P6W2vGPS8rqim7p2BtKEGPz/Vl1VWXhB52nbS6h8/Ymqc8apj+hS6CR+W4OpjBn6bY2G
         sn08YhYH9WlmPKXavGRxBJRgUGDKBNO/Wiumdto8z6t8ox6nHOBEWOGIouWsDk1ph4ve
         5ECczqd+yWPUkNb+S+K5N5Gc0Ac54nw2A0ObdV/8vYZTWOItI1nZLgWchj2epOu2tVjO
         P3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mf1V7YBSH0+8w/rbv+rSEQ/3yayHw9nqaQvqX58hsvw=;
        b=Ejmo+RoDhYtifY+jmwqoKDADlfKPdimQdu4Ly2zJXvjBXghr5uv90t3RkBzXKflMkV
         rQY+NWsnWEp4V4m97S0/xftsOQYMSNRR/x4AKNvoMbdVQe13zMp001IsWDrkPduDAE8P
         GB1TxIxc8utDDts8rZoY/1QwSSHrSta/DzGFeE38PPm6HFSk72goKYM2rvWayf+RcLiY
         8G7RhxT7rS1DS9C5ktXuJOrJecuKheDHwF0y9ittVJzRgAKcyFxVJF6F4nlrt8O8Yx/6
         fjGTBMPSCH2YFD1snwMiG4LYHLwobOzHSvoeZwpqietIez3kJIAmcqvFpA2I2Yes0ou2
         0Wew==
X-Gm-Message-State: AOAM532lFy/HfT83GTAA6h2aYaoh1/LFojfRNqB+SzQuu3GbAk88Gvc3
        1bdA3T5uS1fQEuEAfk3mHSOYYabVyS5r+agitMKwUw==
X-Google-Smtp-Source: ABdhPJxuFDnjDo6bNOl1cUk7qCNSdqyn0JG/dKa+dgAOq9yGktXZ8eP3bmILJYjEVsjAlyHZqWFmJg+GneOpnPEdI2k=
X-Received: by 2002:a05:6e02:1a2a:: with SMTP id g10mr12177660ile.204.1625569254711;
 Tue, 06 Jul 2021 04:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com> <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:43 +0800
Message-ID: <CA+Px+wVLtRWsqZ3Nbd5rPrh_4dScay6BhPLCwjQaCkU8F5McuA@mail.gmail.com>
Subject: Re: [PATCH v2, 5/9] media: mtk-jpegenc: Generalize jpeg encode irq interfaces
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
> Generalizes jpeg encode irq interfaces to support different hardware.
There are some missing pieces for using the code.  I guess the patch
needs to be submitted with other patches or needs to further be
divided.

> + * mtk_jpeg_enc_param:  General jpeg encoding parameters
> + * @enc_w:             image width
> + * @enc_h:             image height
> + * @enable_exif:       EXIF enable for jpeg encode mode
> + * @enc_quality:       destination image quality in encode mode
> + * @enc_format:                input image format
> + * @restart_interval:  JPEG restart interval for JPEG encoding
> + * @img_stride:                jpeg encoder image stride
> + * @mem_stride:                jpeg encoder memory stride
> + * @total_encdu:       total 8x8 block number
They are not well-aligned.

> +struct mtk_jpeg_enc_param {
> +       u32 enc_w;
> +       u32 enc_h;
> +       u32 enable_exif;
> +       u32 enc_quality;
> +       u32 enc_format;
> +       u32 restart_interval;
> +       u32 img_stride;
> +       u32 mem_stride;
> +       u32 total_encdu;
> +};
They are not used.

> +       u32 bs_size;
> +       int flags;
They are not used.

> +       struct mtk_jpeg_enc_param enc_param;
> +       struct mtk_jpeg_ctx *curr_ctx;
They are not used.

> +void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
> +{
> +       struct mtk_jpeg_ctx *ctx;
> +       struct vb2_v4l2_buffer *dst_buffer;
> +       struct list_head *temp_entry;
> +       struct list_head *pos;
> +       struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
> +       unsigned long flags;
> +
> +       ctx = jpeg->hw_param.curr_ctx;
> +       if (!ctx) {
> +               dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
> +               return;
> +       }
> +
> +       dst_buffer = jpeg->hw_param.dst_buffer;
> +       if (!dst_buffer) {
> +               dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
> +               return;
> +       }
The caller "mtk_jpegenc_hw_irq_handler()" doesn't even check ctx and
dst_buffer.  Does mtk_jpeg_put_buf() need to validate them?

> +       spin_lock_irqsave(&ctx->done_queue_lock, flags);
> +       list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
> +       while (!list_empty(&ctx->dst_done_queue) &&
> +              (pos != &ctx->dst_done_queue)) {
Why does it need to compare `pos != &ctx->dst_done_queue`?  On a
related note, at the first time, pos will be some garbage data from
stack.

> +irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
No code is using mtk_jpegenc_hw_irq_handler.  Have no enough context
to review the code.

> +       src_buf = jpeg->hw_param.src_buffer;
> +       dst_buf = jpeg->hw_param.dst_buffer;
> +       ctx = jpeg->hw_param.curr_ctx;
> +       master_jpeg = ctx->jpeg;
Could they be inlined to above where the variables are declared?

> +enum mtk_jpeg_hw_state {
> +       MTK_JPEG_HW_IDLE = 0,
> +       MTK_JPEG_HW_BUSY = 1,
MTK_JPEG_HW_BUSY is not used.

> @@ -124,13 +135,18 @@ struct mtk_jpeg_dev {
>         struct v4l2_m2m_dev     *m2m_dev;
>         void                    *alloc_ctx;
>         struct video_device     *vdev;
> -       void __iomem            *reg_base;
>         struct device           *larb;
>         struct delayed_work job_timeout_work;
>         const struct mtk_jpeg_variant *variant;
>
> +       void __iomem *reg_base[MTK_JPEGENC_HW_MAX];
> +       int jpegenc_irq;
jpegenc_irq is not used.

> @@ -189,6 +205,12 @@ struct mtk_jpeg_ctx {
>         u8 enc_quality;
>         u8 restart_interval;
>         struct v4l2_ctrl_handler ctrl_hdl;
> +
> +       struct list_head dst_done_queue;
> +       spinlock_t done_queue_lock;     /* spinlock protecting done queue */
> +       u32 total_frame_num;
total_frame_num is not used.


Need to double confirm: why sometimes the code uses
jpeg->reg_base[MTK_JPEGENC_HW0] but sometimes jpeg->reg_base[0]?
