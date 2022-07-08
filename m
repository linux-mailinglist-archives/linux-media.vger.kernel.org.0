Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF2456B898
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 13:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbiGHLdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 07:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237568AbiGHLdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 07:33:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72261DF2E
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 04:33:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15D1DB825CC
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 11:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2D8C341C0;
        Fri,  8 Jul 2022 11:33:29 +0000 (UTC)
Message-ID: <bec3dc62-1c8e-a471-85ab-a906e31a3f39@xs4all.nl>
Date:   Fri, 8 Jul 2022 13:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 7/8] v4l2-ctrls: add change flag for when dimensions
 change
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-8-hverkuil-cisco@xs4all.nl>
 <YsgJ1OpWCERSVqrB@pendragon.ideasonboard.com>
 <c02fe42a-5694-06b4-c140-1e42ca9fe8ac@xs4all.nl>
 <YsgP4myG11m+UsCF@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <YsgP4myG11m+UsCF@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/8/22 13:07, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Jul 08, 2022 at 12:59:41PM +0200, Hans Verkuil wrote:
>> On 7/8/22 12:41, Laurent Pinchart wrote:
>>> On Tue, Jun 28, 2022 at 02:05:22PM +0200, Hans Verkuil wrote:
>>>> Add a new V4L2_EVENT_CTRL_CH_DIMENSIONS change flag that is issued
>>>> when the dimensions of an array change as a result of a
>>>> __v4l2_ctrl_modify_dimensions() call.
>>>>
>>>> This will inform userspace that there are new dimensions.
>>>
>>> While this is easy to add, I'm not sure it will actually be useful in
>>> real use cases. Should we delay adding this new API until someone
>>> actually needs it ?
>>
>> Well, there is a user: dw100. This driver can change dimensions, so any
>> userspace application that subscribes to such a control has to be able to
>> know that the dimensions of that control have changed. Otherwise it will
>> not be able to correctly obtain the control's value.
> 
> I meant a userspace user, not a kernelspace user. Sure, we have test
> applications that can listen for events, but my experience with
> libcamera showed me that the control events API is not very usable
> beside test applications. We don't use it at all in libcamera for that
> reason, and I think this new event would have the same fate if we don't
> have a real userspace user to show it's done correctly.

We (Cisco) use control events all the time to detect HDMI signal changes,
among others.

It all depends on your use case. In this case the event flag IS used
by the framework, and is well defined. Whether userspace needs to use it
is another matter, and that's something you cannot predict.

The problem is when adding API defines that are not used at all in the
kernel, but that's not the case here.

And frankly, it makes no sense if there is a flag to indicate that the
control range changed, but not that the control dimensions changed. It
should be there.

Regards,

	Hans

> 
>> It's not really about this specific driver, it is about the new control
>> feature where dimensions of an array can change. It's also consistent
>> with the other control event change flags.
>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> ---
>>>>  Documentation/userspace-api/media/v4l/vidioc-dqevent.rst     | 5 +++++
>>>>  Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
>>>>  drivers/media/v4l2-core/v4l2-ctrls-api.c                     | 2 ++
>>>>  include/uapi/linux/videodev2.h                               | 1 +
>>>>  4 files changed, 9 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> index 6eb40073c906..8db103760930 100644
>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> @@ -332,6 +332,11 @@ call.
>>>>        - 0x0004
>>>>        - This control event was triggered because the minimum, maximum,
>>>>  	step or the default value of the control changed.
>>>> +    * - ``V4L2_EVENT_CTRL_CH_DIMENSIONS``
>>>> +      - 0x0008
>>>> +      - This control event was triggered because the dimensions of the
>>>> +	control changed. Note that the number of dimensions remains the
>>>> +	same.
>>>>  
>>>>  
>>>>  .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> index 0b91200776f8..274474425b05 100644
>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> @@ -506,6 +506,7 @@ replace define V4L2_EVENT_PRIVATE_START event-type
>>>>  replace define V4L2_EVENT_CTRL_CH_VALUE ctrl-changes-flags
>>>>  replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
>>>>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>> +replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>>>>  
>>>>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>>  
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>>>> index 16be31966cb1..47f69de9a067 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>>>> @@ -1019,6 +1019,8 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
>>>>  		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
>>>>  		ctrl->type_ops->init(ctrl, i, ctrl->p_new);
>>>>  	}
>>>> +	send_event(NULL, ctrl,
>>>> +		   V4L2_EVENT_CTRL_CH_VALUE | V4L2_EVENT_CTRL_CH_DIMENSIONS);
>>>
>>> Sending V4L2_EVENT_CTRL_CH_VALUE propably belongs to the previous patch
>>> already.
>>
>> True.
>>
>>>>  	return 0;
>>>>  }
>>>>  EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index 9018aa984db3..3971af623c56 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -2398,6 +2398,7 @@ struct v4l2_event_vsync {
>>>>  #define V4L2_EVENT_CTRL_CH_VALUE		(1 << 0)
>>>>  #define V4L2_EVENT_CTRL_CH_FLAGS		(1 << 1)
>>>>  #define V4L2_EVENT_CTRL_CH_RANGE		(1 << 2)
>>>> +#define V4L2_EVENT_CTRL_CH_DIMENSIONS		(1 << 3)
>>>>  
>>>>  struct v4l2_event_ctrl {
>>>>  	__u32 changes;
> 
