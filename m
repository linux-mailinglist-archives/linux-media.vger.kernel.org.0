Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6374DC096
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 09:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiCQIDK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 04:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiCQIDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 04:03:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF03EBB9D
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:01:52 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DD5F493;
        Thu, 17 Mar 2022 09:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647504110;
        bh=+MxiUN3cokCNNsodtt8jkDPplJGGdEAzuWTWr1OlQtY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WtWKr4dfJ4xon9wgTfZDlfmiwcrF1Nxjmh8Brmi18iW3hPxaJ2HByqKNrugzt0MvB
         TjMHGct7ekzOw8WEe80iYulXrFhpP+HE7R+SnRw6aX9ZXecLt7mykQO8KKbmMKh0O3
         p1qSdiOJ1KWDafdJak90vUQw3IFudgkWJyiPH9hs=
Message-ID: <616883b2-a85f-de61-31a0-91b514f61bf4@ideasonboard.com>
Date:   Thu, 17 Mar 2022 10:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 26/36] media: subdev: add stream based configuration
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-27-tomi.valkeinen@ideasonboard.com>
 <20220316095905.cbqz4lihcrfrbpv6@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316095905.cbqz4lihcrfrbpv6@uno.localdomain>
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

On 16/03/2022 11:59, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Mar 01, 2022 at 06:11:46PM +0200, Tomi Valkeinen wrote:
>> Add support to manage configurations (format, crop, compose) per stream,
>> instead of per pad. This is accomplished with data structures that hold
>> an array of all subdev's stream configurations.
>>
>> The number of streams can vary at runtime based on routing. Every time
>> the routing is changed, the stream configurations need to be
>> re-initialized.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
>>   .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
>>   .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
>>   .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
>>   .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
>>   .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
>>   .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c         | 129 ++++++++++++++++--
>>   include/media/v4l2-subdev.h                   |  48 +++++++
>>   include/uapi/linux/v4l2-subdev.h              |  28 +++-
>>   10 files changed, 218 insertions(+), 22 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>> index 3703943b412f..8def4c05d3da 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>> @@ -92,7 +92,10 @@ multiple pads of the same sub-device is not defined.
>>         - Frame intervals to be enumerated, from enum
>>   	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>       * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
> 
> Does VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (as well as
> VIDIOC_SUBDEV_G_FRAME_INTERVAL) need to be stream-aware ?
> 
> What is the semantic of the stream identifiers for IOCTLs that seem to
> control a paramter which is global to the subdev ? Isn't the stream semantic
> required to be specified in the IOCTL documentation and not just added
> to the list of fields ?

Why would it be global to the subdev? struct 
v4l2_subdev_frame_interval_enum already has 'pad' field, so it operates 
on that pad. With streams, each stream in a pad may have different 
characteristics, (similarly to different pads in non-stream case), so it 
feels logical to me to add the 'stream' field.

>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
>> index c25a9896df0e..3ef361c0dca7 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
>> @@ -97,7 +97,10 @@ information about try formats.
>>         - Frame sizes to be enumerated, from enum
>>   	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>       * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
>> index 417f1a19bcc4..248f6f9ee7c5 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
>> @@ -73,7 +73,10 @@ information about the try formats.
>>         - ``flags``
>>         - See :ref:`v4l2-subdev-mbus-code-flags`
>>       * - __u32
>> -      - ``reserved``\ [7]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [6]
>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>> index bd15c0a5a66b..1d267f7e7991 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>> @@ -96,7 +96,10 @@ modified format should be as close as possible to the original request.
>>         - ``rect``
>>         - Crop rectangle boundaries, in pixels.
>>       * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
>> index 7acdbb939d89..ed253a1e44b7 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
>> @@ -102,7 +102,10 @@ should be as close as possible to the original request.
>>         - Definition of an image format, see :c:type:`v4l2_mbus_framefmt` for
>>   	details.
>>       * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
>> index d7fe7543c506..842f962d2aea 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
>> @@ -90,7 +90,10 @@ the same sub-device is not defined.
>>         - ``interval``
>>         - Period, in seconds, between consecutive video frames.
>>       * - __u32
>> -      - ``reserved``\ [9]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [8]
>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
>> index f9172a42f036..6b629c19168c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
>> @@ -94,7 +94,10 @@ Selection targets and flags are documented in
>>         - ``r``
>>         - Selection rectangle, in pixels.
>>       * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>         - Reserved for future extensions. Applications and drivers must set
>>   	the array to zero.
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 1c836c2de86e..339d7b15e26c 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -149,14 +149,34 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>>   	return 0;
>>   }
> 
> To be honest, the only IOCTL for which I have a clear idea of the
> stream paramter semantic is s/g_format.

