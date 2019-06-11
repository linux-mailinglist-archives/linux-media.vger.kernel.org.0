Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389E8418E0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 01:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407362AbfFKX13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 19:27:29 -0400
Received: from jp.dhs.org ([62.251.46.73]:51092 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405384AbfFKX12 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 19:27:28 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1haqAm-0001we-Co; Wed, 12 Jun 2019 01:27:24 +0200
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Cc:     Jan Pieter <raslal@live.com>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
From:   JP <jp@jpvw.nl>
Message-ID: <19441adb-1061-80f4-4ab1-1b12591425a7@jpvw.nl>
Date:   Wed, 12 Jun 2019 01:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/12/19 12:28 AM, Antti Palosaari wrote:
> On 6/8/19 5:49 AM, JP wrote:
>> I made the Mygica T230c2 work on kernel 5.1.7, but I have no idea
>>
>> how to submit this. http://jpvw.nl/pub/test/dvb/linux-5.1.7-t230c2.patch
>>
>>
>> Please can someone help me out. It looks like the extra code in the
>>
>> demodulator does not effect other drivers that use it. Tested with a
>>
>> T230, they bothseem to work OK.
>>
>>
>> Jan Pieter van Woerkom
>>
>>
>>
>> diff -ru a/drivers/media/dvb-frontends/si2168.c 
>> b/drivers/media/dvb-frontends/si2168.c
>> --- a/drivers/media/dvb-frontends/si2168.c    2019-06-04 
>> 07:59:45.000000000 +0200
>> +++ b/drivers/media/dvb-frontends/si2168.c    2019-06-07 
>> 22:49:21.226337473 +0200
>> @@ -91,8 +91,16 @@
>>
>>       dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
>>
>> +    /* set ts clock freq to 10Mhz */
>> +       memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
>> +    cmd.wlen = 6;
>> +    cmd.rlen = 4;
>> +    ret = si2168_cmd_execute(client, &cmd);
>> +    if (ret) return ret;
>> +
>
> 0x03e8 is 1000 and value used is 10 000Hz steps ==> 10 000 000 = 
> 10MHz. Which means 8bit parallel ts bus has capacity of 80Mbit/s which 
> sounds correct max for DVB-T2. What is default value set to that 
> property? Many times those default values are just correct.

The default value *is* 10Mhz. On all other si2168 hardware this does not 
need to be set but for some reason, on this hardware it needs to be set 
manually. The actual value has been scanned from the running windows 
driver by means of a USB logger. My best guess is that this whole si2168 
driver has been written with the help of such a logger.
>>       /* set TS_MODE property */
>> -    memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
>> +    memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
>> +    cmd.args[4] = dev->ts_mode & 0x30;
>>       if (acquire)
>>           cmd.args[4] |= dev->ts_mode;
>>       else
>
> And that enables use of own value.
>
> Anyhow, I don't like idea of piggybacking those "magic" bits on ts 
> mode configuration variable. It is better to define own configuration 
> value for ts clock on use it when it is set.
>

In other cases I immediately would agree, but actually, all bits in the 
hw register correspond with the bits in the ts mode configuration 
variable. When I discovered that, I could not resist making use of it. 
The code is very compact this way. But all right, you convinced me. I 
guess :-)
>> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c 
>> b/drivers/media/usb/dvb-usb-v2/dvbsky.c
>> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-04 
>> 07:59:45.000000000 +0200
>> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-07 
>> 16:47:32.141530489 +0200
>> @@ -560,6 +560,9 @@
>>       si2168_config.i2c_adapter = &i2c_adapter;
>>       si2168_config.fe = &adap->fe[0];
>>       si2168_config.ts_mode = SI2168_TS_PARALLEL;
>> +    if (d->udev->descriptor.idProduct == USB_PID_MYGICA_T230C2)
>> +        si2168_config.ts_mode |= 0x20;
>>       si2168_config.ts_clock_inv = 1;
>>
>>       state->i2c_client_demod = dvb_module_probe("si2168", NULL,
>> @@ -799,6 +802,9 @@
>>       { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>>           &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>>           RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>> +    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
>> +        &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C2",
>> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
>> diff -ru a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
>> --- a/include/media/dvb-usb-ids.h    2019-06-04 07:59:45.000000000 +0200
>> +++ b/include/media/dvb-usb-ids.h    2019-06-06 17:32:32.159187000 +0200
>> @@ -387,6 +387,7 @@
>>   #define USB_PID_MYGICA_D689                0xd811
>>   #define USB_PID_MYGICA_T230                0xc688
>>   #define USB_PID_MYGICA_T230C                0xc689
>> +#define USB_PID_MYGICA_T230C2                0xc68a
>>   #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
>>   #define USB_PID_ELGATO_EYETV_DTT            0x0021
>>   #define USB_PID_ELGATO_EYETV_DTT_2            0x003f
>>
>
> What is that T230C2 stick? Naming sounds like a DVB-C2 capable, but I 
> found only T230C model from MyGica site. Where I can get one?
The T230C2 is sold as T230C. Apart from that it needs the TS clock be 
set they both are exactly the same. I bought it from China. Aliexpress. 
The old T230C is out of stock.

> And also patch should be split to two logical parts, first add manual 
> ts frequency support to si2168 and then other patch which adds device 
> itself.
We are working on that.

> And which are tuner and demod versions/revisions used for that device?
>
They are the same in both T230C and T230C2. To avoid confusion, I will 
use "T230C v2" in future posts.
> regards
> Antti
>
Thank you for your input,

Jan Pieter.
