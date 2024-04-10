Return-Path: <linux-media+bounces-9038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBD89F449
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 15:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F17941C212CD
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD88115ECD2;
	Wed, 10 Apr 2024 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dk+M56r3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D815B153
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755771; cv=none; b=hyULtKCS4ggr2IoUpzNZEKVhXMAzrZtwhJY/o2/YgUhEB0jM9aDH8jGJMQboq/Ayp9L5WvIFct47qttR9sNKOUh7RTXq0ToFmOW3FYLvpZ2BZ5gpBQiC7MiilpAGbzw2xK6ga+TzPcidZWgPaRvzfZA74xwtD3sER+0yKvVg0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755771; c=relaxed/simple;
	bh=YVgwftwVY6+BzEoBnedEFymcgC78+dUg2rmNRT1jEhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2lzdFs0pM4g8r8YC/FrZ+dCrp6fJ6uD5M2LIaH440KE+7xcPXzXP7g324qPJnqsTFoFnhBWL4OIbCssGIh6zpCw99m1wq5K7UuFE4csKy1rrozoGQv3lANV0gkzQI17m/4pV6th92FIS6oC2oMlMn2hFREFYErzwv1I0hq+lrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dk+M56r3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-417c4bd59b3so1316085e9.2
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712755768; x=1713360568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c49iPDK4U7F9bhFe9uHIwDW1cTsFEeQxM7cJjpTwJmo=;
        b=Dk+M56r395GypZCQ0fB063i6N8kePS4UUx7Hlf8yTjRoQv2OvzHZzTxlEvk0YWKHEq
         AaB+h0MdFBt8/VrOPiUgFw+PSbZmNInzXq664g7dF40ZzU0mNP5qMFPc4JjXTJf/LTIC
         aK7HPN2muq7Wnu5e5KROoQPvVeXXalM672alIJI9o+giSSadVtvk2371cBnYmZCXIA80
         emptMF9BgqIeQ+riQ9/gGs1zXUaTXkcixL+cYlqQ8ZPbFYVcyC1XlU4tEuGqsW4eVgRL
         QX2qZ3m9tfjyb6QesjYY/nLHneg37pb/ALhxEi1s2YeaTEaD188pP8Zph9J0Ls2NH6Y/
         mIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755768; x=1713360568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c49iPDK4U7F9bhFe9uHIwDW1cTsFEeQxM7cJjpTwJmo=;
        b=gdH/BXqLXYgQi4liyLIyrKR2BiZikf+ruijqzm4Q6BDJccSYjtrfrunsoV8NmR1Wdw
         VvTK5/DOMKshxH5k1eG6CLC2H0yxHFGBnAgGehYdbnBLVcdAUwTGrKvL2Y3cy1WXTQoH
         J7gsadP5WeH9UKiwFDnrHah3gBHjfTU6LE3QvpseQ5n/sWnGAi4x8pv6J7fEUk3O4VEa
         uD9nee9OBFgLmZs+kA7SNqzu3MZqykKFZ+kwVw8REf4okGm+zLhB7XOtWJb8tF0GB2Yr
         14U+ZTggwTYTSPeNYJv69ySALxfuvUpc3RgCAjyUlAcS+TK4BJiWC+lzBMr0ZVihwLzN
         LKJw==
X-Gm-Message-State: AOJu0YzG2HWMkq9n+TaiVHH0rAJr34AFFkEliFF2Ew9HBguCDZIjXQaU
	I6V/p4hpvLOOOCRNMJcUlu2vw37HeDn6JnrdLke96QLmhprNsc4Xd+Ge0xTg6/w=
X-Google-Smtp-Source: AGHT+IEBCgd8KCtzGqcKZ/SY7hho9AXrqRJJTRZDuq1uMrfp0XF6kst7APRW+ta1RRPhszH4q6y+jA==
X-Received: by 2002:a05:600c:294c:b0:416:4973:4d59 with SMTP id n12-20020a05600c294c00b0041649734d59mr2118786wmd.12.1712755767939;
        Wed, 10 Apr 2024 06:29:27 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm2289683wms.26.2024.04.10.06.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:29:27 -0700 (PDT)
Message-ID: <014f64ca-fed4-4a44-bb61-154a2d6cd268@linaro.org>
Date: Wed, 10 Apr 2024 14:29:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Marc Gonzalez <mgonzalez@freebox.fr>,
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
 <651b56f2-1261-43b9-a078-adde5da555e7@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <651b56f2-1261-43b9-a078-adde5da555e7@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 14:18, Marc Gonzalez wrote:
> On 10/04/2024 15:14, Bryan O'Donoghue wrote:
> 
>> On 10/04/2024 13:23, Marc Gonzalez wrote:
>>
>>> FWIW, I get the same behavior with 854x480 and 2560x1440:
>>>
>>> 1) If mpv runs with '--length=N' (play only part of the file)
>>> then mpv exits cleanly, with no kernel messages.
>>
>> On -next ?
>>
>> I think you mentioned before you were doing your work on an older kernel
>> and forward porting patches ?
> 
> I work on v6.9-rc1
> Is -next that much different in that area?

No, I thought you were on a 4.x kernel for some reason.

6.9.x is fine

> 
>>> 2) If mpv plays the entire file, then mpv hangs at the end
>>> (needs CTRL-C to exit) and driver prints to kernel:
>>> [68643.935888] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d42000
>>> [68643.935995] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event : 1001
>>
>> Hmm
>>
>> #define HFI_ERR_SESSION_FATAL				0x1001
>>
>> Something is causing the firmware to return this packet to you.
>>
>> Probably worth tracing the last five messages sent by the firmware prior
>> to that to see if we can root-cause.
> 
> I'm not seeing anything from the FW in dmesg.
> I suppose I need to enable DEBUG in various places?

--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -129,7 +129,8 @@ struct venus_hfi_device {
         u8 dbg_buf[IFACEQ_VAR_HUGE_PKT_SIZE];
  };

-static bool venus_pkt_debug;
+#define DEBUG
+static bool venus_pkt_debug = true;

We can add additional flags - it'd be nice if these could be controlled 
by a module prameter or debugfs trigger - to this

venus_fw_debug = 0x2f;

But start with the default mask = int venus_fw_debug = 
HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL

---
bod