I admit I don't have much experience with some of these ioctls. But the 
idea is simple: in non-stream case ioctls operate on a subdev pad, in 
stream case those ioctls operate on a subdev pad + stream tuple.

If there's an ioctl that truly operates on a pad only, then we need to 
drop the stream parameter. But the ioctls don't look like that to me.

>> -static int check_state_pads(u32 which, struct v4l2_subdev_state *state)
>> +static int check_state_pads(struct v4l2_subdev *sd, u32 which,
>> +			    struct v4l2_subdev_state *state)
>>   {
>> +	if (sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)
>> +		return 0;
>> +
>>   	if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
>>   		return -EINVAL;
>>
>>   	return 0;
>>   }
>>
>> +static int check_state_pad_stream(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_state *state, u32 pad,
>> +				  u32 stream)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
>> +		return 0;
>> +
>> +	fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
> 
> check_state_pads() is always called in conjunction with
> check_state_pad_stream(). I would have made a check_state() that
> handles the multiplexed and non-multiplexed case. But that's an
> implementation detail, so up to you.

That's true. I think it looked a bit different in earlier versions, but 
looking at it now, combining those two makes sense.

>>   static inline int check_format(struct v4l2_subdev *sd,
>>   			       struct v4l2_subdev_state *state,
>>   			       struct v4l2_subdev_format *format)
>> @@ -165,7 +185,8 @@ static inline int check_format(struct v4l2_subdev *sd,
>>   		return -EINVAL;
>>
>>   	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
>> -	       check_state_pads(format->which, state);
>> +	       check_state_pads(sd, format->which, state) ? :
>> +	       check_state_pad_stream(sd, state, format->pad, format->stream);
>>   }
>>
>>   static int call_get_fmt(struct v4l2_subdev *sd,
>> @@ -192,7 +213,8 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
>>   		return -EINVAL;
>>
>>   	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
>> -	       check_state_pads(code->which, state) ? :
>> +	       check_state_pads(sd, code->which, state) ? :
>> +	       check_state_pad_stream(sd, state, code->pad, code->stream) ? :
>>   	       sd->ops->pad->enum_mbus_code(sd, state, code);
>>   }
>>
>> @@ -204,7 +226,8 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
>>   		return -EINVAL;
>>
>>   	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
>> -	       check_state_pads(fse->which, state) ? :
>> +	       check_state_pads(sd, fse->which, state) ? :
>> +	       check_state_pad_stream(sd, state, fse->pad, fse->stream) ? :
>>   	       sd->ops->pad->enum_frame_size(sd, state, fse);
>>   }
>>
>> @@ -239,7 +262,8 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
>>   		return -EINVAL;
>>
>>   	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
>> -	       check_state_pads(fie->which, state) ? :
>> +	       check_state_pads(sd, fie->which, state) ? :
>> +	       check_state_pad_stream(sd, state, fie->pad, fie->stream) ? :
>>   	       sd->ops->pad->enum_frame_interval(sd, state, fie);
> 
> call_g_frame_interval and call_s_frame_interval do accept a struct
> v4l2_subdev_frame_interval paramter now. Should the validity of
> streams be checked there too ?

Yes, I need to check this.

