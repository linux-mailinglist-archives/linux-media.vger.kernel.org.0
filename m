Return-Path: <linux-media+bounces-21316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3F9C58E6
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 14:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D38B35A65
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA695139D1E;
	Tue, 12 Nov 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZyV/1KV3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91FE433C0
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416427; cv=none; b=mLqvxz/5/OHommqsY+kI2hxU/4HYtmywG4ynLfLvXJCdB/ZQGbJpH3wzsxpl5QihJpN8EU9++YmZ6cF4h7Kpq2lNKP7YUI/9bOciyyn8FB9cUb2Qgzb2M6bxSaSRaqyh2lbm0kFo6+qUpu6OOjYPc+ni4XJ7M8MjyET/3SD9DZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416427; c=relaxed/simple;
	bh=6OSMeGKtQqEz6pt4CLSfVWP64uVuHB5pe0dkYt4nkKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hI8dFQmnjidR8FCXmOUHdoMKYqNCnt6JYMuovztlXRJhmCk06QJmacpAgjYuG2QPXiuf+15ziOjsFtY/TrC5j2yftZnlZSTkNDvNzYXfyh7BHH+wEhIvtavT9OoPJtNCgPf8YeqT1m+mKs1P10J7i4Cyapp2uXtUimr66Rhz6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZyV/1KV3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a850270e2so1026829366b.0
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 05:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731416424; x=1732021224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OSMeGKtQqEz6pt4CLSfVWP64uVuHB5pe0dkYt4nkKU=;
        b=ZyV/1KV3tpWvTjCE95Yf58ZUOEbNIZKoAiwqH6F6qzVCdtJrGOw1t+sgUi8Nl+qj1y
         08CZ2/lYN2a7/fZ4A8SuUwxaNSRVdOg4IQoe6lwltOWBtY9qoASZwjHu7WNHYsPNt2Q0
         Koc8aY8kANohcCwutO3AZ9El+RPJvWXrYE/9q9JKe31rUAdnxoq/eoETUjyOG3kC6/lo
         wvzOjuuDBQlU1r3HIwhlgyJE+EH9ADwxM6c2XdYp0EEw/H+4Fp33yi53kPow74P7iWRb
         WTvZ96xHvIi4O9XtxcAnP5RGEm8awH9z7or3IwZ1QTNxVox4ifvvtlNd0F7Ycu7uIhU2
         Xi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416424; x=1732021224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OSMeGKtQqEz6pt4CLSfVWP64uVuHB5pe0dkYt4nkKU=;
        b=UeIfQJPeG5fobp+YMpUXNKNjOVqawHf8ZJAU6H4HYJ+Gmy0M2iC8+8nLbvlfhj/EYB
         njr5H+lk4wD4eQuh2lJB1/Bk+oqMl6Hj1i9aCKiGYwoV5dD42FZ9JAZ88M2aK+yilBnF
         fHKObtjFHMC6msMH7hcQGA0UxtBPvqJ07Q3FUlooI3gRO8bduWmzpOVeLdnS/SEVTB3o
         6HvpaUjx66dCIyZ8rYKDWyF6BN7NU9XWTvAKPuaouTguImRkzFH++TP/2BgSP7GpfP38
         OGvBoE3d/6fbQPHZrX4N0EpSohk18v0CkD+V6AuVYlXMqFpCtoLRMz8rvx3Ttq8TUaLb
         dkiA==
X-Gm-Message-State: AOJu0Ywjww/8t9VrXyQF/f/VXapy3ltIeHspQ2smjllKnlSyYYsQxv8v
	GH4Id4fJCdo8GExoKMtyJ33uut9N/GYqj070lMHS4UZddplITcAICHxz3InRlLc=
X-Google-Smtp-Source: AGHT+IHNxQPlxbO39/cx0Bj0wtirFeB+QLLR3F4SPq6zq+0AX5aNWZRe22SFOp6JVWXV6bMG2CpGIQ==
X-Received: by 2002:a17:907:3e1a:b0:a9e:b610:8586 with SMTP id a640c23a62f3a-a9eefeade5dmr1417029866b.5.1731416424054;
        Tue, 12 Nov 2024 05:00:24 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17684sm720243066b.34.2024.11.12.05.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:00:23 -0800 (PST)
Message-ID: <e0633e3a-8670-4541-b4ff-9f000b47b746@linaro.org>
Date: Tue, 12 Nov 2024 13:00:22 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-2-8d4feedfe2bb@quicinc.com>
 <474d3c62-5747-45b9-b5c3-253607b0c17a@linaro.org>
 <9098b8ef-76e0-f976-2f4e-1c6370caf59e@quicinc.com>
 <f53a359a-cffe-4c3a-9f83-9114d666bf04@linaro.org>
 <c9783a99-724a-cdf0-7e76-7cbf2c77d63f@quicinc.com>
 <f6e661da-6a8f-4555-881e-264e8518f50c@linaro.org>
 <410e1531-6c1b-fb29-2748-eca57fc13481@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <410e1531-6c1b-fb29-2748-eca57fc13481@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 12:58, Vikash Garodia wrote:
> One thing that we can do here is to increment the word count with the step size
> of the data consumed ?

I think that's the right thing to do.

---
bod

