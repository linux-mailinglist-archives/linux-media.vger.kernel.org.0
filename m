Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4585A62C4E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 01:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfGHXIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 19:08:22 -0400
Received: from jpvw.nl ([80.127.100.2]:38112 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbfGHXIW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 19:08:22 -0400
Received: from localhost ([::1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hkck7-0001Wb-UA; Tue, 09 Jul 2019 01:08:19 +0200
Subject: Re: [PATCH 1/2] dvbsky: add support for "Mygica T230C v2"
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Michael Ira Krufky <mkrufky@linuxtv.org>,
        Antti Palosaari <crope@iki.fi>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>
References: <20190616003929.GE4518@jpvw.nl>
 <20190625111615.s5kifm6nb2lafiw4@gofer.mess.org>
 <e87ac093-6466-4cd4-3346-1db17ae85495@jpvw.nl>
 <20190708100454.xwa4f64umoccwvca@gofer.mess.org>
From:   JP <jp@jpvw.nl>
Message-ID: <3a05f4ae-6275-8536-d262-704eedb86cd1@jpvw.nl>
Date:   Tue, 9 Jul 2019 01:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708100454.xwa4f64umoccwvca@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/8/19 12:04 PM, Sean Young wrote:
> Hallo Jan-Pieter,
>
>> On 6/25/19 1:16 PM, Sean Young wrote:
>>> On Sun, Jun 16, 2019 at 02:39:29AM +0200, Jan Pieter van Woerkom wrote:
>>>> From: Jan Pieter van Woerkom <jp@jpvw.nl>
>>>>
>>>> Adds support for the "Mygica T230C v2" into the "dvbsky" driver.
>>>> A small enhancement is also needed in the si2168 demodulator
>>>> driver, and a USB device ID in dvb-usb-ids.h .
>>>>
>>>> This is v3.3 of the proposed patch, based on feedback from Sean
>>>> Young and Antti Palosaari.
>>>> Tested by patch author on a T230C v2.
>>>> Tested by Frank Rysanek on a T230C v2: can tune into locally
>>>> available DVB-T and DVB-T2 muxes, video and audio playback works.
>>>> Applies cleanly against Linux 5.1.10 .
>>>>
>>>> The T230C v2 hardware needs a mode of the si2168 chip to be
>>>> set for which the si2168 driver previously had no support.
>>>> This patch uses a specific measure to configure this on the
>>>> T230C v2 hardware only - see the flag passed via the ts_mode
>>>> attribute and its dependency on USB_PID_MYGICA_T230C2. Other
>>>> devices using the si2168 demodulator driver are not affected
>>>> in any way.
>>>>
>>>> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
>>>> Tested-by: Frank Rysanek <Frantisek.Rysanek@post.cz>
>>>> ---
>>>> diff -ru a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
>>>> --- a/drivers/media/dvb-frontends/si2168.c	2019-06-04 07:59:45.000000000 +0200
>>>> +++ b/drivers/media/dvb-frontends/si2168.c	2019-06-08 19:47:32.385526558 +0200
>>>> @@ -91,8 +91,18 @@
>>>>    	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
>>>> +	/* set manual value */
>>>> +	if (dev->ts_mode | SI2168_TS_CLK_MANUAL) {
>>> This looks wrong. Should it not be "dev->ts_mode & SI2168_TS_CLK_MANUAL"?
>>> Now the expression is always true.
>> You're absolutely right. Silly me.
>>
>> What now? Correct and repost?
> Yes, please. I don't have the hardware to test so it would be great if
> you could repost a tested version, so we can merged that.
Done,  sent as new post to the linux-media list. I messed up one
subject line, 2/1 instead of 1/2.

Also, I made a another change (as per Antti's recommendation):
instead of piggybacking the magic value on the ts_mode variable,
define own boolean flag and use that when this special si2168
mode is needed.

> Thanks,
>
> Sean
>
Thank you,

Jan Pieter
