Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7238688F9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 14:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfGOMh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 08:37:29 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47691 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728933AbfGOMh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 08:37:29 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id n0EOhd91P0SBqn0EPhS7Te; Mon, 15 Jul 2019 14:37:26 +0200
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
 <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
Message-ID: <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
Date:   Mon, 15 Jul 2019 14:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKF5t4WkYmi9WsxkoKK90Lt86iAOk3GF4x0iKwvy3SkR9pJcRlyWdp8Uwv6NvJtr7eAvkcChWvJi1CPYYT1wpglz7AER7pZG2HrhstUHGuBQTEip6YaN
 Q5kYFATkEHug7Mv8Za2Sa+fOohx/SMHvywN5tS3nOo10j23V88dPZCJnDJ9Nkrqlps0Lk6iOGmR6chQk6WpE0YlVVWzRNOG/bYhiyEJu5KfoLGOZRmYUOjkT
 ONMkiveVl/DpOw5/P8zcaTW5VL3z3AxvKvrZm4dLBVs1dLes49o7xpUzNZflCKERqIPyZ8NyDpOjzvTw9hopjPL7+gDMajb/AQbiqOH9HW6WW64bJW7YOP9p
 Ddeagrc4uoeUKRSsmbqlJy4KNYS/U+aDAQ27PbiZdCXmfCY2XZx/saFBRD26HKCOODJIjR5GivhH+Q2wVtijRXpZkUnRR1uONRrwm6NkIjDL+5xrbvrSsP+w
 c8IiOxzBdzpx9FU+UKK+ofXhj+Gfsla8JgAELgGKHY/IBddud0/nZNuJ6XEzfuc6cYoLPwNSOWibEI/E58JL0Y0RwuMThuhHS1kJPsH7YD8yHHJTHIvY/Xtk
 qnhQaAgoPa7UxWXpfU1ZX9tx96tWu/98y+YnWEfQviWGnwuq0zcrKYDTp+MNdE6ZHHpgQvr4Hb3K6nUbpLOBWYcoN0H6m6ArxtkxurPkd2Q+7w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 10:13 AM, Hans Verkuil wrote:
> On 6/9/19 4:38 PM, Maxime Jourdan wrote:
>> Hello,
>>
>> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
>> to tag coded formats for which the device supports dynamic resolution
>> switching, via V4L2_EVENT_SOURCE_CHANGE.
>> This includes the initial "source change" where the device is able to
>> tell userspace about the coded resolution and the DPB size (which
>> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
> 
> Shouldn't the initial source change still be there? The amlogic decoder
> is capable of determining the resolution of the stream, right? It just
> can't handle mid-stream changes.

I've been thinking about this a bit more: there are three different HW capabilities:

1) The hardware cannot parse the resolution at all and userspace has to tell it
via S_FMT.

2) The hardware can parse the initial resolution, but is not able to handle
mid-stream resolution changes.

3) The hardware can parse the initial resolution and all following mid-stream
resolution changes.

We can consider 2 the default situation.

In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
to it. Question: do we want to flag this with the format as well? I.e. with a
V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
event (and documenting this) is sufficient.

In case of 3 the format sets the V4L2_FMT_FLAG_DYN_RESOLUTION flag.

What do you think?

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> This flag is mainly aimed at stateful decoder drivers.
>>
>> This RFC is motivated by my development on the amlogic video decoder
>> driver, which does not support dynamic resolution switching for older
>> coded formats (MPEG 1/2, MPEG 4 part II, H263). It does however support
>> it for the newer formats (H264, HEVC, VP9).
>>
>> The specification regarding stateful video decoders should be amended
>> to include that, in the absence of this flag for a certain format,
>> userspace is expected to extract the coded resolution and allocate
>> a sufficient amount of capture buffers on its own.
>> I understand that this point may be tricky, since older kernels with
>> close-to-spec drivers would not have this flag available, yet would
>> fully support dynamic resolution switching.
>> However, with the spec not merged in yet, I wanted to have your opinion
>> on this late addition.
>>
>> The RFC patches also adds support for this flag for the 4 following
>> stateful decoder drivers:
>>  - venus
>>  - s5p-mfc
>>  - mtk-vcodec
>>  - vicodec
>>
>> Maxime Jourdan (5):
>>   media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
>>   media: venus: vdec: flag OUTPUT formats with
>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>   media: s5p_mfc_dec: flag OUTPUT formats with
>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>   media: mtk-vcodec: flag OUTPUT formats with
>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>   media: vicodec: flag vdec/stateful OUTPUT formats with
>>     V4L2_FMT_FLAG_DYN_RESOLUTION
>>
>>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |  7 +++++++
>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++++
>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
>>  drivers/media/platform/qcom/venus/core.h           |  1 +
>>  drivers/media/platform/qcom/venus/vdec.c           | 11 +++++++++++
>>  drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 13 +++++++++++++
>>  drivers/media/platform/vicodec/vicodec-core.c      |  2 ++
>>  include/uapi/linux/videodev2.h                     |  5 +++--
>>  9 files changed, 43 insertions(+), 2 deletions(-)
>>
> 

