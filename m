Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D15123E948
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgHGIjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:39:46 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45323 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgHGIjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Aug 2020 04:39:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 3xuekF5rnuuXO3xufkszm8; Fri, 07 Aug 2020 10:39:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596789582; bh=eMMpSzp/x05VVXxKx6q3KU0DWwYmTE0vBs0szmaelP4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=At9Ufbe0xlj89T4UL10YEDb7dkjuWbq2Fk/Dk9YGjnuKQB2pmLtLqEOa6JECxUX5s
         zVQtKDq6s7w6eroG708gVaS6z/O8GuRhIUeex37jnCqraCCuO7AwvsAJrCfdBFtlqt
         cNuQnxZTlxgIKnzq9LTzMnp9nGykbYSY3U6aPVPpUj8M3qrha/bJAKeJ7zE2F3VL1q
         7OyADTqIDQ4xr6Ee0Ci0pgmdIVRJEY0IFVd+ilCCJzZuRX6n27fi8y+JmEmI617/HC
         RQdCs7fWKIP+NTKWxe9KAFlvn+B8JwTM+WvZHItBmU0Eo7wQpP4OIvYDVvt9dF1ccr
         8V5peRnv00W3Q==
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
 <d37e4e83-b7ae-7d44-c75f-2055f11ae898@xs4all.nl>
 <dd365fe82523c4e44af4353f4f457137@codeaurora.org>
 <976be099-f003-d08f-3394-ff2dad43d7aa@xs4all.nl>
 <32881c41f811e625779f88c6da9deefb@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cafda0d3-627a-b5b7-813f-66320a83781e@xs4all.nl>
Date:   Fri, 7 Aug 2020 10:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <32881c41f811e625779f88c6da9deefb@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJn9sAG3LeIle/NVsi/7v2crd6bMdtZlC/SwaakcJIZWxKQ5619PGpF2AmXoY8kb4Mdce+Ty87aA4qw1yKqd3/vrlnNrujv0k3M5uTM2mtlv13t4ovX9
 oaxv9y+zM2jHyxzaoUMHT7FOQ28AyF7UeJ9pCiQPcvj1V0reG1v1rIn4A1ZY+lUaf4u6BT1EZuZNYO94HVG2E1W9x/gQJdipdIJb6gK77nuQBmmUlmw0bxvV
 +8cHd5/SWPijABVx6ZUEcpac1PUb0Mi8sVNvxRN6PJACgwqifK/hOtXido5qt4JmZCmp/ntG/uPg9yJnqKjucZaGDBCxtnypF9uig4I1riJkCiX20JzpV6Fj
 RAkbpOCKWdMTtFAgnnPN48DdUZW4/m5zKi11iXqjOqc67rgKb57bPi7MaGkqjN439mXDN27BSgd0SeIhRsEY95pQb9sCh3qmFS84QDD/PXk6PcUP90o/xlOe
 9xzXs+2mjfu7b6i6TMQl24g982hbd7FdKg58JSkVssDa5We/CRTCzUIB7ERrfzaoBbe/jEoB55A7/iDi7tBcyZMpAXoD/0Yc0uYld90nCfrTiCHWyoTy68D2
 65EfXdmFHQTm/M37Lc2Uz7wClAulGPicJ5D+gr2JIDyQGs8H0SISGKQlFdXev/1Jb6VMFbc6Yg+CUKwNw9UpC01bj0iBx+TPXgKXPT0iKO+XsvitIUyQ/EhC
 WzFhaDkxAc+Fm2bbcHBHO+BQpMNMg74l+HxizHKTSzQ80NzMk8h032hgTjy/phh4W1iuezaXTbmsbZxXios6DOIDHFGVKKwegxd3AnOx5HEES5baBIb9pg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 13:05, dikshita@codeaurora.org wrote:
