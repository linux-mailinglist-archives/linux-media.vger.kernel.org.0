Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87176796B2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbjAXLdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbjAXLdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE663EC5E
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7n8vB6/xbQ+I/DYw8IeNOlB4GubtM8a9xAp956gIN4k=;
        b=dezu8hSbSKAemZpgT04/nMhzIt+X3pJhSIXtPE+WoY1+Hz4Ze7hpQUuUhsh0emKpQZb0C0
        9v2OIumhw8PdPPDxaTIy+/gtH+zyFp9taSJULy61PCVM8sIV6Fpi57a+CwXE7GEM4XhDj8
        QI61C8xcYKaGfyupBwPj/Pne5YF/jvk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-MHhN36hvOJ6xjiV4EEMQag-1; Tue, 24 Jan 2023 06:32:30 -0500
X-MC-Unique: MHhN36hvOJ6xjiV4EEMQag-1
Received: by mail-ed1-f72.google.com with SMTP id w3-20020a056402268300b00487e0d9b53fso10575942edd.10
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7n8vB6/xbQ+I/DYw8IeNOlB4GubtM8a9xAp956gIN4k=;
        b=aXnOyxiKtiN6Dh5EGrvT7GZVkZ+sZgk8Aic7ZQN22DQBFfXyttSiOxIz9oN4FA92gV
         S3mp+243F5fyBJ0d0u5ZaR+0nMACoWa5nKqvd08Vp8fFDkGdrwHairz4biaVMg2B6BcI
         1Hiamo68PVAiq4tQwFonUQHj+l8FdxRjHfyJAmsHabv0dar1gQh8Uqmnr1l8G3CJ0Znj
         NQqfNbeSeYbNWvACflyHT7xli0XGAXmQsJdvaE1q8V0JpdeBNj3PZhIEyTQ15f0qBz9V
         JENmMX817+RgqAe5oE4OjlQ12aSOr60ZeetbsMSKBnq1DEboCDaYwvcjNhigxHy0Xqhe
         BYwQ==
X-Gm-Message-State: AFqh2kqJ88JLGgowjyQZuwQmj/058R93dclc9CyODrSBGCB7IlFT7IIf
        maj/g5oixX9w1E1YSbVAdGasJ8+GKAHlZ256uudwMP4Ds9VHFwBtIp2elTpFV5iddsa7fjC7kmD
        ZzhbkSyGjpuY5DOPVLOQzQtU=
X-Received: by 2002:a17:906:6313:b0:872:6508:190 with SMTP id sk19-20020a170906631300b0087265080190mr32097131ejc.6.1674559949338;
        Tue, 24 Jan 2023 03:32:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5L7M8WbENml9bhRRc624KgKSuCEmyZVMDifzuwhmBzWwr1sSg3coWR552tlp8Zmi0J8Lf5w==
X-Received: by 2002:a17:906:6313:b0:872:6508:190 with SMTP id sk19-20020a170906631300b0087265080190mr32097111ejc.6.1674559949172;
        Tue, 24 Jan 2023 03:32:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ka11-20020a170907990b00b007aea1dc1840sm761971ejc.111.2023.01.24.03.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:32:28 -0800 (PST)
Message-ID: <d5cad6ed-34c0-44fe-1507-e59bdd0e64fb@redhat.com>
Date:   Tue, 24 Jan 2023 12:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 54/57] media: atomisp: ov2722: Power on sensor from
 set_fmt() callback
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-55-hdegoede@redhat.com>
 <Y87U/UGWKyW4soys@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87U/UGWKyW4soys@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/23/23 19:42, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:52:02PM +0100, Hans de Goede wrote:
>> Depending on which order userspace makes various v4l2 calls, the sensor
>> might still be powered down when set_fmt is called.
>>
>> What should really happen here is delay the writing of the mode-related
>> registers till streaming is started, but for now use the same quick fix
>> as the atomisp_ov2680 / atomisp_gc0310 code and call power_up() from
>> set_fmt() in combination with keeping track of the power-state to avoid
>> doing the power-up sequence twice.
> 
> OK.
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> Is there a plan to drop this hack from all of the (AtomISP) sensor drivers?

Yes this is the next one on my list to convert to runtime-pm +
ACPI powermanagement. Which needs to be done on a sensor by sensor
basis :|

Regards,

Hans




> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 12 ++++++++++++
>>  drivers/staging/media/atomisp/i2c/ov2722.h         |  2 +-
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> index e09c80d1f9ec..5d2e6e2e72f0 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>> @@ -528,6 +528,9 @@ static int power_up(struct v4l2_subdev *sd)
>>  		return -ENODEV;
>>  	}
>>  
>> +	if (dev->power_on == 1)
>> +		return 0; /* Already on */
>> +
>>  	/* power control */
>>  	ret = power_ctrl(sd, 1);
>>  	if (ret)
>> @@ -552,6 +555,7 @@ static int power_up(struct v4l2_subdev *sd)
>>  	/* according to DS, 20ms is needed between PWDN and i2c access */
>>  	msleep(20);
>>  
>> +	dev->power_on = 1;
>>  	return 0;
>>  
>>  fail_clk:
>> @@ -575,6 +579,9 @@ static int power_down(struct v4l2_subdev *sd)
>>  		return -ENODEV;
>>  	}
>>  
>> +	if (dev->power_on == 0)
>> +		return 0; /* Already off */
>> +
>>  	ret = dev->platform_data->flisclk_ctrl(sd, 0);
>>  	if (ret)
>>  		dev_err(&client->dev, "flisclk failed\n");
>> @@ -592,6 +599,7 @@ static int power_down(struct v4l2_subdev *sd)
>>  	if (ret)
>>  		dev_err(&client->dev, "vprog failed.\n");
>>  
>> +	dev->power_on = 0;
>>  	return ret;
>>  }
>>  
>> @@ -669,6 +677,9 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
>>  
>>  	mutex_lock(&dev->input_lock);
>>  
>> +	/* s_power has not been called yet for std v4l2 clients (camorama) */
>> +	power_up(sd);
>> +
>>  	dev->pixels_per_line = dev->res->pixels_per_line;
>>  	dev->lines_per_frame = dev->res->lines_per_frame;
>>  
>> @@ -959,6 +970,7 @@ static int ov2722_probe(struct i2c_client *client)
>>  		return -ENOMEM;
>>  
>>  	mutex_init(&dev->input_lock);
>> +	dev->power_on = -1;
>>  
>>  	dev->res = &ov2722_res_preview[0];
>>  	v4l2_i2c_subdev_init(&dev->sd, client, &ov2722_ops);
>> diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
>> index 020743a944c4..640d3ffcaa5c 100644
>> --- a/drivers/staging/media/atomisp/i2c/ov2722.h
>> +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
>> @@ -198,7 +198,7 @@ struct ov2722_device {
>>  	struct ov2722_resolution *res;
>>  
>>  	struct camera_sensor_platform_data *platform_data;
>> -	int run_mode;
>> +	int power_on;
>>  	u16 pixels_per_line;
>>  	u16 lines_per_frame;
>>  	u8 type;
>> -- 
>> 2.39.0
>>
> 

