Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E318D2FD06E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388993AbhATMi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:38:58 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41467 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731364AbhATLiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:38:00 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2BnPlK0Nzftvz2BnTl9DjU; Wed, 20 Jan 2021 12:37:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611142631; bh=BgXfIZP4VpejNzQx/U7PCPQceu+uPE5cpLgXu6wueyo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kHeyYiaza5cprum9YhmmTlm4ppSGTQxMs6t4lv0jiVbzOZvfEIZ2lgjWPZNWMcJmr
         vmNL2Y/naKL8UySNdYP3zUQLXrlO/V4MV+K835Zt7CrMCGZX5ac2AHmn1mmWfunYe7
         ye0v/o+dHW1FvBvwj9urNIKXkII5xxiHBprLQZCpFcheD8WRWzmtzf8m0oZcfNdQdj
         xXhREsxqog6rusBn9x14oH+u31PB/QTIjc7xxz9ITsFN7ClsUCqE3HRM+XReEC/zNw
         tZr9w/gvDyYME3Mx7BhCWDOGS0MfU2HQsV57uyCnaSVwl5uypjWfENZ/C8JUvKmcLH
         +n/DXH2dFWtZw==
Subject: Re: [PATCH] media: rkisp1: uapi: change hist_bins array type from
 __u16 to __u32
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        heiko@sntech.de
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
 <c474d304-65ee-a768-a3b1-af1045c97b76@collabora.com>
 <290b42e0-12ad-011e-a6db-9eb7a057a7e8@xs4all.nl>
 <b77aed66-6c52-8548-c3c0-ea988c51c7aa@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <21dbf50b-e1df-d658-c7da-88f152c2aa13@xs4all.nl>
