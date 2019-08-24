Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1C29B93C
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 02:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfHXABS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 20:01:18 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:50357 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbfHXABR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 20:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Jc5COVdMtJKS4YI3CI5mbHmqJnNOEJmQZyuadpVivpw=; b=EHwPUpP2O5TNhs7C4zm/jrwECT
        3X3UDIjsOWk/GmOCKXbEpE7r27JpZEMf6xnIRxY882Pkms/J/CtiJf8kMlhhaRRLScnj4j0dqwWuU
        bEwgGtvanq153f+l3trA5uGeqYrWK9O4TC2DLJI/edwDbxchoUp7pQX8yvGdb2zl29fb1kxFglY9p
        CeGLLVMlwxaTFVSCGlF660b29tyZVv+QvRhE2n9+n4DXueB6gl+17mT7jeipx188SuBwecxXhb4Fa
        Z9KXYla6zJsY/qXEJOukHzZWMqxB8QHkUI2kUx4D6xYjhC97ZoHkH8Bi7/wEGkBhQvCXkMCjB1gV/
        at3rG1Pw==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1i1JUY-0001mX-0v; Sat, 24 Aug 2019 03:01:14 +0300
Subject: Re: [PATCH] gl861: re-implement i2c adapter logic
From:   Antti Palosaari <crope@iki.fi>
To:     Akihiro TSUKADA <tskd08@gmail.com>
Cc:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
References: <20190822053452.20168-1-crope@iki.fi>
 <e0052c5b-de39-8fd6-abd8-3cc38d6f21ee@iki.fi>
 <3d2278c5-75a5-7a49-fd36-16e44fbc8849@gmail.com>
 <0a092b24-aa04-65b1-2575-1965e3870f34@iki.fi>
Message-ID: <3c58a680-4a02-2e25-40c5-f064006f064b@iki.fi>
Date:   Sat, 24 Aug 2019 03:01:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0a092b24-aa04-65b1-2575-1965e3870f34@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::64c
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/24/19 2:33 AM, Antti Palosaari wrote:
> 
> 
> On 8/23/19 8:28 PM, Akihiro TSUKADA wrote:
>> Hi, thanks for the example patch.
>>
>>> Here is debug log I tested multibyte i2c writes using zl10353 demod. All
>>> returned bytes are not same, but it due to write only register bits I
>>> think.
>>>
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 03
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 44
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< 46
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 15
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 0f
>>> dvb_usb_gl861 1-13:1.0: 5 | 40 03 00 1e 50 00 05 00 >>> 0c 77 aa bb cc
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 0c
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 77
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< aa
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 3b
>>> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 4c
>>>
>>>
>>> Now if you look your tuner i2c implementation...
>>>
>>> buf[0] = msg->addr << 1;
>>> memcpy(buf + 1, msg->buf, msg->len);
>>> ret = usb_control_msg(d->udev, usb_sndctrlpipe(d->udev, 0),
>>> GL861_REQ_I2C_RAW, GL861_WRITE,
>>> priv->i2c_client_demod->addr << (8 + 1), 0xFE, buf, msg->len + 1, 2000);
>>>
>>> ...it translates same.
>>
>> Log of an 1-byte read from tuner in Friio looks like the following:
>> (re-formatted from my past post: 
>> https://patchwork.linuxtv.org/comment/92946/ )
>>
>> 40 03 00 30 fe 00 01 00 >>> c1  # command a read from the tuner@0x60 
>> (hence 0xc1)
>> c0 02 00 30 00 01 01 00 <<< 7c  # get the result (return value: 0x7c)
>>
>> so,
>> - One read is composed of *two* USB messages.
>>    (note that friio_tuner_i2c_xfer() does NOT combine the two I2C 
>> messages
>>     of one read, and issues separate USB message for each,
>>     contrary to gl861_i2c_master_xfer()).
>> - The second USB message uses CMD_READ but
>>    'index'(demod register addr) value exceeds 8bit (0x0100),
>>    thus cannot use the normal gl861_i2c_master_xfer() as is.
>>
>> It looks to me different.
> 
> It looks just read command done with 2 separate I2C messages (look I2C 
> specs REPEATED START vs. STOP START).
> OK, I will add support for bulk I2C READs for adapter too, no problem.

See updated patch on ml.

Tested it quickly against qt1010 tuner and results are expected:
dvb_usb_gl861 1-14:1.0: 0 | 40 01 1a 1e 62 00 00 00 >>>
dvb_usb_gl861 1-14:1.0: 1 | c0 02 00 c4 29 00 01 00 <<< 39
dvb_usb_gl861 1-14:1.0: 0 | 40 03 00 c4 29 00 00 00 >>>
dvb_usb_gl861 1-14:1.0: 1 | c0 02 00 c4 00 01 01 00 <<< 39
dvb_usb_gl861 1-14:1.0: 1 | c0 02 00 c4 00 01 01 00 <<< 39
dvb_usb_gl861 1-14:1.0: 1 | c0 02 00 c4 00 01 01 00 <<< 39
dvb_usb_gl861 1-14:1.0: 1 | c0 02 00 c4 00 01 01 00 <<< 39
dvb_usb_gl861 1-14:1.0: 0 | 40 01 0a 1e 62 00 00 00 >>>

Register 29 is likely chip id and its value is always 39. So it first 
makes normal write+write to that register which sets and leaves chip 
registers address counter to that. After that each plain I2C read 
request gives 39 which is correct content for that register.

Antti


-- 
http://palosaari.fi/
