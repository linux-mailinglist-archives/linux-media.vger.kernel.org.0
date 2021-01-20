Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63B62FCE99
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 12:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbhATKqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733206AbhATKh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:37:56 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6572EC061757
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 02:37:16 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4AEFF1F455F3
Subject: Re: [PATCH] media: rkisp1: uapi: change hist_bins array type from
 __u16 to __u32
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, heiko@sntech.de
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
 <a8f8d9e9-30b1-b594-a9bc-f4a11924bf56@xs4all.nl>
 <fbe57350-f319-dbc7-f093-d3c1c76feb89@collabora.com>
 <2e48068e-fcc4-9288-a9a6-59f71d7f20ce@xs4all.nl>
 <65be169f-417f-a1f5-53e7-31f701a04d08@collabora.com>
 <41194a0e-e8ef-1acf-82c2-3553e17e5dca@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c474d304-65ee-a768-a3b1-af1045c97b76@collabora.com>
Date:   Wed, 20 Jan 2021 11:37:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <41194a0e-e8ef-1acf-82c2-3553e17e5dca@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 20.01.21 um 10:58 schrieb Hans Verkuil:
> On 19/01/2021 18:47, Dafna Hirschfeld wrote:
>>
>>
>> Am 19.01.21 um 17:32 schrieb Hans Verkuil:
>>> On 19/01/2021 16:32, Dafna Hirschfeld wrote:
>>>>
>>>>
>>>> Am 19.01.21 um 16:00 schrieb Hans Verkuil:
>>>>> On 19/01/2021 15:53, Dafna Hirschfeld wrote:
>>>>>> Each entry in the array is a 20 bits value composed of 16
>>>>>> bits unsigned integer and 4 bits fractional part. So the
>>>>>> type should change to __u32.
>>>>>>
>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>> ---
>>>>>> This patch is applied on top of v6 of the patchset
>>>>>> "Fix the rkisp1 userspace API for later IP versions"
>>>>>>
>>>>>>     include/uapi/linux/rkisp1-config.h | 5 +++--
>>>>>>     1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>>>>>> index 57ca3eea985f..47f6b84d7c56 100644
>>>>>> --- a/include/uapi/linux/rkisp1-config.h
>>>>>> +++ b/include/uapi/linux/rkisp1-config.h
>>>>>> @@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
>>>>>>     /**
>>>>>>      * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>>>>>>      *
>>>>>> - * @hist_bins: measured bin counters
>>>>>> + * @hist_bins: measured bin counters. Each bin is a 20 bits value
>>>>>> + *	       composed of a 16-bit unsigned integer and 4 bits fractional part.
>>>>>
>>>>> So bits 0-3 are the fractional part and bits 4-19 contain the integer part?
>>>>> What goes where should be defined!
>>>>
>>>> Actually I don't know, I just copied the docs in the datasheet.
>>>> I can try figure it out. I can meanwhile send a patch without the doc until
>>>> we are sure. Is that OK?
>>>
>>> No, this should be documented properly.
>>
>> I see that indeed bits 0-3 are the fractional part.
>> The measurements are taken over 25 sub-windows and it is possible to
>> give a weight to each window. If I set all weights to 1 then I expect to get
>> an integer value and indeed in that case I see that the last 4 bits are always 0.
>> If I set the weights to other than 1 I get the last 4 bits not only 0.
>>
>> The UAPI is generally not very good documented mainly because there is currently
>> no open source userspace that uses it.
>>
>>>
>>> Is this the only fractional type that is used in the rkisp1 uapi or are there
>>> others? (Just checking).
>>
>> There are other places as well.
>> I see that there are some values in rkisp1_cif_isp_lsc_config that are fractional
>> and not documented.
>> The two other fractional types in the uapi are already documented.
>>
>> I can add a patch that extends the documentation of all the fields in the uapi using the datasheet.
>> But I think such a patch can be added after de-staging.
> 
> You need to make changes anyway in the uAPI for 5.11 (including fixing the
> bad u8 cast), so let's do this right.
> 
> Regards,
> 
> 	Hans

So just to make sure I understood correctly, in addition to Heiko Stuebner's patchset.
I should a add another patchset that includes:

1. changing the hist_bins type to __u32,
2. removing the u8 cast in rkisp1-stats.c
3. documenting all the fields in the uapi

I don't know what is the policy for fixes among the kernel management,
I am worried that if we are too late or the changes are too big they might reject it.

Also, documenting thoroughly can only be done if there is userspace app or at least unit tests
that test each component since the datasheet lack some details as in this case.

Thanks,
Dafna


> 
>>
>> Thanks,
>> Dafna
>>
>>
>>>
>>>>
>>>>>
>>>>> Looking at rkisp1_stats_get_hst_meas() I see this:
>>>>>
>>>>>            for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>>>>>                    pbuf->params.hist.hist_bins[i] =
>>>>>                            (u8)rkisp1_read(rkisp1,
>>>>>                                            RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>>>>>
>>>>> Here this is cast to a u8, so how does this work?
>>>>
>>>> This seems to be a bug. I see that this cast is introduced in v12 of the patch
>>>> "media: staging: rkisp1: add capture device for statistics".
>>>> This cast does not exist in any of the downstream versions.
>>>
>>> Clearly something that needs to be fixed as well.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>
>>>> Thanks,
>>>> Dafna
>>>>
>>>>>
>>>>> There is something fishy here...
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>>
>>>>>>      *
>>>>>>      * The histogram values divided into 16 bins for V10/V11 and 32 bins
>>>>>>      * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
>>>>>> @@ -909,7 +910,7 @@ struct rkisp1_cif_isp_af_stat {
>>>>>>      * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>>>>>>      */
>>>>>>     struct rkisp1_cif_isp_hist_stat {
>>>>>> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>>>>> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>>>>>     };
>>>>>>     
>>>>>>     /**
>>>>>>
>>>>>
>>>
> 
