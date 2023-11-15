Return-Path: <linux-media+bounces-353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766C7EBE65
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 09:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8552813D7
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 08:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB8F4691;
	Wed, 15 Nov 2023 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C7522D
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 08:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C3DC433C8;
	Wed, 15 Nov 2023 08:09:44 +0000 (UTC)
Message-ID: <b35601f7-8bb2-4317-a8f7-6fbf81572943@xs4all.nl>
Date: Wed, 15 Nov 2023 09:09:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, tfiga@chromium.org, m.szyprowski@samsung.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
 <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>
 <20231113104238.GA13981@pendragon.ideasonboard.com>
 <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
 <20231113110754.GB24338@pendragon.ideasonboard.com>
 <3e898664-cbfc-4892-9765-37b66891643b@xs4all.nl>
 <ZVIIc-fi32ZxIi-p@valkosipuli.retiisi.eu>
 <20231113114357.GD24338@pendragon.ideasonboard.com>
 <da6efe14-c00d-4bf4-bf61-dd4ed39c5c60@xs4all.nl>
 <20231113124412.GA18974@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <20231113124412.GA18974@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 13/11/2023 13:44, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Nov 13, 2023 at 01:05:12PM +0100, Hans Verkuil wrote:
>> On 13/11/2023 12:43, Laurent Pinchart wrote:
>>> On Mon, Nov 13, 2023 at 11:28:51AM +0000, Sakari Ailus wrote:
>>>> On Mon, Nov 13, 2023 at 12:24:14PM +0100, Hans Verkuil wrote:
>>>>> On 13/11/2023 12:07, Laurent Pinchart wrote:
>>>>>> On Mon, Nov 13, 2023 at 11:56:49AM +0100, Hans Verkuil wrote:
>>>>>>> On 13/11/2023 11:42, Laurent Pinchart wrote:
>>>>>>>> On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrote:
>>>>>>>>> On 10/11/2023 06:48, Shengjiu Wang wrote:
>>>>>>>>>> Fixed point controls are used by the user to configure
>>>>>>>>>> a fixed point value in 64bits, which Q31.32 format.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>>>>>>>
>>>>>>>>> This patch adds a new control type. This is something that also needs to be
>>>>>>>>> tested by v4l2-compliance, and for that we need to add support for this to
>>>>>>>>> one of the media test-drivers. The best place for that is the vivid driver,
>>>>>>>>> since that has already a bunch of test controls for other control types.
>>>>>>>>>
>>>>>>>>> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
>>>>>>>>>
>>>>>>>>> Can you add a patch adding a fixed point test control to vivid?
>>>>>>>>
>>>>>>>> I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. This seems to
>>>>>>>> relate more to units than control types. We have lots of fixed-point
>>>>>>>> values in controls already, using the 32-bit and 64-bit integer control
>>>>>>>> types. They use various locations for the decimal point, depending on
>>>>>>>> the control. If we want to make this more explicit to users, we should
>>>>>>>> work on adding unit support to the V4L2 controls.
>>>>>>>
>>>>>>> "Fixed Point" is not a unit, it's a type. 'Db', 'Hz' etc. are units.
>>>>>>
>>>>>> It's not a unit, but I think it's related to units. My point is that,
>>>>>> without units support, I don't see why we need a formal definition of
>>>>>> fixed-point types, and why this series couldn't just use
>>>>>> VIVID_CID_INTEGER64. Drivers already interpret VIVID_CID_INTEGER64
>>>>>> values as they see fit.
>>>>>
>>>>> They do? That's new to me. A quick grep for V4L2_CTRL_TYPE_INTEGER64
>>>>> (I assume you meant that rather than VIVID_CID_INTEGER64) shows that it
>>>
>>> Yes, I meant V4L2_CTRL_TYPE_INTEGER64. Too hasty copy & paste :-)
>>>
>>>>> is always interpreted as a 64 bit integer and nothing else. As it should.
>>>
>>> The most common case for control handling in drivers is taking the
>>> integer value and converting it to a register value, using
>>> device-specific encoding of the register value. It can be a fixed-point
>>> format or something else, depending on the device. My point is that
>>> drivers routinely convert a "plain" integer to something else, and that
>>> has never been considered as a cause of concern. I don't see why it
>>> would be different in this series.
>>>
>>>>> And while we do not have support for units (other than the documentation),
>>>>> we do have type support in the form of V4L2_CTRL_TYPE_*.
>>>>>
>>>>>>> A quick "git grep -i "fixed point" Documentation/userspace-api/media/'
>>>>>>> only shows a single driver specific control (dw100.rst).
>>>>>>>
>>>>>>> I'm not aware of other controls in mainline that use fixed point.
>>>>>>
>>>>>> The analog gain control for sensors for instance.
>>>>>
>>>>> Not really. The documentation is super vague:
>>>>>
>>>>> V4L2_CID_ANALOGUE_GAIN (integer)
>>>>>
>>>>> 	Analogue gain is gain affecting all colour components in the pixel matrix. The
>>>>> 	gain operation is performed in the analogue domain before A/D conversion.
>>>>>
>>>>> And the integer is just a range. Internally it might map to some fixed
>>>>> point value, but userspace won't see that, it's hidden in the driver AFAICT.
>>>
>>> It's hidden so well that libcamera has a database of the sensor it
>>> supports, with formulas to map a real gain value to the
>>> V4L2_CID_ANALOGUE_GAIN control. The encoding of the integer value does
>>> matter, and the kernel doesn't expose it. We may or may not consider
>>> that as a shortcoming of the V4L2 control API, but in any case it's the
>>> situation we have today.
>>>
>>>> I wonder if Laurent meant digital gain.
>>>
>>> No, I meant analog. It applies to digital gain too though.
>>>
>>>> Those are often Q numbers. The practice there has been that the default
>>>> value yields gain of 1.
>>>>
>>>> There are probably many other examples in controls where something being
>>>> controlled isn't actually an integer while integer controls are still being
>>>> used for the purpose.
>>>
>>> A good summary of my opinion :-)
>>
>> And that works fine as long as userspace doesn't need to know what the value
>> actually means.
>>
>> That's not the case here. The control is really a fractional Hz value:
>>
>> +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
>> +    Sets the offset from the audio source sample rate, unit is Hz.
>> +    The offset compensates for any clock drift. The actual source audio sample
>> +    rate is the ideal source audio sample rate from
>> +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offset.
> 
> I don't see why this would require a new type, you can use
> V4L2_CTRL_TYPE_INTEGER64, and document the control as containing
> fixed-point values in Q31.32 format.

