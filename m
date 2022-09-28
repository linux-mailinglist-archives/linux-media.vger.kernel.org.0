Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2CC35ED6EA
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbiI1Hzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 03:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbiI1HzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 03:55:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60906242
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 00:54:50 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C45B247C;
        Wed, 28 Sep 2022 09:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664351687;
        bh=7uzdrmCjqqV40xH90SyBA4ZZzMTMPaYmsueST2oiAk0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dfGG8wXyPG4wjOmYzSQprKpi7JoOcVCeKRV2aA2yH/ole1Rwp1UxUDXVDqlCjMn80
         3vaeRI2tHr5WlBbJrdJQxRpbMw9WXp6Io/WQKCuLnTQ3YjEVoSYENgVtE4l+iOvhi0
         j5K7ArQMS8Oa4jGYwguOSx5eTQnMrCKhbSjmW3bw=
Message-ID: <549f6c1b-7956-649a-ed60-eac73a56fdd4@ideasonboard.com>
Date:   Wed, 28 Sep 2022 10:54:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 19/34] media: Documentation: Add GS_ROUTING
 documentation
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com>
 <YzKRMiumNoskMuxw@paasikivi.fi.intel.com>
 <97c4d4bc-9907-3ffc-1839-2678a30d53c4@ideasonboard.com>
 <YzLPOXkaWQe33g+q@paasikivi.fi.intel.com>
 <65aa282f-b75b-6cef-c1e8-94d9beb8971c@ideasonboard.com>
 <YzNnd2uoKk6JhyYC@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YzNnd2uoKk6JhyYC@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 28/09/2022 00:13, Sakari Ailus wrote:
> Moi,
> 
> On Tue, Sep 27, 2022 at 03:33:15PM +0300, Tomi Valkeinen wrote:
>> On 27/09/2022 13:23, Sakari Ailus wrote:
>>
>> <snip>
>>
>>>>>> +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
>>>>>> +means that the userspace mut reconfigure all streams after calling the ioctl
>>>>>> +with e.g. ``VIDIOC_SUBDEV_S_FMT``.
>>>>>
>>>>> How about this:
>>>>>
>>>>> Calling ``VIDIOC_SUBDEV_S_ROUTING`` will cause the selections and subdev
>>>>> formats being propagated from the sink pads towards the sources.
>>>>
>>>> Hmm, but that's not true. The selections and formats will be zeroed, unless
>>>> the driver initializes them to a value. There's no propagation done.
>>>
>>> They need to be propagated. The driver is responsible for maintaining a
>>> valid configuration for the processing steps in a sub-device, and with
>>> routes that must apply to routes as well.
>>
>> Hmm, no, they don't need to be propagated. The driver needs to initialize
>> the formats and selections to valid configuration, that is true, but it
>> doesn't mean the driver propagates settings from the sink pads to the source
>> pads. In theory the formats on sink and source sides could be different.
> 
> After propagation, the user may set the format (or selection) later on in
> the processing steps. The propagation is required by the spec and I don't
> see why it would be different for drivers with support for streams. Of
> course this needs to take place taking hardware limitations into account.

I don't disagree with the above, but I still don't see why it matters here.

So do you suggest replacing the current paragraph with your version? Or 
adding a new paragraph?

Why is propagation important here? Isn't the resetting of the 
configuration the important thing?

For me, the propagation concept is important in the case where the user 
configures the sink pads, as then the settings need to be propagated. 
Here it doesn't matter.

