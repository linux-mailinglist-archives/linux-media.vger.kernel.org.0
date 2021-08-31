Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D1C3FC6E5
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 14:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241615AbhHaL5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 07:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbhHaL5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 07:57:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42732C061575;
        Tue, 31 Aug 2021 04:56:42 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:2d6:5982:f5be:998c] (unknown [IPv6:2a01:e0a:4cb:a870:2d6:5982:f5be:998c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D52781F42F46;
        Tue, 31 Aug 2021 12:56:39 +0100 (BST)
Subject: Re: [PATCH 1/2] media: hevc: Remove RPS named flags
To:     John Cox <jc@kynesim.co.uk>
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20210831094900.203283-1-benjamin.gaignard@collabora.com>
 <20210831094900.203283-2-benjamin.gaignard@collabora.com>
 <4g2sigpsttf80t72c7spdqqjvvijnths2d@4ax.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <fdf6417e-09cd-f0a0-a351-fccd64bfc8c7@collabora.com>
Date:   Tue, 31 Aug 2021 13:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4g2sigpsttf80t72c7spdqqjvvijnths2d@4ax.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 31/08/2021 à 13:08, John Cox a écrit :
>> Marking a picture as long-term reference is valid for DPB but not for RPS.
>> Change flag name to match with it description in HEVC spec chapiter
>> "8.3.2 Decoding process for reference picture set".
>> Remove the other unused RPS flags.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++----
>> drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
>> drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
>> include/media/hevc-ctrls.h                                | 4 +---
>> 4 files changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 3865acb9e0fd..eff33c511090 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -3138,10 +3138,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>> 	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
>>      * - __u8
>>        - ``rps``
>> -      - The reference set for the reference frame
>> -        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
>> -        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
>> -        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>> +      - Long term flag for the reference frame
>> +        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>>      * - __u8
>>        - ``field_pic``
>>        - Whether the reference is a field picture or a frame.
> If you are going to remove all the RPS values except for Long Term
> wouldn't it be better to rename the field too, either to "flags" or a
> bool "is_long_term"?  If we have a field called RPS it really should be
> able to have a value for any of the 5 valid Reference Picture Sets that
> a DPB entry can belong to.

I will send a v2 and rename rps into flags.

>
> As a side note, it is important to my code that the DPB array contains
> all the DPB entries not just the ones that are in use in this frame.  I
> need them so I can track which frames have left the DPB so I can
> reuse/free the MV tables associated with them (yes I could keep one for
> every entry in the capture Q but that is generally wasteful on memory
> and the Pi is often memory constrained). So maybe update the docn on DPB
> to make this explicit please? (I suspect that current code does this
> anyway as it is generally easier to do than to not.)

That should be in another patch :-)

Benjamin

>
> John Cox
>
>> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> index 9ea864ca5625..be46b3c28b17 100644
>> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> @@ -503,7 +503,7 @@ static int set_ref(struct hantro_ctx *ctx)
>> 		compress_luma_addr = luma_addr + compress_luma_offset;
>> 		compress_chroma_addr = luma_addr + compress_chroma_offset;
>>
>> -		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>> +		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>> 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>>
>> 		/*
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>> index ef0311a16d01..6086cc35e8cc 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>> @@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct cedrus_dev *dev,
>> 		unsigned int index = list[i];
>> 		u8 value = list[i];
>>
>> -		if (dpb[index].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>> +		if (dpb[index].rps == V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>> 			value |= VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
>>
>> 		/* Each SRAM word gathers up to 4 references. */
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index ef63bc205756..f587448ef495 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -127,9 +127,7 @@ struct v4l2_ctrl_hevc_pps {
>> 	__u64	flags;
>> };
>>
>> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
>> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
>> -#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
>> +#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>>
>> #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>>
