Return-Path: <linux-media+bounces-19259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C58994F5F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B8141F22584
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7251DF263;
	Tue,  8 Oct 2024 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBeopE5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322661DF75D
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393875; cv=none; b=LFjRlWR+Qum+t8BKlJ42Bc9iCnQcKlOKYGfmIXQn77J/pdmLCliL7msu3teU1fI2SwlhINdDGB7NmZcJ+qrsCWRXusre7O+f1nJN+rYASp53Gv/vdbTDZzOM64OuUb2ytR4+6cX8V8Onr3NrmzpTy9Gfj+/9JON0kzVJRoQmd2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393875; c=relaxed/simple;
	bh=y1H4tFAZHXilginmSUS70vvO9bbl+xN0spDfhc8WWaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDtYx2X5FQRmuCYe+MZjFwPQElzrVsl5w1iuxjlzrogGOqN2RTxrUj2rUHkCAjl9cH3zNeiFrLhP3cjQebEH4TqSGQx4uZDU/aE3m03h1XltMRbw9JB3HdukScSQFFAFK1N+8kFjVv5TY7/bdd3zT+/1sSqs+ikPceffk6DTQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBeopE5t; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so8285356a12.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728393871; x=1728998671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhVJPgejSr18zw9jTwWHWbDuUXIWkeFlgvOaW5vk+Ro=;
        b=LBeopE5tpNMl3ZZ/CmE3dBJ+SLbbHtArnIvY+JtEoBNGtw/zb4WeL2ehaTWPrsH72V
         1mvPU+Js9hdrezoN8q5QLIqJ5w2vEayKdIpEQPNR3uu6Ul3gjHpFqs7KP0px3fsOdR36
         7oW/siBtCW4S7brBq7VDdG00evqDfu6CRAOgl5MRn/UX6WPubHRKN/T+TM1neM0Htdxs
         R9tuBD/qe2zuAG3zjDkMht2JTHN0zSC+5Hip1K6c1XH4hg59z6l6A733KTRbSDQVWmQp
         OlUcrZY0GVlILpnGI0KZmScoQlTSCRAkcG8Jgr37uQE9DNVU10IvSYboFKyjbL/2EzWV
         OZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393871; x=1728998671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhVJPgejSr18zw9jTwWHWbDuUXIWkeFlgvOaW5vk+Ro=;
        b=vzcsjzczQyivVJ/2raVHOk6c5iLsxAWpwBenJNnORf+JMWOBxPo9hJzXqtP5MFu4W4
         a52+U4cohxK1VsMs2r7UYpuYGiY4Obw2RPV+h8j8tx/JN7W6QlZ24J9nz5FikIPIshJH
         5rOirXzwnRJYd8SBe3j2xzLOVXCLhxt0se+lk2rzO7R6bIMpzAc8BqXEYvJH2BzVAmnl
         nZql1804byLcAGxYX9JAFZinvGkSb4mE1eE/1ijJ/nK7M9knJscrcDiMQY0gQYs9PqpE
         h1i5cQ45OKdJbwZs92P1gwGppTCmTIXGS4FN/ZuFE/JRs6oGPbonE2zQ/IwTpzow0eba
         pRvw==
X-Forwarded-Encrypted: i=1; AJvYcCV3DOVHid/qiKoCmTvN1oqT7NJUOebSH3V58CpIBq2wSCb2vN3rYtpLkg82vg/LGRt+y3JkY5yG9sew7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhmR9bpqR2Y1Gt+3KMQXKh9ZiN//W4Nb8kcRq0nZ2z213H+gp
	eKJCwQkaaXLM4TRz4sVdFKG6uOQl69Jerhxkf0vNsGyzNNn+j+/TqLvP6PtKpuw=
X-Google-Smtp-Source: AGHT+IHebkivZhrf6qbuAzEVcNiLs2OZJfPKKnHfW2X4gCMsFW3tO1DlQoGICsbXkwZ5EyF+Brot7g==
X-Received: by 2002:a05:6402:3717:b0:5c8:8610:98b0 with SMTP id 4fb4d7f45d1cf-5c8d2e71a2bmr15714624a12.27.1728393871511;
        Tue, 08 Oct 2024 06:24:31 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e0598abdsm4327357a12.3.2024.10.08.06.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:24:31 -0700 (PDT)
Message-ID: <bb138ed9-2abe-43ec-80af-2d77b7349b37@linaro.org>
Date: Tue, 8 Oct 2024 14:24:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
 <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
 <c18a92f0-5824-417c-94b2-ed10f4580cfd@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c18a92f0-5824-417c-94b2-ed10f4580cfd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 13:00, Vladimir Zapolskiy wrote:
>> Rising or High can both be justified, its really down to how your
>> interrupt controller latches the state change. However I personally am
>> fine with the change you've provided because I trust it fixes an error
>> for you.
> 
> Please share the change to the driver, which you've used to test
> high level type of interrupts, shall it be send for upstream inclusion?
> 
> Such a change has never been a subject of discussion.

I tried running libcamera "cam" application to capture a data stream 
before and after your change - from memory at least on the sc8280xp and 
I think on 8250 too.

What I haven't tested is unloading and reloading the kernel module. My 
understanding of your bug report is your change fixes an error on reload.

?

---
bod

