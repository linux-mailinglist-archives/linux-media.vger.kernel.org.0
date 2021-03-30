Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654B234F02F
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 19:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbhC3RxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 13:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhC3RxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 13:53:10 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D834BC061764
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 10:53:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m12so25059520lfq.10
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T24p/FjeEOfpJxEFnvsqKgncar6Q/cnWpzc2vNNuATU=;
        b=Atsu59X8Cu481IKiXAza1uRo031AI0JZ9QslfxVuG4ibtBl54/Jkm0ZIxgUO468puW
         8WYQSKlx/OZ7IUJBhbrxxEkzMqGlwXzQKrsaFy/kGK0nrCqzSqvM6Z0xS6uHKSssZPDj
         vMHRUg4w5rAg7EEOKn0v1gJzDiGRdmm5cNBO25ymD5A3k3Pns/DHa02qIE4XFkfqIuQi
         WlsqtyMjvIM5yRNUQmX+YcX1zOiidCLcMwRrEpPFV+pKATLlIl7ukyztzWCxyKQEafMq
         OD1OsciUQlOwHo6ChaPQCb6C2lh72yWvgXynbgvv3aj9W3Ug6P/2RIO8NjN2N4VK50FL
         a6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T24p/FjeEOfpJxEFnvsqKgncar6Q/cnWpzc2vNNuATU=;
        b=d5h9/mEZchCzVim+ZfP1fVWnd5GJVFeb0g7YwkvpSqUoDCILg0pNurS05zPe1YZTW1
         RSlRqb8QnyJ+GCp2Wpm/dc2OkUh/df13N5Pi7M9dN+XHSBD6IqkHZdcXz2ILqnKwPCqA
         uZwbonfRWvEaQZhILUk32/qP4/qNQzoYq5PbOurq+aQVXk2eN8Cw701NQpBwKm+k2vHZ
         rYZxA6IfRsOuJ1BnIEJoGkXtb9DH/gmYy41k9PNUA8JB4BU47w6ZQ5PIC8uTmZoyR6eC
         jGp3fZrco9QpErLwDIKKjXowfXbmuV1EJbHIw/7Em1kC1jWuXovMEAyzJhpPpYnNNtZx
         +XvQ==
X-Gm-Message-State: AOAM5310s8iSBDt//IrN9gcLQhlzd65TS0ouBGEQe5JJuwVYakaMN1KH
        UGnPrd+u6pr/KHj1c/A47g4L3g==
X-Google-Smtp-Source: ABdhPJz/nJRrx8rUrqMyom26C9ZN/IHPi2n7DxZOrEJm3bwOBf4OP7O/nA7cXaUHyyqEeVVw57Ij2Q==
X-Received: by 2002:a19:f101:: with SMTP id p1mr20402815lfh.597.1617126788170;
        Tue, 30 Mar 2021 10:53:08 -0700 (PDT)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id c37sm2342558lfv.50.2021.03.30.10.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:53:07 -0700 (PDT)
