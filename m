Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BDC2EC2A7
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 18:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbhAFRo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 12:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbhAFRo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 12:44:26 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32645C06134C;
        Wed,  6 Jan 2021 09:43:46 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 91so3174909wrj.7;
        Wed, 06 Jan 2021 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IWjwx8EX/O5fuAhGOnd0RZp7TYOHdWpZ4wl+W1Ntw2Q=;
        b=Oz3KbCf1IUr90hyHxVLs688OWcnsdbAhF/T0kn3BDG4DuJTU2tmFppEpUBZuWd+X+U
         Be2MHvQxlAbvsT8WBz8C54WJ8IoAqO640m/y1spG9RKrSfmt/EjYsfvbxAmI+JRPy6by
         lODa51abovj81p7HcgMQm7V4znQrL6N4nEWlujAW5uAUmFRCDkK42hjputh5JBCpleGY
         UcittCZszMxb3Ncu86Xpvx1lBan0wYluu/YFKQ7xAhzg3uzHPBAW/wK5TnemeXybGAY0
         vSRb95ICrebfcMm3iD5OlPSgEqED5+F+fEl7+/IpVFdczoGTsRbQ3w+1aQB6WLKQnsQI
         +awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IWjwx8EX/O5fuAhGOnd0RZp7TYOHdWpZ4wl+W1Ntw2Q=;
        b=MtMMrDUcYgUkQbr1T9Bbpged7xNXVJD+jIDq6NyML1k050C0urQNooHGSNrwPwpmdn
         gjUNhIP2bVa5ap51SCPqnDz6dydTuphc63F+wz162dPl3DZ/hoPvQZyS0fyf8HUiCdGj
         66VxeAwX6LlJXxXeZpJ1l8qQ0s40H/IZhljtDojWM4DLrklj7KRwSSaMSWDNldo32KbR
         /7Yod/yu5B2L2vZ1t1RWqJuM6lrZ/IE6jTs2Gl/OM3839bedB4ocpqtluPT95cDUAtdd
         QkDvZTT8O91pVIZkiyj7y2uZ/fMEJs8zy7H9acRrdBQGKW0uyl0PSVI7A7FmRiK5eds2
         5M2A==
X-Gm-Message-State: AOAM530fB7MsKAEPK8PEqT1cByaM1z8Z5KeF09WoSseYqc9JFh8rJ4rr
        1OhI4z1c3SXYWisesu6YfZRhYRPmy9gyCZM7
X-Google-Smtp-Source: ABdhPJzKmvII12FbkhJlzKllxcCzY7wrxNwxJLJKhbr5VlHqf67igJZzaTrC6vRkQAYryUUbf67JCQ==
X-Received: by 2002:a5d:58d7:: with SMTP id o23mr5453230wrf.288.1609955024644;
        Wed, 06 Jan 2021 09:43:44 -0800 (PST)
Received: from [192.168.1.2] (84-238-151-182.ip.btc-net.bg. [84.238.151.182])
        by smtp.gmail.com with ESMTPSA id s205sm3775579wmf.46.2021.01.06.09.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 09:43:43 -0800 (PST)
Subject: Re: [PATCH] media: atomisp: ov2722: replace hardcoded function name
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20210105202945.26913-1-fil.kolev@gmail.com>
 <X/VsF364jpGz6oze@kroah.com>
From:   Filip Kolev <fil.kolev@gmail.com>
Message-ID: <dcdda829-89d6-badd-4f22-72d95d24e9e3@gmail.com>
Date:   Wed, 6 Jan 2021 19:43:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <X/VsF364jpGz6oze@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 06-Jan-21 09:51, Greg Kroah-Hartman wrote:
> On Tue, Jan 05, 2021 at 10:29:18PM +0200, Filip Kolev wrote:
>> There is a debug message using hardcoded function name instead of the
>> __func__ macro. Replace it.
>>
>> Report from checkpatch.pl on the file:
>>
>> WARNING: Prefer using '"%s...", __func__' to using 'ov2722_remove', this function's name, in a string
>> +	dev_dbg(&client->dev, "ov2722_remove...\n");
>>
>> Signed-off-by: Filip Kolev <fil.kolev@gmail.com>
>> ---
>>   drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> index eecefcd734d0e..21d6bc62d452a 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> @@ -1175,7 +1175,7 @@ static int ov2722_remove(struct i2c_client *client)
>>   	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>   	struct ov2722_device *dev = to_ov2722_sensor(sd);
>>   
>> -	dev_dbg(&client->dev, "ov2722_remove...\n");
>> +	dev_dbg(&client->dev, "%s...\n", __func__);
> 
> dev_dbg() provides the function name already, and this is just a "trace"
> call, and ftrace should be used instead, so the whole line should be
> removed entirely.

Thank you for the review!

How do I go about this? Do I amend the patch and re-send as v2 or create 
a new patch entirely?
Newbie here, doing this as part of the Eudyptula challenge, so I very 
much appreciate everyone's patience.

> 
> thanks,
> 
> greg k-h
> 
