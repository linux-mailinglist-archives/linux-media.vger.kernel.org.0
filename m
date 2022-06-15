Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4ABF54C2B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 09:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244208AbiFOHh0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 03:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbiFOHhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 03:37:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D4C483A4;
        Wed, 15 Jun 2022 00:37:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0BCF7618E6;
        Wed, 15 Jun 2022 07:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986A3C34115;
        Wed, 15 Jun 2022 07:37:19 +0000 (UTC)
Message-ID: <3e5e2531-00b7-a8d5-4199-9f59fc35ed39@xs4all.nl>
Date:   Wed, 15 Jun 2022 09:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, stanimir.varbanov@linaro.org,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-2-xavier.roumegue@oss.nxp.com>
 <YqjznJSwPFH4GrhO@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <YqjznJSwPFH4GrhO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/14/22 22:46, Laurent Pinchart wrote:
> Hi Xavier and Hans,
> 
> Thank you for the patch.
> 
> On Tue, May 03, 2022 at 11:39:17AM +0200, Xavier Roumegue wrote:
>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Add a new flag that indicates that this control is a dynamically sized
>> array. Also document this flag.
>>
>> Currently dynamically sized arrays are limited to one dimensional arrays,
>> but that might change in the future if there is a need for it.
>>
>> The initial use-case of dynamic arrays are stateless codecs. A frame
>> can be divided in many slices, so you want to provide an array containing
>> slice information for each slice. Typically the number of slices is small,
>> but the standard allow for hundreds or thousands of slices. Dynamic arrays
>> are a good solution since sizing the array for the worst case would waste
>> substantial amounts of memory.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
>>  include/uapi/linux/videodev2.h                            | 1 +
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 88f630252d98..a20dfa2a933b 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -625,6 +625,14 @@ See also the examples in :ref:`control`.
>>  	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
>>  	streaming is in progress since most drivers do not support changing
>>  	the format in that case.
>> +    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
>> +      - 0x0800
>> +      - This control is a dynamically sized 1-dimensional array. It
>> +        behaves the same as a regular array, except that the number
>> +	of elements as reported by the ``elems`` field is between 1 and
>> +	``dims[0]``. So setting the control with a differently sized
>> +	array will change the ``elems`` field when the control is
>> +	queried afterwards.
> 
> Wrong indentation.

No, it's just that the tab in front makes it look a bit weird.

> 
> Can the dimension be changed by the application only, or by the driver
> too ? In the latter case, is an event generated ?

Interesting question. 'dims[0]' is the maximum number of elements allowed
by the driver for this dynamic array. Applications can set the control to
any number of elements up to that maximum. For the current use case I expect
that this maximum reflects what the hardware supports, and is not really
related to the video resolution. Currently the code expects the maximum
number of elements (dims[0]) to remain constant.

Technically a driver can increase dims[0] as needed. Should that be needed,
then we probably need an event to signal that.

> 
> Considering this in the context of this series, the driver needs to
> change the dimension, as the use case is to size the control based on
> the image size. Do we want to document here that the driver will reset
> the control to a default value when the dimension changes, or is that
> something that should be control-specific ?

As mentioned above, in the current context the maximum number of allowed
elements in a dynamic array is fixed, so this issue does not occur.

Regards,

	Hans

> 
>>  
>>  Return Value
>>  ============
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 3768a0a80830..8df13defde75 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1886,6 +1886,7 @@ struct v4l2_querymenu {
>>  #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
>>  #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
>>  #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
>> +#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
>>  
>>  /*  Query flags, to be ORed with the control ID */
>>  #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
> 
