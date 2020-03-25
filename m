Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62F5192309
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 09:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbgCYImf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 04:42:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37035 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgCYIme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 04:42:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so1539600ljd.4
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ZInQ7P2kWfW5JLJarR/YZgcnvg7Lm/+5nKFHObLkXk=;
        b=r/6AJPQeqEYeuT/qWLoTXhttgDIWmYy6htJ0cV9xtJo6lz88VHvfnetIpXArPjyQ2D
         lgMsgjII6O1Ge+PhBT640YeF4jl3cp+auq85e6m1bnEHqnAY1kMODoNTvLbzkVCwvrpW
         Aj9NMW6ypBunR7qC6IuS0pflwlcr6nMXsT1t8MG8/vs00ycZci8B5bFNj3z7/iAHx5+5
         /8ax1sM+8NO6BuODqnL+IXYZfnOrqrOFuE8fh7kHi0qW7WP96+FQiiJaADmw2/9wGyYK
         cd5K4VTdQwoXp+IB6M/yWWApb5BixoY3O9m0bOxIvGr2hwAH/uu5hV6SYNDsN2efKWRD
         atMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ZInQ7P2kWfW5JLJarR/YZgcnvg7Lm/+5nKFHObLkXk=;
        b=JV3IJMr1adx+iVB9hh6vvQUAWHBtioLUvPsadq4ky1TXce/ahRTPWKmHnTboedAXmv
         dzyuxBZAonQzGu9IhssnukFmH6qHDMuzGXdTjdclg5sV+wPh5MSa7yV2I1PmzT6WBdtD
         oy+l7T87EzTcCR/cMf0CT/T+npyzbvfKxewxFUtKR/Gzk+ylMtmDW10wSfgMSl4dw0va
         GxehOXnA18qUgBgx0AT0WC0y27f4ttTX+zxlaQhrlXI9FSQwvaHkln67gOOgIiaU/Ysj
         kEUhE3E4IcUY5Y8ylBLVj+VARdVHGnIyQ3DQtFsn4QwylEvL+HXTjzrKO/B05ZXxDHXU
         1b6Q==
X-Gm-Message-State: AGi0PuYB4HhnudWaIj5DRxcvuVFpNWsmhntA19FV8GoB1ncZcbr+mf2L
        2crr7q4gb1MDhfSlatzMQVhlFA==
X-Google-Smtp-Source: ADFU+vv+Q2CS2Rvp0B5xrEvQl0g8ZdyXuPwfxVYwHnNBuuvOmT2ruc/0R4aVA+tJ9pUs4Z6xP6jmUg==
X-Received: by 2002:a2e:b801:: with SMTP id u1mr1281617ljo.84.1585125749909;
        Wed, 25 Mar 2020 01:42:29 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id u7sm1525603ljo.1.2020.03.25.01.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 01:42:29 -0700 (PDT)
Subject: Re: [libcamera-devel] [PATCH 2/4] media: v4l2-dev: Add
 v4l2_device_register_ro_subdev_node()
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
References: <20200324202844.1518292-1-jacopo@jmondi.org>
 <20200324202844.1518292-3-jacopo@jmondi.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <313fcb7e-6612-9cf5-a4eb-ba6edb39f754@linaro.org>
Date:   Wed, 25 Mar 2020 11:42:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324202844.1518292-3-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for your patch set!

On 24.03.2020 23:28, Jacopo Mondi wrote:
> Add to the V4L2 code a function to register device nodes for video
> subdevices in read-only mode.
> 
> Registering a device node in read-only mode is useful to expose to
> userspace the current sub-device configuration, without allowing
> application to change it by using the V4L2 subdevice ioctls.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   drivers/media/v4l2-core/v4l2-device.c | 16 +++++++++++++++-
>   drivers/media/v4l2-core/v4l2-subdev.c | 19 +++++++++++++++++++
>   include/media/v4l2-dev.h              |  7 +++++++
>   include/media/v4l2-device.h           | 10 ++++++++++
>   4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index 63d6b147b21e..6f9dba36eda1 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -188,7 +188,8 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
>   	kfree(vdev);
>   }
>   
> -int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
> +int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
> +					bool read_only)
>   {
>   	struct video_device *vdev;
>   	struct v4l2_subdev *sd;
> @@ -217,6 +218,8 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>   		vdev->fops = &v4l2_subdev_fops;
>   		vdev->release = v4l2_device_release_subdev_node;
>   		vdev->ctrl_handler = sd->ctrl_handler;
> +		if (read_only)
> +			vdev->flags |= V4L2_FL_RO_DEVNODE;

<snip>

> @@ -331,6 +331,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>   	struct v4l2_fh *vfh = file->private_data;
>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>   	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> +	bool ro_devnode = !!(vdev->flags & V4L2_FL_RO_DEVNODE);

So V4L2_FL_RO_DEVNODE is a bit mask, ...

<snip>

> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 48531e57cc5a..029873a338f2 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -82,11 +82,18 @@ struct v4l2_ctrl_handler;
>    *	but the old crop API will still work as expected in order to preserve
>    *	backwards compatibility.
>    *	Never set this flag for new drivers.
> + * @V4L2_FL_RO_DEVNODE:
> + *	indicates that the video device node is registered in read-only mode.
> + *	The flag only applies to device nodes registered for sub-devices, it is
> + *	set by the core when the sub-devices device nodes are registered with
> + *	v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
> + *	handler to restrict access to some ioctl calls.
>    */
>   enum v4l2_video_device_flags {
>   	V4L2_FL_REGISTERED		= 0,
>   	V4L2_FL_USES_V4L2_FH		= 1,
>   	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
> +	V4L2_FL_RO_DEVNODE		= 3,

... then V4L2_FL_RO_DEVNODE should rather be equal to 4, than to (V4L2_FL_USES_V4L2_FH | V4L2_FL_QUIRK_INVERTED_CROP)

Thanks,
Andrey

>   };
>   
>   /* Priority helper functions */
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index e0b8f2602670..0df667ba9938 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -183,6 +183,16 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
>   int __must_check
>   v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev);
>   
> +/**
> + * v4l2_device_register_ro_subdev_nodes - Registers read-only device nodes for
> + *      all subdevs of the v4l2 device that are marked with the
> + *      %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
> + *
> + * @v4l2_dev: pointer to struct v4l2_device
> + */
> +int __must_check
> +v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev);
> +
>   /**
>    * v4l2_subdev_notify - Sends a notification to v4l2_device.
>    *
> 
