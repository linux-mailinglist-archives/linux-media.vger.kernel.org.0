Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880A142D94D
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 14:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhJNMb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 08:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhJNMb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 08:31:56 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438F3C06174E
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 05:29:51 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id u5so10813138uao.13
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bpEt5S2I1jECJZ7RAHxHySVXzboFeasK/FtBe+cjO18=;
        b=yHj0RLsispl3pZOx9OzQRdtNdyJkziqY9hxlNeIeAdjRANYoVp3gT0ZHuJt++TVuLE
         Fs6uvLKVQ3/EfqaX88EnLDmlO8KLYxuYkeCSIiy+O0kLtnQbBr5bAFwsO+DXKyHQGiOa
         HJN/Ucm4pLg4vxoMKuZJJjhAh6HCCjXuzqOdOb/PmWZ/RkzN2ET0KIMgWgisCz/fHkgx
         r4HLxdDuoMCq9Gn7CraNwRXBkENmGDLCg+9DIs5gOlk96PoEcJz6EMJk+YC6BatRNhRE
         sqPuauczqUPyN/RIKpvfOJt9L1aJ704G7BkWwfJ4iHkq7WmmRig6UUW7h7+iknrv26v7
         qkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bpEt5S2I1jECJZ7RAHxHySVXzboFeasK/FtBe+cjO18=;
        b=j5nx5vn3nOIu+Wynkg1t12ZFt24WoLBLtVrMulmlSdr/rxpG1qe2wDRasIxuZAdkIl
         F8X/9uZSp/vxsynGShaE6Fy7fMmXwseyBVfBsgZS6C+XzT8RWlDlyMy3oOTsih4s5pGH
         eXC2GayU91NNcuVMVwyHVmInMyswiyXMrT4XfgvDIlyy3zvQtapk0SMlI93FRjahUQ05
         RnqU/nE2dyosLveLPjidmf/l0dJNR1p3flcTuTawh1F4zmYEAvN1lFD75amI52sd2/8j
         PLWZKt+JEG77S2PUzlSwdydvy4hUbohnvYUwg8z6IPGDb02L6Dys3rAW2o33sWrbVvdZ
         3wdg==
X-Gm-Message-State: AOAM531SlNkHp2kzJfkuV1oO5GfCcwHVwI8n5W+tKsV4V2OjOP+kav4O
        o8UsVcqeK6kX/VBjFs3hPEGc1g==
X-Google-Smtp-Source: ABdhPJwpZPIshTtwDQYZynBXVHPTqsAW65pNND3KsVH+Ilc20oOix2EKPoY+nV7xF5rMeic3f2Z8gg==
X-Received: by 2002:a05:6102:e86:: with SMTP id l6mr2706001vst.40.1634214590367;
        Thu, 14 Oct 2021 05:29:50 -0700 (PDT)
Received: from fedora ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id x125sm1589796vkc.25.2021.10.14.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:29:48 -0700 (PDT)
Date:   Thu, 14 Oct 2021 09:29:42 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
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
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
Message-ID: <YWgitrqT9sWyELpr@fedora>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-12-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011070247.792-12-yunfei.dong@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei,

On Mon, Oct 11, 2021 at 03:02:43PM +0800, Yunfei Dong wrote:
> Core thread:
> 1. Gets lat_buf from core msg queue.
> 2. Proceeds core decode.
> 3. Puts the lat_buf back to lat msg queue.
> 
> Both H264 and VP9 rely on the core thread.
> 

Avoid the kthread API and instead go with the workqueue API.

See Documentation/core-api/workqueue.rst and include/linux/workqueue.h.

Thanks!
Ezequiel

> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
>  .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
>  .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
>  4 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index e21e0c4bcd86..de83e3b821b4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_dec_pm;
>  	}
>  
> +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> +			MTK_VDEC_CORE);
> +		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
> +			"mtk-%s", "core");
> +		if (IS_ERR(dev->kthread_core)) {
> +			dev_err(&pdev->dev, "Failed to create core thread");
> +			ret = PTR_ERR(dev->kthread_core);
> +			goto err_res;
> +		}
> +	}
> +
>  	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>  		mutex_init(&dev->dec_mutex[i]);
>  	spin_lock_init(&dev->irqlock);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9d072c082f73..68a9b1a2d3b3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -27,6 +27,7 @@
>  #define MTK_VCODEC_MAX_PLANES	3
>  #define MTK_V4L2_BENCHMARK	0
>  #define WAIT_INTR_TIMEOUT_MS	1000
> +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
>  
>  /*
>   * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
>   * @comp_dev: component hardware device
>   * @component_node: component node
>   *
> + * @kthread_core: thread used for core hardware decode
> + * @msg_queue_core_ctx: msg queue context used for core thread
> + *
>   * @hardware_bitmap: used to record hardware is ready or not
>   */
>  struct mtk_vcodec_dev {
> @@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
>  	void *comp_dev[MTK_VDEC_HW_MAX];
>  	struct device_node *component_node[MTK_VDEC_HW_MAX];
>  
> +	struct task_struct *kthread_core;
> +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> +
>  	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
>  };
>  
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index d66ed98c79a9..665f571eab4b 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
>  			kfree(lat_buf->private_data);
>  	}
>  }
> +
> +int vdec_msg_queue_core_thead(void *data)
> +{
> +	struct mtk_vcodec_dev *dev = data;
> +	struct vdec_lat_buf *lat_buf;
> +	struct mtk_vcodec_ctx *ctx;
> +
> +	set_freezable();
> +	for (;;) {
> +		try_to_freeze();
> +		if (kthread_should_stop())
> +			break;
> +
> +		lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> +		if (!lat_buf)
> +			continue;
> +
> +		ctx = lat_buf->ctx;
> +		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> +
> +		if (!lat_buf->core_decode)
> +			mtk_v4l2_err("Core decode callback func is NULL");
> +		else
> +			lat_buf->core_decode(lat_buf);
> +
> +		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> +		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> +	}
> +
> +	mtk_v4l2_debug(3, "Video Capture Thread End");
> +	return 0;
> +}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> index 1905ce713592..b5745b144140 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -148,4 +148,10 @@ void vdec_msg_queue_deinit(
>  	struct vdec_msg_queue *msg_queue,
>  	struct mtk_vcodec_ctx *ctx);
>  
> +/**
> + * vdec_msg_queue_core_thead - used for core decoder.
> + * @data: private data used for each codec
> + */
> +int vdec_msg_queue_core_thead(void *data);
> +
>  #endif
> -- 
> 2.25.1
> 
