Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B659B1EBCE4
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 15:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFBNQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 09:16:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52354 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgFBNQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 09:16:13 -0400
Received: from [IPv6:2003:cb:871f:5b00:b464:983c:2e91:eb78] (p200300cb871f5b00b464983c2e91eb78.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:b464:983c:2e91:eb78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B46C12A34DB;
        Tue,  2 Jun 2020 14:16:06 +0100 (BST)
Subject: Re: [PATCH] vimc: debayer: Add support for ARGB format
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>
Cc:     kieran.bingham@ideasonboard.com,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
 <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
 <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
 <273a36d8-fc87-f9d4-0cf2-15beddf1661c@collabora.com>
 <f927c8e3-73de-598d-130d-97b5380579e5@collabora.com>
 <3b4c4447-677c-08b9-9366-95a012f8f018@ideasonboard.com>
 <cdcc42bf-b0dc-41b7-5104-eff8aa42feb2@collabora.com>
 <20200602124504.GA12043@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <3ba24fe9-46e5-0b08-2335-41bd26ef1831@collabora.com>
Date:   Tue, 2 Jun 2020 15:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602124504.GA12043@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 02.06.20 14:45, Laurent Pinchart wrote:
> Hello,
> 
> On Tue, Jun 02, 2020 at 08:31:26AM -0300, Helen Koike wrote:
>> On 6/2/20 8:24 AM, Kieran Bingham wrote:
>>> On 02/06/2020 11:55, Helen Koike wrote:
>>>> On 6/2/20 7:52 AM, Dafna Hirschfeld wrote:
>>>>> On 01.06.20 14:16, Kaaira Gupta wrote:
>>>>>> On Fri, May 29, 2020 at 05:43:57PM +0200, Dafna Hirschfeld wrote:
>>>>>>> Hi,
>>>>>>> Thanks for the patch
>>>>>>>
>>>>>>> I don't know how real devices handle ARGB formats,
>>>>>>> I wonder if it should be the part of the debayer.
>>>>>>
>>>>>> Hi! qcam tries to support BA24 as it is one of the formats that vimc
>>>>>> lists as its supported formats wih --list-formats. Shouldn't BA24 be
>>>>>> possible to capture with vimc?
>>>>>
>>>>> Hi,
>>>>> Just to clarify, when listing the supported formats of a video node, the node lists
>>>>> the formats that the video node as an independent media entity support.
>>>>> It does not mean that the 'camera' as a whole (that is, the media topology graph) supports
>>>>> all the formats that the video node lists. When interacting with a video node or
>>>>> a subdevice node, one interacts only with that specific entity.
>>>>> In the case of vimc, the RGB video node as an independent entity supports BA24 so the format
>>>>> appears in the list of the its supported formats. But since the Debayer does not
>>>>> support it, the format can not be generated by the entire vimc topology.
>>>>> This is not a bug.
> 
> Is here a valid configuration for the vimc pipeline that produces BA24 ?
I think there isn't

> I agree that not all pipeline configurations need to support every
> format, but we shouldn't report a format that can't be produced at all.
> 
> This being said, and as discussed before, the de-bayering subdev should
> just produce MEDIA_BUS_FMT_RGB888_1X24, and the video node should then
> implement the RGB pixel formats. BA24 should likely be one of the
> supported formats (or maybe BX24 ?).
So you mean that the video node should support it so when it receive RGB
format in the source pad it converts it to BA24 or BX24 ?
It makes sense. I guess both BA24 and BX24 can be added, I see in the
pixfmt-rgb.html doc that probably the control  V4L2_CID_ALPHA_COMPONENT
should then be added.

> 
>>>> This is also my understanding.
>>>>
>>>> You should have an -EPIPE error when start streaming though, it
>>>> shouldn't fail silently.
>>>
>>> Yes, we had -EPIPE, and that is what I think we were trying to resolve.
>>>
>>> How would userspace be expected to detect what formats to use ? Should
>>> the available formats on the capture node depend on the current linking
>>> of the media graph?
>>
>> This is a good question, I don't recall v4l2 API defining this.
> 
> A recent extension to VIDIOC_ENUMFMT allows enumerating pixel formats
> for a given media bus code, I think that's the way forward.
> 
>> It would be a bit hard to implement in Vimc, specially when we have configfs
>> for custom topology, since the capture would need to query all the pipeline.
>> But could be implemented.
>>
>>> Otherwise, to know what formats are supported - userspace must first
>>> 'get a list of formats' then try to 'set' the formats to know what is
>>> possible?
Yes, there is a doc file that explains that it should be done in a "bottom-up" way
,that is,  starting with configuring the sensor, then adjusting the debayer
to the sensor output, then adjusting the scaler to the debayer outout and then
adjusting the video node output to the scaler output. One should also use the
'try' version of the setting at the stage of adjusting the final configuration.
The detailed explanation is in Documentation/output/userspace-api/media/v4l/dev-subdev.html

Thanks,
Dafna

>>
>> At the moment yes.
>>
>>> Or should (given VIMC is quite specialist anyway) userspace 'just know'
>>> what is capable all the same?
>>>
>>> That's possibly fine, as we can simply remove support for the ARGB
>>> formats from the libcamera pipeline handler if it is never expected to
>>> be supported.
>>
>> With the configfs feature, you could build a topology with sensor->capture,
>> and ARGB would be supported.
>>
>>> But then as a further question - what formats will we expect VIMC to
>>> support? VIVID has a (very) wide range of formats.
>>>
>>> Would we ever expect VIMC to be as configurable?
>>> Or is the scope limited to what we have today?
>>
>> I know it is very limited atm, but I would like to increase the range,
>> I'm just with a limited bandwitdh to work on it.
>>
>>>>>>
>>>>>> If yes, which entity should support it, if not debayer? Should there be
>>>>>> a separate conversion entity, or should we keep the support in debayer
>>>>>> itself for efficiency issues?
>>>>>>
>>>>>>> On 28.05.20 20:57, Kaaira Gupta wrote:
>>>>>>>> Running qcam for pixelformat 0x34324142 showed that vimc debayer does
>>>>>>>> not support it. Hence, add the support for Alpha (255).
>>>>>>>
>>>>>>> I would change the commit log to:
>>>>>>>
>>>>>>> Add support for V4L2_PIX_FMT_RGB24 format in the debayer
>>>>>>> and set the alpha channel to constant 255.
>>>>>>>
>>>>>>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>>>>>>> ---
>>>>>>>>     .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
>>>>>>>>     1 file changed, 18 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>>>>>> index c3f6fef34f68..f34148717a40 100644
>>>>>>>> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>>>>>> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>>>>>> @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
>>>>>>>>         MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>>>>>>         MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>>>>>>>>         MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>>>>>>>> +    MEDIA_BUS_FMT_ARGB8888_1X32
>>>>>>>>     };
>>>>>>>>     static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>>>>>>> @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
>>>>>>>>         unsigned int i, index;
>>>>>>>>         vpix = vimc_pix_map_by_code(vdeb->src_code);
>>>>>>>> -    index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>>>>>> -    for (i = 0; i < 3; i++) {
>>>>>>>> -        switch (vpix->pixelformat) {
>>>>>>>> -        case V4L2_PIX_FMT_RGB24:
>>>>>>>> -            vdeb->src_frame[index + i] = rgb[i];
>>>>>>>> -            break;
>>>>>>>> -        case V4L2_PIX_FMT_BGR24:
>>>>>>>> -            vdeb->src_frame[index + i] = rgb[2 - i];
>>>>>>>> -            break;
>>>>>>>> +
>>>>>>>> +    if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
>>>>>>>> +        index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
>>>>>>>> +        vdeb->src_frame[index] = 255;
>>>>>>>> +        for (i = 0; i < 3; i++)
>>>>>>>> +            vdeb->src_frame[index + i + 1] = rgb[i];
>>>>>>>> +    } else {
>>>>>>>> +        index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>>>>>> +        for (i = 0; i < 3; i++) {
>>>>>>>> +            switch (vpix->pixelformat) {
>>>>>>>> +            case V4L2_PIX_FMT_RGB24:
>>>>>>>> +                vdeb->src_frame[index + i] = rgb[i];
>>>>>>>> +                break;
>>>>>>>> +            case V4L2_PIX_FMT_BGR24:
>>>>>>>> +                vdeb->src_frame[index + i] = rgb[2 - i];
>>>>>>>> +                break;
>>>>>>>> +            }
>>>>>>>>             }
>>>>>>>>         }
>>>>>>>>     }
> 
