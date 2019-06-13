Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884F044EB5
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 23:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfFMVt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 17:49:56 -0400
Received: from jpvw.nl ([80.127.100.2]:35068 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfFMVt4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 17:49:56 -0400
X-Greylist: delayed 1030 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jun 2019 17:49:56 EDT
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hbXKv-0000e7-5p; Thu, 13 Jun 2019 23:32:45 +0200
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
From:   JP <jp@jpvw.nl>
To:     Antti Palosaari <crope@iki.fi>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        linux-media@vger.kernel.org
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <5D015B88.14600.5E1D99A@Frantisek.Rysanek.post.cz>
 <38d8a697-3e3d-68e5-f3c6-e82588515f8b@iki.fi>
 <d60a351b-9bed-fbf7-b164-70337ec73a66@jpvw.nl>
 <38250cff-c758-cac8-64bf-dce679e7c826@jpvw.nl>
 <ca1eada3-82bd-f03a-9441-4e494899ec04@iki.fi>
 <ea0569b4-1925-405d-5836-2bab162b2cf1@jpvw.nl>
Message-ID: <216a798b-4a86-16a5-ccd3-e497956e4c5d@jpvw.nl>
Date:   Thu, 13 Jun 2019 23:32:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ea0569b4-1925-405d-5836-2bab162b2cf1@jpvw.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/13/19 3:45 AM, JP wrote:
>
>
> On 6/13/19 3:23 AM, Antti Palosaari wrote:
>> On 6/13/19 4:15 AM, JP wrote:
>>>>> And according to old usb sniffs from pctv 292e [Si2168B] default 
>>>>> manual ts clock is set to 7.2MHz, which means 57.6Mbit/s datarate, 
>>>>> it should be quite optimal for DVB-T2 max. In theory it could be a 
>>>>> little higher only when 10MHz channel bandwidth and most less 
>>>>> error correction FEC in use. And currently driver is using some 
>>>>> config that uses dynamic ts clock which clocks only when there is 
>>>>> data to feed. For some reason, usb-ts-bridge does not understand 
>>>>> that and manual configuration is needed (ts valid or ts-sync 
>>>>> connection?). If possible use 7.2MHz, if not: set to 10MHz.
>>>>>
>>>> That's perfectly alright with me. I'm now testing that 7.2Mhz 
>>>> value. Hold on.
>>> The driver crashes with the 7.2Mhz value! That was totally not what 
>>> I ever expected.
>>> Recompiled the whole kernel: crashes again. Then tried on debian 
>>> kernel 4.19: same thing.
>>> Food for thought?
>>
>> It should sure never crash the kernel. Changing a ts bitrate no, no, 
>> no, you trapped a hidden bug. Found where it is :]
>>
I did build complete new kernel from scratch: no more crash, but no data 
when set to 7.2Mhz. So definitely not possible.  The crashes must have 
come from me doing something else wrong.

Jan Pieter.

