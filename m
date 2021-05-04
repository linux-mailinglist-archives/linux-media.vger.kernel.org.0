Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA64D372627
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 09:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhEDHFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 03:05:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43946 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhEDHFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 03:05:12 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A85158E;
        Tue,  4 May 2021 09:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620111857;
        bh=vjZgFBilE1N+H/y2/vZ8aLlfS6MImO5chE75Mmcl3HI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ofyYcf/0SVaBTRkE2ZSf34OA/6kpjTewBu89DvLItTI3z7CrMNeSpVwLVSpJ1WaqN
         JXDApQ+78OQkPhuvT1WsTYqRHE5nYn/uqku/XqQrgOAwhb0/LQ80yHBAl+0YfKRy/j
         7EsobN6NCbD4BFvz4VC83vigq/gCSLVpGt873CpY=
Subject: Re: [PATCH v6 18/24] v4l: subdev: Add [GS]_ROUTING subdev ioctls and
 operations
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-19-tomi.valkeinen@ideasonboard.com>
 <YIoZteLxCX+A142n@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <78ae6123-9904-1a3f-45b9-a2103292f750@ideasonboard.com>
Date:   Tue, 4 May 2021 10:04:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIoZteLxCX+A142n@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 05:28, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> For some reason, it seems the original authorship got lost. It was fine
> in v5. I haven't checked if other patches in the series are affected.
> 
> On Tue, Apr 27, 2021 at 03:45:17PM +0300, Tomi Valkeinen wrote:
>> Add support for subdev internal routing. A route is defined as a single
>> stream from a sink pad to a source pad.
>>
>> The userspace can configure the routing via two new ioctls,
>> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
>> implement the functionality with v4l2_subdev_pad_ops.get_routing() and
>> v4l2_subdev_pad_ops.set_routing().
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>
>> - Add sink and source streams for multiplexed links
>> - Copy the argument back in case of an error. This is needed to let the
>>    caller know the number of routes.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>> - Expand and refine documentation.
>> - Make the 'routes' pointer a __u64 __user pointer so that a compat32
>>    version of the ioctl is not required.
>> - Add struct v4l2_subdev_krouting to be used for subdevice operations.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> - Fix typecasing warnings
>> - Check sink & source pad types
>> - Add 'which' field
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c  | 25 +++++++++++++-
>>   drivers/media/v4l2-core/v4l2-subdev.c | 46 +++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 24 ++++++++++++++
>>   include/uapi/linux/v4l2-subdev.h      | 48 +++++++++++++++++++++++++++
>>   4 files changed, 142 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 6a5d1c6d11d6..7b1dabc23909 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/version.h>
>>   
>> +#include <linux/v4l2-subdev.h>
>>   #include <linux/videodev2.h>
>>   
>>   #include <media/v4l2-common.h>
>> @@ -3108,6 +3109,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>>   		ret = 1;
>>   		break;
>>   	}
>> +
>> +	case VIDIOC_SUBDEV_G_ROUTING:
>> +	case VIDIOC_SUBDEV_S_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = parg;
>> +
>> +		if (routing->num_routes > 256)
>> +			return -EINVAL;
>> +
>> +		*user_ptr = u64_to_user_ptr(routing->routes);
>> +		*kernel_ptr = (void **)&routing->routes;
>> +		*array_size = sizeof(struct v4l2_subdev_route)
>> +			    * routing->num_routes;
>> +		ret = 1;
>> +		break;
>> +	}
>>   	}
>>   
>>   	return ret;
>> @@ -3369,8 +3385,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>   	/*
>>   	 * Some ioctls can return an error, but still have valid
>>   	 * results that must be returned.
>> +	 *
>> +	 * FIXME: subdev IOCTLS are partially handled here and partially in
>> +	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
>> +	 * defined here as part of the 'v4l2_ioctls' array. As
>> +	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
>> +	 * in case of failure, but it is not defined here as part of the
>> +	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
>>   	 */
>> -	if (err < 0 && !always_copy)
>> +	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
>>   		goto out;
>>   
>>   out_array_args:
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 956dafab43d4..ad79ce121cee 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -681,6 +681,52 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   	case VIDIOC_SUBDEV_QUERYSTD:
>>   		return v4l2_subdev_call(sd, video, querystd, arg);
>>   
>> +	case VIDIOC_SUBDEV_G_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_krouting krouting = {
>> +			.which = routing->which,
>> +			.num_routes = routing->num_routes,
>> +			.routes = (struct v4l2_subdev_route *)(uintptr_t)
>> +					  routing->routes,
>> +		};
>> +		int ret;
>> +
>> +		ret = v4l2_subdev_call(sd, pad, get_routing, &krouting);
>> +
>> +		routing->num_routes = krouting.num_routes;
>> +
>> +		return ret;
>> +	}
>> +
>> +	case VIDIOC_SUBDEV_S_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_route *routes =
>> +			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
>> +		struct v4l2_subdev_krouting krouting = {};
>> +		unsigned int i;
>> +
>> +		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>> +			return -EPERM;
>> +
>> +		for (i = 0; i < routing->num_routes; ++i) {
>> +			if (routes[i].sink_pad >= sd->entity.num_pads ||
>> +			    routes[i].source_pad >= sd->entity.num_pads)
>> +				return -EINVAL;
>> +
>> +			if (!(sd->entity.pads[routes[i].sink_pad].flags &
>> +			      MEDIA_PAD_FL_SINK) ||
>> +			    !(sd->entity.pads[routes[i].source_pad].flags &
>> +			      MEDIA_PAD_FL_SOURCE))
>> +				return -EINVAL;
>> +		}
>> +
>> +		krouting.which = routing->which;
>> +		krouting.num_routes = routing->num_routes;
>> +		krouting.routes = routes;
>> +
>> +		return v4l2_subdev_call(sd, pad, set_routing, &krouting);
>> +	}
>> +
>>   	default:
>>   		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>>   	}
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 70a21298020b..c45f5f0156c9 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -660,6 +660,22 @@ struct v4l2_subdev_pad_config {
>>   	struct v4l2_rect try_compose;
>>   };
>>   
>> +/**
>> + * struct v4l2_subdev_krouting - subdev routing table
>> + *
>> + * @which: format type (from enum v4l2_subdev_format_whence)
>> + * @routes: &struct v4l2_subdev_route
>> + * @num_routes: number of routes
>> + *
>> + * This structure is used to translate arguments received from
>> + * VIDIOC_SUBDEV_G/S_ROUTING() ioctl to subdev device drivers operations.
>> + */
>> +struct v4l2_subdev_krouting {
>> +	u32 which;
>> +	struct v4l2_subdev_route *routes;
>> +	unsigned int num_routes;
>> +};
>> +
>>   /**
>>    * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>>    *
>> @@ -721,6 +737,10 @@ struct v4l2_subdev_pad_config {
>>    *		     applied to the hardware. The operation shall fail if the
>>    *		     pad index it has been called on is not valid or in case of
>>    *		     unrecoverable failures.
>> + *
>> + * @get_routing: get the subdevice routing table.
>> + * @set_routing: enable or disable data connection routes described in the
>> + *		 subdevice routing table.
>>    */
>>   struct v4l2_subdev_pad_ops {
>>   	int (*init_cfg)(struct v4l2_subdev *sd,
>> @@ -765,6 +785,10 @@ struct v4l2_subdev_pad_ops {
>>   			       struct v4l2_mbus_config *config);
>>   	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>>   			       struct v4l2_mbus_config *config);
>> +	int (*get_routing)(struct v4l2_subdev *sd,
>> +			   struct v4l2_subdev_krouting *route);
>> +	int (*set_routing)(struct v4l2_subdev *sd,
>> +			   struct v4l2_subdev_krouting *route);
>>   };
>>   
>>   /**
>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>> index 658106f5b5dc..3a360cdcacf4 100644
>> --- a/include/uapi/linux/v4l2-subdev.h
>> +++ b/include/uapi/linux/v4l2-subdev.h
>> @@ -188,6 +188,52 @@ struct v4l2_subdev_capability {
>>   /* The v4l2 sub-device video device node is registered in read-only mode. */
>>   #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>>   
>> +/*
> 
> Shouldn't this be /** ?
> 
>> + * Is the route active? An active route will start when streaming is enabled
>> + * on a video node.
> 
> Even with an a priori knowledge of the topic, I'm not sure to really
> understand this, and I don't think it reflects the purpose of the flag.
> 
>> + */
>> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
>> +
>> +/*
>> + * Is the route immutable, i.e. can it be activated and inactivated?
> 
> Maybe adding "An immutable route is always active".

Is it? I was thinking that immutable could be used as a way to have a 
static routing table, but the routes could still be enabled and 
disables. Say, a sensor could have pixel and metadata streams. They 
would be immutable, you can't remove them, change them or add any other 
streams. But you could still enable/disable them.

But the doc doesn't convey this. And I think we would still need a way 
to describe what you mentioned, a route that's always there and enabled.

  Tomi
