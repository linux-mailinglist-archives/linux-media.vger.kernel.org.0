Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B1A221F1B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 10:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgGPIz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 04:55:59 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34487 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgGPIz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 04:55:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id vzgDjTnrmyPEdvzgHj3RPB; Thu, 16 Jul 2020 10:55:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594889755; bh=haF/RbQwl2fHuS/c869UQbG2ZfIOe0m+cTgAjoNYTVc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kL6aWwJXAIFvXrorCQelVzPjuYukBIxOBLSnSVKOCNNm58ybJ8jaR6igL1ZlM7bQL
         0QCpKll47NQS8oiV7ydQzn+S12XWHrbld92ez8oYCqU22OfgPtyqlp0gfWx30BZFcO
         c5DLeUJgUhC0NdpZnCPujBtvBFRZ89nv0d4U6ogrRNjSUmHjpv0aHtkNLx03irZbFe
         UQcHkIVHQWTufP1+T3WL+xmz30RtHk6sZtSVwksLf3uJh8VfyZ0LRQswscA8zVGINQ
         8NG5efqrV97faWE1bAr92uVAdeRLt7Zk3LdjZIMsJZuk4yr7m/zN31WZ3jJBGO0tI/
         ZyOBRQdjgJJzQ==
Subject: Re: [RFC PATCH 0/1] Add LTR controls
To:     dikshita@codeaurora.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        ribalda@kernel.org, paul.kocialkowski@bootlin.com,
        posciak@chromium.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        majja@codeaurora.org, linux-media-owner@vger.kernel.org
References: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
 <f07c4aab69d2b333c0e36c50c526c0a85322e708.camel@ndufresne.ca>
 <1a9904b6-60a5-0faa-8a5e-c9dc00802184@xs4all.nl>
 <40040141fc3027c3eb1fdebc1a0e8ade@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d37e4e83-b7ae-7d44-c75f-2055f11ae898@xs4all.nl>
Date:   Thu, 16 Jul 2020 10:55:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40040141fc3027c3eb1fdebc1a0e8ade@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLscghVshbYAbGMjUhOTkRhiZ9hQ/nMwQsiYIl1v39rmY6YluEUPNd5n5G4toWGWm0mcRXg48n2FqYxe6UkuXOmdPyXu3fzgIStyEeEUxffavOQ+4JV1
 1siTHGiELnynrfFK0GDa4NP6uC36pR/f8TviavrsQLOsgNnHLx0mv8nvt1VD58mVYRhr51JoX2h4cBpd85/XNWK3nNgPpEGyGVaQKznTLrDuVMNE2j1cRCh0
 /zYXDBGQWNKw1DYi3xafjjuuQmYEvFHaKiW8uUN04YQHbKqzZMae2DhmLuwx0xB1MSrtkOcV53tv2+jtUhPbzF9Wv18saulNl+30450elhrIY9ThUMZYjOM2
 JZPwRObVLVXg+5b4W+CLwcQE4XwvT5GR0KVeyW3hBSJoSNeOlDAdOnfC3nqWMHo7Nco+7XEsotyioptkiGepNZFjDmj1k1M3hHD/moy5RczbHjtFSWhmMoi0
 jakEBaSPBhyr8ofgp4OeDOtOexW+8iAa81fKGp8vrTkVTGpR4QqvPVd0cDppOzts54+Oj+uvUuypJSWM63TvTJ973yqOT16qFWeRKnW4YikHH+R0CqmewLYH
 GL94VemdHc5/68O39F3I4GpILeRKtA28+cVQM2DeLtiVZ2jHd1xPJS34bROa06CwAr5IdFwhtJt8/f1qEaj6x+EAbifamPGNl+ptZX3lqL9zTTRVHSeBevwG
 WN9wX/Q7qUQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 20:41, dikshita@codeaurora.org wrote:
