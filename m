Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F6B13C6DD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 16:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgAOPDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 10:03:52 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35947 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726132AbgAOPDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 10:03:52 -0500
Received: from [IPv6:2001:420:44c1:2577:18d8:d5d6:4408:6200]
 ([IPv6:2001:420:44c1:2577:18d8:d5d6:4408:6200])
        by smtp-cloud9.xs4all.net with ESMTPA
        id rkCwiF0uRT6sRrkCziahYK; Wed, 15 Jan 2020 16:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579100629; bh=11i4n8lMpRQQ+iNfpGyMTy/9CCEdWTY8dDDaQE1zD3Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ehvjUxlN9DHLZT26Nm8j/e9pTwnJ708Ao9NzFX7vTZZR+oFYavJXAVvt0uHI8TKLr
         fYJ+3/hhOTRhwalGlqcgujswc4QOQJ981VVy56LvSjSM04relL8i+jkH2+64EICpz9
         eC+DkY4ZTtJWKXoIZn6bq7y/JOCGfwqUETOBr4V4dYocxaQyw0Shn+GJ4zVCv7Dstx
         oI2gbXPtg5stiw4iz0zls7XxweGscUhETyck6ulTHhe1IulMb7VhdlVR8xHj1OIU6u
         Rkc8K2yKOyiq/uz4IeDsGqyLCP+/5AFQ+q/AFGJMJL4x8GkhhmtqvzxoptZYy1GLFc
         iKAxVWZIe4EMQ==
Subject: Re: [PATCH v4 04/12] v4l: Add source event change for bit-depth
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-5-stanimir.varbanov@linaro.org>
 <c3b02589-1d7a-a476-7d33-7e555fbe276d@xs4all.nl>
 <ae233eb1-69fc-6723-0224-0c1fcf786156@linaro.org>
 <fb27b5cc-0eef-a7b4-f45b-a3986b77c4c9@xs4all.nl>
 <988e49aa-469d-17a1-ca25-982c63536e6e@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <814252fe-6fa9-595b-92b3-8ef8ef4c0187@xs4all.nl>
Date:   Wed, 15 Jan 2020 16:03:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <988e49aa-469d-17a1-ca25-982c63536e6e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBWwR3P3/GTdqy8WWZYktsN7pov0YuXInaQkeXKFTdtJjYB94dIrU79LS87bnBLAVaI17ogCLgl4PvIlVkJLVGDmgzFgE2nqWrzOxCfUBd2FWeI0i0B5
 5Gg9u3xLqg0nsuMtEXmT7feKF3uUcpzZAFB4PEKxjt5i3mQ6DCkN5ue7t7yKhil8Wy2Nx5I32oJ1/c8+kOJk26gDE+0BNkhepwCdTZ3CgamFwBHOlHy0nQwg
 ipzeq3DZfq6cgyBEnjhnOOt592HwaZsP283Z0G6ZxRwpHLyq1uSlR7neQqaziq/TeSF230jCKg8yRVNzgilQ/LcvHGBHFiXZtDteK3POlhuJt7rC5iBVueUQ
 Sl9sOzOgcJa9dD+rrETadFh/JqjRMaMOyYrn21MyYt5JW+LzWAGkAdXaOHjEN2siznRW7tjK0je9h27wEKyZjGdXVhfphTVoY0sMSkrHOCY/mwJcWf4Jyf/T
 0ns+7vFWLWTbByemKeaJcI2RG9iQXipUnNetoNCVFFKW7d0KraJcdVrUTkc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/10/20 11:54 AM, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 1/9/20 10:57 AM, Hans Verkuil wrote:
