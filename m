Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E872A4BAE3B
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 01:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiBRARK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 19:17:10 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiBRARJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 19:17:09 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007CD2621
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 16:16:51 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4K0C1B62cCz9skS;
        Fri, 18 Feb 2022 01:16:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbmurf.de; s=MBO0001;
        t=1645143404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ja210NFWENAYaOJ3YZEGMm1Q5ZipJYBVFl0j3EXXLXc=;
        b=AcA13hDFqcyVqQR9DEvr+A+iTZYcZv+BQUTfzaBfSZDXkvYu2J37++IcF85r3W2KU1jF5x
        o+ZuHvNwhoSo6QCLSShHiD6F0EK0eEnyV2p8fkXJWE8CpyfZqxyUO7S7ofmvq+rMm+nPjv
        Ddw3QJ/zBuahekOcCb6ZWsAONaYAdUlqRZzVvlwnLTFb0sDjbKvRQNAo84MfXy9kt4IgQu
        P90bl280jgbravMV3B9bHXqBZfebGMjTTqg04d7810Slpz6KHEYpFhJt2Nfw+6SQmABID8
        DmjQCNicbBKASrT/uAuVQi60U1qVliOYnjYXsHO7lkJ/LsZ8AweTz/0evBs5Hg==
Message-ID: <59465a5d-9d47-5e96-3395-7a2c1a984c8e@elbmurf.de>
Date:   Fri, 18 Feb 2022 01:16:38 +0100
MIME-Version: 1.0
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US-large
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     sashal@kernel.org, linux-media@vger.kernel.org,
        Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
 <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
 <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
 <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
 <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
 <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
 <a0e25415-2db7-bea0-b00c-f1b4bf84d0d6@gmail.com>
 <a0ba3685-8c59-cb89-7f81-280c38a92c40@elbmurf.de>
 <3192902d-b04a-d59a-aea5-1fbd31c20fef@xs4all.nl>
From:   =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
In-Reply-To: <3192902d-b04a-d59a-aea5-1fbd31c20fef@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

thanks for reaching out. I’ve applied this patch on top of Linux 5.15.3 (with Pavel’s former patch) and I’m still experiencing this system hangs, effectively kernel panics after resume from standby + usbreset of my Hauppauge WinTV DualHD. So, it’s not solving my issue, but perhaps another one, I don’t know.

Regards
Maximilian

Am 17.02.22 um 12:14 schrieb Hans Verkuil:
> Hi Maximilian,
>
> On 20/01/2022 20:29, Maximilian Böhm wrote:
>> Hey Pavel,
>>
>> I would prefer reverting your use-after-free change. I’m still on Linux 5.15.2 to avoid this issue. I’m not sure if I understand your last mails correctly, did you already revert the change or did you
>> just offer to do it? Anyway, reverting locally wouldn’t be feasible long-term.
>> If I could help eliminating this bug, I would gladly offer my system for a remote hacking session via ssh or Teamviewer or try other patch ideas.
> I wonder if this patch:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20220122074500.429184-1-dzm91@hust.edu.cn/
>
> is perhaps related to this issue? Can you test if this patch solves your issue?
>
> If not, then I'll apply Pavel's revert patch for 5.18.
>
> Regards,
>
> 	Hans
>
>> Btw, found this forum thread describing the same original problem (which is forcing me to use usbreset after standby) on Windows, so this probably is a bug in the tuner hardware, not in the Linux
>> driver: https://www.dvbviewer.tv/forum/topic/63002-hauppauge-wintv-dualhd-stick-geht-oft-nicht-nach-standby/
>>
>> If I were to submit an official "device quirk" for the Linux kernel, would it be affected of your use-after-free change too? Nobody knows, I guess?
>>
>> Regards
>> Maximilian Böhm
>>
>> Am 06.01.22 um 12:57 schrieb Pavel Skripkin:
>>>> Anyway, you can revert my patch locally and use your device. I
>>>> understand, that this approach is the best one, but anyway revert will
>>>                 
>>>                   ^^^^
>>>
>>> I've missed "not". Please, don't get me wrong :) Reverting something
>>> locally to work with upstream device is never a good thing.
>>>
>>>
>>>
>>> With regards,
>>> Pavel Skripkin
