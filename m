Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D8CD9138
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390395AbfJPMnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:43:17 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:32815 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726985AbfJPMnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:43:17 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KidyiHbzfPduvKie2ir0H9; Wed, 16 Oct 2019 14:43:14 +0200
Subject: Re: [PATCH] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20191014141427.30708-1-ribalda@kernel.org>
 <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
 <CAPybu_1xBCVdcHKOwDFoM8wkrXWRSuFO1vUuB6Kp0rD6BREs1Q@mail.gmail.com>
 <0e98973c-96a8-dc2e-295f-225ab3b1eae0@xs4all.nl>
 <CAPybu_1to=P0s491p4pbaZMy+YAG88R5sORsvKQy9gKBL49f_w@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <77204a05-34a5-f6f1-460f-bddaa8f2bb5c@xs4all.nl>
Date:   Wed, 16 Oct 2019 14:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_1to=P0s491p4pbaZMy+YAG88R5sORsvKQy9gKBL49f_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMTdI58S21VqBJGlzRA5QkvX90Dxrir53Rm9prnYFCX84at+LMg5VsJnHeRctj13ky0AJPqdjYHdLjY4iEzRqvE10l/3JpcHiLi7EeeWOqaM+QAt4sxj
 DxF410CIkFCBC8X3hdltE/ESw+4556LbpwybGeLSBmrWnNO/zu5j/sWEdwEkyagrL4A47vVItOfLXp204eDGnZVA+kEgTPPmK87Jt5GChmgqfJ9U/dioBjFv
 TJBlt2v6RkxUN19rJ4A7TXB5iNSIR6VjhqKbC7VeTbW1KBIqIkyQiGOZWZEzY4Gy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/16/19 2:39 PM, Ricardo Ribalda Delgado wrote:
> Hi Hans:
> 
> On Wed, Oct 16, 2019 at 2:32 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 10/16/19 2:20 PM, Ricardo Ribalda Delgado wrote:
>>> Hi Hans
>>>
>>> Not that awkward, the user has to use the brand new
>>> v4l2_ctrl_ptr_create() ;). But if you prefer void * I can make the
>>> change.
>>
>> Well, a struct v4l2_ctrl_config is typically a static const, so you can't use
>> v4l2_ctrl_ptr_create().
>>
>> Hmm, perhaps it is as easy as:
>>
>> static const struct v4l2_area def_area = {
>>         ...
>> };
>>
>> static const struct v4l2_ctrl_config ctrl = {
>>         ...
>>
>>         .p_def.p_area = &def_area,
>>         ...
>> };
>>
>> Can you do a quick compile check that I am not overlooking anything?
>>
>> If this works, then I'll take this patch.
> 
> Testing with gcc 9.2.1
> 
> This works fine, no warning/error:
> 
> static struct v4l2_area unit_size = {
> .width = UNIT_SIZE,
> .height = UNIT_SIZE,
> };
> static struct v4l2_ctrl_config area_ctrl = {
> .type = V4L2_CTRL_TYPE_AREA,
> .flags = V4L2_CTRL_FLAG_READ_ONLY,
> .p_def.p_area = &unit_size,
> };
> 
> but if unit_size is set as CONST:
> static const struct v4l2_area
> 
> Then:
> drivers/qtec/qtec_sony.c: In function ‘qtec_sony_probe’:
> drivers/qtec/qtec_sony.c:3151:19: warning: initialization discards
> ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>  3151 |   .p_def.p_area = &unit_size,
>       |

Hmm. So we need a const void *p_def instead.

Regards,

	Hans

> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Regards
>>>
>>> On Wed, Oct 16, 2019 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>
>>>> On 10/14/19 4:14 PM, Ricardo Ribalda Delgado wrote:
>>>>> This allows setting the default value on compound controls created via
>>>>> v4l2_ctrl_new_custom.
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
>>>>> ---
>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
>>>>>  include/media/v4l2-ctrls.h           | 2 ++
>>>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> index bf50d37ef6c1..12cf38f73f7b 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> @@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>>>>>                       type, min, max,
>>>>>                       is_menu ? cfg->menu_skip_mask : step, def,
>>>>>                       cfg->dims, cfg->elem_size,
>>>>> -                     flags, qmenu, qmenu_int, ptr_null, priv);
>>>>> +                     flags, qmenu, qmenu_int, cfg->p_def, priv);
>>>>>       if (ctrl)
>>>>>               ctrl->is_private = cfg->is_private;
>>>>>       return ctrl;
>>>>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>>>>> index 26205ba3a0a0..2fca5b823961 100644
>>>>> --- a/include/media/v4l2-ctrls.h
>>>>> +++ b/include/media/v4l2-ctrls.h
>>>>> @@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
>>>>>   * @max:     The control's maximum value.
>>>>>   * @step:    The control's step value for non-menu controls.
>>>>>   * @def:     The control's default value.
>>>>> + * @p_def:   The control's default value for compound controls.
>>>>>   * @dims:    The size of each dimension.
>>>>>   * @elem_size:       The size in bytes of the control.
>>>>>   * @flags:   The control's flags.
>>>>> @@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
>>>>>       s64 max;
>>>>>       u64 step;
>>>>>       s64 def;
>>>>> +     union v4l2_ctrl_ptr p_def;
>>>>>       u32 dims[V4L2_CTRL_MAX_DIMS];
>>>>>       u32 elem_size;
>>>>>       u32 flags;
>>>>>
>>>>
>>>> I'm not sure about this. It might be a bit awkward to initialize p_def given that it is a union.
>>>>
>>>> Perhaps a simple void pointer would be easier?
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>

