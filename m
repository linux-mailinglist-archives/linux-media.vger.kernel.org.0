Return-Path: <linux-media+bounces-14498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43A91EF89
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 08:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EF81F23F43
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 06:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F0B148303;
	Tue,  2 Jul 2024 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uI/6No0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23D146D73
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903367; cv=none; b=B9Qu5jUU/V0W5Cjq9hf9i8rKJx8Jpmq3apqA/W7Z8H4l/+FnlQCTk/9OLWNlHJKxuy54rMtpmwJsLcqpAOxMGOYzeyIVg5b9/YrD+0UX2tibEL4YnddRMzyh9Gtf4a75IoQzbpILy4J1MBacxFvtWVI7UlSkyL3Rc2RY4GUxpnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903367; c=relaxed/simple;
	bh=ZbW3UfaHTHjgtB83tVeydEv1D3W5G2Fb1HnRdSH6Ing=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lnTb/IP4fWibCZgQsCa8C083Z2d32lIAlYDdbC6fXwbJLfg1fGCx+Y1NPEuXCojEPrqo02di10K6ApNLX/Mfm9BndCxPzEUz99ok/q9fMHfWpgeo+rg7jUIDkQMxPkjq/NCDXh7SeCCxzmkrwBRd4X7SMxNrA6t1kQxK8mp5kkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uI/6No0K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-425680b1d3aso26304125e9.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 23:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719903364; x=1720508164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qklGpEOFJ1QpnchMg3TPKh+U5BfD38Yw89oovM6i9FM=;
        b=uI/6No0KKoxz3XkuGAlvpg5w9UYi6zIbpyllbrZ0IyN5DGytaSrkKTQ5VeGtjxteHb
         JezRNxpj/LXkdWp2FDjhy+s2AKv1aBwpcdsGAVxDCB3CmsCZV+088lfIFnU0hwkcoZxv
         bc4avUTsoLa283BUuB/K1+9CZb7m8kc8QcElxGqicDLVRw70gTexA73VDsPwsowr5LCA
         fcrVfKPxKwiqcNdXgCVNCkbA7E8slp02thN1nOykDoYhqfsfqsgaT/o27gY/iEmx0BZ7
         pYNU/YWXTQ0vURJLi11EknmWcGArgaK9aSGCPFZN5jd44iJdgO2wO5/wfNBn+Nu8w2Dm
         nTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903364; x=1720508164;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qklGpEOFJ1QpnchMg3TPKh+U5BfD38Yw89oovM6i9FM=;
        b=S0bn/7nOQipuaUZkLSXjCTSfIqoEAFofbgMix4xrKnoBhgqtCHoV3drgtE5aqxwnu8
         eTbkC9k8YIwqiwEwIxV2KDqcAMOhWkAXr/U+UtDryrNyhWVH6P7CkSC714JfPGnl233C
         DDXWiTdOkKF9q8M+oDITt9Y8j7me/h+wkMuSFwEQlMlZ4NZJBvjajpMGpzKGQkma1jsR
         twIktz73IPbHaU5LRiXu+8IyL8Av2HG+PlPktX6JpOQJ7OUF0+z8ZIMG7cza/z8PCYmv
         AMRXfOvvYfVmzP2f4QYrIm3iFwouedO0RuViFAxGqCnnJ+W0LGPKck/93FfwTzT74gTv
         EMTg==
X-Forwarded-Encrypted: i=1; AJvYcCX1P25s/bzD7mKoDqow89vapBnVhmceUFhXG6sqzuL9Is3P/akoqXLMINdfUjiWQ8o+8JDNNHBqxMeefXcgEetV9GbAC+xxYlMxYwA=
X-Gm-Message-State: AOJu0Yx2LknnZuLRdp9M38v0fOfCgULV0b0HXfqQIzEYhWlEVTo549Nr
	YcK6Vh6HMBW/zcXf4w1mnjZqrkEHLbn+FU7t5S2h6t5XkAnhRDBwM2mi694/enE=
X-Google-Smtp-Source: AGHT+IHWA1bE3DwhP3bpwrpRydxwJ6UXb3O2aKm5Z2Topme6z/DSLh/5WzvCMxpYdpz+IneGaVqGhQ==
X-Received: by 2002:a05:600c:4f12:b0:425:6f67:9e7e with SMTP id 5b1f17b1804b1-4257a06dedemr56782725e9.29.1719903364668;
        Mon, 01 Jul 2024 23:56:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af38a0asm187602755e9.1.2024.07.01.23.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 23:56:04 -0700 (PDT)
Message-ID: <c2eb413d-5b6f-4a50-8168-7e7252ffadaa@linaro.org>
Date: Tue, 2 Jul 2024 08:56:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Sony IMX728
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Spencer Hill <shill@d3engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com>
 <20240628-imx728-driver-v2-1-80efa6774286@d3engineering.com>
 <a6530511-8195-48da-9796-df207a15ae2d@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a6530511-8195-48da-9796-df207a15ae2d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2024 11:36, Krzysztof Kozlowski wrote:
> On 28/06/2024 23:17, Spencer Hill wrote:
>> Add bindings for Sony IMX728.
>>
>> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> 
> 
>> +
>> +  clocks:
>> +    description: Clock frequency from 18 to 30MHz
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: inck
> 
> clock-names do not seem that useful - name is pretty obvious. Drop.

... and the binding was not tested. You must test them before asking
maintainers to review. Otherwise we will just ignore the patches. :(


Best regards,
Krzysztof


