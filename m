Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0FB4C0662
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 01:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbiBWAsf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 19:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233065AbiBWAse (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 19:48:34 -0500
X-Greylist: delayed 10695 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Feb 2022 16:48:07 PST
Received: from mail.turbocat.net (turbocat.net [88.99.82.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3623ED02
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 16:48:07 -0800 (PST)
Received: from [10.36.2.165] (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 658992601B4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 01:48:06 +0100 (CET)
Message-ID: <edcd2482-d2d4-88d8-b2d9-6c1b3c592389@selasky.org>
Date:   Wed, 23 Feb 2022 01:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Possible regression] TechnoTrend TT-USB2.0 driver appears broken
Content-Language: en-US
From:   Hans Petter Selasky <hps@selasky.org>
To:     linux-media@vger.kernel.org
References: <77ca512b-d1e6-9ec9-eed7-b229bb3852dd@selasky.org>
In-Reply-To: <77ca512b-d1e6-9ec9-eed7-b229bb3852dd@selasky.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/22/22 22:49, Hans Petter Selasky wrote:
> Hi,
> 
> Do the technotrend TT-USB 2.0 devices still work with Linux v5.17 ?
> 
> Last known working version was Linux v3.16.
> 
> ugen0.8: <TechnoTrend TT-USB2.0> at usbus0, cfg=0 md=HOST spd=HIGH 
> (480Mbps) pwr=ON (10mA)
> 
>    bLength = 0x0012
>    bDescriptorType = 0x0001
>    bcdUSB = 0x0200
>    bDeviceClass = 0x0000  <Probed by interface class>
>    bDeviceSubClass = 0x0000
>    bDeviceProtocol = 0x0000
>    bMaxPacketSize0 = 0x0040
>    idVendor = 0x0b48
>    idProduct = 0x3007
>    bcdDevice = 0x0101
>    iManufacturer = 0x0001  <TechnoTrend>
>    iProduct = 0x0002  <TT-USB2.0>
>    iSerialNumber = 0x0000  <no string>
>    bNumConfigurations = 0x0001
> 
> 
> First I get this error:
> 
> webcamd 98640 - - pctv452e: I2C error -5; AA 91  CC 00 01 -> 0x803003000h
> 
> Removed "drivers/media/usb/dvb-usb/pctv452e.c"
> 
>>         /* I2C device didn't respond as expected. */
>>         ret = -EREMOTEIO;
>>         if (buf[6] < rcv_len) {
>>                 goto failed;
>>         }
> 
> Then w_scan complained:
> 
>> w_scan version 20120415 (compiled for DVB API 5.11)
>> using settings for 0.8 west Thor 3/5 & Intelsat 10-02
>> scan type SATELLITE, channellist 53
>> output format vdr-1.7
>> WARNING: could not guess your codepage. Falling back to 'UTF-8'
>> output charset 'UTF-8', use -C <charset> to override
>> -_-_-_-_ Getting frontend capabilities-_-_-_-_ Using DVB API 5.b
>> frontend 'STB0899 Multistandard' supports
>> INVERSION_AUTO
>> DVB-S
>> DVB-S2
>> FREQ (0.95GHz ... 2.15GHz)
>> SRATE (5.000MSym/s ... 45.000MSym/s)
>> using LNB "UNIVERSAL"
>> -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ (time: 00:00) (time: 
>> 00:05)     skipped: (srate 1450000 unsupported by driver)
>>
>> initial_tune:2265: Setting frontend failed S  f = 11166 kHz V SR =  
>> 1450  7/8 0,35  QPSK
>> (time: 00:06)     skipped: (srate 3100000 unsupported by driver)
>>
>> initial_tune:2265: Setting frontend failed S  f = 11182 kHz V SR =  
>> 3100  7/8 0,35  QPSK
>> (time: 00:08)     skipped: (srate 2142000 unsupported by driver)
> 
> Tried to change:
> 
>> static const struct dvb_frontend_ops stb0899_ops = {
>>         .delsys = { SYS_DVBS, SYS_DVBS2, SYS_DSS },
>>         .info = {
>>                 .name                   = "STB0899 Multistandard",
>>                 .frequency_min_hz       =  950 * MHz,
>>                 .frequency_max_hz       = 2150 * MHz,
>>                 .symbol_rate_min        =   500000,
> ^^^ this value
>>                 .symbol_rate_max        = 45000000,
> 
> But no luck.

Looks like a device firmware update did the trick.

--HPS

