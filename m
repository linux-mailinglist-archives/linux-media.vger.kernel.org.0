Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A76458D44
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 12:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238297AbhKVLYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 06:24:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33192 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhKVLX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 06:23:58 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D01931F4417B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637580051; bh=pPrEN/YF4sotbuUfmPn39l8y4o1ImZY5UTUEmz++QNo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SDziSTY9dNAhuzTBXfL3rkLd0ucwrWgVVCvwYO/SrVl8OEsUeOcrKGsvNb7ZzZdZT
         yolCIL/ftz192Nvq5laHdZBlpwyAaCmXxx0s+tLkfa/M76NSQLwHHa/evkgiy8PmAZ
         U+179zUVQxPlcHuCVJm3imhRrpWi1G/zPyMe6YUuVIgND82HSNYPSBhQ8cajiCIssS
         0CbfE34YRZYDRBTYWxW6A1O79PxTJU0hzLmd53pA8ug4OHLGIK5L3NgY3U2nRC5arM
         gXhZMarwG0pZxsiWhgZ35aN5Bq0+yBEFoDtX/NfPjQxdEd/oUvDym5iOlqBVk4k1j5
         6J6MRvg63J/xA==
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
 <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com>
Date:   Mon, 22 Nov 2021 13:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 20.11.21 14:34, Laurent Pinchart wrote:
> Hi Dafna,
> 
> Thank you for the patch.
> 
> On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
>> When trying to stream on both mainpatch and selfpatch
>> with grey format, I get an iommu page fault.
>> The fault is on the address at the end of the buffer,
>> so it seems that the device is somehow wrongly
>> configured and thinks there is another plane.
> 
> Could we try to fix that instead ? There are IR sensors for which the
> GREY format is useful.

Hi, the doc is not very useful so I can try doing a bit trial and error.
I see that there are several greyscale formats: [1]
which make me think that maybe the device support one of the other greyscale formats.
Do you know if some formats are more likely than other?

thanks,
Dafna

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html


> 
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
>>   1 file changed, 15 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> index 768987d5f2dd..7f78f361dd5e 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>>   		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>>   		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>   	},
>> -	/* yuv400 */
>> -	{
>> -		.fourcc = V4L2_PIX_FMT_GREY,
>> -		.uv_swap = 0,
>> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> -	},
>>   	/* yuv420 */
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_NV21,
>> @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>   		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>   		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>   	},
>> -	/* yuv400 */
>> -	{
>> -		.fourcc = V4L2_PIX_FMT_GREY,
>> -		.uv_swap = 0,
>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>> -	},
>>   	/* rgb */
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_XBGR32,
> 
