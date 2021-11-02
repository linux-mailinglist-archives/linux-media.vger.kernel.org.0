Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C853442A50
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 10:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhKBJ0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 05:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54148 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhKBJ0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 05:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635845053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7R48U8t8AIKlxF+9KzGqeW1SSwaAaPIHUbXGY2LxpsE=;
        b=U72G3nBg7UAtniQH80hvsn/ygU+dPNf+yAEbdQ4oscfE+zKwjfuwW2zZHFVP9L4aRu38Af
        h1lyOjHK4SYXiLTIHlG4ivA9qSJAxDg7302DtHbAfkouwdvnYr/bXElFDTMw4oX5tYJxqy
        PfdUrYwfcF5Hlk41waE8Q52r2Kow4I4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-79Ia6VNOOheS0ms_v97IyA-1; Tue, 02 Nov 2021 05:24:12 -0400
X-MC-Unique: 79Ia6VNOOheS0ms_v97IyA-1
Received: by mail-ed1-f70.google.com with SMTP id m16-20020a056402431000b003dd2005af01so18196795edc.5
        for <linux-media@vger.kernel.org>; Tue, 02 Nov 2021 02:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7R48U8t8AIKlxF+9KzGqeW1SSwaAaPIHUbXGY2LxpsE=;
        b=Je34HgKOEacWAsYVAs9S1w2rnnQXN4L/yMqmzfrCOEXfxxYtL/7Ib71EUt5RSXDPzk
         gb/8WRfl/CufBxLCSFaHAhDOKHx4bnBkZQ9+L+vE7sFCxf+vkHtqCz9vZSq4mYbSZ+r6
         3Om++Pd2vfqV/uDrIQCCTr9RpfYF4/y2G+bWAepNM6nnwfMEPtDWaBfwvfY/ytCQkBZH
         R2Gdaz6zuT/XQHthmx29LWhKA9A7zKKHv+Msxfhxfv+NIg8v/49K+5aEk9qgxQpzR9ED
         soHCDsxtWSG5kXJ91Ib4huKygd1sdAOUti9E16v4e6irYbFAcWXWC427ftLWJBkuSB6v
         DJLg==
X-Gm-Message-State: AOAM531wtpSK4NSUsOS5QFGhIEgpNkV4YhFPS1xYB9RhBr1Wc6a44W9n
        vXSbwPLVzI+RExAxzPBEz9tHfA/PZKkfHix86x18sNoM4VxJqT6XlXWpSfjiItwVZH9nmeHu5F8
        b6rIOvHUIE7g9IPdlNy4CmXQ=
X-Received: by 2002:a17:907:d08:: with SMTP id gn8mr42833960ejc.395.1635845051159;
        Tue, 02 Nov 2021 02:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdbLYazozEP+/IsM9l+S2aXOnZdT5+j3zN+v7lfjm5cXpdY3/YES+aZrqJ9cJ1PDS3yS+a+A==
X-Received: by 2002:a17:907:d08:: with SMTP id gn8mr42833930ejc.395.1635845050915;
        Tue, 02 Nov 2021 02:24:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id he17sm8165248ejc.58.2021.11.02.02.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 02:24:10 -0700 (PDT)
Message-ID: <0e565823-735f-6472-7336-493e068b5abc@redhat.com>
Date:   Tue, 2 Nov 2021 10:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 4/5] media: i2c: ov5693: Rename ov5693_sw_standby() to
 ov5693_enable_streaming()
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20211101232144.134590-1-djrscally@gmail.com>
 <20211101232144.134590-5-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211101232144.134590-5-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/2/21 00:21, Daniel Scally wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> ov5693_sw_standby() starts/stops streaming rename it so that it is actually
> named after what it does.
> 
> This also removes the weird enable inverting going on before.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov5693.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 8ad51f8f88cf..2613bad49f78 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -742,13 +742,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
>  	return ret;
>  }
>  
> -static int ov5693_sw_standby(struct ov5693_device *ov5693, bool standby)
> +static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>  {
>  	int ret = 0;
>  
>  	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
> -			 standby ? OV5693_STOP_STREAMING :
> -				   OV5693_START_STREAMING, &ret);
> +			 enable ? OV5693_STOP_STREAMING :
> +				  OV5693_START_STREAMING, &ret);

In this version of this patch the function still behaves as if it is
setting the sensor in a standby mode, my original version had this:

	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
			 enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
			 &ret);

Which makes the function behave more logical.


>  
>  	return ret;
>  }
> @@ -784,9 +784,9 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
>  		return ret;
>  	}
>  
> -	ret = ov5693_sw_standby(ov5693, true);
> +	ret = ov5693_enable_streaming(ov5693, true);

And my original version changes the true to false here, stopping
streaming on init (as before when setting standby to true,
including the error messages being different:

	ret = ov5693_enable_streaming(ov5693, false);
	if (ret)
		dev_err(ov5693->dev, "%s stop streaming error\n", __func__);



>  	if (ret)
> -		dev_err(ov5693->dev, "software standby error\n");
> +		dev_err(ov5693->dev, "enable streaming error\n");
>  
>  	return ret;
>  }
> @@ -1119,7 +1119,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	mutex_lock(&ov5693->lock);
> -	ret = ov5693_sw_standby(ov5693, enable);
> +	ret = ov5693_enable_streaming(ov5693, enable);

And this used to be a change from !enable -> enable.

Note that the current version cannot work, you pass enable
(instead of !enable) but ov5693_enable_streaming() still
sends OV5693_STOP_STREAMING if enable is true, so you are
now stopping streaming when called to enable it ?

>  	mutex_unlock(&ov5693->lock);
>  
>  	if (ret)
> 

Besides this needing some work, it is fine with me, and
I believe that it is best, to just squash this and
patch 5/5 into patch 2 (since your introducing this
driver in this series it is a bit to then apply fixes
to it in the same series).

Regards,

Hans


