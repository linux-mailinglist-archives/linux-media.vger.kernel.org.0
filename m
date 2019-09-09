Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC214ADAA2
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 16:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731172AbfIIOAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 10:00:31 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51603 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731053AbfIIOAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 10:00:31 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7KDRi3Eck50xT7KDUiAas2; Mon, 09 Sep 2019 16:00:29 +0200
Subject: Re: [PATCH] media: uapi: h264: clarify
 num_ref_idx_l[01]_(default_)active fields
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
 <4fd58acf-4553-aff2-85ab-3bd2b1851090@xs4all.nl>
 <1568032074.2956.5.camel@pengutronix.de>
 <205e9605-05ac-c9aa-e3f6-b6e576778252@xs4all.nl>
 <1568036165.2956.7.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <57441d52-af69-5364-e66f-9923372ed3f7@xs4all.nl>
Date:   Mon, 9 Sep 2019 16:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568036165.2956.7.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIa3qItYdhjllf9aAlw7lggomJezhom0YMCWQ743maNlDw2kTkQIfu/FYE6TeIhQuGPwjEbDj66isaTXwCPXnOoqYecHTunNTxT9IZGqJNXDsPhwMHu3
 wmFeW8Oh4ACxx2vGpixc0BDooY1mT6YD8w6XTwkAM3fPA3KuQsU8VJiULc0VZtzwEnJLpMBXYW/X/ZroHceN+gRealqfyoPSUXOWKawwyrvhDmInGORHCfvQ
 ILd83P7KufknQBllAxI1dRzaujMb1EqNcDn5QxUotU8ZxbK4iojyQwQluHvwcgjTMki7bsG+vDJ1h6YiGNLJGtwIl1yWZzcm17hzr4Gn/znoxIuw/maNJrvM
 mp+VS+x/R7JTWQsIlAtKXtSFipKMdTlgFagqDvjJmS83eDHvV6w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 3:36 PM, Philipp Zabel wrote:
> On Mon, 2019-09-09 at 14:43 +0200, Hans Verkuil wrote:
>> On 9/9/19 2:27 PM, Philipp Zabel wrote:
>>> On Mon, 2019-09-09 at 14:09 +0200, Hans Verkuil wrote:
>>>> On 9/5/19 1:42 PM, Philipp Zabel wrote:
> [...]
>>>>> @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>>>        -
>>>>>      * - __u8
>>>>>        - ``num_ref_idx_l0_active_minus1``
>>>>> -      -
>>>>> +      - This field is used by decoders that do not parse slices themselves.
>>>>> +        If num_ref_idx_active_override_flag is not set, this field must be
>>>>> +        set to the value of num_ref_idx_l0_default_active_minus1.
>>>>
>>>> I don't think you can know if the decoder parses the slices.
>>>
>>> That is correct.
>>>
>>>> Wouldn't it be better to just delete the 'This field is only used by decoders
>>>> that parse slices themselves.' sentence? Drivers for HW that handle this can
>>>> just ignore these fields.
>>>
>>> If this has no place in the API documentation, or if it just might
>>> confuse the user in a different way, it's indeed better drop these.
>>> Is there another place where this could be clarified instead, perhaps
>>> the kerneldoc comments?
>>
>> A code comment in those drivers where the HW parses this would make
>> sense since that explains why that driver ignores these fields.
>>
>> But I would not mention this at all in the userspace API.
>>
>> The 'If num_ref_idx_active_override_flag is not set, this field must be
>> set to the value of num_ref_idx_l0_default_active_minus1.' addition is
>> of course fine.
> 
> Ok. I'll revise the patch accordingly.
> 
>> I'm a bit confused, though: you say some HW can parse this, but how?
>> It's part of the slice_header, so it ends up in struct v4l2_ctrl_h264_slice_params,
>> right? So how can the HW parse this without also providing the
>> num_ref_idx_active_override_flag value?
> 
> The complete slice queued via VIDIOC_QBUF still contains all these
> fields (and more). Presumably that's where the Hantro G1 reads the
> num_ref_idx_active_override_flag from, as well as other fields that it
> doesn't use from v4l2_ctrl_h264_slice_params.

Right. Can you check if the current description for V4L2_PIX_FMT_H264_SLICE_RAW
in our spec is sufficiently detailed to make it clear what is in the buffer?

In particular I would like to see a reference to the H.264 spec that
describes the slice data format.

Regards,

	Hans

> 
> G1 can not parse the slice header completely by itself though,
> it needs to be told the total size of the (pic_order_cnt_lsb /
> delta_pic_order_cnt_bottom / delta_pic_order_cnt0 /
> delta_pic_order_cnt1) syntax elements and the size of the
> dec_ref_pic_marking() syntax element, as well as the values of
> pic_parameter_set_id, frame_num, and idr_pic_id, and some flags.
> The num_ref_idx_l[01]_active_minus1 fields are among those parsed from
> the vb2 buffer directly.
> 
> That's why the hantro-vpu driver ignores the header_bit_size field,
> whereas cedrus has to use it to tell the hardware how to skip the
> header.
> 
> Cedrus completely ignores the num_ref_idx_l[01]_default_active_minus1
> fields, and always uses the values passed via
> num_ref_idx_l[01]_active_minus1, see cedrus_h264.c +343:
>         /*
>          * FIXME: the kernel headers are allowing the default value to
>          * be passed, but the libva doesn't give us that.
>          */
>         reg |= (slice->num_ref_idx_l0_active_minus1 & 0x1f) << 10;
>         reg |= (slice->num_ref_idx_l1_active_minus1 & 0x1f) << 5;
>         cedrus_write(dev, VE_H264_PPS, reg);
> 
> and +388:
>         reg |= VE_H264_SHS2_NUM_REF_IDX_ACTIVE_OVRD;
>         reg |= (slice->num_ref_idx_l0_active_minus1 & 0x1f) << 24;
>         reg |= (slice->num_ref_idx_l1_active_minus1 & 0x1f) << 16;
>         cedrus_write(dev, VE_H264_SHS2, reg);
> 
> ^ that's the override flag being set unconditionally, to select the
> values from SHS2 over those from PPS.
> 
> regards
> Philipp
> 

