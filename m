Return-Path: <linux-media+bounces-41688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F44B421AE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDAE75E567A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B132FF64B;
	Wed,  3 Sep 2025 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zK1y7ofR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785EF308F0F
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906322; cv=none; b=mNUgtzXD9E692SLdZYLCnrbYxsLQvrWTf3pnwSRLUQFYnEGVjpC+xYIqiA/YkWYJhYx64Rg913LfDIwwVrwUTo782FJkyNMLPDeOWaTEeDjP6AqujYlOeydewKWCIOPEusiH3NhRDgFGT7L4ecvn/bjQCphSHNgkN1RLEp7vzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906322; c=relaxed/simple;
	bh=HMyrqafZWVvnCp8l3xl9EjMdbJHyX9qnKtyEFsPn8dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=krBDDfeCUYkNyH0dihPJ8PCLL2XipzpmLeIFcaA5ZSEPeTVIj8nSuVnlTCL6vQe/cDCdHX84J6xhhpbAz7nl8tBhp0vIfJSu30J9XjHhIEWkyF2aEPPA/5FeUaKjSZUH6K6FO4g0By6atR3cKZEGr4u+c/h20nEVPW0f6fnIiSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zK1y7ofR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so3856655e9.0
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756906319; x=1757511119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jV/+kNQU+fID5A7W7F8ncUimxdPkwRhQZObi8KDWFN4=;
        b=zK1y7ofRkabpTVTCK72t1pu/W63oE1k9cWiQ7iCp8g6fJ56OmbzmKaB+VGNKqm+k74
         RstJas+QJu2w5nvLmF4MwLl0M/Q8ETcXt5DSXHJlcW4W03dhGsfoD6IXKgqZlFKhWY3q
         9TIyKEBiFY2RcJ+cyPlpUKB65IimGqbZ0ejuUyM9VKd03F5oY69T623wErhxaflnw48V
         7EXfQNnsDwkd0uTwHR+4MV/NCMoctN5+HfVYyFcq8nd2AfPhs+IX5A3yCEt0AR6hhWuo
         +tuf/SgYnGUzpfUKlDUTC7NmZUD9xSS3co5ihP6W2kj5CmIEknNA1owGStToRsNoVs0Z
         8Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906319; x=1757511119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jV/+kNQU+fID5A7W7F8ncUimxdPkwRhQZObi8KDWFN4=;
        b=pf2W+k79+GmhTVSOMpbllMYlGO3arElobqme79CGztaxvKCbNjwSPRXHnRtfhx2OAS
         cdqf8DkMRA3XgXT2nAINXMF12+eUR+7MxUly9UcC5WmkqYdLS7bZCr9r0n+vaGzIdoCJ
         5DOr7ckWbJp+W1bzt1+/330GgyLy07Ba/+bMxIixXRYfOQyh7jdwqakcnKfeRPZ8pcgB
         0Y3OjCbSY8o21f0CQYVOilmNKEtyL9Zv4sumdZRje3Xtbe2SB5Y155iAEwjnszyKYJXh
         aZahgwHE9+QWNZ2rOiaCMxHGf8nJkLT6Bk/bNqJV2IF7auIxt9NfKMWYiP8VdTY5epj0
         EIyg==
X-Forwarded-Encrypted: i=1; AJvYcCVje6pNfTJCTbblcIO62S1RFhxsgrk8z8GdEZPzKz8e2tv1AZalfye7N34qf+32xsozvIyOyimzmR2f4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYO1pawwcet2E34koW1DeIAj99/o2dABas4mV0Kmjq20vwmtv8
	BjRgLDD1ak4gpWAEubNBJQoPcQ+jqJHTOZ2KxcDLSrRCAMGQflL+jhjZ/NmwYa1bO2M=
X-Gm-Gg: ASbGncsL4E9IDAJOydNd29ov/jBLmEq2Awli1xnkDixS0I/h23lY0A+1KrLj2cRUZc7
	8bENyfhAN0X43eprojXD6lzulylTl4HBCDB/LSHY+E5gAyRTGPmjLMwX1PFHqbWqNVcoY0yVtSo
	kK1H4RZIz7VYnYxyXPdO97eQhVwb+6Z7PfXD0yggVqQseDxNXSn5PngXmgtQ6ZP/3IS/rw5SLdW
	Yjpf4HpfzfSlxCs+xsYYc865QbjzSKmM/QvCXojTkfCTjI95gIDvVZ37Rj1Tv4gLkk5B/Lv6vov
	tr3ODx6ahJj+o0eRt2IruRcu7GJQLzlvmMjDzErWgR2kXdEwnKSsdA4lQsR9pOdkNqpKhKFm2Yb
	JGoIHrr2ZKEgaGGbb/0snRRC5yCH9pbL8LrazYY9l9BZxQgbXOv19rxwy4MiJcf5bgJxv2NR63V
	C3TWnbexl5nQ7Ykh7Lvbrl3rUFBCGbaig1Di65i9NM
X-Google-Smtp-Source: AGHT+IHgsBA9rledeTVeo8KQley7QFRDXyCYgnqMKEv7MzsQIBH95kbaAiwwLJ8XXVf/C9Q9lEUUqQ==
X-Received: by 2002:a05:600c:46c8:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-45b85532ec8mr134876395e9.9.1756906318707;
        Wed, 03 Sep 2025 06:31:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c22sm327450385e9.13.2025.09.03.06.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:31:58 -0700 (PDT)
Message-ID: <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
Date: Wed, 3 Sep 2025 14:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 12:56, Konrad Dybcio wrote:
>> Can you try with this next-20250814 tag ?
> You sent it on the 19th, so it's in your best interest to run a quick
> 
> git rebase --onto linux-next/master $(git describe --abbrev=0)
> 
> and giving the series a prompt re-test before sending, because there might have
> been incompatible changes, whether ones that would prevent applying, or break
> things functionally

I can't even find that tag next-20250814 closets thing is

| * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge 
tag 'drm-xe-fixes-2025-08-14' of 
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (3 weeks ago)

but patch #9 in this series stubbornly won't apply to any SHA I've tried.

meh

---
bod

