Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7426224CD3
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 18:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgGRQFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 12:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgGRQFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 12:05:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4686C0619D2
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2020 09:05:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C54A02A0352
Subject: Re: [PATCH v2 3/4] media: staging: rkisp1: rsz: set output format to
 YUV422 if cap format is YUV444
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
 <CAHD77HkjjWMOcX3oLnzdMuzZM-_NSydStnzLLcHEFRenL23d-A@mail.gmail.com>
 <aa52f9f8-d9e9-06b2-22df-bbab2d26b516@collabora.com>
 <20200618174752.GA10831@chromium.org>
 <9ee01443-985d-751c-fff9-fa90337de68d@collabora.com>
 <20200618181220.GC10831@chromium.org>
 <f1660285-f6cb-6157-1e56-2974bc549fef@collabora.com>
 <20200618191857.GC73379@chromium.org>
 <09b87404-b106-f58b-b773-cf4c344648df@collabora.com>
 <20200619120425.GA241696@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <4362c154-c248-b109-638b-2fa244aba8d3@collabora.com>
Date:   Sat, 18 Jul 2020 18:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200619120425.GA241696@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 19.06.20 14:04, Tomasz Figa wrote:
> On Fri, Jun 19, 2020 at 09:30:50AM +0200, Dafna Hirschfeld wrote:
>>
>>
>> On 18.06.20 21:18, Tomasz Figa wrote:
>>> On Thu, Jun 18, 2020 at 08:50:23PM +0200, Dafna Hirschfeld wrote:
>>>>
>>>>
>>>> On 18.06.20 20:12, Tomasz Figa wrote:
>>>>> On Thu, Jun 18, 2020 at 08:00:37PM +0200, Dafna Hirschfeld wrote:
>>>>>>
>>>>>>
>>>>>> On 18.06.20 19:47, Tomasz Figa wrote:
>>>>>>> On Fri, Jun 12, 2020 at 02:45:00PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 27.05.20 01:09, Tomasz Figa wrote:
>>>>>>>>> On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
>>>>>>>>> <dafna.hirschfeld@collabora.com> wrote:
>>>>>>>>>>
>>>>>>>>>> If the capture format is YUV444M then the memory input format
>>>>>>>>>> should be YUV422, so the resizer should not change the default
>>>>>>>>>> hdiv, vdiv in that case.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
>>>>>>>>>>       1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>> index 04a29af8cc92..5f9740ddd558 100644
>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>> @@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>>>>>>>>>               * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
>>>>>>>>>>               * streams should be set according to the pixel format in the capture.
>>>>>>>>>>               * The resizer always gets the input as YUV422. If the capture format
>>>>>>>>>> -        * is RGB then the memory input (the resizer output) should be YUV422
>>>>>>>>>> -        * so we use the hdiv, vdiv of the YUV422 info in this case.
>>>>>>>>>> +        * is RGB or YUV444 then the memory input (the resizer output) should
>>>>>>>>>> +        * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
>>>>>>>>>>               */
>>>>>>>>>> -       if (v4l2_is_format_yuv(cap->pix.info)) {
>>>>>>>>>> +       if (v4l2_is_format_yuv(cap->pix.info) &&
>>>>>>>>>> +           cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
>>>>>>>>>>                      src_c.width = cap->pix.info->hdiv;
>>>>>>>>>>                      src_c.height = cap->pix.info->vdiv;
>>>>>>>>>
>>>>>>>>> As pointed out in another thread, this should have been the original
>>>>>>>>> size divided by the divisor and not just the latter alone.
>>>>>>>>>
>>>>>>>>> It seems a bit suspicious to me that we don't need to upscale the
>>>>>>>>> chroma planes here, because it would mean that the MI itself would be
>>>>>>>>> doing some horizontal pixel doubling. The hardware documentation
>>>>>>>>> doesn't really explain this, though.
>>>>>>>>>
>>>>>>>>> Have you been able to validate that the setting without upscaling
>>>>>>>>> indeed produces correct output?
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>> I investigated it again, without this patch, the frames on mainpath for YUV444 look good: https://imgur.com/a/NtazWhY
>>>>>>>> but there is a problem on selfpath: https://imgur.com/a/vQJPqAn
>>>>>>>>
>>>>>>>> This patch somehow solves the problem on selfpath but ruins the frames on mainpath.
>>>>>>>>
>>>>>>>> I think the bug is actually in another place in the code. The function 'rkisp1_sp_config'
>>>>>>>> sets a constant value RKISP1_MI_CTRL_SP_INPUT_YUV422 as the input format on the RKISP1_CIF_MI_CTRL register.
>>>>>>>> But the value should be set according to the configuration. For some reason the problem arises only
>>>>>>>> when trying to capture yuv444. When I capture yuv420 on the selfpath the frame looks good although the
>>>>>>>> value RKISP1_MI_CTRL_SP_INPUT_YUV422 is set.
>>>>>>>> Setting the the SP_INPUT_* according to the configuration seems to solve the problem.
>>>>>>>
>>>>>>> Looking at the datasheet, SP seems to have some internal format
>>>>>>> conversion capability - one can set SP_OUTPUT_FORMAT and SP_INPUT_FORMAT
>>>>>>> to different YUV subsampling modes or even some RGB formats. MP doesn't
>>>>>>> have this capability - it can only write whatever it receives.
>>>>>>>
>>>>>>> I think this needs to be reflected in the driver, if it isn't yet.
>>>>>>> Depending on the resizer source format, the MP video node must allow
>>>>>>> only formats with matching subsampling mode.
>>>>>>
>>>>>> Hi,
>>>>>> I work on v3 now that does that, it supports several yuv mbus codes on the source pads of the resizers
>>>>>> and then in the link_validation callback of the capture it checks that the subsampling matches.
>>>>>
>>>>> Is it enough? I believe the principle is that within the same entity the
>>>>> state needs to stay consistent, i.e. if the sink pad changes, the source
>>>>> pad or video node must be updated to expose only correct formats,
>>>>> including resetting the current format.
>>>> Yes, but video devices have only a sink pad. Also, the sink pad of
>>>> a video device is not associated with an mbus code. The video format configuration
>>>> is not related to the media controller API.
>>>
>>> The video device interface and the entity it is linked to belong to the
>>> same driver. The V4L2 video device interface requires that the state is
>>> always valid and the implementation of the video device needs to take
>>> into account its links to external entities.
>>
>> But if the pad on the other side of the link is configured after the video device
>> then the state might become invalid.
> 
> The pad on the other side of the link is already outside of the scope.
> Basically, the entity that interfaces with the video node must have
> state consistent with the video node.
> 
> To make sure we're on the same page, let me give some examples below:
> 
> Initial state:
> ISP source pad: YUV 4:2:2
> Resizer sink pad: YUV 4:2:2
> Resizer source pad: YUV 4:2:0
> Video CAPTURE format: NV12
> 
> Scenario 1:
> - Userspace changes ISP source pad to RAW.
> - Userspace starts streaming and link validation fails.
> - Still, the state is consistent between the resizer and the video node.
> 
> Scenario 2:
> - Userspace changes ISP source pad to RAW.
> - Userspace changes Resizer sink pad to RAW.
> - Kernel updates Resizer source pad to RAW.
> - Kernel updates video CAPTURE format to a supported RAW pixelformat.

I think this kernel update should not run, quoting Laurant:
"
In MC-based drivers, kernel drivers should not propagate those values
between subdevs or from subdev to video node. Userspace handles the
propagation.
"


> - All the state is consistent and streaming can start.
> - If the userspace calls ENUM_FMT on video CAPTURE, it only gets RAW
>    pixelformats.

According to the spec: "Drivers shall enumerate all image formats."

I think adding support to V4L2_CAP_IO_MC will be helpful for this driver.
So userspace see which pixel format are supported for each media bus on the resizer.

Thanks,
Dafna

> 
> Scenario 3:
> - Userspace changes Resizer source pad to YUV 4:2:2.
> - Kernel updates video CAPTURE to a supported YUV 4:2:2 pixelformat
>    (e.g. YUYV).
> - All the state is consistent and streaming can start.
> - If the userspace calls ENUM_FMT on video CAPTURE, it only gets YUV
>    4:2:2 pixelformats.
> 
> Scenario 4:
> - Userspace calls ENUM_FMT on video CAPTURE and only gets YUV 4:2:0
>    pixelformats.
> - It's not possible to make the state inconsistent between the resizer
>    and the video node by using V4L2 video ioctls.
> 
> Am I missing something?
> 
> Best regards,
> Tomasz
> 
