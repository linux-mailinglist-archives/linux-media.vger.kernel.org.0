Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D6BE56CA
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 00:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfJYW7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 18:59:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42997 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfJYW7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 18:59:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so4039489wrs.9
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2019 15:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FjwWkiMcG8vhp4z1YYfslDTubAP0PdUKTto/GPKsY8Y=;
        b=fkH7K8aAbC/mDoaIsH0tKYPYBIfo7eXlHmI2TW3vwz7SMuNLKXz2b9dS5ubyBUUdtj
         6aPvt+NgoimwmK/oPAfHSUGbyQfX/0GPnM0qzZ/GCWawfZR+jyOU01xe74MOICQII3rA
         DtJxm7Ov1vIXo8332/O91lW3rbOfMqHUc/Lnl0H1Z2riqhn8dxWHqWvxfUGG5+wppoVa
         HtRtlbDyIGJY/moL++L4ZnTR7G5TdlNeCYwkddETkZWCMmULlqzz2pGw6/d3ThhaQSar
         6zHbHO1blrvm2QD+PBnKk00HF1cDwBWzE6gYKeeq5qPF4e8xqCELq4B4TjL9e6yY7dN+
         zVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FjwWkiMcG8vhp4z1YYfslDTubAP0PdUKTto/GPKsY8Y=;
        b=qkFMT45EoD33lG51/S9WQuEdw9LW4dc2VV2IHuxgUn1d8/6zIQ0XNytfHxQkEgakwF
         uGyRaWEiu/bDsalLfdT82UR8vt0R9Ay/H0cRPDdJuCU1Kb4R3SHnwCVmstj8wLKeYrta
         OJhfa77M3Dyr1bMw9t/tIqnf6ZdF43XFG+aMBVw6ps6ryt76KTj1LxfTN1H/Sf2QghRp
         3jNp2vrsZGxj2gaQ3BcNpYTh5q87QVvwIifYS2RspxSyuUOSIXcc73IKET1UZGqJUPHP
         3cvwh14lG7/HoJ3zLcAeKe+2CVq/snPj3W4FbC2RACxB4tC9WLcOtC04MUclz5AB21wt
         E4pA==
X-Gm-Message-State: APjAAAXU+0fGNiX4SdAXHl/IhWnmoWOlureQ9eyh0ulHd2MLqZ3P4SSu
        ToAzvZMj0x8vP6qUy/7L/NH4bGP3
X-Google-Smtp-Source: APXvYqy2ERD0gjrJ8at5kCjlXdAk7xcHHNh3EY43AMIIyDhVohybDxeO6K1GFoMG3Rfa/ZBtGC+/uA==
X-Received: by 2002:adf:e903:: with SMTP id f3mr5285162wrm.121.1572044376017;
        Fri, 25 Oct 2019 15:59:36 -0700 (PDT)
Received: from [172.30.90.16] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id a186sm4098131wmd.3.2019.10.25.15.59.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 15:59:35 -0700 (PDT)
Subject: Re: [PATCH 3/3] media: imx: fix media bus format enumeration
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20190912160122.5545-1-p.zabel@pengutronix.de>
 <20190912160122.5545-3-p.zabel@pengutronix.de>
 <d30091d5-5e45-9682-7c23-813eff2b42c5@xs4all.nl>
 <6547e18f-e3d5-4e80-4e20-5eaf9ee0b86c@gmail.com>
Message-ID: <3ec9cffd-578d-2cd7-325d-98f1f087694e@gmail.com>
Date:   Fri, 25 Oct 2019 15:59:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6547e18f-e3d5-4e80-4e20-5eaf9ee0b86c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Philipp,

