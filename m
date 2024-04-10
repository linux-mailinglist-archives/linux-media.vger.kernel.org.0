Return-Path: <linux-media+bounces-9018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEC89F1EF
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 14:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA364281A2C
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2F815530C;
	Wed, 10 Apr 2024 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="dqJ6gDGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9893159573
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751838; cv=none; b=CxOrAPXBGhrT5z3xFJ3ivuaiUari1QHhkMEgdMa/1nqCUzR0OWYQZ2ADqgrTDxjQks2VLPVXdBSetJb2AEKik/zBgIGWW2nxt0odhd0oYKaKTEa7Xn0Qe7umP4+/epKxfvne0lnDAlrmzdPQPiLlhCE3algzsZnOyjjntrI6xFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751838; c=relaxed/simple;
	bh=e+ZJdtZyvssHT56CEVNUUdUkI8UhMD0L43PpcTuGaOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJG1TvrBki1z1efgRaZ3COAy62tJUvJS7B2GsPRLGEy9ItKPAkcZzUx70Gv9v7QQlhnFgc9BmfncW8rrHB9+POlTEjF8ybYrTwogMBOZPyVWoWkIsX/X9DmGaukpBb6Ho43S+biT7MC1GK1ue3E2akwxcMOZhorp+drJQ6z1P0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=dqJ6gDGl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41739e4f8caso2542885e9.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712751834; x=1713356634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8x6Nrn7AVl+cr0wCTxEGtAzzHKDdSoB5g3NZwOJ3Xw=;
        b=dqJ6gDGlUfN67PkB4jYwj1xCc5XkmVT9fhhfEbt4p2O+MNbROiLtJvbq/OAcfxpdHb
         xbeQqTzjbZsLJLielF2Vum/b/6AciZ9fYB7g6bVay9Kk1GuA8KtgVByo5uRTFMqhTava
         pobOiJJBGxbpmvDuN2GZq+l1rtdIRqANVnAAEL88Lf4ItbCo7UF0SChy1A30SRmWVz3t
         nkLTMfUUSiX2zU6y2zWj9iVf7+/8OaylJodj1klsKSwx74JX6zd6nrfR9esgiR3i8bt4
         T0tQDCIKFIZMhTUZI6mC+Gi0C72dCJsYQ6HL78pJjklRCICH5Ga7fWW+ByRdrFCHgwsK
         JSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712751834; x=1713356634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8x6Nrn7AVl+cr0wCTxEGtAzzHKDdSoB5g3NZwOJ3Xw=;
        b=Y/cHPSn0BW6+cEM49okjb44vFNG6nUAp+Y8Y7OvcYiErnXuLdlTuZIMxlxRdErI9o7
         b9KBAokrdcb9FYQx9wEJXlxt+nJCyhEWwOJ02oauxHNYZKdtZzBNJFY0zydyU9ftVPYs
         v2M4o/tM73qSmPFiXaa/gNtzBUxn5THLGeR845Cb3qqS/scJ3D7RasFSnRqtnn93gKuY
         TM0RwJeW00RC+mARj9TAEbkRztL+pEkq/UxubCo0A08ibVOWPjc50dXudrbWBslyE7zd
         akFHAlp9ZWeARgbY7MU47kYQWyWWbedEdmzSdb5RVbQsinBQQux5Z3zzb5PqNlNseIuw
         bAdg==
X-Gm-Message-State: AOJu0Yzepwl7AFy5MfAO5GYvylV0DWmWiJdBgfx9E3XYhRCg7fTBcgA+
	E6dI34C3aqHbZILlaYn3J9VEB9V+3wNTr3eNvtlp0qL6Qr7UShg9aTNhzStVIe8=
X-Google-Smtp-Source: AGHT+IEyQPxZ16tRj7rIux0reBExurwF2/BlrIDmACF9HFIHz86aG7GTqSWrYUs7r8Q0ZZYJebEPRA==
X-Received: by 2002:a05:600c:3c89:b0:414:9676:4573 with SMTP id bg9-20020a05600c3c8900b0041496764573mr1487576wmb.36.1712751833932;
        Wed, 10 Apr 2024 05:23:53 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:bfb2:9137:62d7:74db? ([2a01:e34:ec24:52e0:bfb2:9137:62d7:74db])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041663450a4asm2097494wmn.45.2024.04.10.05.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:23:53 -0700 (PDT)
