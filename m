Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8102C443DE5
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 08:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhKCIAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhKCIAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:00:07 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CFFC06120A
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 00:57:29 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 71so1207261wma.4
        for <linux-media@vger.kernel.org>; Wed, 03 Nov 2021 00:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5YHWUd4lse98QX/WirSOM7ZvyRQfpVyUJzCCKqtMohY=;
        b=oocS7NDzjl6Ect2YswrYhjfJh1iM/ixgfGEBp+kjDNvQoToDxRc21Ni8RLXsYxrumW
         gecUr+4AKSj5JNoeLZ4NVVGgsTdp2elKsDdwZP7h50dRiYwTHg0J2rMs/tXSLiD1Zv/u
         9vnqxuWrqG1KXbOKVl+Y4r2uBTob4fFzWVI1pb1FpWz9kyNBCwl5B5dpVSfq1loeIZu7
         zFeUnJkXhU87g3fH8AkxyKPU6uAnhddywyHylQm1hYE3+bo5ZminJLYVcWtERML6Z8zr
         Jy4+72bGN8B/h8IZbqWaO5kJFUTXsY6Xx+vGe5sP2nuXtSGuoSAUDZsBtWMX4vRPMxlG
         X9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5YHWUd4lse98QX/WirSOM7ZvyRQfpVyUJzCCKqtMohY=;
        b=473FPv10S0H9zdETMz8RWAu+GLmfz1hF4Xy0jCui8AG5gZ64/f5qkLtHtiBO9yAr0y
         krzHK2fkX1nGMRkyHW5CzySRlyB5D0pqkaHz5i2GXylOxpjMetqiKo3vPdDreXdXVmSa
         A2kAOESAwr65r2/oJ9HnjR8ik4ao+P8nSsHzsfIf2KAxBDraHw03ba5RstMcgjaj8S3L
         fXAJne8LR7ufgPaRw94R9b9HjLs+DfjSWTOgZD6YaWXYNfhZpKswhlX+EwW/WhYdgYtq
         +Ez631TcgVXScTOWq7W0AhbNTrORbYz5zZOW1J7yl3I/0k/skJqIP/6X7nMHflj4gjXW
         zxWQ==
X-Gm-Message-State: AOAM530hQHVeINg6lQtSherCeSBugA9fOM95cGyGPWVPhaLg8SfR/EEQ
        XVTUgtgVmqAt9P8f3nZzH1I=
X-Google-Smtp-Source: ABdhPJz8sjkie2pEqBp9bAoPJyuX3JBdUAaGmeWtCbhBsVKoumTJqJYLOwriWFW3IIH+kQLsB42fVw==
X-Received: by 2002:a1c:ed02:: with SMTP id l2mr13476523wmh.115.1635926248043;
        Wed, 03 Nov 2021 00:57:28 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id m15sm1196521wmq.0.2021.11.03.00.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 00:57:27 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] media: i2c: ov5693: Rename ov5693_sw_standby() to
 ov5693_enable_streaming()
To:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20211101232144.134590-1-djrscally@gmail.com>
 <20211101232144.134590-5-djrscally@gmail.com>
 <0e565823-735f-6472-7336-493e068b5abc@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <ba877e86-06f7-d384-ded3-88935b0fc69e@gmail.com>
Date:   Tue, 2 Nov 2021 09:29:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0e565823-735f-6472-7336-493e068b5abc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 02/11/2021 09:24, Hans de Goede wrote:
> Hi,
>
> On 11/2/21 00:21, Daniel Scally wrote:
>> From: Hans de Goede <hdegoede@redhat.com>
>>
>> ov5693_sw_standby() starts/stops streaming rename it so that it is actually
>> named after what it does.
>>
>> This also removes the weird enable inverting going on before.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov5693.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
>> index 8ad51f8f88cf..2613bad49f78 100644
>> --- a/drivers/media/i2c/ov5693.c
>> +++ b/drivers/media/i2c/ov5693.c
>> @@ -742,13 +742,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
>>  	return ret;
>>  }
>>  
>> -static int ov5693_sw_standby(struct ov5693_device *ov5693, bool standby)
>> +static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>>  {
>>  	int ret = 0;
>>  
>>  	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
>> -			 standby ? OV5693_STOP_STREAMING :
>> -				   OV5693_START_STREAMING, &ret);
>> +			 enable ? OV5693_STOP_STREAMING :
>> +				  OV5693_START_STREAMING, &ret);
> In this version of this patch the function still behaves as if it is
> setting the sensor in a standby mode, my original version had this:
>
> 	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
> 			 enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
> 			 &ret);
>
> Which makes the function behave more logical.
>
>
>>  
>>  	return ret;
>>  }
>> @@ -784,9 +784,9 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
>>  		return ret;
>>  	}
>>  
>> -	ret = ov5693_sw_standby(ov5693, true);
>> +	ret = ov5693_enable_streaming(ov5693, true);
> And my original version changes the true to false here, stopping
> streaming on init (as before when setting standby to true,
> including the error messages being different:
>
> 	ret = ov5693_enable_streaming(ov5693, false);
> 	if (ret)
> 		dev_err(ov5693->dev, "%s stop streaming error\n", __func__);
>
>
>
>>  	if (ret)
>> -		dev_err(ov5693->dev, "software standby error\n");
>> +		dev_err(ov5693->dev, "enable streaming error\n");
>>  
>>  	return ret;
>>  }
>> @@ -1119,7 +1119,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>>  	}
>>  
>>  	mutex_lock(&ov5693->lock);
>> -	ret = ov5693_sw_standby(ov5693, enable);
>> +	ret = ov5693_enable_streaming(ov5693, enable);
> And this used to be a change from !enable -> enable.
>
> Note that the current version cannot work, you pass enable
> (instead of !enable) but ov5693_enable_streaming() still
> sends OV5693_STOP_STREAMING if enable is true, so you are
> now stopping streaming when called to enable it ?
>
>>  	mutex_unlock(&ov5693->lock);
>>  
>>  	if (ret)
>>
> Besides this needing some work, it is fine with me, and
> I believe that it is best, to just squash this and
> patch 5/5 into patch 2 (since your introducing this
> driver in this series it is a bit to then apply fixes
> to it in the same series).


OK; I'll squash them then. Sorry to have messed up the application too!
The patch wouldn't apply cleanly due to other changes I'd made, and
apparently I wasn't nearly as careful sorting it as I thought I had been.

>
> Regards,
>
> Hans
>
>
