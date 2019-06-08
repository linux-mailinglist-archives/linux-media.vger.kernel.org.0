Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15823A058
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 17:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfFHPBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 11:01:42 -0400
Received: from jp.dhs.org ([62.251.46.73]:56410 "EHLO jp.jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727035AbfFHPBm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 11:01:42 -0400
Received: from localhost ([::1])
        by jp.jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hZcqd-0006af-Au; Sat, 08 Jun 2019 17:01:35 +0200
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Jan Pieter <raslal@live.com>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <20190608093051.wauot4m2cikxzcjp@gofer.mess.org>
From:   JP <jp@jpvw.nl>
Message-ID: <152ff12f-608d-0fef-e455-7d102c14b8f7@jpvw.nl>
Date:   Sat, 8 Jun 2019 17:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608093051.wauot4m2cikxzcjp@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 6/8/19 11:30 AM, Sean Young wrote:
> Hello Jan Pieter,
>
> On Sat, Jun 08, 2019 at 04:49:23AM +0200, JP wrote:
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
> That's great, but there are some changes needed before we can accept this
> patch. It needs a commit message and Signed-off-by and more:
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>
>>
>> Jan Pieter van Woerkom
>>
>>
>>
>> diff -ru a/drivers/media/dvb-frontends/si2168.c
>> b/drivers/media/dvb-frontends/si2168.c
>> --- a/drivers/media/dvb-frontends/si2168.c    2019-06-04 07:59:45.000000000
>> +0200
>> +++ b/drivers/media/dvb-frontends/si2168.c    2019-06-07 22:49:21.226337473
>> +0200
>> @@ -91,8 +91,16 @@
>>
>>       dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
>>
>> +    /* set ts clock freq to 10Mhz */
>> +       memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
>> +    cmd.wlen = 6;
>> +    cmd.rlen = 4;
>> +    ret = si2168_cmd_execute(client, &cmd);
>> +    if (ret) return ret;
>> +
>>       /* set TS_MODE property */
>> -    memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
>> +    memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
>> +    cmd.args[4] = dev->ts_mode & 0x30;
> This change affects every driver that uses the si2168. This will need some
> justification.

> There is currently no other driver that uses anything else than
>
> AUTO for ts clock mode. This is the best way to set it to MANUAL
>
> from the calling driver. With this patch, the outcome in cmd.args[4]
>
> for every other driver that does not set MANUAL (they currently
>
> don't) is exactly the same.
>
> Setting this clock to 10Mhz doesn't hurt anyone either. When
>
> in AUTO mode, I guess it is overwritten with the scanned value.
>
> When in the future there will be more drivers that use si2168
>
> manual clock mode, with different clock values, some other
>
> approach might be better. Having to modify  every driver that
>
> uses the si2168 to set the clock mode explicitly, just to be able
>
> to add one more driver, does not seem the right choice to me.
>
>>       if (acquire)
>>           cmd.args[4] |= dev->ts_mode;
>>       else
>> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c
>> b/drivers/media/usb/dvb-usb-v2/dvbsky.c
>> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-04 07:59:45.000000000
>> +0200
>> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-07 16:47:32.141530489
>> +0200
>> @@ -560,6 +560,9 @@
>>       si2168_config.i2c_adapter = &i2c_adapter;
>>       si2168_config.fe = &adap->fe[0];
>>       si2168_config.ts_mode = SI2168_TS_PARALLEL;
>> +    if (d->udev->descriptor.idProduct == USB_PID_MYGICA_T230C2)
> This needs le16_to_cpu().


It has been almost 25 years ago I did any programming.

But I'll look into that. And also into the administrative stuff.

>
>> +        si2168_config.ts_mode |= 0x20;
>>       si2168_config.ts_clock_inv = 1;
>>
>>       state->i2c_client_demod = dvb_module_probe("si2168", NULL,
>> @@ -799,6 +802,9 @@
>>       { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>>           &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>>           RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>> +    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
>> +        &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C2",
>> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
>> diff -ru a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
>> --- a/include/media/dvb-usb-ids.h    2019-06-04 07:59:45.000000000 +0200
>> +++ b/include/media/dvb-usb-ids.h    2019-06-06 17:32:32.159187000 +0200
>> @@ -387,6 +387,7 @@
>>   #define USB_PID_MYGICA_D689                0xd811
>>   #define USB_PID_MYGICA_T230                0xc688
>>   #define USB_PID_MYGICA_T230C                0xc689
>> +#define USB_PID_MYGICA_T230C2                0xc68a
>>   #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
>>   #define USB_PID_ELGATO_EYETV_DTT            0x0021
>>   #define USB_PID_ELGATO_EYETV_DTT_2            0x003f
> Thanks,
>
> Sean
>
Than you.

Jan Pieter.

