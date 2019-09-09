Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF1A7AD94C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 14:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfIIMnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 08:43:45 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:49999 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727130AbfIIMnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 08:43:45 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 7J19iegilMK4h7J1CiVe0L; Mon, 09 Sep 2019 14:43:43 +0200
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <205e9605-05ac-c9aa-e3f6-b6e576778252@xs4all.nl>
Date:   Mon, 9 Sep 2019 14:43:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568032074.2956.5.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMKhGZdJ4tu6mncFMqELBK+dNjYXK0VcEaS2r7yxFqIeXIJaRS2w+Lbi0/+i4z93VzXDuYHCkZNGMAipJNIbe/XTn3KGECWhlSkRM8zOqngQUnlCGdyC
 Sl01hxANac9r3J4tRqYOiVYmP9z2dHtr99xmEvssqK4hkje+SJGzBfU8luA6nJV3kJ0nLOHwrk9aIwZG8W19YQxcVKP5X+qxU4rFgqeHFAz+ombYsWwgwB5/
 46oBfliO8OcOT5VXxPwTyVNfpeSJ7abXO0WaP1kmvH97GOctvuL7zmhbckk0EqL85tXJqz/jDWHNRTB3Pt2AJl8A1Pw73jVJzrrqckSRRM/Fcn4IzbLGogxv
 5BXg7JhGkGC3EhsbopGQiskvD9p4oiuBUFZVsREXGUocrfMlXu4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 2:27 PM, Philipp Zabel wrote:
> On Mon, 2019-09-09 at 14:09 +0200, Hans Verkuil wrote:
>> On 9/5/19 1:42 PM, Philipp Zabel wrote:
>>> To explain why num_ref_idx_active_override_flag is not part of the API,
>>> describe how the num_ref_idx_l[01]_active_minus1 fields and the
>>> num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
>>> whether the decoder parses slice headers itself or not.
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
>>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> index bc5dd8e76567..b9834625a939 100644
>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> @@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>        -
>>>      * - __u8
>>>        - ``num_ref_idx_l0_default_active_minus1``
>>> -      -
>>> +      - This field is only used by decoders that parse slices themselves.
>>
>> How do you know that the decoder does this?
> 
> We don't, so usespace has to provide it unconditionally.
> 
> This was meant as an explanation why. As you can see from the "media:
> hantro: h264: per-slice num_ref_idx_l[01]_active override" thread I
> found this a bit unintuitive.
> 
>>>      * - __u8
>>>        - ``num_ref_idx_l1_default_active_minus1``
>>> -      -
>>> +      - This field is only used by decoders that parse slices themselves.
>>>      * - __u8
>>>        - ``weighted_bipred_idc``
>>>        -
>>> @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>        -
>>>      * - __u8
>>>        - ``num_ref_idx_l0_active_minus1``
>>> -      -
>>> +      - This field is used by decoders that do not parse slices themselves.
>>> +        If num_ref_idx_active_override_flag is not set, this field must be
>>> +        set to the value of num_ref_idx_l0_default_active_minus1.
>>
>> I don't think you can know if the decoder parses the slices.
> 
> That is correct.
> 
>> Wouldn't it be better to just delete the 'This field is only used by decoders
>> that parse slices themselves.' sentence? Drivers for HW that handle this can
>> just ignore these fields.
> 
> If this has no place in the API documentation, or if it just might
> confuse the user in a different way, it's indeed better drop these.
> Is there another place where this could be clarified instead, perhaps
> the kerneldoc comments?

A code comment in those drivers where the HW parses this would make
sense since that explains why that driver ignores these fields.

But I would not mention this at all in the userspace API.

The 'If num_ref_idx_active_override_flag is not set, this field must be
set to the value of num_ref_idx_l0_default_active_minus1.' addition is
of course fine.

I'm a bit confused, though: you say some HW can parse this, but how?
It's part of the slice_header, so it ends up in struct v4l2_ctrl_h264_slice_params,
right? So how can the HW parse this without also providing the
num_ref_idx_active_override_flag value?

Regards,

	Hans

> 
> Basically I was confused about why both the default and the override
> have to be provided, and how the kernel driver determines which one to
> choose, since the override flag is not part of the kernel API. As it
> turns out, it doesn't have to choose; depending on whether the hardware
> parses slices, the driver can pick either one or the other, and always
> use that.
> 
> regards
> Philipp
> 

