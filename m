Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 371D49B8E9
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 01:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfHWXeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 19:34:00 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:58105 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbfHWXeA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 19:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1ZaigXP5TSXGlZ25/z3haxolf1W6rJNu2axZpIN/1fA=; b=d8vyYeNn3yikBU5yv6HdLSfELn
        v22h6U24RhpdQ3EcGfCMzxiaS4TU4apdP4gbTf/9UXs0tJUQGm3EeVGAhxyEUy5FuTvXdl3yynDNP
        AWDC7Kn3p+re719vz9lBug6N3nYjjb5cnzRg8hlie1gLFNK5C6fukgg6YjFnhIvKvk3c41yraklQ6
        HFYWrrmBIw6Jcj3S5nzq5y9Ut1X/0mE7fYkb3J7/uFcyrrgYHkHogdMndZddUp9Xh0hsLJLve4k0P
        68o53fzY+RchSedIaBJsCG6/PWm121RkuiGVSgE0Aidwsiiy4Nw3yCMS4VtHSr2gat1VRLmJ/ucfz
        1h21IJxQ==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1i1J48-0003OX-Hr; Sat, 24 Aug 2019 02:33:56 +0300
Subject: Re: [PATCH] gl861: re-implement i2c adapter logic
To:     Akihiro TSUKADA <tskd08@gmail.com>
Cc:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
References: <20190822053452.20168-1-crope@iki.fi>
 <e0052c5b-de39-8fd6-abd8-3cc38d6f21ee@iki.fi>
 <3d2278c5-75a5-7a49-fd36-16e44fbc8849@gmail.com>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <0a092b24-aa04-65b1-2575-1965e3870f34@iki.fi>
Date:   Sat, 24 Aug 2019 02:33:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d2278c5-75a5-7a49-fd36-16e44fbc8849@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::64c
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/23/19 8:28 PM, Akihiro TSUKADA wrote:
> Hi, thanks for the example patch.
> 
>> Here is debug log I tested multibyte i2c writes using zl10353 demod. All
>> returned bytes are not same, but it due to write only register bits I
>> think.
>>
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 03
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 44
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< 46
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 15
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 0f
>> dvb_usb_gl861 1-13:1.0: 5 | 40 03 00 1e 50 00 05 00 >>> 0c 77 aa bb cc
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 0c
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 77
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< aa
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 3b
>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 4c
>>
>>
>> Now if you look your tuner i2c implementation...
>>
>> buf[0] = msg->addr << 1;
>> memcpy(buf + 1, msg->buf, msg->len);
>> ret = usb_control_msg(d->udev, usb_sndctrlpipe(d->udev, 0),
>> GL861_REQ_I2C_RAW, GL861_WRITE,
>> priv->i2c_client_demod->addr << (8 + 1), 0xFE, buf, msg->len + 1, 2000);
>>
>> ...it translates same.
> 
> Log of an 1-byte read from tuner in Friio looks like the following:
> (re-formatted from my past post: https://patchwork.linuxtv.org/comment/92946/ )
> 
> 40 03 00 30 fe 00 01 00 >>> c1  # command a read from the tuner@0x60 (hence 0xc1)
> c0 02 00 30 00 01 01 00 <<< 7c  # get the result (return value: 0x7c)
> 
> so,
> - One read is composed of *two* USB messages.
>    (note that friio_tuner_i2c_xfer() does NOT combine the two I2C messages
>     of one read, and issues separate USB message for each,
>     contrary to gl861_i2c_master_xfer()).
> - The second USB message uses CMD_READ but
>    'index'(demod register addr) value exceeds 8bit (0x0100),
>    thus cannot use the normal gl861_i2c_master_xfer() as is.
> 
> It looks to me different.

It looks just read command done with 2 separate I2C messages (look I2C 
specs REPEATED START vs. STOP START).
OK, I will add support for bulk I2C READs for adapter too, no problem.


Antti

-- 
http://palosaari.fi/
