Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D5E6CBCB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 11:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389490AbfGRJWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 05:22:09 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35567 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbfGRJWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 05:22:09 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o2byh2AF60SBqo2c1hdPAD; Thu, 18 Jul 2019 11:22:06 +0200
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
 <CAMO6nawAyxV=kK5PWOM2658DQqyoPZGYaSGbwfn6ReiDbOW1DQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6450d9d6-70bf-6a8d-5f73-e4fe57557539@xs4all.nl>
Date:   Thu, 18 Jul 2019 11:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMO6nawAyxV=kK5PWOM2658DQqyoPZGYaSGbwfn6ReiDbOW1DQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPnaP6BwAChEqqBeC69oW8IDfOfLK4YsMJG60DMjcHt/81IIDgaP3Z2ag2G81Ait2+nKjwjRTfx/aXBORShIltue9fRBIBacLmOlAnKYaqatF1YZN2xF
 1z1EUqlPgmPdjwZHNa9kueMC+/eVX6jA+FnIA2lvZs3eQeicjZyXW4papmtLuogQRRaZnd6zdugWt99ye1cWztGOem3P8obBv9sVUGXzPO8Oq8V1YxwZmlg/
 2/Bzt9DtJpt3496NUCIZqOjFEZIibzb8tWzZLe0HMNs5NC4suBTk68/bOcvBYbRodkT/amfr2GkDdva9sSZhx8yYIDSX0bwgvSr14IPcGGZP1NfUNKO36Nvk
 9eU3XJfeEZ3yW4JPC2rABXGljN7BGM71RTghYQlLiX24Z1gmQmRjcNXSWdux3hVL6y4HT7PsHf3+wghgv0EYNyFdVZvYX8lB4QPQPLB5246dGyWftsEuOTor
 nqXefZLTRiYTzAIvYc9I07Mmraf6RAX7WWt3p7Tpvuw69IFcgyZMjzOt5crvG/02HQwQ2fdOz+yg+NsOOuH8mq4ANACxVI4C7uMb5xVqgSiIHKIfW7tpV71D
 YIA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/18/19 10:39 AM, Maxime Jourdan wrote:
> On Mon, Jul 15, 2019 at 2:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
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
>>
>> In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
>> to it. Question: do we want to flag this with the format as well? I.e. with a
>> V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
>> event (and documenting this) is sufficient.
>>
> 
> I think that not implementing SOURCE_CHANGE is sufficient as well. The
> issue (in my case), is that the amlogic decoder _does_ support the
> event (case 3) for anything recent (H264, HEVC, VP9), but not for e.g
> MPEG 1/2 (case 1).
> 
> A possible solution would be to create 2 separate devices, one
> implementing the event, the other not. Do you think this is reasonable
> ? This would discard the need for all the proposed flags, unless there
> are other decoder drivers that fall in case 2.

I don't think it is a good idea to create two device nodes, that's really
confusing. Instead I think we just need a V4L2_FMT_FLAG_MANUAL_RESOLUTION
flag.

BTW, what happens if the application sets the format to e.g. 640x480 but
the MPEG file is a different resolution? Does the decoder fail to produce
anything? Or does it internally parse the resolution from the bitstream
and start decoding it? What if the bitstream resolution is larger than the
resolution set with S_FMT? Does it check for the buffer size?

I just want to make sure it won't write past the end of the buffer.

Regards,

	Hans

> 
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