>> On 1/9/20 8:41 AM, Stanimir Varbanov wrote:
>>> Hi Hans,
>>>
>>> On 1/8/20 6:09 PM, Hans Verkuil wrote:
>>>> On 1/6/20 4:49 PM, Stanimir Varbanov wrote:
>>>>> This event indicate that the source color bit-depth is changed
>>>>> during run-time. The client must get the new format and re-allocate
>>>>> buffers for it. This can usually happens with video decoder (encoders)
>>>>> when the bit-stream color bit-depth is changed from 8 to 10bits
>>>>> or vice versa.
>>>>>
>>>>> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>> ---
>>>>>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
>>>>>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>>>>>  include/uapi/linux/videodev2.h                  | 1 +
>>>>>  3 files changed, 9 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>>>> index 42659a3d1705..fad853d440cf 100644
>>>>> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>>>> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>>>> @@ -402,7 +402,13 @@ call.
>>>>>  	that many Video Capture devices are not able to recover from a temporary
>>>>>  	loss of signal and so restarting streaming I/O is required in order for
>>>>>  	the hardware to synchronize to the video signal.
>>>>> -
>>>>> +    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
>>>>> +      - 0x0002
>>>>> +      - This event gets triggered when color bit-depth change is detected
>>>>> +	from a video decoder. Applications will have to query the new pixel
>>>>> +	format and re-negotiate the queue. In most cases the streaming must be
>>>>> +	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
>>>>> +	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
>>>>
>>>> I think this is too specific for decoders. Something similar to the
>>>> CH_RESOLUTION description would be more appropriate:
>>>>
>>>>       - This event gets triggered when a color bit-depth change (but not a
>>>> 	resolution change!) is detected	at an input. This can come from an
>>>
>>> What you mean by "but not a resolution change" here? Resolution change
>>> and bit-depth change cannot occur on the same time, or something else.
>>
>> What I was trying to say is that a resolution change implies a possible bit-depth
>> change as well, whereas V4L2_EVENT_SRC_CH_COLOR_DEPTH is only set if there is
>> a bit-depth change but no resolution change.
>>
>> V4L2_EVENT_SRC_CH_RESOLUTION requires that userspace does a full resync to the
>> new format, CH_COLOR_DEPTH implies that only the bit depth changed.
> 
> CH_COLOR_DEPTH implies format re-negotiation as well. In Venus case
> 8->10bit change will change the format of OPB buffers (now it is not
> possible because of lack of v4l modifiers) and DPB buffers becomes
> compressed raw buffers (to optimize bandwidth).
> 
>>
>> Which actually makes me wonder: is there a difference between the two change flags
>> w.r.t. userspace behavior? If there is, then that should be carefully documented,
>> if there isn't, then is this new flag really needed?
> 
> Looking into semantics of v4l events, CH_COLOR_DEPTH makes sense because
> it describes what actually changed (similar to CH_RESOLUTION). I would
> say that v4l2_event::type V4L2_EVENT_SOURCE_CHANGE implies format
> re-negotiation and v4l2_event::src_change just informs userland what
> exactly is changed.
> 
> I'll postpone this patch until we have clear vision what will be the
> usage in user-space.
> 

My main problem regarding semantics is what should be done if you disconnect
and reconnect an HDMI (for example) connector. You get a V4L2_EVENT_SOURCE_CHANGE
when the new signal is detected, but should it just set V4L2_EVENT_SRC_CH_RESOLUTION
(as it does today), or also V4L2_EVENT_SRC_CH_COLOR_DEPTH?

In my view V4L2_EVENT_SRC_CH_COLOR_DEPTH only makes sense if the resolution
stays the same, but only the color depth changes.

BTW, one thing that will be added here as well in the future is a
V4L2_EVENT_SRC_CH_COLORIMETRY for when the colorspace etc. information changes,
but nothing else. In that case there is no need to renegotiate the format etc.,
it's just the interpretation of the video data that changes.

An alternative approach is to define a V4L2_EVENT_SRC_CH_ALL bit mask, OR-ing
all the V4L2_EVENT_SRC_CH_* defines, and change all drivers that use
V4L2_EVENT_SRC_CH_RESOLUTION at the moment to use V4L2_EVENT_SRC_CH_ALL instead,
and only drivers that detect that only one of these changes took place will
use a specific V4L2_EVENT_SRC_CH_ flag. This will be primarily codec drivers,
I believe.

There aren't that many of those, so this shouldn't be too difficult to do.

Perhaps this is the cleanest approach to this problem...

Regards,

	Hans
