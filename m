Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D19F656520
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 22:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbiLZVXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Dec 2022 16:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiLZVXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Dec 2022 16:23:34 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C230EBEC
        for <linux-media@vger.kernel.org>; Mon, 26 Dec 2022 13:23:33 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id v15-20020a9d69cf000000b006709b5a534aso7205484oto.11
        for <linux-media@vger.kernel.org>; Mon, 26 Dec 2022 13:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ti7gNQ0joFnwn5bt+CZWp7BNKSVRmg7a1dGHdw6oaqs=;
        b=XDH+5MEhPGVK+G1gjrU3HfJlvPyPXfqKA0a+oHe7iTOj0gUkquyND3Nuzcr66GNuXO
         5UnafZCtNImxHYFkWOMTwZSIc7CqYYU6SiWbdRO+3RYJNsDVHythZEjw0qXb/keSDSZ7
         HXc4J/2CKk880AfOeR6/zBEJpzBkMycp0lUTFF5hXeEcn/Ov270wsz+hWxxaSI8e2djA
         dP3QubNT6wimBYw/jmd+yAYepYwPpPXExIzXCU3vFHXUdLIdekSsy2d1Kx2loS0P3YzW
         WsvSBR2dQNfcLHybU7/Li33f8+0S7jHTWvNbi7nyqKUw5kQYN4IFIu9Grs/fcjXWY9yL
         mt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti7gNQ0joFnwn5bt+CZWp7BNKSVRmg7a1dGHdw6oaqs=;
        b=NU/XPaRCXJaJY0+5xrBvCPaCv/lQXfsNoi5+ZLoB8plcC5Zu7aQCzfZL3q8skYOCaW
         O11w6ZE329ZK7X3rlLPAP3WUaJqY5xshWcdbVHfQfpkYfvpQqZ2Ss+UIJdRJmcTi6K0L
         hEO1pJvhS93dgWIQlvweV+xLwQpWuqQNHocQtXTGSt5/sT8cZei+/EFkYS5+geCv9BO8
         B046vvJgHHfE750ba89aCW/8x9IOILOy0byqcon6KyJ04qCGYCUsCTvj07qKh14V/pGV
         hqWRVxXFRj+8YnqaYiAZPJ2V+YAGsdKjA36/ZrdTynKn8UbkA0ZTnVb19apD0WeBzcMb
         WxJQ==
X-Gm-Message-State: AFqh2kqn8MtBpJ9xNyeRI13bu+KOTuzQzBB/pJMIUd5eqhgLEcQCUUnj
        gLEmnZLBUv2gNP8GLIgnmf+/6rJr6zM5J0rm
X-Google-Smtp-Source: AMrXdXuyzktmR/DGOD8+kKKwQCQ9dUZSvkxUANpa6OnHhmmbynG6F1V4UFEfKk7iMSO8Sbvw4b6Lyw==
X-Received: by 2002:a9d:7cca:0:b0:677:3d79:e60a with SMTP id r10-20020a9d7cca000000b006773d79e60amr9133706otn.31.1672089813146;
        Mon, 26 Dec 2022 13:23:33 -0800 (PST)
Received: from eze-laptop ([190.11.62.130])
        by smtp.gmail.com with ESMTPSA id r24-20020a056830135800b006731ecc5bedsm5808337otq.14.2022.12.26.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 13:23:32 -0800 (PST)
Date:   Mon, 26 Dec 2022 18:23:26 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: hantro: Use core-generated bus_info value
Message-ID: <Y6oQzl3UPO73LhCX@eze-laptop>
References: <20221226052606.144109-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226052606.144109-1-wenst@chromium.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 26, 2022 at 01:26:06PM +0800, Chen-Yu Tsai wrote:
> The Hantro driver uses a hardcoded value for the bus_info field in the
> media device and |struct v4l2_capability|. This worked well when there
> was just one device. However with the iMX.8 series we are now seeing
> two Hantro blocks on the same chip. The static bus_info is no longer
> sufficient for differentiating devices.
> 
> Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
> v4l_querycap()"), the V4L2 core provides a default value for the
> bus_info field for platform and PCI devices. This value will match
> the default value for media devices added by commit cef699749f37
> ("media: mc: Set bus_info in media_device_init()"). These defaults
> are stable and device-specific.
> 
> Drop the static bus_info values from the hantro driver and use the
> defaults.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Makes sense.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks!


> ---
> Changes since v1:
> - Dropped unrelated Makefile change
> 
>  drivers/media/platform/verisilicon/hantro_drv.c  | 2 --
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 8cb4a68c9119..b0aeedae7b65 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1050,8 +1050,6 @@ static int hantro_probe(struct platform_device *pdev)
>  
>  	vpu->mdev.dev = vpu->dev;
>  	strscpy(vpu->mdev.model, DRIVER_NAME, sizeof(vpu->mdev.model));
> -	strscpy(vpu->mdev.bus_info, "platform: " DRIVER_NAME,
> -		sizeof(vpu->mdev.bus_info));
>  	media_device_init(&vpu->mdev);
>  	vpu->mdev.ops = &hantro_m2m_media_ops;
>  	vpu->v4l2_dev.mdev = &vpu->mdev;
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 2c7a805289e7..c1a116031013 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -142,8 +142,6 @@ static int vidioc_querycap(struct file *file, void *priv,
>  
>  	strscpy(cap->driver, vpu->dev->driver->name, sizeof(cap->driver));
>  	strscpy(cap->card, vdev->name, sizeof(cap->card));
> -	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform: %s",
> -		 vpu->dev->driver->name);
>  	return 0;
>  }
>  
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 
