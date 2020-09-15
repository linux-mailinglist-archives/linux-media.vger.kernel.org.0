Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF2A26A0EE
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 10:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgIOIbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 04:31:35 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44307 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgIOIb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 04:31:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id I6Mtk9Z4wTSPzI6MvkSHgM; Tue, 15 Sep 2020 10:31:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600158683; bh=rSgas40G+9xaxKXzMVHGvz2NnsYv6RbDT+3efGuzQSw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Jf8IonSEL0od9Bqt/A2nA03uD0zICa4Ik9JLjnWtx+5fOJdh03wTzDIwTOFbLr7ZR
         vWZclCZ6GhTtTTyVRasNLTATPWmXB175BSMWKybmvL5Sx1o2G2SsLm5KCNER8KlHRT
         xcqWDc9t017eNQYaBuX5dmtJfvbjJvB1fmafZ6FkTJOKmysWGY7s9bYJSQAHbKEhbb
         NIeCAU/F1jwVpn9KbMHE036UcBxlJW6lfmwHImEHnk7+VsPBWDByqvtgBVY0NWOGyR
         6Rx6w89V8Sy1188nPlT8R0D4KXa9Q+yQhEp7KL3XstzcC2OUOAj0dAr0OIaGT3u/Xs
         jKn1/3wJykr5Q==
Subject: Re: [PATCH v3 3/3] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Vishal Sagar <vsagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "joe@perches.com" <joe@perches.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Dinesh Kumar <dineshk@xilinx.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-4-vishal.sagar@xilinx.com>
 <50cc4f4b-e788-c5ad-cd6a-b428b96d5377@xs4all.nl>
 <20200715213315.GF6144@pendragon.ideasonboard.com>
 <BY5PR02MB6867211CA1F22DC01D6A8F15A75D0@BY5PR02MB6867.namprd02.prod.outlook.com>
 <20200819165641.GS6049@pendragon.ideasonboard.com>
 <ae3814b877ea264b0231321d12d946761941e004.camel@ndufresne.ca>
 <f88cc98f-7e0d-cedc-6b27-a7a5fd801ebe@xs4all.nl>
 <20200915023829.GE15543@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bb63280f-5753-c663-003e-004635857682@xs4all.nl>
Date:   Tue, 15 Sep 2020 10:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915023829.GE15543@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJEmgajd7wmwWw+z6p44P71NShC7WPuUfVCGFJfQsDomfKMP2B8BM9fNAyXJIpGyZQtAL/N4n0Ji2ol8infHhLc6gqCVE0IwtqbOqZee5WfWDMaGQhOU
 GGbwkRRFU9BBFkLBK5YivMwwD7fd+NTcAEWad81S28W9afjIDGIwS8qtgBgdbYc2m9HzDTIK9sLjOWXTL05tioKIWhcKrjQMTo9+m3rkLg4JpL8QBwqxmCXg
 NLV2qs15iUezOgG0EqOKZUK83qx3v2TR668Hf2Y1KerrHxuGVUDdD/bI8E+6WqUoFcDheNVV8iNx3ROAjNdLaEH7pmpJFe+AdC92LTC3bFZi96TXiQipaNob
 lNj/mc5wdEYuVWZhJQm8u+ACZS/vLru+rCvFDg0tK5iuDLqik2Kx/I9TwZzuUfxEfWnCTSiQUq56E6vATjqxcxnNE+Se+QMCgM1Di3zfIJ22shjQpOvm3kDe
 gvpeJFlSGvxU43o/tsnf4LrYWvBf05p2XbHnrStl1/3M1YRQv1lHPBaEdLkEmCjsxktOfnyJ+mjf+QG18DmQbUarre08MVkvGfFbm/+5ez38F5IGc8huXGfa
 jUJeJPTR8a3axjTR9obmWMuBFTT3vAbmtHQLCyrX+EGNGV1zZbGd+yAickDwHsgWD/lQyEFtk3ZbC2tQQHTWwhdyqmid2r/8Xfl/jyFq864xMhFpa+8cY9TD
 erxwat+8Po5SiwnghUBI1fYi2stIelE0TXjUdaqo/Em0zjD+yznAgA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2020 04:38, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Sep 10, 2020 at 12:22:28PM +0200, Hans Verkuil wrote:
>> On 26/08/2020 16:10, Nicolas Dufresne wrote:
>>> Le mercredi 19 août 2020 à 19:56 +0300, Laurent Pinchart a écrit :
>>>> Hi Vishal,
>>>>
>>>> (Hans, there's a question for you below)
>>>>
>>>> On Wed, Aug 19, 2020 at 01:47:49PM +0000, Vishal Sagar wrote:
>>>>> On Thursday, July 16, 2020 3:03 AM Laurent Pinchart wrote:
>>>>>> On Thu, Jun 25, 2020 at 11:43:01AM +0200, Hans Verkuil wrote:
>>>>>>> On 18/06/2020 07:33, Vishal Sagar wrote:
>>>>>>>> The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
>>>>>>>> streams from SDI sources like SDI broadcast equipment like cameras and
>>>>>>>> mixers. This block outputs either native SDI, native video or
>>>>>>>> AXI4-Stream compliant data stream for further processing. Please refer
>>>>>>>> to PG290 for details.
>>>>>>>>
>>>>>>>> The driver is used to configure the IP to add framer, search for
>>>>>>>> specific modes, get the detected mode, stream parameters, errors, etc.
>>>>>>>> It also generates events for video lock/unlock, bridge over/under flow.
>>>>>>>>
>>>>>>>> The driver supports 10/12 bpc YUV 422 media bus format currently. It
>>>>>>>> also decodes the stream parameters based on the ST352 packet embedded in the
>>>>>>>> stream. In case the ST352 packet isn't present in the stream, the core's
>>>>>>>> detected properties are used to set stream properties.
>>>>>>>>
>>>>>>>> The driver currently supports only the AXI4-Stream IP configuration.
>>>>>>>>
>>>>>>>> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
>>>>>>>> ---
>>>>>>>> v3
>>>>>>>> - fixed KConfig with better description
>>>>>>>> - removed unnecessary header files
>>>>>>>> - converted uppercase to lowercase for all hex values
>>>>>>>> - merged core struct to state struct
>>>>>>>> - removed most one line functions and replaced with direct reg
>>>>>>>>   read/write or macros
>>>>>>>> - dt property bpp to bpc. default 10. not mandatory.
>>>>>>>> - fixed subscribe events, log_status, s_stream
>>>>>>>> - merged overflow/underflow to one event
>>>>>>>> - moved all controls to xilinx-sdirxss.h
>>>>>>>> - max events from 128 to 8
>>>>>>>> - used FIELD_GET() instead of custom macro
>>>>>>>> - updated the controls documentation
>>>>>>>> - added spinlock
>>>>>>>> - removed 3GB control and added mode to detect bitmask
>>>>>>>> - fixed format for (width, height, colorspace, xfer func, etc)
>>>>>>>> - added dv_timings_cap, s/g_dv_timings
>>>>>>>> - fixed set/get_format
>>>>>>>> - fix v4l control registrations
>>>>>>>> - fix order of registration / deregistration in probe() remove()
>>>>>>>> - fixed other comments from Hyun, Laurent and Hans
>>>>>>>> - things yet to close
>>>>>>>>   - adding source port for connector (Laurent's suggestion)
>>>>>>>>   - adding new FIELD type for Transport Stream V4L2_FIELD_ALTERNATE_PROG (Han's suggestion)
>>>>>>>>   - Update / remove EDH or CRC related controls
>>>>>>>>
>>>>>>>> v2
>>>>>>>> - Added DV timing support based on Hans Verkuilś feedback
>>>>>>>> - More documentation to custom v4l controls and events
>>>>>>>> - Fixed Hyunś comments
>>>>>>>> - Added macro for masking and shifting as per Joe Perches comments
>>>>>>>> - Updated to latest as per Xilinx github repo driver like
>>>>>>>>   adding new DV timings not in mainline yet uptill 03/21/20
>>>>>>>>
>>>>>>>>  drivers/media/platform/xilinx/Kconfig         |   11 +
>>>>>>>>  drivers/media/platform/xilinx/Makefile        |    1 +
>>>>>>>>  .../media/platform/xilinx/xilinx-sdirxss.c    | 2121 +++++++++++++++++
>>>>>>>>  include/uapi/linux/v4l2-controls.h            |    6 +
>>>>>>>>  include/uapi/linux/xilinx-sdirxss.h           |  283 +++
>>>>>>>>  5 files changed, 2422 insertions(+)
>>>>>>>>  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
>>>>>>>>  create mode 100644 include/uapi/linux/xilinx-sdirxss.h
>>>>
>>>> [snip]
>>>>
>>>>>>>> diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/media/platform/xilinx/xilinx-sdirxss.c
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..e39aab7c656a
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
>>>>>>>> @@ -0,0 +1,2121 @@
>>>>
>>>> [snip]
>>>>
>>>>>>>> +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
>>>>>>>> +		ctrl->val = xsdirxss->ts_is_interlaced;
>>>>>>>> +		break;
>>>>>>>
>>>>>>> I assume this control will disappear once you added support for
>>>>>>> FIELD_ALTERNATE_PROG?
>>>>>>
>>>>>> I'm not sure FIELD_ALTERNATE_PROG is a good idea. The v4l2_field
>>>>>> specifies today how frames are split into multiple buffers. There's an
>>>>>> implicit assumption that a frame split into two buffers is captured with
>>>>>> interlacing. In the SDI case, the two concepts get decoupled, a
>>>>>> progressive frame can be transmitted (and captured) in two separate
>>>>>> parts. If we add a *_PROG field, we'll need to duplicate most of the
>>>>>> v4l2_field values with a _PROG suffix, as the progressive frame can be
>>>>>> captured in alternate buffers on a video node, but also in separate odd
>>>>>> and even buffers on two video nodes. Tt the hardware level, data is
>>>>>> transmitted with odd lines on one link, and even lines on a second link.
>>>>>> There are then two instances of this IP core, one for each link. One
>>>>>> instance would receive and process the even lines, the other instance
>>>>>> the odd lines. The output of the two instances can then be connected to
>>>>>> two separate DMA engines, or combined in the FPGA fabric, depending on
>>>>>> how the user designs the system.
>>>>>
>>>>> My apologies to give incorrect info regarding this.
>>>>> In the progressive segmented frame, a progressive captured frame is sent
>>>>> across to receiver over an interlaced transport. The 2 fields received
>>>>> are similar to how V4L2_FIELD_ALTERNATE is except that the fields weren't
>>>>> captured at 2 different times.
>>>>
>>>> I've now read more about progressive segmented frames, and I was indeed
>>>> wrong about the fact that the two segments are transported over
>>>> different links.
>>>>
>>>> I still wonder, however, if a _PROG suffix is the best option. Wouldn't
>>>> we need to also add V4L2_FIELD_TOP_PROG, V4L2_FIELD_BOTTOM_PROG,
>>>> V4L2_FIELD_SEQ_TB_PROG and V4L2_FIELD_SEQ_BT_PROG, not necessarily for
>>>> this driver, but for other devices that would support capturing the
>>>> odd/even segments only, or support capturing both segments in a single
>>>> buffer, one after the other ?
>>>>
>>>> Maybe that's unavoidable, as enum v4l2_field combines both the buffer
>>>> layout and the fact that the frame is interlaced or progressive. If we
>>>> had to redesign it we could do better, but having to keep backward
>>>> compatibility, duplicating most values with a _PROG suffix may be the
>>>> best option.
>>>>
>>>> Hans, any opinion ?
>>
>> I don't believe there is any need to create those other V4L2_FIELD_ variants.
>> With V4L2_FIELD_ALTERNATE_PROG each buffer will be set to V4L2_FIELD_TOP (i.e.
>> odd lines) or V4L2_FIELD_BOTTOM (i.e. even lines).
> 
> What if an application wants to capture TOP or BOTTOM fields only though
> ? The DMA engine would need to be configured with either
> V4L2_FIELD_TOP_PROG or V4L2_FIELD_BOTTOM_PROG, wouldn't it ? Or should
> the _PROG information be reported by this subdev only, and not
> propagated through the pipeline ?

In the highly unlikely case that this is something you would want to support,
then there is no need for V4L2_FIELD_TOP/BOTTOM_PROG since it adds nothing
beyond what V4L2_FIELD_TOP/BOTTOM already do.

If you just capture the top field, then the knowledge that this is the top
field of a progressive vs interlaced frame is of no practical value.

The only reason to have V4L2_FIELD_ALTERNATE_PROG is to indicate that if
you capture both top and bottom fields, then you can just combine them into
a progressive frame and there is no need to do any deinterlacing. But otherwise
it acts exactly the same as V4L2_FIELD_ALTERNATE.

Regards,

	Hans

> 
>> There is nothing else you need here.
>>
>> A V4L2_FIELD_SEQ_TB_PROG might be needed if we get HW that does something
>> so strange.
>>
>>> Can't your receiver store these two fragment directly into a
>>> progressive buffer instead of leaking this HW specific thing into uAPI
>>> ? All you'd need is support for stride (bytesperline) at the HW
>>> writeback level, and then you can hide this complexicuty to userspace
>>> by filling the top/bottom line only. You simply multiply the stride by
>>> two in this context.
>>
>> Vishal, this is a good question from Nicolas.
>>
>> An alternative solution might be to DMA the odd and even lines to the
>> same buffer, but consecutive. I.e., instead of having to create a
>> V4L2_FIELD_ALTERNATE_PROG, you'd create a V4L2_FIELD_SEQ_TB_PROG, which
>> is identical to V4L2_FIELD_SEQ_TB, except that it is for a progressive
>> frame.
>>
>> If you can avoid V4L2_FIELD_ALTERNATE_PROG somehow and just return a
>> single buffer per frame, then that would be much better. One field per
>> buffer is a big pain for userspace.
> 
> That's out of control of this driver though, it depends on the rest of
> the pipeline. The SDI RX subdev produces alternate frames, it's up to
> the rest of the FPGA to decide how to store that in memory.
> 
>>>>> So I will add the V4L2_FIELD_ALTERNATE_PROG in next patch version.
>>>>
>>>> [snip]
> 