> On 2020-07-22 19:56, Hans Verkuil wrote:
>> On 20/07/2020 16:33, dikshita@codeaurora.org wrote:
>>> On 2020-07-16 14:25, Hans Verkuil wrote:
>>>> On 16/06/2020 20:41, dikshita@codeaurora.org wrote:
>>>>> Hi Hans, Nicolas,
>>>>>
>>>>> Thanks for your comments.
>>>>>
>>>>> On 2020-06-12 14:41, Hans Verkuil wrote:
>>>>>> Hi Dikshita, Nicolas,
>>>>>>
>>>>>> On 11/06/2020 16:22, Nicolas Dufresne wrote:
>>>>>>> Le jeudi 11 juin 2020 à 15:55 +0530, Dikshita Agarwal a écrit :
>>>>>>>> LTR (Long Term Reference) frames are the frames that are encoded
>>>>>>>> sometime in the past
>>>>>>>> and stored in the DPB buffer list to be used as reference to encode
>>>>>>>> future frames.
>>>>>>>> One usage of LTR encoding is to reduce error propagation for video
>>>>>>>> transmission
>>>>>>>> in packet lossy networks.  For example, encoder may want to specify
>>>>>>>> some key frames as
>>>>>>>> LTR pictures and use them as reference frames for encoding. With
>>>>>>>> extra protection
>>>>>>>> selectively on these LTR frames or synchronization with the receiver
>>>>>>>> of reception of
>>>>>>>> the LTR frames during transmission, decoder can receive reference
>>>>>>>> frames more reliably
>>>>>>>> than other non-reference frames. As a result, transmission error can
>>>>>>>> be effectively
>>>>>>>> restricted within certain frames rather than propagated to future
>>>>>>>> frames.
>>>>>>>>
>>>>>>>> We are introducing below V4l2 Controls for this feature
>>>>>>>> 1. V4L2_CID_MPEG_VIDEO_LTRCOUNT
>>>>>>>>     a. This is used to query or configure the number of LTR frames.
>>>>>>>>        This is a static control and is controlled by the client.
>>>>>>>>     b. The LTR index varies from 0 to the max LTR-1.
>>>>>>>>     c. If LTR Count is more than max supported LTR count (max LTR) by
>>>>>>>> driver, it will be rejected.
>>>>>>>>     d. Auto Marking : If LTR count is non zero,
>>>>>>>>         1) first LTR count frames would be mark as LTR automatically
>>>>>>>> after
>>>>>>>>              every IDR frame (inclusive).
>>>>>>>>         2) For multilayer encoding: first LTR count base layer
>>>>>>>> reference frames starting after
>>>>>>>>            every IDR frame (inclusive) in encoding order would be
>>>>>>>> marked as LTR frames by the encoder.
>>>>>>>>         3) Auto marking of LTR due to IDR should consider following
>>>>>>>> conditions:
>>>>>>>>             1. The frame is not already set to be marked as LTR.
>>>>>>>>             2. The frame is part of the base layer in the
>>>>>>>> hierarchical layer case.
>>>>>>>>             3. The number of frames currently marked as LTR is less
>>>>>>>> than the maximum LTR frame index plus 1.
>>>>>>>>     e. Encoder needs to handle explicit Mark/Use command when encoder
>>>>>>>> is still doing "auto" marking
>>>>>>
>>>>>> I don't follow this, quite possibly due to lack of experience with
>>>>>> encoders.
>>>>>>
>>>>>> I kind of would expect to see two modes: either automatic where
>>>>>> encoders can
>>>>>> mark up to LTR_COUNT frames as long term reference, and userspace just
>>>>>> sets
>>>>>> LTR_COUNT and doesn't have to do anything else.
>>>>>>
>>>>>> Or it is manual mode where userspace explicitly marks long term
>>>>>> reference
>>>>>> frames.
>>>>>>
>>>>>> From the proposal above it looks like you can mix auto and manual
>>>>>> modes.
>>>>>>
>>>>>> BTW, how do you 'unmark' long term reference frames?
>>>>>>
>>>>>> This feature is for stateful encoders, right?
>>>>>>
>>>>>>>
>>>>>>> Perhaps we are missing a LONG_TERM_REFERENCE_MODE ? I bet some encoder
>>>>>>> can select by themself long term references and even some encoders may
>>>>>>> not let the user decide.
>>>>>>>
>>>>>>> (not huge han of LTR acronyme, but that could be fine too, assuming
>>>>>>> you
>>>>>>> add more _).
>>>>>>>
>>>>>
>>>>> Userspace sets LTR count which signifies the number of LTR frames
>>>>> encoder needs to generate or keep.
>>>>> The encoder has to build-up its internal buffer reference list (aka DBP
>>>>> list or recon buffer list).
>>>>> In order to achieve that encoder will fill It's LTR (long term
>>>>> references) list and STR (short term references) list
>>>>> by auto marking n frames as LTR frames(n is equal to LTR count) based on
>>>>> auto-marking dictated by the encoder spec.
>>>>> The client then can replace those automatically marked frames with new
>>>>> frames using V4L2_CID_MPEG_VIDEO_MARKLTRFRAME and can ask
>>>>> encoder to refer the newly marked frame for encoding the next frame
>>>>> using V4L2_CID_MPEG_VIDEO_USELTRFRAME.
>>>>>
>>>>>>>>
>>>>>>>> 2. V4L2_CID_MPEG_VIDEO_MARKLTRFRAME :
>>>>>>>>     a. This signals to mark the current frame as LTR frame. It is a
>>>>>>>> dynamic control and also provide the LTR index to be used.
>>>>>>>>     b. the LTR index provided by this control should never exceed the
>>>>>>>> max LTR-1. Else it will be rejected.
>>>>>>>
>>>>>>> The "current" frame seems a bit loose. Perhaps you wanted to use
>>>>>>> buffer
>>>>>>> flags ? A bit like what we have to signal TOP/BOTTOM fields in
>>>>>>> alternate interlacing.
>>>>>>
>>>>>> I was thinking the same thing. Using a control for this doesn't seem
>>>>>> right.
>>>>>>
>>>>>
>>>>> the client sets this to replace automatically marked frames by the
>>>>> encoder with a particular frame.
>>>>> this provides an index that ranges from 0 to LTR count-1 and then the
>>>>> particular frame will be marked with that index.
>>>>> this can be achieved through request by associating this control with a
>>>>> specific buffer to make it synchronized.
>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> 3. V4L2_CID_MPEG_VIDEO_USELTRFRAME :
>>>>>>>>     a. This specifies the LTR frame(s) to be used for encoding the
>>>>>>>> current frame. This is a dynamic control.
>>>>>>>>     b. LTR Use Bitmap : this consists of bits [0, 15]. A total of N
>>>>>>>> LSB bits of this field are valid,
>>>>>>>>        where N is the maximum number of LTRs supported. All the other
>>>>>>>> bits are invalid and should be rejected.
>>>>>>>>        The LSB corresponds to the LTR index 0. Bit N-1 from the LSB
>>>>>>>> corresponds to the LTR index max LTR-1.
>>>>>>
>>>>>> How would userspace know this? Esp. with auto marking since userspace
>>>>>> would have
>>>>>> to predict how auto marking works (if I understand this correctly).
>>>>>>
>>>>>
>>>>> Client sets LTR count which tells about the number of LTR frames
>>>>> automatically marked by the encoder.
>>>>> so client can use LTR index (0 to LTR count -1) to ask encoder to refer
>>>>> any particular
>>>>> frame (marked automatically by driver or marked by client with
>>>>> V4L2_CID_MPEG_VIDEO_MARKLTRFRAME) as a reference to encode the next
>>>>> frame.
>>>>>
>>>>>> For which HW encoder is this meant?
>>>>>>
>>>>> This is primarily meant for H264 and HEVC.
>>>>
>>>> The venus encoder?
>>> yes
>>>>
>>>> Some more questions:
>>>>
>>>> 1) How many LTR frames do h.264 and hevc allow?
>>> According to spec, MAX LTR allowed by H.264 is 15 and HEVC allows max 32 LTR frames.
>>>> 2) Given N LTR frames, is there a ordering of those frames? E.g.
>>>>    the LTR frame with index 0 is processed/used differently from
>>>>    LTR frame with index 1? Or are they all equal in that it is just a pool
>>>>    of LTR frames that the encoder can use as it wishes?
>>> they are different frames marked to be used as LTR and stored in available indices.
>>> Userspace notifies encoder which LTR frame index to use via USE LTR control.
>>
>> One more question: if a frame is marked as a LTR frame, does that mean
>> that userspace
>> can't reuse the buffer containing that frame? I assume that's the case.
>>
>> One thing that I don't like about this API is that it introduces the
>> LTR indices.
>> Would it be possible to instead use buffer indices? (i.e. the
>> v4l2_buffer index field).
>> Then you can use a buffer flag to indicate that a buffer should be an
>> LTR buffer,
>> or (for automarking) the driver can mark a buffer as an LTR buffer by
>> setting this flag
>> before returning the buffer to userspace.
>>
>> You would still need a V4L2_CID_MPEG_VIDEO_USELTRFRAME, but that can
>> be a bitmask
>> using the buffer index.
>>
>> This would avoid introducing a second method of referring to buffers
>> (LTR index),
>> and I think that V4L2_CID_MPEG_VIDEO_MARKLTRFRAME can be dropped.
>>
>> Regards,
>>
>>     Hans
> 
> Hi Hans,
> LTR indices are part of the spec, we are not introducing anything new.
> Also, there is no relation between v4l2 buffer index and LTR index. So we can't use V4l2 index as LTR index.

