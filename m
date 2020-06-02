Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39DB1EB9F1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFBKzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgFBKzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 06:55:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80ABAC061A0E;
        Tue,  2 Jun 2020 03:55:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 3ECEF2A2D03
Subject: Re: [PATCH] vimc: debayer: Add support for ARGB format
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
 <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
 <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
 <273a36d8-fc87-f9d4-0cf2-15beddf1661c@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f927c8e3-73de-598d-130d-97b5380579e5@collabora.com>
Date:   Tue, 2 Jun 2020 07:55:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <273a36d8-fc87-f9d4-0cf2-15beddf1661c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/2/20 7:52 AM, Dafna Hirschfeld wrote:
> 
> 
> On 01.06.20 14:16, Kaaira Gupta wrote:
>> On Fri, May 29, 2020 at 05:43:57PM +0200, Dafna Hirschfeld wrote:
>>> Hi,
>>> Thanks for the patch
>>>
>>> I don't know how real devices handle ARGB formats,
>>> I wonder if it should be the part of the debayer.
>>
>> Hi! qcam tries to support BA24 as it is one of the formats that vimc
>> lists as its supported formats wih --list-formats. Shouldn't BA24 be
>> possible to capture with vimc?
> 
> Hi,
> Just to clarify, when listing the supported formats of a video node, the node lists
> the formats that the video node as an independent media entity support.
> It does not mean that the 'camera' as a whole (that is, the media topology graph) supports
> all the formats that the video node lists. When interacting with a video node or
> a subdevice node, one interacts only with that specific entity.
> In the case of vimc, the RGB video node as an independent entity supports BA24 so the format
> appears in the list of the its supported formats. But since the Debayer does not
> support it, the format can not be generated by the entire vimc topology.
> This is not a bug.

This is also my understanding.

You should have an -EPIPE error when start streaming though, it shouldn't fail silently.

Regards,
Helen

> 
> Hope t was helpful,
> Dafna
>  
>>
>> If yes, which entity should support it, if not debayer? Should there be
>> a separate conversion entity, or should we keep the support in debayer
>> itself for efficiency issues?
>>
>>>
>>>
>>> On 28.05.20 20:57, Kaaira Gupta wrote:
>>>> Running qcam for pixelformat 0x34324142 showed that vimc debayer does
>>>> not support it. Hence, add the support for Alpha (255).
>>>
>>> I would change the commit log to:
>>>
>>> Add support for V4L2_PIX_FMT_RGB24 format in the debayer
>>> and set the alpha channel to constant 255.
>>>
>>> Thanks,
>>> Dafna
>>>
>>>>
>>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>>> ---
>>>>    .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
>>>>    1 file changed, 18 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>> index c3f6fef34f68..f34148717a40 100644
>>>> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>> @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
>>>>        MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>>        MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>>>>        MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>>>> +    MEDIA_BUS_FMT_ARGB8888_1X32
>>>>    };
>>>>    static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>>> @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
>>>>        unsigned int i, index;
>>>>        vpix = vimc_pix_map_by_code(vdeb->src_code);
>>>> -    index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>> -    for (i = 0; i < 3; i++) {
>>>> -        switch (vpix->pixelformat) {
>>>> -        case V4L2_PIX_FMT_RGB24:
>>>> -            vdeb->src_frame[index + i] = rgb[i];
>>>> -            break;
>>>> -        case V4L2_PIX_FMT_BGR24:
>>>> -            vdeb->src_frame[index + i] = rgb[2 - i];
>>>> -            break;
>>>> +
>>>> +    if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
>>>> +        index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
>>>> +        vdeb->src_frame[index] = 255;
>>>> +        for (i = 0; i < 3; i++)
>>>> +            vdeb->src_frame[index + i + 1] = rgb[i];
>>>> +    } else {
>>>> +        index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>> +        for (i = 0; i < 3; i++) {
>>>> +            switch (vpix->pixelformat) {
>>>> +            case V4L2_PIX_FMT_RGB24:
>>>> +                vdeb->src_frame[index + i] = rgb[i];
>>>> +                break;
>>>> +            case V4L2_PIX_FMT_BGR24:
>>>> +                vdeb->src_frame[index + i] = rgb[2 - i];
>>>> +                break;
>>>> +            }
>>>>            }
>>>>        }
>>>>    }
>>>>
