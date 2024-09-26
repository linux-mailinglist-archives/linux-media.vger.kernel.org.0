Return-Path: <linux-media+bounces-18663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD00987BCD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 01:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD0E1C2278D
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8C61B07B1;
	Thu, 26 Sep 2024 23:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuPan7vj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231015A87A
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 23:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727393476; cv=none; b=W+lwwT1xZw5nzA8aPGuuTEDwF06q4iXNLZqk50MKzO6vOTKP1wAEwl4JgBrBRSDkW34T4QKLaIuSPyE8lOPER3YXAoC4ZjFDoUWrjtD+jkiwo6oqd0QVytVlta8XVXf03s4EFZBfV+jhD8dZkn/eAjlz8Xlu8IAHBOeR0y6pcf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727393476; c=relaxed/simple;
	bh=7hoodPtwf3xVI9JLDfUA40Je1A7R9N7HAhxABPfVdZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLLiiDJEKddccPIN6a5iNxVmfIZCa/hoGThXfd88naiGUM3UqLuEJVYLgBJoFGNvbePlHisxHksYkVKrhdXLQeYH/3aQKg8q6+2PH4O5VB43lkhk0nc/E+Ua29yu0KAZI1OyX5jgn/k8ynObSsz+L+TJALwmF7vFmMH6f+mhLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FuPan7vj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so1733284a12.1
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 16:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727393473; x=1727998273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=toinFhJP3tFAS9cxuoVAyU9xS2LGZOz1oWCsjvSfxfs=;
        b=FuPan7vjGzjNg/5OSMpWCYC1sumidyiShL/lj8Xt8Ux1XwjXI9Kn9fGNlLONLXZM+d
         /vejY1QUXXA24crJIMZQsrBHk1RRXAnX0imLUS/RLeInV+8rkdyLDOWPfutTeBVbciD+
         6mWyWOJupfgQxsUKW60bjFaAIru7CIYm+jh2JLzuYl+HaI5broD4wIsLUTzoia7FCRZO
         s2El5rDNTM15AOqRocOHPJm7UMHaYmNbF91v4cUENdZ5HENgapgKMLBza7V6sxWJ0vO9
         bZu3y1lYMSlR47CJ6dRVB6kmMis9tK8My+hWrb2eK7PoUnaCIut6NukDv2WDvOtOz3/F
         uFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727393473; x=1727998273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=toinFhJP3tFAS9cxuoVAyU9xS2LGZOz1oWCsjvSfxfs=;
        b=jFCw9om/BD15dd/Ap3p9R2ejGSwZ+Ni7BLYvCimeSzoYDYZlpiKTrHqdMtcS75kbw8
         YlkD3nRTeATrVXmaxKKvtNz058hZZmuemg7jXR0lmNa9u0l+p42cRN5GDS2KeS/m4Aru
         /vRdi4AowWLhDlQrK+OZxl3Y2n9BsjQfQv29ovmwXUBAk7UYQPPKfG1cuH/xxuv/aEqT
         FNDDwjbTWz0s8kN6TFKDZ41W7oU/8Fp72v9bqjkfVwiOvIFD1ZA54iNZ71Ryhy4o0LSY
         gDru2ekAV9ELpU2V0AXbDooEUhgAebZrXS1PyPZvswGqqAC8K9U9DnfADUc73tAgJdLe
         D4aA==
X-Forwarded-Encrypted: i=1; AJvYcCXn4hTc6/JS8J+a8FSpMr6ZtFPhJePFhFIi8+ytLMe7AE3mbx24zUR40/RGP08s2iPmXvqaElAgv5cxIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh14B+AAJ90+57JZPQcKtlpNVb6kLaIUMdBnFxpHgjbUbgpxn6
	meXQBOaRSalapg3Esvfq/YuowlW6+ZZDMQ8NbKWFiLS4HJR7XLxACSknu4Ap668=
X-Google-Smtp-Source: AGHT+IHpF5KFnQN0CqvNcoR4PK5z3SNZf94773yelZyvSjGnVMyQcOdZgke9pl/b//B22gsfh2xSAw==
X-Received: by 2002:a17:907:7d8c:b0:a91:15ba:7c4d with SMTP id a640c23a62f3a-a93c3211997mr146447066b.33.1727393472757;
        Thu, 26 Sep 2024 16:31:12 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5af5sm50749266b.70.2024.09.26.16.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 16:31:12 -0700 (PDT)
Message-ID: <86bf9cb5-a0bb-46d5-8deb-f0e8a86932e4@linaro.org>
Date: Fri, 27 Sep 2024 00:31:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: dt-bindings: Add OmniVision OV08X40
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
 <20240926-b4-master-24-11-25-ov08x40-v1-2-e4d5fbd3b58a@linaro.org>
 <ZvWDbxzm2cCgC8tP@kekkonen.localdomain>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZvWDbxzm2cCgC8tP@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2024 16:53, Sakari Ailus wrote:
>> +      - const: xvclk
> This seems redundant.

Right so you're saying you'd prefer something like this

drivers/media/i2c/ov8865.c

I can drop the dependency on "xvclk" as a dependency in this series.

>> +
>> +  clock-frequency:
>> +    description:
>> +      Frequency of the xvclk clock in Hertz.
> Could you instead use the frequency already set, using assigned-clock* in
> the example?

Almost certainly yes.

Yeah, I do that so.

---
bod

