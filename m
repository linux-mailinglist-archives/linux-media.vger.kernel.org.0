Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500754A040
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 14:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfFRMIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 08:08:14 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58023 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726518AbfFRMIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 08:08:13 -0400
Received: from [IPv6:2001:983:e9a7:1:adc3:de20:1618:b14b] ([IPv6:2001:983:e9a7:1:adc3:de20:1618:b14b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dCuBh1OZu5qKadCuEhaGzB; Tue, 18 Jun 2019 14:08:10 +0200
Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
To:     Vishal Sagar <vsagar@xilinx.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
 <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
 <023cf8a6-6fbc-6425-8bca-798045d39e02@xs4all.nl>
 <CH2PR02MB608838E59840F73F00534198A7EE0@CH2PR02MB6088.namprd02.prod.outlook.com>
 <740f44cb-24af-72c4-f227-5323efcee8ac@xs4all.nl>
 <CH2PR02MB60883EDB9B3B2AED8A2555CBA7EA0@CH2PR02MB6088.namprd02.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3403eea5-e00e-b813-2db1-1ac6ad71b9ff@xs4all.nl>
Date:   Tue, 18 Jun 2019 14:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CH2PR02MB60883EDB9B3B2AED8A2555CBA7EA0@CH2PR02MB6088.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFiQhkp+msbWq8vdEbUa1pDLUPIrLovtaM6BS1Ltvy71czvNt+4ac0uJ8sPBGc6R0M6fytgDEH/9JKlBjApM5IgD0in0j4S59pfs81yWWLWivf66BBQA
 SRvZXB7emIY4jFoF1N9g87UbHN54Lt9PUy10+Eh+vbD4P642II9Qp9KbvhKBC+gQBw8/9+j6zTcaYKDeQHhlMR9SFqsUMK42Qmn+6dsCF86hTIf3CtV2J5DI
 NOzvlFQQlCtkcRBlUh+BBImXkYzPr+htVGIwWsyVZvJYBbqMtSxsF8tJI8hdThpSdCP+Waaw7Otta/cXS4oXEq350/zIMKGiAUUpJ9LDyxRb61TGzYgeVSXm
 Brav+dxz/NnsjmeEsSLk7Pe7CK5k6uNppVG+sNUauKpMjgr7QmKtU7VwNOacSZMG2inC3yhSB2z758p2e5FjSKyKEgWOWAve90QVlu22lfgRjTuTE7M/gXVK
 RYNvA/5wOzcn9VF6rHQV+zZF8N996sK7p9OqR30UnzvlGGLRPxTvhqyE214caYl/7ZRfNft4XY+13I20jnyiYs09zhrAm/9ppatz76YWflaL6PeKQigmJ+B/
 8RjPf261oWoSnrOm2ERIFK1IXe2ROSZ7FjgwYNiVqBy0H2sjn7MMcY+cKdrr5Mlf496qKjeI6RMAGlDwMD2h5sqJCZA681FApkYwanDuwkDs4tNQGCsU3Agq
 h/e8MXEb6bZuX1bt/6wJ5gTHZhhvwbe/8eYV6jRx8p0OPD2/6IfbM0f3d8WILcK7bJOk9JERkzw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/18/19 1:51 PM, Vishal Sagar wrote:
> Hi Hans,
> 
>> -----Original Message-----
>> From: Hans Verkuil [mailto:hverkuil@xs4all.nl]
>> Sent: Saturday, June 15, 2019 1:25 PM
>> To: Vishal Sagar <vsagar@xilinx.com>
>> Cc: linux-kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; devicetree@vger.kernel.org; Dinesh Kumar
>> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Vishal Sagar
>> <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
>> <mchehab@kernel.org>; Michal Simek <michals@xilinx.com>; Rob Herring
>> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Sakari Ailus
>> <sakari.ailus@linux.intel.com>
>> Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
>> driver
>>
>> On 6/14/19 1:44 PM, Vishal Sagar wrote:
>>> Hi Hans,
>>>
>>> Thanks for reviewing this patch.
>>>
>>>> -----Original Message-----
>>>> From: Hans Verkuil [mailto:hverkuil@xs4all.nl]
>>>> Sent: Wednesday, June 05, 2019 6:28 PM
>>>> To: Vishal Sagar <vishal.sagar@xilinx.com>; Hyun Kwon
>> <hyunk@xilinx.com>;
>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
>>>> Chehab <mchehab@kernel.org>; Michal Simek <michals@xilinx.com>; Rob
>>>> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
>>>> Cc: linux-kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-arm-
>>>> kernel@lists.infradead.org; devicetree@vger.kernel.org; Dinesh Kumar
>>>> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>
>>>> Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
>>>> driver
>>>>
>>>> EXTERNAL EMAIL
>>>>
>>>> On 6/4/19 3:55 PM, Vishal Sagar wrote:
>>>>> The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
>>>>> streams from SDI sources like SDI broadcast equipment like cameras and
>>>>> mixers. This block outputs either native SDI, native video or
>>>>> AXI4-Stream compliant data stream for further processing. Please refer
>>>>> to PG290 for details.
>>>>>
>>>>> The driver is used to configure the IP to add framer, search for
>>>>> specific modes, get the detected mode, stream parameters, errors, etc.
>>>>> It also generates events for video lock/unlock, bridge over/under flow.
>>>>>
>>>>> The driver supports only 10 bpc YUV 422 media bus format. It also
>>>>> decodes the stream parameters based on the ST352 packet embedded in
>> the
>>>>> stream. In case the ST352 packet isn't present in the stream, the core's
>>>>> detected properties are used to set stream properties.
>>>>>
>>>>> The driver currently supports only the AXI4-Stream configuration.
>>>>>
>>>>> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
>>>>> ---
>>>>>  drivers/media/platform/xilinx/Kconfig          |   11 +
>>>>>  drivers/media/platform/xilinx/Makefile         |    1 +
>>>>>  drivers/media/platform/xilinx/xilinx-sdirxss.c | 1846
>>>> ++++++++++++++++++++++++
>>>>>  include/uapi/linux/xilinx-sdirxss.h            |   63 +
>>>>>  include/uapi/linux/xilinx-v4l2-controls.h      |   30 +
>>>>>  include/uapi/linux/xilinx-v4l2-events.h        |    9 +
>>
>> <snip>
>>
>>>> I am concerned about this driver: I see that none of the *_dv_timings
>> callbacks
>>>> are implemented. I would expect to see that for a video receiver. There is
>> also
>>>> no g_input_status implemented.
>>>>
>>>> Take a look at another SDI driver: drivers/media/spi/gs1662.c
>>>>
>>>
>>> I had a look at the gs1662 driver for the dv_timings callbacks. The gs1662
>> driver
>>> requires the timings because it is a SDI Transmitter.
>>>
>>> Here the timings are not required as the IP block generates a AXI4 Stream.
>>> I think it may be required only in case of native / parallel video being
>> outputted
>>> as the output stream needs timing information to be decoded.
>>>
>>> Please feel free to correct my understanding if wrong.
>>>
>>> In the current driver, the input stream properties like width, height, frame
>> rate,
>>> progressive/interlaced  are determined from the ST352 packet payload or
>> from the
>>> properties detected by the core.
>>>
>>> See the xsdirx_get_stream_properties() for details.
>>
>> You're wrong. In xsdirx_get_stream_properties() you set the format
>> information.
>> But you can't just change that: if the video resolution changes, then that means
>> that userspace needs to be informed that it has changed at the source, it has to
>> find and set the new timings, update the formats, possibly reallocate memory
>> for
>> the buffers, update other parts of the video pipeline with the new resolution
>> etc.
>>
>> The one thing you cannot do is just pass on the new resolution and hope that
>> the
>> video pipeline can handle it all.
>>
>> The right sequence of events is:
>>
>> 1) When a change is detected at the source the driver sends the
>> SOURCE_CHANGE
>> event and either stops transmitting to the video pipeline or keeps sending the
>> old resolution (some devices have a freewheeling mode where they can do
>> that).
>>
>> 2) Userspace sees the event, calls QUERY_DV_TIMINGS to find a new timings (if
>> any), usually stops streaming, and calls S_DV_TIMINGS to set the detected
>> timings:
>> at that point the driver can configure the output towards the video pipeline
>> with
>> the new timings. Userspace reallocates buffers and resumes streaming with the
>> new
>> resolution.
>>
> 
> Thanks for the explanation!
> 
> I will remove the extraneous video unlock event and stop the streaming when video lock / unlock interrupt occurs.
> I will also implement the g_input_status() to return V4L2_IN_ST_NO_SYNC | V4L2_IN_ST_NO_SIGNAL in case video is unlocked.
> 
> My assumption is that on SOURCE_CHANGE event, application can stop the pipeline and then 
> call the G_FORMAT and G_FRAME_INTERVAL to get new frame size, type (progressive / interlaced) and frame rate.
> Is this assumption correct? 

