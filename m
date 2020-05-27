Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2419B1E3EBB
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 12:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387840AbgE0KOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 06:14:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41082 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387751AbgE0KOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 06:14:25 -0400
Received: from [IPv6:2804:14c:483:757c::1001] (unknown [IPv6:2804:14c:483:757c::1001])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D28772A35AF;
        Wed, 27 May 2020 11:14:20 +0100 (BST)
Subject: Re: [PATCH v2 4/4] media: staging: rkisp1: cap: remove support of
 BGR666 format
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-5-dafna.hirschfeld@collabora.com>
 <fc4dbc40-ab57-0ca4-4ac7-5ffdb7f0ad81@collabora.com>
 <CAHD77H=iq3BpwD3=yL1DttUH_=vt8nO-5N_Kiu427BrUHJQ-zQ@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <1c5f335b-0f31-bfb6-7dfe-91b5372489f0@collabora.com>
Date:   Wed, 27 May 2020 07:14:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHD77H=iq3BpwD3=yL1DttUH_=vt8nO-5N_Kiu427BrUHJQ-zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/26/20 7:57 PM, Tomasz Figa wrote:
> On Thu, May 21, 2020 at 12:35 AM Helen Koike <helen.koike@collabora.com> wrote:
>>
>>
>>
>> On 5/15/20 11:29 AM, Dafna Hirschfeld wrote:
>>> The rkisp1 supports RGB encoding with 6 bits per
>>> color with the following format:
>>> - - b5 b4 b3 b2 b1 b0 - - g5 g4 g3 g2 g1 g0 - - r5 r4 r3 r2 r1 r0 - - - - - - - -
>>
>> Is this the same as V4L2_PIX_FMT_XBGR32 format, but with colors range from 0 to 63 ?
>>
>> I was wondering what is the usage of such a format. If it is useful, then I'm sad
>> to see this being removed from the driver, since this is a v4l2 api limitation, and not
>> a hw limitation.
> 
> Sounds like some relic of the past. ;)
> 
> In general, RGB formats are not very useful in this hardware. One
> wastes the precious bandwidth, but doesn't get more color resolution,
> since the pipeline uses YUV 4:2:2 internally anyway. The typical usage
> scenarios with video or JPEG encoding and preview are much better off
> with the available YUV formats.

Thanks for your input.

Right, then in this case, I don't oppose removing it.

> 
>>
>> Regards,
>> Helen
>>
>>>
>>> This is not how V4L2_PIX_FMT_BGR666 is defined, so remove
>>> this format from the driver's formats list.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

>>> ---
>>>  drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ----
>>>  1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> index 61b9ebe577b2..2660e44eda88 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> @@ -283,10 +283,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>>               .fourcc = V4L2_PIX_FMT_RGB565,
>>>               .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>>               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
>>> -     }, {
>>> -             .fourcc = V4L2_PIX_FMT_BGR666,
>>> -             .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>> -             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB666,
>>>       },
>>>  };
>>>
>>>
