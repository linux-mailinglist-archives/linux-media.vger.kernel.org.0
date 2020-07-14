Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4267B21E9EB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 09:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgGNHV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 03:21:58 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:24741 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726602AbgGNHV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 03:21:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594711315; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=g+7CvZDLH4+dV0RR1o5l6XfYy1r2BwGxUi5cULYTmy8=;
 b=EmzCYvk1Sc13VZMsYCrgIR1NAXAqBKgAetVGDVm5ahTty2rR8wvvvuUuHduH0gjbO52k8oAH
 4wAczMaMyR8Q5RimY8+jTVjFztvUYnebnltvXt6sX06PrdjZtxeXy52wA+2Ktgehk3OBrgRU
 5Fq8Rdf9148x4ZOW49J08e7fxvM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f0d5d0fee866185759a8642 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 07:21:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1AAEC43391; Tue, 14 Jul 2020 07:21:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B209C433CA;
        Tue, 14 Jul 2020 07:21:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 14 Jul 2020 12:51:49 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        ribalda@kernel.org, paul.kocialkowski@bootlin.com,
        posciak@chromium.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        majja@codeaurora.org, linux-media-owner@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] Add LTR controls
In-Reply-To: <40040141fc3027c3eb1fdebc1a0e8ade@codeaurora.org>
References: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
 <f07c4aab69d2b333c0e36c50c526c0a85322e708.camel@ndufresne.ca>
 <1a9904b6-60a5-0faa-8a5e-c9dc00802184@xs4all.nl>
 <40040141fc3027c3eb1fdebc1a0e8ade@codeaurora.org>
Message-ID: <a52d74a1284531e7d919eb9d675697f3@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

A gentle reminder for the review.

Thanks,
Dikshita

On 2020-06-17 00:11, dikshita@codeaurora.org wrote:
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
>>>>     c. If LTR Count is more than max supported LTR count (max LTR) 
>>>> by driver, it will be rejected.
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
>>>>     e. Encoder needs to handle explicit Mark/Use command when 
>>>> encoder is still doing "auto" marking
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
>>> Perhaps we are missing a LONG_TERM_REFERENCE_MODE ? I bet some 
>>> encoder
>>> can select by themself long term references and even some encoders 
>>> may
>>> not let the user decide.
>>> 
>>> (not huge han of LTR acronyme, but that could be fine too, assuming 
>>> you
>>> add more _).
>>> 
> 
> Userspace sets LTR count which signifies the number of LTR frames
> encoder needs to generate or keep.
> The encoder has to build-up its internal buffer reference list (aka
> DBP list or recon buffer list).
> In order to achieve that encoder will fill It's LTR (long term
> references) list and STR (short term references) list
> by auto marking n frames as LTR frames(n is equal to LTR count) based
> on auto-marking dictated by the encoder spec.
> The client then can replace those automatically marked frames with new
> frames using V4L2_CID_MPEG_VIDEO_MARKLTRFRAME and can ask
> encoder to refer the newly marked frame for encoding the next frame
> using V4L2_CID_MPEG_VIDEO_USELTRFRAME.
> 
>>>> 
>>>> 2. V4L2_CID_MPEG_VIDEO_MARKLTRFRAME :
>>>>     a. This signals to mark the current frame as LTR frame. It is a 
>>>> dynamic control and also provide the LTR index to be used.
>>>>     b. the LTR index provided by this control should never exceed 
>>>> the max LTR-1. Else it will be rejected.
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
> this can be achieved through request by associating this control with
> a specific buffer to make it synchronized.
> 
>>> 
>>>> 
>>>> 3. V4L2_CID_MPEG_VIDEO_USELTRFRAME :
>>>>     a. This specifies the LTR frame(s) to be used for encoding the 
>>>> current frame. This is a dynamic control.
>>>>     b. LTR Use Bitmap : this consists of bits [0, 15]. A total of N 
>>>> LSB bits of this field are valid,
>>>>        where N is the maximum number of LTRs supported. All the 
>>>> other bits are invalid and should be rejected.
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
> so client can use LTR index (0 to LTR count -1) to ask encoder to
> refer any particular
> frame (marked automatically by driver or marked by client with
> V4L2_CID_MPEG_VIDEO_MARKLTRFRAME) as a reference to encode the next
> frame.
> 
>> For which HW encoder is this meant?
>> 
> This is primarily meant for H264 and HEVC.
> 
> Thanks,
> Dikshita
> 
>>> 
>>> Note, I haven't captured very well the userspace control flow, 
>>> perhaps
>>> this could be enhanced through writing some documentation.
>>> 
>>> As per all other generic encoder controls, we need to make sure it 
>>> will
>>> be usable and flexible enough for multiple HW blocks, as it can be
>>> tedious to extend later otherwise. It is important that along with 
>>> this
>>> RFC you provide some comparisons with with other HW / SW APIs in 
>>> order
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
