Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D0B76156
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 10:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfGZIxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 04:53:12 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:32939 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbfGZIxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 04:53:12 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qvyLhIjHNAffAqvyPhWtmG; Fri, 26 Jul 2019 10:53:09 +0200
Subject: Re: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
 <20190703122849.6316-2-boris.brezillon@collabora.com>
 <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
 <20190705191618.3467c417@collabora.com>
 <20190725084228.2306171e@collabora.com> <20190725193616.GD14499@aptenodytes>
 <75b515e22494690ab467dd769c4d5902af414c7a.camel@collabora.com>
 <20190726082828.0844011d@collabora.com>
 <20190726093028.3a94bda0@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9b186171-3c1f-d979-c070-ef0c5c0786ac@xs4all.nl>
Date:   Fri, 26 Jul 2019 10:53:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190726093028.3a94bda0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAJFi1xOPh94nuVSbDmevKJMYn/vYhQUEnpcZPNZ6dCLq0a9R1/1Nr03D2kpHJdWyjT0ZN19qeG2jZG1GkKcSwCC6gY2Z0cZ1o4Ukm+lssrV4jDlrYAG
 8AZ+keZbKHO3aFH069hZr8wFGiJ7cHdlK3NeeFIdz7rVdIjyV7+HirbaRC37JT9ykOI7zlWwY4xS+Zp9s0Bak+SlRcGGaF5qaZnrpEwRobjBat5GfzwzD0s4
 hO3oOTw33g6imvTQ8VYhcccuBG3mxM5dAWMgrMYYW3ISnga6YnSz1azRd9/u6BhYXO0BPXTTIPRkdkSJKlhPCUPH73Ll1lLUExyTbBJPQnrm7wsGQfervG5Y
 yfUCbICY9EYBNzAZm9HKq0C55bsOqrcDb/JjMs5aGrd5XmsfmiuhROExfXL0/QN8E2I0t6MKPan1Nxob2NGdp8JR0QH0w8JvAzTS14JSg35EuNEZ2dJpJkgi
 soD0xkfVB4Jt4dVLKJKtqrTjRjFlVmSdTCbcOpenZcd4N3O0k+Uf6sTfUvOexQ+R8XjHdHogMuc4NdcXh0yN1evb91GocmEYpvfydA2VsWpxDB508bS2rdTb
 p9qP43pGUWZn4FzZfbKL0BT7wcaCt9vq2pa9Z1DjKtvcka++e1gE+S4dys4bgdzPjm1PB+9vu7Jgmzqr0rQBfXKzj9Jw9Q+5T0x4SAiZvEVqKiGL/Kutw5TM
 f4QxuU8ZRbI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/26/19 9:30 AM, Boris Brezillon wrote:
> On Fri, 26 Jul 2019 08:28:28 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Thu, 25 Jul 2019 23:39:11 -0300
>> Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>
>>> On Thu, 2019-07-25 at 21:36 +0200, Paul Kocialkowski wrote:  
>>>> Hi,
>>>>
>>>> On Thu 25 Jul 19, 08:42, Boris Brezillon wrote:    
>>>>> On Fri, 5 Jul 2019 19:16:18 +0200
>>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>>     
>>>>>> On Fri, 05 Jul 2019 13:40:03 -0300
>>>>>> Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>>>>>     
>>>>>>> Hi Boris, Paul,
>>>>>>>
>>>>>>> On Wed, 2019-07-03 at 14:28 +0200, Boris Brezillon wrote:      
>>>>>>>> Looks like some stateless decoders expect slices to be prefixed with
>>>>>>>> ANNEX B start codes (they most likely do some kind of bitstream parsing
>>>>>>>> and/or need that to delimit slices when doing per frame decoding).
>>>>>>>> Since skipping those start codes for dummy stateless decoders (those
>>>>>>>> expecting all params to be passed through controls) should be pretty
>>>>>>>> easy, let's mandate that all slices be prepended with ANNEX B start
>>>>>>>> codes.
>>>>>>>>
>>>>>>>> If we ever need to support AVC headers, we can add a new menu control
>>>>>>>> to select the type of NAL header to use.
>>>>>>>>
>>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>>>>>>> ---
>>>>>>>> Changes in v3:
>>>>>>>> * Add Paul's R-b
>>>>>>>>
>>>>>>>> Changes in v2:
>>>>>>>> * None
>>>>>>>> ---
>>>>>>>>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 1 +
>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>>> index 7a1947f5be96..3ae1367806cf 100644
>>>>>>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>>> @@ -1726,6 +1726,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>>>>>>      :ref:`h264`, section 7.4.3 "Slice Header Semantics". For further
>>>>>>>>      documentation, refer to the above specification, unless there is
>>>>>>>>      an explicit comment stating otherwise.
>>>>>>>> +    All slices should be prepended with an ANNEX B start code.
>>>>>>>>          
>>>>>>>
>>>>>>> Currently, the H264 slice V4L2_PIX_FMT_H264_SLICE_RAW,
>>>>>>> is specified to _not_ contain the ANNEX B start code.      
>>>>>>
>>>>>> Yep, we should provably rename the format.    
>>>>>
>>>>> Paul, are you okay with this rename?    
>>>>
>>>> Sorry for the very long response time here, I've had a hard time getting back
>>>> into the context of all this.
>>>>     
>>>>> s/V4L2_PIX_FMT_H264_SLICE_RAW/V4L2_PIX_FMT_H264_SLICE/
>>>>>
>>>>> or
>>>>>
>>>>> s/V4L2_PIX_FMT_H264_SLICE_RAW/V4L2_PIX_FMT_H264_SLICE_ANNEXB/    
>>>>
>>>> I'd be in favor of the former (V4L2_PIX_FMT_H264_SLICE) and passing offsets
>>>> to the beinning and after the start code. That would be more flexible, but one
>>>> downside could be decoders that some decoders only take a specific start code.
>>>>
>>>> On the other hand I don't think that having one pixel format for each type of
>>>> start code would be very reasonable, so I'd rather see an offset for now and
>>>> perhaps a menu control later if needed to specify which types of start codes are
>>>> supported.
>>>>     
>>>
>>> If I am reading the spec correctly, Annex B start code is specified to always
>>> be the 3-byte start code: 0x000001.
>>>
>>> The first NAL of a frame may have an additional 0x00, which effectively means
>>> the start code of the first NAL of a frame _can_ be 4-byte 0x00000001,
>>> in addition to the 3-byte 0x000001.  
>>
>> That's not my understanding of the Annex B section (quoting the spec
>> for reference):
>>
>> "
>> The byte stream format consists of a sequence of byte stream NAL unit
>> syntax structures. Each byte stream NAL unit syntax structure contains
>> one start code prefix followed by one nal_unit( NumBytesInNALunit )
>> syntax structure. It may (and under some circumstances, it shall) also
>> contain an additional zero_byte syntax element. It may also contain one
>> or more additional trailing_zero_8bits syntax elements. When it is the
>> first byte stream NAL unit in the bitstream, it may also contain one or
>> more additional leading_zero_8bits syntax elements.
>> "
>>
>> To me, it looks like the start code can always be 0x000001 or
>> 0x00000001. The first NAL can have extra leading 0x00 bytes, not the
>> following ones, *but*, all NALs can have an arbitrary number of
>> trailing 0x00 bytes. I guess stateless decoders unconditionally apply
>> the "skip_leading_0_bytes logic" described in chapter B.1.1 of the spec
>> to deal with these potential trailing 0x00 bytes.
>> Stateful decoders (those parsing Annex B NAL headers) might skip this
>> "skip leading 0x00 bytes" step for NAL > 0, but I suspect they just
>> always skip leading 0x00 bytes because
>> - it's simple enough
>> - they anyway need the logic for the first NAL
>> - that would require extra information about the NAL number which
>>   stateless decoder usually don't have
>>
>>>
>>> In other words, there aren't multiple Annex B type of start codes, and only
>>> two options for the format of the slice: NAL units with or without a start code.  
>>
>> There's also the AVC NAL header, and I'm pretty sure you can't use the
>> "add leading 0x00 bytes" trick to align things as you wish with that
>> one.
>>
>>>
>>> Therefore, I can't see any point in having this offset.  
>>
>> Assuming the Annex B start codes can contain an arbitrary number of
>> leading 0x00 bytes, we can align things according to the codec
>> expectations. But, as I said below, that implies exposing those
>> alignment constraints.
>>
>>>   
>>>>> I'd also to discuss some concerns Ezequiel and I have regarding this
>>>>> change. Some (most?) codec have alignment constraints on the buffer
>>>>> they pass to the HW. For HW that support Annex B parsing, that's no
>>>>> problem because the start of the buffer will be aligned on a page (I'm
>>>>> assuming page alignment should cover 99% of the alignment constraints).
>>>>> But HW that need to skip the start code will have to pass a non-aligned
>>>>> buffer (annex B start code is 3 byte long).
>>>>> Paul looked at the Cedrus driver and thinks it can be handled correctly
>>>>> thanks to the VE_H264_VLD_OFFSET field (which encodes an offset in bit),
>>>>> but I fear this might be a problem on other HW.
>>>>>
>>>>> So, I'm asking again, are we sure we want to handle the raw (no start
>>>>> code) and annex-b cases using the same pixel format? If we do, what's
>>>>> the plan to address those potential alignment constraints? Should
>>>>> we provide a way for userspace to define where the start-code ends so it
>>>>> can align things properly (annex B can be extended with extra 00
>>>>> bytes at the beginning)? If we do that, that means userspace has to
>>>>> know about those alignment constraints, or take something big enough.
>>>>> Another option would be to use a bounce buffer when things are not
>>>>> aligned properly.
>>>>>
>>>>> I'd really like to get feedback on those points before sending a v4.    
>>>>
>>>> Mhh I don't really know what would be best for handling that. Either way, I
>>>> don't see how more pixel formats would really help solve the issue, so I'm still
>>>> in favor of one.
>>>>
>>>> Having a control that specifies an alignment constraint for the slice beginning
>>>> could work (as long as we make it optional, although userspace should be
>>>> required to abide by it when it is present).  
>>
>> By making that, you put the burden on both sides of the stack:
>>
>> - the kernel side will have to deal with the unaligned cases (using a
>>   bounce buffer)
>> - userspace apps/libs that want to avoid an extra copy will have to
>>   check this constraint and align things properly anyway
> 
> I'd like to revise my statement. Ideally, the drivers should take care
> of such mis-alignments or unsupported NAL header types by
> copying/re-formatting the OUTPUT buffer so that existing apps work
> out of the box when the driver is added, which means we'll have to take
> care of that kernel-side anyway. Handling selection of the best
> encoding-mode/NAL-header-type in userspace is useful if one wants to
> improve perfs.

