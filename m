Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261841AAA14
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 16:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbgDOOe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 10:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394141AbgDOOeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 10:34:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C06C061A0F
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 07:34:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v8so177836wma.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nxelXILmKZchPwvimzsQBENiKfTkkLiVSXLT8HCWUfg=;
        b=POod/Q0b08ZdV+ddPjR1JrfNwY27Dbz1s3Uw84CKlljOygYkgsJnl6F56k9XPO7ZKL
         s1ULoVzWPEUCGPSWZarKN10UO8xNNQQGNPbd3fxmKEruKRDe1MPI0E8ZXrcHUtMNAvP5
         5VaCQvB6o8KazHI/ePiNBMCebOd8aCVJCFrXLfg9Tk+9yBdrX9OgyoRuO1f3j1FIf70T
         4JeLPh5w61dGRcY4eVGEsjbOBVxw0sppgq3GdwmYGEV/r0huvtbplLVyg5KLy2LJHHIO
         zuXZ1qjJDZ/9QnkTgCmxNZH3K6UEFzboHHCSf6R3e66MspBZIv7Fs6s4hph3EQbH0TFs
         yoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nxelXILmKZchPwvimzsQBENiKfTkkLiVSXLT8HCWUfg=;
        b=ICGqHShu0lbAHz18TNWBT+Yg5ND0TD67kMVdqQhdPcznvHK5e8EBOvRdOdLjMkD6XH
         g3Mcts40riMUl3I2ymxfLvK0NXkSbPiN9y2fuhhuPBgsRKo3ytuqyQo4jiGWlyRoyp2j
         yz0GkwfZzs9/STOjbVej99xzornSVyf76pybm30WaBMFy5IRVUcn6RtUQN5IzlW95wyP
         /q3rZdy+umbLrOF0TChpF1RXw0zQbsTD+n8AtJfZA/Vc1alt9KhwtkxFMpVoSTl465iL
         i2eKjkgBalXzGcq1afNKI3kT1dZCppNd3DWbio3IbYKzHIsrqFaq9BGVbjIKZLzVKuwg
         yH/Q==
X-Gm-Message-State: AGi0PuZEsLVaxvmu+Ibvia9O72R9tIh7+gbj7PoTetwjPz8whWvjZL4g
        /dmwSp4d2EbmWYlxObSWA1HC9w==
X-Google-Smtp-Source: APiQypKZQ8ksOeYlrdeJ8Nk3paLuV0a49yGc7LShsaCdvQV8dGeC8wnlFfMzLeyhC3ntLG7xWn/s7w==
X-Received: by 2002:a05:600c:214b:: with SMTP id v11mr5813776wml.151.1586961250280;
        Wed, 15 Apr 2020 07:34:10 -0700 (PDT)
Received: from [192.168.1.5] (212-5-158-142.ip.btc-net.bg. [212.5.158.142])
        by smtp.googlemail.com with ESMTPSA id w11sm22389148wmi.32.2020.04.15.07.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 07:34:09 -0700 (PDT)
Subject: Re: [PATCH v4 04/12] v4l: Add source event change for bit-depth
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-5-stanimir.varbanov@linaro.org>
 <c3b02589-1d7a-a476-7d33-7e555fbe276d@xs4all.nl>
 <ae233eb1-69fc-6723-0224-0c1fcf786156@linaro.org>
 <fb27b5cc-0eef-a7b4-f45b-a3986b77c4c9@xs4all.nl>
 <988e49aa-469d-17a1-ca25-982c63536e6e@linaro.org>
 <814252fe-6fa9-595b-92b3-8ef8ef4c0187@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8da8cb6c-4190-1670-46cf-a982481aecdf@linaro.org>
