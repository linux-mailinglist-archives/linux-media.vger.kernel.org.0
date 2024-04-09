Return-Path: <linux-media+bounces-8946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBE89E0D5
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 18:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FA11F22694
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 16:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57476FCB;
	Tue,  9 Apr 2024 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="HQMi2ym3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328601509B4
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712681600; cv=none; b=EIjpgsJ0G1A7+9YYoZsTg2q9sOaavLB9hfQstsJyU9Q9ZNBQ3DR1pXQ+dcJbMkC2ym89tm9L0sNWKUOOqFzAIT4nO1uFFBfqxeEPUwUOGAz/UWXjlpc48809Ef1b5yi5b0yipUmartu0UnSiXMO6YQEI49ZasYfWrlbiy75IILM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712681600; c=relaxed/simple;
	bh=XW/cKXS47dSToNjHivxJI+dmAvfRUIEI3+x1pyJyZNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpUbn4i8DiUs+wnmN6H8dqIHdQc/T3TipJyj6RRC7sY/pHFsRemCfDfwwt9pQAFv9dgcL7aK5V4vdD/NCM5ce2PMaapCSezAlyd1o2PFGG99G02P2xsnqhoQYyozewumZ2LFZ8BOVKdeHWALUVU5SkpjNayRO5z1tL318QGAYFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=HQMi2ym3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-416c1d6504cso733515e9.1
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712681596; x=1713286396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ks8W5HAhxntR4JTIe7uMyj8tS0eQUNu82PBBacvu4NI=;
        b=HQMi2ym3L3WU3GsAv2+ZhxiYD3HlLYqkSEWfCN1nCxd5DC1pIzUZdgIN07XO1/VuPd
         TFXaw9acKIz8ZG1NC7cgrIutkyVMUVcUnsJD6IwcvZoHeUgMbHYNbLbBfl4CV82R+3LM
         M7HX2isaM9IGeRbAdWa07NM0+DCoBVEnq0LXwnreRRl8WjWnBqkj/PKbenDBKUcIZ97B
         Ddg3ZPO4SdqZFwzkAriaeaq5LokVO9VJjH0QYptQxKOJPd6/spYbo58K5V62L0ShMj4o
         Ifln059FWcPw8N1GQRzZRAEUkMQvHrWAfikDtJOzQdrAxoQZKmh0b8nzbK/Si0/5XQCe
         e+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712681596; x=1713286396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ks8W5HAhxntR4JTIe7uMyj8tS0eQUNu82PBBacvu4NI=;
        b=ct0K48DI6yRvIj3vALraeWFAZ8eyJm7G9NvHeaCCdJYiI6Pn8u/xgeR+SziVTkooRW
         5pZ5R6ti3dsCq0wcJrkPy10IC746Xn/oJT7mJcbELV9MtI96eJHkLKSz267y2D2UdcvC
         M5NX+eUECePAt8cgoq6PK2p8HUj57RI/BVt9CMMbMUeSFvDaLNb15PYP4UBniwOAsXt6
         SqHlTXkbp1Ni0uwBxVV2kW0EbddXxuPvzq5Nm7xj1h/3H+UBkk2OEPjxaFNPg0ASOLS3
         1g4AOMr+aH4k6o96n/xok22ey1EMn/rDtDOj8bPCaUF4n/vbn++Pi10AZiwbUNH4eBGd
         55sA==
X-Gm-Message-State: AOJu0Yy+4e8pvjlov27fZZWxddmg727e0M28WQs3wcf4vAxDc2BCklF1
	D5tY/JmfG72whAdjSzIMxbXFZwrxSLTbv4ny/HYPquAnbEoOEkQAFnMEYKaYufA=
X-Google-Smtp-Source: AGHT+IGZENGxoK8eqL3tiI2lcbMjU0HQSyrZoGRxi/80A/BsKuBtiBhdmcvCTEfsoMk+RzF8lx1y8g==
X-Received: by 2002:a05:600c:19cf:b0:415:691c:f83d with SMTP id u15-20020a05600c19cf00b00415691cf83dmr177952wmq.33.1712681596567;
        Tue, 09 Apr 2024 09:53:16 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b004166b960469sm8691750wmq.38.2024.04.09.09.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 09:53:15 -0700 (PDT)
Message-ID: <02a32387-1a30-44cd-b552-6e47023b997d@freebox.fr>
Date: Tue, 9 Apr 2024 18:53:15 +0200
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
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 13:27, Bryan O'Donoghue wrote:

> Can you give it a try ?

Random notes

For easy reference, I've used this command to test:

$ mpv --hwdec=v4l2m2m-copy --vo=tct --quiet --no-audio demo-480.webm

And it displays the video directly in the terminal :)
(Rendering speed depends on terminal size)

I'd never played the video to the end.
I notice I get:

[  397.410006] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d7c000
[  397.410114] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event session error 1001

How bad is that?


Sometimes, decoding simply fails immediately.
Must quit & restart.
Will have to script a 100 starts and check frequency of failures.


Will test with higher-resolution video.

# time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed demo-480.webm
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
Using hardware decoding (v4l2m2m-copy).
VO: [null] 854x480 nv12
[ffmpeg/video] vp9_v4l2m2m: capture POLLERR
Exiting... (Quit)
/*** HANGS UNTIL CTRL-C ***/

real	0m21.467s
user	0m3.795s
sys	0m1.914s


# time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed --length=30 demo-1440.webm 
 (+) Video --vid=1 (*) (vp9 2560x1440 59.940fps)
     Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
[ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
Using hardware decoding (v4l2m2m-copy).
VO: [null] 2560x1440 nv12
Exiting... (End of file)

real	0m16.433s
user	0m1.764s
sys	0m1.118s


Regards


