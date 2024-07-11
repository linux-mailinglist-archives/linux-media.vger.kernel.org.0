Return-Path: <linux-media+bounces-14928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2192E83A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173D21F25710
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAC915B98E;
	Thu, 11 Jul 2024 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qB8XhNlj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2D153835
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700732; cv=none; b=TyLpVuvq2CSV/PIQ/XzwcHhbJosJGQG9vAXYVZfVCed/uPJxJj9KvnXjR4Jq8xDMYUwkgz5f1H6PaEMdMPRMTZVut0F8OAcpxi732sphk6V8osrwfhq47o99nX0bw/f+xnuUZQP6rm1J9Uuxi3I+gk56HuTwtqG5i23XpHaUcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700732; c=relaxed/simple;
	bh=+4agpP4fKew4RJi8Fu9CbGGBtivkkmDoF7lWUBBjsTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=da2nOtFXwyA9Zjjp61sgAtM39u/R2O2O4HOGpIwPcp9ZmAHhehw/BC9FjmYSKKLCNQ0HmLl0g6GOqDNWoOwMG6a0Djh3B0jL6BjLIIEBtXbFGVpnD+5WrLsg0/VGCOysGxFbdhdFgO+JvANH1X/K2aue51eczZ/3Qul3m+fOqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qB8XhNlj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso5564915e9.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 05:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720700729; x=1721305529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QsuxKhv37VJtjgsQPrgg4cYo5c3nfgRPfOWIb6JCAwA=;
        b=qB8XhNljJbWzEYqo6JEcqFXUHjTVUyA1TJ2XW8nEq1KZxYL1YAa1UOONoZrOiFAf22
         pwjhwaViInopyvIEam6ay/LnKzevq2PM+wJmsI+2BpYs4z0tX0X//NysK9fMSeGeaMhY
         4k4geKwEl9+5lTLaqO049hge4vUAavUTFUr5y4ijZdCuVx/M9TIODl+ETKSPa3B1q5EC
         3qItCasuV7p87NEaPADbdKhWqZ7Tn90DrL1I82eb+/KrXe2pgs/lx4YO9P8EKTA8ooTc
         qT5NHb/0Y9X1KqhoCDxSJVO3Uz0iII+ekRH2yKqODWVF+k+OJNdkVub0+0yMQkqKfQH/
         0Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700729; x=1721305529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsuxKhv37VJtjgsQPrgg4cYo5c3nfgRPfOWIb6JCAwA=;
        b=rowtrHjThUmUYHQJQmD12H1QZ6DiXqPniwsN7Z6Xn6kOZPbE919xSjcEDiDxeD6Lwo
         VrjeFD21Sys3zK1XlCoXUkHYnnLEkM9yooRgmkTSRKDpyi17B+GV79/skf0gmCOHGp1D
         EsF4Org3gvbtvscHoV4UhhSNqiV9s6ICizq/Ql3p+v6LApmMihWI0Lw9bYvMOmd6u0W2
         Vdr2P6seSvV9bXmO//6ssk1eqwcOuRGcH7nwoZYwQg5Yo2/Kf4V4mHptAXj/jEbzoSwH
         v+GVwFBMzMUCRDJhZf9mJ8fbsIvvT6I8sg5oEV9OlamEHuJIDaPzdEBwIJmQ6zsEks17
         0yLg==
X-Forwarded-Encrypted: i=1; AJvYcCXzoUg4C9/dXDfaqaQWeRSReO+bQIIm/Zl47A6e36ZPMsWcjlwQIwFxWJc/J7wHSEOwMheg2eLHjdynHdoovlYw3Uugule65Bo+43g=
X-Gm-Message-State: AOJu0YyZrW4J+TQPJzZNwZI9v8mhPdnEc8ps/mIYtPfVL7M7Ht9OI01V
	B4gB9U+eH4pgbij4Nbtshk0KUcLeYNcx9u7jf1TQF/rvl5MadNuOQHjjKKHq9V8=
X-Google-Smtp-Source: AGHT+IFzl7Kbq9YU3O0zMt6IJS1tzDY6wqKPq6NgvTLS9ETYv7JkW2OhVbjBeqsfX2eaFQ7N2dshnQ==
X-Received: by 2002:a05:600c:2d43:b0:426:5fcc:deb0 with SMTP id 5b1f17b1804b1-426707e38bemr55061115e9.24.1720700729221;
        Thu, 11 Jul 2024 05:25:29 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427979f5784sm38609385e9.31.2024.07.11.05.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:25:28 -0700 (PDT)
Message-ID: <b30e10b3-6916-45a3-81c8-182d81d4a34e@linaro.org>
Date: Thu, 11 Jul 2024 13:25:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dave.stevenson@raspberrypi.com
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
 <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
 <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
 <1051b88e-d6af-4361-a4de-95a28ddfad69@cherry.de>
 <078e3274-f592-4ce0-a938-d58a0f88cf84@linaro.org>
 <3646cd1f-09f1-4e80-8d55-a9ac25cbf81d@cherry.de>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3646cd1f-09f1-4e80-8d55-a9ac25cbf81d@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 13:22, Quentin Schulz wrote:
> Hi Bryan,
> 
> On 7/11/24 2:07 PM, Bryan O'Donoghue wrote:
>> On 11/07/2024 12:41, Quentin Schulz wrote:
>> Worst case XVCLK period is 1.365 milliseconds.
>>
>> If your theory on the GPIO is correct, its still difficult to see how 
>> @ 6MHz - which we don't yet support and probably never will, that 1.5 
>> milliseconds would be insufficient.
>>
>> So - I'm happy enough to throw out the first patch and give a range of 
>> 1.5 to 1.6 milliseconds instead.
>>
> 
> Works for me.

Great.

Just for record, I'll update power_off() too to match the logic we are 
applying @ power_on since we've decided the calculation based on XVCLK 
is overkill.

---
bod

