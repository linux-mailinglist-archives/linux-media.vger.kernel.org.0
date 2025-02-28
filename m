Return-Path: <linux-media+bounces-27225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91574A4988E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD723B9451
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D9C25F790;
	Fri, 28 Feb 2025 11:49:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ADD241C99;
	Fri, 28 Feb 2025 11:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743364; cv=none; b=qvkrfTfGF81d092bnw8LYqkDIvThzoAbJU6rUjmGr1Qfgd0X0J3rSVeK29VkCaDn+L+eVU1ePXaRC5dZ8LCM+l+IzwlQOpumEkswccpXDN9k3xl5INJMC/R/2TTCLzMNM3ITyNQcR74/HTO1OvpgTKnPs+76rVuPrKcWCsZXK+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743364; c=relaxed/simple;
	bh=z9dLHg6FwMPdmlEcFS0/R9/QUqkKVjGSKO+pK1qa69g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UxbbjMyjyz1619Vqk+8Gsb9Bi8273dJzTabsJhT+vZ/Yudh+sHCeBE79bT5U7J1kDkqO7fXQeMvJUH8A/Q/mu5Aetwifyv2y/6q1431JWlU7Mq9fp/Y6p5c+WuCpWpqU/dtUEyjn0ZSmNLixXEHPTAjtVWxXD9ZZwLHI+qguYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 28 Feb
 2025 14:49:11 +0300
Received: from [192.168.211.132] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 28 Feb
 2025 14:49:10 +0300
Message-ID: <fec70d1f-4f52-4986-ae78-b3b4a6d4758c@fintech.ru>
Date: Fri, 28 Feb 2025 14:49:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vimc: skip .s_stream() for stopped entities
To: Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>
References: <20250224154928.1220074-1-n.zhandarovich@fintech.ru>
 <cffe9295-7070-4d69-896f-7f0a406861c9@linuxfoundation.org>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US
In-Reply-To: <cffe9295-7070-4d69-896f-7f0a406861c9@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

On 2/27/25 19:36, Shuah Khan wrote:
> On 2/24/25 08:49, Nikita Zhandarovich wrote:
>> Syzbot reported [1] a warning prompted by a check in call_s_stream()
>> that checks whether .s_stream() operation is warranted for unstarted
>> or stopped subdevs.
>>
>> Add a simple fix in vimc_streamer_pipeline_terminate() ensuring that
>> entities skip a call to .s_stream() unless they have been previously
>> properly started.
>>
>> [1] Syzbot report:
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 5933 at drivers/media/v4l2-core/v4l2-
>> subdev.c:460 call_s_stream+0x2df/0x350 drivers/media/v4l2-core/v4l2-
>> subdev.c:460
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 5933 Comm: syz-executor330 Not tainted 6.13.0-rc2-
>> syzkaller-00362-g2d8308bf5b67 #0
>> ...
>> Call Trace:
>>   <TASK>
>>   vimc_streamer_pipeline_terminate+0x218/0x320 drivers/media/test-
>> drivers/vimc/vimc-streamer.c:62
>>   vimc_streamer_pipeline_init drivers/media/test-drivers/vimc/vimc-
>> streamer.c:101 [inline]
>>   vimc_streamer_s_stream+0x650/0x9a0 drivers/media/test-drivers/vimc/
>> vimc-streamer.c:203
>>   vimc_capture_start_streaming+0xa1/0x130 drivers/media/test-drivers/
>> vimc/vimc-capture.c:256
>>   vb2_start_streaming+0x15f/0x5a0 drivers/media/common/videobuf2/
>> videobuf2-core.c:1789
>>   vb2_core_streamon+0x2a7/0x450 drivers/media/common/videobuf2/
>> videobuf2-core.c:2348
>>   vb2_streamon drivers/media/common/videobuf2/videobuf2-v4l2.c:875
>> [inline]
>>   vb2_ioctl_streamon+0xf4/0x170 drivers/media/common/videobuf2/
>> videobuf2-v4l2.c:1118
>>   __video_do_ioctl+0xaf0/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3122
>>   video_usercopy+0x4d2/0x1620 drivers/media/v4l2-core/v4l2-ioctl.c:3463
>>   v4l2_ioctl+0x1ba/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
>>   vfs_ioctl fs/ioctl.c:51 [inline]
>>   __do_sys_ioctl fs/ioctl.c:906 [inline]
>>   __se_sys_ioctl fs/ioctl.c:892 [inline]
>>   __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
>>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>>   do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7f2b85c01b19
>> ...
>>
>> Reported-by: syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
>> Fixes: adc589d2a208 ("media: vimc: Add vimc-streamer for stream
>> control")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>>   drivers/media/test-drivers/vimc/vimc-streamer.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/
>> drivers/media/test-drivers/vimc/vimc-streamer.c
>> index 807551a5143b..64dd7e0ea5ad 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
>> @@ -59,6 +59,12 @@ static void
>> vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>>               continue;
>>             sd = media_entity_to_v4l2_subdev(ved->ent);
>> +        /*
>> +         * Do not call .s_stream() to stop an already
>> +         * stopped/unstarted subdev.
>> +         */
>> +        if (!sd->s_stream_enabled)
> 
> The right interface to call is v4l2_subdev_is_streaming() instead
> of checking s_stream_enabled directly.
> 

Agreed, thank you for your suggestion, I'll fix it in v2.

>> +            continue;
>>           v4l2_subdev_call(sd, video, s_stream, 0);
>>       }
>>   }
> 
> Would it better to change vimc_streamer_pipeline_init() to not
> call vimc_streamer_pipeline_terminate() instead here?
> 
> ret = v4l2_subdev_call(sd, video, s_stream, 1);
>                         if (ret && ret != -ENOIOCTLCMD) {
>                                 dev_err(ved->dev, "subdev_call error
> %s\n",
>                                         ved->ent->name);
>                                 vimc_streamer_pipeline_terminate(stream);
>                                 return ret;
>                         }
> 

Correct me if I'm wrong but since we go through several entities in
vimc_streamer_pipeline_init(), some of them may have had streaming
enabled before we trigger an error here. And if we decide to exit early
due to said error, this is the time to stop all previously started
entities.

> 
> thanks,
> -- Shuah

Regards,
Nikita