Why would you want to do this? I can store a double in a long long int,
and just document that the variable is really a double, but why would you?

The cost of adding a FIXED_POINT type is minimal, and having this type
makes it easy to work with fixed point controls (think about proper reporting
and setting of the value in v4l2-ctl and user applications in general that
deal with controls).

If this would add a thousand lines of complex code, then this would be a
consideration, but this is just a few lines.

Just to give an example, if you use 'v4l2-ctl -l' to list a int64 control
and it reports the value 13958643712, would you be able to see that that is
really 3.25 in fixed point format? With the right type it would be printed
like that. Much easier to work work.

Regards,

	Hans

> 
>>>> Instead of this patch, I'd prefer to have a way to express the meaning of
>>>> the control value, be it a Q number or something else, and do that
>>>> independently of the type of the control.
>>
>> Huh? How is that different from the type of the control? You have integers
>> (one type) and fixed point (another type).
>>
>> Or do you want a more general V4L2_CTRL_TYPE_ that specifies the N.M values
>> explicitly?
>>
>> I think the main reason why we use integer controls for gain is that we
>> never had a fixed point control type and you could get away with that in
>> user space for that particular use-case.
>>
>> Based on the V4L2_CID_NOTIFY_GAINS documentation the gain value can typically
>> be calculated as (value / default_value),
> 
> Typically, but not always. Some sensor have an exponential gain model,
> and some have weird gain representation, such as 1/x. That's getting out
> of scope though.
> 
>> but that won't work for a rate offset
>> control as above, or for e.g. CSC matrices for color converters.
>>
>>> Agreed.
>>>
>>>>> In the case of this particular series the control type is really a fixed point
>>>>> value with a documented unit (Hz). It really is not something you want to
>>>>> use type INTEGER64 for.
>>>>>
>>>>>>> Note that V4L2_CTRL_TYPE_FIXED_POINT is a Q31.32 format. By setting
>>>>>>> min/max/step you can easily map that to just about any QN.M format where
>>>>>>> N <= 31 and M <= 32.
>>>>>>>
>>>>>>> In the case of dw100 it is a bit different in that it is quite specialized
>>>>>>> and it had to fit in 16 bits.
> 


