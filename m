Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38992DAF8F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 16:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440028AbfJQOOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 10:14:50 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:38431 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440012AbfJQOOr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 10:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CyX9z4y8fW70H+GW4iOcxykwZYlIDX2slw1f1/FbNOk=; b=SHTr3dhT+D7FJF0axZCivilzQa
        sM5jOic7AbDh+TtzRouV2gS+ZR1WyHkNMz8grkyWDCoKDRBK6t0emN5iWWPE24O29NGc9t/zTzn50
        y8HvyBUSrJpzq35bdsQNt1p1gduZPzEtN9khrztzp9UZdUvKW+s+HB/1xUqkUTiqDIvAsorXGEmQW
        9B0dbP9tCmpBg+lGaX2PFF7yg1u9hBNWi602ft7VvjR/yuBeTv2EXZnwd/VvtZYQwMlWbhuFE9ku8
        rBPrVS3K/x5gA9xymiY0Yf2VZJ48K2ILCNwFuIZMpQO0CSP0rqMBW9JFWhqOH7fLL+tOSrO4/3dJw
        4naOEzhQ==;
Received: from dvbz8cyyyyyyyyyyyyt3t-3.rev.dnainternet.fi ([2001:14ba:8869:c100::42f] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iL6Y8-0000bL-8h; Thu, 17 Oct 2019 17:14:44 +0300
Subject: Re: Logilink VG0022A firmware/si2157 probe
To:     JP <jp@jpvw.nl>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org
References: <20191017090837.GA26546@gofer.mess.org>
 <07eae3df-5df1-eda4-8142-b228dc34b16c@iki.fi>
 <9dbee108-4b8d-91a8-d858-01267389e068@jpvw.nl>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <b315469e-6d07-2fb3-b9ff-a3a5f97065a0@iki.fi>
Date:   Thu, 17 Oct 2019 17:14:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <9dbee108-4b8d-91a8-d858-01267389e068@jpvw.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::42f
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/17/19 4:46 PM, JP wrote:
> Hi there,
> 
> On 10/17/19 2:15 PM, Antti Palosaari wrote:
>> Hello,
>>
>> On 10/17/19 12:08 PM, Sean Young wrote:
>>> Hi Antti,
>>>
>>> I have a Logilink VG0022A device which is an af9035.c type device (with
>>> ITE 9xxx frontned). The probe of the si2146 tuner fails and returns 
>>> 0xffs.
>>>
>>> Now I would like to work on fixing this. Mauro suggested the firmware 
>>> might
>>> be incorrect. Any tips on extracting the firmware? I can try and dump
>>> usb traffic from Windows and see what firmware is being used there. 
>>> How did
>>> you extract the firmware?
> If the receiver has onboard firmware, isn't that the right one? Then the 
> windows
> driver has no need to load one. Or am I missing the point here?

Actually I am not even 100% sure what are used chips of that device, but 
I expect those are:
usb-interface: IT9303, needs firmware, cannot be loaded from the eeprom IIRC
demodulator: Si2168 (revision B or C?), chip has rom that contains 
firmware, but usually it is replaced newer by downloading
tuner: Si2157 or same family, similar firmware solution than Si2168. 
Si2157 I originally used didn't uploaded firmware update at all, later 
there was added more and more Silabs tuner versions and firmware 
downloading.

Si2168B could be started (and it worked at the time I tested) with 
default rom firmware by using that kind of stub firmware:

$ hexdump -C dvb-demod-si2168-b40-01.fw
00000000  05 00 00 00 00 00 00 00                           |........|
00000008

Not sure if that works any other than just Si2168B.

>>>
>>>
>>> Any other suggestions for this device? You might be able to save me a 
>>> lot
>>> of time since you have experience with these types of devices, I do not.
>>
>> Extracting firmware is done almost always by following steps:
>> 1) take sniffs from the some bus (usb/i2c)
>> 2) identify firmware download section, detect it starting point and 
>> ending point ~few first and last bytes
>> 3) find that firmware binary located inside of binary driver
>>  * grep, hexeditor, etc
>>  * example LANG=C grep -obUaP "\x08\x05\x00" driver.sys
>> 4) use dd command to copy firmware blob from binary driver to separate 
>> file (you need to know firmware location and length inside binary)
>>
>>
>> It is also possible to dump firmware to file from bus sniffs too, but 
>> it requires writing some simple script. Dumping it from the binary 
>> driver is usually still most easiest way.
>>
>> At some point I downloaded bunch of drivers to find out multiple 
>> firmware versions for si2168 and made simple script to ease things. 
>> Script is attached.
>>
>>
>> After all, I suspect root of issue may be still be buggy i2c...
> Me too.
> 
> 
> Jan Pieter.

It could be interesting to see from the sniffs what kind of firmwares 
windows driver downloads to different chips AND if i2c communication is 
working properly.

regards
Antti

-- 
http://palosaari.fi/
