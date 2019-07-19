Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEDDD6E2B0
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 10:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfGSIln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 04:41:43 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43357 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbfGSIlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 04:41:42 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id oOSMhBd4T0SBqoOSPhhkz7; Fri, 19 Jul 2019 10:41:40 +0200
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
 <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
 <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
 <CAAFQd5BekdTTXjO8tS3aVK3=pg_YZYCQieTxcUWByuMqhWL=dg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a82fc60a-f18d-c7d3-299e-b3f68a09eccf@xs4all.nl>
Date:   Fri, 19 Jul 2019 10:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BekdTTXjO8tS3aVK3=pg_YZYCQieTxcUWByuMqhWL=dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH5JePnVydCfV/NI1CvuNEA/RVzM99X6Tg6r1hY+1JMgMh2k1ugZwCr72zU2kQeD6DIZCIIWOyQwkFap6Gv2a6fZRxevepTn+GiMIfL2Lf/fByYhSdwb
 xdIPH/M/H8/NgBLXTXrQUeYqBBJevo7StZighjg8Jv8YbocCjhD01Gp2fFPgFBJX7oSfTU+UxFq/WBMyb3xjpb+8f0+5HPhxtYyIRp+8QQkD6ijMoEVrGfin
 xL9S7z43b0zm0izdL0ZamDm+w9QtXW+GWLOy5/ThszSBNkwq7qgwhuOut8+s2qxjZcr/Ky63UJx5tBeSXrdDpik2Iocs7d5+qjUV2jopiSS44HxCbJKi53YJ
 ftokPvklSModHPeZgqy7GfimfXSQD9RolixCbFmrWm6aqfTwxR4sEZjfg0SMzxd78eoXAR+4kWnw7hHl3uCWQECrW+5CWLfxXQtXV0uE9B8MXWcwfuywi6/N
 20RvLsTfpKWhNodQB1zTGoVSaj7pr0QR63sJvYhnKgonJG6dxtLMHRxIRRvZhyBFMhjZRU33IXMYVO9qyCiZe76fA1XJEVv0+ZzRy7R4JY459I1tL7GVfTAr
 tTQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/19/19 4:45 AM, Tomasz Figa wrote:
> On Mon, Jul 15, 2019 at 9:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 6/11/19 10:13 AM, Hans Verkuil wrote:
>>> On 6/9/19 4:38 PM, Maxime Jourdan wrote:
>>>> Hello,
>>>>
>>>> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
>>>> to tag coded formats for which the device supports dynamic resolution
>>>> switching, via V4L2_EVENT_SOURCE_CHANGE.
>>>> This includes the initial "source change" where the device is able to
>>>> tell userspace about the coded resolution and the DPB size (which
>>>> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
>>>
>>> Shouldn't the initial source change still be there? The amlogic decoder
>>> is capable of determining the resolution of the stream, right? It just
>>> can't handle mid-stream changes.
>>
>> I've been thinking about this a bit more: there are three different HW capabilities:
>>
>> 1) The hardware cannot parse the resolution at all and userspace has to tell it
>> via S_FMT.
>>
>> 2) The hardware can parse the initial resolution, but is not able to handle
>> mid-stream resolution changes.
>>
>> 3) The hardware can parse the initial resolution and all following mid-stream
>> resolution changes.
>>
>> We can consider 2 the default situation.
> 
> Any particular reason for 2 being the default? I'm especially
> wondering about that as most of the drivers actually provide 3.

Various reasons:

1) I prefer to have a flag indicating what IS supported rather than what
   isn't.
2) An application that checks this flag and doesn't see it (i.e. if a
   flag-aware application is used with an older kernel where these flags
   aren't set) will still work, but with possibly reduced functionality.
   If the flag would indicate that something is NOT supported, then they
   would fail when combined with an older kernel and a driver that doesn't
   support dynamic resolution changes.
3) None of the encoders support it, so there too it makes sense to have
   'no dynamic resolution change' as the default. It's nicely symmetrical
   for encoders and decoders.
4) Some formats do not support it, so again, having no dynamic res changes
   as the default makes sense.

Regards,

	Hans

> 
>>
>> In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
>> to it. Question: do we want to flag this with the format as well? I.e. with a
>> V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
>> event (and documenting this) is sufficient.
>>
>> In case of 3 the format sets the V4L2_FMT_FLAG_DYN_RESOLUTION flag.
>>
>> What do you think?
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Regards,
>>>
>>>       Hans
>>>
>>>> This flag is mainly aimed at stateful decoder drivers.
>>>>
>>>> This RFC is motivated by my development on the amlogic video decoder
>>>> driver, which does not support dynamic resolution switching for older
>>>> coded formats (MPEG 1/2, MPEG 4 part II, H263). It does however support
>>>> it for the newer formats (H264, HEVC, VP9).
>>>>
>>>> The specification regarding stateful video decoders should be amended
>>>> to include that, in the absence of this flag for a certain format,
>>>> userspace is expected to extract the coded resolution and allocate
>>>> a sufficient amount of capture buffers on its own.
>>>> I understand that this point may be tricky, since older kernels with
>>>> close-to-spec drivers would not have this flag available, yet would
>>>> fully support dynamic resolution switching.
>>>> However, with the spec not merged in yet, I wanted to have your opinion
>>>> on this late addition.
>>>>
>>>> The RFC patches also adds support for this flag for the 4 following
>>>> stateful decoder drivers:
>>>>  - venus
>>>>  - s5p-mfc
>>>>  - mtk-vcodec
>>>>  - vicodec
>>>>
>>>> Maxime Jourdan (5):
>>>>   media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
>>>>   media: venus: vdec: flag OUTPUT formats with
>>>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>>>   media: s5p_mfc_dec: flag OUTPUT formats with
>>>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>>>   media: mtk-vcodec: flag OUTPUT formats with
>>>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>>>   media: vicodec: flag vdec/stateful OUTPUT formats with
>>>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>>>
>>>>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |  7 +++++++
>>>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++++
>>>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
>>>>  drivers/media/platform/qcom/venus/core.h           |  1 +
>>>>  drivers/media/platform/qcom/venus/vdec.c           | 11 +++++++++++
>>>>  drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>>>>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 13 +++++++++++++
>>>>  drivers/media/platform/vicodec/vicodec-core.c      |  2 ++
>>>>  include/uapi/linux/videodev2.h                     |  5 +++--
>>>>  9 files changed, 43 insertions(+), 2 deletions(-)
>>>>
>>>
>>

