Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE09E561D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 23:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbfJYVsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 17:48:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33117 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJYVsn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 17:48:43 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so1987388plk.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2019 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=e03BemmY7UaC7LTN3TMs21VwrRgjNdmUKr2Aw0+Pn+8=;
        b=loLyK9IRKvOcmETwwE4+eq6GaTLFZIiHUz7h2Lb1p0DU29jrII5AB4ONZZnZRRB1hQ
         bUrzn0XfsK+oG1irRRdA5b4Vl5I5M1vYORRMiNUaeUz3ssSUd8+3pRKeEEn3qlGp2SV9
         CVsI1aOHgU1w96haY0Z7CEHFEJvmUkRkQh5PtbIuLQkkFAn18tTrs56m6pMwcpCzrLAj
         GViioStV6FIaQpRkAy8h5rDqL4M2mTO3SBFEFWQHLSFZF1NeR8YFFDn20kZo036CpQVv
         5Qr6UAAAsfnhHKuy2Q1wJ1eLSNJjxDMSmyz+za2YbJekKmO0kCgvG9M/dWj6ENlSqche
         gwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=e03BemmY7UaC7LTN3TMs21VwrRgjNdmUKr2Aw0+Pn+8=;
        b=aDIm4Zv5ZPLtwoK79gHNmYF7TA3vom2LyDgEOg2Y751XIDEJKqOypsVqoP2QEju6qP
         NjAnOx0qs81iqJAhTdiblh+OfCBB4zyZmzb4+EcVDwGS8i8UjDE5r8jj1Fcg/PQg/Q0i
         z7naVn9z4BGh6I9Ojov7nXGRH9uI96nVXwHB/3phqEvdkpsWGwXlwAMBqcOyD4iNr2ur
         /Q5JJaGYEeYJ3BtEuL161rdL0uWptwNiInAmx4K7xRs2X0aTIHSCLgsv7C6QjN9cxRTz
         d6d3pTc45Ew9PorGV/mkOeswamzYs588rwWU/ItCSHjn0muNJEFRbb0hyymkdw0UK0rn
         pFnA==
X-Gm-Message-State: APjAAAV8xGq/iDIYtGW7bjUBvg5EiVTR8U4RuP1OCQOSPUxR6ezYf5UI
        p+qK72TObBzzSYKhPUP2HiHO3U8A
X-Google-Smtp-Source: APXvYqyxHoVB5o5Lhvu6Kflk40G+0BL6NR5ySEFl6SC22p6/4On9tPFgk0q69hHCS0Zktjk0d3YYOA==
X-Received: by 2002:a17:902:b612:: with SMTP id b18mr4884286pls.309.1572040122239;
        Fri, 25 Oct 2019 14:48:42 -0700 (PDT)
Received: from [172.30.90.16] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id b13sm3576492pgd.58.2019.10.25.14.48.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 14:48:41 -0700 (PDT)
Subject: Re: [PATCH 3/3] media: imx: fix media bus format enumeration
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20190912160122.5545-1-p.zabel@pengutronix.de>
 <20190912160122.5545-3-p.zabel@pengutronix.de>
 <d30091d5-5e45-9682-7c23-813eff2b42c5@xs4all.nl>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <6547e18f-e3d5-4e80-4e20-5eaf9ee0b86c@gmail.com>
