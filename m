Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E661C3CD1A7
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 12:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236213AbhGSJaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 05:30:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34888 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236180AbhGSJae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 05:30:34 -0400
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 609391F4248F;
        Mon, 19 Jul 2021 11:11:12 +0100 (BST)
Subject: Re: [PATCH v2, 10/14] media: mtk-vcodec: Add core thread
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Collabora Kernel ML <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-11-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6bcb5964-0afa-f3c3-a80e-c34ef26eea4b@collabora.com>
Date:   Mon, 19 Jul 2021 12:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-11-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.07.21 10:12, Yunfei Dong wrote:
> Core thread:
> 1. Gets lat_buf from core msg queue.
> 2. Proceeds core decode.
> 3. Puts the lat_buf back to lat msg queue.
> 
> Both H264 and VP9 rely on the core thread.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: no changes
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
>   4 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 078daeeff576..e05224aca888 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -437,6 +437,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_res;
>   	}
>   
> +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +		vdec_msg_queue_init_ctx(&dev->core_ctx, MTK_VDEC_CORE);
> +		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
> +			"mtk-%s", "core");

why would we want to run this thread when probing?
also, don't we need to check errors?

> +	}
> +
>   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>   		mutex_init(&dev->dec_mutex[i]);
>   	mutex_init(&dev->dev_mutex);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9207ce079960..3beba0e2ea91 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -32,6 +32,7 @@
>   #define MTK_VCODEC_MAX_PLANES	3
>   #define MTK_V4L2_BENCHMARK	0
>   #define WAIT_INTR_TIMEOUT_MS	1000
> +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
>   
>   /*
>    * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -480,6 +481,7 @@ struct mtk_vcodec_enc_pdata {
>    * @component_node: component node
>    * @comp_idx: component index
>    *
> + * @kthread_core: thread used for core hardware decode
>    * @core_ctx: core queue context
>    */
>   struct mtk_vcodec_dev {
> @@ -524,6 +526,7 @@ struct mtk_vcodec_dev {
>   	struct device_node *component_node[MTK_VDEC_HW_MAX];
>   	int comp_idx;
>   
> +	struct task_struct *kthread_core;
>   	struct vdec_msg_queue_ctx core_ctx;
>   };
>   
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index 016a70416e55..60bc3796bb58 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -252,3 +252,35 @@ void vdec_msg_queue_deinit(
>   			kfree(lat_buf->private_data);
>   	}
>   }
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
> +		lat_buf = vdec_msg_queue_dqbuf(&dev->core_ctx);
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
> index 297aa1598788..27ce528cbe89 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -134,4 +134,10 @@ void vdec_msg_queue_deinit(
>   	struct vdec_msg_queue *msg_queue,
>   	struct mtk_vcodec_ctx *ctx);
>   
> +/**
> + * vdec_msg_queue_core_thead - used for core decoder.
> + * @data: private data used for each codec
> + */
> +int vdec_msg_queue_core_thead(void *data);
> +
>   #endif
> 
