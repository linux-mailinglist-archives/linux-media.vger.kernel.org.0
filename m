Return-Path: <linux-media+bounces-9033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4890389F3CB
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 15:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F6F51C2671D
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0967915E209;
	Wed, 10 Apr 2024 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sb3vIniG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6EC15B995
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754895; cv=none; b=rttKOVHUOCaUjgsbAwa6NfgWzchmlGJYhKT4JsHpfGNUIIaZa8ItPU7/z0E+9BCvUGSTmUNzFrmkg95kojV0iJ1tysS5yWwbyZZR5JMHElm2oY5TCFfr9KIwLzd7yAfiF2Tsg060mYy/9/r708LQdwXi1Uy0iZuIyxyQjrEvGIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754895; c=relaxed/simple;
	bh=uXFbl+hOdE9txcWiBEXvSwpFCOK4Yos5IknwcHdqRs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdYca8EVCjVDX23KLo8dqufEd/6u+f24UvfcJmzo+q3Us00CIG6dPguSkzB9htasVTHjUf9HU+NHyNZ1J4mgpu8GkwniDcQ9okA90WXPCJFTV7AdJJexdqtQJy77pTXAzSApP1qimqxEbofd0NH2AZz+bMooEe7dGMOPAJS14qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sb3vIniG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d3a470d5so6495067e87.3
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712754892; x=1713359692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OWA5VYSumWvXn/xluvVFDtGp6w2Gl1hNDs2VN3t5Yc=;
        b=Sb3vIniGCRUTnzOXakXHfhmUzSvCrQXqgyDZ82Wd+3nzELC3un/b7J0SV4VcGBFoDM
         StF4S76pd5re2XI4lZte/KdaXYKYbwVSir/yKAmHi3HuVZW/ma14uP3Tnxf34ibPR2tA
         ub014nmdkX/6gIFTh+ZiwElQ6I234SKSgU9PP/yAyePMkIUgQ+VowhMUs7V+nk7rKj9Z
         vlnUA8EOtN8bSbc7G0SCeBt4EGnOnaGuAhggg18bOBeZUcpXgAu5GCoswKenXDlBlf4n
         W1NVANe+abRc45Q5564AE1gQ9rcmv/aqVqO2eqOSplRSCHi1uiJ2xg19T41Af0B1BMT5
         QVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754892; x=1713359692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OWA5VYSumWvXn/xluvVFDtGp6w2Gl1hNDs2VN3t5Yc=;
        b=bkWbtzdBwZRBPYrbQDVAEwTSIPvb0ase0jeylfSzSPBXlmP2WBeCI0Ib0I2Z4ggRpB
         j/Rm8LVTisH2A9wMR8KFoxahp9lfhA9S2Qkfv1IEgq0+xxIDNA+Qtnr/PCqBRu2hCprq
         bI/q9NEGP3ISUGAUbIqgFmzGoIy5qoU4nBU7ZmSFD6rsfBWMyvxQqJAz81TRHzEKUz1R
         0kHbR3+rLUjpYh5hhYWy1emkGo4n/qWcy3kTVaWFLUeHVAR3H6KM6MkMTLxWg5N2gnoS
         2r0LYucc5foV67quspr2GGq4FL/4V0qdgY/HpfQPVut4kSXnm6zOjFpHFiuPnmoC/+E5
         lYPA==
X-Gm-Message-State: AOJu0YwK99vx5Nodgy/xQf9CJJvtpO7K8G5lFZGlRJ3J+e03LxCXGcZw
	U6VRJj5qHYPaOoKy2rVB/c8L1m+qHi1mPXYRHvDoooQNa9o5yVbhcyd9b48QmUk=
X-Google-Smtp-Source: AGHT+IHw0qZSvQTCawXFUUcbMIEMG9pEostk4xybTYS7z27dY7dAqPO2sYIVy1TUlITr6Dz1a4zYbw==
X-Received: by 2002:a19:c216:0:b0:513:de8d:203c with SMTP id l22-20020a19c216000000b00513de8d203cmr1589429lfc.28.1712754891782;
        Wed, 10 Apr 2024 06:14:51 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c451100b004174ff337f4sm1579420wmo.7.2024.04.10.06.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:14:51 -0700 (PDT)
Message-ID: <bd49cfcd-13d2-4e4f-bc9d-c491558e5af7@linaro.org>
Date: Wed, 10 Apr 2024 14:14:50 +0100
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
 <0159169f-8da9-4ca8-a427-8160a9b09a9c@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0159169f-8da9-4ca8-a427-8160a9b09a9c@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 13:23, Marc Gonzalez wrote:
> FWIW, I get the same behavior with 854x480 and 2560x1440:
> 
> 1) If mpv runs with '--length=N' (play only part of the file)
> then mpv exits cleanly, with no kernel messages.

On -next ?

I think you mentioned before you were doing your work on an older kernel 
and forward porting patches ?

> 2) If mpv plays the entire file, then mpv hangs at the end
> (needs CTRL-C to exit) and driver prints to kernel:
> [68643.935888] qcom-venus cc00000.video-codec: session error: event id:1001 (deadb000), session id:79d42000
> [68643.935995] qcom-venus-decoder cc00000.video-codec:video-decoder: dec: event : 1001

Hmm

#define HFI_ERR_SESSION_FATAL				0x1001

Something is causing the firmware to return this packet to you.

Probably worth tracing the last five messages sent by the firmware prior 
to that to see if we can root-cause.

---
bod

