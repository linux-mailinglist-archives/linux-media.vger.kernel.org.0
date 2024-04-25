Return-Path: <linux-media+bounces-10119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD18B26BC
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 18:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A6B52828A3
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 16:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA2F14D6F5;
	Thu, 25 Apr 2024 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="QRdsISB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87B14D6F1
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063440; cv=none; b=Sf8D65eDeRr1JYcyUN+qXn6B4MXxmj6JJe8E5j8iE0Q7D3iKzi5gQljRptdmsHb78jRDi1URa4JprriaZ4bWfNbHa5OjfEYOL2UbzQ+RDIT0x6FJScKtmad9cN3r/k3pVKnOWMa1LFvPG4vHQs6EJ+EFeDsMWHfI+pJy1JYUKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063440; c=relaxed/simple;
	bh=3kxz7AsKXzXWn4DaAGMcBJG0xrKX0PuhwgXwTSIT/Bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gd6/BctaPOwrXvX1h5jtew0atV4z8Xihg44BWDjHhMx93La6YfftToGZCQKOUqw+v95xmXnlWr7j+Ge4WkoezIwQwGFImYuK1wJ4r7Y6Ch2+7hAVJWTrmXca53IaoJeG83QLkgFN3k8vu8xvxQ+WHH/LW1MBJG75JL3Hvffu61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=QRdsISB4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41b79451145so379255e9.3
        for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714063436; x=1714668236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHsh8PsOVEXuvwiB4gHZufP9NhQWZSj9hxOJy/HEh5s=;
        b=QRdsISB4b5GJZ9HICEcsD5OnYg4Vm4guTJBiEBPUBGr5BBShSWw5s8L68ZrSERdufh
         5LOXmaVYVgZJvsNjOg+O9TNwobyMp60msIlNqEWoAsN1/sxsvxwfEJC18I4Mrh4+iyQU
         eWiWRbZTLWYlFTN1Wa+WzdYPLBP4YF01n27Vbr3tEPHwjDQPGkpJ/8moJLDsMiYXY0H0
         Sb8D3rXx7xmOez7etiC3FY7LYff6sOortxQGWQvH1RVHVyug1I0d/Sm0Po5+BNlg02rs
         wWAgS/SAJoC7RY7JVOYJPme1ygLblbS12lgjB9JmiLmK4mVYmu2cmy/Zk3xwHNFbijGI
         +EBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714063436; x=1714668236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHsh8PsOVEXuvwiB4gHZufP9NhQWZSj9hxOJy/HEh5s=;
        b=FxRKcpJeF9hB/eDxqwB3FQHEEz3gD2JJqnNVlNH22PY/2FiC4O34ICiUWXc9MDyOSp
         iZFKDP8GP0o52BBxRqPydpjsW93O5wk9L2mUhdPXPeaZIjoSU+x0mkOG0gcTFUz6n+Lc
         b0RmbiAR3qQKOrMhhkxgfi2nvwSy55QNxayF8yjcpTUC42PR4eKNnUP8HUSO075DI7Uu
         edAGZeRkuVlO4MsMxyhLaI2VnJtbQqXLRmgXDKemGyfJ9UsYb5lOHKY7OlQr50TfCPCW
         1obWvHaY2HU/ustNXeyO4BIN+e2C1oc5MQpspFVRxdujINN+Ab9KsVx0JL3ARikDGsK1
         5QMA==
X-Gm-Message-State: AOJu0YzJHUIXZSoJVS90F9xdS/96sYCrKuH1ARnf/Wna8z/pP3P5iMQL
	/02Cmk8FT5h4lYQ32cThGUiiYeNb5/KH0BDLnEPohKIbv9UZ2BLq/CFoNeGocVw=
