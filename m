Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3071657C859
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbiGUJ6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbiGUJ6k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:58:40 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3615F81B3E;
        Thu, 21 Jul 2022 02:58:36 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L9HiHV007010;
        Thu, 21 Jul 2022 11:58:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=29/4ZRrfybYnLkGYwwzWGuQKLF4VDzGdxbciTLHPEyE=;
 b=1E4xh2Tnt+1zDJTesMsY6HcHKbsu64EWB+LDyvsRpJF1GAlbnerJrN4HZuRjL57qvenV
 rkYqBD2EVoeqIwO8uVvbRD3QmlJwOEfpINK/TeyS7h5Owk5BHZEHzqbSVIxYa2qqV2KB
 jH91OVB0+pAfEGB2TfvoBXuRVfKCLthm3kRzvInbAHOGHjv5hMNrgpuuwjErSVF3toGf
 xEOu7VjNotfELlhgafjceJM+ee9saMrolkiumS9NPUK2QwtKlndHRQqcUWrnYGamPMnt
 kZHv32umcTadyFvCq5yjXFktAC99hVZaEr9/1WsxRUz3Tc7QvBXY8ekKyitllhZ4ZcCy VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hf41rr7s6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jul 2022 11:58:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DC1610002A;
        Thu, 21 Jul 2022 11:58:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D15C21683B;
        Thu, 21 Jul 2022 11:58:22 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 21 Jul
 2022 11:58:22 +0200
Subject: Re: [PATCH v2 4/6] media: uapi: Add mlx7502x header file
To:     Volodymyr Kharuk <vkh@melexis.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        <devicetree@vger.kernel.org>
References: <cover.1657786765.git.vkh@melexis.com>
 <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
 <Ys/wh1wUvQlmpHrg@pendragon.ideasonboard.com>
 <20220715085720.GA2295@vkh-ThinkPad-T490>
 <YtE1EgvDpfLdbWnD@pendragon.ideasonboard.com>
 <20220715150329.GA14041@vkh-ThinkPad-T490>
 <d8868819-9807-f880-db9b-f2631c3ff5d3@foss.st.com>
 <20220720144405.GA45183@melexis.com>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Message-ID: <80c1ad89-1463-7aae-b7ea-c0d8d15f18b0@foss.st.com>
Date:   Thu, 21 Jul 2022 11:58:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220720144405.GA45183@melexis.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_14,2022-07-20_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