>>   }
>>
>> @@ -251,7 +275,8 @@ static inline int check_selection(struct v4l2_subdev *sd,
>>   		return -EINVAL;
>>
>>   	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
>> -	       check_state_pads(sel->which, state);
>> +	       check_state_pads(sd, sel->which, state) ? :
>> +	       check_state_pad_stream(sd, state, sel->pad, sel->stream);
>>   }
>>
>>   static int call_get_selection(struct v4l2_subdev *sd,
>> @@ -865,6 +890,71 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>>
>>   #ifdef CONFIG_MEDIA_CONTROLLER
>>
>> +static int
>> +v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
>> +				const struct v4l2_subdev_krouting *routing)
>> +{
>> +	u32 num_configs = 0;
>> +	unsigned int i;
>> +	u32 format_idx = 0;
>> +
>> +	kvfree(stream_configs->configs);
>> +	stream_configs->configs = NULL;
>> +	stream_configs->num_configs = 0;
>> +
>> +	/* Count number of formats needed */
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
> 
> This is a good candidate for for_each_active_route()

Indeed.

>> +
>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
>> +
>> +		/*
>> +		 * Each route needs a format on both ends of the route, except
>> +		 * for source streams which only need one format.
>> +		 */
>> +		num_configs +=
>> +			(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE) ? 1 : 2;
>> +	}
>> +
>> +	if (num_configs) {
>> +		stream_configs->configs =
>> +			kvcalloc(num_configs, sizeof(*stream_configs->configs),
>> +				 GFP_KERNEL);
>> +
>> +		if (!stream_configs->configs)
>> +			return -ENOMEM;
>> +
>> +		stream_configs->num_configs = num_configs;
>> +	}
>> +
>> +	/*
>> +	 * Fill in the 'pad' and stream' value for each item in the array from
>> +	 * the routing table
>> +	 */
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +		u32 idx;
>> +
>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
> 
> you iterate only active routes again. Which makes me think that you
> could return after the first loop if (!num_configs) ?

Yes, I think you're right.

>> +
>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
>> +			idx = format_idx++;
>> +
>> +			stream_configs->configs[idx].pad = route->sink_pad;
>> +			stream_configs->configs[idx].stream = route->sink_stream;
>> +		}
>> +
>> +		idx = format_idx++;
>> +
>> +		stream_configs->configs[idx].pad = route->source_pad;
>> +		stream_configs->configs[idx].stream = route->source_stream;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>>   				      struct fwnode_endpoint *endpoint)
>>   {
>> @@ -1042,7 +1132,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>>   	else
>>   		state->lock = &state->_lock;
>>
>> -	if (sd->entity.num_pads) {
>> +	/* Drivers that support streams do not need the legacy pad config */
>> +	if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) && sd->entity.num_pads) {
>>   		state->pads = kvmalloc_array(sd->entity.num_pads,
>>   					     sizeof(*state->pads),
>>   					     GFP_KERNEL | __GFP_ZERO);
>> @@ -1083,6 +1174,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>>   	mutex_destroy(&state->_lock);
>>
>>   	kfree(state->routing.routes);
>> +	kvfree(state->stream_configs.configs);
>>   	kvfree(state->pads);
>>   	kfree(state);
>>   }
>> @@ -1133,10 +1225,31 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>>   		dst->num_routes = src->num_routes;
>>   	}
>>
>> -	return 0;
>> +	return v4l2_subdev_init_stream_configs(&state->stream_configs, dst);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
>>
>> +struct v4l2_mbus_framefmt *
>> +v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>> +				    unsigned int pad, u32 stream)
>> +{
>> +	struct v4l2_subdev_stream_configs *stream_configs;
>> +	unsigned int i;
>> +
>> +	lockdep_assert_held(state->lock);
> 
> This function is only called by check_state_pad_stream(). Does it

It is used in multiple places later.

> locks the state ? I understand this is temporary only as other users
> introduced later will lock the state ?

The caller is supposed to lock the state. subdev_do_ioctl_lock() does it 
here. Do you mean the call wrappers could be called via some other route?

  Tomi
