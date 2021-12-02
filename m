Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3217466676
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346524AbhLBPbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:31:55 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48446 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238168AbhLBPbz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:31:55 -0500
Received: from [IPv6:2a00:c281:1409:4a00:c103:6980:2c3:d021] (unknown [IPv6:2a00:c281:1409:4a00:c103:6980:2c3:d021])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4A0571F46771;
        Thu,  2 Dec 2021 15:28:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638458912; bh=UBPtqIVCD7GGA2bmTTvEup1QLdAS87Z42PnMd0Sz5+Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n05J0EIDlc9Gt/Bi6pcDtjvpGzAu9vcCjVSo1N5BF3YLmMzcFVlZw5siQp5UQV878
         uIUUaJx36eXuVC0UkbcI9EWKl6c7DtG2+yd83ZutE2QZQ4Hh2eDKJbzzp8hyzqlIre
         vNc5eTGfhri+9SkUi7lDXg3D9jwQXf+pe0Mj7TAt/YlN4HQExqkCVHO0/IyACXBJ2n
         h3eD5ghF2+WZBrl5JA8Vqpk8/0p3sw4C4kN6eYViTIYpgDtguSvbyJF5lhWKR7THl3
         KEhFsSRXT3tFJTlr+iv4ygbQRqg1TeIw2jOZNLrrq1nEmHLsUI37anvnqFjpG2PSe/
         kyIAPRYdoo6GQ==
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
 <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
 <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
 <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com>
 <88434c9b-a682-7da5-ce3b-adec28b89471@collabora.com>
 <YZupE2zKojGCKuTT@pendragon.ideasonboard.com>
 <d3f7ad1e-4ace-c6e7-db05-9afd92a5e2ef@collabora.com>
 <1fe2d411ad7e2b4a9a23d7064a4be43aec5c2f24.camel@collabora.com>
 <163840136428.3570436.7897802701733761132@Monstersaurus>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <fadd06a6-e69c-2990-ed77-45ace7883622@collabora.com>
Date:   Thu, 2 Dec 2021 17:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163840136428.3570436.7897802701733761132@Monstersaurus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 02.12.21 01:29, Kieran Bingham wrote:
> Quoting Nicolas Dufresne (2021-12-01 18:14:45)
>> Le mercredi 01 décembre 2021 à 09:03 +0200, Dafna Hirschfeld a écrit :
>>>
>>> On 22.11.21 16:28, Laurent Pinchart wrote:
>>>> Hi Dafna,
>>>>
>>>> On Mon, Nov 22, 2021 at 04:21:25PM +0200, Dafna Hirschfeld wrote:
>>>>> On 22.11.21 14:29, Laurent Pinchart wrote:
>>>>>> On Mon, Nov 22, 2021 at 01:20:47PM +0200, Dafna Hirschfeld wrote:
>>>>>>> On 20.11.21 14:34, Laurent Pinchart wrote:
>>>>>>>> On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>> When trying to stream on both mainpatch and selfpatch
>>>>>>>>> with grey format, I get an iommu page fault.
>>>>>>>>> The fault is on the address at the end of the buffer,
>>>>>>>>> so it seems that the device is somehow wrongly
>>>>>>>>> configured and thinks there is another plane.
>>>>>>>>
>>>>>>>> Could we try to fix that instead ? There are IR sensors for which the
>>>>>>>> GREY format is useful.
>>>>>>>
>>>>>>> Hi, the doc is not very useful so I can try doing a bit trial and error.
>>>>>>> I see that there are several greyscale formats: [1]
>>>>>>> which make me think that maybe the device support one of the other greyscale formats.
>>>>>>> Do you know if some formats are more likely than other?
>>>>>>
>>>>>> GREY seems the most likely (useful for IR sensors for instance, after
>>>>>> ISP processing). Formats with a higher bpp would require processing of
>>>>>> more than 8bpp through the ISP pipeline, I don't know if that's
>>>>>> supported.
>>>
>>> I tried all kind of things but was not able to stream greyscale.
>>> When ISP processing works it outputs YUV 422 format and then the resizer
>>> is used to change the format to YUV 420 if wanted.
>>> I tried to chance the scale to YUV 400 (grey) or change the mainpath/selfpath
>>> configuration but still had that iommu page fault errors.
>>>
>>> Interestingly when I bypass the iommu and dma allocation is direct
>>> the streaming works and even the output frames seems okayish greyscale format
>>> but that might be by accident.
>>
>> Just a guess, but its possible they use a short cut to gray scale, and write to
>> NV12 buffers. planar YUV 420 are somewhat compatible with grayscale, so that's
>> always a possible cheat.
> 
> NV12 would be a pain, as it would require bigger buffers to be provided
> for the capture, which if coming from an external source rather than
> allocated on the device might not be given ...
> 
> Is there an explicit way to configure the UV plane on the RKISP to an
> internal scratch buffer that would get discarded? or will it always
> assume the UV data is immediately after the Y data?

It's actually not assumed so, the UV buffer address is a different address
configured into the device and doesn't have to be continuously after the Y buffer.
So we can indeed set it to a dummy buffer (which is already there
for the cases no vb2 buffers are queued.

Thanks,
Dafna

> 
> --
> Kieran
> 
> 
>>>>>> Formats with a higher bpp (both greyscale and bayer formats) are also
>>>>>> useful to capture raw images (before ISP processing). Is that something
>>>>>> the hardware and driver support ?
>>>>>
>>>>> hi, yes the variations of V4L2_PIX_FMT_Sxxxx10, V4L2_PIX_FMT_Sxxxx12
>>>>> are supported on mainpath.
>>>>
>>>> That's nice. Does it bypass the whole ISP then ? Is it possible to
>>>> capture raw frames on the main path and processed frames on the self
>>>> path at the same time, or are we restricted to raw only when we capture
>>>> raw frames ?
>>>
>>> I think we are restricted to raw only when we capture raw frames.
>>> The doc describe the isp_ctl register that set the isp output to either raw or yuv.
>>> It seems not to be possible to send raw to mainpath and yuv to selfpath.
>>>
>>> Thanks,
>>> Dafna
>>>
>>>>
>>>>>>> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html
>>>>>>>
>>>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>>>> ---
>>>>>>>>>      .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
>>>>>>>>>      1 file changed, 15 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>>>>>>> index 768987d5f2dd..7f78f361dd5e 100644
>>>>>>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>>>>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>>>>>>> @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>>>>>>>>>                    .write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>>>>>>>>                    .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>>>>>>            },
>>>>>>>>> - /* yuv400 */
>>>>>>>>> - {
>>>>>>>>> -         .fourcc = V4L2_PIX_FMT_GREY,
>>>>>>>>> -         .uv_swap = 0,
>>>>>>>>> -         .write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>>>>>>>> -         .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>>>>>> - },
>>>>>>>>>            /* yuv420 */
>>>>>>>>>            {
>>>>>>>>>                    .fourcc = V4L2_PIX_FMT_NV21,
>>>>>>>>> @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>>>>>>>>                    .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>>>>>>>>                    .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>>>>>>            },
>>>>>>>>> - /* yuv400 */
>>>>>>>>> - {
>>>>>>>>> -         .fourcc = V4L2_PIX_FMT_GREY,
>>>>>>>>> -         .uv_swap = 0,
>>>>>>>>> -         .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>>>>>>>> -         .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>>>>>>>>> -         .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>>>>>> - },
>>>>>>>>>            /* rgb */
>>>>>>>>>            {
>>>>>>>>>                    .fourcc = V4L2_PIX_FMT_XBGR32,
>>>>
>>>
>>
