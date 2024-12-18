Return-Path: <linux-media+bounces-23702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F979F65BA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 13:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED992188CCD9
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214271ACECE;
	Wed, 18 Dec 2024 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5e6jyQA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B111A23A8
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524252; cv=none; b=bObrryZ7fgemX2Cfm0dpacXU7jIB4O2zA9uHGZPFABlnwOBk6/o2McRHXFSJFHwTeAjdRSvmm8vkrYDoL46KIM51ssn2Hj6jgUptu5d7SYtzi7aGrtdY0pSVu0eajRdXhPAevKSHnfYBZQsz2ghP7hSo20kUyqjo6mu4mS3InEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524252; c=relaxed/simple;
	bh=4DYFuvVPX9cHeF8QayHC3cjPyNno83Ev2qdEkZx3JGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bL2rcJGPF0XUGd0rxSTgLsOZOzQ4o9I2PTACBvjZRX7FQAU+5mMQWpUGn5P7JqwtJphSUpMPIjGdOS7FIxePK6Iui1fjKb1vUhuqZ3zRi3KEK3gX7jQq9QbbK/hss2+Tgu1OVAgdiTEsoRsNMqW64LKU0z7Qs6JJPoIJ0oAgxrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5e6jyQA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso66517195e9.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 04:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524249; x=1735129049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DYFuvVPX9cHeF8QayHC3cjPyNno83Ev2qdEkZx3JGY=;
        b=A5e6jyQA2Jglr/PAB+xdrtbc6137rFd499qU1MmoaVXPVu1AAqdXSuYZNfFgmCjfsb
         8MP8n34y4/4LSyrUckf/GHlCARqXVoP33frytmHMN0ppdIPYs+AjJuXF7lmwKQcdGWxe
         QS9U9lrPuX/jY9nkGKt3++os/Awkxum/lYIZDx7+yudGxsf74xGjBrlfArQGv9SFwPO/
         jA4LeRyJ0bP6Tajlgy7tISRXfv3UvUNAhTCpGRsox3VriuVsub/iXMsrnLRYeRV1tr5z
         MRrTlkS0ipEmTVIhKrNz2eMFoK5PTEdtdI3ljgN9xoH4c0AUZmo76hyy0m5eKEItfcRX
         OdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524249; x=1735129049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DYFuvVPX9cHeF8QayHC3cjPyNno83Ev2qdEkZx3JGY=;
        b=LUyh1e93cdkKt86R78CpW68Zmf/6KpI9HCNQOqgWhJQ93pPUlZwpBhqpoC/MsWKN4A
         nlKS5GJKiHsfcB4/dnuWPZDSvLo8qhGfyMDzJgKqhlBemjj/plajC32qyshV3pvrTpJf
         hqZwnU0uRrlN9tlpGixNrHy7/Y/fpnNYMorXlM+yWnVQ1dv59Y+BDb2/LG2U8SpiQkj/
         CyZR53B3oAR2I6/eOH6Wc+k9DaiN05zZEuUGB6dqhJ8fg6jSpXGv9LtgyEmu5qF1YgpY
         O57mNIPayD1XhSvVivfiwY4IQ1bdOBqZbSYURYagi1DphIaQJ0wGXzfZibmpt4sD9EYu
         Ek7A==
X-Forwarded-Encrypted: i=1; AJvYcCUIifyWvrVFU7f//EbyHbYdYGzqmIvWuBItksjR+Pyp/kxMoDUOx+sDajFJmQ6mfO0aAAQcT0Sw7m2iRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHR9D0Fq82aSdVX5Zb9qJiwHbfY3g0swIdKWrrhLwkiw0wAHGc
	89rZiPT4SbZj9PfFmQM/WVWanKdsQaJ9UoMlRYwDstRV7dD5d/Eh4UzThmicl8E=
X-Gm-Gg: ASbGncsU5TLjTmU6abMR0WawcbJ6HViCwOkQ4PcPeqElLIvC3RNijji8MoU3LYqQOPb
	2jlSJMs2NJ/I0YJzCq3UgEXgV5+8TBpjwxnjzgo1EiBHrvL1ubYKEgkggpkuV+RZpNpAVTRFcwD
	Xwm4GXDldbFAStkoORzzhoP1yJZodb6vyUcgmGgnhHcxjknVAPUmPj2CZ93g08twfmQ+UNRj279
	s8l6DiAkKwinitzxljfU99bvw8t/xBgpmFbszt4R7i01hMvV/YUqU4DG/e7AX/jZUxMgA==
X-Google-Smtp-Source: AGHT+IER+QEY6V8nq14LSSmIcFR8gdF8DVvylZ0bkqNg1sTgTrfWj+uIM7Fda3t7Dg2mEA7/hwP9Jw==
X-Received: by 2002:a5d:5f4f:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-388e4d310d8mr2650855f8f.5.1734524248972;
        Wed, 18 Dec 2024 04:17:28 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012081sm13819658f8f.19.2024.12.18.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:17:28 -0800 (PST)
Message-ID: <23ae6fb9-2c66-4d16-83e7-d53c1a6685c2@linaro.org>
Date: Wed, 18 Dec 2024 12:17:27 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
 <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2024 11:36, Dmitry Baryshkov wrote:
>> Agreed.
>>
>> The commit log should make clear that the ABI hasn't been cemented yet.
>>
>> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending
> If it hasn't been comitted yet, isn't it better to post a fixed version
> rather than committing a version which has known issues?

Yes.

- yaml
- driver

are merged but

- dtsi is not

So we can still change yaml and driver prior to fixing dtsi.

---
bod