>> I guess you could say that the driver initializes the sink side streams and
>> then propagates those to the source side, but at least to me that gives the
>> wrong impression. What the driver does is initialize the configuration, or
>> reset the configuration to defaults (which it could do with propagation if
>> it so wants).
>>
>> The framework provides v4l2_subdev_set_routing_with_fmt() helper to achieve
>> this, which sets the given format to all streams.
>>
>> Anyway, I think we can talk about propagation if that helps, but I think the
>> main point there is that the settings are reset or initialized.
>>
>>>>>> +
>>>>>> +A special case for routing are routes marked with
>>>>>> +``V4L2_SUBDEV_ROUTE_FL_SOURCE`` flag. These routes are used to describe
>>>>>> +source endpoints on sensors and the sink fields are unused.
>>>>>> +
>>>>>> +When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
>>>>>> +provided ``num_routes`` is not big enough to contain all the available routes
>>>>>> +the subdevice exposes, drivers return the ENOSPC error code and adjust the
>>>>>> +value of the ``num_routes`` field. Application should then reserve enough memory
>>>>>> +for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
>>>>>> +
>>>>>> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>>>>>> +
>>>>>> +.. c:type:: v4l2_subdev_routing
>>>>>> +
>>>>>> +.. flat-table:: struct v4l2_subdev_routing
>>>>>> +    :header-rows:  0
>>>>>> +    :stub-columns: 0
>>>>>> +    :widths:       1 1 2
>>>>>> +
>>>>>> +    * - __u32
>>>>>> +      - ``which``
>>>>>> +      - Format to modified, from enum
>>>>>> +        :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>>>>> +    * - struct :c:type:`v4l2_subdev_route`
>>>>>> +      - ``routes[]``
>>>>>> +      - Array of struct :c:type:`v4l2_subdev_route` entries
>>>>>> +    * - __u32
>>>>>> +      - ``num_routes``
>>>>>> +      - Number of entries of the routes array
>>>>>> +    * - __u32
>>>>>> +      - ``reserved``\ [5]
>>>>>> +      - Reserved for future extensions. Applications and drivers must set
>>>>>> +	the array to zero.
>>>>>> +
>>>>>> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>>>>>> +
>>>>>> +.. c:type:: v4l2_subdev_route
>>>>>> +
>>>>>> +.. flat-table:: struct v4l2_subdev_route
>>>>>> +    :header-rows:  0
>>>>>> +    :stub-columns: 0
>>>>>> +    :widths:       1 1 2
>>>>>> +
>>>>>> +    * - __u32
>>>>>> +      - ``sink_pad``
>>>>>> +      - Sink pad number.
>>>>>> +    * - __u32
>>>>>> +      - ``sink_stream``
>>>>>> +      - Sink pad stream number.
>>>>>> +    * - __u32
>>>>>> +      - ``source_pad``
>>>>>> +      - Source pad number.
>>>>>> +    * - __u32
>>>>>> +      - ``source_stream``
>>>>>> +      - Source pad stream number.
>>>>>> +    * - __u32
>>>>>> +      - ``flags``
>>>>>> +      - Route enable/disable flags
>>>>>> +	:ref:`v4l2_subdev_routing_flags <v4l2-subdev-routing-flags>`.
>>>>>> +    * - __u32
>>>>>> +      - ``reserved``\ [5]
>>>>>> +      - Reserved for future extensions. Applications and drivers must set
>>>>>> +	the array to zero.
>>>>>> +
>>>>>> +.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
>>>>>> +
>>>>>> +.. _v4l2-subdev-routing-flags:
>>>>>> +
>>>>>> +.. flat-table:: enum v4l2_subdev_routing_flags
>>>>>> +    :header-rows:  0
>>>>>> +    :stub-columns: 0
>>>>>> +    :widths:       3 1 4
>>>>>> +
>>>>>> +    * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>>>>>> +      - 0
>>>>>> +      - The route is enabled. Set by applications.
>>>>>> +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
>>>>>
>>>>> How about calling this STATIC instead of IMMUTABLE? IMMUTABLE is used as a
>>>>> link flag to mean a link that may not be changed in any way. In this case
>>>>> we rather want to say that the route is always there, albeit you can still
>>>>> enable or disable it.
>>>>
>>>> If we think there's a need for this, I can add it back and name it static. I
>>>> think what it then should mean is that the user can enable/disable it and
>>>> also set the stream id, but the route must always exist.
>>>
>>> But the static routes are recognised by the stream ID only, aren't they?
>>>
>>> I think we'll definitely need a way to determine which routes are always
>>> there and which ones can be removed at will.
>>
>> That's the V4L2_SUBDEV_ROUTE_FL_SOURCE. V4L2_SUBDEV_ROUTE_FL_SOURCE routes
>> are always there, and the user can only enable or disable them.
>>
>> This is why I dropped IMMUTABLE, as SOURCE is already immutable (or rather,
>> static), and I don't see a need for a non-source route to be static.
> 
> We don't know of such a device at the moment but I'm fairly certain they
> exist. A number of older CSI-2 receivers do not support directing different
> VC/DT pairs to different buffers in any generic sort of way.

That is true, but the problem there is that the driver often does not 
know the number of streams.

For example, if we have a CSI-2 bridge which, say, has a single input 
and two output pads. It routes VC0 & 2 to the first output and VC1 & 3 
to the second output.

Here it would be easy to say that there are 4 static streams, going as 
described above. But that's not true, as data-types also define streams, 
so we can actually have a lot more streams there.

This, I think, essentially means that static routes can never be defined 
for any subdevice in the middle of the pipeline. The only places where 
we can have static routes are the very beginning and very end of the 
pipeline. For the beginning, i.e. the sensors, we already have source 
streams. But can we have static routes on the end side, basically just 
before the DMA?

