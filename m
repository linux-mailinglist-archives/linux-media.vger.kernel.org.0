Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235643929A9
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 10:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235534AbhE0IjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 04:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbhE0IjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 04:39:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E103FC061574
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 01:37:40 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id BB79A1F437FD
Subject: Re: [PATCH] media: hevc: Add sps_max_sub_layers_minus1 to
 v4l2_ctrl_hevc_sps
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     ezequiel@collabora.com,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        John Cox <jc@kynesim.co.uk>
References: <dbco8ghdj1a934s737s9auegilbvafdjpl@4ax.com>
 <63d5b36e-a4e6-0180-e126-a907cfa01977@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <c4eee403-4c7a-2374-37e0-47227661d026@collabora.com>
Date:   Thu, 27 May 2021 10:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <63d5b36e-a4e6-0180-e126-a907cfa01977@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 27/05/2021 à 09:19, Hans Verkuil a écrit :
> Hi Benjamin,
>
> On 30/04/2021 18:48, John Cox wrote:
>> sps_max_sub_layers_minus1 is needed if the driver wishes to determine
>> whether or not a frame might be used for reference.
> How does this patch from John relate to your "Add HANTRO G2/HEVC decoder
> support for IMX8MQ" patch series?

Hantro hardware doesn't use this information but that could help to optimize
the number of reference frames.

>
> Can I apply both this patch and your patch series? Does this patch make
> sense for the HEVC stateless API?

Yes it part of the HEVC specification, that will help to move it out of staging.

Regards,
Benjamin

>
> You have been digging into HEVC, so I hope you can help out.
>
> Regards,
>
> 	Hans
>
>> Signed-off-by: John Cox <jc@kynesim.co.uk>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

>> ---
>> This is useful to the Pi H265 decoder as it allows it to only create
>> and store MV info for frames that need to.
>>
>>   Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 +++
>>   include/media/hevc-ctrls.h                                | 3 +--
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index b0de4e6e7ebd..9a891202abbf 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -2924,6 +2924,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>       * - __u8
>>         - ``chroma_format_idc``
>>         -
>> +    * - __u8
>> +      - ``sps_max_sub_layers_minus1``
>> +      -
>>       * - __u64
>>         - ``flags``
>>         - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index b4cb2ef02f17..b2d296b77653 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -75,8 +75,7 @@ struct v4l2_ctrl_hevc_sps {
>>   	__u8	num_short_term_ref_pic_sets;
>>   	__u8	num_long_term_ref_pics_sps;
>>   	__u8	chroma_format_idc;
>> -
>> -	__u8	padding;
>> +	__u8	sps_max_sub_layers_minus1;
>>   
>>   	__u64	flags;
>>   };
>>
