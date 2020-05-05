Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189361C5970
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgEEO1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:27:34 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58671 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729123AbgEEO1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:27:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VyXdjGNuHtKAsVyXgjRttO; Tue, 05 May 2020 16:27:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588688849; bh=ulst+HYegCC8JtHtx1BxaoiVmLjACBwKntFr8PmmUxE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hAEKoI9pXlrx6eBXXWo3i5uV82/BU+hTMI/OqmqdsGHNaM5oW+n48kivNZ+D35bQg
         SdLS8ZPUdzAzKki/NtkiTI0duWZ/peQ9NfZMHx1Em/SmGbyK3eabEKHXLgu1Mu4oXM
         Nx5fNY07XLffVKu42QcvWhGvIlRWOe+7Kfodh3bl1ISfsCxp8bCZLgS+0C2FAHmHy9
         7acxzZKme8S5a3rFPRTY79L+9XENJh85+jUST6LDFKTGvcxTV32fc4rBwAbl3qkdiD
         AiCGiwmfZ70DhDWW0la2HhJkwk7wo6sdwkkE3brje8UnLMc1CUJQvYnKz5fkVrvhcn
         5h93I34Vle+2A==
Subject: Re: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
 <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
 <20200429182739.274ce451@coco.lan>
 <20200429163849.GK5956@pendragon.ideasonboard.com>
 <20200429200140.22a4db22@coco.lan>
 <20200429185033.GN5956@pendragon.ideasonboard.com>
 <20200429200808.GK9190@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1bdd6780-5862-88b2-b2ed-d9ce03388f67@xs4all.nl>
Date:   Tue, 5 May 2020 16:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200429200808.GK9190@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMUEVvKFYOckdzu6OW1QclkopoOKmbi+alP1TJq7afaLbVDsfsSOBTIr2gVoMHxX2FPPyEDmju3FVfEV4gSNGAf2b12eOKM+ECCOyn3g96rnee1wsc9J
 AsEWMDDwLtAi/Vawu3qsIUh1nk6qgfl615uBlqCY2whhzwiNQmBkqXR402gOMd1eViIOGonSFOGtK9HfXfkGDJsFZfF6Jq5PkTPtLnsE3Fn0x87si3zI34CX
 OoZK8mGZxPp1jpq4V+NB7uu1lJS+C3CVTp+Djck2414AWvtI79M/aTlSPYUyaFTozp7i9GvlDzSxuHrvoArV2jpQwQrG1T/T7Xfip2Wsu1SBfyxa6zSi+yV+
 UToYj7Y4KgDfMELtjnmD0gG9kBzbgIjT6jtFj2AqIEtTeju7rl2txcZFBKDV502BnYJ/rSoGzG/rfdqEAzPEP5ue+rlu/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2020 22:08, Sakari Ailus wrote:
