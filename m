Return-Path: <linux-media+bounces-36558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642BAF14FB
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C551B1C270A9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B0826E146;
	Wed,  2 Jul 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elPdaOBf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F00226B77C
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457982; cv=none; b=I+wmTGa7t7oQa2DKH3NyDICCK50NN03KhlFVsuiX5Bclw33qhtvLpglcNjUvVto2nkI/mLHXqLLQBYRrOlEeh4FveyKrZ6ONCQEHY3aYPGskMUh9Ljo/TB535xW1LISLC8J7+O04aRZT83Wq9RXr1gsUmlDVtFzosfu5xHFKgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457982; c=relaxed/simple;
	bh=GVNj0GiDbzEfuPNlWlITePA20oGFkxhZ//VQ6Wqj9z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Okk399cli8jgdiu3V2xjrNA3TZ45h2ztQukdhmVmexTdh1DVFmu+H8YGrWfOECA10zNMwGW9azwqXYkOL6PtoTjHkB7Kg+sfmROZjq92cJse3cngKALaUAQhUQI96ZuzG9n9ix/tVRESp2ftYOWu4R5LK97oHKx50Ji7RtXOnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=elPdaOBf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so47598605e9.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751457979; x=1752062779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I9wHRK6ycL/nw5skCVK6BibKiZIXkW4VmffJ6mPK24=;
        b=elPdaOBf1Y1osT08GlI0yQdY9yz4+VCtXoORGaEDDCY6UpcbTyPRcbfPBqjBONJVnx
         MmhuaPOftEXpMQBKVAKHoeXygZ5GBU9TwsTIduNp3yrNBhLzfMmkKlZKb1iWcLUu9KgI
         7+Blwbrbc5wPF3Uo98ROKzmJMaJX+7urND9kwFBD7IMGk2FLoCclyVkPxEhvDiQA7X6D
         UXe77TD3LlZqg/anNUEQ3Huokik7tBwmQQGqmKnUrJRy1A7ZKjvRvDaeUSMyMqAIQfKL
         jt6SEqYCwGM4FQuD0sJ+hYi1Hdc/z4TwR6l5UJcdc2bortlRVmFZbmCMY5VunfmHTQqv
         AZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457979; x=1752062779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4I9wHRK6ycL/nw5skCVK6BibKiZIXkW4VmffJ6mPK24=;
        b=gZ50I4sAQPR6LOL+pYeBFP69Y8IO2/PhiMEf3FIV5APbMx8ZZBtpwrlu578vDUi4V2
         KK/aa5gF4pT4jCdxJ925hNUGzkixbt29e4txhQ22l3xTI28kSNhyAzkbzrjsjQgko8Ox
         sAcWklsH6xQUHtlb3w3osUJrWSx19l7rAM+4UJmfjDSZ2MwfInVsQj8D7tnOdWNK81Da
         q+48smJAUeUn/44z/V7Z1rBP8DgHpkxTwEEaIU50E+YKzGFK2gBkz6Cxm3vV9FMubyQ/
         L4134ecN7KvK79YjYJ0HWbJj5/nyugWd3BPiDWpmuJ1W8lUf4DMTg0oAyKoHvP0kJE7G
         Ttlg==
X-Gm-Message-State: AOJu0YwbSoGGC2yHyaUuMAJs/JsGZ/TntpADQYyHwyBypCnm2KQcAM4d
	5CHENgb13auonnL1p3PtlbkRE4GBEg6wP9QoDLpKSaniddXOpM00UbDYsTGTWn+Vm5I=
X-Gm-Gg: ASbGncvfwt2Ty1mXaQGkpSQVgJyq+Hhj/ebfWQ/Uo4S+rXQ9qfYHXab1NjYEfDK9vbN
	StwBCee072E0KZbBqMEuNzxBv9NAxPr6XG8CpT03J8uLLVIv09Lfhd3bB0tRyItO154zTSlHXgp
	lYTA2zEdNDOCGsOYz11DbzOmwlpb8OvuG8gBREfyEffzlbqib0IvOw6s0XF6uV2Hlj+Jptj7kBp
	H6KI30CW1/MaUwjIYQnkYo76FX9IqbtUTRzp2aQmVY0zSsKNXoLMlSYRo5bqQOrJDejrC56awrD
	VV4tF0cwCUjECfLKThbT7SY2Ph+wI4d01TwCI9Hrt23FrHs38QB/3GkN6yIhWmxYE1LKAum9cxR
	kZaxx/2z5mVjK2IuwKkojcu6jNjdi
X-Google-Smtp-Source: AGHT+IFiGQ8eoDbIef8H5WgcGBsaUK7l+LIPHU5+0N6yFyzZ/rasF17jb2K+ACo904sf9rWYtcqByA==
X-Received: by 2002:a05:600c:c08d:b0:453:8e3d:26ef with SMTP id 5b1f17b1804b1-454a3c22568mr18064675e9.6.1751457979384;
        Wed, 02 Jul 2025 05:06:19 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm230508525e9.2.2025.07.02.05.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:06:18 -0700 (PDT)
Message-ID: <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
Date: Wed, 2 Jul 2025 13:06:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2025 13:01, Vikash Garodia wrote:
>> Anyway, in other messages I explained what is missing. You are changing
>> existing hardware and you clearly must explain how existing hardware is
>> affected, how can we reproduce it, how users are affected.
> Exactly all of these i have explained in the commit message. The limitation with
> existing hardware binding usage and how my new approach mitigates that limition.
> 
> Coming to usecase, i made a generic comment saying usecases which needs higher
> IOVA, i can add the explicit detail about usecase like 8k or higher
> concurrencies like 32 or higher concurrent sessions.

Why not make this change for a new SoC, instead of an existing ?

That way you don't have to make the argument for retrospective ABI changes.

---
bod

