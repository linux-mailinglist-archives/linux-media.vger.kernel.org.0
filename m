Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E06405FA7
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 00:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343811AbhIIWiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 18:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbhIIWiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 18:38:08 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9160C061574
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 15:36:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id z4so4723423wrr.6
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 15:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gcBWO4lWz6pUB/Y4wp3CMSK6bP90xW4dXU0RgE3HLUA=;
        b=i6s13KgxRihH7pynDORrlDMBkMWh0e2IV55p8NdgCoxMMX2LlnEP0Gmkfc/jJdaykn
         Uwzn7UENA9+5ycZQTmKOnPYJEcGf6eEhH5Xu63amqGq0hVA1/p+7PFXuQE/CWlcljf0E
         HjA4B8aai5oF0zbwgZ3am/9gp2b0nh0AZRrg4ROL/2cLYnS97w0HNUU+K0R1NB4m+pBW
         1tS7AqAEyx9ilzvfKvre6PnS5P0AzC2YIV+59q1rDBx94W7KOEhnJdJ7wtx0uNK3KqIp
         Ik0Dtfyj7aw0tBP71/WuT9jzLSS9Lzro7GW8mioWhMa6EZoEhljc9xn3RDlmhybdGoEX
         Tp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gcBWO4lWz6pUB/Y4wp3CMSK6bP90xW4dXU0RgE3HLUA=;
        b=B+zdW30GpFwFwh3I6hs/0PhQ1sPvCvTCUAXRoiEY3U2R/zyTDq28TZ8VTjHEcK/jwa
         /PV8VgGOn73qSegVTTiEwxy44S6qP7ATtRFZhiG7UfvhobSwgb9bJAOyQ5/iDYC8cznu
         hvByBrhNt58EWkLBCWnYdxUl4V3nG6//sIX3UUaNIMO8ZV8Mcg1WyrK0giO9oLR2KkAX
         z4Yoyiq8zfKrcpQNbQmI6IYtJ+ce+m9z81TXcW/wj/UOTz1fvdh8wbyj1JVL3ox4N2oo
         lWrr4PTjTgM+++6jWp7FSQh6CxRoccvm2FBV79FLU/zVCzy3mgJC0b70abJdjdVVet82
         soyQ==
X-Gm-Message-State: AOAM531Ap1HRLM+mv5zEd44c7WXv7FY6dQ/GIaH+e6m+aKCNQWgA7Ysv
        81+PQLiN7cQfT+gbJJlOa0Q=
X-Google-Smtp-Source: ABdhPJwJmfC2uhzSr42q3mdi/WBWZjnYqIiVV1iBw8W7zVQ9VCC6w4J7PebbX2Xco8OTCV94u5VVRw==
X-Received: by 2002:a05:6000:352:: with SMTP id e18mr6227365wre.238.1631227017413;
        Thu, 09 Sep 2021 15:36:57 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h18sm2952168wrb.33.2021.09.09.15.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 15:36:56 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e0043129-3ab5-d614-310e-f6f7822bb200@gmail.com>
Date:   Thu, 9 Sep 2021 23:36:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRgt5B5IyBZiA1pG@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul

On 14/08/2021 21:56, Laurent Pinchart wrote:
> Hi Daniel,
>
> On Fri, Aug 13, 2021 at 10:45:48AM +0100, Daniel Scally wrote:
>> On 13/08/2021 04:05, Laurent Pinchart wrote:
>>> On Tue, Aug 10, 2021 at 11:07:22PM +0100, Daniel Scally wrote:
>>>> On 10/08/2021 15:29, Sakari Ailus wrote:
>>>>> On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
>>>>>> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>>>>>  				     0, 0, ov8865_test_pattern_menu);
>>>>>>  
>>>>>>  	/* Blanking */
>>>>>> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
>>>>> Is the result in relation with the analogue crop size? Based on the above
>>>>> it wouldn't seem like that.
>>>> This was a weird one actually. My understanding was that HTS should
>>>> always be >= the horizontal crop plus hblank...but that doesn't hold
>>>> true for some of this driver's modes and nor does it hold true when
>>>> running the camera in Windows (I checked the registers whilst running
>>>> it). So I went with setting hblank to 0 if the mode's HTS exceeded the
>>>> horizontal crop as the only way I could see to reconcile that.
>>> There's something very fishy here, HTS is, by definition, equal to the
>>> analog crop width plus the horizontal blanking. I suspect that the
>>> values in ov8865_modes are wrong.
>> I thought that initially too but confirming that the same thing happened
>> running windows switched me into "you're probably wrong" mode. If we're
>> confident that the HTS is likely wrong though I can add an extra patch
>> to bring those into lining with that definition.
> I think it's worth investigating this. The hblank computed here is
> clearly incorrect, and would thus be useless for all practical purposes.
> As usual with OmniVision, the datasheet is also quite useless.
>
> Paul, do you have any information about this ?


A gentle ping on this...I played around setting HTS / VTS values whilst
the camera was running windows; and it behaves as you'd expect it to
(raising/lowering the frame rate), so as far as I can tell the sensor
itself isn't doing anything unusual...

>>>>>> +	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
>>>>>> +					  hblank, 1, hblank);
>>>>>> +
>>>>>> +	if (ctrls->hblank)
>>>>>> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>> +
>>>>>>  	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
>>>>>>  	vblank_def = mode->vts - mode->output_size_y;
>>>>>>  	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
