Return-Path: <linux-media+bounces-24739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD7A112B7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 22:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDFE7164F76
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 21:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1A620E6FF;
	Tue, 14 Jan 2025 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APONJFKs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3F1FBC8B
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736888783; cv=none; b=SVlBqFqzRNEo3a5GzrFnslBzQvnx3xDBFeiXEO1MSWYmb/dfJKVKWffPVtQFGWRnWmQsgvpcqpHyW5X2gU0PpRxYEU04kC8QN30EIJNWaRUk6AAWMKgvkM0m5dE+ZIXWIoZuGYgZnt/RK6unTEdYR1B+SIqJTVe1NLpbBgmJsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736888783; c=relaxed/simple;
	bh=51Q2nrlUfdW/Lc/7yTyFynD+DttY9+jcTg9BgCE4LlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmLL4Su+D7bUq76t749t7FGsFN9cWnXvvATKPkYT253AuDFfmtSJqJzLi8EyRWoMM+arOfNCa/8+6X7t9Sh9Iz+wSJmwxVJfjYFuBXybs5XEBxRoYc0bTpj9j3NeO8eSGi9ap+mQgQ2IKp9cxDXWePvjOlA8UgBlqOk0R5R0Q0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APONJFKs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43616c12d72so7518255e9.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 13:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736888779; x=1737493579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh00ZVUQdXtx7FYp7M8XVQoCDixad56Rl/xOiGs9l8Y=;
        b=APONJFKsLSs/vuH33CHi0tE9Y1jEgDv8xAU5IugTUph3oM6fEU0u2bhrihp5ySLTBe
         McIlN65XTg88M6YaK4ABjyZVaB5xJ8HQLbG5K1jSj8de2JRdw2sFpjKMqkC2FO/QgUQl
         7wiMDUXUVCVrG8s8zN4bpiI6MclXeldP0m1CE0p8WFUX1slANbFbkUb+9uxL/JU2oP2+
         PiMqWgl5Qpu9KKLOJ4qGhtYeR9ePqoZx7OM8x88yDkl9o9dWATgGoIEfAxidyqH3reqK
         dKmBLStgDzb6ieFmiicVo+bASh0du9Zo6ivjsI7PThm9vTYV16vbJbn0t/KAuVFH1Ih/
         LHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736888779; x=1737493579;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wh00ZVUQdXtx7FYp7M8XVQoCDixad56Rl/xOiGs9l8Y=;
        b=EZ4zY6j03D6P3tA+uBLFzqYO1GObvG8n/FxXAZKDTCCQnkGJuxxg4AX7Hh2L7Od8Ml
         1BR4L36AgXKLuugvoigQSDlZEa6SQcNwzKKatj1cpXLcHPFu+hoUok+WlzUBLQjUndbA
         fSuT32x2cvc7/CCkOaujGAOx+bT1B87nfY486b5Tdf4rxp4X2CjJRuBgmvXQuNHjeP52
         5bIDvRSS/0YtHnrzXZvlhi3lj+LokMesS7Qvn7+3mUgSI1L/aisYMPN/e5NfFy9cceeR
         k6LJ4IDJgJdBaeNYjVFz6/wdD9xmItl75Y4Y18C2ipnQFveM2QtubFvXmVhQXr5IAmXW
         Sz+w==
X-Forwarded-Encrypted: i=1; AJvYcCU4+hbITu8awL3hM8HanSjIxM48om/ZVQmq0GlEC9T7mUKE9rsQdHvdm68tTFoFBD2lypT67K1ytbsaSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTdl6r5ni9sYd5jlV9c67zdhWtB7b2M7d3EVX43YK7NkFp2Ky
	W+DQXnDPkDCyWb1WGAqCM8OxSI3e0NeuZnzti+7mkOoTUBFq2GBurqHLQgdK0Bw=
X-Gm-Gg: ASbGnctvSWgLTKc5/ASPN5sULYBL1tZyU2REKyjxAiOn3M4Nmmn5nuZUgU1N1+70fvi
	Gfh+5YxQg+KfD1aMdEkMxQNZc8zMZDiy+EM+Wmf8v7SMD+9iY7lNl2cFNicLtHLxF9VIQYBIAAT
	+LxMflR876RYuZEV16He0p4bWmVa5iCq0QP/alco7WjctGDKCIYrDqvPpLFtipH107vYb9J5E6u
	hBF5Bo1M6yRkgcgaKnXt5Oaujnf2AoShlrdiHgd2PIdpWY+rN+yKz98LxwrfBAdSxYFs/+s8F3N
X-Google-Smtp-Source: AGHT+IEeXSdzS1m6uyUV/OIiskdETkROyZC4FLFot2bkEL/mDiNIRHbH98Ewnj3p1H/ZvDvD6Rm6zA==
X-Received: by 2002:a05:600c:1d07:b0:436:1902:23b5 with SMTP id 5b1f17b1804b1-436e26f4abbmr94069265e9.4.1736888778614;
        Tue, 14 Jan 2025 13:06:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d11csm15947752f8f.16.2025.01.14.13.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 13:06:18 -0800 (PST)
Message-ID: <4c79c0e4-dbe9-4f4e-8b2a-a5cf58d49a7c@linaro.org>
Date: Tue, 14 Jan 2025 22:06:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>,
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>,
 Jemma Denson <jdenson@gmail.com>,
 Patrick Boettcher <patrick.boettcher@posteo.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
 <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
 <20250114204240.GA29414@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250114204240.GA29414@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 21:42, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Tue, Jan 14, 2025 at 08:46:21PM +0100, Krzysztof Kozlowski wrote:
>> Replace ternary (condition ? "enable" : "disable") syntax with helpers
>> from string_choices.h because:
>> 1. Simple function call with one argument is easier to read.  Ternary
>>    operator has three arguments and with wrapping might lead to quite
>>    long code.
> 
> It's more difficult to read for me.

That's obviously subjective, but I am surprised that such stuff is
readable for you:

data & XCSI_DLXINFR_SOTERR ? "true" : "false",
video->hq_mode ? "on" : "off", video->jpeg_hq_quality);

or from PCI parts of this set, note that's ternary is split here:

	dstat & BT848_DSTATUS_HLOC
	? "yes" : "no");

> 
>> 2. Is slightly shorter thus also easier to read.
>> 3. It brings uniformity in the text - same string.
>> 4. Allows deduping by the linker, which results in a smaller binary
>>    file.
> 
> I don't see why the linker can't de-dup string in the current code.
> 
> I'm sorry, I just don't see the point in doing this. I'd like to avoid
> those changes in the Linux media subsystem, or at the very least in
> drivers I maintain.

Ack.

Best regards,
Krzysztof