On 20/07/2022 16:44, Volodymyr Kharuk wrote:
> Hi Benjamin,
> 
> On Tue, Jul 19, 2022 at 05:20:40PM +0200, Benjamin Mugnier wrote:
>> Hi Volodymyr,
>>
>>
>> On 15/07/2022 17:03, Volodymyr Kharuk wrote:
>>> On Fri, Jul 15, 2022 at 12:36:18PM +0300, Laurent Pinchart wrote:
>>>> Hello,
>>>>
>>>> CC'ing Benjamin Mugnier who I recall expressed an interest in ToF
>>>> sensors (if I recall incorrectly, my apologies).
>>
>> I am indeed very interested. Thank you :)
>>
>>>>
>>>> On Fri, Jul 15, 2022 at 11:57:20AM +0300, Volodymyr Kharuk wrote:
>>>>> On Thu, Jul 14, 2022 at 01:31:35PM +0300, Laurent Pinchart wrote:
>>>>>> On Thu, Jul 14, 2022 at 11:34:46AM +0300, Volodymyr Kharuk wrote:
>>>>>>> Define user controls for mlx7502x driver and update MAINTAINERS
>>>>>>>
>>>>>>> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
>>>>>>> ---
>>>>>>>  MAINTAINERS                   |  7 +++++++
>>>>>>>  include/uapi/linux/mlx7502x.h | 31 +++++++++++++++++++++++++++++++
>>>>>>>  2 files changed, 38 insertions(+)
>>>>>>>  create mode 100644 include/uapi/linux/mlx7502x.h
>>>>>>>
>>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>>> index ef3ec334fae9..1a68d888ee14 100644
>>>>>>> --- a/MAINTAINERS
>>>>>>> +++ b/MAINTAINERS
>>>>>>> @@ -12673,6 +12673,13 @@ S:	Supported
>>>>>>>  W:	http://www.melexis.com
>>>>>>>  F:	drivers/iio/temperature/mlx90632.c
>>>>>>>  
>>>>>>> +MELEXIS MLX7502X DRIVER
>>>>>>> +M:	Volodymyr Kharuk <vkh@melexis.com>
>>>>>>> +L:	linux-media@vger.kernel.org
>>>>>>> +S:	Supported
>>>>>>> +W:	http://www.melexis.com
>>>>>>> +F:	include/uapi/linux/mlx7502x.h
>>>>>>> +
>>>>>>>  MELFAS MIP4 TOUCHSCREEN DRIVER
>>>>>>>  M:	Sangwon Jee <jeesw@melfas.com>
>>>>>>>  S:	Supported
>>>>>>> diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..44386f3d6f5a
>>>>>>> --- /dev/null
>>>>>>> +++ b/include/uapi/linux/mlx7502x.h
>>>>>>> @@ -0,0 +1,31 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>>>>>> +/*
>>>>>>> + * Melexis 7502x ToF cameras driver.
>>>>>>> + *
>>>>>>> + * Copyright (C) 2021 Melexis N.V.
>>>>>>> + *
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef __UAPI_MLX7502X_H_
>>>>>>> +#define __UAPI_MLX7502X_H_
>>>>>>> +
>>>>>>> +#include <linux/v4l2-controls.h>
>>>>>>> +
>>>>>>
>>>>>> These controls should be documented, in
>>>>>> Documentation/userspace-api/media/drivers/.
>>>>>
>>>>> Ok, will do in v3
>>>>>
>>>>>>> +/* number of phases per frame: 1..8 */
>>>>>>> +#define V4L2_CID_MLX7502X_PHASE_NUMBER  (V4L2_CID_USER_MLX7502X_BASE + 0)
>>>>>>> +/* shift of each phase in frame, this is an array of 8 elements, each 16bits */
>>>>>>> +#define V4L2_CID_MLX7502X_PHASE_SEQ	(V4L2_CID_USER_MLX7502X_BASE + 1)
>>>>>>> +/* frequency modulation in MHz */
>>>>>>> +#define V4L2_CID_MLX7502X_FMOD		(V4L2_CID_USER_MLX7502X_BASE + 2)
>>>>>>> +/* time integration of each phase in us */
>>>>>>> +#define V4L2_CID_MLX7502X_TINT		(V4L2_CID_USER_MLX7502X_BASE + 3)
>>>>>>
>>>>>> Are these control very device-specific, or are they concept that apply
>>>>>> in general to ToF sensors ? Same for V4L2_CID_MLX7502X_OUTPUT_MODE.
>>>>>
>>>>> These controls(except V4L2_CID_MLX7502X_OUTPUT_MODE) are general for ToF
>>>>> sensors. Do you think we should standardize them?
>>>>
>>>> I would really really like to see control standardization for ToF
>>>> sensors, yes :-)
>>> Sounds great :)
>>
>> Thanks a lot for your efforts in standardizing these controls. This is pretty close to what I expected :)
>>
>> Sensors may require multiple fmod from the user, and may not be able to deduce them from a single one.
>> Subframes may be acquired for each fmod (composed themselves of acquisitions for each phase), and then generate a frame from these.
>> Here is a quick drawing example with 2 fmod and 2 phases. Hope this makes sense.
>>
>> |-------------------------------------------------------------------------> time
>> |FMOD1 PHASE1|FMOD1 PHASE2|FMOD2 PHASE1|FMOD2 PHASE2|FMOD1 PHASE1|...
>> |         SUBFRAME1       |         SUBFRAME2       |
>> |                       FRAME1                      |
> Just to be clear: one camera trigger generates one frame.
> The number of subframes can be configured via register.

Yes exactly. It's mostly vocabulary differences afaik, but we are on the same 

> One phase generates one image. Do we have the same understanding?

Yes, one frame on the MIPI is one phase. The reconstitution is done later on.
But some sensors tend to put their "start of frame" and "end of frame" markers for the concatenation of subframes (the frame on my drawing), and not for each phase. I'm not really familiar with this yet.
This is used example if you want to plug your sensor in a software stack that can't handle more than a limited number of fps. You trick it into getting one big frame and then slice after. This is afaik the same mechanism as used for high fps cameras. I don't really know how to handle this kind of usage yet.

>>
>> This allows greater ranges.
>> I suggest changing V4L2_CID_MLX7502X_FMOD to an array, if it suits you.
>> I'm curious how are you doing this? Are you using only one fmod or do you compute some others from the first one? Either in the driver or the sensor.
> The mlx7502x supports only one fmod per frame. Instead it is possible to use
> a few phase shifts(V4L2_CID_MLX7502X_PHASE_SEQ) per one frame. Using
> cross-correlation it is possible to calculate the distance from received images.

