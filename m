Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D463C2220
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 12:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhGIKXk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 06:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbhGIKXk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 06:23:40 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3E9C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 03:20:57 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id s18so9495638pgg.8
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FpZZVvO/nqb5+3oq9ec1RZs4zl93sjUHtLVOS9XVNco=;
        b=Cufjm1yAewSQLxOhIhzNavEnMkLUr/zNSMm49SdFTfiNx9D8Ad8t5V1t/lHDiMnIS3
         ETUwMaeD8Lg/KEml+jIXDcXtQSesgwZ1fXW2P1eAxOIJCT2gOCQo8m/f7B1es48S7SY6
         T+00VIZrkFu9hlpED7veXs8sp6GOHjPy2inqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FpZZVvO/nqb5+3oq9ec1RZs4zl93sjUHtLVOS9XVNco=;
        b=XNpmORnymds1egbOe+NvWmHqctzXnA6sO6ZwWzbVoXaVWWmybD+xHjGfMMq8lvbUeD
         lnSNsZHgHkS3SnSrMJdfyVCBmiU3tKp7dEwQquRtXs3TlVYt4lQIW7MogDb8R8xY0d6r
         IglPj/Lckw+gWYHV1VD3RrDDuH6QxjLpcJmebeGpEWfAos4dC2+cVbOwe6vehMsp7YGX
         XItd6LoczI/o+Qqo54v70QJsBQYAsGH0Ut1Lgqe8q9KzsNJnHix5c+I9LH7PPLD3Cl8m
         owacgHtN34dhjZmUcAJ4Qaod9ueOV5qD6ksbiFFq3Uso3BO7sr55eV/Dq6t16h7KKkIu
         7IvA==
X-Gm-Message-State: AOAM530FpL6X62ZF1oZb4KaT8ay4XOiGD+q97wna48/nEpSCIl1OUx5T
        H2YGHFi8uWb0D7wFLnOAJaIakQ==
X-Google-Smtp-Source: ABdhPJypdsIj3stZ4AltqJoQravT9m0ETdv//STN8vyZJIT3b7OfP6kVVwXBJDaDpwSjvzLxy/A4aQ==
X-Received: by 2002:a05:6a00:14c4:b029:303:fd5e:3800 with SMTP id w4-20020a056a0014c4b0290303fd5e3800mr37177801pfu.41.1625826056815;
        Fri, 09 Jul 2021 03:20:56 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:735b:c3cc:6957:ae6d])
        by smtp.gmail.com with ESMTPSA id n2sm466041pgt.46.2021.07.09.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 03:20:56 -0700 (PDT)
Date:   Fri, 9 Jul 2021 19:20:52 +0900
From:   Tomasz Figa <tfiga@chromium.org>
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
        linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH v2,5/9] media: mtk-jpegenc: Generalize jpeg encode irq
 interfaces
Message-ID: <YOgjBMFDzkrTZ3yJ@chromium.org>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 03:27:55PM +0800, kyrie.wu wrote:
> Generalizes jpeg encode irq interfaces to support different hardware.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 124 +++++++++++++++++++++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  24 ++++-
>  2 files changed, 146 insertions(+), 2 deletions(-)
> 

This again doesn't look like a refactor, because there is only new code
added.

Also see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 7c053e3..062feab 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -106,10 +106,40 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
>  #define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
>  #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
>  
> +/*
> + * mtk_jpeg_enc_param:  General jpeg encoding parameters
> + * @enc_w:		image width
> + * @enc_h:		image height
> + * @enable_exif:	EXIF enable for jpeg encode mode
> + * @enc_quality:	destination image quality in encode mode
> + * @enc_format:		input image format
> + * @restart_interval:	JPEG restart interval for JPEG encoding
> + * @img_stride:		jpeg encoder image stride
> + * @mem_stride:		jpeg encoder memory stride
> + * @total_encdu:	total 8x8 block number
> + */
> +struct mtk_jpeg_enc_param {
> +	u32 enc_w;
> +	u32 enc_h;
> +	u32 enable_exif;
> +	u32 enc_quality;
> +	u32 enc_format;
> +	u32 restart_interval;
> +	u32 img_stride;
> +	u32 mem_stride;

What is the difference between these two strides?

> +	u32 total_encdu;

Is it really necessary to store this? Isn't it a trivial computation
from width and height.

> +};
> +
>  struct mtk_jpeg_src_buf {
>  	struct vb2_v4l2_buffer b;
>  	struct list_head list;
> +	u32 frame_num;

Isn't this equivalent to the sequence field inside vb2_v4l2_buffer?

> +	u32 bs_size;
> +	int flags;

What are these 2? I don't see them used in the code added by this patch.
Please add new fields in the same patch that adds the code using them.

>  	struct mtk_jpeg_dec_param dec_param;
> +
> +	struct mtk_jpeg_enc_param enc_param;

We can put these two into an union to reduce the size of the struct.

> +	struct mtk_jpeg_ctx *curr_ctx;
>  };
>  
>  static int debug;
> @@ -1163,6 +1193,98 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	return IRQ_HANDLED;
>  }
>  
> +void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
> +{
> +	struct mtk_jpeg_ctx *ctx;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct list_head *temp_entry;
> +	struct list_head *pos;
> +	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;

Wait, is the buffer src or dst?

> +	unsigned long flags;
> +
> +	ctx = jpeg->hw_param.curr_ctx;
> +	if (!ctx) {
> +		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
> +		return;
> +	}
> +
> +	dst_buffer = jpeg->hw_param.dst_buffer;
> +	if (!dst_buffer) {
> +		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");

When can this happen?

> +		return;
> +	}
> +
> +	dst_done_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buffer->vb2_buf);
> +
> +	spin_lock_irqsave(&ctx->done_queue_lock, flags);
> +	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
> +	while (!list_empty(&ctx->dst_done_queue) &&
> +	       (pos != &ctx->dst_done_queue)) {
> +		list_for_each_prev_safe(pos, temp_entry,
> +					(&ctx->dst_done_queue)) {
> +			tmp_dst_done_buf = list_entry(pos,
> +						      struct mtk_jpeg_src_buf,
> +						      list);
> +			if (tmp_dst_done_buf->frame_num ==
> +				ctx->last_done_frame_num) {
> +				list_del(&tmp_dst_done_buf->list);
> +				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> +						  VB2_BUF_STATE_DONE);
> +				ctx->last_done_frame_num++;
> +			}
> +		}
> +	}

