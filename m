Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4993333E251
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 00:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhCPXoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 19:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCPXni (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 19:43:38 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C90C06174A
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 16:43:38 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id h7so177776qtx.3
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ci0yOkH5SANhrfTSe7fZR3+LRr9ALiIAe2r1wEytOWQ=;
        b=U8w2wFUbiN+RcN4pXsmYqZxDsS5eUJJwXvGuRxPcT6GujWXzd9aZzUj0RaFX5VdCAC
         +H/WpSLAxe7E2SSJuVt/hQdcLhMFm31xKnqsBlCrOz6UHgYTPdSvabGPoRrOR+BXOZEA
         YrIJjRD4wW2vC3b0xlSygHqfE56rNQqg1N4rqawvpfXM5Cz4ZtR40TGNB0aSLT7abqQ1
         3UU84PLcTGYBrrBY/4km6ezshwOshW139vd5OSnD5emZACodQP9db5aukkgEdrp7vHZa
         ly7Y1imDwVRC6KSpJko57B7xdiDncr/vswJb1u3PpAz4JbWjxZ3y7uGvhjBC+4fcmxDB
         OPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ci0yOkH5SANhrfTSe7fZR3+LRr9ALiIAe2r1wEytOWQ=;
        b=n4EPdx+64r6PMmT5jFSSISyKxL1wfaRZfvSRiC+AGxhmfDWBD7UQvxdzCBYFoWLjaH
         1EgZFgd+nQ2eLQnXkfzlXnzR27S4OznMYwa/MXJj0ZxUWsUwfWMTEFq8gQzvsuQcO7yI
         oDBAGTFTH48bGiQkygqjcSIMJGnIRgjt9VTs/DrJ7ET1nzxTihHweUl3FTYlbbZOh8He
         1Qw+Cm4rusLAzGissM6rBi6KbLYDgW+fmFaN0KzhwKbvU/YBEpLuU9+gF5TqXWyDwm+H
         P+zFhGKe2fOBwArWc3PlbNGlW8pgfHCT5cw2Pz7avrZnO/yztTjVNK3xMtJL/3pWnOx9
         cXBA==
X-Gm-Message-State: AOAM531UPzGDOJNAxJyDxcsNPHImsC+W4LsytkZXGsBvm4ZX7vPcgeGb
        X+gFWfUdqxEx47pVOHU552ZquQEd1S8sKQ==
X-Google-Smtp-Source: ABdhPJy3x981BlpqbsjAlgwssD98GPqKRLi45j2AKJxOGum+I39qt2fMVGdrE/iQrDtExP10rcs03Q==
X-Received: by 2002:ac8:7089:: with SMTP id y9mr1304277qto.264.1615938216859;
        Tue, 16 Mar 2021 16:43:36 -0700 (PDT)
Received: from [192.168.80.12] ([24.105.64.120])
        by smtp.gmail.com with ESMTPSA id w5sm16553387qkc.85.2021.03.16.16.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 16:43:36 -0700 (PDT)
Subject: Re: [PATCH] Backport MYGICA T230A adapter
To:     JP <jp@jpvw.nl>, linux-media@vger.kernel.org
References: <e57634b4-b6f3-fcbd-2e43-cfed3a429918@gmail.com>
 <f62ab424-7dc6-ee57-d098-fb5008c33cef@jpvw.nl>
From:   Vincent Fortier <th0ma7@gmail.com>
Message-ID: <53dd5f12-38cc-6806-0119-0fdba7ce8f10@gmail.com>
Date:   Tue, 16 Mar 2021 19:43:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f62ab424-7dc6-ee57-d098-fb5008c33cef@jpvw.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 2021-03-16 à 12 h 55, JP a écrit :
> Hi Vincent.
>
> On 3/13/21 1:36 PM, Vincent Fortier wrote:
>> Hi all,
>>
>> (first patch posting so don't hesitate to let me know where to find 
>> additional info to improve next time)
>
> My advice is to do this on newer kernel. 
> https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.11.6.tar.xz
> So we can share it with the world.
> I have all T230* receivers, so i can test t230a and also if it doesn't 
> break the others.
>
> Cheers,
>
> Jan Pieter.
>
This request is to get the patches merged to backports part of the 
default driver package in hope I don't have to maintain it on my own as 
I'm not a C coder (https://linuxtv.org/downloads/drivers/).

Also, naively, I thought somehow that crazycat69 repository (currently 
at 5.11-rc6) was eventually merged into the master media tree which 
itself ends-up being merged to master at the next linux-next round 
(indeed there may be rainbows & unicorns along the way...)

- vin


>
>> The following patch is a manual backport based on crazycat69 / 
>> linux_media git repository:
>>
>> https://github.com/crazycat69/linux_media/commit/e1ef47d604775c550a8f0d1bda276c113f882c9b?branch=e1ef47d604775c550a8f0d1bda276c113f882c9b&diff=unified 
>>
>>
>>
>> MYGICA T230A support was found on the following thread:
>> https://forum.libreelec.tv/thread/23142-mygica-t230a/?pageNo=2
>>
>> Built successfully over commit 
>> 069192365e2cec8b47f6e6701fb2aa50f763c602 (March 9th) on media_build 
>> git tree with driver snapshot from 2021-03-07-1c5ab1e2286f over 
>> Synology 4.4.59 / 4.4.60 kernels. Also built successfully over 
>> 3.10.105 using latest compatible snapshot from 2021-01-13 using 
>> driver version 2021-01-08-321af22a3d2f (as sadly pre-4.4 support was 
>> removed recently).
>>
>> User thread confirming it to work under Synology NAS under 4.4.59 
>> kernel available here:
>>
>> https://github.com/th0ma7/synology/issues/9
>>
>> Much thnx in advance.
>>
>> - vin
>>
>> ---
>>
>> diff -uprN 
>> ../linuxtv.orig/linux/drivers/media/usb/dvb-usb-v2/dvbsky.c 
>> ./linux/drivers/media/usb/dvb-usb-v2/dvbsky.c
>> --- ../linuxtv.orig/linux/drivers/media/usb/dvb-usb-v2/dvbsky.c 
>> 2020-11-06 05:40:16.000000000 +0000
>> +++ ./linux/drivers/media/usb/dvb-usb-v2/dvbsky.c    2021-02-19 
>> 14:31:34.405091839 +0000
>> @@ -529,7 +529,7 @@ static int dvbsky_t330_attach(struct dvb
>>      return 0;
>>  }
>>
>> -static int dvbsky_mygica_t230c_attach(struct dvb_usb_adapter *adap)
>> +static int dvbsky_mygica_t230_attach(struct dvb_usb_adapter *adap)
>>  {
>>      struct dvbsky_state *state = adap_to_priv(adap);
>>      struct dvb_usb_device *d = adap_to_d(adap);
>> @@ -541,7 +541,9 @@ static int dvbsky_mygica_t230c_attach(st
>>      si2168_config.i2c_adapter = &i2c_adapter;
>>      si2168_config.fe = &adap->fe[0];
>>      si2168_config.ts_mode = SI2168_TS_PARALLEL;
>> -    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
>> USB_PID_MYGICA_T230C2)
>> +    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
>> USB_PID_MYGICA_T230C2 ||
>> +        le16_to_cpu(d->udev->descriptor.idProduct) == 
>> USB_PID_MYGICA_T230C2_LITE ||
>> +        le16_to_cpu(d->udev->descriptor.idProduct) == 
>> USB_PID_MYGICA_T230A)
>>          si2168_config.ts_mode |= SI2168_TS_CLK_MANUAL;
>>      si2168_config.ts_clock_inv = 1;
>>
>> @@ -553,19 +555,26 @@ static int dvbsky_mygica_t230c_attach(st
>>
>>      /* attach tuner */
>>      si2157_config.fe = adap->fe[0];
>> -    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
>> USB_PID_MYGICA_T230) {
>> -        si2157_config.if_port = 1;
>> -        state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
>> +    switch (le16_to_cpu(d->udev->descriptor.idProduct)) {
>> +    case USB_PID_MYGICA_T230C:
>> +    case USB_PID_MYGICA_T230C2:
>> +    case USB_PID_MYGICA_T230C2_LITE:
>> +    case USB_PID_MYGICA_T230A: {
>> +        si2157_config.if_port = 0;
>> +        state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>>                                 i2c_adapter,
>>                                 0x60,
>>                                 &si2157_config);
>> -    } else {
>> -        si2157_config.if_port = 0;
>> -        state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>> +        break;
>> +    }
>> +    default: {
>> +        si2157_config.if_port = 1;
>> +        state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
>>                                 i2c_adapter,
>>                                 0x60,
>>                                 &si2157_config);
>>      }
>> +    }
>>      if (!state->i2c_client_tuner) {
>>          dvb_module_release(state->i2c_client_demod);
>>          return -ENODEV;
>> @@ -577,14 +586,24 @@ static int dvbsky_mygica_t230c_attach(st
>>
>>  static int dvbsky_identify_state(struct dvb_usb_device *d, const 
>> char **name)
>>  {
>> -    dvbsky_gpio_ctrl(d, 0x04, 1);
>> -    msleep(20);
>> -    dvbsky_gpio_ctrl(d, 0x83, 0);
>> -    dvbsky_gpio_ctrl(d, 0xc0, 1);
>> -    msleep(100);
>> -    dvbsky_gpio_ctrl(d, 0x83, 1);
>> -    dvbsky_gpio_ctrl(d, 0xc0, 0);
>> -    msleep(50);
>> +    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
>> USB_PID_MYGICA_T230A) {
>> +        dvbsky_gpio_ctrl(d, 0x87, 0);
>> +        msleep(20);
>> +        dvbsky_gpio_ctrl(d, 0x86, 1);
>> +        dvbsky_gpio_ctrl(d, 0x80, 0);
>> +        msleep(100);
>> +        dvbsky_gpio_ctrl(d, 0x80, 1);
>> +        msleep(50);
>> +    } else {
>> +        dvbsky_gpio_ctrl(d, 0x04, 1);
>> +        msleep(20);
>> +        dvbsky_gpio_ctrl(d, 0x83, 0);
>> +        dvbsky_gpio_ctrl(d, 0xc0, 1);
>> +        msleep(100);
>> +        dvbsky_gpio_ctrl(d, 0x83, 1);
>> +        dvbsky_gpio_ctrl(d, 0xc0, 0);
>> +        msleep(50);
>> +    }
>>
>>      return WARM;
>>  }
>> @@ -719,7 +738,7 @@ static struct dvb_usb_device_properties
>>      }
>>  };
>>
>> -static struct dvb_usb_device_properties mygica_t230c_props = {
>> +static struct dvb_usb_device_properties mygica_t230_props = {
>>      .driver_name = KBUILD_MODNAME,
>>      .owner = THIS_MODULE,
>>      .adapter_nr = adapter_nr,
>> @@ -730,7 +749,7 @@ static struct dvb_usb_device_properties
>>      .generic_bulk_ctrl_delay = DVBSKY_MSG_DELAY,
>>
>>      .i2c_algo         = &dvbsky_i2c_algo,
>> -    .frontend_attach  = dvbsky_mygica_t230c_attach,
>> +    .frontend_attach  = dvbsky_mygica_t230_attach,
>>      .frontend_detach  = dvbsky_frontend_detach,
>>      .init             = dvbsky_init,
>>      .get_rc_config    = dvbsky_get_rc_config,
>> @@ -778,16 +797,22 @@ static const struct usb_device_id dvbsky
>>          &dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
>>          RC_MAP_DVBSKY) },
>>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
>> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230",
>> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230",
>>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
>> T230C",
>> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C",
>>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C_LITE,
>> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
>> T230C Lite",
>> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
>> T230C Lite",
>>          NULL) },
>>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
>> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
>> T230C v2",
>> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
>> T230C v2",
>> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>> +     { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2_LITE,
>> +        &mygica_t230_props, "MyGica Mini DVB-T2 USB Stick T230C Lite 
>> v2",
>> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>> +    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230A,
>> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230A",
>>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>      { }
>>  };
>> diff -uprN ../linuxtv.orig/linux/include/media/dvb-usb-ids.h 
>> ./linux/include/media/dvb-usb-ids.h
>> --- ../linuxtv.orig/linux/include/media/dvb-usb-ids.h 2020-05-26 
>> 05:40:21.000000000 +0000
>> +++ ./linux/include/media/dvb-usb-ids.h    2021-02-19 
>> 14:27:21.459391941 +0000
>> @@ -394,6 +394,8 @@
>>  #define USB_PID_MYGICA_T230C                0xc689
>>  #define USB_PID_MYGICA_T230C2                0xc68a
>>  #define USB_PID_MYGICA_T230C_LITE            0xc699
>> +#define USB_PID_MYGICA_T230C2_LITE            0xc69a
>> +#define USB_PID_MYGICA_T230A                0x689a
>>  #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
>>  #define USB_PID_ELGATO_EYETV_DTT            0x0021
>>  #define USB_PID_ELGATO_EYETV_DTT_2            0x003f
>>
>>
>
