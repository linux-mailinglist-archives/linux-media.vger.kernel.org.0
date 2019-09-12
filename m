Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7988BB0FA0
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 15:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731760AbfILNLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 09:11:33 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:44421 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731687AbfILNLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 09:11:33 -0400
Received: from [IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985] ([IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8OshiPxuRV17O8Osliynaa; Thu, 12 Sep 2019 15:11:31 +0200
Subject: Re: [PATCH 2/6] v4l: subdev: Provide a locking scheme for subdev
 operations
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
 <20190819124728.10511-3-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cec240cb-daf7-fc68-6578-44be011720ba@xs4all.nl>
Date:   Thu, 12 Sep 2019 15:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819124728.10511-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFxj/ANGi67tSyEL/xpX1h5eByInALIFLJJsxmuqC93pDsJBk0/abyQWXeJ/lNTYDa0o+1mzAdkuJdeKmd2ScSjIwEmmfy0DB7pDTAoGlsEQyVPmXay4
 2aIgJ688NzMfeIi98HvGf8Z6039+oSahqrPUeeXdjiZwHLp2h2tlVwlUFKM77jZDwSQI39OHihOcGrY3ENJ7ebxSNMIkPjSty++4Hr5M39abSpGU76H7LXba
 ddpGQp4RXlagnrlLtUfnXzzXfsh3e/KAiAktM/7vz/1dQx9VnQdkPC5rq7k9JO0ghZZtNdgRh8Aoq4Fu5qKHCdtEGjaFiFByHvxdS/hnOY4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 2:47 PM, Sakari Ailus wrote:
> The V4L2 sub-device's operations are called both from other drivers as
> well as through the IOCTL uAPI. Previously the sub-device drivers were
> responsible for managing their own serialisation. This patch adds an
> optional mutex the drivers may set, and it will be used to serialise
> access to driver's data related to a device across the driver's ops.
> 
> Access to the driver's controls through the control framework works as
> usual, i.e. using a different mutex.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 71f1f2f0da53..dc6e11019df6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -9,6 +9,7 @@
>  #define _V4L2_SUBDEV_H
>  
>  #include <linux/types.h>
> +#include <linux/mutex.h>
>  #include <linux/v4l2-subdev.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-async.h>
> @@ -828,6 +829,7 @@ struct v4l2_subdev_platform_data {
>   * @host_priv: pointer to private data used by the device where the subdev
>   *	is attached.
>   * @devnode: subdev device node
> + * @lock: A mutex for serialising access to the subdev's operations. Optional.

A pointer to a mutex...

>   * @dev: pointer to the physical device, if any
>   * @fwnode: The fwnode_handle of the subdev, usually the same as
>   *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
> @@ -862,6 +864,7 @@ struct v4l2_subdev {
>  	void *dev_priv;
>  	void *host_priv;
>  	struct video_device *devnode;
> +	struct mutex *lock;
>  	struct device *dev;
>  	struct fwnode_handle *fwnode;
>  	struct list_head async_list;
> @@ -1101,16 +1104,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  	({								\
>  		struct v4l2_subdev *__sd = (sd);			\
>  		int __result;						\
> -		if (!__sd)						\
> +		if (!__sd) {						\
>  			__result = -ENODEV;				\
> -		else if (!(__sd->ops->o && __sd->ops->o->f))		\
> +		} else if (!(__sd->ops->o && __sd->ops->o->f)) {	\
>  			__result = -ENOIOCTLCMD;			\
> -		else if (v4l2_subdev_call_wrappers.o &&			\
> -			 v4l2_subdev_call_wrappers.o->f)		\
> -			__result = v4l2_subdev_call_wrappers.o->f(	\
> -							__sd, ##args);	\
> -		else							\
> -			__result = __sd->ops->o->f(__sd, ##args);	\
> +		} else {						\
> +			if (__sd->lock)					\
> +				mutex_lock(__sd->lock);			\
> +			if (v4l2_subdev_call_wrappers.o &&		\
> +				 v4l2_subdev_call_wrappers.o->f)	\
> +				__result = v4l2_subdev_call_wrappers.o->f( \
> +					__sd, ##args);			\
> +			else						\
> +				__result = __sd->ops->o->f(__sd, ##args); \
> +			if (__sd->lock)					\
> +				mutex_unlock(__sd->lock);			\
> +		}							\
>  		__result;						\
>  	})
>  
> 

I'm not sure this is the right place to lock. Locking is only needed if the
subdev device can be called directly from userspace. So I would put the
locking in subdev_do_ioctl() and use mutex_lock_interruptible.

If there are subdev ops that in this scenario (i.e. userspace is responsible
for configuring the subdev) are still called from another driver, then I would
create a v4l2_subdev_call_lock() function that takes the lock.

Adding a lock in the v4l2_subdev_call macro feels too invasive.

Regards,

	Hans
