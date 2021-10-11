Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0D0428835
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 09:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhJKH7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 03:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbhJKH72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 03:59:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E233CC061570
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 00:57:28 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8256F2BD;
        Mon, 11 Oct 2021 09:57:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633939046;
        bh=NAa5JuUYtfMoVXCjMP8T6Oom4M23lRWQizuqg1pBwQg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=jyjOtr4hE2qTst1KB0QiTOgnqjHv7b0u+wIaa7rEaH59xS9ti+SbLdXIcZ6N6R67P
         GKXL8/fKLhYNk/BGXE2tJsKO9AMPo4ZpTav/5ffIlcUC0XD+UnswBTwovhTix2mO1i
         LU1EpUF94SsDLUPTtxJG/UCtjllg9jmCr+ksAoF8=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
 <YWKX/f09BoqVAPSu@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <b78e8348-4e43-918e-a589-9810382603ff@ideasonboard.com>
Date:   Mon, 11 Oct 2021 10:57:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWKX/f09BoqVAPSu@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/2021 10:36, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Oct 05, 2021 at 11:57:41AM +0300, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Add support for subdev internal routing. A route is defined as a single
>> stream from a sink pad to a source pad.
>>
>> The userspace can configure the routing via two new ioctls,
>> VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
>> implement the functionality with v4l2_subdev_pad_ops.set_routing().
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
>>   drivers/media/v4l2-core/v4l2-subdev.c | 75 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 22 ++++++++
>>   include/uapi/linux/v4l2-subdev.h      | 57 ++++++++++++++++++++
>>   4 files changed, 178 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 05d5db3d85e5..8e9315ffcb99 100644
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
>> @@ -3065,6 +3066,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
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
>> @@ -3328,8 +3344,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
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
>> index 52309a299b03..b4e1f8772d96 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -394,6 +394,12 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>>   		which = ((struct v4l2_subdev_selection *)arg)->which;
>>   		break;
>>   	}
>> +
>> +	case VIDIOC_SUBDEV_G_ROUTING:
>> +	case VIDIOC_SUBDEV_S_ROUTING: {
>> +		which = ((struct v4l2_subdev_routing *)arg)->which;
>> +		break;
>> +	}
>>   	}
>>   
>>   	return which == V4L2_SUBDEV_FORMAT_TRY ?
>> @@ -710,6 +716,74 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   	case VIDIOC_SUBDEV_QUERYSTD:
>>   		return v4l2_subdev_call(sd, video, querystd, arg);
>>   
>> +	case VIDIOC_SUBDEV_G_ROUTING: {
>> +		struct v4l2_subdev_routing *routing = arg;
>> +		struct v4l2_subdev_krouting *krouting;
>> +
>> +		if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
>> +			return -ENOIOCTLCMD;
> 
> Do we really want to condition the routing API to multiplexed streams
> support ? Internal subdev routing is useful for devices that don't
> support multiplexed streams, and forcing a switch to the multiplexed
> streams API for those concerns me. In particular, with the multiplexed
> streams API, pad formats only exist once routes are created. This is a
> major change compared to the existing API (and it led to the creation of
> the V4L2_SUBDEV_ROUTE_FL_SOURCE flag, which I'm still not entirely sure
> I like) and I don't have a good enough view of all its side effects yet.
> 
> This being said, if conditioning formats availability on pads to the
> existence of routes causes issues for such devices, maybe they would be
> better solved globally, as they could affect devices supporting
> multiplexed streams too.

V4L2_SUBDEV_FL_MULTIPLEXED doesn't exactly mean "the subdev supports 
multiplexed streams". It means "the subdev supports central active 
state, routing and multiplexed streams".

I thought about keeping the meaning, but renaming the flag, but I have 
no good idea for the name.

I thought about splitting the flag into separate parts (those three 
above), but the features are kind of interleaved: 1) both routing and 
streams depend on the new state, 2) streams depends on routing, 3) 
routing depends on streams.

Those dependencies exist currently in the code. With some effort I 
believe some or all of the dependencies could be removed.

But I would have to ask, why? What's the use case and benefit?

"Multiplexed streams support in a subdev" doesn't mean it has to have 
multiple streams. In fact, I believe a subdev that supports just a 
single stream is easier to implement with the multiplexed streams API 
than with the older pad-based API.

If you add routing support to a subdev, you anyway have to rethink how 
it works and restructure the code, why not clean it up a bit more with 
the multiplexed streams API at the same time?

> with the multiplexed streams API, pad formats only exist once routes are created

This is true, but the driver can force the routes to always exist. It 
can do this in the case the device does not support multiple streams. 
The route can be disabled, which should allow setting the formats but 
still keeping the route inactive. And it should be fine to have e.g. a 
single sink pad and 2 source pads, with routes from both source pads to 
the same sink pad, as long as the other one is disabled. But I haven't 
tested this, there might be a bug there somewhere.

I'm not a fan of V4L2_SUBDEV_ROUTE_FL_SOURCE either, but it wasn't 
created for the problem you describe. V4L2_SUBDEV_ROUTE_FL_SOURCE means 
that a subdev has an output stream that isn't routed to an input stream. 
You're talking about a case where you want a (pad,stream) to be 
configurable even if it's not routed anywhere (yet).

I think conceptually the flag is fine (i.e. a subdev with an output 
stream that isn't routed to an input stream). The problem is more about 
the routing table, as that is the place to define "stream configuration 
points". This is something I raised some time back, thinking out loud if 
the routing table should be dropped, and instead (somehow) define these 
configuration points per pad. So a pad would have a userspace defined 
list of (input-stream, other-pad, other-stream) tuples, where "other" 
means the pad/stream on the other side of the subdev. That "other" pad 
should have a matching, but reverse, entry.

It would be a bit cumbersome, though, I think. The routing table is an 
easier way to manage this, with V4L2_SUBDEV_ROUTE_FL_SOURCE flag. But if 
needed, we could look further into separating the routing and the 
management of the "config points".

  Tomi
