Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72207CDFD9
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 16:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbjJRObd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 10:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235206AbjJRObP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 10:31:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A23F59F7;
        Wed, 18 Oct 2023 07:18:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DB5C433CB;
        Wed, 18 Oct 2023 14:17:38 +0000 (UTC)
Message-ID: <6184d840-6969-4d3f-b66e-f5ba53621f9e@xs4all.nl>
Date:   Wed, 18 Oct 2023 16:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 09/11] media: uapi: Add audio rate controls support
Content-Language: en-US, nl
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
        tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
 <a0dfe959-3b32-4d03-9f1b-8f3c1054ecf7@xs4all.nl>
 <CAA+D8AP1a-Vioy2Cr7dZ4wErXpkm7g9Caw-yPKc9jbWpPnN0JQ@mail.gmail.com>
 <0ae6d9e1-bdd9-45ab-9749-8b0cb5c624ff@xs4all.nl>
 <CAA+D8AMa9tpMq08XsUuAtV0DLWbLOwsfYjd30NJ3OBezkTs5YA@mail.gmail.com>
 <CAA+D8AOJ=Akp5AmE4PCy=O=TGYaP3Cn0jLveL-aoqV3tFAVPSg@mail.gmail.com>
 <36360a55-4cb4-4494-aa69-96837ba7750d@xs4all.nl>
 <CAA+D8APMRpWXPy3VHPev5A+g8o6m5Tj4BKivSGk_SZAZsMoBAw@mail.gmail.com>
 <90873bfe-f5c2-44b3-834e-2cea82cb3c48@xs4all.nl>
 <CAA+D8APZVjF-JqHWLdD0bwN_W7rs_gAzHq9PYVvPc9KabeRCxg@mail.gmail.com>
 <28cce9d0-f22c-48b3-8029-78bdaa787839@xs4all.nl>
 <CAA+D8APNYRADpsXn65zpVvP4AP_afVQNmH7S_a28kAnVmz7bZw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8APNYRADpsXn65zpVvP4AP_afVQNmH7S_a28kAnVmz7bZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/10/2023 15:50, Shengjiu Wang wrote:
> On Wed, Oct 18, 2023 at 9:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 18/10/2023 14:52, Shengjiu Wang wrote:
>>> On Wed, Oct 18, 2023 at 3:58 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> On 18/10/2023 09:40, Shengjiu Wang wrote:
>>>>> On Wed, Oct 18, 2023 at 3:31 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>>>
>>>>>> On 18/10/2023 09:23, Shengjiu Wang wrote:
>>>>>>> On Wed, Oct 18, 2023 at 10:27 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Tue, Oct 17, 2023 at 9:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>>>>>>
>>>>>>>>> On 17/10/2023 15:11, Shengjiu Wang wrote:
>>>>>>>>>> On Mon, Oct 16, 2023 at 9:16 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Shengjiu,
>>>>>>>>>>>
>>>>>>>>>>> On 13/10/2023 10:31, Shengjiu Wang wrote:
>>>>>>>>>>>> Fixed point controls are used by the user to configure
>>>>>>>>>>>> the audio sample rate to driver.
>>>>>>>>>>>>
>>>>>>>>>>>> Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
>>>>>>>>>>>> new IDs for ASRC rate control.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>  .../userspace-api/media/v4l/common.rst        |  1 +
>>>>>>>>>>>>  .../media/v4l/ext-ctrls-fixed-point.rst       | 36 +++++++++++++++++++
>>>>>>>>>>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
>>>>>>>>>>>>  .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
>>>>>>>>>>>>  .../media/videodev2.h.rst.exceptions          |  1 +
>>>>>>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
>>>>>>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
>>>>>>>>>>>>  include/media/v4l2-ctrls.h                    |  2 ++
>>>>>>>>>>>>  include/uapi/linux/v4l2-controls.h            | 13 +++++++
>>>>>>>>>>>>  include/uapi/linux/videodev2.h                |  3 ++
>>>>>>>>>>>>  10 files changed, 76 insertions(+)
>>>>>>>>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
>>>>>>>>>>>> index ea0435182e44..35707edffb13 100644
>>>>>>>>>>>> --- a/Documentation/userspace-api/media/v4l/common.rst
>>>>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/common.rst
>>>>>>>>>>>> @@ -52,6 +52,7 @@ applicable to all devices.
>>>>>>>>>>>>      ext-ctrls-fm-rx
>>>>>>>>>>>>      ext-ctrls-detect
>>>>>>>>>>>>      ext-ctrls-colorimetry
>>>>>>>>>>>> +    ext-ctrls-fixed-point
>>>>>>>>>>>
>>>>>>>>>>> Rename this to ext-ctrls-audio-m2m.
>>>>>>>>>>>
>>>>>>>>>>>>      fourcc
>>>>>>>>>>>>      format
>>>>>>>>>>>>      planar-apis
>>>>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
>>>>>>>>>>>> new file mode 100644
>>>>>>>>>>>> index 000000000000..2ef6e250580c
>>>>>>>>>>>> --- /dev/null
>>>>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
>>>>>>>>>>>> @@ -0,0 +1,36 @@
>>>>>>>>>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>>>>>>>>>>>> +
>>>>>>>>>>>> +.. _fixed-point-controls:
>>>>>>>>>>>> +
>>>>>>>>>>>> +***************************
>>>>>>>>>>>> +Fixed Point Control Reference
>>>>>>>>>>>
>>>>>>>>>>> This is for audio controls. "Fixed Point" is just the type, and it doesn't make
>>>>>>>>>>> sense to group fixed point controls. But it does make sense to group the audio
>>>>>>>>>>> controls.
>>>>>>>>>>>
>>>>>>>>>>> V4L2 controls can be grouped into classes. Basically it is a way to put controls
>>>>>>>>>>> into categories, and for each category there is also a control that gives a
>>>>>>>>>>> description of the class (see 2.15.15 in
>>>>>>>>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-controls.html#introduction)
>>>>>>>>>>>
>>>>>>>>>>> If you use e.g. 'v4l2-ctl -l' to list all the controls, then you will see that
>>>>>>>>>>> they are grouped based on what class of control they are.
>>>>>>>>>>>
>>>>>>>>>>> So I think it would be a good idea to create a new control class for M2M audio controls,
>>>>>>>>>>> instead of just adding them to the catch-all 'User Controls' class.
>>>>>>>>>>>
>>>>>>>>>>> Search e.g. for V4L2_CTRL_CLASS_COLORIMETRY and V4L2_CID_COLORIMETRY_CLASS to see how
>>>>>>>>>>> it is done.
>>>>>>>>>>>
>>>>>>>>>>> M2M_AUDIO would probably be a good name for the class.
>>>>>>>>>>>
>>>>>>>>>>>> +***************************
>>>>>>>>>>>> +
>>>>>>>>>>>> +These controls are intended to support an asynchronous sample
>>>>>>>>>>>> +rate converter.
>>>>>>>>>>>
>>>>>>>>>>> Add ' (ASRC).' at the end to indicate the common abbreviation for
>>>>>>>>>>> that.
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>> +.. _v4l2-audio-asrc:
>>>>>>>>>>>> +
>>>>>>>>>>>> +``V4L2_CID_ASRC_SOURCE_RATE``
>>>>>>>>>>>> +    sets the resampler source rate.
>>>>>>>>>>>> +
>>>>>>>>>>>> +``V4L2_CID_ASRC_DEST_RATE``
>>>>>>>>>>>> +    sets the resampler destination rate.
>>>>>>>>>>>
>>>>>>>>>>> Document the unit (Hz) for these two controls.
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>> +.. c:type:: v4l2_ctrl_fixed_point
>>>>>>>>>>>> +
>>>>>>>>>>>> +.. cssclass:: longtable
>>>>>>>>>>>> +
>>>>>>>>>>>> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
>>>>>>>>>>>> +
>>>>>>>>>>>> +.. flat-table:: struct v4l2_ctrl_fixed_point
>>>>>>>>>>>> +    :header-rows:  0
>>>>>>>>>>>> +    :stub-columns: 0
>>>>>>>>>>>> +    :widths:       1 1 2
>>>>>>>>>>>> +
>>>>>>>>>>>> +    * - __u32
>>>>>>>>>>>
>>>>>>>>>>> Hmm, shouldn't this be __s32?
>>>>>>>>>>>
>>>>>>>>>>>> +      - ``integer``
>>>>>>>>>>>> +      - integer part of fixed point value.
>>>>>>>>>>>> +    * - __s32
>>>>>>>>>>>
>>>>>>>>>>> and this __u32?
>>>>>>>>>>>
>>>>>>>>>>> You want to be able to use this generic type as a signed value.
>>>>>>>>>>>
>>>>>>>>>>>> +      - ``fractional``
>>>>>>>>>>>> +      - fractional part of fixed point value, which is Q31.
>>>>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>>>>>>>>>>> index f9f73530a6be..1811dabf5c74 100644
>>>>>>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>>>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>>>>>>>>>>> @@ -295,6 +295,10 @@ still cause this situation.
>>>>>>>>>>>>        - ``p_av1_film_grain``
>>>>>>>>>>>>        - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
>>>>>>>>>>>>          of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
>>>>>>>>>>>> +    * - struct :c:type:`v4l2_ctrl_fixed_point` *
>>>>>>>>>>>> +      - ``p_fixed_point``
>>>>>>>>>>>> +      - A pointer to a struct :c:type:`v4l2_ctrl_fixed_point`. Valid if this control is
>>>>>>>>>>>> +        of type ``V4L2_CTRL_TYPE_FIXED_POINT``.
>>>>>>>>>>>>      * - void *
>>>>>>>>>>>>        - ``ptr``
>>>>>>>>>>>>        - A pointer to a compound type which can be an N-dimensional array
>>>>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>>>>>>>>>>>> index 4d38acafe8e1..9285f4f39eed 100644
>>>>>>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>>>>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>>>>>>>>>>>> @@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
>>>>>>>>>>>>        - n/a
>>>>>>>>>>>>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
>>>>>>>>>>>>          parameters for stateless video decoders.
>>>>>>>>>>>> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
>>>>>>>>>>>> +      - n/a
>>>>>>>>>>>> +      - n/a
>>>>>>>>>>>> +      - n/a
>>>>>>>>>>>> +      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing parameter which has
>>>>>>>>>>>> +        integer part and fractional part, i.e. audio sample rate.
>>>>>>>>>>>> +
>>>>>>>>>>>>
>>>>>>>>>>>>  .. raw:: latex
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>>>>>>>> index e61152bb80d1..2faa5a2015eb 100644
>>>>>>>>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>>>>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>>>>>>>> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
>>>>>>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
>>>>>>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
>>>>>>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
>>>>>>>>>>>> +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
>>>>>>>>>>>>
>>>>>>>>>>>>  # V4L2 capability defines
>>>>>>>>>>>>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
>>>>>>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>>>>>>>>>> index a662fb60f73f..7a616ac91059 100644
>>>>>>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>>>>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>>>>>>>>>>>> @@ -1168,6 +1168,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>>>>>>>>>>>               if (!area->width || !area->height)
>>>>>>>>>>>>                       return -EINVAL;
>>>>>>>>>>>>               break;
>>>>>>>>>>>> +     case V4L2_CTRL_TYPE_FIXED_POINT:
>>>>>>>>>>>> +             break;
>>>>>>>>>>>
>>>>>>>>>>> Hmm, this would need this patch 'v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL':
>>>>>>>>>>>
>>>>>>>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20231010022136.1504015-7-yunkec@google.com/
>>>>>>>>>>>
>>>>>>>>>>> since min and max values are perfectly fine for a fixed point value.
>>>>>>>>>>>
>>>>>>>>>>> Even a step value (currently not supported in that patch) would make sense.
>>>>>>>>>>>
>>>>>>>>>>> But I wonder if we couldn't simplify this: instead of creating a v4l2_ctrl_fixed_point,
>>>>>>>>>>> why not represent the fixed point value as a Q31.32. Then the standard
>>>>>>>>>>> minimum/maximum/step values can be used, and it acts like a regular V4L2_TYPE_INTEGER64.
>>>>>>>>>>>
>>>>>>>>>>> Except that both userspace and drivers need to multiply it with 2^-32 to get the actual
>>>>>>>>>>> value.
>>>>>>>>>>>
>>>>>>>>>>> So in enum v4l2_ctrl_type add:
>>>>>>>>>>>
>>>>>>>>>>>         V4L2_CTRL_TYPE_FIXED_POINT = 10,
>>>>>>>>>>>
>>>>>>>>>>> (10, because it is no longer a compound type).
>>>>>>>>>>
>>>>>>>>>> Seems we don't need V4L2_CTRL_TYPE_FIXED_POINT, just use V4L2_TYPE_INTEGER64?
>>>>>>>>>>
>>>>>>>>>> The reason I use the 'integer' and 'fractional' is that I want
>>>>>>>>>> 'integer' to be the normal sample
>>>>>>>>>> rate, for example 48kHz.  The 'fractional' is the difference with
>>>>>>>>>> normal sample rate.
>>>>>>>>>>
>>>>>>>>>> For example, the rate = 47998.12345.  so integer = 48000,  fractional= -1.87655.
>>>>>>>>>>
>>>>>>>>>> So if we use s64 for rate, then in driver need to convert the rate to
>>>>>>>>>> the closed normal
>>>>>>>>>> sample rate + fractional.
>>>>>>>>>
>>>>>>>>> That wasn't what the documentation said :-)
>>>>>>>>>
>>>>>>>>> So this is really two controls: one for the 'normal sample rate' (whatever 'normal'
>>>>>>>>> means in this context) and the offset to the actual sample rate.
>>>>>>>>>
>>>>>>>>> Presumably the 'normal' sample rate is set once, while the offset changes
>>>>>>>>> regularly.
>>>>>>>>>
>>>>>>>>> But why do you need the 'normal' sample rate? With audio resampling I assume
>>>>>>>>> you resample from one rate to another, so why do you need a third 'normal'
>>>>>>>>> rate?
>>>>>>>>>
>>>>>>>>
>>>>>>>> 'Normal' rate is used to select the prefilter table.
>>>>>>>>
>>>>>>>
>>>>>>> Currently I think we may define
>>>>>>> V4L2_CID_M2M_AUDIO_SOURCE_RATE
>>>>>>> V4L2_CID_M2M_AUDIO_DEST_RATE
>>>>>>
>>>>>> That makes sense.
>>>>>>
>>>>>>> V4L2_CID_M2M_AUDIO_ASRC_RATIO_MOD
>>>>>>
>>>>>> OK, can you document this control? Just write it down in the reply, I just want
>>>>>> to understand how the integer value you set here is used.
>>>>>>
>>>>>
>>>>> It is Q31 value.   It is equal to:
>>>>> in_rate_new / out_rate_new -  in_rate_old / out_rate_old
>>>>
>>>> So that's not an integer. Also, Q31 is limited to -1...1, and I think
>>>> that's too limiting.
>>>>
>>>> For this having a Q31.32 fixed point type still makes a lot of sense.
>>>>
>>>> I still feel this is a overly complicated API.
>>>>
>>>> See more below...
>>>>
>>>>>
>>>>> Best regards
>>>>> Wang shengjiu
>>>>>
>>>>>> Regards,
>>>>>>
>>>>>>         Hans
>>>>>>
>>>>>>>
>>>>>>> All of them can be V4L2_CTRL_TYPE_INTEGER.
>>>>>>>
>>>>>>> RATIO_MOD was defined in the very beginning version.
>>>>>>> I think it is better to let users calculate this value.
>>>>>>>
>>>>>>> The reason is:
>>>>>>> if we define the offset for source rate and dest rate in
>>>>>>> driver separately,  when offset of source rate is set,
>>>>>>> driver don't know if it needs to wait or not the dest rate
>>>>>>> offset,  then go to calculate the ratio_mod.
>>>>
>>>> Ah, in order to update the ratio mod userspace needs to set both source and
>>>> dest rate at the same time to avoid race conditions.
>>>>
>>>> That is perfectly possible in the V4L2 control framework. See:
>>>>
>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-controls.html#control-clusters
>>>>
>>>> In practice, isn't it likely that you would fix either the source or
>>>> destination rate, and let the other rate fluctuate? It kind of feels weird
>>>> to me that both source AND destination rates can fluctuate over time.
>>>>
>>> Right, the source and dest rates needn't change in same time.
>>>
>>>> In any case, with a control cluster it doesn't really matter, you can set
>>>> one rate or both rates, and it will be handled atomically.
>>>>
>>>> I feel that the RATIO_MOD control is too hardware specific. This is something
>>>> that should be hidden in the driver.
>>>>
>>>
>>> I will use:
>>>
>>> V4L2_CID_M2M_AUDIO_SOURCE_RATE
>>> V4L2_CID_M2M_AUDIO_DEST_RATE
>>> V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET
>>> V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET
>>>
>>> 'OFFSET' is V4L2_CTRL_TYPE_FIXED_POINT, which is Q31.32.
>>
>> So now I come back to my original question: why do you need both
>> the rate and the offset? Isn't it enough to set just the rates,
>> as long as that is in fixed point format?
>>
>> Why does the driver need both the 'ideal' rate + the offset?
>>
>> I'm not opposed to this, I'm just trying to understand whether this
>> makes sense.
>>
>> Can't you take e.g. the source and dest rate as starting points
>> when you start streaming? And every time userspace updates one or both
>> of these rates you calculate the ratio_mod compared to the previous rates?
>>
>> Or is there a reason why you need the ideal rates as well? E.g. 48000 or
>> 44100, etc.
>>
> 
> ideal rates is used to select prefilter table. the prefilter table is indexed by
> ideal rates.
> 
> The asrc has two part: prefilter and resampler filter.  The convert ratio is
> applied to rasampler filter part.

Ah! But doesn't this also imply that there are only a limited number of supported
ideal rates? I see the supported_asrc_rate array in sound/soc/fsl/fsl_asrc.c, which
I suspect is in fact that list?

That means that the SOURCE/DEST_RATE controls aren't integers, but instead should
be of type V4L2_CTRL_TYPE_INTEGER_MENU.

How flexible is the resampler? E.g. I see that 12 and 16 kHz are supported, so can I
select 12 kHz as the ideal rate, and an offset of 2000 Hz to convert from 14 kHz to
something else? Or is it much more limited?

I ask, because if it is really flexible, then it is easy to just select 14 kHz and let
the driver find the closest ideal rate.

If, however, it only can support a small range around each ideal rate (e.g. 11900-12100
Hz around the 12000 Hz ideal rate), then userspace needs to know those ideal rates,
and that needs to be exposed through an INTEGER_MENU control.

Regards,

	Hans