X-Google-Smtp-Source: AGHT+IGqwWOlSqBYXdvnLoa59kUcziZN3LdMt0zBK+9adtDmgBlBa7dbSImTLfGYtAUhclTXawWsQA==
X-Received: by 2002:a05:600c:46c9:b0:41a:5d49:6143 with SMTP id q9-20020a05600c46c900b0041a5d496143mr12248wmo.12.1714063435910;
        Thu, 25 Apr 2024 09:43:55 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id hg16-20020a05600c539000b0041aa8ad46d6sm10618578wmb.16.2024.04.25.09.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 09:43:55 -0700 (PDT)
Message-ID: <234ffd1e-61f1-4726-893c-e525ee628e7c@freebox.fr>
Date: Thu, 25 Apr 2024 18:43:55 +0200
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
 <0159169f-8da9-4ca8-a427-8160a9b09a9c@freebox.fr>
 <bd49cfcd-13d2-4e4f-bc9d-c491558e5af7@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <bd49cfcd-13d2-4e4f-bc9d-c491558e5af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 15:14, Bryan O'Donoghue wrote:

> On 10/04/2024 13:23, Marc Gonzalez wrote:
>
>> FWIW, I get the same behavior with 854x480 and 2560x1440:
>>
>> 1) If mpv runs with '--length=N' (play only part of the file)
>> then mpv exits cleanly, with no kernel messages.
> 
> On -next ?
> 
> I think you mentioned before you were doing your work on an older kernel 
> and forward porting patches ?
> 
>> 2) If mpv plays the entire file, then mpv hangs at the end
>> (needs CTRL-C to exit) and driver prints to kernel:
>> [68643.935888] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d42000
>> [68643.935995] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event : 1001
> 
> Hmm
> 
> #define HFI_ERR_SESSION_FATAL				0x1001
> 
> Something is causing the firmware to return this packet to you.
> 
> Probably worth tracing the last five messages sent by the firmware prior 
> to that to see if we can root-cause.

On kernel command line: log_buf_len=16777216
Before decode: dmesg -n 1

