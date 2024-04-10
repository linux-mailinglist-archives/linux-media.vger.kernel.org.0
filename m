Return-Path: <linux-media+bounces-9034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9F89F3FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 15:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 804291F2BAE0
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE4616EC1C;
	Wed, 10 Apr 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="wqurcQrW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6531415ECF1
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755098; cv=none; b=KWGSCLW3K/WbhSMst3JjHrpJ+RAybwYdGiTqCTNja8eglgA0wwn9spf3rDPpASTsBxpL/hgmnutaK8b/yFATk1fF9J8NKpb5YuJR2A+DOk66NRFD5630OVJGBQOTzK3WccU1QF+lCOv05J5QOg4bsD3xMsyB1oDGBelTM9RQq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755098; c=relaxed/simple;
	bh=dScIXbUQTff79oDZvzu3Yv/RzfRcLRjFpRA3L5D7AG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMDhJSU7YjV20R13YHYj3aeYJcCsl2L3pPLne4yBk4T+BKqPOC7HT2TJOFqMkqZwk2dv8Tf37b2D6TsfLqczrjIRiQyDWCSK5pqE6mmzLxVttDk4aUz+lc3qWw2XmNWLqTBtK+7qyzrFjtdJtrZ92PrJt2ZHeknExmQ4aARmqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=wqurcQrW; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d094bc2244so71721321fa.1
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712755094; x=1713359894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/ZqBCuJ8jI4r5WlT45lVf8slQTQt2Hz6ehWiVptCxk=;
        b=wqurcQrWlQeQ8Hgw9qxydQaImInktd9dvdNahVcH2Th5Sb0hglpc8yh8t1weJTA5XO
         OOw0xzt6fe/FklllzP4e1g+rpUR5Uu4eWJTI99SYRLUZ2g2n/UjtvsYQkZRzgsD+C9XJ
         4DjNcF4CtBvgRMaCnSDD5v5C0Rj7GH+3MYPthfqVxOgNUOxuzTuqlFu3QreteY/wdoVb
         GnCqGn9sbRWBlQULCBrSxW3KWQVzcz1UXAQtDEUKf3qlVgNpsJ5/4INO0+39hkb/Rzuj
         hgGsd1HbVg0FRSyAirDsCRK7612E5qY29JCatkclQfG+XTDVrRU3pmJKwdtEFe0tkWte
         Q8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755094; x=1713359894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/ZqBCuJ8jI4r5WlT45lVf8slQTQt2Hz6ehWiVptCxk=;
        b=nrfftHDp1+Jw9JcODWobM2w62WGcwwULBmBltJjLy8RfgknFJnIqtE1Yhd3NEczAVV
         uraY84DEhc2bFgxiqLtsjg3XVxSFQCQ5Ph0IBLHyKrfAAq1iN+EbU4zQP2mrkknI4AIG
         YlXDK1LA1FcAxghUeYUbS8AaizBV5kbVF4UDFrTAbF2j1UM+KA1KNvWqeqD0bGLq1l4I
         2e3gix45oRgDE8ArU0Xp7dLM4rHuDHcytUOpqA98xD5XW1Sg0DorwOxk/J/Wmys4tG0M
         EyGog9oeAQoan8LL9mqtuN6ACUOE7TlAvgamOJmDcScOtM4C6mVDm4hDLhjTvZzZ3FPc
         LrlA==
X-Gm-Message-State: AOJu0YzQB/wz+kK/EMAwm6VXcEj0Sx3zys5s8LSqjF7wg7v2rPvLYKT2
	QmI68jcUPigoteTZp2OLw1MN4INWhXAHTwdtp0oAm+rtRnDSeI4CZ0l75cXvutc=
X-Google-Smtp-Source: AGHT+IEF3qoIE4rTZX6Jxi2wpub7yYbg4+8NBaMSoT2szlF/Y64ACcM/FW00cAU4NkjWROTDZTdd9w==
X-Received: by 2002:a05:651c:14c:b0:2d8:8eb4:11a6 with SMTP id c12-20020a05651c014c00b002d88eb411a6mr1724406ljd.12.1712755094517;
        Wed, 10 Apr 2024 06:18:14 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:bfb2:9137:62d7:74db? ([2a01:e34:ec24:52e0:bfb2:9137:62d7:74db])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05600c1f0a00b004162e3e5b9asm2248022wmb.44.2024.04.10.06.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:18:14 -0700 (PDT)
Message-ID: <651b56f2-1261-43b9-a078-adde5da555e7@freebox.fr>
Date: Wed, 10 Apr 2024 15:18:13 +0200
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

I work on v6.9-rc1
Is -next that much different in that area?

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

I'm not seeing anything from the FW in dmesg.
I suppose I need to enable DEBUG in various places?

Regards