> Hi Laurent, Mauro,
> 
> On Wed, Apr 29, 2020 at 09:50:33PM +0300, Laurent Pinchart wrote:
>> Hi Mauro,
>>
>> On Wed, Apr 29, 2020 at 08:01:40PM +0200, Mauro Carvalho Chehab wrote:
>>> Em Wed, 29 Apr 2020 19:38:49 +0300 Laurent Pinchart escreveu:
>>>> On Wed, Apr 29, 2020 at 06:27:39PM +0200, Mauro Carvalho Chehab wrote:
>>>>> Em Fri, 24 Apr 2020 16:43:31 +0300 Laurent Pinchart escreveu:
>>>>>   
>>>>>> The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
>>>>>> node. For MC-centric devices, its behaviour has always been ill-defined,
>>>>>> with drivers implementing one of the following behaviours:
>>>>>
>>>>> ...
>>>>>
>>>>> The patch itself is OK. However, there's a change you did at the
>>>>> documentation that it is unrelated. 
>>>>>
>>>>> See below.
>>>>>   
>>>>>> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>>>>>> index 8ca6ab701e4a..a987debc7654 100644
>>>>>> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>>>>>> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>>>>>> @@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
>>>>>>  formats in preference order, where preferred formats are returned before
>>>>>>  (that is, with lower ``index`` value) less-preferred formats.
>>>>>>  
>>>>>> -.. note::
>>>>>> -   After switching input or output the list of enumerated image
>>>>>> -   formats may be different.  
>>>>>
>>>>> Why are you dropping this note?
>>>>>
>>>>> This basically reverts this changeset:
>>>>>
>>>>>   commit 93828d6438081649e81b8681df9bf6ad5d691650
>>>>>   Author: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>   Date:   Mon Sep 3 09:37:18 2012 -0300
>>>>>
>>>>>     [media] DocBook: make the G/S/TRY_FMT specification more strict
>>>>>     
>>>>>     - S/TRY_FMT should always succeed, unless an invalid type field is passed in.
>>>>>     - TRY_FMT should give the same result as S_FMT, all other things being equal.
>>>>>     - ENUMFMT may return different formats for different inputs or outputs.
>>>>>     This was decided during the 2012 Media Workshop.
>>>>>     
>>>>>     Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>     Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>>>>     Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>     Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
>>>>>     Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
>>>>>
>>>>> As far as I remember, from our 2012 discussions, some drivers may change 
>>>>> the enumerated image formats when some ioctls like VIDIOC_S_INPUT and
>>>>> VIDIOC_S_OUTPUT ioctls are used. I also vaguely remember that 90 and 270
>>>>> degrees rotation would equally affect it.
>>>>>
>>>>> Perhaps, the removal was just some mistake. If so, please re-submit
>>>>> another patch without it.
>>>>>
>>>>> Otherwise, if are there any good reasons for such change, and it won't
>>>>> cause any API regressions, please place it on a separate patch, clearly
>>>>> that.
>>>>>
>>>>> ... Or, maybe you felt that it won't make sense for MC-centric devices.
>>>>> On such case, please improve the note stating it on a way that it would
>>>>> be understandable on both MC-centric and bridge-centrid drivers.  
>>>>
>>>> I'm not dropping the requirement, I'm rewriting it :-) The patch indeed
>>>> removes the above, but adds the following
>>>>
>>>> ----
>>>> If the driver doesn't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
>>>> <device-capabilities>`, applications shall initialize the ``mbus_code`` field
>>>> to zero and drivers shall ignore the value of the field.  Drivers shall
>>>> enumerate all image formats. The enumerated formats may depend on the active
>>>> input or output of the device.
>>>>
>>>> If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`capability
>>>> <device-capabilities>`, applications may initialize the ``mbus_code`` field to
>>>> a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. If the
>>>> ``mbus_code`` field is not zero, drivers shall restrict enumeration to only the
>>>> image formats that can produce (for video output devices) or be produced from
>>>> (for video capture devices) that media bus code.  Regardless of the value of
>>>> the ``mbus_code`` field, the enumerated image formats shall not depend on the
>>>> active configuration of the video device or device pipeline. Enumeration shall
>>>> otherwise operate as previously described.
>>>
>>> Hmm... it took me re-reading this text 4 or 5 times, in order to understand
>>> that you're actually meaning bridge-centric devices here :-)
>>>
>>> Also, you placed two independent and unrelated information at the same
>>> paragraph.
>>>
>>> IMHO, you should let it more clear, like, for example adding a numerated
>>> list, like:
>>>
>>> 1. Bridge-centric devices
>>>
>>>    As such devices don't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
>>>    <device-capabilities>`, applications shall initialize the ``mbus_code`` field
>>>    to zero and drivers shall ignore the value of the field.
>>
>> I could settle for
>>
>>    These devices don't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
>>    <device-capabilities>`. Applications shall initialize the ``mbus_code`` field
>>    to zero and drivers shall ignore the value of the field.
>>
>> and similarly below. It bothers me though, as "bridge" isn't formally
>> defined anywhere in the userspace API documentation. It's more formal to
>> explain the behaviour of individual ioctls based solely on the
>> V4L2_CAP_IO_MC flag, and gather all the explanation of what
>> bridge-centric vs. MC-centric means in a single place, an introductory
> 
> How about "video node centric"? That's what I recall has been used
> previously to differentiate regular V4L2 uAPI drivers from MC-centric
> drivers. Bridge refers to hardware whereas MC-centric is software, just as
> video node centric would be.

I like that. Video node centric vs MC-centric. Although I think we had
this discussion before. We never really managed to come up with
satisfying names for this.

> 
>> section, instead of spreading it through documentation of individual
>> ioctls. V4L2 has more UAPI documentation than most other kernel APIs,
>> but there are lots of places where details are not very clear.
>> Standardizing ioctl documentation on the use of common vocabulary
>> ("may", "shall", ...) and using clearly defined concepts (e.g.
>> V4L2_CAP_IO_MC) instead of losely defined ones (e.g. Bridge-centric
>> devices) that are explained in non-normative sections would increase
>> clarity. I thus prefer the wording in v8.1 of this patch, or possibly
>> with the small extension I've proposed in my previous e-mail.
>>
>> Hans, Sakari, what do you think ?
> 
> My preference is with v8.1 wording, with bridge-centric replaced by video
> node centric. This is because it differentiates between the flag what
> actually defines device behaviour. That's what applications see, they don't
> necessarily know what kind of devices they're working with when they open
> the device node.
> 

You can easily say: 'If the driver doesn't advertise the ``V4L2_CAP_IO_MC``
capability (also known as a 'video node centric' driver)'. That way you
associate the absence of the capability with the type of driver.

I would really like to keep the old text of the note, so replace:

"The enumerated formats may depend on the active input or output of the device."

with:

"After switching to another input or output the list of enumerated formats
 may be different."

I know it says the same, but the original text clearly indicates that it is
the act of switching inputs/outputs that can cause a change of formats.

Just referring to the "active" input/output leaves it to the reader to infer
that the list can change when you select a new active input/output. It's better
(less work for the reader) to be explicit about that.

Regards,

	Hans
