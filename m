Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3347A418A5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 01:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407942AbfFKXIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 19:08:47 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:36735 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404669AbfFKXIr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 19:08:47 -0400
X-Greylist: delayed 2406 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jun 2019 19:08:46 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yMR+DCIazUHAQGeK8jMC+wSeEBeMPOGQMyGxytoRago=; b=DjuzoMYVwl3RogkL+yXz2czqZQ
        SRl4Fladig0QRjNWhaLQUWUwqQQ2ndW0U1WxyKMklAaUdHyxXX0o50GoxB92Rg70/6MfJfaD3zzwV
        3gxHPlUhPm0GcwnSKRjS8sXq08yPhy3OLZH9Wn32kfe033FH8uYlq6nOQ1GchHvInMYZ9/LBfphYj
        smkHKK2wp74LuvJk3824/AiiQnCndWeuGjopKbPqW2Tuggvy2J6WXTbTIj9lDlQiCdUCh0oVZa6lp
        15+owENlwWK7YxmcQj/ucQxuPG7iF97sT+TORoBVDYUBSqlwzgVHzE9LjdBVSVM4f5JXCUuyHUi6S
        yEdaeqDg==;
Received: from mobile-access-bceedc-73.dhcp.inet.fi ([188.238.220.73] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hapFs-0005Or-8s; Wed, 12 Jun 2019 01:28:36 +0300
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     JP <jp@jpvw.nl>, linux-media@vger.kernel.org
Cc:     Jan Pieter <raslal@live.com>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
Date:   Wed, 12 Jun 2019 01:28:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 188.238.220.73
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/8/19 5:49 AM, JP wrote:
> I made the Mygica T230c2 work on kernel 5.1.7, but I have no idea
> 
> how to submit this. http://jpvw.nl/pub/test/dvb/linux-5.1.7-t230c2.patch
> 
> 
> Please can someone help me out. It looks like the extra code in the
> 
> demodulator does not effect other drivers that use it. Tested with a
> 
> T230, they bothseem to work OK.
> 
> 
> Jan Pieter van Woerkom
> 
> 
> 
> diff -ru a/drivers/media/dvb-frontends/si2168.c 
> b/drivers/media/dvb-frontends/si2168.c
> --- a/drivers/media/dvb-frontends/si2168.c    2019-06-04 
> 07:59:45.000000000 +0200
> +++ b/drivers/media/dvb-frontends/si2168.c    2019-06-07 
> 22:49:21.226337473 +0200
> @@ -91,8 +91,16 @@
> 
>       dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
> 
> +    /* set ts clock freq to 10Mhz */
> +       memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
> +    cmd.wlen = 6;
> +    cmd.rlen = 4;
> +    ret = si2168_cmd_execute(client, &cmd);
> +    if (ret) return ret;
> +

0x03e8 is 1000 and value used is 10 000Hz steps ==> 10 000 000 = 10MHz. 
Which means 8bit parallel ts bus has capacity of 80Mbit/s which sounds 
correct max for DVB-T2. What is default value set to that property? Many 
times those default values are just correct.

>       /* set TS_MODE property */
> -    memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
> +    memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
> +    cmd.args[4] = dev->ts_mode & 0x30;
>       if (acquire)
>           cmd.args[4] |= dev->ts_mode;
>       else

And that enables use of own value.

Anyhow, I don't like idea of piggybacking those "magic" bits on ts mode 
configuration variable. It is better to define own configuration value 
for ts clock on use it when it is set.


> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c 
> b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-04 
> 07:59:45.000000000 +0200
> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-07 
> 16:47:32.141530489 +0200
> @@ -560,6 +560,9 @@
>       si2168_config.i2c_adapter = &i2c_adapter;
>       si2168_config.fe = &adap->fe[0];
>       si2168_config.ts_mode = SI2168_TS_PARALLEL;
> +    if (d->udev->descriptor.idProduct == USB_PID_MYGICA_T230C2)
> +        si2168_config.ts_mode |= 0x20;
>       si2168_config.ts_clock_inv = 1;
> 
>       state->i2c_client_demod = dvb_module_probe("si2168", NULL,
> @@ -799,6 +802,9 @@
>       { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>           &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>           RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
> +    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
> +        &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C2",
> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>       { }
>   };
>   MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
> diff -ru a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
> --- a/include/media/dvb-usb-ids.h    2019-06-04 07:59:45.000000000 +0200
> +++ b/include/media/dvb-usb-ids.h    2019-06-06 17:32:32.159187000 +0200
> @@ -387,6 +387,7 @@
>   #define USB_PID_MYGICA_D689                0xd811
>   #define USB_PID_MYGICA_T230                0xc688
>   #define USB_PID_MYGICA_T230C                0xc689
> +#define USB_PID_MYGICA_T230C2                0xc68a
>   #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
>   #define USB_PID_ELGATO_EYETV_DTT            0x0021
>   #define USB_PID_ELGATO_EYETV_DTT_2            0x003f
> 

What is that T230C2 stick? Naming sounds like a DVB-C2 capable, but I 
found only T230C model from MyGica site. Where I can get one?

And also patch should be split to two logical parts, first add manual ts 
frequency support to si2168 and then other patch which adds device itself.

And which are tuner and demod versions/revisions used for that device?

regards
Antti

-- 
http://palosaari.fi/
