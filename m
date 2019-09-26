Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B80CBF4E0
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 16:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfIZOQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 10:16:45 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46747 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726500AbfIZOQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 10:16:45 -0400
Received: from [IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68] ([IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DUZTiOrrKKKNGDUZWi6qaG; Thu, 26 Sep 2019 16:16:42 +0200
Subject: Re: [PATCH 2/2] media: uapi: h264: clarify pic_order_cnt_bit_size
 field
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
References: <20190905131255.10150-1-p.zabel@pengutronix.de>
 <20190905131255.10150-2-p.zabel@pengutronix.de>
 <457642c2-7d77-5eab-4537-01151b474aa9@xs4all.nl>
 <1569506956.3011.7.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5df2e20e-b9e3-4a79-956e-e4d5c9f4a996@xs4all.nl>
Date:   Thu, 26 Sep 2019 16:16:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569506956.3011.7.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKrNdh/aYDmlK2FHf+JZqeIvoU3vsVrnaZJfe34/4XtUHtBrga/MfwtB7A+lrTiBjCIVKPQv9h0v2CB8FXEPKm7e/vgc2jTdn1AeLhCFCcg2xfzVYAZG
 zzm8p6C75cqKka5BW6MLQudbp0CSlfCZ0j+cE580poKX3njXGrpX8pyZ4VEvHY6kCxrormN27f54DJooFve736S+b5OKTrG/xfM0NkytBppjz4H4xoDMdrpR
 0zs8d8XF7Xw31jFpygE8rAg46SrxRr3l2hdZ0iPbd5ZyRfMxX9DWGcI+F4BkOyWhQGjdFWuE16clRdr+FJU5+3dH7emxZFvT4HYloRvY/e1FFzX8AoJSk5Td
 RcTcLK607y+6kpEy9h/Mv0/UulrZXz/lFeZTzAIOrks5L+Q153LoFfNj2XnRs4kFwpF2Uj455r68L2TxfXCfe1IT41kuCYOUdJZPYd6vXtmQ0k26Xiuavz5A
 WpsotGunVcuP1WPInIE8+u8KuG8g1373Pixxrw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/26/19 4:09 PM, Philipp Zabel wrote:
> Hi Hans,
> 
> On Thu, 2019-09-26 at 15:23 +0200, Hans Verkuil wrote:
>> On 9/5/19 3:12 PM, Philipp Zabel wrote:
>>> Since pic_order_cnt_bit_size is not a syntax element itself, explicitly
>>> state that it is the total size in bits of the pic_order_cnt_lsb,
>>> delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
>>> delta_pic_order_cnt[1] syntax elements contained in the slice.
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> index c281bc7ed1b3..08b49b2bbfa8 100644
>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>> @@ -1799,7 +1799,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>        - Size in bits of the dec_ref_pic_marking() syntax element.
>>>      * - __u32
>>>        - ``pic_order_cnt_bit_size``
>>> -      -
>>> +      - Size in bits of the pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
>>> +        delta_pic_order_cnt[0], and delta_pic_order_cnt[1] syntax elements.
>>
>> It's a little bit ambiguous: this field contains the size in bits of all these
>> fields combined, right? Not the size in bits of each field separately.
> 
> Yes.
> 
>> I.e. if these fields are all 8 bits, then pic_order_cnt_bit_size is 4*8 and
>> not just 8.
> 
> The size of pic_order_cnt_lsb is determined by another field's value
> (log2_max_pic_order_cnt_lsb_minus4), and the other three are
> exponential-Golomb coded, so each can be of different length (including
> zero).
> 
>> I think this should be rephrased.
> 
> Ok, how about:
> 
>  "Combined size in bits of the picture order count related syntax
>   elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
>   delta_pic_order_cnt[0], and delta_pic_order_cnt[1]."

That's better.

> 
> Actually, there's either pic_order_cnt_lsb + (optionally)
> delta_pic_order_cnt_bottom present, or delta_pic_order_cnt[0] +
> (optionally) delta_pic_order_cnt[1], never all four. Describing that in
> the uapi docs seemed overly verbose, though.

I agree.

Regards,

	Hans

 The relevant part in the
> slice_header() syntax spec looks like this:
> 
>   if (pic_order_cnt_type == 0) {
>     pic_order_cnt_lsb
>     if (bottom_field_pic_order_in_frame_present_flag && !field_pic_flag)
>       delta_pic_order_cnt_bottom
>   }
>   if (pic_order_cnt_type == 1 && !delta_pic_order_always_zero_flag) {
>     delta_pic_order_cnt[0]
>     if (bottom_field_pic_order_in_frame_present_flag && !field_pic_flag)
>       delta_pic_order_cnt[1]
>   }
> 
> pic_order_cnt_bit_size is supposed to be the size in bits of this whole
> block. pic_order_cnt_type and log2_max_pic_order_cnt_lsb_minus4 are from
> the SPS header, bottom_field_pic_order_in_frame_present_flag is from the
> PPS header, and field_pic_flag is contained earlier in the slice header.
> 
> regards
> Philipp
> 

