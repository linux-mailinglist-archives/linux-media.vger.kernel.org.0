Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADF2257ED4
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 18:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgHaQdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 12:33:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41698 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgHaQdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 12:33:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 86462291728
Subject: Re: [PATCH v3 01/10] media: staging: rkisp1: cap: change RGB24 format
 to XBGR32
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-2-dafna.hirschfeld@collabora.com>
 <26cb0066-015f-c73f-1e03-c02b03d6da2d@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <37b85864-73f6-0932-5fa9-763a6dc3bdb1@collabora.com>
Date:   Mon, 31 Aug 2020 18:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <26cb0066-015f-c73f-1e03-c02b03d6da2d@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 04.08.20 um 01:49 schrieb Helen Koike:
> 
> 
> On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
>> According to the TRM [1], the YUV->RGB conversion outputs
>> RGB 888 format with 4 bytes, where the last byte is ignored,
>> using big endian representation:
>>
>> ________________________________
> 
> For some reason, it seems that patchwork ignored the rest of the message from this line
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20200723132014.4597-2-dafna.hirschfeld@collabora.com/
> 
> This is just a thing to be careful when picking from patchwork.

I think this line signifies that what under it is a comment.
I'll remove it

Thanks,
Dafna


> 
> Regards,
> Helen
> 
> 
>> |___X___|___R___|___G___|___B___|
>> 31      24      16      8       0
>>
>> Which matches format V4L2_PIX_FMT_XBGR32 in little endian
>> representation, so replace it accordingly.
>>
>> "24 bit word". What it means is that 4 bytes are used with
>> 24bit for the RGB and the last byte is ignored.
>> This matches format V4L2_PIX_FMT_XBGR32.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index c05280950ea0..2333d2dcd2e6 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -276,7 +276,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>   	},
>>   	/* rgb */
>>   	{
>> -		.fourcc = V4L2_PIX_FMT_RGB24,
>> +		.fourcc = V4L2_PIX_FMT_XBGR32,
>>   		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>   		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>>   	}, {
>>
