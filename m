Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E67257453D
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 08:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbiGNGrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 02:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiGNGrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 02:47:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC3E22515
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 23:47:19 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 880C6383;
        Thu, 14 Jul 2022 08:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657781235;
        bh=dShaQtskYlhTVXxNApboKwkDF9MPtEjDsrG/KxZxlew=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Z0IwZlOWOeLS5Uv2pyD1UI84nkJBTmYPL0qZQi54d/3VXINiNwEnP/k2CCBKgJFqy
         LyOiNNECaDTcM+f/hWy3Y49GcaCQ+VBVIDwuzMScIfOJPWUeQ117y5kVdZ8zP3bqeI
         scff2qWQKkmRZ3y65e6mQ1AefLoSafYKf9DPdgFQ=
Message-ID: <69a59451-738b-248a-82c9-2e57ef0163f4@ideasonboard.com>
Date:   Thu, 14 Jul 2022 09:47:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11 22/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-23-tomi.valkeinen@ideasonboard.com>
 <YsakLCHbfKF3R7vd@chromium.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YsakLCHbfKF3R7vd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 07/07/2022 12:15, Tomasz Figa wrote:
> Hi Tomi, Laurent,
> 
> On Tue, Mar 01, 2022 at 06:11:42PM +0200, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Add support for subdev internal routing. A route is defined as a single
>> stream from a sink pad to a source pad.
>>
>> The userspace can configure the routing via two new ioctls,
>> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
>> implement the functionality with v4l2_subdev_pad_ops.set_routing().
> 
> Thanks for the patch! Please check my comment inline.
> 
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>
>> - Add sink and source streams for multiplexed links
>> - Copy the argument back in case of an error. This is needed to let the
>>    caller know the number of routes.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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
>> - Add V4L2_SUBDEV_ROUTE_FL_SOURCE
>> - Routing to subdev state
>> - Dropped get_routing subdev op
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c  | 25 ++++++++-
>>   drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 22 ++++++++
>>   include/uapi/linux/v4l2-subdev.h      | 57 +++++++++++++++++++++
>>   4 files changed, 176 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 642cb90f457c..add3b28d446e 100644
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
>> @@ -3093,6 +3094,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>>   		ret = 1;
>>   		break;
>>   	}
>> +
>> +	case VIDIOC_SUBDEV_G_ROUTING:
>> +	case VIDIOC_SUBDEV_S_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = parg;
>> +
>> +		if (routing->num_routes > 256)
> 
> Should we define and document this constant?

It's just an arbitrary high number as a sanity check. We don't have any 
specific reason to limit the number of routes. If we publicize it to the 
userspace, then the userspace might depend on it. On the other hand, 
failing mystically when num-routes > 256 is also not so nice (not that 
we have any drivers that go there, 8 has been the max so far).

I think we should just keep it here internally, and try to make sure to 
increase it if we ever get drivers that might support more routes.

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
>> @@ -3356,8 +3372,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
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
>> index 3ad24093abe9..89c97bde4575 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -377,6 +377,10 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>>   	case VIDIOC_SUBDEV_S_SELECTION:
>>   		which = ((struct v4l2_subdev_selection *)arg)->which;
>>   		break;
>> +	case VIDIOC_SUBDEV_G_ROUTING:
>> +	case VIDIOC_SUBDEV_S_ROUTING:
>> +		which = ((struct v4l2_subdev_routing *)arg)->which;
>> +		break;
>>   	}
>>   
>>   	return which == V4L2_SUBDEV_FORMAT_TRY ?
>> @@ -692,6 +696,74 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   	case VIDIOC_SUBDEV_QUERYSTD:
>>   		return v4l2_subdev_call(sd, video, querystd, arg);
>>   
>> +	case VIDIOC_SUBDEV_G_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_krouting *krouting;
>> +
>> +		if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
>> +			return -ENOIOCTLCMD;
>> +
>> +		memset(routing->reserved, 0, sizeof(routing->reserved));
>> +
>> +		krouting = &state->routing;
>> +
>> +		if (routing->num_routes < krouting->num_routes) {
>> +			routing->num_routes = krouting->num_routes;
>> +			return -ENOSPC;
>> +		}
>> +
>> +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>> +		       krouting->routes,
>> +		       krouting->num_routes * sizeof(*krouting->routes));
>> +		routing->num_routes = krouting->num_routes;
>> +
>> +		return 0;
>> +	}
>> +
>> +	case VIDIOC_SUBDEV_S_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_route *routes =
>> +			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
>> +		struct v4l2_subdev_krouting krouting = {};
>> +		unsigned int i;
>> +
>> +		if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
>> +			return -ENOIOCTLCMD;
>> +
>> +		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>> +			return -EPERM;
>> +
>> +		memset(routing->reserved, 0, sizeof(routing->reserved));
>> +
>> +		for (i = 0; i < routing->num_routes; ++i) {
>> +			const struct v4l2_subdev_route *route = &routes[i];
>> +			const struct media_pad *pads = sd->entity.pads;
>> +
>> +			/* Do not check sink pad for source routes */
>> +			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
>> +				if (route->sink_pad >= sd->entity.num_pads)
>> +					return -EINVAL;
>> +
>> +				if (!(pads[route->sink_pad].flags &
>> +				      MEDIA_PAD_FL_SINK))
>> +					return -EINVAL;
>> +			}
>> +
>> +			if (route->source_pad >= sd->entity.num_pads)
>> +				return -EINVAL;
>> +
>> +			if (!(pads[route->source_pad].flags &
>> +			      MEDIA_PAD_FL_SOURCE))
>> +				return -EINVAL;
>> +		}
>> +
>> +		krouting.num_routes = routing->num_routes;
>> +		krouting.routes = routes;
>> +
>> +		return v4l2_subdev_call(sd, pad, set_routing, state,
>> +					routing->which, &krouting);
>> +	}
>> +
>>   	default:
>>   		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>>   	}
>> @@ -979,6 +1051,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>>   
>>   	mutex_destroy(&state->_lock);
>>   
>> +	kfree(state->routing.routes);
> 
> Do we have any guarantee that this array was allocated with kmalloc()?
> Maybe kvfree() could be more appropriate here?

The array is allocated with kmemdup() in v4l2_subdev_set_routing().

  Tomi
