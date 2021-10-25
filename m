Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54DC4399C8
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 17:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhJYPPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 11:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbhJYPPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 11:15:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E54C061745;
        Mon, 25 Oct 2021 08:13:08 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id f1eqmGoUiFfMif1ermUucr; Mon, 25 Oct 2021 17:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635174785; bh=fIY1GIaSVdj5U3XrMAxDyWv4KHAUORx2wUkdkjhqXC8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aQWf8mKI/N+PtAuoDrZ04aYbmjcG+AVRujs+lv+EPoaW0Jd4kZ7nxAWRIehWqjPym
         IjRZZKVeZ6jNUY/gnKntbtfxPxzwz5IrEaAzcbba35fQ6SVLdPElqYITmJKxahxgHF
         1mFqwIhxTVvpr0LQHa+s+CHQzaCUZAiyiewyG5b5aY/P1bDBhZp6aqlW/utymYoYQY
         /BbWK5u8sE9Ub5UCs8V9x/niNdwSWr1RWHayQpz9BO/Y8plwQoNboM44E2uxelpEWW
         cUrZW0T3y9+x/6PUT74qw9s7fk3YMwOz2waNgvvnryid60AV2EuhYNDLd+n6oMaL3k
         iOWMOKf//suMQ==
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <da925d73-fdf0-3962-3841-a1dd53b5c5dd@xs4all.nl> <YXa9WGs7ewyaHmI9@Red>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <71b72175-538e-87e4-d662-e59fd4131a43@xs4all.nl>
Date:   Mon, 25 Oct 2021 17:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXa9WGs7ewyaHmI9@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKXsBZKZjWokjLzBUxVr/rlum1dMNHkXzuENEFfg6JbvVbzYGvw51c/XiE9qdH7QayonRkvslocJlN2TO65u3IEbETfbPC5AAscqAB7vmwlKUZOCQkrj
 NVyvRNnzcgzX6ZidqYF2R7xlTzbOL/I7c1uon5WmiiCiJ1uDJ3UEYTqWrE7AMkhycfqBECWYc9xWHiUOdEF0TWvXOe62sDWn1kpczQDyWyh8RpJ9OGSjS7qj
 zBz80kwslj7Z4Mh8z9Kjq7AMfyp2GJ+2tt709rTB2m1XVvTFGVB1agtjRLB6ZFZLDeTShk0nTxrHCvL5NUCpJTe0mi4ANgCVA1W5QMfDglEq0eRQZcDBb2Qk
 bdJE+sLv9HQfIy/4lL+Tgv6nqQcgUtpIQevsf0QPV6Q/imzqDUUiB4tMvX52/qd9MTJWhnGopfvZl28d1WSArALQtA0Nn4Cz5Xx2MbehNFPSdP7pcE8d9rGc
 jsbZ0Pyu1CFnbL1X4R2lrhUvD26XC1Yxb/EnzJrfwXJkpNXq7mf5WW1+M4E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 16:21, LABBE Corentin wrote:
> Le Mon, Oct 25, 2021 at 02:45:02PM +0200, Hans Verkuil a écrit :
>> Hi Corentin,
>>
>> On 13/10/2021 20:58, Corentin Labbe wrote:
>>> Hello
>>>
>>> The main change of this serie is to fusion all zoran related modules in
>>> one.
>>> This fixes the load order problem when everything is built-in.
>>>
>>> Regards
>>>
>>> Changes since v1:
>>> - add missing debugfs cleaning
>>> - clean some remaining module_get/put functions which made impossible to
>>>   remove the zoran module
>>> - added the two latest patchs
>>
>> Something weird is wrong with this series. I have a DC30, but loading this with:
>>
>> modprobe zr36067 card=3
>>
>> results in this error message in the kernel log:
>>
>> [   58.645557] zr36067: module is from the staging directory, the quality is unknown, you have been warned.
>> [   58.646658] zr36067 0000:03:00.0: Zoran MJPEG board driver version 0.10.1
>> [   58.646793] zr36067 0000:03:00.0: Zoran ZR36057 (rev 1), irq: 18, memory: 0xf4000000
>> [   58.648821] zr36067 0000:03:00.0: Initializing i2c bus...
>> [   58.662420] vpx3220 22-0047: vpx3216b found @ 0x8e (DC30[0])
>> [   58.737445] zr36067 0000:03:00.0: Fail to get encoder
>>
>> This works before, so why this is now failing is not clear to me.
>>
>> It does work with 'card=0', but I really have a DC30.
>>
>> If I test with 'card=0' then the rmmod issue is now solved.
> 
> Everything normal, since card 0 does not have encoder.
> Could you check that adv7175 is compiled ?

Yes, and it loaded as well (I see it with lsmod).

However, there is no adv7175 on my board, instead it appears to have an ITT MSE3000.
There is no driver for this one (and I don't even think it is an i2c device), so
I suspect that before the driver just continued without encoder support, whereas now
it fails when it can't load the encoder.

Could that be the reason? In the absence of an encoder, I think it should just
continue, esp. since the driver doesn't use the encoder anyway.

Regards,

	Hans

> 
> I got the same problem with my DC10+ where saa7110 was not compiled.
> This issue was reproduced randomly and I have no explanation. (kconfig problem ?)
> 
> Regards
> 