Alright. In my opinion if we standardize this control we could make it an array from the start to prepare for other sensors using multiple fmod.

>>
>>>>
>>>> Do you know of any public litterature that explains the operating
>>>> principles of ToF sensors ? I don't expect most of the V4L2 developers
>>>> to be familiar with the concept, so something that could bring us up to
>>>> speed on ToF would be useful for the discussion.
>>>
>>> Here what I have:
>>> 1. ToF Basics from Melexis
>>> https://media.melexis.com/-/media/files/documents/application-notes/time-of-flight-basics-application-note-melexis.pdf
>>> 2. ToF Basics from TI
>>> https://www.ti.com/lit/wp/sloa190b/sloa190b.pdf?ts=1657842732275&ref_url=https%253A%252F%252Fwww.google.com%252F
>>> 2. ToF systems from TI
>>> https://www.ti.com/lit/ug/sbau219d/sbau219d.pdf
>>> 4. This more related to ToF algorithms
>>> https://hal.inria.fr/hal-00725654/document
>>>
>>> I hope it helps.
>>>>
>>>>> Note that the control V4L2_CID_MLX7502X_TINT is similar to
>>>>> V4L2_CID_EXPOSURE, but the way it is done in ToF is different. They don't
>>>>> have a shutter. So I gave a separate control name. Is it ok?
>>>>
>>>> Yes, I think that's fine.
>>>>
>>
>> Having only one integration time control is problematic for HDR sensors as they require both a short and long integration time setting.
>> I have the same issue for the vgxy61 camera with V4L2_CID_EXPOSURE and ended up defining 2 custom controls for both short and long exposure, but I understand this is not ideal. Maybe Laurent have an idea on this?
> It is possible to have integration time per phase. For now I just copy tint into all phase registers.

Yes I see little to no use cases for variable integration time per phase. So your control is fine.

For HDR it's kind of special, as every frame is acquired is in fact 2 frames: one in HDR and one in SDR, and they require 2 different integration time.
As I said the problem already exists for camera sensors, so this is fine as is for now :)

>>
>>>>>>> +/* mode could sw(sending i2c packet), hw(pin triggering), and continuous(self triggering) */
>>>>>>> +#define V4L2_CID_MLX7502X_TRIGGER_MODE	(V4L2_CID_USER_MLX7502X_BASE + 4)
>>>>>>> +/* in case sw or hw trigger mode is used */
>>>>>>> +#define V4L2_CID_MLX7502X_TRIGGER	(V4L2_CID_USER_MLX7502X_BASE + 5)
>>>>>>
>>>>>> Trigger control is likely something we need to standardize at the V4L2
>>>>>> level.
>>>>>
>>>>> Ok, then I'll remove these controls for now and I will back with this as
>>>>> a separate patch.
>>>>>
>>>>>>> +/* this is related to the taps in ToF cameras, usually A minus B is the best option */
>>>>>>> +#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 6)
>>>>>>> +/* ToF camers has its own temperature sensor, which can be read out only during streaming */
>>>>>>> +#define V4L2_CID_MLX7502X_TEMPERATURE	(V4L2_CID_USER_MLX7502X_BASE + 7)
>>>>>>
>>>>>> This should probably use the proposed temperature control from
>>>>>> https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
>>>>>
>>>>> Ok, then I'll remove these controls for now.
>>>>>
>>
>> We discussed the standardization of the temperature control with linux-hwmon subsystem team [1].
>> As this happened to be a trickier problem than I thought, I decided to remove the temperature control I initially proposed. You can find the v3 of the vgxy61 without the temperature control [2].
>>
>> So no temperature control for now. I plan on giving it another go after the vgxy61 is accepted, but for now the simpler the better.
>> Of course feel free to do it, I'll gratefully rebase on your work ;)
>>
>> [1] https://lore.kernel.org/linux-media/d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca/
>> [2] https://lore.kernel.org/all/20220512074037.3829926-1-benjamin.mugnier@foss.st.com/
>>
>>>>>>> +
>>>>>>> +#endif /* __UAPI_MLX7502X_H_ */
>>>>
>>>> -- 
>>>> Regards,
>>>>
>>>> Laurent Pinchart
>>>
> 
