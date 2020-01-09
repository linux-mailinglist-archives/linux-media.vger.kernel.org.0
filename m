Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38CAF1354EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 09:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgAII5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 03:57:47 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37077 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728782AbgAII5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 03:57:47 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pTdLifcDmT6sRpTdPiJiDr; Thu, 09 Jan 2020 09:57:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578560264; bh=Vk/kifmXgDbLQKwwbiuGi3FO7KWx9DtEyC44qbawP/Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oVpiwGh+ljBx8V9cDVtwgSxqDuL4IwsY1hPavlas1AfQQArwIpFQj+Ns9elb3td/c
         4MxsyDMBK4HzmVD7mQWtpbGuhd8u8hoV/u5ahLCH5rcnv/M8I25xZGgT/5Skj7dxjR
         OP8z5VZHjKHV4fkeRNKWtMvJdOVqobPxJ8ZlvmHEp+b4Duip/irkJVl5mpPYZFfIza
         KB0vdWAPjJSRBLNL489+syB+Ky6YtdLIsvDUjraj+TajAJ8g2DZ6CJCpl9YGZjaQYU
         zG0Rww8xUZXGDeoWa8X+Ge/kVjBKaiy4zs4V87YybYTvDNyZ81agPZ6NvstwuOeEjv
         r/OrdClh6WiyA==
Subject: Re: [PATCH v4 04/12] v4l: Add source event change for bit-depth
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-5-stanimir.varbanov@linaro.org>
 <c3b02589-1d7a-a476-7d33-7e555fbe276d@xs4all.nl>
 <ae233eb1-69fc-6723-0224-0c1fcf786156@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fb27b5cc-0eef-a7b4-f45b-a3986b77c4c9@xs4all.nl>
Date:   Thu, 9 Jan 2020 09:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ae233eb1-69fc-6723-0224-0c1fcf786156@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEjH4eGnUttPRLLZn2wIUrksqeIOrr79iVk+71v2HW3c1s23i6AUvXDG6nOxpxTCJL8f4vf3BDtJS4BCsbP6tyG3MMiR+gAUSHxms1gbAZE5EBM8Em0m
 r4JMymfFTlE297FzNwczBZLXuclC8SuwpjsRAzxlCHlqYHPDihNW+ogauozlNVREAhhKrhNSCejCdPwwu6P+1ijYB/01otPI2zGCU3d7X/LsbCY1r6a1u7tS
 I/rXdzF328DG1xtzEvr78rQW8g2SIO7G+QjnHsG28CQ1h4GDmn7WwHbmLNOVcw3n3iUoKbmjvaKfeMqwNJZVjeOX+j7/7pcXw5rTdfphAPyorS9zxLMQeJnw
 hpeAi1jV1wJnd3IvkIARRU3t/JEJ3yHx4ra7YajsQUHJ3AKi3IW47BQa6Akl10Li4v5W3ikp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/9/20 8:41 AM, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 1/8/20 6:09 PM, Hans Verkuil wrote:
>> On 1/6/20 4:49 PM, Stanimir Varbanov wrote:
>>> This event indicate that the source color bit-depth is changed
>>> during run-time. The client must get the new format and re-allocate
>>> buffers for it. This can usually happens with video decoder (encoders)
>>> when the bit-stream color bit-depth is changed from 8 to 10bits
>>> or vice versa.
>>>
>>> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
>>>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>>>  include/uapi/linux/videodev2.h                  | 1 +
>>>  3 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>> index 42659a3d1705..fad853d440cf 100644
>>> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>> @@ -402,7 +402,13 @@ call.
>>>  	that many Video Capture devices are not able to recover from a temporary
>>>  	loss of signal and so restarting streaming I/O is required in order for
>>>  	the hardware to synchronize to the video signal.
>>> -
>>> +    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
>>> +      - 0x0002
>>> +      - This event gets triggered when color bit-depth change is detected
>>> +	from a video decoder. Applications will have to query the new pixel
>>> +	format and re-negotiate the queue. In most cases the streaming must be
>>> +	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
>>> +	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
>>
>> I think this is too specific for decoders. Something similar to the
>> CH_RESOLUTION description would be more appropriate:
>>
>>       - This event gets triggered when a color bit-depth change (but not a
>> 	resolution change!) is detected	at an input. This can come from an
> 
> What you mean by "but not a resolution change" here? Resolution change
> and bit-depth change cannot occur on the same time, or something else.

What I was trying to say is that a resolution change implies a possible bit-depth
change as well, whereas V4L2_EVENT_SRC_CH_COLOR_DEPTH is only set if there is
a bit-depth change but no resolution change.

V4L2_EVENT_SRC_CH_RESOLUTION requires that userspace does a full resync to the
new format, CH_COLOR_DEPTH implies that only the bit depth changed.

Which actually makes me wonder: is there a difference between the two change flags
w.r.t. userspace behavior? If there is, then that should be carefully documented,
if there isn't, then is this new flag really needed?

Regards,

	Hans

> 
> I would say that for Venus (and probably others) on initialization time
> both could be changed on the same time, because we cannot predict the
> resolution and bit-depth before parsing bitstream headers.
> 
>> 	input connector or from a video decoder. Applications will have to query
>> 	the new pixel format and re-negotiate the queue.
>>
>> 	For stateful decoders follow the guidelines in :ref:`decoder`.
>> 	Video capture devices will in most cases have to stop and restart
>> 	streaming (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` followed by
>> 	:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
>>
>> And update dev-decoder.rst where needed with this new event flag.
>>
>> As to your question on irc: once I've acked this patch it can be merged
>> via a venus PR.
>>
>> Regards,
>>
>> 	Hans
>>
>>>  
>>>  Return Value
>>>  ============
>>> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
>>> index cb6ccf91776e..209709114378 100644
>>> --- a/Documentation/media/videodev2.h.rst.exceptions
>>> +++ b/Documentation/media/videodev2.h.rst.exceptions
>>> @@ -490,6 +490,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
>>>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>  
>>>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>> +replace define V4L2_EVENT_SRC_CH_COLOR_DEPTH src-changes-flags
>>>  
>>>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>  
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index 5f9357dcb060..1d349c9d57a7 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -2332,6 +2332,7 @@ struct v4l2_event_frame_sync {
>>>  };
>>>  
>>>  #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
>>> +#define V4L2_EVENT_SRC_CH_COLOR_DEPTH		(1 << 1)
>>>  
>>>  struct v4l2_event_src_change {
>>>  	__u32 changes;
>>>
>>
> 