> Hi Hans, Nicolas,
> 
> Thanks for your comments.
> 
> On 2020-06-12 14:41, Hans Verkuil wrote:
>> Hi Dikshita, Nicolas,
>>
>> On 11/06/2020 16:22, Nicolas Dufresne wrote:
>>> Le jeudi 11 juin 2020 à 15:55 +0530, Dikshita Agarwal a écrit :
>>>> LTR (Long Term Reference) frames are the frames that are encoded 
>>>> sometime in the past
>>>> and stored in the DPB buffer list to be used as reference to encode 
>>>> future frames.
>>>> One usage of LTR encoding is to reduce error propagation for video 
>>>> transmission
>>>> in packet lossy networks.  For example, encoder may want to specify 
>>>> some key frames as
>>>> LTR pictures and use them as reference frames for encoding. With 
>>>> extra protection
>>>> selectively on these LTR frames or synchronization with the receiver 
>>>> of reception of
>>>> the LTR frames during transmission, decoder can receive reference 
>>>> frames more reliably
>>>> than other non-reference frames. As a result, transmission error can 
>>>> be effectively
>>>> restricted within certain frames rather than propagated to future 
>>>> frames.
>>>>
>>>> We are introducing below V4l2 Controls for this feature
>>>> 1. V4L2_CID_MPEG_VIDEO_LTRCOUNT
>>>>     a. This is used to query or configure the number of LTR frames.
>>>>        This is a static control and is controlled by the client.
>>>>     b. The LTR index varies from 0 to the max LTR-1.
>>>>     c. If LTR Count is more than max supported LTR count (max LTR) by 
>>>> driver, it will be rejected.
>>>>     d. Auto Marking : If LTR count is non zero,
>>>>         1) first LTR count frames would be mark as LTR automatically 
>>>> after
>>>>       	   every IDR frame (inclusive).
>>>>         2) For multilayer encoding: first LTR count base layer 
>>>> reference frames starting after
>>>>            every IDR frame (inclusive) in encoding order would be 
>>>> marked as LTR frames by the encoder.
>>>>         3) Auto marking of LTR due to IDR should consider following 
>>>> conditions:
>>>>             1. The frame is not already set to be marked as LTR.
>>>>             2. The frame is part of the base layer in the 
>>>> hierarchical layer case.
>>>>             3. The number of frames currently marked as LTR is less 
>>>> than the maximum LTR frame index plus 1.
>>>>     e. Encoder needs to handle explicit Mark/Use command when encoder 
>>>> is still doing "auto" marking
>>
>> I don't follow this, quite possibly due to lack of experience with 
>> encoders.
>>
>> I kind of would expect to see two modes: either automatic where 
>> encoders can
>> mark up to LTR_COUNT frames as long term reference, and userspace just 
>> sets
>> LTR_COUNT and doesn't have to do anything else.
>>
>> Or it is manual mode where userspace explicitly marks long term 
>> reference
>> frames.
>>
>> From the proposal above it looks like you can mix auto and manual 
>> modes.
>>
>> BTW, how do you 'unmark' long term reference frames?
>>
>> This feature is for stateful encoders, right?
>>
>>>
>>> Perhaps we are missing a LONG_TERM_REFERENCE_MODE ? I bet some encoder
>>> can select by themself long term references and even some encoders may
>>> not let the user decide.
>>>
>>> (not huge han of LTR acronyme, but that could be fine too, assuming 
>>> you
>>> add more _).
>>>
> 
> Userspace sets LTR count which signifies the number of LTR frames 
> encoder needs to generate or keep.
> The encoder has to build-up its internal buffer reference list (aka DBP 
> list or recon buffer list).
> In order to achieve that encoder will fill It's LTR (long term 
> references) list and STR (short term references) list
> by auto marking n frames as LTR frames(n is equal to LTR count) based on 
> auto-marking dictated by the encoder spec.
> The client then can replace those automatically marked frames with new 
> frames using V4L2_CID_MPEG_VIDEO_MARKLTRFRAME and can ask
> encoder to refer the newly marked frame for encoding the next frame 
> using V4L2_CID_MPEG_VIDEO_USELTRFRAME.
> 
>>>>
>>>> 2. V4L2_CID_MPEG_VIDEO_MARKLTRFRAME :
>>>>     a. This signals to mark the current frame as LTR frame. It is a 
>>>> dynamic control and also provide the LTR index to be used.
>>>>     b. the LTR index provided by this control should never exceed the 
>>>> max LTR-1. Else it will be rejected.
>>>
>>> The "current" frame seems a bit loose. Perhaps you wanted to use 
>>> buffer
>>> flags ? A bit like what we have to signal TOP/BOTTOM fields in
>>> alternate interlacing.
>>
>> I was thinking the same thing. Using a control for this doesn't seem 
>> right.
>>
> 
> the client sets this to replace automatically marked frames by the 
> encoder with a particular frame.
> this provides an index that ranges from 0 to LTR count-1 and then the 
> particular frame will be marked with that index.
> this can be achieved through request by associating this control with a 
> specific buffer to make it synchronized.
> 
>>>
>>>>
>>>> 3. V4L2_CID_MPEG_VIDEO_USELTRFRAME :
>>>>     a. This specifies the LTR frame(s) to be used for encoding the 
>>>> current frame. This is a dynamic control.
>>>>     b. LTR Use Bitmap : this consists of bits [0, 15]. A total of N 
>>>> LSB bits of this field are valid,
>>>>        where N is the maximum number of LTRs supported. All the other 
>>>> bits are invalid and should be rejected.
>>>>        The LSB corresponds to the LTR index 0. Bit N-1 from the LSB 
>>>> corresponds to the LTR index max LTR-1.
>>
>> How would userspace know this? Esp. with auto marking since userspace 
>> would have
>> to predict how auto marking works (if I understand this correctly).
>>
> 
> Client sets LTR count which tells about the number of LTR frames 
> automatically marked by the encoder.
> so client can use LTR index (0 to LTR count -1) to ask encoder to refer 
> any particular
> frame (marked automatically by driver or marked by client with 
> V4L2_CID_MPEG_VIDEO_MARKLTRFRAME) as a reference to encode the next 
> frame.
> 
>> For which HW encoder is this meant?
>>
> This is primarily meant for H264 and HEVC.

The venus encoder?

Some more questions:

1) How many LTR frames do h.264 and hevc allow?
2) Given N LTR frames, is there a ordering of those frames? E.g.
   the LTR frame with index 0 is processed/used differently from
   LTR frame with index 1? Or are they all equal in that it is just a pool
   of LTR frames that the encoder can use as it wishes?

Regards,

	Hans

> 
> Thanks,
> Dikshita
> 
>>>
>>> Note, I haven't captured very well the userspace control flow, perhaps
>>> this could be enhanced through writing some documentation.
>>>
>>> As per all other generic encoder controls, we need to make sure it 
>>> will
>>> be usable and flexible enough for multiple HW blocks, as it can be
>>> tedious to extend later otherwise. It is important that along with 
>>> this
>>> RFC you provide some comparisons with with other HW / SW APIs in order
>>> to help justify the design decisions. I also think there should be
>>> link made V4L2_CID_MPEG_VIDEO_GOP_* , number of B-Frames etc.
>>
>> I agree with Nicolas.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> regards,
>>> Nicolas
>>>
>>>>
>>>> Dikshita Agarwal (1):
>>>>   media: v4l2-ctrls:  add control for ltr
>>>>
>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 6 ++++++
>>>>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>>>>  2 files changed, 10 insertions(+)
>>>>
>>>

