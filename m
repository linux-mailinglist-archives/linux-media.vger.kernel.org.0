Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BA745901E
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 15:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239476AbhKVOYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 09:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239307AbhKVOYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 09:24:37 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0659DC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 06:21:30 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C9A361F44C0B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637590889; bh=o6EH+cYiU/sr+UsKiZGCFfpWQjUprewn87edi84nOeY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WpNs3vYzmkQl4XCXnrNk3V5qD8irjj4N/nGm2ayPQFgDYCi10ApOwCkHgLq+IjEMS
         kBz41l7FGLoFMyvr7pfGPdfi7u28kDv+Nh68ZXOa1iIQxPchCjk8k5UaVK2VdNfCdl
         aeZqOm7tmRrsN9aAj2Ctc4h+z4Ihe1GfzsYMjQOG8FNfWc/ulR5PDGJJB2z8wTrGXu
         WJxVDiG4BLNmnDgk8Mxd/7OiPaiXo7F6nJxc0OgyzexmZTXa9wI+T5ioqs1ZzQRkIY
         aOg/byWWjGyTs+yRkWhMgtsB7XSnIIYdAzn5anMZ+9Nj3M0w6LZWoAMprZ6xdXcoWb
         tpICKazXEexWw==
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
 <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
 <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
 <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <88434c9b-a682-7da5-ce3b-adec28b89471@collabora.com>
Date:   Mon, 22 Nov 2021 16:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.11.21 14:29, Laurent Pinchart wrote:
> Hi Dafna,
> 
> On Mon, Nov 22, 2021 at 01:20:47PM +0200, Dafna Hirschfeld wrote:
>> On 20.11.21 14:34, Laurent Pinchart wrote:
>>> On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
>>>> When trying to stream on both mainpatch and selfpatch
>>>> with grey format, I get an iommu page fault.
>>>> The fault is on the address at the end of the buffer,
>>>> so it seems that the device is somehow wrongly
>>>> configured and thinks there is another plane.
>>>
>>> Could we try to fix that instead ? There are IR sensors for which the
>>> GREY format is useful.
>>
>> Hi, the doc is not very useful so I can try doing a bit trial and error.
>> I see that there are several greyscale formats: [1]
>> which make me think that maybe the device support one of the other greyscale formats.
>> Do you know if some formats are more likely than other?
> 
> GREY seems the most likely (useful for IR sensors for instance, after
> ISP processing). Formats with a higher bpp would require processing of
> more than 8bpp through the ISP pipeline, I don't know if that's
> supported.
> 
> Formats with a higher bpp (both greyscale and bayer formats) are also
> useful to capture raw images (before ISP processing). Is that something
> the hardware and driver support ?

hi, yes the variations of V4L2_PIX_FMT_Sxxxx10, V4L2_PIX_FMT_Sxxxx12 are supported on mainpath.

> 
>> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html
>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> ---
>>>>    .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
>>>>    1 file changed, 15 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> index 768987d5f2dd..7f78f361dd5e 100644
>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>>>>    		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>>>    		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>    	},
>>>> -	/* yuv400 */
>>>> -	{
>>>> -		.fourcc = V4L2_PIX_FMT_GREY,
>>>> -		.uv_swap = 0,
>>>> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>> -	},
>>>>    	/* yuv420 */
>>>>    	{
>>>>    		.fourcc = V4L2_PIX_FMT_NV21,
>>>> @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>>>    		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>>>    		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>    	},
>>>> -	/* yuv400 */
>>>> -	{
>>>> -		.fourcc = V4L2_PIX_FMT_GREY,
>>>> -		.uv_swap = 0,
>>>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>>>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>> -	},
>>>>    	/* rgb */
>>>>    	{
>>>>    		.fourcc = V4L2_PIX_FMT_XBGR32,
> 