Date:   Wed, 20 Jan 2021 12:37:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b77aed66-6c52-8548-c3c0-ea988c51c7aa@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHWkxoAeEgwaDxThKYHcZZFpnQzC681aFzk1CS8wQkG1miWenwjgu/9cyalFD/CwtRdMIBmEJxMYSXJbH2+C7cjJ6W7KTMPZXW0B6R5AFXg3+4mWJ1XA
 I6zkNqLLauZVpg/iQ0/Mdx1fdlg+e2zzjnMl2wP/s31eEk0nSM/IRXxsBHzqDVezSK+hK0PDdncU84/vml4/2aZ3aqbV/YNrONM28PiYDfwe3369Tlo54Pyd
 CFNqS1PdAsqysKhIeeIpHSCf95S8DL8ZbLhQx/mfzxdVi0JxRix0Ow4fl9VZBDBp9Hl4u6XscXgFb9viTojJU78rrE0GUCcOkJEH4d2ecKa2uWNvLjspEQoo
 MkEDwhX8PnBmqMfniVKnW0Qb3ObiQ3j2pXrNY8biYu3H7pDQvyDhAlbWsvFp9+c34wPSu9piOJgXMfAOfp6a977+d9rf5IUlfgIhJ3B0PSjgIU3FkP+5KTQU
 kroh+DIro9jgC3XNETljKKdyYe68dcEHlhD23U3GzC6PuhZQdkSzIYkMjTHSLd5yzcxOHatHCgq+U8Vvuqmf0NBVVnOWHvUeiXDhe8wkEr27RCh+wVIWghmU
 inijW7mDGKfsEKOJIH0v7NhS
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2021 12:32, Dafna Hirschfeld wrote:
> 
> 
> Am 20.01.21 um 11:49 schrieb Hans Verkuil:
>> On 20/01/2021 11:37, Dafna Hirschfeld wrote:
>>>
>>>
>>> Am 20.01.21 um 10:58 schrieb Hans Verkuil:
>>>> On 19/01/2021 18:47, Dafna Hirschfeld wrote:
>>>>>
>>>>>
>>>>> Am 19.01.21 um 17:32 schrieb Hans Verkuil:
>>>>>> On 19/01/2021 16:32, Dafna Hirschfeld wrote:
>>>>>>>
>>>>>>>
>>>>>>> Am 19.01.21 um 16:00 schrieb Hans Verkuil:
>>>>>>>> On 19/01/2021 15:53, Dafna Hirschfeld wrote:
>>>>>>>>> Each entry in the array is a 20 bits value composed of 16
>>>>>>>>> bits unsigned integer and 4 bits fractional part. So the
>>>>>>>>> type should change to __u32.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>>>> ---
>>>>>>>>> This patch is applied on top of v6 of the patchset
>>>>>>>>> "Fix the rkisp1 userspace API for later IP versions"
>>>>>>>>>
>>>>>>>>>      include/uapi/linux/rkisp1-config.h | 5 +++--
>>>>>>>>>      1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>>>>>>>>> index 57ca3eea985f..47f6b84d7c56 100644
>>>>>>>>> --- a/include/uapi/linux/rkisp1-config.h
>>>>>>>>> +++ b/include/uapi/linux/rkisp1-config.h
>>>>>>>>> @@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
>>>>>>>>>      /**
>>>>>>>>>       * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>>>>>>>>>       *
>>>>>>>>> - * @hist_bins: measured bin counters
>>>>>>>>> + * @hist_bins: measured bin counters. Each bin is a 20 bits value
>>>>>>>>> + *	       composed of a 16-bit unsigned integer and 4 bits fractional part.
>>>>>>>>
>>>>>>>> So bits 0-3 are the fractional part and bits 4-19 contain the integer part?
>>>>>>>> What goes where should be defined!
>>>>>>>
>>>>>>> Actually I don't know, I just copied the docs in the datasheet.
>>>>>>> I can try figure it out. I can meanwhile send a patch without the doc until
>>>>>>> we are sure. Is that OK?
>>>>>>
>>>>>> No, this should be documented properly.
>>>>>
>>>>> I see that indeed bits 0-3 are the fractional part.
>>>>> The measurements are taken over 25 sub-windows and it is possible to
>>>>> give a weight to each window. If I set all weights to 1 then I expect to get
>>>>> an integer value and indeed in that case I see that the last 4 bits are always 0.
>>>>> If I set the weights to other than 1 I get the last 4 bits not only 0.
>>>>>
>>>>> The UAPI is generally not very good documented mainly because there is currently
>>>>> no open source userspace that uses it.
>>>>>
>>>>>>
>>>>>> Is this the only fractional type that is used in the rkisp1 uapi or are there
>>>>>> others? (Just checking).
>>>>>
>>>>> There are other places as well.
>>>>> I see that there are some values in rkisp1_cif_isp_lsc_config that are fractional
>>>>> and not documented.
>>>>> The two other fractional types in the uapi are already documented.
>>>>>
>>>>> I can add a patch that extends the documentation of all the fields in the uapi using the datasheet.
>>>>> But I think such a patch can be added after de-staging.
>>>>
>>>> You need to make changes anyway in the uAPI for 5.11 (including fixing the
>>>> bad u8 cast), so let's do this right.
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>
>>> So just to make sure I understood correctly, in addition to Heiko Stuebner's patchset.
>>> I should a add another patchset that includes:
>>>
>>> 1. changing the hist_bins type to __u32,
>>> 2. removing the u8 cast in rkisp1-stats.c
>>> 3. documenting all the fields in the uapi
>>
>> Well, documenting the fractional types at least. Or are you talking about other
>> fields as well?
>>
>>>
>>> I don't know what is the policy for fixes among the kernel management,
>>> I am worried that if we are too late or the changes are too big they might reject it.
>>
>> rc4 was released last weekend, so if it is possible to post these fixes today/tomorrow
>> then there is enough time. I'd like to post a PR for these and other fixes ideally no
>> later than Friday.
>>
>> The documentation patch can slip to 5.12 if really necessary, but I would prefer
>> to have that as part of the 5.11 fixes as well.
>>
>>>
>>> Also, documenting thoroughly can only be done if there is userspace app or at least unit tests
>>> that test each component since the datasheet lack some details as in this case.
>>
>> Do what you can. If some things need more time, then it is OK to postpone that
>> part to 5.12.
>>
>> Regards,
>>
>> 	Hans
> 
> Hi, so there is one issue in Heiko's patch, in 2/4 which changes the array size to 25,
> the code in rkisp1-params.c should also change to iterate it only 25 times.
> I talked to Heiko, and we said that I'll send a v7 of his patchset that includes in addition
> to his patches my patches and also that fix to patch 2/4.
> Is that fine or should we keep it in two separated patches?

That's fine. Easier, actually.

Regards,

	Hans

> 
> Thanks,
> Dafna
> 
>>

