Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9579519E4D9
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 14:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgDDMJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 08:09:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37818 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgDDMJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 08:09:25 -0400
Received: from [IPv6:2a02:810a:1140:6758:bcbb:8e03:fb12:bd04] (unknown [IPv6:2a02:810a:1140:6758:bcbb:8e03:fb12:bd04])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F3542297A11;
        Sat,  4 Apr 2020 13:09:23 +0100 (BST)
Subject: Re: [PATCH 2/3] media: staging: rkisp1: rsz: change (hv)div only if
 capture format is YUV
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
 <20200328105606.13660-3-dafna.hirschfeld@collabora.com>
 <7445ddcb-75f5-7792-0807-47c0b0d0d54a@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <711657f5-005b-fafd-6063-f8c8b61905e7@collabora.com>
Date:   Sat, 4 Apr 2020 14:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7445ddcb-75f5-7792-0807-47c0b0d0d54a@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 30.03.20 22:04, Helen Koike wrote:
> 
> 
> On 3/28/20 7:56 AM, Dafna Hirschfeld wrote:
>> RGB formats in selfpath should receive input format as YUV422.
>> The resizer input format is always YUV422 and therefore
>> if the capture format is RGB, the resizer should not change
>> the YUV rations.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> index 8704267a066f..5721eee29ecb 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -389,8 +389,18 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>>   			&rsz->rkisp1->capture_devs[rsz->id];
>>   		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
>>   
>> -		hdiv = pixfmt_info->hdiv;
>> -		vdiv = pixfmt_info->vdiv;
>> +		/*
>> +		 * The resizer always get the input as YUV422
>> +		 * If the capture encoding is also YUV, then the resizer should
>> +		 * change the 4:2:2 sampling to the sampling of the capture
>> +		 * format (4:2:2 -> 4:2:0 for example).
>> +		 * If the capture format is RGB then the memory input should
>> +		 * be YUV422 so we don't change the default hdiv, vdiv
>> +		 */
>> +		if (v4l2_is_format_yuv(pixfmt_info)) {
> 
> Can't this be moved with && in the outer if statement block?

Actually the outer statement is not needed at all and can be removed
since the code return if rsz->fmt_type is RKISP1_FMT_BAYER but
the resizer format is either bayer or yuv so there is no
need for the "if (rsz->fmt_type == RKISP1_FMT_YUV)"

Thanks,
Dafna

> 
> Regards,
> Helen
> 
>> +			hdiv = pixfmt_info->hdiv;
>> +			vdiv = pixfmt_info->vdiv;
>> +		}
>>   	}
>>   	src_c.width = src_y.width / hdiv;
>>   	src_c.height = src_y.height / vdiv;
>>
