Return-Path: <linux-media+bounces-34143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD52ACF485
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 18:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED3D3A2592
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 16:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F0823E33A;
	Thu,  5 Jun 2025 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LY8yjCry"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53123F27B
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141587; cv=none; b=eSaEa7javdkRB/UO/89oWKtCNulv+hGj1h0KVIbzzs95DSpmHoNAw5KR7scSkz7JOMA1+jXS3qmsPbCqpTTQjpzny3W57XA+NnaKJw0uG7uq0ywMXN3c/DvDyW4w/+qK5IIF9ZC1UTBx7zSpBfOF7t5y9nog0hyB1BDLuHyC7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141587; c=relaxed/simple;
	bh=5bo7YkY1tlWpi8PAoKcUNHCafSvwyvXhWorc1ggJctk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxfRa9p4x7CHbxq9BB43ONSnMwScOVnnimsL6BCE5NMuP9L3uvkxASjfwT0lDneMcHM4QdTl5QfoSRhhjAHwAf1tPkhe5z2gnNrC07xCqowUuVetGWViq7KzdDAMYOm2AB8Q/pJe3E4ELCvUH7PCmjpmi6xPdrt455Fvtx3n4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LY8yjCry; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so8307005e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749141583; x=1749746383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bo7YkY1tlWpi8PAoKcUNHCafSvwyvXhWorc1ggJctk=;
        b=LY8yjCrynjbywcCoPqlu3N4j+zRgSo/WhCN1SowHicMHuFLjftOwzl9fmVjAKcIFdP
         QZku+Do166hfeM3sHfYJzvaEc1zQe2nZcFuipg1l+xkSSNtRvbI9oQhYolGxUz9GhIOB
         9Rk0vF/xE28Q7hFDrxdk9fwQ8zPgkzARtAVz0kXe6Uw3bEMo5F+yiCy1RsNbxL5kGWT4
         W0/mRjWfujqrciSFgcVQKfVjEBFs1lzQmW6uIwsat6me7F7aMJWEsQpK+g2VkyHCrUil
         trAqMQNALdpZEsbv62OtfjvpK10A9pukQLqpfFGHSgjcurflbM+MwJh6LYDQXKpcI3OA
         pfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141583; x=1749746383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bo7YkY1tlWpi8PAoKcUNHCafSvwyvXhWorc1ggJctk=;
        b=eWYzNvFC8Gc8tj/SqPcZWSTlapholWd2uTYVaC97IB47O86rzkdWbR+0ZzRIpJ0d+u
         dVd07wgAmcl+H2g9MK032Ok5PDTIt9EFDzuKt2oiU0XrojDk0+bi9tksRXt6GR9ZjU1e
         EV/LTOYI6CgwfW60LdUcH9ySiw6J16P22Q1+qOHFwEp+UpMIcD+J2V25BBhq9gjT1d8/
         ai/aoH8gPUKQ5/R2yA6PaqhNz4rYEWG42Afh/gt7JPY5pyLyESiBhHkQza/GoylRVhbQ
         z4RmunTR+9wylTxHgKe4U/SPO9RsGmC13dDaWfH7NArQz95FehsKiNrT236myII0i+HO
         l9rA==
X-Forwarded-Encrypted: i=1; AJvYcCXDJKMbpV+IEAj1Y1UECbOnHPriXtq/bnC9xjGgnytLPcUDHacPt9ZTzekbf+hcXBV3XZqnQs1i0DMsUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFSXkrH0o55y/3aGXTNymBywvlV+jKAiQB4b1tG3rQG+oaiJp
	rRblcmLed0zzgIXTYn0k85Y22gEp97+CZjAJTFBVHc6W5FReC7EBfTka9bmHMzXhlAE=
X-Gm-Gg: ASbGncsrQpR83OmZQHQ3tYxXPRhIFn7o6LRB+57NRcm3h3bgoIFnKLJi5sY0xDilUUV
	rybi2JYQxEqxCGOK9InXJGL80dVL6mQL+zEMLAC29IJklDyQPu9uLHwVDwSdxbHq8UudQQshd73
	G+4/ipAn+HmhBqJWglE+3sigtHS1VCfwqaqpXdce5XW75L5QLk58DPhY++ckxVp6P/wJqycUkkO
	CkxDh2NU4HZoWRG7ACH/ca4e+oRBRKK7As0HsSLSvZDuRtAqgJZrnCVWwGV0tiAY0AqjfpYiZpn
	FgBkYJdMccFabZ3UqwDsYehh0QsKXLIMhspBi+QrPNq1GnRtfgbCf1JkXc/SgFmMja9GRRVg6lb
	oFmBi8aZQTXN+fN0WDQBu/hw2L3Wtx72gGnDGhw==
X-Google-Smtp-Source: AGHT+IF7pEWfu5EDT6M+8KlbHqhY7oSySizrEvnVy21r0eB6qhX6Du8968GoXexTi9wIPaNnXrCi5w==
X-Received: by 2002:a05:600c:c0d2:20b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-451f78169eemr34545795e9.13.1749141583322;
        Thu, 05 Jun 2025 09:39:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f82878acsm19149985e9.0.2025.06.05.09.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:39:42 -0700 (PDT)
Message-ID: <6b09348e-d920-4025-9932-6c861fd5f1e9@linaro.org>
Date: Thu, 5 Jun 2025 17:39:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Renjiang Han <quic_renjiang@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2025 17:02, Dmitry Baryshkov wrote:
> Please correct me if I'm wrong. Without driver changes from patch 1, the
> driver will always use frequency table from the driver itself. In this
> case it will be the frequency table (and corners) for SC7180, which
> would make venus driver overclock the hardware on QCS615.

True.

Yes, let's apply 1/3 and then re-submit 2 and 3 once it hits -next.

---
bod

