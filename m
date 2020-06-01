Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654991EA7C8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 18:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgFAQ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 12:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFAQ1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 12:27:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EB7C05BD43;
        Mon,  1 Jun 2020 09:27:44 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A7A722A01B3
Subject: Re: [PATCH] vimc: debayer: Add support for ARGB format
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com,
        dafna Hirschfeld <dafna3@gmail.com>,
        =?UTF-8?Q?Lucas_Magalh=c3=a3es?= <lucmaga@gmail.com>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
 <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
 <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
 <20200601123705.GE5886@pendragon.ideasonboard.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3cdd1740-d085-c04b-1861-a1a541d1ee56@collabora.com>
Date:   Mon, 1 Jun 2020 13:27:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200601123705.GE5886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/1/20 9:37 AM, Laurent Pinchart wrote:
> On Mon, Jun 01, 2020 at 05:46:26PM +0530, Kaaira Gupta wrote:
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
>>
>> If yes, which entity should support it, if not debayer? Should there be
>> a separate conversion entity, or should we keep the support in debayer
>> itself for efficiency issues?
> 
> At the hardware level, the de-bayering block usually produces RGB with 8
> or more bits per colour components (so 3xn, 24 bits for 8-bit depths).
> The conversion to 32-bit ARGB usually happens at the DMA engine level,
> in the formatter right in front of the DMA engine. Ideally the vimc
> pipeline should expose the same.
> 
> From a performance point of view, it makes little sense to process the
> image in vimc through multiple steps. I think it would be best to
> generate the final image directly at the output of the pipeline.

[+ Lucas Magalhães]

Lucas was working on a patch for that, he sent an RFC[1] some time ago.

[1] https://patchwork.linuxtv.org/patch/60445/

It would be nice to have this indeed.

Regards,
Helen

> 
>>> On 28.05.20 20:57, Kaaira Gupta wrote:
>>>> Running qcam for pixelformat 0x34324142 showed that vimc debayer does
>>>> not support it. Hence, add the support for Alpha (255).
>>>
>>> I would change the commit log to:
>>>
>>> Add support for V4L2_PIX_FMT_RGB24 format in the debayer
>>> and set the alpha channel to constant 255.
>>>
>>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>>> ---
>>>>   .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
>>>>   1 file changed, 18 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>> index c3f6fef34f68..f34148717a40 100644
>>>> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
>>>> @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
>>>>   	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>>   	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>>>>   	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>>>> +	MEDIA_BUS_FMT_ARGB8888_1X32
>>>>   };
>>>>   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>>>> @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
>>>>   	unsigned int i, index;
>>>>   	vpix = vimc_pix_map_by_code(vdeb->src_code);
>>>> -	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>> -	for (i = 0; i < 3; i++) {
>>>> -		switch (vpix->pixelformat) {
>>>> -		case V4L2_PIX_FMT_RGB24:
>>>> -			vdeb->src_frame[index + i] = rgb[i];
>>>> -			break;
>>>> -		case V4L2_PIX_FMT_BGR24:
>>>> -			vdeb->src_frame[index + i] = rgb[2 - i];
>>>> -			break;
>>>> +
>>>> +	if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
>>>> +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
>>>> +		vdeb->src_frame[index] = 255;
>>>> +		for (i = 0; i < 3; i++)
>>>> +			vdeb->src_frame[index + i + 1] = rgb[i];
>>>> +	} else {
>>>> +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
>>>> +		for (i = 0; i < 3; i++) {
>>>> +			switch (vpix->pixelformat) {
>>>> +			case V4L2_PIX_FMT_RGB24:
>>>> +				vdeb->src_frame[index + i] = rgb[i];
>>>> +				break;
>>>> +			case V4L2_PIX_FMT_BGR24:
>>>> +				vdeb->src_frame[index + i] = rgb[2 - i];
>>>> +				break;
>>>> +			}
>>>>   		}
>>>>   	}
>>>>   }
> 
