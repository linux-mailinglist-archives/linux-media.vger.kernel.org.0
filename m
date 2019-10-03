Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0FA0C99EB
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 10:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfJCIaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 04:30:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44324 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfJCIaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 04:30:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id q11so1092765lfc.11
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+mhnw60zOlslfr3Z5bOz20vhrIEY/BCAZF11zDcGHTo=;
        b=u+0UI8NS3DZHzoA3XH2LdDbfcdPBe0PNFnTjBWkSohK8q5hztZGdknpMQZ18s7oyBa
         BRjHfF2OcohXqGKaPTwuOVdMOogPgXUX/45/wwSl0AIeMvLns1Hcb5L0hFqUqEP8ZsaN
         ED9dcDYoTCVRhF8BdiRL/L5MX7EEYKsKnCAVijwY56zgzM04tdjYu0ZW3BPMo0vpqE9A
         DgAcCEqO/VW93J6XgHf8yl7ooeiG8aqwY1u3EKqG++aA+xL0dFgmJtDboKVbNsBAj6wb
         QAsGcVpgo/ENX6UizrOk0rEkgMkQeYTvdMXRQ26Rxp7U0lL4BykPzRcqanaRYIxrZCp0
         7f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+mhnw60zOlslfr3Z5bOz20vhrIEY/BCAZF11zDcGHTo=;
        b=t1jUu3P3aBH7UbG+0uGQglp5FP6IHFMFZ9C+9kJY4R6XFtF2JrCAaaZSPIRk9wzyfQ
         9XbSWSSGiCZPjuU+/BXgzvg2bIxHGox6J9160QXP/vFe1NeKMN8ChUlz4yLU2fc3Cqwo
         MgTKesQu5fTT4xL3rUBu7wrQlQywWut0pW2Nq4TOVVgnV/h9MAzL/hMKJOStuw7PLpbr
         JabZ91tlEUFfk0zKTfk3LWFDDUyXSBteOJNh4y+49cZOQS8eO03ts87/OP/LAxL4EEow
         w7ELH3/dsmu+HUId/P4mStZdIZr4D/WgOSSgx7H7ru7z34nf1DtDqmmwTURUuavVqDrD
         +U4A==
X-Gm-Message-State: APjAAAW03We3bt56Kr4v+WcCH7p20JhxuJ7HjirYRHjL2xC9hBg4dm4s
        DEQmgJPdebgF1BFfcKlrFmt+0C+hkbM=
X-Google-Smtp-Source: APXvYqxhKqLJ1Z2f71GUNdp1CkL8cy5bIaRN65o/xvQPEV+XiTpJRZlflpZBCjHMxKz0z1y2vI/mYA==
X-Received: by 2002:a19:810:: with SMTP id 16mr4906792lfi.110.1570091411801;
        Thu, 03 Oct 2019 01:30:11 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id e29sm369128ljb.105.2019.10.03.01.30.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 01:30:11 -0700 (PDT)
Subject: Re: venus: venc: Fix enum frameintervals - was: [GIT PULL for v5.5]
 Venus updates, take 2
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org
References: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
 <20191002110958.2835d1ac@coco.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <59991fdf-4530-cbc5-7b6c-2de08ea06312@linaro.org>
