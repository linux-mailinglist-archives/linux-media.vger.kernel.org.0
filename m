Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA79F1F75C2
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 11:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgFLJMF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 05:12:05 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55237 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726302AbgFLJME (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 05:12:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id jfjBjnSsNK7ldjfjEjN3uB; Fri, 12 Jun 2020 11:12:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591953122; bh=H9BBbLuQlS8Zbm6ilIo7QdtdgtpGzGEw0P/7zt+ttqQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H6aV9WgYz6HMR/yRKdJbKLkNuBPeNfd8F9L7vQG7Slh/kguLG24Rk7PKF5Fx2nvVO
         JnaKtqvx0toyd9DYaRH+2S+FyrFK+wtas0Hb5cAnw+ZEGUmU9T9iyrtGJujV7P99rM
         kaxkQzEZZ2d8aMIKWWIuLI1Rh9EpQtXj+BjIk0EY/iPkiRoKpq+dntC9w+ZYvmWyEq
         zMry8fLiMdPjVdgWKvMDasUSmR45d1acbndzcIrZ32wiA1q+D2xe0KXGPWV1+UrzHl
         NdKyaaPvNNxgVCS2Xq1totr93UVwmLYJUNgszDA5GYPAbwBcG7XU5nn2O1FpHoU2PX
         5Vl7H6A8XdhaA==
Subject: Re: [RFC PATCH 0/1] Add LTR controls
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>, mchehab@kernel.org,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        ribalda@kernel.org, paul.kocialkowski@bootlin.com,
        posciak@chromium.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
References: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
 <f07c4aab69d2b333c0e36c50c526c0a85322e708.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1a9904b6-60a5-0faa-8a5e-c9dc00802184@xs4all.nl>
Date:   Fri, 12 Jun 2020 11:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f07c4aab69d2b333c0e36c50c526c0a85322e708.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNDlgwDfowMaXf3X8pJe9r2I6TmJng5QZ0oDowvL5NEsK9Xb5Rxa3t+1dwkZPnjGWy3PRF9VtRDzBQ+sbVpF8YkyJhwvVWdwWPEfr4oEMVX7E3K8l23w
 qqM/33EZqJKEpuSTZf+dKjbOzX9N00Z1tDOF7YET58k3KGEVrzcXiUp+W3g8gCRNySW9KdTQT6cblLZ+Yo6XLVI9beRXNXxM/4L9kJ5GvukxD56dstRVyhkz
 giu99nnPONd4ayQvUs2hWuO6ngOlZYAAyu4+MZRZFFw2VxpJNdiyZxq9e3NVNd5ULCU+fcWuKkUWJa1NiPD/i0uYryEvLWbdexrc5HoJ9dtghArYaXwxljbW
 +Gh6/XhJ2ZapgYKfQbZY8cOp2h6bXVmbhsJYIuZJRmG6mtKc6wNGeReS8XyulzywRdv3RmyOunSUJJ0Q+41nhiAL0eJsnY7r37W1Ghj8y75hSnAjhk+MuiXZ
 msmvl+4xCqyt1cALfOC8Nu080OwUl0hEDA66p4I9w68BeF9am1MoH+iIDbyjud8LaXgEIE7N/dW1RBdMNaSSr1raISOfxj83yoD5A1/PyJLHCZhYueS8TZId
 XoBjdhGhBcuqhq4zio5eH9FQfn+y9LZTQ7rwry0hd/mteorteHD6YWfjcevAEB8NyBAMDn+bCp/Q1eSXo4gz6DSH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita, Nicolas,

On 11/06/2020 16:22, Nicolas Dufresne wrote:
> Le jeudi 11 juin 2020 à 15:55 +0530, Dikshita Agarwal a écrit :
>> LTR (Long Term Reference) frames are the frames that are encoded sometime in the past
>> and stored in the DPB buffer list to be used as reference to encode future frames.
>> One usage of LTR encoding is to reduce error propagation for video transmission
>> in packet lossy networks.  For example, encoder may want to specify some key frames as
>> LTR pictures and use them as reference frames for encoding. With extra protection
>> selectively on these LTR frames or synchronization with the receiver of reception of
>> the LTR frames during transmission, decoder can receive reference frames more reliably
>> than other non-reference frames. As a result, transmission error can be effectively
>> restricted within certain frames rather than propagated to future frames.
>>
>> We are introducing below V4l2 Controls for this feature
>> 1. V4L2_CID_MPEG_VIDEO_LTRCOUNT
>>     a. This is used to query or configure the number of LTR frames.
>>        This is a static control and is controlled by the client.
>>     b. The LTR index varies from 0 to the max LTR-1.
>>     c. If LTR Count is more than max supported LTR count (max LTR) by driver, it will be rejected.
>>     d. Auto Marking : If LTR count is non zero,
>>         1) first LTR count frames would be mark as LTR automatically after
>>       	   every IDR frame (inclusive).
>>         2) For multilayer encoding: first LTR count base layer reference frames starting after
>>            every IDR frame (inclusive) in encoding order would be marked as LTR frames by the encoder.
>>         3) Auto marking of LTR due to IDR should consider following conditions:
>>             1. The frame is not already set to be marked as LTR.
>>             2. The frame is part of the base layer in the hierarchical layer case.
>>             3. The number of frames currently marked as LTR is less than the maximum LTR frame index plus 1.
>>     e. Encoder needs to handle explicit Mark/Use command when encoder is still doing "auto" marking

