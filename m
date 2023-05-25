Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3B77117BC
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 21:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbjEYT43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 15:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjEYT42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 15:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BE0122
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685044533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zVbOTVecVYKoMsVv2+y0oYPZF/OrujTxGhEgP9zW7aA=;
        b=ArbhV6jLD6XLROgplFLFapNM1oJyS+T9Yiuje9ayN6n0qs77paJnZtMcklydEivSGabw93
        wkcrrzood85+8Takb2Qi3QdLyZ6oXZ//B4NcpIwLy4m7+KDEqsUr9AwxOrfwT4XuSOr7aW
        X3qmVgdrlOxu2QkMLdtdM7hwMziETWM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-6oKWMzKWMkuooHE65TK2dw-1; Thu, 25 May 2023 14:40:49 -0400
X-MC-Unique: 6oKWMzKWMkuooHE65TK2dw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a341efd9aso117168466b.0
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 11:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685040048; x=1687632048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVbOTVecVYKoMsVv2+y0oYPZF/OrujTxGhEgP9zW7aA=;
        b=GuBQvUAI381Aub0uwjApB736w78BSgHQKPWUOSHob5SEAzHx5II4O86LDuNlCcDNCg
         QtAtfz8X6I6UVNRy4n+wctOdt47GiUvPiT6QMjw2D0UaPb7SMsYlQ5kp7eLNTfxFf9mF
         0rMtVklN/ubOLQheiPoVP4vvKsFVVBeV4Vm8IR7mMPwDZ4DCRhYmmtiyy1im1mOUaQ3j
         s6S25NoeV4qotCkjqB85yCYJseK3+igr7oXfXFZTEavW1PDJyYqXOin/Sg+qbq3J5eBg
         1cRDzHp1eBkye0XNnEYQbEZ60vm5vuneRNPEntcWKAx4zzyv6hVUpW9Y+ioGOd9AE0go
         9b/w==
X-Gm-Message-State: AC+VfDy08MMSchDuZfldM7rT61ztx1aiqvcAmzRuzPKF0+40qCF/ZMJi
        Tql2tzOSUN/Q7K5tAVkul42pyd/a/zGLMzY0itdBX13ScDfEKc7KHQAWjEWxNuBjXAg/MDE5zXV
        gX9MBQrDgoJWQ1FNa/QQW6qqRr2a+GbY=
X-Received: by 2002:a17:906:ef07:b0:966:53b1:b32a with SMTP id f7-20020a170906ef0700b0096653b1b32amr2355225ejs.53.1685040047916;
        Thu, 25 May 2023 11:40:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gkK/wTpTJ3CVYRrJpQFJ0ucU91Y1Vree4XMrNsOdAkcUDQCXMwAlLH7RrdlcrGgrHVbpTJA==
X-Received: by 2002:a17:906:ef07:b0:966:53b1:b32a with SMTP id f7-20020a170906ef0700b0096653b1b32amr2355211ejs.53.1685040047581;
        Thu, 25 May 2023 11:40:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906378b00b0096b4ec45e10sm1149605ejc.139.2023.05.25.11.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 11:40:42 -0700 (PDT)
Message-ID: <745f5335-b849-52da-f3e2-52cb1f4d1bd6@redhat.com>
Date:   Thu, 25 May 2023 20:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor
 module support
To:     bingbu.cao@intel.com, djrscally@gmail.com,
        dan.scally@ideasonboard.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        bingbu.cao@linux.intel.com
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-3-bingbu.cao@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524035135.90315-3-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 5/24/23 05:51, bingbu.cao@intel.com wrote:
> From: Hao Yao <hao.yao@intel.com>
> 
> Add a new sensor support in INT3472 driver which module name is '09B13'.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index d5d5c650d6d2..63acb48bf8df 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -60,6 +60,8 @@ static const struct int3472_sensor_config int3472_sensor_configs[] = {
>  	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
>  	/* Surface Go 1&2 - OV5693, Front */
>  	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
> +	/* OV13B10 */
> +	{ "09B13", REGULATOR_SUPPLY("vcc", NULL), NULL },

"vcc" is not really a useful supply name. All the existing sensor drivers in drivers/media/i2c typically check for both "avdd" and "dvdd". Can you verify if this is supplying digital or analog power using the schematics of the laptop ?

And then use one of the standard "avdd" or "dvdd" supply names ?

I would like to try and get rid of this table and sofar all the sensors which have a regulator GPIO are listed as sing it for "avdd" so I was hoping to be able to just always use "avdd".

At least I would like us to come up with some default fallback for the supply-name in case a sensor-module is not listed in this table and "avdd" seems to be the best fallback.

Note that if your current sensor driver expects "vcc" that that is not a good reason to go with "vcc" here. It would be better to adjust the sensor driver to use the standard "avdd" and "dvdd" supply names (using the bulk regulator api), like all the other sensor drivers do.

Regards,

Hans

