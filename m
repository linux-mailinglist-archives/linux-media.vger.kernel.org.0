Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CB5367F65
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 13:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbhDVLQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 07:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236062AbhDVLQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 07:16:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B33C06138E
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 04:16:14 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6467B3EE;
        Thu, 22 Apr 2021 13:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619090171;
        bh=jA9Wy5lIPDKKaedALO5L/OMigzbauTyOwAI6xrLR8Cc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jb1pNz0/vRFcxMsA9WVlxZrxBnUv939x0+ABp8Lk3Rqch25Sp1OmyRnOsT+XxIojQ
         6I9yf+iq+vdv0Rj3ncRRSujzUXghA0fxYLdBIig4JUVPVUPz0Juz6pbtesg9UEGCNJ
         n40kk7d0RDB2H4obT0skBMH42/tShU60dtyyOOEI=
Subject: Re: [PATCH v5 18/24] v4l: subdev: Add [GS]_ROUTING subdev ioctls and
 operations
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-19-tomi.valkeinen@ideasonboard.com>
 <YHx7T46lkIqu/81e@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <92190167-b38e-a5bd-b475-0c63760948e2@ideasonboard.com>
Date:   Thu, 22 Apr 2021 14:16:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHx7T46lkIqu/81e@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 21:32, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:44PM +0300, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
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
> 
> Seems few people haven't contributed to this patch one way or another
> :-)

The more the merrier!

