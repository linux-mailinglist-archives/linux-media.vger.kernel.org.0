Return-Path: <linux-media+bounces-27169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA7A4854F
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 17:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100263AA10A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 16:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6084A1C6FED;
	Thu, 27 Feb 2025 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WRqqVmtP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDD1B0421
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740674220; cv=none; b=jYJmipH0U5/L2GPPxcfAzixKW/0EN5KvMxtjUIispfCsM3Xj++aBtuEikNu8syXU0KsdaHtAcJUaz5KxFAGK6ERKzDDppSQMk4YK1MnUgitK/ihteXyBuuekXbNWb0UcPfQjrlM1TJQ3plzabcUvpyLQ8m/uhA9SYGr9dqDH13g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740674220; c=relaxed/simple;
	bh=/gQrbEYi28B9yzHDRtDvI5K5t1xiTK4XRT9NEguTOIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5BQLtT/D83Ampxkkf5yI6PnneoJXQYuLbSnfA0XEOWklrVXWNI0RIAAPJCIqbZhuge7lc5W7tTH2m0O4DAt/EWtNU/rssxBOcuLMJcbsiY1bXcXJJf+f752laIy5n6s9Xgxo80He9V3hjnKIHTUDJcUl5TbFemjQL4Qfg0M0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WRqqVmtP; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d0465a8d34so10538315ab.0
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 08:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740674216; x=1741279016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InYxoOvYK+MD9saaA0tYT6jBk/j21+61ghGzj15uhx0=;
        b=WRqqVmtP18Bt2wY3f7W0HtTnHsBNweUbnJ3SgFRmtiIgXwrSAdC7LDAClTuXsEPWoQ
         0mZ3/K8/IlPeGYFCGCS0ld2xbByF/9zI3Vwaw2oMXhD8phMve+rVOayQfwe1NWyHPFSt
         mBec7nkXf2UuHPLOGbH2Khp1C2bghSCw+z8KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740674216; x=1741279016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InYxoOvYK+MD9saaA0tYT6jBk/j21+61ghGzj15uhx0=;
        b=dkjJudQEcxD3LrYN+kF++Q24PAz09aznhiqqqDrzlg0SgWHVedeRFHsFjKyg5bIdcZ
         1fth7D/KEZZ3ysaCn81y7XHQoz9ZEQ6Qedvg5W/Ybcx0DwEFVkb6oosZKqclVU1j9/TN
         ls7JllUcHdNel2oRhKLk3w/jqu9hCrMzLA/g6o+uv0UYD9yI4TPgSjPSHcNUg/lzb/fl
         /PjgzczoDKpWHUFeQqZdJTNNlaJhvbfqT7YVUmk5kmDSn/409th6RQezcuRLol/jP0rG
         rj8KBEEu5kXj5vFLt8Kf+Ubydx0kzew9UNViJsoHNbfhumU76AuVuBxi3tbYAJulUytI
         9wPQ==
X-Gm-Message-State: AOJu0YyGTqhKUXnRKQ+4W+8L3Z78EvrX9fg3Kbvknvn++3ON18kjZuFK
	p3G47FBTvvKlPTxlnOB9nEvPutYZ1qw770SNYmwTR17QSLQ7iqEX9v4ILn6trv8=
X-Gm-Gg: ASbGncvRQ2c7DQ+FhkOkWgqGuU1p8w+zi2jQbb224MvsLfmkUq8R/UgtH9cSY+jOzgp
	Mzmc6qvBW7NkGNH5qasiLKj9cnxmO2r4fEtcn3RWkfukpvQMAaAcNqNtEoVrSoAvbITpD+Qj1Ku
	+pYqdngQoizaE+nJ78UQELdLURaOcWqJudT75lOVjiyuZuZIrCg1cej8R9vjOeh+ROZQUNhatR8
	6WTYCmiy+Ti0M3/9W+FOFc41UeVK0uK9/qK+kHXfE6iap6eugRVEu76Y//zQi4UAfIMusBnsGHu
	FnEoQ06rS8u8hTcT/80J2vy1h9r8WBInGGn0
