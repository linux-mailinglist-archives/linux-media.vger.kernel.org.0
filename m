Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F99709526
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 12:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjESKhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 06:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjESKg3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 06:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E471FE8
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684492515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4oiYFKF2ugMD0sw+r8TK6rHGBZgsXSE7VHswmxOaISI=;
        b=Sc5PvkAgHk6+GLXKlYMJwFgLj2cLpemi1QJrVghomxZmwKv3cbrJQRbK/DfUJhsh1bddEO
        AlHZtJxa8SXY4zugSEBOnqDHX2BJ93czQYUV5lAqCEORymMdjCHIdMx9lc+OkXPLy535HZ
        NlqVLv/m+ei9yns2spm20yzdrOJ6I0Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-zaudn9FKPnOoWisJkraqkQ-1; Fri, 19 May 2023 06:35:13 -0400
X-MC-Unique: zaudn9FKPnOoWisJkraqkQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-506b21104faso1899625a12.1
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492512; x=1687084512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oiYFKF2ugMD0sw+r8TK6rHGBZgsXSE7VHswmxOaISI=;
        b=ZzoYqRV9NnLL6FZEu1eG2eDIrDf3r7ZKtJeTLfJG93HTW+UJPbolBPGwPCXKRQ7cU7
         fl/lYKt9OOGRB/f0SUonTvNjIZ4Y9Z0fvX6bVwLMkeqHuI0XP3g1NWy2R9efCkZq903x
         qF4HbtLuPCikYvn1qiB0T5vBCFjMZQAGxyOenM0h9emyGEoA7ItxI3IZDl7NqGwK0uV+
         hTdMSdYkH0CIv8J8Pt1c+El2jmU+hTj601MKEZZZnKwEB43iTmAkfatwnwf7bV2p5sOq
         U6lspmtVJoAA7pUxDPA6RYkHvxHwmqtn8zR+DKSXR0d/4ysVmpt82xQstXo0pENl9kge
         3P6w==
X-Gm-Message-State: AC+VfDzLT3sIbsyYaAFXoqBJslzU8FowladpR7iPkeWv0oY0bCjb4fRJ
        +WfP7D+OHph4ieojNxwv3/pN/7gE39NOVNu1JZSYB/CsuWW5X52wpCmfztbyAffpJV6a/MitYt4
        kHjRExcquqFD8NqMeM8d1020=
X-Received: by 2002:aa7:d9d2:0:b0:506:83fc:2dab with SMTP id v18-20020aa7d9d2000000b0050683fc2dabmr1257741eds.22.1684492512589;
        Fri, 19 May 2023 03:35:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6PDN6DC+R6+VJHY1CRMB1hRVFb5nwZRIO8XORwzgXUe0GWqQDS7FD+nSE0QIfKdL4fmCo4lg==
X-Received: by 2002:aa7:d9d2:0:b0:506:83fc:2dab with SMTP id v18-20020aa7d9d2000000b0050683fc2dabmr1257728eds.22.1684492512325;
        Fri, 19 May 2023 03:35:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7d50d000000b00504ecc4fa96sm1520283edq.95.2023.05.19.03.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 03:35:11 -0700 (PDT)
Message-ID: <e7dd784e-5273-a66b-ce1b-7959ac55d596@redhat.com>
Date:   Fri, 19 May 2023 12:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/9] media: atomisp: gc0310: Remove gc0310_s_config()
 function
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-8-hdegoede@redhat.com>
 <CAHp75VcnXs3wmE0waf6oQM2-sax83RaEh5ESi-jN9f7FpQ0HXQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcnXs3wmE0waf6oQM2-sax83RaEh5ESi-jN9f7FpQ0HXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI,

On 5/19/23 12:32, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> gc0310_s_config() used to call camera_sensor_platform_data.csi_cfg() back
>> when the gc0310 driver was still using the atomisp_gmin_platform code
>> for power-management.
>>
>> Now it is just a weirdly named wrapper around gc0310_detect(), drop
>> gc0310_s_config() and make probe() call gc0310_detect() directly.
> 
> ...
> 
>> -       ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
>> +       ret = pm_runtime_get_sync(&client->dev);
>> +       if (ret >= 0)
>> +               ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
>> +       pm_runtime_put(&client->dev);
>>         if (ret < 0) {
>>                 dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
>>                 return -ENODEV;
> 
> Not sure if it's good to have in this patch, but above can be cleaned up to
> 
>       pm_runtime_get_sync(&client->dev);
>       ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
>       pm_runtime_put(&client->dev);
>       if (ret < 0) {
>                dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
>                return ret;
>       }
> 
> But I don't know what will be the response on the I2C bus if the
> device is powered off.

In my experience the i2c bus tends to get stuck when using it with
the sensor powered down and unsticking it is tricky (seems to
require a full i2c-controller reset).

So it is best to not even try if the pm_runtime_get_sync() fails
for some reason.

Regards,

Hans