>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c  | 25 ++++++++++++++-
>>   drivers/media/v4l2-core/v4l2-subdev.c | 45 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 24 ++++++++++++++
>>   include/uapi/linux/v4l2-subdev.h      | 44 ++++++++++++++++++++++++++
>>   4 files changed, 137 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 6a5d1c6d11d6..f5732962753f 100644
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
>> +		struct v4l2_subdev_routing *route = parg;
> 
> s/route/routing/ to match the code below.
> 
>> +
>> +		if (route->num_routes > 256)
>> +			return -EINVAL;
>> +
>> +		*user_ptr = u64_to_user_ptr(route->routes);
>> +		*kernel_ptr = (void **)&route->routes;
>> +		*array_size = sizeof(struct v4l2_subdev_route)
>> +			    * route->num_routes;
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
>> index 956dafab43d4..95a4c3091fa6 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -681,6 +681,51 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   	case VIDIOC_SUBDEV_QUERYSTD:
>>   		return v4l2_subdev_call(sd, video, querystd, arg);
>>   
>> +	case VIDIOC_SUBDEV_G_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_krouting krouting = {
>> +			.which = routing->which,
>> +			.num_routes = routing->num_routes,
>> +			.routes = (struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>> +		};
>> +		int ret;
>> +
>> +		ret = v4l2_subdev_call(sd, pad, get_routing, &krouting);
>> +		if (ret)
>> +			return ret;
>> +
>> +		routing->num_routes = krouting.num_routes;
> 
> Shouldn't num_routes be set even in case of errors ?

Yes, you're right.

>> +
>> +		return 0;
>> +	}
>> +
>> +	case VIDIOC_SUBDEV_S_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_route *route = (struct v4l2_subdev_route *)(uintptr_t)
>> +						  routing->routes;
> 
> I'd name the variable routes as it points to an array.
> 
>> +		struct v4l2_subdev_krouting krouting = {};
>> +		unsigned int i;
>> +
>> +		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>> +			return -EPERM;
>> +
>> +		for (i = 0; i < routing->num_routes; ++i) {
>> +			if (route[i].sink_pad >= sd->entity.num_pads ||
>> +			    route[i].source_pad >= sd->entity.num_pads)
>> +				return -EINVAL;
>> +
>> +			if (!(sd->entity.pads[route[i].sink_pad].flags & MEDIA_PAD_FL_SINK) ||
>> +			    !(sd->entity.pads[route[i].source_pad].flags & MEDIA_PAD_FL_SOURCE))
>> +				return -EINVAL;
>> +		}
>> +
>> +		krouting.which = routing->which;
>> +		krouting.num_routes = routing->num_routes;
>> +		krouting.routes = route;
>> +
>> +		return v4l2_subdev_call(sd, pad, set_routing, &krouting);
>> +	}
>> +
>>   	default:
>>   		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>>   	}
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 436d0445aafd..3826ab918731 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -650,6 +650,22 @@ struct v4l2_subdev_pad_config {
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
>> + * This structure is used to translate argument received from
> 
> s/argument/the arguments/
> 
>> + * VIDIOC_SUBDEV_G/S_ROUTING() ioctl to sudev device drivers operations.
> 
> s/sudev/subdev/
> 
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
>> @@ -711,6 +727,10 @@ struct v4l2_subdev_pad_config {
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
>> @@ -755,6 +775,10 @@ struct v4l2_subdev_pad_ops {
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
>> index 658106f5b5dc..f2a17cbd1e9a 100644
>> --- a/include/uapi/linux/v4l2-subdev.h
>> +++ b/include/uapi/linux/v4l2-subdev.h
>> @@ -188,6 +188,48 @@ struct v4l2_subdev_capability {
>>   /* The v4l2 sub-device video device node is registered in read-only mode. */
>>   #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>>   
>> +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
>> +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
>> +
>> +/**
>> + * struct v4l2_subdev_route - A route inside a subdev
>> + *
>> + * @sink_pad: the sink pad index
>> + * @sink_stream: the sink stream identifier
>> + * @source_pad: the source pad index
>> + * @source_stream: the source stream identifier
>> + * @flags: route flags:
>> + *
>> + *	V4L2_SUBDEV_ROUTE_FL_ACTIVE: Is the route active? An active
>> + *	route will start when streaming is enabled on a video node.
>> + *	Set by the user.
>> + *
>> + *	V4L2_SUBDEV_ROUTE_FL_IMMUTABLE: Is the route immutable, i.e.
>> + *	can it be activated and inactivated? Set by the driver.
> 
> This should be moved to the macros.
> 
>> + */
>> +struct v4l2_subdev_route {
>> +	__u32 sink_pad;
>> +	__u32 sink_stream;
>> +	__u32 source_pad;
>> +	__u32 source_stream;
>> +	__u32 flags;
>> +	__u32 reserved[5];
>> +};
>> +
>> +/**
>> + * struct v4l2_subdev_routing - Subdev routing information
>> + *
>> + * @which: format type (from enum v4l2_subdev_format_whence)
> 
> v4l2_subdev_format_whence shoudn't have had "format" in its name :-S We
> can't do much about that, but should "format type" be changed to "routes
> type", or maybe "configuration type" ?
> 
>> + * @routes: pointer to the routes array
>> + * @num_routes: the total number of routes in the routes array
> 
> Won't kerneldoc complain about the undocumented reserved field ?
> 
>> + */
>> +struct v4l2_subdev_routing {
>> +	__u32 which;
>> +	__u64 routes;
>> +	__u32 num_routes;
>> +	__u32 reserved[5];
>> +};
>> +
>>   /* Backwards compatibility define --- to be removed */
>>   #define v4l2_subdev_edid v4l2_edid
>>   
>> @@ -215,5 +257,7 @@ struct v4l2_subdev_capability {
>>   #define VIDIOC_SUBDEV_ENUM_DV_TIMINGS		_IOWR('V', 98, struct v4l2_enum_dv_timings)
>>   #define VIDIOC_SUBDEV_QUERY_DV_TIMINGS		_IOR('V', 99, struct v4l2_dv_timings)
>>   #define VIDIOC_SUBDEV_DV_TIMINGS_CAP		_IOWR('V', 100, struct v4l2_dv_timings_cap)
>> +#define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
>> +#define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
> 
> I would keep the ioctls sorted by number.

The ioctls are not sorted (even if it may look like it above =). I'm not 
sure if there's a better place for them than the bottom.

  Tomi