Date:   Fri, 25 Oct 2019 14:48:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d30091d5-5e45-9682-7c23-813eff2b42c5@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 9/27/19 12:33 AM, Hans Verkuil wrote:
> On 9/12/19 6:01 PM, Philipp Zabel wrote:
>> Iterate over all media bus formats, not just over the first format in
>> each imx_media_pixfmt entry.
>>
>> Before:
>>
>>    $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
>>    ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
>> 	0x2006: MEDIA_BUS_FMT_UYVY8_2X8
>> 	0x2008: MEDIA_BUS_FMT_YUYV8_2X8
>> 	0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
>> 	0x100a: MEDIA_BUS_FMT_RGB888_1X24
>> 	0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
>> 	0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
>> 	0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
>> 	0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
>> 	0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
>> 	0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
>> 	0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
>> 	0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
>> 	0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
>> 	0x2001: MEDIA_BUS_FMT_Y8_1X8
>> 	0x200a: MEDIA_BUS_FMT_Y10_1X10
>>
>> After:
>>
>>    $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
>>    ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
>> 	0x2006: MEDIA_BUS_FMT_UYVY8_2X8
>> 	0x200f: MEDIA_BUS_FMT_UYVY8_1X16
>> 	0x2008: MEDIA_BUS_FMT_YUYV8_2X8
>> 	0x2011: MEDIA_BUS_FMT_YUYV8_1X16
>> 	0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
>> 	0x100a: MEDIA_BUS_FMT_RGB888_1X24
>> 	0x100c: MEDIA_BUS_FMT_RGB888_2X12_LE
>> 	0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
>> 	0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
>> 	0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
>> 	0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
>> 	0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
>> 	0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
>> 	0x3008: MEDIA_BUS_FMT_SBGGR12_1X12
>> 	0x3019: MEDIA_BUS_FMT_SBGGR14_1X14
>> 	0x301d: MEDIA_BUS_FMT_SBGGR16_1X16
>> 	0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
>> 	0x3010: MEDIA_BUS_FMT_SGBRG12_1X12
>> 	0x301a: MEDIA_BUS_FMT_SGBRG14_1X14
>> 	0x301e: MEDIA_BUS_FMT_SGBRG16_1X16
>> 	0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
>> 	0x3011: MEDIA_BUS_FMT_SGRBG12_1X12
>> 	0x301b: MEDIA_BUS_FMT_SGRBG14_1X14
>> 	0x301f: MEDIA_BUS_FMT_SGRBG16_1X16
>> 	0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
>> 	0x3012: MEDIA_BUS_FMT_SRGGB12_1X12
>> 	0x301c: MEDIA_BUS_FMT_SRGGB14_1X14
>> 	0x3020: MEDIA_BUS_FMT_SRGGB16_1X16
>> 	0x2001: MEDIA_BUS_FMT_Y8_1X8
>> 	0x200a: MEDIA_BUS_FMT_Y10_1X10
>> 	0x2013: MEDIA_BUS_FMT_Y12_1X12
>>
>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>> ---
>>   drivers/staging/media/imx/imx-media-utils.c | 19 +++++++++++++++----
>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
>> index d61a8f4533dc..5f8604db4dd4 100644
>> --- a/drivers/staging/media/imx/imx-media-utils.c
>> +++ b/drivers/staging/media/imx/imx-media-utils.c
>> @@ -254,7 +254,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>>   		       bool allow_bayer)
>>   {
> This function is becoming confusing. I think you should add some comments explaining
> what the function does. Specifically the fourcc and code arguments.
>
> Can both be non-NULL? Or only one of the two? I think that if fourcc is non-NULL you
> enumerate over the V4L2 pixelformats, if code is non-NULL, then you enumerate over
> the mediabus codes.
>
> If so, then I think it would be easier to understand if you just make two functions:
> enum_formats and enum_codes, rather than trying to merge them into one.

I don't think the function is that confusing, but I'm fine with 
splitting it into enum_formats() and enum_codes().

I do agree it needs some comments describing how it works. I think my 
suggestion to rename the index that counts entries that match the search 
criteria to "match_index" will also help to follow the code.


Steve

>
> Patches 1 and 2 of this series look good, so I'll take those.
>
> Regards,
>
> 	Hans
>
>>   	const struct imx_media_pixfmt *fmt;
>> -	unsigned int i, j = 0;
>> +	unsigned int i, j, k = 0;
>>   
>>   	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
>>   		fmt = &pixel_formats[i];
>> @@ -264,18 +264,29 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>>   		    (!allow_bayer && fmt->bayer))
>>   			continue;
>>   
>> -		if (index == j)
>> +		if (fourcc && index == k)
>>   			break;
>>   
>> -		j++;
>> +		if (!code) {
>> +			k++;
>> +			continue;
>> +		}
>> +
>> +		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
>> +			if (index == k)
>> +				goto out;
>> +
>> +			k++;
>> +		}
>>   	}
>>   	if (i == ARRAY_SIZE(pixel_formats))
>>   		return -EINVAL;
>>   
>> +out:
>>   	if (fourcc)
>>   		*fourcc = fmt->fourcc;
>>   	if (code)
>> -		*code = fmt->codes[0];
>> +		*code = fmt->codes[j];
>>   
>>   	return 0;
>>   }
>>

