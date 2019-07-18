Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B7A6C3CE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 02:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfGRA3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 20:29:34 -0400
Received: from jpvw.nl ([80.127.100.2]:34442 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727792AbfGRA3e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 20:29:34 -0400
Received: from localhost ([::1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hnuIb-0002q0-2y; Thu, 18 Jul 2019 02:29:29 +0200
Subject: Re: [PATCH V3.6 2/2] linux-media: dvbsky: add support for Mygica
 T230C v2
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>
References: <20190717180544.GA5356@jpvw.nl> <20190717181150.GB5495@jpvw.nl>
 <20190717192548.6d4jsyfbkj3y2z6w@gofer.mess.org>
From:   JP <jp@jpvw.nl>
Message-ID: <cb7975dc-e553-a07d-eac4-ecae1096b74b@jpvw.nl>
Date:   Thu, 18 Jul 2019 02:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717192548.6d4jsyfbkj3y2z6w@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/17/19 9:25 PM, Sean Young wrote:
> On Wed, Jul 17, 2019 at 08:11:50PM +0200, Jan Pieter van Woerkom wrote:
>> The T230C v2 hardware needs a mode of the si2168 chip to be
>> set for which the si2168 driver previously had no support.
>> This patch uses a specific measure to configure this on the
>> T230C v2 hardware only - see the flag passed via the ts_mode
>> attribute and its dependency on USB_PID_MYGICA_T230C2.
>>
>> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
>> Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
>> ---
>> diff -ru a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
>> --- a/drivers/media/dvb-frontends/si2168.c	2019-07-08 00:41:56.000000000 +0200
>> +++ b/drivers/media/dvb-frontends/si2168.c	2019-07-16 21:21:39.267802750 +0200
>> @@ -82,8 +82,18 @@
>>   
>>   	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
>>   
>> +	/* set manual value */
>> +	if (dev->ts_mode & SI2168_TS_CLK_MANUAL) {
>> +		memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
>> +		cmd.wlen = 6;
>> +		cmd.rlen = 4;
>> +		ret = si2168_cmd_execute(client, &cmd);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   	/* set TS_MODE property */
>>   	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
>> +	cmd.args[4] <<= (dev->ts_mode & SI2168_TS_CLK_MANUAL) >> 5;
> I'm sorry but this is not very readable. How about:
>
> 	if (dev->ts_mode & SI2168_TS_CLK_MANUAL)
> 		cmd.args[4] = SI2168_TS_CLK_MANUAL;
>
> ?
Yes you're right. I'll post update in this thread.
>
> Sean
>
>>   	if (acquire)
>>   		cmd.args[4] |= dev->ts_mode;
>>   	else
>> diff -ru a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
>> --- a/drivers/media/dvb-frontends/si2168.h	2019-07-08 00:41:56.000000000 +0200
>> +++ b/drivers/media/dvb-frontends/si2168.h	2019-07-16 06:29:53.913009262 +0200
>> @@ -30,6 +30,7 @@
>>   #define SI2168_TS_PARALLEL	0x06
>>   #define SI2168_TS_SERIAL	0x03
>>   #define SI2168_TS_TRISTATE	0x00
>> +#define SI2168_TS_CLK_MANUAL	0x20
>>   	u8 ts_mode;
>>   
>>   	/* TS clock inverted */

