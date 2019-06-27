Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B2157E24
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 10:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbfF0IUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 04:20:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46893 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbfF0IUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 04:20:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so819267pfy.13;
        Thu, 27 Jun 2019 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3RgJU0GwNTvnzadM1vkxU/QANtXxO9a2tLz0nNjOGPw=;
        b=jmHk7+MjGsLPVd43UPu6xG+bVjK4+zIknDR8wiozf2QJUh9W89fhX0UdsGO4prcenM
         4Yo2yJev+yieMqz3MmRRJcgTIcmKadDvHRnX5B1J0cITltBAQinvwzjheoN6On8asYNx
         7w679Prj14asPuAotEqrvSsIIJViGsDriGzEjWqsUNuBNgZ/3wCRh+MaaeeTP6ZeF29f
         JwXWNiWlK3FUU26CtORr9JE2ODsLRXDweZKrNWpPxmNSHVUS8Ia0DbZnw2DLlrrdSF/L
         DrAn4zgnR3Fp/kcqewOPdLxV4KnYZD+Ph8Y3PQL+oWZCXSOKnxmUf52jOmxv7q5I7Tlk
         FEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3RgJU0GwNTvnzadM1vkxU/QANtXxO9a2tLz0nNjOGPw=;
        b=IJ538j4679nQocoIgt8ZW28QPzsF1tUxJXP8a5T1jn1jXrbtw88XaJh62x3MRrm5xZ
         yOyzTOPn8SimemsuxkGO70IplGULjw29aUpc53qRuTRRwagpD2yrKJeso6sz5jTEshVC
         R3MfRQY9w87xrHZvB/H2oHjPlr9cw3+4vW3ufjKz41x+KXTj5/+TvAPKT8m0fPGenKfQ
         3D60ZRDx6Wyl+KhRYiK1ib+rW78znK8RABYr09WOF1/eFKPyTAgv+YaCnVjctwQL1lfX
         oPb2OB1kda3DyOBs8qDjeWmqoIcerU60LZRtbCdZSybzeYjPocmbNrtqPsBlWglG7+9L
         /mjg==
X-Gm-Message-State: APjAAAWB5RLq01Wn7L5vslDbZtKnvE3mQlk9T0wj6GW6ov18x4iOPgL3
        TH4YNWXKVbaGYL5OKwqfegk=
X-Google-Smtp-Source: APXvYqx1lspp2IOaNIlqNAbGreqY2sDyZ+tgT0ObVmt5VNztI4hHaoENnV97RQjs5ZONCHGWvjIVUg==
X-Received: by 2002:a63:1a5e:: with SMTP id a30mr2434193pgm.433.1561623620180;
        Thu, 27 Jun 2019 01:20:20 -0700 (PDT)
Received: from [192.168.1.10] ([117.241.201.6])
        by smtp.gmail.com with ESMTPSA id m32sm834682pgl.85.2019.06.27.01.20.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 01:20:19 -0700 (PDT)
Subject: Re: [PATCH] media:vivid: add sanity check to avoid divide error and
 set value to 1 if 0.
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190626060115.4305-1-bnvandana@gmail.com>
 <3d2662db-21d8-3495-b0e4-e7c4cafbdb65@xs4all.nl>