Do we need the outer while loop here?

Also, is the prev variant of list_for_each needed here? Wouldn't
list_for_each_entry_safe() be enough?

> +	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> +}
> +
> +irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> +{
> +	struct mtk_jpeg_dev *jpeg = priv;
> +	struct mtk_jpeg_ctx *ctx;
> +	struct mtk_jpeg_dev *master_jpeg;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	u32 result_size;
> +	u32 irq_status;
> +
> +	cancel_delayed_work(&jpeg->job_timeout_work);
> +
> +	src_buf = jpeg->hw_param.src_buffer;
> +	dst_buf = jpeg->hw_param.dst_buffer;
> +	ctx = jpeg->hw_param.curr_ctx;
> +	master_jpeg = ctx->jpeg;
> +	irq_status = readl(jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS) &

Why is this always HW0?

> +		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> +	if (irq_status)
> +		writel(0, jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS);
> +	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE)) {
> +		dev_err(jpeg->dev, "jpeg encode failed !!!\n");
> +		goto irq_end;
> +	}
> +
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base[0]);
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> +
> +	buf_state = VB2_BUF_STATE_DONE;
> +
> +irq_end:
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	mtk_jpeg_put_buf(jpeg);
> +	pm_runtime_put(jpeg->pm.dev);
> +	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);

Shouldn't this be the other way around? I.e. first clock and then
runtime PM? Otherwise the power domain could be powered off while the
clock is still running.

> +	if (ctx->fh.m2m_ctx &&
> +	    (!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
> +	    !list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue))) {
> +		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);

This patch is missing the initialization of jpeg_work, so I have no idea
what the work actually does. Please reorganize your patches, so that it
adds all the interdependent pieces together. (As is, the code wouldn't
even compile if you checked out your tree to have the series up to this
patch but not the next ones, but it's a requirement for patch submission
to the kernel.)

I suspect that there is no need for a workqueue in this driver, but
let's see after you reorganize the patches.

> +	}
> +
> +	jpeg->hw_state = MTK_JPEG_HW_IDLE;

Do we need this hw_state?

> +	wake_up(&master_jpeg->hw_wq);
> +	atomic_inc(&jpeg->hw_rdy);

Do we really need these? (Again, it's not used by any code in this
patch.)

> +	return IRQ_HANDLED;
> +}
> +
>  static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
>  {
>  	struct mtk_jpeg_q_data *q = &ctx->out_q;
> @@ -1352,7 +1474,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	jpeg->reg_base[0] = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(jpeg->reg_base)) {
>  		ret = PTR_ERR(jpeg->reg_base);
>  		return ret;
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 93ea71c..03ff060 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -75,6 +75,17 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  };
>  
> +struct mtk_jpeg_hw_param {

Could perhaps mtk_jpeg_hw_job be a better name?

> +	struct vb2_v4l2_buffer *src_buffer;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct mtk_jpeg_ctx *curr_ctx;
> +};
> +
> +enum mtk_jpeg_hw_state {
> +	MTK_JPEG_HW_IDLE = 0,
> +	MTK_JPEG_HW_BUSY = 1,
> +};

Wouldn't "bool busy" be good enough? (In case we really need to track
the busy state at all.)

Best regards,
Tomasz

> +
>  enum mtk_jpegenc_hw_id {
>  	MTK_JPEGENC_HW0,
>  	MTK_JPEGENC_HW1,
> @@ -124,13 +135,18 @@ struct mtk_jpeg_dev {
>  	struct v4l2_m2m_dev	*m2m_dev;
>  	void			*alloc_ctx;
>  	struct video_device	*vdev;
> -	void __iomem		*reg_base;
>  	struct device		*larb;
>  	struct delayed_work job_timeout_work;
>  	const struct mtk_jpeg_variant *variant;
>  
> +	void __iomem *reg_base[MTK_JPEGENC_HW_MAX];
> +	int jpegenc_irq;
>  	struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];
>  	struct mtk_jpegenc_pm pm;
> +	enum mtk_jpeg_hw_state hw_state;
> +	struct mtk_jpeg_hw_param hw_param;
> +	wait_queue_head_t hw_wq;
> +	atomic_t hw_rdy;
>  };
>  
>  /**
> @@ -189,6 +205,12 @@ struct mtk_jpeg_ctx {
>  	u8 enc_quality;
>  	u8 restart_interval;
>  	struct v4l2_ctrl_handler ctrl_hdl;
> +
> +	struct list_head dst_done_queue;
> +	spinlock_t done_queue_lock;	/* spinlock protecting done queue */
> +	u32 total_frame_num;
> +	u32 last_done_frame_num;
> +	struct work_struct jpeg_work;
>  };
>  
>  #endif /* _MTK_JPEG_CORE_H */
> -- 
> 2.6.4
> 