X-Google-Smtp-Source: AGHT+IFhaDi0loEVSzsUS9jUGD7nrYZwaXIdsSZjUkhx1kmsnPMxK6UYOZBYI0JOyD/TWTEfpVB3Ww==
X-Received: by 2002:a05:6e02:3092:b0:3d0:21aa:a756 with SMTP id e9e14a558f8ab-3d2cae4c215mr293742505ab.5.1740674216544;
        Thu, 27 Feb 2025 08:36:56 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deee50afsm3846715ab.71.2025.02.27.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 08:36:56 -0800 (PST)
Message-ID: <cffe9295-7070-4d69-896f-7f0a406861c9@linuxfoundation.org>
Date: Thu, 27 Feb 2025 09:36:55 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vimc: skip .s_stream() for stopped entities
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20250224154928.1220074-1-n.zhandarovich@fintech.ru>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250224154928.1220074-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/24/25 08:49, Nikita Zhandarovich wrote:
> Syzbot reported [1] a warning prompted by a check in call_s_stream()
> that checks whether .s_stream() operation is warranted for unstarted
> or stopped subdevs.
> 
> Add a simple fix in vimc_streamer_pipeline_terminate() ensuring that
> entities skip a call to .s_stream() unless they have been previously
> properly started.
> 
> [1] Syzbot report:
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5933 at drivers/media/v4l2-core/v4l2-subdev.c:460 call_s_stream+0x2df/0x350 drivers/media/v4l2-core/v4l2-subdev.c:460
> Modules linked in:
> CPU: 0 UID: 0 PID: 5933 Comm: syz-executor330 Not tainted 6.13.0-rc2-syzkaller-00362-g2d8308bf5b67 #0
> ...
> Call Trace:
>   <TASK>
>   vimc_streamer_pipeline_terminate+0x218/0x320 drivers/media/test-drivers/vimc/vimc-streamer.c:62
>   vimc_streamer_pipeline_init drivers/media/test-drivers/vimc/vimc-streamer.c:101 [inline]
>   vimc_streamer_s_stream+0x650/0x9a0 drivers/media/test-drivers/vimc/vimc-streamer.c:203
>   vimc_capture_start_streaming+0xa1/0x130 drivers/media/test-drivers/vimc/vimc-capture.c:256
>   vb2_start_streaming+0x15f/0x5a0 drivers/media/common/videobuf2/videobuf2-core.c:1789
>   vb2_core_streamon+0x2a7/0x450 drivers/media/common/videobuf2/videobuf2-core.c:2348
>   vb2_streamon drivers/media/common/videobuf2/videobuf2-v4l2.c:875 [inline]
>   vb2_ioctl_streamon+0xf4/0x170 drivers/media/common/videobuf2/videobuf2-v4l2.c:1118
>   __video_do_ioctl+0xaf0/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3122
>   video_usercopy+0x4d2/0x1620 drivers/media/v4l2-core/v4l2-ioctl.c:3463
>   v4l2_ioctl+0x1ba/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:906 [inline]
>   __se_sys_ioctl fs/ioctl.c:892 [inline]
>   __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f2b85c01b19
> ...
> 
> Reported-by: syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
> Fixes: adc589d2a208 ("media: vimc: Add vimc-streamer for stream control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>   drivers/media/test-drivers/vimc/vimc-streamer.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> index 807551a5143b..64dd7e0ea5ad 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> @@ -59,6 +59,12 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>   			continue;
>   
>   		sd = media_entity_to_v4l2_subdev(ved->ent);
> +		/*
> +		 * Do not call .s_stream() to stop an already
> +		 * stopped/unstarted subdev.
> +		 */
> +		if (!sd->s_stream_enabled)

The right interface to call is v4l2_subdev_is_streaming() instead
of checking s_stream_enabled directly.

> +			continue;
>   		v4l2_subdev_call(sd, video, s_stream, 0);
>   	}
>   }

Would it better to change vimc_streamer_pipeline_init() to not
call vimc_streamer_pipeline_terminate() instead here?

ret = v4l2_subdev_call(sd, video, s_stream, 1);
                         if (ret && ret != -ENOIOCTLCMD) {
                                 dev_err(ved->dev, "subdev_call error %s\n",
                                         ved->ent->name);
                                 vimc_streamer_pipeline_terminate(stream);
                                 return ret;
                         }


thanks,
-- Shuah

