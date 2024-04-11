Return-Path: <linux-media+bounces-9090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4458A0BC3
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5B81F2492A
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E3E14264F;
	Thu, 11 Apr 2024 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcrsyNel"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848813DDC3
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826152; cv=none; b=o6yB9JSc+/EDHJRkhlyB/RMrlNfpdG/IgN4TImV97nIOmrRVz65MngMjAWd8V+QSlcr+AFfcganf/FYCyW+RvHNjPrE+T3oUqEmBq/8mBq+JdGedevD/arivQ0DuXINnaB7R2+qVw8HuXQxeqIgUCFwCfyY+sUEpjEEd+QF7g+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826152; c=relaxed/simple;
	bh=HQLR5v8dHbAgT5JsnA4jrGnYtBzOHB94zNCkt2VsBv0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hVkFv/6/p2e1n/kSErDdka+5Ai50U1t/MUCYjfnuI9uWu9i+px6gzumVH1I8kVeorcO4BEcziaBPDedHbx82HsfriReHkLsy/2iVOiOBzwut9gDxHmOzHeojVuVxVs6BoG1TuTCXrb0a7XFqMJHbNGT10C4SCQKg2b7ir/Hx6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcrsyNel; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-346b09d474dso565616f8f.2
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712826149; x=1713430949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5v9YozhmdzgXiTELH0nicoXPoxpaUBv6/qUNPM0IjXg=;
        b=zcrsyNelPOQ5FfbFJB4K8qUDE677F+0sDTzxXTMYqgvvt2aw3comB/qiD0I+EZSUW4
         OB0kLA0AIJItCsfk6SQiZpzcGJNZ8r169u4Bj1r8paOXrnN3ow1WaXnZTmxcJzCy19jA
         fQq5gzfb6GkAK2TiekHiBEUUeDpyvoshLBy+uAglas7/fiJaeiIkHGZ39hLnn+H+4Xrr
         d3C7OPXdcVKGrl0fAEreJ63fYkOlkYkjgwNhjVeoI6fhfMYDSH/9Jr1fAb2GPRL7JDWo
         JTSNFfDMByvftNHPXZaR8/lSDw8vo6yuZLYzM8s2NwV9XX3cVRRGcoqyUs9Uk534CI8f
         001Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826149; x=1713430949;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5v9YozhmdzgXiTELH0nicoXPoxpaUBv6/qUNPM0IjXg=;
        b=ri7cfvXXzmjiuhiw64DOuaaZZVBWR3dvN+Qzqwdt/C8l4w9qoR0xht2Jgrs0yXqdhq
         dXZNC9OcxevkdSe/KZn6jpR+SuoQyFrAsYRTf7q/iBdaicCbIe53SuSCJq4HoVSZAJjZ
         pVREADkON4Ub9ndsWANmMA/i+Xq23yOfTlFd6vKDc/eLblr6ovHxZJ5R4mOC/wYU+tbr
         7pPv6sy02i7p9UnBN4uLlqZ1lXiQbvoSpB73U9GMDN8tQiRtbOjsACFTv9I93Bdg0/n2
         F75qjcYRoR5YB2LA3g2UGmiwoQBATxAN6w48NX8UsPXCYIP+BBqV2yfqSXwTO5Zcrhj7
         Zs4Q==
X-Gm-Message-State: AOJu0Yzt1yNymkoNz8C9OLMyBJSGazeSVkPXutGrhSe9IQKOYAdvWqUQ
	0P+kPqcljC+MaiQJ+oEmyQOKTUepBg47tx9a3ncVZwlRcTgnKumiexTObkCIVpI=
X-Google-Smtp-Source: AGHT+IF+6tI7PyCZj9mhlBeLnOVQpKv9aou4b8uDFyq4b/Xepm29ZZSRq4KERLkrVFdFW8a9cYvPuw==
X-Received: by 2002:adf:f283:0:b0:343:6b09:653c with SMTP id k3-20020adff283000000b003436b09653cmr4113019wro.43.1712826149353;
        Thu, 11 Apr 2024 02:02:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d6852000000b00343e8968917sm1285454wrw.1.2024.04.11.02.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:02:29 -0700 (PDT)
Message-ID: <b93ff9ea-367c-4382-bce2-4c8fa95cb849@linaro.org>
Date: Thu, 11 Apr 2024 10:02:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
In-Reply-To: <bd49cfcd-13d2-4e4f-bc9d-c491558e5af7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/04/2024 14:14, Bryan O'Donoghue wrote:
> On 10/04/2024 13:23, Marc Gonzalez wrote:
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
>> [68643.935888] qcom-venus cc00000.video-codec: session error: event 
>> id:1001 (deadb000), session id:79d42000
>> [68643.935995] qcom-venus-decoder cc00000.video-codec:video-decoder: 
>> dec: event : 1001
> 
> Hmm
> 
> #define HFI_ERR_SESSION_FATAL                0x1001
> 
> Something is causing the firmware to return this packet to you.
> 
> Probably worth tracing the last five messages sent by the firmware prior 
> to that to see if we can root-cause.
> 
> ---
> bod

BTW I think you've found two bugs here

1. When we receive a fatal error from firmware we don't "bug out"
    properly. So we hang forever waiting for more events which
    won't come.
    We should fix the handling of SESSION_FATAL to => termination.
    Clearly after HFI_ERR_SESSION_FATAL we should be completely done
    not hanging around waiting for additional inputs.

2. Why do we get a fatal error for the session ?
    Are we continuing to send commands to the firmware after
    termination maybe - so is there a incongruous context
    between firmware and Linux ?

I don't think either is a blocker specifically for your DTS submission 
so I think you should go ahead with your DTS stuff.

Also though, I think 1) we don't exit properly on HFI_ERR_SESSION_FATAL 
and 2) we should root-cause why HFI_ERR_SESSION_FATAL is generated at all.

---
bod