Ah, I think I start to understand the cause of my confusion: I thought that the
buffers containing LTR frames had to be kept around by userspace, but instead the
driver/HW makes copies and userspace does not need to do anything special with
those buffers.

OK, can you post a v2?

Document the controls in Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst

Regards,

	Hans

> 
> below are some details about LTR from spec:
> 
> Regarding LTR count:
> max_num_ref_frames specifies the maximum number of short-term and long-term reference frames, complementary reference field pairs, and non-paired reference fields that may be used by the decoding
> process for inter prediction of any picture in the coded video sequence. The value of max_num_ref_frames shall be in the range of 0 to MaxDpbFrames (as specified in clause A.3.1 or A.3.2), inclusive.
> max_long_term_frame_idx_plus1 minus 1 specifies the maximum value of long-term frame index allowed for long-term reference pictures (until receipt of another value of max_long_term_frame_idx_plus1).
> The value of max_long_term_frame_idx_plus1 shall be in the range of 0 to max_num_ref_frames, inclusive.
> 
> 
> Regarding LTR index which will be specified by V4L2_CID_MPEG_VIDEO_MARKLTRFRAM :
> long_term_pic_num specifies the long-term picture number of the picture being moved to the current index in the list. When decoding a coded frame, long_term_pic_num shall be equal to a LongTermPicNum
> assigned to one of the reference frames or complementary reference field pairs marked as "used for long-term reference".
> long_term_frame_idx is used (with memory_management_control_operation equal to 3 or 6) to assign a long-term frame index to a picture. When the associated memory_management_control_operation is
> processed by the decoding process, the value of long_term_frame_idx shall be in the range of 0 to MaxLongTermFrameIdx, inclusive.
> 
> 
> Also As there can be multiple LTR present. We can instruct encoder to use one and/or multiple of them using V4L2_CID_MPEG_VIDEO_USELTRFRAME with the bitmask.
> 
> Thanks,
> Dikshita
> 
>>
>>>
>>> Thanks,
>>> Dikshita
>>>>
>>>> Regards,
>>>>
>>>>     Hans
>>>>
>>>>>
>>>>> Thanks,
>>>>> Dikshita
>>>>>
>>>>>>>
>>>>>>> Note, I haven't captured very well the userspace control flow, perhaps
>>>>>>> this could be enhanced through writing some documentation.
>>>>>>>
>>>>>>> As per all other generic encoder controls, we need to make sure it
>>>>>>> will
>>>>>>> be usable and flexible enough for multiple HW blocks, as it can be
>>>>>>> tedious to extend later otherwise. It is important that along with
>>>>>>> this
>>>>>>> RFC you provide some comparisons with with other HW / SW APIs in order
>>>>>>> to help justify the design decisions. I also think there should be
>>>>>>> link made V4L2_CID_MPEG_VIDEO_GOP_* , number of B-Frames etc.
>>>>>>
>>>>>> I agree with Nicolas.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>>     Hans
>>>>>>
>>>>>>>
>>>>>>> regards,
>>>>>>> Nicolas
>>>>>>>
>>>>>>>>
>>>>>>>> Dikshita Agarwal (1):
>>>>>>>>   media: v4l2-ctrls:  add control for ltr
>>>>>>>>
>>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 6 ++++++
>>>>>>>>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>>>>>>>>  2 files changed, 10 insertions(+)
>>>>>>>>
>>>>>>>

