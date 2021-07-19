Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146773CE647
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 18:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241688AbhGSQD3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 12:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352591AbhGSQBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 12:01:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00259C0A8884;
        Mon, 19 Jul 2021 08:58:22 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9E1B01F42D19;
        Mon, 19 Jul 2021 17:22:32 +0100 (BST)
Subject: Re: [PATCH v6 12/14] media: mtk-vcodec: vdec: add media device if
 using stateless api
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@google.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210705053258.1614177-1-acourbot@chromium.org>
 <20210705053258.1614177-13-acourbot@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a0a8b9a1-df9e-0e30-9ce6-36759f707e27@collabora.com>
Date:   Mon, 19 Jul 2021 18:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705053258.1614177-13-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 05.07.21 07:32, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> The stateless API requires a media device for issuing requests. Add one
> if we are being instantiated as a stateless decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>   drivers/media/platform/Kconfig                |  2 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 38 +++++++++++++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
>   3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ae1468aa1b4e..aa277a19e275 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -315,6 +315,8 @@ config VIDEO_MEDIATEK_VCODEC
>   	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>   	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>   	select V4L2_H264
> +	select MEDIA_CONTROLLER
> +	select MEDIA_CONTROLLER_REQUEST_API
>   	help
>   	  Mediatek video codec driver provides HW capability to
>   	  encode and decode in a range of video formats on MT8173
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 1460951f302c..c8a84fa11e4a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -14,6 +14,7 @@
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-device.h>
>   
>   #include "mtk_vcodec_drv.h"
>   #include "mtk_vcodec_dec.h"
> @@ -316,6 +317,30 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_event_workq;
>   	}
>   
> +	if (dev->vdec_pdata->uses_stateless_api) {
> +		dev->mdev_dec.dev = &pdev->dev;
> +		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
> +			sizeof(dev->mdev_dec.model));
> +
> +		media_device_init(&dev->mdev_dec);
> +		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
> +		dev->v4l2_dev.mdev = &dev->mdev_dec;
> +
> +		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, dev->vfd_dec,
> +							 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +		if (ret) {
> +			mtk_v4l2_err("Failed to register media controller");
> +			goto err_reg_cont;
> +		}
> +
> +		ret = media_device_register(&dev->mdev_dec);
> +		if (ret) {
> +			mtk_v4l2_err("Failed to register media device");
> +			goto err_media_reg;
> +		}
> +
> +		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->num);

the media's node minor is not vfd_dec->num

> +	}
>   	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
>   	if (ret) {
>   		mtk_v4l2_err("Failed to register video device");
> @@ -328,6 +353,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   	return 0;
>   
>   err_dec_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		media_device_unregister(&dev->mdev_dec);
> +err_media_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +err_reg_cont:
>   	destroy_workqueue(dev->decode_workqueue);
>   err_event_workq:
>   	v4l2_m2m_release(dev->m2m_dev_dec);
> @@ -360,6 +391,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>   
>   	flush_workqueue(dev->decode_workqueue);
>   	destroy_workqueue(dev->decode_workqueue);
> +
> +	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
> +		media_device_unregister(&dev->mdev_dec);
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +		media_device_cleanup(&dev->mdev_dec);
> +	}
> +
>   	if (dev->m2m_dev_dec)
>   		v4l2_m2m_release(dev->m2m_dev_dec);
>   
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 8fb333a99a40..d4f840a7bbcb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -389,6 +389,7 @@ struct mtk_vcodec_enc_pdata {
>    * struct mtk_vcodec_dev - driver data
>    * @v4l2_dev: V4L2 device to register video devices for.
>    * @vfd_dec: Video device for decoder
> + * @mdev_dec: Media device for decoder
>    * @vfd_enc: Video device for encoder.
>    *
>    * @m2m_dev_dec: m2m device for decoder
> @@ -426,6 +427,7 @@ struct mtk_vcodec_enc_pdata {
>   struct mtk_vcodec_dev {

This structs has a lot of duplicated fields for enc/dec
Since the device represents either a decoder or an encoder,
I think all those dupliactes can be removed, so for example
instead of having both 'dec_irq' and 'enc_irq' we can have just 'irq'

Thanks,
Dafna

>   	struct v4l2_device v4l2_dev;
>   	struct video_device *vfd_dec;
> +	struct media_device mdev_dec;
>   	struct video_device *vfd_enc;
>   
>   	struct v4l2_m2m_dev *m2m_dev_dec;
> 