From:   Vandana BN <bnvandana@gmail.com>
Message-ID: <a3d0ddaf-cd84-73c5-a3fc-92c3d47dc5b7@gmail.com>
Date:   Thu, 27 Jun 2019 13:50:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3d2662db-21d8-3495-b0e4-e7c4cafbdb65@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 27/06/19 12:58 PM, Hans Verkuil wrote:
> On 6/26/19 8:01 AM, Vandana BN wrote:
>> Syzbot reported divide error in vivid_thread_vid_cap, which has been
>> seen only once and doesnot have a reproducer.
>> This patch sanity checks for the denominator value with WARN_ON if it is 0 and replaces it with 1.
>>
>> Reported-by: syz...@syzkaller.appspotmail.com
>>
>> divide error: 0000 [#1] PREEMPT SMP KASAN
>> kobject: 'tx-0' (0000000017161f7f): kobject_uevent_env
>> CPU: 0 PID: 23689 Comm: vivid-003-vid-c Not tainted 5.0.0-rc4+ #58
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> RIP: 0010:vivid_cap_update_frame_period
>> drivers/media/platform/vivid/vivid-kthread-cap.c:661 [inline]
>> RIP: 0010:vivid_thread_vid_cap+0x221/0x284
>> drivers/media/platform/vivid/vivid-kthread-cap.c:789
>> Code: 48 c1 e9 03 0f b6 0c 11 48 89 f2 48 69 c0 00 ca 9a 3b 83 c2 03 38
>> ca
>> 7c 08 84 c9 0f 85 f0 1e 00 00 41 8b 8f 24 64 00 00 31 d2 <48> f7 f1 49
>> 89
>> c4 48 89 c3 49 8d 87 28 64 00 00 48 89 c2 48 89 45
>> RSP: 0018:ffff88808b4afd68 EFLAGS: 00010246
>> kobject: 'tx-0' (0000000017161f7f): fill_kobj_path: path
>> = '/devices/virtual/net/gre0/queues/tx-0'
>> RAX: 000000de5a6f8e00 RBX: 0000000100047b22 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
>> RBP: ffff88808b4aff00 R08: ffff88804862e1c0 R09: ffffffff89997008
>> R10: ffffffff89997010 R11: 0000000000000001 R12: 00000000fffffffc
>> R13: ffff8880a17e0500 R14: ffff88803e40f760 R15: ffff8882182b0140
>> FS:  0000000000000000(0000) GS:ffff8880ae800000(0000)
>> knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00000000004cdc90 CR3: 000000005d827000 CR4: 00000000001426f0
>> Call Trace:
>> kobject: 'gretap0' (00000000d7549098): kobject_add_internal: parent:
>> 'net',
>> set: 'devices'
>> kobject: 'loop2' (0000000094ed4ee4): kobject_uevent_env
>> kobject: 'loop2' (0000000094ed4ee4): fill_kobj_path: path
>> = '/devices/virtual/block/loop2'
>>   kthread+0x357/0x430 kernel/kthread.c:246
>> kobject: 'gretap0' (00000000d7549098): kobject_uevent_env
>>   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>> Modules linked in:
>> kobject: 'gretap0' (00000000d7549098): fill_kobj_path: path
>> = '/devices/virtual/net/gretap0'
>> ---[ end trace bc5c8b25b64d768f ]---
>> kobject: 'loop1' (0000000032036b86): kobject_uevent_env
>> RIP: 0010:vivid_cap_update_frame_period
>> drivers/media/platform/vivid/vivid-kthread-cap.c:661 [inline]
>> RIP: 0010:vivid_thread_vid_cap+0x221/0x2840
>> drivers/media/platform/vivid/vivid-kthread-cap.c:789
>> kobject: 'loop1' (0000000032036b86): fill_kobj_path: path
>> = '/devices/virtual/block/loop1'
>> Code: 48 c1 e9 03 0f b6 0c 11 48 89 f2 48 69 c0 00 ca 9a 3b 83 c2 03 38
>> ca
>> 7c 08 84 c9 0f 85 f0 1e 00 00 41 8b 8f 24 64 00 00 31 d2 <48> f7 f1 49
>> 89
>> c4 48 89 c3 49 8d 87 28 64 00 00 48 89 c2 48 89 45
>> kobject: 'loop0' (00000000dd9927c3): kobject_uevent_env
>> RSP: 0018:ffff88808b4afd68 EFLAGS: 00010246
>> RAX: 000000de5a6f8e00 RBX: 0000000100047b22 RCX: 0000000000000000
>> kobject: 'queues' (000000007ed20666): kobject_add_internal:
>> parent: 'gretap0', set: '<NULL>'
>> RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
>> RBP: ffff88808b4aff00 R08: ffff88804862e1c0 R09: ffffffff89997008
>> kobject: 'loop0' (00000000dd9927c3): fill_kobj_path: path
>> = '/devices/virtual/block/loop0'
>> R10: ffffffff89997010 R11: 0000000000000001 R12: 00000000fffffffc
>> kobject: 'queues' (000000007ed20666): kobject_uevent_env
>> R13: ffff8880a17e0500 R14: ffff88803e40f760 R15: ffff8882182b0140
>> FS:  0000000000000000(0000) GS:ffff8880ae800000(0000)
>> knlGS:0000000000000000
>> kobject: 'loop5' (00000000a41f9e79): kobject_uevent_env
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> kobject: 'queues' (000000007ed20666): kobject_uevent_env: filter
>> function
>> caused the event to drop!
>> CR2: 00000000004cdc90 CR3: 000000005d827000 CR4: 00000000001426f0
>> kobject: 'loop5' (00000000a41f9e79): fill_kobj_path: path
>> = '/devices/virtual/block/loop5'
>>
>> Signed-off-by: Vandana BN <bnvandana@gmail.com>
>> ---
>>  drivers/media/platform/vivid/vivid-kthread-cap.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
>> index f8006a30c12f..025a8c68bd1c 100644
>> --- a/drivers/media/platform/vivid/vivid-kthread-cap.c
>> +++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
>> @@ -658,6 +658,8 @@ static void vivid_cap_update_frame_period(struct vivid_dev *dev)
>>  	u64 f_period;
>>  
>>  	f_period = (u64)dev->timeperframe_vid_cap.numerator * 1000000000;
>> +	if(WARN_ON(dev->timeperframe_vid_cap.denominator == 0))
>> +		dev->timeperframe_vid_cap.denominator = 1;
>>  	do_div(f_period, dev->timeperframe_vid_cap.denominator);
>>  	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
>>  		f_period >>= 1;
>>
> Always run the patch over 'checkpatch.pl --strict'. It gives me:
>
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #83:
> This patch sanity checks for the denominator value with WARN_ON if it is 0 and replaces it with 1.
>
> ERROR: space required before the open parenthesis '('
> #175: FILE: drivers/media/platform/vivid/vivid-kthread-cap.c:661:
> +       if(WARN_ON(dev->timeperframe_vid_cap.denominator == 0))
>
> total: 1 errors, 1 warnings, 0 checks, 8 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
>
> /home/hans/x.eml has style problems, please review.
>
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
>
> Regards,
>
> 	Hans

Thanks Hans,

Sorry had missed running checkpatch, Will send a updated patch.

Regards,

Vandana.

