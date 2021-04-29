Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC49636E5F2
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239274AbhD2Had (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:30:33 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59237 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231405AbhD2Hac (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:30:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id c16TlpDS3iDzSc16WlkRRL; Thu, 29 Apr 2021 09:28:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619681337; bh=irx+AKzVobrOXchjacnMXLOcJZVMn6WEAoeMBWB+Psk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ekCX0NTElJI5yRJR/QKxGUS/Glv+c/W2Bwd+vxyASmVphgckLzjRezwYrT2dXCo8K
         7TfOBzTi48l1A+jnag8XiUQcKAoRyrSG/a1m6NGRtv4d39HmXvDOJM688WYEXQi2fS
         meSgVTQDVQrXBx6drXk1RH624zfdqCashIH9BlLuSHkz5K/9nzeFd1RKDwYhmVWFXC
         WvYeeYYCg4goYDbfzA4e5telyeCB3MIkUt52I7Bg+fv3LF2qhGnk1oYUQUnDTsuBKQ
         UGUs1vapTtybv0VfAXeJmBogOQcJtXmsSgUpOpAfJ/fCFe6HREvowp1g4CW/+QBkDx
         FcD2nlAp91yXg==
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
Date:   Thu, 29 Apr 2021 09:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-8-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKmi/SGORAUg0f3nHpt2gRRLP6BFQwGcgLu/Gzt9IyC42z6wVdrRmIO8uK/pxq7KxBnzXd3UhoZjt9jqiH5C7PtiMw/pdVT4fI7ilAA3L8RsXzI2YRac
 zqi82jkMFZKRKdjLWm0KB+/YtIwdgzlHd8TTZ+ms3Gu1V6NYmwLO7snmkHmZjKeUE5R+5qKarwJwYVseZuQaaQ+HAOz1lqIzfUgBtWJ4rpyCcQ2395Yt4V00
 xLlwZ7DfC63NxJfk7ud8l1rEiJZDcRVVcvdL7ixSVTRwtY1lIUuu0Zcp1ShyZbOyl8QjuQknEztDZPbsxWp6lJ+l64dEvqXiS8pwpyIlgW6VXXPnF6fBkz23
 U3o0SSREogb0BQxHB0kuKp6UIBJq8A3ieffobATJo+HCDxJewrJJA/7ZSY5x4K4ZE82D+FPBTQjCakOBHZCkFS/Dza9ICgrw9Z71s74GedwAFO8ngF6Zj/hb
 kHMbdyDQw+HCMp8TUlH602vSQb70227lurFW6g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2021 13:15, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> The stateless API requires a media device for issuing requests. Add one
> if we are being instantiated as a stateless decoder.

Why for the stateless decoder only? Why not create one for all?

It's not a blocker, but I would recommend looking at this.

Regards,

	Hans

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/Kconfig                |  1 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 39 +++++++++++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ae1468aa1b4e..4154fdec2efb 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -315,6 +315,7 @@ config VIDEO_MEDIATEK_VCODEC
>  	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>  	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>  	select V4L2_H264
> +	select MEDIA_CONTROLLER
>  	help
>  	  Mediatek video codec driver provides HW capability to
>  	  encode and decode in a range of video formats on MT8173
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 533781d4680a..e942e28f96fe 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -14,6 +14,7 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-device.h>
>  
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_dec.h"
> @@ -324,6 +325,31 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_event_workq;
>  	}
>  
> +	if (dev->vdec_pdata->uses_stateless_api) {
> +		dev->mdev_dec.dev = &pdev->dev;
> +		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
> +				sizeof(dev->mdev_dec.model));
> +
> +		media_device_init(&dev->mdev_dec);
> +		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
> +		dev->v4l2_dev.mdev = &dev->mdev_dec;
> +
> +		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec,
> +			dev->vfd_dec, MEDIA_ENT_F_PROC_VIDEO_DECODER);
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
> +		mtk_v4l2_debug(0, "media registered as /dev/media%d",
> +			vfd_dec->num);
> +	}
>  	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
>  	if (ret) {
>  		mtk_v4l2_err("Failed to register video device");
> @@ -336,6 +362,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_dec_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		media_device_unregister(&dev->mdev_dec);
> +err_media_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +err_reg_cont:
>  	destroy_workqueue(dev->decode_workqueue);
>  err_event_workq:
>  	v4l2_m2m_release(dev->m2m_dev_dec);
> @@ -368,6 +400,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>  
>  	flush_workqueue(dev->decode_workqueue);
>  	destroy_workqueue(dev->decode_workqueue);
> +
> +	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
> +		media_device_unregister(&dev->mdev_dec);
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +		media_device_cleanup(&dev->mdev_dec);
> +	}
> +
>  	if (dev->m2m_dev_dec)
>  		v4l2_m2m_release(dev->m2m_dev_dec);
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 78d4a7728ddf..10edd238c939 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -383,6 +383,7 @@ struct mtk_vcodec_enc_pdata {
>   * struct mtk_vcodec_dev - driver data
>   * @v4l2_dev: V4L2 device to register video devices for.
>   * @vfd_dec: Video device for decoder
> + * @mdev_dec: Media device for decoder
>   * @vfd_enc: Video device for encoder.
>   *
>   * @m2m_dev_dec: m2m device for decoder
> @@ -418,6 +419,7 @@ struct mtk_vcodec_enc_pdata {
>  struct mtk_vcodec_dev {
>  	struct v4l2_device v4l2_dev;
>  	struct video_device *vfd_dec;
> +	struct media_device mdev_dec;
>  	struct video_device *vfd_enc;
>  
>  	struct v4l2_m2m_dev *m2m_dev_dec;
> 

