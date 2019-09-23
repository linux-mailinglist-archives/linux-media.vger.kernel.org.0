Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0966BB443
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 14:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502066AbfIWMvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 08:51:15 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33445 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2502051AbfIWMvP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 08:51:15 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CNo5ixHRJKKNGCNo8ilrbp; Mon, 23 Sep 2019 14:51:13 +0200
Subject: Re: general protection fault in flexcop_usb_probe
To:     Andrey Konovalov <andreyknvl@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
References: <1564472907.25582.16.camel@suse.com>
 <00000000000081a9c1058ee1d06a@google.com>
 <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
 <1569229570.7831.3.camel@suse.com>
 <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <315c5ac2-c979-e194-0c79-d8704ff7f66a@xs4all.nl>
Date:   Mon, 23 Sep 2019 14:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFowtxYXQYVklFRqngAPj7UXLJ/E6SCZlZlCtRmcMRq/3t5vO5RTXkXi0WH9i811+FTjuMEwXohcqGFRjkpPNuk2qwwRkeXQr7+sgNdb6pNkGIkAmBe9
 ZWEo+iwMu5DGiAKQ7wGUp6mm+5EvKtyJtq0PFdMDQrYK/KG9IF5gwmTGytHBqx+UZ9nUUrIm1E4ekj7IwvrKjUpkpjHg+99HBoxpmoGu4f4qPIr1rp6i2R+p
 vZX7ZgaauxfLARL7e646W1TEMIMJi4WZHf0g5jS7EE/764qVNHoR8pWczSFG7fXmMoqpLfUhpyvI3u9regvQX0sM6f0h1KlwVkLd0Mm+vgDpF7pa5VB30bPY
 BZ9A8vGMBaI8KQzhlG35wUuoQUtTpEXO0kHldbkwW0U7ewjxsHlt5dAa6gGRfLis3zpet3GV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/23/19 2:46 PM, Andrey Konovalov wrote:
> On Mon, Sep 23, 2019 at 11:21 AM Oliver Neukum <oneukum@suse.com> wrote:
>>
>> Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:
>>
>>>> Reported-and-tested-by:
>>>> syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
>>
>> [..]
>>> Hi Oliver,
>>>
>>> I was wondering if you've submitted this patch anywhere? The bug is
>>> still happening.
>>>
>>> https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f
>>
>> Hi,
>>
>> I definitely did submit it:
>> https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html
> 
> Hi Mauro,
> 
> Do you know what happened to this patch? Did it get lost?
> 
> Thanks!
> 

Still sitting unreviewed in patchwork: https://patchwork.linuxtv.org/patch/57785/

Not sure why this wasn't picked up.

Regards,

	Hans
