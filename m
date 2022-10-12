Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EBE5FC35D
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 12:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiJLKBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 06:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiJLKBm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 06:01:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14789AE861
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 03:01:36 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E3974DB;
        Wed, 12 Oct 2022 12:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665568893;
        bh=0Z72kk/V4kYIt+UFdsFe4qkiRRw/i4/qYjZXHkOk8gs=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=R4uQ7QKfehc0YeqD9LSwNOvI/kV0qVx22ZWe7/nJS+14eCNR7ZAKZyA1IsOEb7UBS
         JeZPSr8uRxPNbyP9NArdvEd6wn9fsgE2Cvs+U+IvWQFRRdZbO410QZCYI4rW7GSFsT
         oQIJudephTPFWqJeGIbPRlmaKdmK/Eix4DIFI79E=
Message-ID: <bc575b8d-6d91-fffc-5674-fb2303366f42@ideasonboard.com>
Date:   Wed, 12 Oct 2022 13:01:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 04/19] media: Documentation: Add GS_ROUTING
 documentation
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-5-tomi.valkeinen@ideasonboard.com>
 <2ea25584-de49-b311-14fe-8c430733bd7b@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <2ea25584-de49-b311-14fe-8c430733bd7b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 03/10/2022 17:31, Hans Verkuil wrote:
> Hi Tomi,
> 
> On 10/3/22 14:18, Tomi Valkeinen wrote:
>> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> Add documentation for VIDIOC_SUBDEV_G/S_ROUTING ioctl and add
>> description of multiplexed media pads and internal routing to the
>> V4L2-subdev documentation section.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>>   .../userspace-api/media/v4l/user-func.rst     |   1 +
>>   .../media/v4l/vidioc-subdev-g-routing.rst     | 155 ++++++++++++++++++
>>   3 files changed, 158 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> index fd1de0a73a9f..a67c2749089a 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> @@ -29,6 +29,8 @@ will feature a character device node on which ioctls can be called to
>>   
>>   -  negotiate image formats on individual pads
>>   
>> +-  inspect and modify internal data routing between pads of the same entity
>> +
>>   Sub-device character device nodes, conventionally named
>>   ``/dev/v4l-subdev*``, use major number 81.
>>   
>> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
>> index 53e604bd7d60..228c1521f190 100644
>> --- a/Documentation/userspace-api/media/v4l/user-func.rst
>> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
>> @@ -70,6 +70,7 @@ Function Reference
>>       vidioc-subdev-g-crop
>>       vidioc-subdev-g-fmt
>>       vidioc-subdev-g-frame-interval
>> +    vidioc-subdev-g-routing
>>       vidioc-subdev-g-selection
>>       vidioc-subdev-querycap
>>       vidioc-subscribe-event
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>> new file mode 100644
>> index 000000000000..6d8fc3b11352
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
>> @@ -0,0 +1,155 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +.. c:namespace:: V4L
>> +
>> +.. _VIDIOC_SUBDEV_G_ROUTING:
>> +
>> +******************************************************
>> +ioctl VIDIOC_SUBDEV_G_ROUTING, VIDIOC_SUBDEV_S_ROUTING
>> +******************************************************
>> +
>> +Name
>> +====
>> +
>> +VIDIOC_SUBDEV_G_ROUTING - VIDIOC_SUBDEV_S_ROUTING - Get or set routing between streams of media pads in a media entity.
>> +
>> +
>> +Synopsis
>> +========
>> +
>> +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_ROUTING, struct v4l2_subdev_routing *argp )
>> +    :name: VIDIOC_SUBDEV_G_ROUTING
>> +
>> +.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_ROUTING, struct v4l2_subdev_routing *argp )
>> +    :name: VIDIOC_SUBDEV_S_ROUTING
>> +
>> +
>> +Arguments
>> +=========
>> +
>> +``fd``
>> +    File descriptor returned by :ref:`open() <func-open>`.
>> +
>> +``argp``
>> +    Pointer to struct :c:type:`v4l2_subdev_routing`.
>> +
>> +
>> +Description
>> +===========
>> +
>> +These ioctls are used to get and set the routing in a media entity.
>> +The routing configuration determines the flows of data inside an entity.
>> +
>> +Drivers report their current routing tables using the
>> +``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
>> +with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
>> +setting or clearing flags of the  ``flags`` field of a
>> +struct :c:type:`v4l2_subdev_route`.
>> +
>> +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
>> +means that the userspace mut reconfigure all streams after calling the ioctl
> 
> typo: mut -> must
> 
>> +with e.g. ``VIDIOC_SUBDEV_S_FMT``.
>> +
>> +A special case for routing are routes marked with
>> +``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
>> +source endpoints on sensors and the sink fields are unused.
> 
> This is very vague. As mentioned in my review for 05/19 I think this flag should
> be renamed to INTERNAL_SOURCE. Then the last sentence can change to:
> 
> "These routes are used to describe source endpoints where the stream is internally
> created (such as a sensor) and so the sink fields are unused."
> 
>> +
>> +When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
>> +provided ``num_routes`` is not big enough to contain all the available routes
>> +the subdevice exposes, drivers return the ENOSPC error code and adjust the
>> +value of the ``num_routes`` field. Application should then reserve enough memory
>> +for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
>> +
>> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>> +
>> +.. c:type:: v4l2_subdev_routing
>> +
>> +.. flat-table:: struct v4l2_subdev_routing
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - __u32
>> +      - ``which``
>> +      - Format to modified, from enum
>> +        :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>> +    * - struct :c:type:`v4l2_subdev_route`
>> +      - ``routes[]``
>> +      - Array of struct :c:type:`v4l2_subdev_route` entries
>> +    * - __u32
>> +      - ``num_routes``
>> +      - Number of entries of the routes array
>> +    * - __u32
>> +      - ``reserved``\ [5]
>> +      - Reserved for future extensions. Applications and drivers must set
>> +	the array to zero.
>> +
>> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>> +
>> +.. c:type:: v4l2_subdev_route
>> +
>> +.. flat-table:: struct v4l2_subdev_route
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - __u32
>> +      - ``sink_pad``
>> +      - Sink pad number.
>> +    * - __u32
>> +      - ``sink_stream``
>> +      - Sink pad stream number.
>> +    * - __u32
>> +      - ``source_pad``
>> +      - Source pad number.
>> +    * - __u32
>> +      - ``source_stream``
>> +      - Source pad stream number.
>> +    * - __u32
>> +      - ``flags``
>> +      - Route enable/disable flags
>> +	:ref:`v4l2_subdev_routing_flags <v4l2-subdev-routing-flags>`.
>> +    * - __u32
>> +      - ``reserved``\ [5]
>> +      - Reserved for future extensions. Applications and drivers must set
>> +	the array to zero.
>> +
>> +.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
>> +
>> +.. _v4l2-subdev-routing-flags:
>> +
>> +.. flat-table:: enum v4l2_subdev_routing_flags
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       3 1 4
>> +
>> +    * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - 0
>> +      - The route is enabled. Set by applications.
>> +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
>> +      - 1
>> +      - The route is immutable. Set by the driver.
>> +    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
>> +      - 2
>> +      - The route is a source route, and the ``sink_pad`` and ``sink_stream``
>> +        fields are unused. Set by the driver.
> 
> Same issue as above, it's very vague.
> 
> "Used to describe a route source endpoint where the stream is internally
> created (such as a sensor) and so the sink fields are unused."

I think this and the above suggestion are good, I'll make the change.

  Tomi

