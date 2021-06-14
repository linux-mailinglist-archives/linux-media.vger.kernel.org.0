Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9013A6D00
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 19:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbhFNRUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 13:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbhFNRUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 13:20:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D24AC061574;
        Mon, 14 Jun 2021 10:18:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A0DE436;
        Mon, 14 Jun 2021 19:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623691109;
        bh=y4O1JbwGNn7Lc7BvWKPLAYq6GZW6ySim0hDnS/u1k6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vXz6o1CWvFrWEsBJP66uAKayqetLWBTzstcZZXB+SOeZK35OZyLXgrNIsfra3B0fV
         6MQuyWmI2/PoOcvxa1fQwJNT9QTBUPLL3Zv/rVaUb1vzPo8/43j4Yvw6hoIRPCifC6
         /sPjiQRe9hnL4a7UpVpY2IYhnDtCDCGOo8ynsVi8=
Date:   Mon, 14 Jun 2021 20:18:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 7/8] media: subdev: fix compat_ioctl32
Message-ID: <YMePUYfDzdsErRab@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-8-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The adv7842 and si4713 drivers each define one private ioctl command that
> are handled through the subdev_ioctl() helpers, but that don't work in

s/don't/doesn't/

> compat mode because this does not handle private ioctl commands.
> 
> The compat_ioctl32 callback for subdevs has outdated calling conventions,
> but as there are no users of that, it is easy to change the function
> pointer type and the caller to make it behave the same way as the normal
> ioctl callback and hook in the two drivers that need no argument
> conversion.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/i2c/adv7842.c           |  3 +++
>  drivers/media/radio/si4713/si4713.c   |  3 +++
>  drivers/media/v4l2-core/v4l2-subdev.c | 19 ++++++++++++++++---
>  include/media/v4l2-subdev.h           |  3 +--
>  4 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> index 78e61fe6f2f0..cd6df4f52f33 100644
> --- a/drivers/media/i2c/adv7842.c
> +++ b/drivers/media/i2c/adv7842.c
> @@ -3293,6 +3293,9 @@ static const struct v4l2_ctrl_ops adv7842_ctrl_ops = {
>  static const struct v4l2_subdev_core_ops adv7842_core_ops = {
>  	.log_status = adv7842_log_status,
>  	.ioctl = adv7842_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl32 = adv7842_ioctl,
> +#endif
>  	.interrupt_service_routine = adv7842_isr,
>  	.subscribe_event = adv7842_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
> index adbf43ff6a21..ae7e477774e3 100644
> --- a/drivers/media/radio/si4713/si4713.c
> +++ b/drivers/media/radio/si4713/si4713.c
> @@ -1398,6 +1398,9 @@ static const struct v4l2_ctrl_ops si4713_ctrl_ops = {
>  
>  static const struct v4l2_subdev_core_ops si4713_subdev_core_ops = {
>  	.ioctl		= si4713_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl32	= si4713_ioctl,
> +#endif

Should we drop v4l2_subdev_core_ops.compat_ioctl32 and call
v4l2_subdev_core_ops.ioctl from subdev_do_compat_ioctl32() ? New drivers
should design custom ioctls in a way that doesn't require compat code.

>  };
>  
>  static const struct v4l2_subdev_tuner_ops si4713_subdev_tuner_ops = {
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index bf3aa9252458..fbd176d6c415 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -686,13 +686,26 @@ static long subdev_ioctl(struct file *file, unsigned int cmd,
>  }
>  
>  #ifdef CONFIG_COMPAT
> -static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
> -	unsigned long arg)
> +static long subdev_do_compat_ioctl32(struct file *file, unsigned int cmd, void *arg)
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
> +	struct mutex *lock = vdev->lock;
> +	long ret = -ENODEV;
>  
> -	return v4l2_subdev_call(sd, core, compat_ioctl32, cmd, arg);
> +	if (lock && mutex_lock_interruptible(lock))
> +		return -ERESTARTSYS;
> +	if (video_is_registered(vdev))
> +		ret = v4l2_subdev_call(sd, core, compat_ioctl32, cmd, arg);
> +	if (lock)
> +		mutex_unlock(lock);
> +	return ret;
> +}
> +
> +static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
> +	unsigned long arg)
> +{
> +	return video_usercopy(file, cmd, arg, subdev_do_compat_ioctl32);
>  }
>  #endif
>  
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..42aa1f6c7c3f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -195,8 +195,7 @@ struct v4l2_subdev_core_ops {
>  	int (*s_gpio)(struct v4l2_subdev *sd, u32 val);
>  	long (*ioctl)(struct v4l2_subdev *sd, unsigned int cmd, void *arg);
>  #ifdef CONFIG_COMPAT
> -	long (*compat_ioctl32)(struct v4l2_subdev *sd, unsigned int cmd,
> -			       unsigned long arg);
> +	long (*compat_ioctl32)(struct v4l2_subdev *sd, unsigned int cmd, void *arg);
>  #endif
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	int (*g_register)(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg);

-- 
Regards,

Laurent Pinchart
