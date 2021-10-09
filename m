Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB98427E01
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 01:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhJIXMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 19:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhJIXMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 19:12:49 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBA2C061570
        for <linux-media@vger.kernel.org>; Sat,  9 Oct 2021 16:10:51 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m22so42086019wrb.0
        for <linux-media@vger.kernel.org>; Sat, 09 Oct 2021 16:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=e3cmpRwFcAwV+nvE0y7vx/ACbhng5TfW4YSGF+0+Qew=;
        b=YYcz263Wi9+/On1IdNZLjZaZJy7ppLmuw0SSD8Bjraz/PysBkatELRWMjW+xDWfG+y
         YVJiGiZ/8h+vk1+TMnmkKHvuzlBnRYRpvsrJhy/FR6nM/PuAyQl4Pd/i4s7uytm+5o0O
         NKXaDztnboITjeanoy+xNAXoNDNZmxInybn429Heowmn9ohq4TusSljxfJLUR+9JwK29
         fzwV97JEbOwk+9TvvodSPSrmkTdP2RtFEiIp5OGfr7P8HoQuJ4w0AOMeusY2ZHpjVmt+
         /MuEoJSZ90bCUp8afGdPAmNnS4DSoTC61p267qweybe92bwH0wi+ollvuFWjRewLo/SJ
         xw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=e3cmpRwFcAwV+nvE0y7vx/ACbhng5TfW4YSGF+0+Qew=;
        b=YnfbGFHr/PXzLKlQGWXXYj6UoZg9JccZ+VwHj2Ev56EA9eDOjIMnAo4skddNu11xgf
         9gN0PdSRgwJlWhYboNZm2TevmpvX3B1Wi1z/8t8XeX/tWQAQ4qEmjx4rG7l6S43KIrRl
         feMcQMt6Rqlfa8jCzp0t32v/FbA5pNUFABFo/pDGcCQ33xOqail9xZ+DET/Jp2+f6X3u
         A9UcJ/EYUohlIQdzMfiJf9oOjHnOpm9QUuoC2/rbGtqY0vbEziKcUjhJkAoslHf1jsQw
         MwfJCRdXt+O2KF37f+fhgTwr6k+zPe66UQa+pTfeZ6z37kbXCLYeP+guftU0LTCUHQPl
         jSwQ==
X-Gm-Message-State: AOAM533OYoOYr7rAqBOSfGPIKz8eaML73/4xS3JxsoER7l5tIg+Uf5tf
        crwFebXKEV2pGdNtMj7hR0k=
X-Google-Smtp-Source: ABdhPJwUKG/QcZnsTgPd+BeeG3IJdnQ3vJ1iVG0AQkVP3wEsTqsWwnXbtIR02hADU3lpKAMSdp3TOw==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr11856390wrm.90.1633821049900;
        Sat, 09 Oct 2021 16:10:49 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l18sm9824535wmh.39.2021.10.09.16.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 16:10:48 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
From:   Daniel Scally <djrscally@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        paul.kocialkowski@bootlin.com
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-9-djrscally@gmail.com>
 <20210810142934.GE3@paasikivi.fi.intel.com>
 <74125e27-abe3-c596-53e6-4416cabfcc63@gmail.com>
 <YRXhYP7H639DuQUK@pendragon.ideasonboard.com>
 <189aa86c-68ec-e3a0-9804-209f3d4b1f08@gmail.com>
 <YRgt5B5IyBZiA1pG@pendragon.ideasonboard.com>
 <e0043129-3ab5-d614-310e-f6f7822bb200@gmail.com>
Message-ID: <ce78eedb-62cd-beeb-c80e-6045ac41087c@gmail.com>
Date:   Sun, 10 Oct 2021 00:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e0043129-3ab5-d614-310e-f6f7822bb200@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

On 09/09/2021 23:36, Daniel Scally wrote:
> Hi Paul
>
> On 14/08/2021 21:56, Laurent Pinchart wrote:
>> Hi Daniel,
>>
>> On Fri, Aug 13, 2021 at 10:45:48AM +0100, Daniel Scally wrote:
>>> On 13/08/2021 04:05, Laurent Pinchart wrote:
>>>> On Tue, Aug 10, 2021 at 11:07:22PM +0100, Daniel Scally wrote:
>>>>> On 10/08/2021 15:29, Sakari Ailus wrote:
>>>>>> On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
>>>>>>> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>>>>>>  				     0, 0, ov8865_test_pattern_menu);
>>>>>>>  
>>>>>>>  	/* Blanking */
>>>>>>> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
>>>>>> Is the result in relation with the analogue crop size? Based on the above
>>>>>> it wouldn't seem like that.
>>>>> This was a weird one actually. My understanding was that HTS should
>>>>> always be >= the horizontal crop plus hblank...but that doesn't hold
>>>>> true for some of this driver's modes and nor does it hold true when
>>>>> running the camera in Windows (I checked the registers whilst running
>>>>> it). So I went with setting hblank to 0 if the mode's HTS exceeded the
>>>>> horizontal crop as the only way I could see to reconcile that.
>>>> There's something very fishy here, HTS is, by definition, equal to the
>>>> analog crop width plus the horizontal blanking. I suspect that the
>>>> values in ov8865_modes are wrong.
>>> I thought that initially too but confirming that the same thing happened
>>> running windows switched me into "you're probably wrong" mode. If we're
>>> confident that the HTS is likely wrong though I can add an extra patch
>>> to bring those into lining with that definition.
>> I think it's worth investigating this. The hblank computed here is
>> clearly incorrect, and would thus be useless for all practical purposes.
>> As usual with OmniVision, the datasheet is also quite useless.
>>
>> Paul, do you have any information about this ?
>
> A gentle ping on this...I played around setting HTS / VTS values whilst
> the camera was running windows; and it behaves as you'd expect it to
> (raising/lowering the frame rate), so as far as I can tell the sensor
> itself isn't doing anything unusual...


So, looking at this again. The mode in question has:

.output_size_x      = 3264
.hts                         = 1944
.output_size_y      = 2448
.vts                         = 2470
.frame_interval    = { 1, 30 }
   
And the driver sets a link frequency of 360MHz. That makes the pixel
rate, depending on whether we're looking at 2 or 4 data lanes, either
144MHz or 288MHz. I think the HTS there is calculated so that the 2 lane
configuration can make 30 FPS. Perhaps it would be better to default in
the mode to the "ideal" 4-lane 30fps setting (by upping the .hts to
3888), but rather than hardcoding the frame interval there, calculate it
for .g_frame_interval() based on the number of data lanes found in the
bus (accepting that if we only have 2 it's going to be 15fps rather than
30, which doesn't seem unreasonable for that resolution)

