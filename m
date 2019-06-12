Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB8041931
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 02:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404821AbfFLAC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 20:02:59 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:60159 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404788AbfFLAC7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 20:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TlxR+sGloaDsqzUSVCxicSGO47dskyAn79pZYmvHRVo=; b=D1UNrbSaudhrqRplsZTP80nl2Y
        K1q1nIC1hXZmo5IwHEweE1tW2o+58zy95qldNkdez3AP1XDQOXDaJz3nEn1eQ/II5HTdVJV3o6OoY
        Rgq0lcjdPeJN9Bmt1cjgqawX7e5GGXb/Nu1fQwbg7g2P6qeyOvegQRmONfdPKb2WFemrqqUaw2m8Q
        urhzB0/P2CEHCmUkWhE/FMxRM2JGTRoWFqVTW2wmtz2WiRYkF21+dsG90t706+GWbPP+nouSYi05z
        Xs5RqYd8Ramg3qKATxYgm44CRRvpNorHnix2f1mLBJ46WPIerbCcMSIi1/WDcT/ta69mXcq8uya6R
        aw49l1/w==;
Received: from mobile-access-bceedc-73.dhcp.inet.fi ([188.238.220.73] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1haqjA-0001YM-Rg; Wed, 12 Jun 2019 03:02:56 +0300
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
From:   Antti Palosaari <crope@iki.fi>
To:     JP <jp@jpvw.nl>, linux-media@vger.kernel.org
Cc:     Jan Pieter <raslal@live.com>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <19441adb-1061-80f4-4ab1-1b12591425a7@jpvw.nl>
 <7722d8c1-90eb-2067-d711-4faf4c4851c3@iki.fi>
Message-ID: <210c5bb2-68f8-02a6-a3de-fba086e5ec45@iki.fi>
Date:   Wed, 12 Jun 2019 03:02:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7722d8c1-90eb-2067-d711-4faf4c4851c3@iki.fi>
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

On 6/12/19 2:49 AM, Antti Palosaari wrote:
>>>> +    /* set ts clock freq to 10Mhz */
>>>> +       memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
>>>> +    cmd.wlen = 6;
>>>> +    cmd.rlen = 4;
>>>> +    ret = si2168_cmd_execute(client, &cmd);
>>>> +    if (ret) return ret;
>>>> +
>>>
>>> 0x03e8 is 1000 and value used is 10 000Hz steps ==> 10 000 000 = 
>>> 10MHz. Which means 8bit parallel ts bus has capacity of 80Mbit/s 
>>> which sounds correct max for DVB-T2. What is default value set to 
>>> that property? Many times those default values are just correct.
>>
>> The default value *is* 10Mhz. On all other si2168 hardware this does 
>> not need to be set but for some reason, on this hardware it needs to 
>> be set manually. The actual value has been scanned from the running 
>> windows driver by means of a USB logger. My best guess is that this 
>> whole si2168 driver has been written with the help of such a logger.
> 
> If the default value is already 10MHz then there is no need to set it at 
> all. I am a bit too lazy to start dumping that default value out from 
> the chip atm.

Looked from the pctv 292e sniffs, and it seems default is set to 7.2MHz.

$ grep -A1 "\\\x14\\\x00\\\x0d\\\x10" l.c
i2c_master_send_DEMOD(s->client, "\x14\x00\x0d\x10\xd0\x02", 6); //014597
i2c_master_recv_DEMOD(s->client, buf, 4); //014598 "\x80\x00\xd0\x02"


T230C windows driver does not touch that value at all. In theory default 
may be different on different chip revisions, but I haven't never seen 
such case so I suspect it is still 7.2MHz on your device.

regards
Antti

-- 
http://palosaari.fi/
