Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0B2447A2
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392976AbfFMRBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:07 -0400
Received: from jp.dhs.org ([62.251.46.73]:49022 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729741AbfFLXqm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:42 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hbCwx-0002jz-5j; Thu, 13 Jun 2019 01:46:39 +0200
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     Antti Palosaari <crope@iki.fi>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        linux-media@vger.kernel.org
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <5D015B88.14600.5E1D99A@Frantisek.Rysanek.post.cz>
 <38d8a697-3e3d-68e5-f3c6-e82588515f8b@iki.fi>
From:   JP <jp@jpvw.nl>
Message-ID: <d60a351b-9bed-fbf7-b164-70337ec73a66@jpvw.nl>
Date:   Thu, 13 Jun 2019 01:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <38d8a697-3e3d-68e5-f3c6-e82588515f8b@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/13/19 12:31 AM, Antti Palosaari wrote:
> On 6/12/19 11:07 PM, Frantisek Rysanek wrote:
>> On 12 Jun 2019 at 1:28, Antti Palosaari wrote:
>> [...]
>>>
>>> What is that T230C2 stick?
>> JP has already explained the details, how that name was arrived at.
>> As previously suggested, I can call it T230C v2 in the descriptive
>> texts. I'd suggest keeping T230C2 in the USB ID macro (or suggest
>> a more appropriate name for the macro).
>>
>> Here in CZ, a company called Abacus imports and distributes consumer
>> electronics gadgets under a private brand "EvolveO" - and this is how
>> the "rebadged OEM Mygica" has reached me.
>>    http://m.evolveo.com/cz/sigma-t2
>> This particular T2 dongle is "allover the place" around here, no
>> other dongle is this broadly available. (Well on our modest market.
>> We're a nation of 10M people.)
>>
>>> Naming sounds like a DVB-C2 capable, but I
>>> found only T230C model from MyGica site.
>>>
>> The local brand's site only mentions DVB-T2.
>> The 2-page "brief datasheet" of the si2168 that's publically
>> available only mentions DVB-C, apart from T/T2.
>>
>>> And also patch should be split to two logical parts, first add 
>>> manual ts
>>> frequency support to si2168 and then other patch which adds device 
>>> itself.
>>>
>> I'll try to find some time and massage that approach into the code.
>> I have read all the past attempts (example patches) and the
>> maintainer's polite objections.
>>
>>> And which are tuner and demod versions/revisions used for that device?
>>>
>> That's reported in dmesg if memory serves... I'll try to find the
>> answer.
>>
>> Frank Rysanek
>>
>
> Yeah, all-in-all:
> 1) name it T230C v2
> 2) use manual ts clock speed
>
> And according to old usb sniffs from pctv 292e [Si2168B] default 
> manual ts clock is set to 7.2MHz, which means 57.6Mbit/s datarate, it 
> should be quite optimal for DVB-T2 max. In theory it could be a little 
> higher only when 10MHz channel bandwidth and most less error 
> correction FEC in use. And currently driver is using some config that 
> uses dynamic ts clock which clocks only when there is data to feed. 
> For some reason, usb-ts-bridge does not understand that and manual 
> configuration is needed (ts valid or ts-sync connection?). If possible 
> use 7.2MHz, if not: set to 10MHz.
>
That's perfectly alright with me. I'm now testing that 7.2Mhz value. 
Hold on.
And we were thinking in that same line of ts_sync connection.

BTW this is the link for where that value of 10Mhz stems from:
https://github.com/ljalves/linux_media/issues/164#issuecomment-335011689

