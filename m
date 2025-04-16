Return-Path: <linux-media+bounces-30368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0758A907E3
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 17:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AD9D188888B
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E6A209F27;
	Wed, 16 Apr 2025 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwZ6puI1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB81DB92E
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817901; cv=none; b=CI34NjwfRr5zSF9C19M5x+dFgeu5cqvTXTEtRsIqhcu/zsMOiYQcBLwWIZHHYKIBtzrtiWyL68GC+3KkpIP26O4r8qatmOWDnZsCpP/ZrX+E5wd8SLMPql+iW5IjjTEqw5UVMj6jrFJ0t4vtblNChuT4RWnhsdqkzjS/Gth5oTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817901; c=relaxed/simple;
	bh=d8Cxv9RR9qoZHu06cgnLFXf999An/Y0l3WY2JapDwR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9FSOt1SrG4zj4wd38G1qlOsLTk0ZDMB4PVEqgUrjZec783j+HXpbodug2GbNd9IwhwHdG64kMXdgs9eeWKJ9Y7DhhrYJGBcb715KTOPx2YWv6US4G4/wSjqv51jtaoa0V8RVwORG5zmt+qtVf9+BcDU8qxsvmNDOfz7JLE6PFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwZ6puI1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso9047650f8f.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744817898; x=1745422698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6X5cjdhMKI/P3dnvm6GscUCkVJUIYTsQYYuVr1rioTo=;
        b=MwZ6puI17WMP5KhQ3PfEmC+EeB8fiOo1Sw7RIn//xZ4Fd8VEmfHQOf8RbSoqGIeL5S
         5W4Ukk7se0W900+paRfYbMEDnjJPN5Ns/GVltg/2B1+XAyq/zZGpeNNb48PaxXKk69du
         oT1mILoKPSjnitbUtxzG35c3/pIUjYwrmzna58k93eJY1efSvOJRZv4pZ4aW+mr86oI+
         MN16y5DeiY6s/1fEccy3ZyEydLjZ0mBaCd9I5MsTZ7hyaUJcR2knF96Y3KpCiMvfW2q6
         pWmFJXIee1Nhi7E8lLBnMGV3npQ1B4Kry/XJU3tXImnS8auE7KKQLWRhX0fd3eDlVHNF
         BB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817898; x=1745422698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6X5cjdhMKI/P3dnvm6GscUCkVJUIYTsQYYuVr1rioTo=;
        b=nhiI1DSVtDEAEXurUK1CcGRQkm0EaOL4tPqcvC3N8pSmd6BX3oLdWQfN7Cb9WCHJn2
         L4U0QJRwaahojLmh4b4OL4yo14gpa2ZYQtAhihypmqXhMbxpWmEVHndCMcglJ7nona3u
         rRElbdcJ1JdokZpnv3E0Ozd5RwQU4qbM6vUJmFfbZUHbZSRtWkyPiUGTv/CkFl0+QQ0S
         5+G7zekQUXE+AxNgwtp/P7HB6nO4grZA9eNJF10V1PccjjfykHCI5cb092af+ngHP5JL
         g/clOwlF/z/q1M3RNvvTUk8F0xEdhsRD5VaOxBS+jWqf44+Xqs05TshEqGFhXHAdGtWK
         L+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXhFr1TZMcdqFj4tc1r7iW3z7LNWoVrIFX2QQ8IzzIVvkq19Tw6X6hNA1yKVKl6h1KtBJTGvt8gs4SKaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAIIrDGwTrWPZTm8+t4J5UmEcyzl7VIEXzRw1Aq0Fs7aedFjw
	B4GF9+xenjNj1oQhYZwm+mavbZfRUg0JcEuGLw+1Xj5VoYxuB4Y5xPHdhQrDoFw=
X-Gm-Gg: ASbGncv2zzm3moUm6MPAA1MH/0BWDPaCHV7D/i8xX2yW1ineBkoeKSQZuajMGEVgDIa
	fA6JxmpudPPMp1hmAhZmceoerc0jzf0i3JrACqM6IKfapgJRyxwXosMtrh/n4c1PCwqoLAdK/LY
	rtFbR2NF9YcZjwTE56IFW7+jYG/f+zaMVHvMrhflaog+krehaI3lRsl/74LVGZyZLzKEUqvUKLw
	jIaa3FEuW32wrQLU0MbtkC765FQD1T/wNVsqey78ju54olpskmLTMeBVqwAP3qJyO/eyDCgqRF8
	2MmSqTFrCgB9KXj+I/C7ATg4+IlRISaCfZ8KGJpuQeQPkszvAmgCV9UFSk2a0MpNTuq1lUccGjk
	QKf3vP6xLsmdveuw+
X-Google-Smtp-Source: AGHT+IEfQvnRXm70oB4fES0IsSzhhHRgsmW+pbvgi0fqlz5G6E/YbpdZwYoqWyapgcphV/f1U901kw==
X-Received: by 2002:a05:6000:381:b0:391:20ef:6300 with SMTP id ffacd0b85a97d-39ee5b89446mr2162527f8f.37.1744817897790;
        Wed, 16 Apr 2025 08:38:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm17582908f8f.56.2025.04.16.08.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:38:17 -0700 (PDT)
Message-ID: <bd3ce9f6-b178-4b30-a4c6-3b45e2691f9a@linaro.org>
Date: Wed, 16 Apr 2025 16:38:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: qcom: camss: add support for QCM2290 camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-4-loic.poulain@oss.qualcomm.com>
 <391e7a1a-ea7f-4299-86df-cb1600428d90@linaro.org>
 <CAFEp6-3bdazujwWLh6RqWhP3ZufAGtX8PtvtM7JN0k-VWc-C4w@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-3bdazujwWLh6RqWhP3ZufAGtX8PtvtM7JN0k-VWc-C4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 16:16, Loic Poulain wrote:
>> I think you can get better numbers from downstream for the above.
> So I'm not sure how to get the 'correct' values? I've not executed the
> downstream driver to get the output of aggregated votes. The only
> clear references I see is: `CAM_CPAS_AXI_MIN_CAMNOC_IB_BW
> (3000000000UL)` as well as `camnoc-axi-min-ib-bw = <3000000000>;`
> in the devicetree, which would give us 3000000kBps.
> 
> Regards,
> Loic

Yes, something like that from downstream is the best reference.

https://android.googlesource.com/kernel/msm/+/f51b78f14bcda2ea59c26e5fe54d88f277ef242c%5E1..f51b78f14bcda2ea59c26e5fe54d88f277ef242c/

* for your SoC

---
bod