No :-)

After SOURCE_CHANGE is received an application calls QUERY_DV_TIMINGS. If that
returns valid timings, then the application calls S_DV_TIMINGS with the
detected timings. The driver will now update the format, frame interval, etc.
according to the new timings. And the application can use that to reconfigure
the video pipeline.

> 
> Is it mandatory to implement QUERY_DV_TIMINGS with SOURCE_CHANGE event?

Yes.

> 
> I also don't see any V4L2 framework supported events for overflow and underflow.
> Is it ok to keep these or should they be removed too? 

under/overflow of what? Internal fifos? You can keep the custom events for that.

Regards,

	Hans

> 
> Regards
> 
> Vishal Sagar
> 
>> Note that G_DV_TIMINGS returns the last configured timings, not the detected
>> timings: only QUERY_DV_TIMINGS does that.
>>
>> In other words: userspace has to retain control of the full pipeline.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>> Some of the controls you add in this driver can likely be dropped. Especially
>>>> those controls that are not specific to the Xilinx implementation but are
>>>> generic for any SDI receiver, should be looked at closely: those are
>>>> candidates for becoming standard controls.
>>>
>>> I don't know how other SDI Receiver devices function.
>>> So I am assuming all these controls are Xilinx specific implementations.
>>>
>>>>
>>>> But the documentation above is simply insufficient for me to tell what is
>>>> SDI specific and what is implementation specific.
>>>>
>>>
>>> I will add more documentation for these controls.
>>>
>>>> Also, I'm no SDI expert, certainly not for the UHD-SDI.
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>
>>> Regards
>>> Vishal Sagar
>>>
> 