Message-ID: <0159169f-8da9-4ca8-a427-8160a9b09a9c@freebox.fr>
Date: Wed, 10 Apr 2024 14:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Marijn Suijten <marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
 <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
 <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
 <02a32387-1a30-44cd-b552-6e47023b997d@freebox.fr>
 <8b9cc46d-4267-43fb-b2be-f5996566a349@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <8b9cc46d-4267-43fb-b2be-f5996566a349@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 10:17, Bryan O'Donoghue wrote:

> On 09/04/2024 17:53, Marc Gonzalez wrote:
>
>> On 09/04/2024 13:27, Bryan O'Donoghue wrote:
>>
>>> Can you give it a try ?
>>
>> Random notes
>>
>> For easy reference, I've used this command to test:
>>
>> $ mpv --hwdec=v4l2m2m-copy --vo=tct --quiet --no-audio demo-480.webm
>>
>> And it displays the video directly in the terminal :)
>> (Rendering speed depends on terminal size)
>>
>> I'd never played the video to the end.
>> I notice I get:
>>
>> [  397.410006] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d7c000
>> [  397.410114] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event session error 1001
>>
>> How bad is that?
>>
>>
>> Sometimes, decoding simply fails immediately.
>> Must quit & restart.
>> Will have to script a 100 starts and check frequency of failures.
>>
>>
>> Will test with higher-resolution video.
>>
>> # time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed demo-480.webm
>>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> Using hardware decoding (v4l2m2m-copy).
>> VO: [null] 854x480 nv12
>> [ffmpeg/video] vp9_v4l2m2m: capture POLLERR
>> Exiting... (Quit)
>> /*** HANGS UNTIL CTRL-C ***/
> 
> I think there are a number of different resolutions across SoCs that 
> will exhibit this behavior, I've seen it with lower resolutions on 8250.
> 
> Its a bug that we need to drill into in Venus but I don't think is a bug 
> that is specific to your setup.
> 
>>
>> real	0m21.467s
>> user	0m3.795s
>> sys	0m1.914s
>>
>>
>> # time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed --length=30 demo-1440.webm
>>   (+) Video --vid=1 (*) (vp9 2560x1440 59.940fps)
>>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> Using hardware decoding (v4l2m2m-copy).
>> VO: [null] 2560x1440 nv12
>> Exiting... (End of file)
>>
>> real	0m16.433s
>> user	0m1.764s
>> sys	0m1.118s
> 
> If this higher resolution is stable for you, I'd say this is about baseline.
> 
> 1. The GDSC change should make no impact on playback or available resolution
> 
> 2. Higher more "normal" use cases like 1080p should be fine.
> 
> If so, then file "low resolution is broken" under a "known unknown" and 
> scrub your patches for submission.
> 
> If not, we need to do more 8998 specific debug.

FWIW, I get the same behavior with 854x480 and 2560x1440:

1) If mpv runs with '--length=N' (play only part of the file)
then mpv exits cleanly, with no kernel messages.

2) If mpv plays the entire file, then mpv hangs at the end
(needs CTRL-C to exit) and driver prints to kernel:
[68643.935888] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d42000
[68643.935995] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event session error 1001


# time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed demo-1440.webm 
 (+) Video --vid=1 (*) (vp9 2560x1440 59.940fps)
     Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
Using hardware decoding (v4l2m2m-copy).
VO: [null] 2560x1440 nv12
[ffmpeg/video] vp9_v4l2m2m: capture POLLERR
Exiting... (Quit)

real	2m43.292s
user	0m9.204s
sys	0m4.591s


# time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed --length=300 demo-1440.webm 
 (+) Video --vid=1 (*) (vp9 2560x1440 59.940fps)
     Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
Using hardware decoding (v4l2m2m-copy).
VO: [null] 2560x1440 nv12
Exiting... (End of file)

real	2m32.412s
user	0m8.401s
sys	0m4.917s


300 seconds decoded in 152 seconds = 2x for 1440p.

Will send the patch series in a few hours.

Regards