I don't follow this, quite possibly due to lack of experience with encoders.

I kind of would expect to see two modes: either automatic where encoders can
mark up to LTR_COUNT frames as long term reference, and userspace just sets
LTR_COUNT and doesn't have to do anything else.

Or it is manual mode where userspace explicitly marks long term reference
frames.

From the proposal above it looks like you can mix auto and manual modes.

BTW, how do you 'unmark' long term reference frames?

This feature is for stateful encoders, right?

> 
> Perhaps we are missing a LONG_TERM_REFERENCE_MODE ? I bet some encoder
> can select by themself long term references and even some encoders may
> not let the user decide.
> 
> (not huge han of LTR acronyme, but that could be fine too, assuming you
> add more _).
> 
>>
>> 2. V4L2_CID_MPEG_VIDEO_MARKLTRFRAME :
>>     a. This signals to mark the current frame as LTR frame. It is a dynamic control and also provide the LTR index to be used.
>>     b. the LTR index provided by this control should never exceed the max LTR-1. Else it will be rejected.
> 
> The "current" frame seems a bit loose. Perhaps you wanted to use buffer
> flags ? A bit like what we have to signal TOP/BOTTOM fields in
> alternate interlacing.

I was thinking the same thing. Using a control for this doesn't seem right.

> 
>>
>> 3. V4L2_CID_MPEG_VIDEO_USELTRFRAME :
>>     a. This specifies the LTR frame(s) to be used for encoding the current frame. This is a dynamic control.
>>     b. LTR Use Bitmap : this consists of bits [0, 15]. A total of N LSB bits of this field are valid,
>>        where N is the maximum number of LTRs supported. All the other bits are invalid and should be rejected.
>>        The LSB corresponds to the LTR index 0. Bit N-1 from the LSB corresponds to the LTR index max LTR-1.

How would userspace know this? Esp. with auto marking since userspace would have
to predict how auto marking works (if I understand this correctly).

For which HW encoder is this meant?

> 
> Note, I haven't captured very well the userspace control flow, perhaps
> this could be enhanced through writing some documentation.
> 
> As per all other generic encoder controls, we need to make sure it will
> be usable and flexible enough for multiple HW blocks, as it can be
> tedious to extend later otherwise. It is important that along with this
> RFC you provide some comparisons with with other HW / SW APIs in order
> to help justify the design decisions. I also think there should be 
> link made V4L2_CID_MPEG_VIDEO_GOP_* , number of B-Frames etc.

I agree with Nicolas.

Regards,

	Hans

> 
> regards,
> Nicolas
> 
>>
>> Dikshita Agarwal (1):
>>   media: v4l2-ctrls:  add control for ltr
>>
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 6 ++++++
>>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>>  2 files changed, 10 insertions(+)
>>
> 

