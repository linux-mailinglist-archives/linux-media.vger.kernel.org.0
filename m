Return-Path: <linux-media+bounces-32609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C972AB8E26
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 19:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8337A036D3
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 17:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3164225B1E0;
	Thu, 15 May 2025 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlQ2rUfV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE5244679
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331499; cv=none; b=EtWIDjo7sjZYPpU8w6TpJNRRK9Bq0y2juozY8GxP15ZACuT3Z9keQG0iHUZC5N584uNdDVo8QiL+m/bYtKWugfHlzyeEsJTH4diPKz4SSlZkhWCtlCGPd2Nn6jd3DsinGHJ409H7pYAE3fXDAXry/0fbzWRQjPi3wJHTQC991VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331499; c=relaxed/simple;
	bh=3dzTsmHfTdzI26tCQQiLWGKJXhohdOyMVUIj8nA8fWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCXvT6TUtyxhrokOg+6pHl8NtGGwLL4oEe50aDTK8OxCLnhggMn+mQdt2gNBjC+noJIZS2fzUSF/9K1aYtLQd6G2hsKlIqirWomttWgiZs+KIJb8rwdNsPghWidUcJjnQPU7sualkBMzLMsHqLkov1ZnbviddkR1FEh2nJhksao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XlQ2rUfV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a20257c815so1110127f8f.3
        for <linux-media@vger.kernel.org>; Thu, 15 May 2025 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747331496; x=1747936296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtLELk5UwOispvrTOOSkPzk7frJcAfVvOdFwBbXiG4M=;
        b=XlQ2rUfV3GD+/MwzbPNJiQHvkb6RArqZamMDFetTki5ejto+8EIf9o2GWBFKWnPJ+F
         ec0eizr905FH9dvLWLbvMD9ooM810K7ysJCyONvVFsR6dgHCOsXJZX+x7Be6JaMQaNTJ
         KmlouCWnclKwe0qqB5Zy9WKMYX2ElMDbWB/ZTJPQ5le3nj5R8EuHj8omxNjV6zb7maj3
         IMUQeZsPFxDnMx9L6khyZHuPr6Bw5qig1Mo3t9EIx8vaKBnL4DkPOLOUBhk1DnBfs6cO
         ElxRcmhgJO2qIDSdlM1RtyNI94b69ak3qWxv8FAwPAC94SbFaSbaknipTUPtDj3EWqss
         Dvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331496; x=1747936296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtLELk5UwOispvrTOOSkPzk7frJcAfVvOdFwBbXiG4M=;
        b=A5PpQ7RKMSGA7z5L7w7B8hVj+KPRvSHHtHR4bB2Su15PMz6ujiRC+8Td5I3nWtzeBP
         gFXLGugN1fFgy01b9sXaJc9Tej6LJwfIGl9ldnDDGL3OXnr5HV+0Shqh0enZCVu/ieHG
         HJKSyGbfyFFCyJmi+s5UXzCq9mRcA/Vwz/8IXQJW+1dnfLMAqP1CWrzMR3Xe/wFYe+js
         BAez6ptgerfu874xR9b8WknJaZTq6nMl2yq94HZuWRKIH/EikTZDBxJ91vjwIQ+TO4tJ
         4xM3T5r8eA3Dj2LgnoB4EmnADTtlHaofZEDKnoz4z255DepIYeeV6Ex035Xmwee7K3BE
         RQlg==
X-Gm-Message-State: AOJu0Ywr1F62HJZAgJH4h2seIy/KDr2ADnM85btZA3YJXXkl8fzIFZgl
	+63638LaRsgikVsXUOsLZJIWc/JdaNtuSQ0StvtNtf1FvEvOl2EW2nV49oiz3lNz218=
X-Gm-Gg: ASbGnculFmKJ4e7E0sFyvOX7g7fEvlNDqICpr8wn+tbMl1kCdHWBH1vIuhbMHmQzMnE
	Iw2aAk6Z8QB4PzTjrt1D+5Gw3KaG6r0sTS75G8fjXQHapr5p3N3K4Ns/Y3JiX2Exn0Mqxhp6gJU
	P4cKy+c+4P+E1n10UHu2bLtbMV1sG6wMm/0uP6+UN2tzJlb0ueVk7t+H5Urc2sCs45zNd1u5P+4
	Oq8HBjMrpLn/ZAqc+ZsVKN/adsmFrn2FDjX4Dt+wyi1Xkh6szHeiGtuQGoB2imMmIxgKa0IwdsF
	WHH2/FicECM/frTjwQcNuWE9mH2tSOf6raMzF/llk5F7492m8axKujmTIKmxvR2dM9EDhRQmhnR
	2ioy3HarXistU
X-Google-Smtp-Source: AGHT+IEAaO3Y6axB/+CwqerL4ksM660QpoVKeffLGtMp+IYWpiArFTV//tatHJxiGIAzY9TSUK+oNg==
X-Received: by 2002:a5d:64eb:0:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-3a35c83c068mr832771f8f.29.1747331495997;
        Thu, 15 May 2025 10:51:35 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca63753sm192263f8f.59.2025.05.15.10.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:51:35 -0700 (PDT)
Message-ID: <767909a0-70ea-47d3-b6bf-b57e5d7e7c5c@linaro.org>
Date: Thu, 15 May 2025 18:51:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
 <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
 <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
 <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
 <bd704149-694f-4d89-90d9-a22307488743@linaro.org>
 <f7df808c-0724-3f4d-b910-6e44637c7aaf@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f7df808c-0724-3f4d-b910-6e44637c7aaf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2025 14:23, Vikash Garodia wrote:
>> Re-reading to see if the firmware wrote new bad data to the transmitted packet
>> in-memory is not a fix before or after the memcpy() because the time you do that
>> re-read is not fixed - locked wrt the freerunning firmware.
> It would be more meaningful if you can suggest the vulnerability you see with
> the changes suggested i.e adding the check in local packet against the size read
> from shared queue. Based on that we can see how to fix it, otherwise this
> discussion in not leading to any conclusion.

So to re-iterate.

TOCTOU is this

if (*ptr_val >> 2 >= MAX)
     return -EBAD;

memcpy(dst, src, *ptr_val >> 2);

Here a malicious actor can change *ptr_val between our check and our use.

not

data_value = *ptr_val >> 2;

if (data_value >= MAX)
     return -EBAD;

memcpy(dst, src, data_value);

Here the taking a copy of the value and subsequently relying on that 
value mitigates TOCTOU, because the value *ptr_val is latched - read 
into a local variable which cannot be manipulated from an outside agent 
i.e. venus firmware.

The example in the commit log is not a TOCTOU for that reason.

Adding an additional check _after_ the memcpy() seems silly to me because

data_value = *ptr_val >> 2;

if (data_value >= MAX)
     return -EBAD;

memcpy(dst, src, data_value);

// This statement could be false
if (data_value != *ptr_value >> 2)
     return -EBAD;

// while this subsequent statement is true
if (data_value != *ptr_value >> 2)
     return -EBAD;

And in any case this is a post-use sanity check not a mitigation for 
TOCTOU which we don't have.

---
bod

