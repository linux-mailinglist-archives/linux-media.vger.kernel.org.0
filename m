Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9B5F33BD
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 16:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387409AbfKGPr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 10:47:57 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:32783 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726640AbfKGPr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 10:47:57 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Sk0kiB0F0XYiTSk0nixhjt; Thu, 07 Nov 2019 16:47:55 +0100
Subject: Re: general protection fault in flexcop_usb_probe
To:     Oliver Neukum <oneukum@suse.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
References: <1564472907.25582.16.camel@suse.com>
 <00000000000081a9c1058ee1d06a@google.com>
 <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
 <1569229570.7831.3.camel@suse.com>
 <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
 <315c5ac2-c979-e194-0c79-d8704ff7f66a@xs4all.nl>
 <1573138928.3024.6.camel@suse.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <af0d67e6-7978-c4cc-0be3-40b7865d0016@xs4all.nl>
Date:   Thu, 7 Nov 2019 16:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573138928.3024.6.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEzDEFQO0+Ljbf/X5CAKUDUp1DGc6LTsjy891tKcZleyHRduGRHrfrj+d8HzeDe+r0p3ZkhfkW4iF5bzyca9MRHetN1JkxFBQGJ60jqdy65abEHTcpZR
 v1v+Lofs4i31ExQXZJbjC40Rux+CyOXtPlUU+q/Pke0KReHam96AyyEpaBDS6P7wwMTE4m6Mg7mJj2Nn9QUZjCSe4+T6btrcPonEG6uAYsHTXOBPUthF8mAe
 eL9OgUUkCJMNtZm5Dfqi3flLIa/SvrXYpNyOre53eg7hvdQcnndnXw3562EWSgNTjGpJtN0PNygR9VSinUzQLRLh6JuSytYkIRfDu9Xs+5Qlnt+keqZYIrnw
 2hGCwkU3tMBlrGLHoBuFUg4dTeYra8fwvH0rvogX9lce6CVgvijehHShrILU2SLGG32A7fIlI3Jy4ze2+r1nV1kHRqX87g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Mauro is very busy, so can you pick this up? And perhaps check patchwork for more
trivial DVB patches that can be included in a pull request?

Regards,

	Hans

On 11/7/19 4:02 PM, Oliver Neukum wrote:
> Am Montag, den 23.09.2019, 14:51 +0200 schrieb Hans Verkuil:
>> On 9/23/19 2:46 PM, Andrey Konovalov wrote:
>>> On Mon, Sep 23, 2019 at 11:21 AM Oliver Neukum <oneukum@suse.com> wrote:
>>>>
>>>> Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:
>>>>
>>>>>> Reported-and-tested-by:
>>>>>> syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
>>>>
>>>> [..]
>>>>> Hi Oliver,
>>>>>
>>>>> I was wondering if you've submitted this patch anywhere? The bug is
>>>>> still happening.
>>>>>
>>>>> https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f
>>>>
>>>> Hi,
>>>>
>>>> I definitely did submit it:
>>>> https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html
>>>
>>> Hi Mauro,
>>>
>>> Do you know what happened to this patch? Did it get lost?
>>>
>>> Thanks!
>>>
>>
>> Still sitting unreviewed in patchwork: https://patchwork.linuxtv.org/patch/57785/
>>
>> Not sure why this wasn't picked up.
> 
> Hi,
> 
> AFAICT it is still in the state new. What should I do?
> 
> 	Regards
> 		Oliver
> 

