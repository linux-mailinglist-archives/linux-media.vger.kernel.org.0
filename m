Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F062EC2AC
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 18:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbhAFRpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 12:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbhAFRpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 12:45:23 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD3AC061575
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:44:42 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r3so3201189wrt.2
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 09:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NeMdJxJHo+qYMgUaKpnOvIjKVILMC0/6wK5X3FKdMdI=;
        b=kY/f3j1J2eIblz+c5YE6+z1qus7ueyjJztMcU9pvwP1X3N6OcjwvtT9Zf43uXjyh5q
         YMux17UjAB6gUZz5OnYHxGFeur7XLebsYRCX7XtKmyJe+yRnvq9SMbkSyaAzdOiCtFgL
         4bZIVGU05fkYKR9WKam72oGxjiZkcYiSueYhSlNryoVGMHQZXhXVnM7ihuzEead+5yAT
         lVVOtJJfKSkRrB9dPhTbcz2hZ8QjKD5pPXbJhShTrPCfsr/kc7HCAbN/8fv9qgJymnBB
         SOxkKOeNU/7FH4lvul388anHHR4NH3Iu4L/NJAhWexWVjbcjHqm5QnIFsim/KYri6JRn
         Nf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NeMdJxJHo+qYMgUaKpnOvIjKVILMC0/6wK5X3FKdMdI=;
        b=mEw0j6YMJImlKT690mzPjThankZ8xsTXl28xa/MEBVYUOC1IP99i9AhXaookYmE9LB
         dhb182h+kgcOfiZ79uq4r9O2J/CBdgA1lv6CivIWJ0uSKVolXlBmSI2x9Y/n/8Tz09Er
         l0BIWOjkqQnq146wkWzWFow5zDFvhNC0WolfwjlxOavi3MVuMfpOiGvgfwmW7op30yaz
         BsOAzp79MrHIVt0+8D97rhOhMaqzjDoTCwLqYO188yKGeLXdvMVhUq7rTOTOVgXJi7Zl
         o68w60q7Mm4n3hYjncGUgjOVpx1Pf81CbLeeuCf7C8uGgQkwrXGoZwQ0WqOEJiDHo3uR
         eAwQ==
X-Gm-Message-State: AOAM531Ik6XhlRXtwzz2OGv8TQHEfErsWn8l928wat4B99zWbzXd/AVV
        kkIGXsQnOSP2Pi8vBldpp0g=
X-Google-Smtp-Source: ABdhPJzn7ItbDAsPBhVsUNcscbdl7aZj3jhfVz2KCme0prxbZvYVgbMy4ZUsMVtFCj1sZvsEzWnDSQ==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr5499546wrt.242.1609955081092;
        Wed, 06 Jan 2021 09:44:41 -0800 (PST)
Received: from [172.30.88.143] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id y11sm3807993wmi.0.2021.01.06.09.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 09:44:40 -0800 (PST)
Subject: Re: [PATCH 31/75] media: imx: capture: Support creating immutable
 link to capture device
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <10de5176-d699-231a-9415-b6730d8eedfa@gmail.com>
Date:   Wed, 6 Jan 2021 09:44:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 1/5/21 7:28 AM, Laurent Pinchart wrote:
> When the subdevice connected to the capture device has a single possible
> sink, there's no point in making the link mutable. Support creating
> immutable links.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
>   drivers/staging/media/imx/imx-media-capture.c | 7 +++++--
>   drivers/staging/media/imx/imx-media-csi.c     | 2 +-
>   drivers/staging/media/imx/imx-media.h         | 3 ++-
>   drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
>   5 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 88d69425e1b3..6c9c75ffb30c 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
>   	if (IS_ERR(priv->vdev))
>   		return PTR_ERR(priv->vdev);
>   
> -	ret = imx_media_capture_device_register(priv->vdev);
> +	ret = imx_media_capture_device_register(priv->vdev, false);

Might as well go ahead and pass true here now, to make the prpenc and 
prpvf links to the capture device immutable, since there is only one 
source and sink in this case.

Steve

>   	if (ret)
>   		goto remove_vdev;
>   
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 04eb612ff1fa..c6991e8f151c 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -898,12 +898,14 @@ static int capture_init_format(struct capture_priv *priv)
>   	return 0;
>   }
>   
> -int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
> +int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
> +				      bool immutable)
>   {
>   	struct capture_priv *priv = to_capture_priv(vdev);
>   	struct v4l2_subdev *sd = priv->src_sd;
>   	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
>   	struct video_device *vfd = vdev->vfd;
> +	u32 flags;
>   	int ret;
>   
>   	/* get media device */
> @@ -927,8 +929,9 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>   		 video_device_node_name(vfd));
>   
>   	/* Create the link from the src_sd devnode pad to device node. */
> +	flags = immutable ? MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE : 0;
>   	ret = media_create_pad_link(&sd->entity, priv->src_sd_pad,
> -				    &vfd->entity, 0, 0);
> +				    &vfd->entity, 0, flags);
>   	if (ret) {
>   		dev_err(priv->dev, "failed to create link to device node\n");
>   		video_unregister_device(vfd);
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 436f3d7160fa..d54d2a3789c0 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1796,7 +1796,7 @@ static int csi_registered(struct v4l2_subdev *sd)
>   		goto free_fim;
>   	}
>   
> -	ret = imx_media_capture_device_register(priv->vdev);
> +	ret = imx_media_capture_device_register(priv->vdev, false);
>   	if (ret)
>   		goto remove_vdev;
>   
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 16ab879e0084..4efc4d186c0a 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -288,7 +288,8 @@ struct imx_media_video_dev *
>   imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>   			      int pad, bool legacy_api);
>   void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
> -int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
> +int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
> +				      bool immutable);
>   void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
>   struct imx_media_buffer *
>   imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index afd1a7e35bfe..c087a212efdd 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1093,7 +1093,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
>   	if (IS_ERR(csi->vdev))
>   		return PTR_ERR(csi->vdev);
>   
> -	ret = imx_media_capture_device_register(csi->vdev);
> +	ret = imx_media_capture_device_register(csi->vdev, false);
>   	if (ret)
>   		imx_media_capture_device_remove(csi->vdev);
>   