Just my 5 cents:

You very much want to avoid the situation where drivers have to copy or
reformat the OUTPUT buffer. That's asking for problems, not to mention
that it is no longer zero-copy.

> 
>>
>> Plus, the alignment thing won't work for AVC headers, so I think we
>> should actually have a control to select the NAL header type rather
>> than expose some alignment constraints (or have one pix fmt per NAL
>> header type, but you don't seem to like the idea, so I'm trying
>> to find something else :-)).
>>
>> And if we go for this option (control to select the NAL header type),
>> I'm wondering why we're not making that NAL-header type selection
>> mandatory from the start. We don't have to support all NAL headers at
>> first (can be Annex B only), but, by making this control selection
>> non-optional, we'll at least give a decent feedback to userspace
>> (setting NAL header control fails because the selected NAL header type
>> is not supported by the HW) instead of returning an error on the
>> decoding operation (which, depending on how verbose the driver is, can
>> be quite hard to figure out).

This sounds reasonable.

This control should be mandatory, and it should be referred to from
the H264/5 pixelformat definitions (see also https://patchwork.linuxtv.org/patch/57709/).

Regards,

	Hans

>>
>>>>
>>>> I guess it's not such a high price to pay for a unified codec interface :)  
>>
>> If by unified you mean exposing only one pixel format, then yes, it's
>> unified. Doesn't make it easier to deal with from the userspace
>> perspective IMHO.
>>
>> To sum-up, I'm fine keeping one pixel format, but I'm no longer sure
>> not exposing the NAL header type is a good option. We've seen that
>> providing alignment guarantees for HW expecting raw bitstream (without
>> the start code) might become challenging at some point. So I'd opt for
>> making this selection explicit. After all, it's just an extra control
>> to set from userspace, and 2 extra switch-case: one to select the most
>> appropriate NAL header type, and another one to fill the buffer with
>> the appropriate header (if there's one).
> 