Date:   Wed, 15 Apr 2020 17:34:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <814252fe-6fa9-595b-92b3-8ef8ef4c0187@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 1/15/20 5:03 PM, Hans Verkuil wrote:
> On 1/10/20 11:54 AM, Stanimir Varbanov wrote:
>> Hi Hans,
>>
>> On 1/9/20 10:57 AM, Hans Verkuil wrote:
>>> On 1/9/20 8:41 AM, Stanimir Varbanov wrote:
>>>> Hi Hans,
>>>>
>>>> On 1/8/20 6:09 PM, Hans Verkuil wrote:
>>>>> On 1/6/20 4:49 PM, Stanimir Varbanov wrote:
>>>>>> This event indicate that the source color bit-depth is changed
>>>>>> during run-time. The client must get the new format and re-allocate
>>>>>> buffers for it. This can usually happens with video decoder (encoders)
>>>>>> when the bit-stream color bit-depth is changed from 8 to 10bits
>>>>>> or vice versa.
>>>>>>
>>>>>> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>>> ---
>>>>>>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 8 +++++++-
>>>>>>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>>>>>>  include/uapi/linux/videodev2.h                  | 1 +
>>>>>>  3 files changed, 9 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>>>>> index 42659a3d1705..fad853d440cf 100644
>>>>>> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>>>>> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>>>>>> @@ -402,7 +402,13 @@ call.
>>>>>>  	that many Video Capture devices are not able to recover from a temporary
>>>>>>  	loss of signal and so restarting streaming I/O is required in order for
>>>>>>  	the hardware to synchronize to the video signal.
>>>>>> -
>>>>>> +    * - ``V4L2_EVENT_SRC_CH_COLOR_DEPTH``
>>>>>> +      - 0x0002
>>>>>> +      - This event gets triggered when color bit-depth change is detected
>>>>>> +	from a video decoder. Applications will have to query the new pixel
>>>>>> +	format and re-negotiate the queue. In most cases the streaming must be
>>>>>> +	stopped and restarted (:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
>>>>>> +	followed by :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`).
>>>>>
>>>>> I think this is too specific for decoders. Something similar to the
>>>>> CH_RESOLUTION description would be more appropriate:
>>>>>
>>>>>       - This event gets triggered when a color bit-depth change (but not a
>>>>> 	resolution change!) is detected	at an input. This can come from an
>>>>
>>>> What you mean by "but not a resolution change" here? Resolution change
>>>> and bit-depth change cannot occur on the same time, or something else.
>>>
>>> What I was trying to say is that a resolution change implies a possible bit-depth
>>> change as well, whereas V4L2_EVENT_SRC_CH_COLOR_DEPTH is only set if there is
>>> a bit-depth change but no resolution change.
>>>
>>> V4L2_EVENT_SRC_CH_RESOLUTION requires that userspace does a full resync to the
>>> new format, CH_COLOR_DEPTH implies that only the bit depth changed.
>>
>> CH_COLOR_DEPTH implies format re-negotiation as well. In Venus case
>> 8->10bit change will change the format of OPB buffers (now it is not
>> possible because of lack of v4l modifiers) and DPB buffers becomes
>> compressed raw buffers (to optimize bandwidth).
>>
>>>
>>> Which actually makes me wonder: is there a difference between the two change flags
>>> w.r.t. userspace behavior? If there is, then that should be carefully documented,
>>> if there isn't, then is this new flag really needed?
>>
>> Looking into semantics of v4l events, CH_COLOR_DEPTH makes sense because
>> it describes what actually changed (similar to CH_RESOLUTION). I would
>> say that v4l2_event::type V4L2_EVENT_SOURCE_CHANGE implies format
>> re-negotiation and v4l2_event::src_change just informs userland what
>> exactly is changed.
>>
>> I'll postpone this patch until we have clear vision what will be the
>> usage in user-space.
>>
> 
> My main problem regarding semantics is what should be done if you disconnect
> and reconnect an HDMI (for example) connector. You get a V4L2_EVENT_SOURCE_CHANGE
> when the new signal is detected, but should it just set V4L2_EVENT_SRC_CH_RESOLUTION
> (as it does today), or also V4L2_EVENT_SRC_CH_COLOR_DEPTH?

I think disconnect -> connect should imply that everything is changed
i.e. source resolution, color depth and colorimetry. We cannot guess is
it the same HDMI source or not.

> 
> In my view V4L2_EVENT_SRC_CH_COLOR_DEPTH only makes sense if the resolution
> stays the same, but only the color depth changes.

I can imagine a bitstream which changing resolution and color-depth at
the same time. And I guess h264|265 doesn't denied this to happen.

> 
> BTW, one thing that will be added here as well in the future is a
> V4L2_EVENT_SRC_CH_COLORIMETRY for when the colorspace etc. information changes,
> but nothing else. In that case there is no need to renegotiate the format etc.,
> it's just the interpretation of the video data that changes.

In case of colorimetry, maybe the buffer format will not change but
colorspace, quantization, ycbcr_encoding and transfer function will
change. And this imply that the userspace have to streamoff -> gfmt ->
do-some-action -> streamon ?

I have to figure out what is for example Android is doing when the
colorimentry is changed.
If someone knows, please shed some light on that subject.

> 
> An alternative approach is to define a V4L2_EVENT_SRC_CH_ALL bit mask, OR-ing
> all the V4L2_EVENT_SRC_CH_* defines, and change all drivers that use
> V4L2_EVENT_SRC_CH_RESOLUTION at the moment to use V4L2_EVENT_SRC_CH_ALL instead,
> and only drivers that detect that only one of these changes took place will
> use a specific V4L2_EVENT_SRC_CH_ flag. This will be primarily codec drivers,
> I believe.

I can do that as an RFC.

> 
> There aren't that many of those, so this shouldn't be too difficult to do.
> 
> Perhaps this is the cleanest approach to this problem...
> 
> Regards,
> 
> 	Hans
> 

-- 
regards,
Stan