Date:   Thu, 3 Oct 2019 11:30:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002110958.2835d1ac@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 10/2/19 5:09 PM, Mauro Carvalho Chehab wrote:
> Em Wed,  2 Oct 2019 14:29:53 +0300
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
>> Hi Mauro,
>>
>> The Venus driver updates include:
>>
>> * three fixes: fail to suspend, enum frameinterval issue with encoder
>> and frequency table modifications for v3 to handle performance issues.
>> * two new features: interconnect bandwidth support on v4 and more precise
>> clock-scaling on v4.
>>
>> Please pull.
>>
>> Stanimir Varbanov (3):
>>       venus: venc: Fix enum frameintervals
> 
>> From c430fca8f2b9b7274a1186f85b69c469378dbd8a Mon Sep 17 00:00:00 2001
>> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> Date: Tue, 22 Jan 2019 12:53:22 +0200
>> Subject: venus: venc: Fix enum frameintervals
>> To: Linux Media Mailing List <linux-media@vger.kernel.org>
>> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
>>
>> This fixes an issue when setting the encoder framerate because of
>> missing precision. Now the frameinterval type is changed to
>> TYPE_CONTINUOUS and step = 1. Also the math is changed when
>> framerate property is called - the firmware side expects the
>> framerate in Q16 values.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/venc.c | 23 ++++++++++++++++-------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> index 1b7fb2d5887c..d0a97754ef18 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -22,6 +22,7 @@
>>  #include "venc.h"
>>  
>>  #define NUM_B_FRAMES_MAX	4
>> +#define FRAMERATE_FACTOR	BIT(16)
>>  
>>  /*
>>   * Three resons to keep MPLANE formats (despite that the number of planes
>> @@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>>  	struct venus_inst *inst = to_inst(file);
>>  	const struct venus_format *fmt;
>>  
>> -	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
>> +	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
>>  
>>  	fmt = find_format(inst, fival->pixel_format,
>>  			  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> @@ -599,12 +600,12 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>>  	    fival->height < frame_height_min(inst))
>>  		return -EINVAL;
>>  
>> -	fival->stepwise.min.numerator = 1;
>> -	fival->stepwise.min.denominator = frate_max(inst);
>> -	fival->stepwise.max.numerator = 1;
>> -	fival->stepwise.max.denominator = frate_min(inst);
>> +	fival->stepwise.min.numerator = FRAMERATE_FACTOR;
>> +	fival->stepwise.min.denominator = frate_max(inst) * FRAMERATE_FACTOR;
>> +	fival->stepwise.max.numerator = FRAMERATE_FACTOR;
>> +	fival->stepwise.max.denominator = frate_min(inst) * FRAMERATE_FACTOR;
> 
> Hmm... this change seems plain wrong to me... Why do you want to change
> the numerator? I mean:
> 
> 	1/frame_min(inst)
> 
> is equal to:
> 
> 	(const * 1) / (const * frame_min(inst))
> 
> Also, on every other driver, the returned fractions are normalized.

Agree, this looks suspicious. I will drop this patch from pull request.

I will look into the other drivers once again.

> 
>>  	fival->stepwise.step.numerator = 1;
>> -	fival->stepwise.step.denominator = frate_max(inst);
>> +	fival->stepwise.step.denominator = 1;
>>  
>>  	return 0;
>>  }
>> @@ -649,6 +650,7 @@ static int venc_set_properties(struct venus_inst *inst)
>>  	struct hfi_quantization quant;
>>  	struct hfi_quantization_range quant_range;
>>  	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
>> +	u64 framerate;
>>  	int ret;
>>  
>>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
>> @@ -659,9 +661,16 @@ static int venc_set_properties(struct venus_inst *inst)
>>  	if (ret)
>>  		return ret;
>>  
>> +	framerate = inst->timeperframe.denominator * FRAMERATE_FACTOR;
>> +	/* next line is to round up */
>> +	framerate += inst->timeperframe.numerator - 1;
>> +	do_div(framerate, inst->timeperframe.numerator);
>> +
>>  	ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
>>  	frate.buffer_type = HFI_BUFFER_OUTPUT;
>> -	frate.framerate = inst->fps * (1 << 16);
>> +	frate.framerate = framerate;
>> +	if (frate.framerate > frate_max(inst) * FRAMERATE_FACTOR)
>> +		frate.framerate = frate_max(inst) * FRAMERATE_FACTOR;
> 
> You should not assume that userspace will be multiplying by the
> frame factor. I mean, the driver should work the same way, no matter
> if userspace is setting the framerate as:
> 
> 	1/30, 2/60, ... n/(n *30)

Agreed.

-- 
regards,
Stan
