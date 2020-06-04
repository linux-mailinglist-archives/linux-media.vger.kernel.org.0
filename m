Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190E11EE4DC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 14:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgFDM4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 08:56:38 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39931 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726003AbgFDM4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 08:56:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id gpQ7j2fwhnv5ngpQAju8kv; Thu, 04 Jun 2020 14:56:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591275395; bh=GsXkE50T8O25yTIHoQaRVvowv2CeDBSFCyEe0VxuHU8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JXYnJsBUkpWl1YoOy2DtjiJSHC0mjJZa9TKkwt2F5mzHyuqS6pujrCr3YTRMKa3Ik
         QUb2aWcVVMf8zMEz6YYNa6ktgWXYkuR/hWJFnRL8cXmkzE/6Xcxa/t+y6jwj1BBpAC
         xjobzBAvnl/CmOy4QCLeE6TC+Eox9LNw1z5mJiPkkGv71QHsH5VGKAwEOUMD3BKKT8
         gEpFDzit9PNFrLOtBZcT4cq14h+8pzEcuC1Y/43o7OQnn14p3jsc198xPVMIseRDOw
         CkohQLnQHEibijkmcaGP2dDvV3ZITpgXTS+qxLjjC2dovLpyOJQC9wGXDf8bOB+eFG
         32RCRQbzuHdUw==
Subject: Re: [PATCH] v4l2-ctrl: add control for thumnails
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
 <65ac9697-a43f-7025-e6fe-69c4a44c6d9a@xs4all.nl>
 <ce28a840-a763-6700-16dd-d708e570d55c@linaro.org>
 <d02c6cd0-a502-dc52-519e-54b6328d5373@linaro.org>
 <544b19dd-4883-bae0-b488-46c856eb207d@xs4all.nl>
 <6f71931a-9060-a399-835c-a1cf1f05dc79@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1bc10e88-8cbe-3da9-daeb-d015f42d7acc@xs4all.nl>
Date:   Thu, 4 Jun 2020 14:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6f71931a-9060-a399-835c-a1cf1f05dc79@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAPj4iDjEkjil0CAzJQ0LO6ID7xKeLwdy5pi67iOCfa0MSwEHrW/RftrQ7mLUR6JHdeGk9Pd3wPbSJbN9phw4wgeN5kP7Dtw+ng4q1KObpTo9MqecqPH
 weJKY04Tr4lC0JjE4tSxbVfNeWRzl8zyoRkowTdItkbpdPsK7DzM4OLH9oOs+vjUKYy0calpH3ZRFdfDl2tb66MUe1IuLSWxNlShFNZe/PNlxkhXtDhj9TXH
 JtXczQh5AlenBmgzMPjKgwfJL7VzMp0zqoNIOmU4lFIL/XyAGQB7JXXMtPjkMVeaSNFpI7LSFU0Psza7JD2AhVLOpyKzLO1YTlIbzHidfcWLbqBMRT9D4o6B
 rat7Lvg++pDnhaQ3Dth+5qT70qWKyiFbrslLfFMZvKdjDdjz4x7geavqdIegb5hJYou2hnqVexuf+/kTarp7bQHJxZ/2Pg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2020 14:34, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 6/4/20 12:08 PM, Hans Verkuil wrote:
>> On 04/06/2020 11:02, Stanimir Varbanov wrote:
>>> Hi Hans,
>>>
>>> On 5/27/20 12:53 AM, Stanimir Varbanov wrote:
>>>> Hi Hans,
>>>>
>>>> On 5/26/20 3:04 PM, Hans Verkuil wrote:
>>>>> On 26/05/2020 10:54, Stanimir Varbanov wrote:
>>>>>> Add v4l2 control for decoder thumbnail.
>>>>>>
>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>>> ---
>>>>>>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>>>>>>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>>>>>>  3 files changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>> index d0d506a444b1..e838e410651b 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>> @@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>>>>      disables generating SPS and PPS at every IDR. Setting it to one enables
>>>>>>      generating SPS and PPS at every IDR.
>>>>>>  
>>>>>> +``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
>>>>>> +    Instructs the decoder to produce immediate output. The decoder should
>>>>>> +    consume first input buffer for progressive stream (or first two buffers
>>>>>> +    for interlace). Decoder should not allocate more output buffers that it
>>>>>> +    is required to consume one input frame. Usually the decoder input
>>>>>> +    buffers will contain only I/IDR frames but it is not mandatory.
>>>>>
>>>>> This is very vague. It doesn't explain why the control is called 'THUMBNAIL',
>>>>> but more importantly it doesn't explain how this relates to normal decoding.
>>>>
>>>> If in the normal decode the capture queue buffers are 5, in the
>>>> thumbnail mode the number of buffers will be only 1 (if the bitstream is
>>>> progressive) and this will guarantee low memory usage. The other
>>>> difference is that the decoder will produce decoded frames (without
>>>> errors) only for I/IDR (sync frames).
>>
>> Isn't this really a "DECODE_SYNC_FRAMES_ONLY" control? That's what it does,
>> right? Skip any B/P frames and only decode sync frames.
> 
> Yes, it is.
> To me V4L2_CID_MPEG_VIDEO_DECODE_SYNC_FRAMES sounds better. If you are
> fine I can send a new patch.
> 
> The definition of "sync frames" is a bit difficult for codec-agnostic
> controls. Is it sound better "INTRA", DECODE_INTRA_FRAMES (ONLY)?

INTRA is better. DECODE_INTRA_FRAMES_ONLY is a good name, I think.

Thumbnail creation can be given as an example in the description of the
control, but that's just a use-case.

Regards,

	Hans

> 
>>
>> That this is useful for creating thumbnails is just a specific use-case.
>>
>> Regards,
>>
>> 	Hans
>>
>>>>
>>>>>
>>>>> I.e. if you are decoding and 'press' this control, what happens then?
>>>>
>>>> Might be the button type wasn't great idea. In fact the control should
>>>> be set before streamon so that the driver returns min_capture_bufs 1.
>>>>
>>>>>
>>>>> What exactly is the use-case?
>>>>
>>>> It could be used to generate thumbnails of all video clips in a folder
>>>> or when you open a Gallery application on your phone.
>>>>
>>>
>>> What is your opinion on that control? I could consider to make it Venus
>>> custom control but from the use-case it looks other drivers also can
>>> benefit of it.
>>>
>>> I tried to make more generic one [1] but it looks it will be too difficult.
>>>
>>
> 

