Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DFCDAEB0
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 15:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394733AbfJQNqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 09:46:05 -0400
Received: from jpvw.nl ([80.127.100.2]:43040 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfJQNqF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 09:46:05 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1iL66N-0006yC-9a; Thu, 17 Oct 2019 15:46:03 +0200
Subject: Re: Logilink VG0022A firmware/si2157 probe
To:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org
References: <20191017090837.GA26546@gofer.mess.org>
 <07eae3df-5df1-eda4-8142-b228dc34b16c@iki.fi>
From:   JP <jp@jpvw.nl>
Message-ID: <9dbee108-4b8d-91a8-d858-01267389e068@jpvw.nl>
Date:   Thu, 17 Oct 2019 15:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <07eae3df-5df1-eda4-8142-b228dc34b16c@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi there,

On 10/17/19 2:15 PM, Antti Palosaari wrote:
> Hello,
>
> On 10/17/19 12:08 PM, Sean Young wrote:
>> Hi Antti,
>>
>> I have a Logilink VG0022A device which is an af9035.c type device (with
>> ITE 9xxx frontned). The probe of the si2146 tuner fails and returns 
>> 0xffs.
>>
>> Now I would like to work on fixing this. Mauro suggested the firmware 
>> might
>> be incorrect. Any tips on extracting the firmware? I can try and dump
>> usb traffic from Windows and see what firmware is being used there. 
>> How did
>> you extract the firmware?
If the receiver has onboard firmware, isn't that the right one? Then the 
windows
driver has no need to load one. Or am I missing the point here?
>>
>>
>> Any other suggestions for this device? You might be able to save me a 
>> lot
>> of time since you have experience with these types of devices, I do not.
>
> Extracting firmware is done almost always by following steps:
> 1) take sniffs from the some bus (usb/i2c)
> 2) identify firmware download section, detect it starting point and 
> ending point ~few first and last bytes
> 3) find that firmware binary located inside of binary driver
>  * grep, hexeditor, etc
>  * example LANG=C grep -obUaP "\x08\x05\x00" driver.sys
> 4) use dd command to copy firmware blob from binary driver to separate 
> file (you need to know firmware location and length inside binary)
>
>
> It is also possible to dump firmware to file from bus sniffs too, but 
> it requires writing some simple script. Dumping it from the binary 
> driver is usually still most easiest way.
>
> At some point I downloaded bunch of drivers to find out multiple 
> firmware versions for si2168 and made simple script to ease things. 
> Script is attached.
>
>
> After all, I suspect root of issue may be still be buggy i2c...
Me too.


Jan Pieter.