If we have a CSI-2 receiver that has a hardcoded handling of the VC & 
DT, how does the userspace configure the routes? The userspace doesn't 
see the VCs or DTs. We could have static routes defined in the receiver 
subdevice, but does that help?

The HW I use, TI's CAL, has the means to configure VC/DT freely. But it 
has 8 DMA engines, and, of course, each stream has to go to a single DMA 
engine. So I think we could say that it has 8 static streams, and the 
user can only enable or disable them. But I'm not sure how much adding a 
new flag for this helps.

> Using one flag for two different purposes may thus prove problematic over
> time. I'd thus define another for the other purpose. In the worst case it
> won't be needed and we can make it obsolete later on.

I'd like to have a clear example of a setup where we need this flag and 
benefit from it before adding it.

In the CAL case I don't see much benefit. I think the only thing it 
gives us is a minimal discovery mechanism for the userspace to 
understand how CAL routes can be configured. I say minimal, as it still 
won't cover it fully as the validity of the routing depends on the 
actual VCs and DTs too (which will be found out only at the stream start 
time).

And this would only give us discovery for the receiver and wouldn't help 
with the bridges.

>>>>
>>>> But as I said above, I haven't figured out a use for this.
>>>>
>>>>>> +      - 1
>>>>>> +      - The route is immutable. Set by the driver.
>>>>>> +    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
>>>>>> +      - 2
>>>>>> +      - The route is a source route, and the ``sink_pad`` and ``sink_stream``
>>>>>> +        fields are unused. Set by the driver.
>>>>>> +
>>>>>> +Return Value
>>>>>> +============
>>>>>> +
>>>>>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>>>>>> +appropriately. The generic error codes are described at the
>>>>>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>>>>>> +
>>>>>> +ENOSPC
>>>>>> +   The number of provided route entries is less than the available ones.
>>>>>
>>>>> What does "available ones" mean in this context? More than is supported?
>>>>> Wouldn't E2BIG be the appropriate code in that case?
>>>>
>>>> Good question. I don't think I wrote this part =). ENOSPC refers to the case
>>>> where VIDIOC_SUBDEV_G_ROUTING is called without enough space for the routing
>>>> table. So "available ones" mean the routes in the subdev's routing table,
>>>> and "provided route entries" refers to the userspace target routing table.
>>>>
>>>> It sounds pretty odd, and obviously needs a clarification.
>>>
>>> I think I actually can think what this did mean. It means that the
>>> num_routes is smaller than the number of routes in a routing table when
>>> G_ROUTING is called. For that I think ENOSPC is the right code actually.
>>>
>>> But also I think we need to document what happens when there are too many
>>> routes. For that E2BIG would be appropriate.
>>
>> v4l2-ioctl.c returns EINVAL if there are over 256 routes. The drivers
>> should, of course, do additional check if needed. In v4l2-ioctl.c it seems
>> common to return EINVAL if there's too much data, but we can of course
>> define E2BIG for routing ioctls.
> 
> The number (256) is just the current limit. I don't expect more though.
> 
> But the user space could know the number is too large if we have a proper
> error code for it. Up to you. However at least documentation needs to be
> amended since this case remains undocumented.

I can change the returned error from EINVAL to E2BIG and document it. 
But everything else in check_array_args return EINVAL, so it would be 
going into different direction.

>>> Should we have a field for telling which route was the bad one, if it was
>>> one of them? That can be done later, too, if we'll ever need it.
>>
>> Hmm maybe, although I wonder how often the drivers can say that this
>> particular route is the problem, and what would the userspace do with that
>> information...
>>
>> Do you have any examples in mind?
> 
> I think it would be mainly useful for debugging purposes, software as such
> probably wouldn't need it. Say, if you have a problem somewhere in your,
> say, 256 routes, it could be hard to figure out which one of them is the
> faulty one.

Maybe... I'm a bit cautious about this, as I think it may be often 
difficult to return a good "bad route" number, and for the user do any 
proper debugging based only on it.

Similar to the pipeline validation, you need to turn on the kernel 
debugs to see where things go wrong. Which is, of course, bad as a 
normal user cannot do that, but I think for real debugging aid we'd need 
to return more than just a single number.

I wonder if something like that would work... A videodev/subdev file 
specific buffer for error strings (with a max size), which the user 
could fetch if it gets an error.

Or perhaps not. Maybe the people who work on v4l2 level things also have 
the means to enable kernel debugs.

  Tomi
