Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F7A553C7
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 17:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731314AbfFYPy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 11:54:26 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:45701 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfFYPy0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 11:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QfysAdoCkVQVciebAVG1Qfo1bjllRiPZdI49PCEIkQI=; b=YjGNvZ4AzZ1LHgjopUR8fIa4rI
        WbWP559RbdLJ7iDlu60d8NlPHXuZVUA/ydaaZ5zvKHuuPjjtyOve2rddEasM1y6ZADfL076HkE8Eq
        b7zUlpZTSL0PVXGrlLWZEol7EuDoPxkU+rIxpiasqxVDpIj8NKAvFxSe63BuZ6CIyebfIJTmmOUDT
        F1VNkoPAe2SovXJzU3piQtvxNnJfyuetgMc+vAahPOs46ObuRcwd6CgOcKo99R93yOG0J7bDwzwzr
        2v5VOGmTbctqmRH7r7m/5BrBgHplTPx1U1IAuW5l8NaBBRF5FDmySK518okosWn+jtPTxXcJ6xa1r
        9zTh3p9g==;
Received: from mobile-access-bcee94-238.dhcp.inet.fi ([188.238.148.238] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hfnm2-0005j1-03; Tue, 25 Jun 2019 18:54:22 +0300
Subject: Re: [PATCH 1/2] dvbsky: add support for "Mygica T230C v2"
To:     JP <jp@jpvw.nl>, Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Michael Ira Krufky <mkrufky@linuxtv.org>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>
References: <20190616003929.GE4518@jpvw.nl>
 <20190625111615.s5kifm6nb2lafiw4@gofer.mess.org>
 <e87ac093-6466-4cd4-3346-1db17ae85495@jpvw.nl>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <2cacbd1c-3bec-3f1c-fffd-0360e99af742@iki.fi>
Date:   Tue, 25 Jun 2019 18:54:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e87ac093-6466-4cd4-3346-1db17ae85495@jpvw.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 188.238.148.238
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/25/19 6:41 PM, JP wrote:
> 
> 
> On 6/25/19 1:16 PM, Sean Young wrote:
>> On Sun, Jun 16, 2019 at 02:39:29AM +0200, Jan Pieter van Woerkom wrote:
>>> From: Jan Pieter van Woerkom <jp@jpvw.nl>
>>>
>>> Adds support for the "Mygica T230C v2" into the "dvbsky" driver.
>>> A small enhancement is also needed in the si2168 demodulator
>>> driver, and a USB device ID in dvb-usb-ids.h .
>>>
>>> This is v3.3 of the proposed patch, based on feedback from Sean
>>> Young and Antti Palosaari.
>>> Tested by patch author on a T230C v2.
>>> Tested by Frank Rysanek on a T230C v2: can tune into locally
>>> available DVB-T and DVB-T2 muxes, video and audio playback works.
>>> Applies cleanly against Linux 5.1.10 .
>>>
>>> The T230C v2 hardware needs a mode of the si2168 chip to be
>>> set for which the si2168 driver previously had no support.
>>> This patch uses a specific measure to configure this on the
>>> T230C v2 hardware only - see the flag passed via the ts_mode
>>> attribute and its dependency on USB_PID_MYGICA_T230C2. Other
>>> devices using the si2168 demodulator driver are not affected
>>> in any way.
>>>
>>> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
>>> Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
>>> ---
>>> diff -ru a/drivers/media/dvb-frontends/si2168.c 
>>> b/drivers/media/dvb-frontends/si2168.c
>>> --- a/drivers/media/dvb-frontends/si2168.c    2019-06-04 
>>> 07:59:45.000000000 +0200
>>> +++ b/drivers/media/dvb-frontends/si2168.c    2019-06-08 
>>> 19:47:32.385526558 +0200
>>> @@ -91,8 +91,18 @@
>>>       dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
>>> +    /* set manual value */
>>> +    if (dev->ts_mode | SI2168_TS_CLK_MANUAL) {
>> This looks wrong. Should it not be "dev->ts_mode & SI2168_TS_CLK_MANUAL"?
>> Now the expression is always true.
> You're absolutely right. Silly me.
> 
> What now? Correct and repost?

yes, and next indentation looks also wrong

> 
> 
>>> +        memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
>>> +        cmd.wlen = 6;
>>> +        cmd.rlen = 4;
>>> +        ret = si2168_cmd_execute(client, &cmd);
>>> +        if (ret)
>>> +            return ret;
>>> +        }
>>>       /* set TS_MODE property */
>>> -    memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
>>> +    memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
>>> +    cmd.args[4] = dev->ts_mode & 
>>> (SI2168_TS_CLK_AUTO|SI2168_TS_CLK_MANUAL);
>>>       if (acquire)
>>>           cmd.args[4] |= dev->ts_mode;
>>>       else
>>> diff -ru a/drivers/media/dvb-frontends/si2168.h 
>>> b/drivers/media/dvb-frontends/si2168.h
>>> --- a/drivers/media/dvb-frontends/si2168.h    2019-06-04 
>>> 07:59:45.000000000 +0200
>>> +++ b/drivers/media/dvb-frontends/si2168.h    2019-06-08 
>>> 19:32:52.400320490 +0200
>>> @@ -39,6 +39,8 @@
>>>   #define SI2168_TS_PARALLEL    0x06
>>>   #define SI2168_TS_SERIAL    0x03
>>>   #define SI2168_TS_TRISTATE    0x00
>>> +#define SI2168_TS_CLK_AUTO    0x10
>>> +#define SI2168_TS_CLK_MANUAL    0x20
>>>       u8 ts_mode;
>>>       /* TS clock inverted */
>> Thanks,
>> Sean
>>
> Thank you,
> Jan Pieter.

regards
Antti

-- 
http://palosaari.fi/
