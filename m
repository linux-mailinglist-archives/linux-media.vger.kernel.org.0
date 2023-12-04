Return-Path: <linux-media+bounces-1592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7480350D
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D233B2810AB
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5E525114;
	Mon,  4 Dec 2023 13:36:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B4C249ED
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 13:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50833C433C9;
	Mon,  4 Dec 2023 13:36:25 +0000 (UTC)
Message-ID: <554fe06a-2c70-4d6b-abed-305a27972fb8@xs4all.nl>
Date: Mon, 4 Dec 2023 14:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/28] media: v4l: subdev: Add len_routes field to
 struct v4l2_subdev_routing
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-7-sakari.ailus@linux.intel.com>
 <a7afd593-b90c-4109-88b7-84d368ee9e5d@xs4all.nl>
 <ZWXrhE3FTLVdgcUS@kekkonen.localdomain>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <ZWXrhE3FTLVdgcUS@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 14:30, Sakari Ailus wrote:
> Hi Hans,
> 
> Thank you for the review. I somehow missed replying to this earlier, before
> posting v7.
> 
> On Thu, Oct 05, 2023 at 01:00:15PM +0200, Hans Verkuil wrote:
>> On 03/10/2023 14:08, Sakari Ailus wrote:
>>> The len_routes field is used to tell the size of the routes array in
>>> struct v4l2_subdev_routing. This way the number of routes returned from
>>> S_ROUTING IOCTL may be larger than the number of routes provided, in case
>>> there are more routes returned by the driver.
>>>
>>> Note that this changes the (now-disabled) UAPI, users must be updated.
>>
>> With "now-disabled" you mean "still disabled", right?
>>
>> So:
>>
>> "Note that this uAPI is still disabled in the code, so this change can
>> safely be done. Anyone who manually patched the code to enable this uAPI
>> must update their code."
> 
> I can add that.
> 
>>
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  .../media/v4l/vidioc-subdev-g-routing.rst     | 31 ++++++++++++-------
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
>>>  drivers/media/v4l2-core/v4l2-subdev.c         |  6 +++-
>>>  include/media/v4l2-subdev.h                   |  2 ++
>>>  include/uapi/linux/v4l2-subdev.h              |  8 +++--
>>>  5 files changed, 34 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>>> index 72677a280cd6..9a9765ddc316 100644
>>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>>> @@ -46,20 +46,26 @@ with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
>>>  setting or clearing flags of the  ``flags`` field of a
>>>  struct :c:type:`v4l2_subdev_route`.
>>>  
>>> -All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
>>> -means that the userspace must reconfigure all streams after calling the ioctl
>>> -with e.g. ``VIDIOC_SUBDEV_S_FMT``.
>>> +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
>>> +called. This means that the userspace must reconfigure all streams after calling
>>> +the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
>>>  
>>>  Only subdevices which have both sink and source pads can support routing.
>>>  
>>> -When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
>>> -provided ``num_routes`` is not big enough to contain all the available routes
>>> -the subdevice exposes, drivers return the ENOSPC error code and adjust the
>>> -value of the ``num_routes`` field. Application should then reserve enough memory
>>> -for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
>>> +The ``num_routes`` field is used to denote the number of routes set (set by user
>>> +space on ``VIDIOC_SUBDEV_S_ROUTING`` argument) on the routing table as well as
>>> +the number of routes returned back from both IOCTLs. The ``len_routes``
>>> +signifies the number of routes that can fit into the ``routes`` array. The
>>> +userspace shall set ``len_routes`` for both IOCTLs and ``num_routes`` for
>>> +``VIDIOC_SUBDEV_S_ROUTING``.
>>>  
>>> -On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
>>> -``num_routes`` field to reflect the actual number of routes returned.
>>> +On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
>>> +field to reflect the actual number of routes known by the driver. ``num_routes``
>>> +larger than ``len_routes`` in both IOCTLs. In this ``len_routes`` were returned
>>> +back to the userspace. This is not an error.
>>
>> This paragraph is garbled.
> 
> Oops. This intended to read:
> 
> On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
> field to reflect the actual number of routes known by the driver.
> ``num_routes`` larger than ``len_routes`` may be returned by both IOCTLs to
> indicate there are more routes than fits to the ``routes`` array. In this
> case first ``len_routes`` were returned back to the userspace in the
> ``routes`` array. This is not considered as an error.
> 
>>
>>> +
>>> +Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
>>> +``num_routes`` field due to e.g. hardware properties.
>>>  
>>>  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>>>  
>>> @@ -74,6 +80,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
>>>        - ``which``
>>>        - Format to modified, from enum
>>>          :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>> +    * - __u32
>>> +      - ``len_routes``
>>> +      - The length of the array (as in memory reserved for the array)
>>
>> So is this in bytes or in number of route entries?
>>
>> I think 'len_routes' is a terribly confusing name.
>>
>> How about 'max_num_routes'? Or 'max_route_elems/entries'?
>>
>>>      * - struct :c:type:`v4l2_subdev_route`
>>>        - ``routes[]``
>>>        - Array of struct :c:type:`v4l2_subdev_route` entries
>>> @@ -81,7 +90,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
>>>        - ``num_routes``
>>>        - Number of entries of the routes array
>>
>> This is now a very confusing field description.
>>
>> How about:
>>
>> 'max_num_routes': Maximum number of entries that can fit in the routes array
>> 'num_routes': Actual number of entries stored in the routes array.
>>
>>>      * - __u32
>>> -      - ``reserved``\ [5]
>>> +      - ``reserved``\ [11]
>>>        - Reserved for future extensions. Applications and drivers must set
>>>  	the array to zero.
>>>  
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index 6921a72566df..1e3da9d64958 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -3155,13 +3155,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>>>  	case VIDIOC_SUBDEV_S_ROUTING: {
>>>  		struct v4l2_subdev_routing *routing = parg;
>>>  
>>> -		if (routing->num_routes > 256)
>>> +		if (routing->len_routes > 256)
>>>  			return -E2BIG;
>>>  
>>>  		*user_ptr = u64_to_user_ptr(routing->routes);
>>>  		*kernel_ptr = (void **)&routing->routes;
>>>  		*array_size = sizeof(struct v4l2_subdev_route)
>>> -			    * routing->num_routes;
>>> +			    * routing->len_routes;
>>>  		ret = 1;
>>>  		break;
>>>  	}
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index 614ff0031831..bd1e8205913c 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -903,6 +903,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>>  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>>>  			return -EPERM;
>>>  
>>> +		if (routing->num_routes > routing->len_routes)
>>> +			return -EINVAL;
> 0> > +
>>>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>>>  
>>>  		for (i = 0; i < routing->num_routes; ++i) {
>>> @@ -929,6 +932,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>>  		}
>>>  
>>>  		krouting.num_routes = routing->num_routes;
>>> +		krouting.len_routes = routing->len_routes;
>>>  		krouting.routes = routes;
>>>  
>>>  		return v4l2_subdev_call(sd, pad, set_routing, state,
>>> @@ -949,7 +953,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>>  
>>>  		krouting = &state->routing;
>>>  
>>> -		if (routing->num_routes < krouting->num_routes) {
>>> +		if (routing->len_routes < krouting->num_routes) {
>>>  			routing->num_routes = krouting->num_routes;
>>>  			return -ENOSPC;
>>>  		}
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index e49e8af2fb52..baaa81a9497e 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -741,12 +741,14 @@ struct v4l2_subdev_stream_configs {
>>>  /**
>>>   * struct v4l2_subdev_krouting - subdev routing table
>>>   *
>>> + * @len_routes: length of routes array, in routes
>>>   * @num_routes: number of routes
>>>   * @routes: &struct v4l2_subdev_route
>>>   *
>>>   * This structure contains the routing table for a subdev.
>>>   */
>>>  struct v4l2_subdev_krouting {
>>> +	unsigned int len_routes;
>>>  	unsigned int num_routes;
>>>  	struct v4l2_subdev_route *routes;
>>>  };
>>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>>> index 4a195b68f28f..b57fb89caa9e 100644
>>> --- a/include/uapi/linux/v4l2-subdev.h
>>> +++ b/include/uapi/linux/v4l2-subdev.h
>>> @@ -222,15 +222,17 @@ struct v4l2_subdev_route {
>>>   * struct v4l2_subdev_routing - Subdev routing information
>>>   *
>>>   * @which: configuration type (from enum v4l2_subdev_format_whence)
>>> - * @num_routes: the total number of routes in the routes array
>>> + * @len_routes: the length of the routes array, in routes
>>>   * @routes: pointer to the routes array
>>> + * @num_routes: the total number of routes in the routes array
> 
> I'll change this to reflect there may be more routes than fits to the
> array.
> 
>>>   * @reserved: drivers and applications must zero this array
>>>   */
>>>  struct v4l2_subdev_routing {
>>>  	__u32 which;
>>> -	__u32 num_routes;
>>> +	__u32 len_routes;
>>>  	__u64 routes;
>>> -	__u32 reserved[6];
>>> +	__u32 num_routes;
>>> +	__u32 reserved[11];
>>>  };
>>>  
>>>  /*
>>
>> I'm going with a NACK for the 'len_routes' name, it's a really, really
>> bad name.
>>
>> So:
>>
>> Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> That's bit harsh judgement due to a differing opinion on a field name. I
> think len_routes is fine as it's the length of the routes array, not the
> number of entries in it but I'm totally fine changing it.
> 
> max_num_routes isn't great either as num_routes can effectively be larger
> than max_num_routes.
> 
> How about "size_routes", for instance? Or "max_elems_routes"?
> 

I think we should keep the meaning of num_routes as exactly that: the
number of routes that can be stored in the routes array. This is consistent
with the struct media_v2_topology use of the num_ fields.

What you want is to be able to tell the driver how many of the routes
in the routes array should be used for setting routes.

How about adding a field "set_routes" instead? It is ignored by G_ROUTING,
and S_ROUTING will set the first 'set_routes' elements in the 'routes'
array. I'm not sure if set_routes should be set to 0 upon return: does
the ordering of the routes change? Or are the first 'set_routes' elements
the same as what the user put in originally?

If set_routes > num_routes, then return -EINVAL. If set_routes is 0, would
that clear all routing?

With a naming scheme like this it can also be used if we ever implement a
S_TOPOLOGY ioctl.

Regards,

	Hans