Subject: Re: [RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to
 calculate phypll frequency
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org, bparrot@ti.com,
        mickael.guene@st.com
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-2-andrey.konovalov@linaro.org>
 <YEYqzMEWjtGedMnV@oden.dyn.berto.se>
 <20210323131041.GB3@paasikivi.fi.intel.com>
 <YFnzsVjSoUsOtY/O@oden.dyn.berto.se>
 <YFpcmES87wcY78Xy@pendragon.ideasonboard.com>
 <YFxaVo+xY0PpLGPF@oden.dyn.berto.se>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <10fa55ce-6056-0031-591e-8a76f80d5ef2@linaro.org>
Date:   Tue, 30 Mar 2021 20:53:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFxaVo+xY0PpLGPF@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Laurent, and Sakari,

Thank you for your comments, that's a good discussion!

So it looks like changing V4L2_CID_LINK_FREQ control from an integer menu to
an INT64 one works for everyone.

What is the best way to do this change?
It could be single patch which turns V4L2_CID_LINK_FREQ into an INT64, changes
the v4l2_get_link_freq() helper accordingly, and updates all the drivers
implementing or using V4L2_CID_LINK_FREQ (twenty-something drivers). The
change is simple, but the diff is quite large. Doing it as a set of patches
would break git bisecting, so isn't an option.
Or we could make the INT64 variant of the link frequency control a separate
new control (e.g. V4L2_CID_LINK_FREQ_NEW or V4L2_CID_LINK_FREQ_INT64), switch
V4L2_CID_LINK_FREQ users to the new version one by one, then delete the older
version and rename the new one back to V4L2_CID_LINK_FREQ.

This change might affect the userland, but it looks like this control isn't the
one widely used by the applications. E.g. V4L2_CID_LINK_FREQ definition is
present in libcamera (include/linux/v4l2-controls.h), but is not currently
used.

One more question below.

On 25.03.2021 12:39, Niklas Söderlund wrote:
> Hi Laurent,
> 
> Thanks for the good write-up of the two different uses for this type of
> information, it make the situation more clear for me. I really think
> this series moves in the right direction as the current usage of
> V4L2_CID_PIXEL_RATE is then wrong in the rcar-vin driver. The reason
> being to work around the fact that the V4L2_CID_LINK_FREQ is a menu and
> not an INT64 control.
> 
> I'm looking at the ADV748x driver sources and it seems it too adjusts
> the link frequency bases on the source rate. With this background do you
> think the right move is to turn V4L2_CID_LINK_FREQ into a INT64 and try
> to remove or redefine V4L2_CID_PIXEL_RATE to better describe to more
> complex parameters you outline below?
> 
> On 2021-03-23 23:24:40 +0200, Laurent Pinchart wrote:
>> Hi Niklas,
>>
>> On Tue, Mar 23, 2021 at 02:57:05PM +0100, Niklas Söderlund wrote:
>>> On 2021-03-23 15:10:41 +0200, Sakari Ailus wrote:
>>>> On Mon, Mar 08, 2021 at 02:46:52PM +0100, Niklas Söderlund wrote:
>>>>> On 2021-03-03 21:08:14 +0300, Andrey Konovalov wrote:
>>>>>> To get the link frequency value, or to calculate a parameter depending on
>>>>>> it the receiver driver should use V4L2_CID_LINK_FREQ. If V4L2_CID_LINK_FREQ
>>>>>> control is not implemented in the remote subdevice, the link frequency
>>>>>> can be calculated from V4L2_CID_PIXEL_RATE control value. But the latter
>>>>>> may not give the correct link frequency, and should only be used as the
>>>>>> last resort. v4l2_get_link_freq() does exactly that, so use it instead
>>>>>> of reading V4L2_CID_PIXEL_RATE directly.
>>>>>
>>>>> I like the direction this patch is taking, but I'm a bit concerned about
>>>>> that V4L2_CID_LINK_FREQ is not able to replace V4L2_CID_PIXEL_RATE as it
>>>>> is designed today. Maybe my concern is unfounded and only reflects my
>>>>> own misunderstanding of the API.
>>>>>
>>>>> When I wrote this code I tried to first do it using V4L2_CID_LINK_FREQ
>>>>> but I found no way to be able to express the wide rang of values needed
>>>>> for my use-case given that V4L2_CID_LINK_FREQ is a menu control. I had
>>>>
>>>> I think we could make it alternatively a 64-bit integer control if that
>>>> helps. The helper needs to be adjusted accordingly.
>>>
>>> That would solve my concern.
>>>
>>>>> to use V4L2_CID_PIXEL_RATE as it allowed me to at runtime calculate and
>>>>> report the link speed based on input formats. The Use-cases I need to
>>>>> address are where CSI-2 transmitter themself are a bridge in the video
>>>>> pipeline, for example
>>>>
>>>> Is the actual bus frequency changed based on this?
>>>
>>> Yes
>>>
>>>> Depending on the system where this chip is being used, only certain
>>>> frequencies may be allowed on that bus. It would be most straightforward to
>>>> use only those, but on the other hand, if any frequency can be used and
>>>> that is certain, then I have no objections to allowing that either. We
>>>> simply would make the link-frequencies property optional.

Sakari,

Could you please elaborate a bit more on the last sentence ("make the link-frequencies
property optional")?
How should the CSI-2 receiver get the link frequency value if this optional property
is missing? If the transmitter driver doesn't implement V4L2_CID_LINK_FREQ then it must
guarantee that the link frequency calculated from V4L2_CID_PIXEL_RATE gives the correct
value - something like that?
Should the warning message [1] in the v4l2_get_link_freq() helper be rephrased if
V4L2_CID_LINK_FREQ is optional?

Thanks,
Andrey

[1]
https://git.linuxtv.org/media_tree.git/commit/drivers/media/v4l2-core/v4l2-common.c?id=67012d97df931b1be24efa0cac06f20d5be062eb

>>> The transmitter is a ADV748x and depending on the video input source
>>> (HDMI or CVBS) the output frequency changes. Failing to negotiate this
>>> of course results in the CSI-2 receiver never detecting LP-11.
>>>
>>>>> * Case 1 - HDMI video source
>>>>>
>>>>> HDMI source -> ADV748x (HDMI-to-CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
>>>>>
>>>>> The R-Car CSI-2 receiver needs to know the CSI-2 link frequency and
>>>>> queries the ADV748x using V4L2_CID_PIXEL_RATE. The ADV748x reports the
>>>>> pixel rate based on the HDMI format detected on its sink pad.
>>>>>
>>>>> This could be done using V4L2_CID_LINK_FREQ, but as it's a menu control
>>>>> it becomes rather tricky to populate it with all possible values, but I
>>>>> guess it could be doable?
>>
>> There are, generally speaking, two different uses for this information
>> on the receiver side. We need to configure the DPHY timings that depend
>> on the link frequency, and we need to configure the functional clock of
>> the receiver and downstream IP cores to ensure they have enough
>> bandwidth to absorb all pixels. Those are two fundamentally different
>> issues:
>>
>> - The DPHY timings depend on the link frequency, which is a well-defined
>>    physical concept. We currently compute it from the pixel rate, which
>>    is a more loosely defined concept (see below). Assuming the
>>    V4L2_CID_LINK_FREQ control can be made to report the actual link
>>    frequency (and given that this is the control's purpose, there's no
>>    other option than making it work, otherwise the control would be
>>    entirely pointless), possibly by turning it into an INT64 control,
>>    then that's the right control to use for this purpose.
>>
>> - The functional clock of the video pipeline need to be able to absord
>>    the incoming pixels. If the clock is configurable, it means that it
>>    differs from the CSI-2 receiver clock (derived from the bus), which
>>    normally implies a FIFO between the CSI-2 receiver and the downstream
>>    blocks. The main constraint is that the FIFO shouldn't overflow, which
>>    in practice means that the effective average pixel rate per line on
>>    the input needs to be smaller or equal than on the output. This
>>    however doesn't mean that the input clock needs to be higher than the
>>    output clock, given that not only input and output bus widths can be
>>    different, but horizontal blanking can also be used to perform timing
>>    adjustements. For instance, if the input video stream has 1000 active
>>    and 3000 blanking pixels per line, assuming identical bus widths on
>>    the input and output side of the FIFO, we could have an output clock
>>    frequency equal to half of the input clock frequency, as long as the
>>    FIFO depth is at least 500 pixels. The output side would have a
>>    horizontal blanking of 1000 pixels. The same applies on the
>>    transmitter side, as there's often a FIFO between the pixel source
>>    (the pixel array for a sensor for instance, with a sampling clock
>>    rate) and the CSI-2 transmitter (running at the bus rate). The pixel
>>    rate is thus a much more fuzzy concept, isn't well-defined in V4L2,
>>    and can lead to all kind of interoperability issues. It should only be
>>    used along with blanking information, in order to perform rate
>>    adaptation calculations.
>>
>>>>> * Case 2 - Multiple video streams over a CSI-2 bus (GMSL)
>>>>>
>>>>> Camera 1 -|
>>>>> Camera 2 -|
>>>>> Camera 3 -|---> MAX9286 (GMSL-to CSI-2) ->[CSI-2 bus]-> R-Car CSI-2 receiver
>>>>> Camera 4 -|
>>>>>
>>>>> The MAX9286 has 4 sink pads each connected to an independent camera and
>>>>> a single CSI-2 source pad. When streaming starts the MAX9286 computes
>>>>> the total CSI-2 link speed as V4L2_CID_PIXEL_RATE based on the format on
>>>>> each of it's 4 sink pads.
>>>>>
>>>>> As in case 1 this could be reported by V4L2_CID_LINK_FREQ but I don't
>>>>> see it as feasible to populate the menu control with all possible
>>>>> frequencies before hand.
>>
>> As explained above, the CSI-2 frequency doesn't have to match the pixel
>> rate of the sensor(s). I haven't checked exactly how the MAX9286 handles
>> clock domains, but in general there source rate and the bus rate can be
>> different. That's why the link frequency is often a menu control with a
>> limited set of values (carefully selected by the system designer to
>> accommodate EMC constraints), while the source rate can vary more
>> freely. As long as the link frequency provides enough bandwidth, it
>> doesn't have to be tightly coupled with the pixel rate. For source
>> devices that have a single clock domain, and adjust the link frequency
>> to follow the source rate, then turning the link frequency control into
>> an INT64 would make sense.
>>
>>>>> Hopefully this is all easily solvable and I have only misunderstood how
>>>>> menu controls work. If not I think this needs to be considered as part
>>>>> of this series as otherwise it could leave the CSI-2 bridge drivers
>>>>> without a path forward.
>>>>>
>>>>>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>>>
>>>>> I tested this and it works as expected. Also as expected it prints lots
>>>>> of warnings about the usage of V4L2_CID_PIXEL_RATE :-) Once I understand
>>>>> how I can fix the CSI-2 transmitters used as bridges in the R-Car boards
>>>>> I will be happy to add my tag to this series as well as fix the bridge
>>>>> drivers.
>>>>>
>>>>>> ---
>>>>>>   drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++-----------
>>>>>>   1 file changed, 7 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
>>>>>> index e06cd512aba2..eec8f9dd9060 100644
>>>>>> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
>>>>>> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
>>>>>> @@ -455,29 +455,25 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>>>>>>   			   unsigned int lanes)
>>>>>>   {
>>>>>>   	struct v4l2_subdev *source;
>>>>>> -	struct v4l2_ctrl *ctrl;
>>>>>> -	u64 mbps;
>>>>>> +	s64 mbps;
>>>>>>   
>>>>>>   	if (!priv->remote)
>>>>>>   		return -ENODEV;
>>>>>>   
>>>>>>   	source = priv->remote;
>>>>>>   
>>>>>> -	/* Read the pixel rate control from remote. */
>>>>>> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
>>>>>> -	if (!ctrl) {
>>>>>> -		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
>>>>>> +	/* Read the link frequency from the remote subdev. */
>>>>>> +	mbps = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
>>>>>> +	if (mbps < 0) {
>>>>>> +		dev_err(priv->dev, "failed to get link rate from subdev %s\n",
>>>>>>   			source->name);
>>>>>> -		return -EINVAL;
>>>>>> +		return mbps;
>>>>>>   	}
>>>>>> -
>>>>>>   	/*
>>>>>>   	 * Calculate the phypll in mbps.
>>>>>> -	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
>>>>>>   	 * bps = link_freq * 2
>>>>>>   	 */
>>>>>> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
>>>>>> -	do_div(mbps, lanes * 1000000);
>>>>>> +	do_div(mbps, 1000000 / 2);
>>>>>>   
>>>>>>   	return mbps;
>>>>>>   }
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
> 