On 10/25/19 2:48 PM, Steve Longerbeam wrote:
> Hi Hans,
>
> On 9/27/19 12:33 AM, Hans Verkuil wrote:
>> On 9/12/19 6:01 PM, Philipp Zabel wrote:
>>> Iterate over all media bus formats, not just over the first format in
>>> each imx_media_pixfmt entry.
>>>
>>> Before:
>>>
>>>    $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
>>>    ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
>>>     0x2006: MEDIA_BUS_FMT_UYVY8_2X8
>>>     0x2008: MEDIA_BUS_FMT_YUYV8_2X8
>>>     0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
>>>     0x100a: MEDIA_BUS_FMT_RGB888_1X24
>>>     0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
>>>     0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
>>>     0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
>>>     0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
>>>     0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
>>>     0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
>>>     0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
>>>     0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
>>>     0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
>>>     0x2001: MEDIA_BUS_FMT_Y8_1X8
>>>     0x200a: MEDIA_BUS_FMT_Y10_1X10
>>>
>>> After:
>>>
>>>    $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
>>>    ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
>>>     0x2006: MEDIA_BUS_FMT_UYVY8_2X8
>>>     0x200f: MEDIA_BUS_FMT_UYVY8_1X16
>>>     0x2008: MEDIA_BUS_FMT_YUYV8_2X8
>>>     0x2011: MEDIA_BUS_FMT_YUYV8_1X16
>>>     0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
>>>     0x100a: MEDIA_BUS_FMT_RGB888_1X24
>>>     0x100c: MEDIA_BUS_FMT_RGB888_2X12_LE
>>>     0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
>>>     0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
>>>     0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
>>>     0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
>>>     0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
>>>     0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
>>>     0x3008: MEDIA_BUS_FMT_SBGGR12_1X12
>>>     0x3019: MEDIA_BUS_FMT_SBGGR14_1X14
>>>     0x301d: MEDIA_BUS_FMT_SBGGR16_1X16
>>>     0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
>>>     0x3010: MEDIA_BUS_FMT_SGBRG12_1X12
>>>     0x301a: MEDIA_BUS_FMT_SGBRG14_1X14
>>>     0x301e: MEDIA_BUS_FMT_SGBRG16_1X16
>>>     0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
>>>     0x3011: MEDIA_BUS_FMT_SGRBG12_1X12
>>>     0x301b: MEDIA_BUS_FMT_SGRBG14_1X14
>>>     0x301f: MEDIA_BUS_FMT_SGRBG16_1X16
>>>     0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
>>>     0x3012: MEDIA_BUS_FMT_SRGGB12_1X12
>>>     0x301c: MEDIA_BUS_FMT_SRGGB14_1X14
>>>     0x3020: MEDIA_BUS_FMT_SRGGB16_1X16
>>>     0x2001: MEDIA_BUS_FMT_Y8_1X8
>>>     0x200a: MEDIA_BUS_FMT_Y10_1X10
>>>     0x2013: MEDIA_BUS_FMT_Y12_1X12
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>   drivers/staging/media/imx/imx-media-utils.c | 19 +++++++++++++++----
>>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/imx/imx-media-utils.c 
>>> b/drivers/staging/media/imx/imx-media-utils.c
>>> index d61a8f4533dc..5f8604db4dd4 100644
>>> --- a/drivers/staging/media/imx/imx-media-utils.c
>>> +++ b/drivers/staging/media/imx/imx-media-utils.c
>>> @@ -254,7 +254,7 @@ static int enum_format(u32 *fourcc, u32 *code, 
>>> u32 index,
>>>                  bool allow_bayer)
>>>   {
>> This function is becoming confusing. I think you should add some 
>> comments explaining
>> what the function does. Specifically the fourcc and code arguments.
>>
>> Can both be non-NULL? Or only one of the two? I think that if fourcc 
>> is non-NULL you
>> enumerate over the V4L2 pixelformats, if code is non-NULL, then you 
>> enumerate over
>> the mediabus codes.
>>
>> If so, then I think it would be easier to understand if you just make 
>> two functions:
>> enum_formats and enum_codes, rather than trying to merge them into one.
>
> I don't think the function is that confusing, but I'm fine with 
> splitting it into enum_formats() and enum_codes().
>
> I do agree it needs some comments describing how it works. I think my 
> suggestion to rename the index that counts entries that match the 
> search criteria to "match_index" will also help to follow the code.
>

I added a comment block for find_format() and enum_format() in my 
media-tree github fork:

git@github.com:slongerbeam/mediatree.git, branch imx/philipp-pixfmts-cleanup

Steve

