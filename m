Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08711EBA54
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 13:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgFBLYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 07:24:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgFBLYX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 07:24:23 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 876102A4;
        Tue,  2 Jun 2020 13:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591097060;
        bh=sCRMBBEytwCM/A8PsFEk4hBMyRL8jHCFcmDwvRg8u1A=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eNlj46PJQppfHncqqSjC0EMd+VefHc8SCrIMmqkDXisAK6FcFzSneO/yptbspP6Sf
         GX6Xui2wquzRz6Ym1hSVDZL9m25vt6GQ/LB3+b89E1yUZJbD6kDDlKyK7smwMuDN1v
         AgTBlmw89o+Af/Q/sI8eH8vsJe7sizhDRrKutvc8=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] vimc: debayer: Add support for ARGB format
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
 <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
 <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
 <273a36d8-fc87-f9d4-0cf2-15beddf1661c@collabora.com>
 <f927c8e3-73de-598d-130d-97b5380579e5@collabora.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <3b4c4447-677c-08b9-9366-95a012f8f018@ideasonboard.com>
Date:   Tue, 2 Jun 2020 12:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f927c8e3-73de-598d-130d-97b5380579e5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen, Dafna,

On 02/06/2020 11:55, Helen Koike wrote:
> 
> On 6/2/20 7:52 AM, Dafna Hirschfeld wrote:
>>
>> On 01.06.20 14:16, Kaaira Gupta wrote:
>>> On Fri, May 29, 2020 at 05:43:57PM +0200, Dafna Hirschfeld wrote:
>>>> Hi,
>>>> Thanks for the patch
>>>>
>>>> I don't know how real devices handle ARGB formats,
>>>> I wonder if it should be the part of the debayer.
>>>
>>> Hi! qcam tries to support BA24 as it is one of the formats that vimc
>>> lists as its supported formats wih --list-formats. Shouldn't BA24 be
>>> possible to capture with vimc?
>>
>> Hi,
>> Just to clarify, when listing the supported formats of a video node, the node lists
>> the formats that the video node as an independent media entity support.
>> It does not mean that the 'camera' as a whole (that is, the media topology graph) supports
>> all the formats that the video node lists. When interacting with a video node or
>> a subdevice node, one interacts only with that specific entity.
>> In the case of vimc, the RGB video node as an independent entity supports BA24 so the format
>> appears in the list of the its supported formats. But since the Debayer does not
>> support it, the format can not be generated by the entire vimc topology.
>> This is not a bug.
> 
> This is also my understanding.
> 
> You should have an -EPIPE error when start streaming though, it shouldn't fail silently.

Yes, we had -EPIPE, and that is what I think we were trying to resolve.

How would userspace be expected to detect what formats to use ? Should
the available formats on the capture node depend on the current linking
of the media graph?

Otherwise, to know what formats are supported - userspace must first
'get a list of formats' then try to 'set' the formats to know what is
possible?

Or should (given VIMC is quite specialist anyway) userspace 'just know'
what is capable all the same?

That's possibly fine, as we can simply remove support for the ARGB
formats from the libcamera pipeline handler if it is never expected to
be supported.

But then as a further question - what formats will we expect VIMC to
support? VIVID has a (very) wide range of formats.

Would we ever expect VIMC to be as configurable?
Or is the scope limited to what we have today?

--
Regards

Kieran



> Regards,
> Helen
> 
>>
>> Hope t was helpful,
>> Dafna
>>  
>>>
>>> If yes, which entity should support it, if not debayer? Should there be
>>> a separate conversion entity, or should we keep the support in debayer
>>> itself for efficiency issues?
>>>
>>>>
>>>>
>>>> On 28.05.20 20:57, Kaaira Gupta wrote:
>>>>> Running qcam for pixelformat 0x34324142 showed that vimc debayer does
>>>>> not support it. Hence, add the support for Alpha (255).
>>>>
>>>> I would change the commit log to:
>>>>
>>>> Add support for V4L2_PIX_FMT_RGB24 format in the debayer
>>>> and set the alpha channel to constant 255.
>>>>
>>>> Thanks,
>>>> Dafna
>>>>
>>>>>
>>>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>>>> ---
>>>>>    .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
>>>>>    1 file changed, 18 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>>> index c3f6fef34f68..f34148717a40 100644
>>>>> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>>> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>>> @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
>>>>>        MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>>>        MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>>>>>        MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>>>>> +    MEDIA_BUS_FMT_ARGB8888_1X32
>>>>>    };
>>>>>    static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>>>> @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
>>>>>        unsigned int i, index;
>>>>>        vpix = vimc_pix_map_by_code(vdeb->src_code);
>>>>> -    index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>>> -    for (i = 0; i < 3; i++) {
>>>>> -        switch (vpix->pixelformat) {
>>>>> -        case V4L2_PIX_FMT_RGB24:
>>>>> -            vdeb->src_frame[index + i] = rgb[i];
>>>>> -            break;
>>>>> -        case V4L2_PIX_FMT_BGR24:
>>>>> -            vdeb->src_frame[index + i] = rgb[2 - i];
>>>>> -            break;
>>>>> +
>>>>> +    if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
>>>>> +        index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
>>>>> +        vdeb->src_frame[index] = 255;
>>>>> +        for (i = 0; i < 3; i++)
>>>>> +            vdeb->src_frame[index + i + 1] = rgb[i];
>>>>> +    } else {
>>>>> +        index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>>> +        for (i = 0; i < 3; i++) {
>>>>> +            switch (vpix->pixelformat) {
>>>>> +            case V4L2_PIX_FMT_RGB24:
>>>>> +                vdeb->src_frame[index + i] = rgb[i];
>>>>> +                break;
>>>>> +            case V4L2_PIX_FMT_BGR24:
>>>>> +                vdeb->src_frame[index + i] = rgb[2 - i];
>>>>> +                break;
>>>>> +            }
>>>>>            }
>>>>>        }
>>>>>    }
>>>>>

-- 
Regards
--
Kieran