# time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --quiet demo-480.webm
 (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
     Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
Using hardware decoding (v4l2m2m-copy).
VO: [null] 854x480 nv12
[ffmpeg/video] vp9_v4l2m2m: capture POLLERR
Exiting... (Quit)
real	0m26.810s
user	0m4.168s
sys	0m3.690s



Do you see anything relevant?


[  107.135902] tutu: 00000000: 24 00 00 00 01 10 02 00 00 b0 0c 7a 06 00 00 01  $..........z....
[  107.135908] tutu: 00000010: 00 00 00 00 00 00 00 00 00 00 70 d8 00 00 00 00  ..........p.....
[  107.135913] tutu: 00000020: 08 00 00 00                                      ....
[  107.135933] tutu: 00000000: 68 00 00 00 08 10 22 00 00 b0 0c 7a 00 00 00 00  h....."....z....
[  107.135939] tutu: 00000010: 4d 04 00 00 00 00 00 00 00 00 00 00 60 bf aa 12  M...........`...
[  107.135943] tutu: 00000020: 00 02 00 00 00 00 00 00 00 00 00 00 7e 1b 43 75  ............~.Cu
[  107.135948] tutu: 00000030: 00 10 0a 00 00 d8 09 00 00 00 00 00 56 03 00 00  ............V...
[  107.135953] tutu: 00000040: e0 01 00 00 00 00 00 00 00 00 00 00 0a 00 00 00  ................
[  107.135958] tutu: 00000050: 00 00 00 00 05 00 00 00 02 00 00 00 00 00 a0 d8  ................
[  107.135963] tutu: 00000060: 00 00 00 00 00 00 00 00                          ........
[  107.136433] tutu: 00000000: 2c 00 00 00 05 10 21 00 00 b0 0c 7a 00 00 00 00  ,.....!....z....
[  107.136464] tutu: 00000010: 00 00 00 00 00 10 0a 00 00 00 00 00 07 00 00 00  ................
[  107.136469] tutu: 00000020: 00 00 80 d8 00 00 00 00 00 00 00 00              ............
[  107.136614] tutu: 00000000: 3c 00 00 00 04 10 21 00 00 b0 0c 7a 00 00 00 00  <.....!....z....
[  107.136661] tutu: 00000010: 50 e5 b2 12 00 00 00 00 00 00 00 00 00 00 00 00  P...............
[  107.136667] tutu: 00000020: 00 00 00 00 00 00 26 00 9f 00 00 00 0a 00 00 00  ......&.........
[  107.136672] tutu: 00000030: 00 00 c0 da 00 00 00 00 28 3d fa 85              ........(=..
[  107.137791] tutu: 00000000: 28 00 00 00 07 10 22 00 00 b0 0c 7a 00 00 00 00  (....."....z....
[  107.137799] tutu: 00000010: 9c 00 10 00 18 17 11 00 0b 00 00 00 00 00 80 da  ................
[  107.137804] tutu: 00000020: 00 00 00 00 00 00 00 00                          ........
[  107.137815] tutu: 00000000: 88 00 00 00 04 00 02 00 04 00 00 00 6c 00 00 00  ............l...
[  107.137820] tutu: 00000010: 00 00 00 00 c8 11 01 00 0a 3c 56 46 57 5f 48 3a  .........<VFW_H:
[  107.137826] tutu: 00000020: 57 6f 72 6b 65 72 3a 76 70 39 64 3a 37 61 30 63  Worker:vp9d:7a0c
[  107.137832] tutu: 00000030: 62 30 30 30 3a 30 3e 20 56 50 39 20 48 65 61 64  b000:0> VP9 Head
[  107.137837] tutu: 00000040: 65 72 20 28 49 4e 54 45 52 20 46 52 41 4d 45 20  er (INTER FRAME 
[  107.137842] tutu: 00000050: 2d 20 66 72 6f 6d 20 61 63 74 69 76 65 5f 72 65  - from active_re
[  107.137847] tutu: 00000060: 66 5f 69 64 78 5f 65 6e 61 62 6c 65 64 29 3a 57  f_idx_enabled):W
[  107.137851] tutu: 00000070: 69 64 74 68 3d 38 35 34 20 48 65 69 67 68 74 3d  idth=854 Height=
[  107.137857] tutu: 00000080: 34 38 30 00 20 4b 65 79                          480. Key
[  107.137863] tutu: 00000000: 76 00 00 00 04 00 02 00 08 00 00 00 5a 00 00 00  v...........Z...
[  107.137868] tutu: 00000010: 00 00 00 00 c9 11 01 00 0a 3c 56 46 57 5f 45 3a  .........<VFW_E:
[  107.137874] tutu: 00000020: 57 6f 72 6b 65 72 3a 76 70 39 64 3a 37 61 30 63  Worker:vp9d:7a0c
[  107.137878] tutu: 00000030: 62 30 30 30 3a 30 3e 20 76 70 78 44 65 63 5f 50  b000:0> vpxDec_P
[  107.137883] tutu: 00000040: 61 72 73 65 46 6f 72 53 75 70 65 72 46 72 61 6d  arseForSuperFram
[  107.137888] tutu: 00000050: 65 28 38 33 32 35 29 3a 20 6d 61 72 6b 65 72 20  e(8325): marker 
[  107.137893] tutu: 00000060: 76 61 6c 75 65 20 62 65 66 6f 72 65 20 3d 20 30  value before = 0
[  107.137898] tutu: 00000070: 0a 00 46 52 3d 38                                ..FR=8
[  107.137905] tutu: 00000000: 75 00 00 00 04 00 02 00 08 00 00 00 59 00 00 00  u...........Y...
[  107.137909] tutu: 00000010: 00 00 00 00 ca 11 01 00 0a 3c 56 46 57 5f 45 3a  .........<VFW_E:
[  107.137915] tutu: 00000020: 57 6f 72 6b 65 72 3a 76 70 39 64 3a 37 61 30 63  Worker:vp9d:7a0c
[  107.137919] tutu: 00000030: 62 30 30 30 3a 30 3e 20 76 70 78 44 65 63 5f 50  b000:0> vpxDec_P
[  107.137924] tutu: 00000040: 61 72 73 65 46 6f 72 53 75 70 65 72 46 72 61 6d  arseForSuperFram
[  107.137929] tutu: 00000050: 65 28 38 33 33 30 29 3a 20 6d 61 72 6b 65 72 20  e(8330): marker 
[  107.137934] tutu: 00000060: 76 61 6c 75 65 20 61 66 74 65 72 20 3d 20 30 0a  value after = 0.
[  107.137940] tutu: 00000070: 00 00 46 52 3d                                   ..FR=
[  107.137946] tutu: 00000000: 7c 00 00 00 04 00 02 00 04 00 00 00 60 00 00 00  |...........`...
[  107.137952] tutu: 00000010: 00 00 00 00 cb 11 01 00 0a 3c 56 46 57 5f 48 3a  .........<VFW_H:
[  107.137957] tutu: 00000020: 56 70 70 44 65 63 3a 76 70 39 64 3a 37 61 30 63  VppDec:vp9d:7a0c
[  107.137962] tutu: 00000030: 62 30 30 30 3a 30 3e 20 56 50 78 20 44 65 63 6f  b000:0> VPx Deco
[  107.137967] tutu: 00000040: 64 65 72 3a 20 28 44 69 72 65 63 74 20 4d 6f 64  der: (Direct Mod
[  107.137971] tutu: 00000050: 65 29 20 53 50 44 2d 41 50 53 50 20 46 72 61 6d  e) SPD-APSP Fram
[  107.137976] tutu: 00000060: 65 20 31 30 30 36 37 20 44 6f 6e 65 20 53 65 73  e 10067 Done Ses
[  107.137981] tutu: 00000070: 73 69 6f 6e 20 30 0a 00 6e 20 30 0a              sion 0..n 0.
[  107.137987] tutu: 00000000: 53 00 00 00 04 00 02 00 04 00 00 00 37 00 00 00  S...........7...
[  107.137992] tutu: 00000010: 00 00 00 00 cc 11 01 00 0a 3c 56 46 57 5f 48 3a  .........<VFW_H:
[  107.137997] tutu: 00000020: 56 70 70 44 65 63 3a 76 70 39 64 3a 37 61 30 63  VppDec:vp9d:7a0c
[  107.138002] tutu: 00000030: 62 30 30 30 3a 30 3e 20 50 72 6f 63 65 73 73 69  b000:0> Processi
[  107.138007] tutu: 00000040: 6e 67 20 44 69 72 65 63 74 20 4d 6f 64 65 00 64  ng Direct Mode.d
[  107.138012] tutu: 00000050: 65 29 20                                         e) 
[  107.138018] tutu: 00000000: 68 00 00 00 04 00 02 00 04 00 00 00 4c 00 00 00  h...........L...
[  107.138024] tutu: 00000010: 00 00 00 00 cd 11 01 00 0a 3c 56 46 57 5f 48 3a  .........<VFW_H:
[  107.138028] tutu: 00000020: 56 70 70 44 65 63 3a 76 70 39 64 3a 37 61 30 63  VppDec:vp9d:7a0c
[  107.138033] tutu: 00000030: 62 30 30 30 3a 30 3e 20 56 50 78 20 44 65 63 6f  b000:0> VPx Deco
[  107.138038] tutu: 00000040: 64 65 72 3a 56 50 50 2d 53 44 45 20 50 72 6f 63  der:VPP-SDE Proc
[  107.138043] tutu: 00000050: 65 73 73 69 6e 67 20 46 72 61 6d 65 20 31 30 30  essing Frame 100
[  107.138048] tutu: 00000060: 36 38 0a 00 30 36 37 20                          68..067 
[  107.138054] tutu: 00000000: 81 00 00 00 04 00 02 00 04 00 00 00 65 00 00 00  ............e...
[  107.138059] tutu: 00000010: 00 00 00 00 ce 11 01 00 0a 3c 56 46 57 5f 48 3a  .........<VFW_H:
[  107.138064] tutu: 00000020: 56 70 70 44 65 63 3a 76 70 39 64 3a 37 61 30 63  VppDec:vp9d:7a0c
[  107.138069] tutu: 00000030: 62 30 30 30 3a 30 3e 20 56 50 78 20 44 65 63 6f  b000:0> VPx Deco
[  107.138074] tutu: 00000040: 64 65 72 3a 20 28 44 69 72 65 63 74 20 4d 6f 64  der: (Direct Mod
[  107.138079] tutu: 00000050: 65 29 20 53 65 6e 64 69 6e 67 20 46 72 61 6d 65  e) Sending Frame
[  107.138083] tutu: 00000060: 20 31 30 30 36 38 20 74 6f 20 56 50 50 2d 53 44   10068 to VPP-SD
[  107.138089] tutu: 00000070: 45 20 53 65 73 73 69 6f 6e 20 30 0a 00 00 00 00  E Session 0.....
[  107.138093] tutu: 00000080: 34                                               4
[  107.138111] tutu: 00000000: 24 00 00 00 01 10 02 00 00 b0 0c 7a 06 00 00 01  $..........z....
[  107.138117] tutu: 00000010: 00 00 00 00 00 00 00 00 00 00 a0 d8 00 00 00 00  ................
[  107.138121] tutu: 00000020: 05 00 00 00                                      ....
[  107.138137] tutu: 00000000: 68 00 00 00 08 10 22 00 00 b0 0c 7a 00 00 00 00  h....."....z....
[  107.138142] tutu: 00000010: 4d 04 00 00 00 00 00 00 00 00 00 00 48 40 ab 12  M...........H@..
[  107.138147] tutu: 00000020: 00 02 00 00 00 00 00 00 00 00 00 00 7e 1b 43 75  ............~.Cu
[  107.138152] tutu: 00000030: 00 10 0a 00 00 d8 09 00 00 00 00 00 56 03 00 00  ............V...
[  107.138157] tutu: 00000040: e0 01 00 00 00 00 00 00 00 00 00 00 0b 00 00 00  ................
[  107.138162] tutu: 00000050: 00 00 00 00 01 00 00 00 02 00 00 00 00 00 e0 d8  ................
[  107.138167] tutu: 00000060: 00 00 00 00 00 00 00 00                          ........
[  107.138173] tutu: 00000000: 3c 00 00 00 04 10 21 00 00 b0 0c 7a 00 00 00 00  <.....!....z....
[  107.138180] tutu: 00000010: 38 66 b3 12 00 00 00 00 00 00 00 00 00 00 00 00  8f..............
[  107.138186] tutu: 00000020: 00 00 00 00 00 00 26 00 32 00 00 00 0b 00 00 00  ......&.2.......
[  107.138191] tutu: 00000030: 00 00 80 da 00 00 00 00 28 3d fa 85              ........(=..
[  107.138699] tutu: 00000000: 2c 00 00 00 05 10 21 00 00 b0 0c 7a 00 00 00 00  ,.....!....z....
[  107.138712] tutu: 00000010: 00 00 00 00 00 10 0a 00 00 00 00 00 06 00 00 00  ................
[  107.138717] tutu: 00000020: 00 00 90 d8 00 00 00 00 00 00 00 00              ............
[  107.138947] tutu: 00000000: 3c 00 00 00 04 10 21 00 00 b0 0c 7a 00 00 00 00  <.....!....z....
[  107.138955] tutu: 00000010: 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................
[  107.138961] tutu: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[  107.138966] tutu: 00000030: 00 b0 ad de 00 00 00 00 00 00 00 00              ............
[  107.139622] tutu: 00000000: 1c 00 00 00 01 10 02 00 00 b0 0c 7a 02 00 00 00  ...........z....
[  107.139661] tutu: 00000010: 01 10 00 00 00 b0 ad de 03 00 01 00              ............

[  107.139670] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:7a0cb000
[  107.139695] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event session error 1001

[  107.139703] tutu: 00000000: 28 00 00 00 07 10 22 00 00 b0 0c 7a 03 10 00 00  (....."....z....
[  107.139708] tutu: 00000010: 10 00 00 00 0c 00 00 00 00 00 00 00 00 b0 ad de  ................
[  107.139713] tutu: 00000020: 20 00 00 00 c0 46 02 00                           ....F..
[  107.139726] tutu: 00000000: 88 00 00 00 04 00 02 00 04 00 00 00 6c 00 00 00  ............l...
[  107.139732] tutu: 00000010: 00 00 00 00 cf 11 01 00 0a 3c 56 46 57 5f 48 3a  .........<VFW_H:
[  107.139737] tutu: 00000020: 57 6f 72 6b 65 72 3a 76 70 39 64 3a 37 61 30 63  Worker:vp9d:7a0c
[  107.139742] tutu: 00000030: 62 30 30 30 3a 30 3e 20 56 50 39 20 48 65 61 64  b000:0> VP9 Head
[  107.139747] tutu: 00000040: 65 72 20 28 49 4e 54 45 52 20 46 52 41 4d 45 20  er (INTER FRAME 
[  107.139752] tutu: 00000050: 2d 20 66 72 6f 6d 20 61 63 74 69 76 65 5f 72 65  - from active_re
[  107.139757] tutu: 00000060: 66 5f 69 64 78 5f 65 6e 61 62 6c 65 64 29 3a 57  f_idx_enabled):W
[  107.139762] tutu: 00000070: 69 64 74 68 3d 38 35 34 20 48 65 69 67 68 74 3d  idth=854 Height=
[  107.139772] tutu: 00000080: 34 38 30 00 20 4b 65 79                          480. Key
[  107.139778] tutu: 00000000: 76 00 00 00 04 00 02 00 08 00 00 00 5a 00 00 00  v...........Z...
[  107.139783] tutu: 00000010: 00 00 00 00 d0 11 01 00 0a 3c 56 46 57 5f 45 3a  .........<VFW_E:
[  107.139788] tutu: 00000020: 57 6f 72 6b 65 72 3a 76 70 39 64 3a 37 61 30 63  Worker:vp9d:7a0c
[  107.139793] tutu: 00000030: 62 30 30 30 3a 30 3e 20 76 70 78 44 65 63 5f 50  b000:0> vpxDec_P
[  107.139798] tutu: 00000040: 61 72 73 65 46 6f 72 53 75 70 65 72 46 72 61 6d  arseForSuperFram
[  107.139803] tutu: 00000050: 65 28 38 33 32 35 29 3a 20 6d 61 72 6b 65 72 20  e(8325): marker 
[  107.139807] tutu: 00000060: 76 61 6c 75 65 20 62 65 66 6f 72 65 20 3d 20 30  value before = 0
[  107.139813] tutu: 00000070: 0a 00 46 52 3d 38                                ..FR=8
[  107.139819] tutu: 00000000: 75 00 00 00 04 00 02 00 08 00 00 00 59 00 00 00  u...........Y...
[  107.139824] tutu: 00000010: 00 00 00 00 d1 11 01 00 0a 3c 56 46 57 5f 45 3a  .........<VFW_E:
[  107.139829] tutu: 00000020: 57 6f 72 6b 65 72 3a 76 70 39 64 3a 37 61 30 63  Worker:vp9d:7a0c
[  107.139834] tutu: 00000030: 62 30 30 30 3a 30 3e 20 76 70 78 44 65 63 5f 50  b000:0> vpxDec_P
[  107.139839] tutu: 00000040: 61 72 73 65 46 6f 72 53 75 70 65 72 46 72 61 6d  arseForSuperFram
[  107.139843] tutu: 00000050: 65 28 38 33 33 30 29 3a 20 6d 61 72 6b 65 72 20  e(8330): marker 
[  107.139848] tutu: 00000060: 76 61 6c 75 65 20 61 66 74 65 72 20 3d 20 30 0a  value after = 0.
[  107.139853] tutu: 00000070: 00 00 46 52 3d                                   ..FR=


Regards

