Return-Path: <linux-media+bounces-17283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C6967259
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 167521C214FB
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 15:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5619B2C87A;
	Sat, 31 Aug 2024 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ik5vziBB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB61CD23
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725117520; cv=none; b=s8qag1TB08ovfNqMfASgCsve8lpIRSszb760ws81O0RO36KVUC6h5TVwyP7fjBDMuhP2NBwEk0hnQg9cwYV0OrUXP6iK+vnGzgaqTbLEq00vbHSoZwP9ZwKbIuTqtCQVnmpkuQhe1xNl2n4Lr9cQI4GoOgR1vCjrwzgD872Vc6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725117520; c=relaxed/simple;
	bh=6xJLtaObDmOGaeShpdDpq7LWbPbmVbNlIV8spAi9Etg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeUS/MY+iQjXlGXu/TZO2jlDIk9kosb0vDzpARxxeZfXUT1Ifi2CjkyC7t8wV+3QIMUIO/yUgjQFZNX+hIYPE/8mK+GXgTCQEASHEnRbP6meAMW0twE/+0u8luU0j2X5SdPBGMM+CsWaQtGHwWZolhknZ3nDNjyv/WmyK9b7WW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ik5vziBB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5353d0b7463so4907458e87.3
        for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725117517; x=1725722317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2UMVUI4g4jmAYzAMZaHww404e5oQuUeTuA5pQ89qzU=;
        b=ik5vziBBgN4Vik6Ihqxl25uhwEM8ViJScI9wpxzBiXPO2oLP162E3cO/NAHRx1Had9
         KFdQTecrggKFLkWi4TqomBRiQroT2TkZbIMYGVO+eWKNYc4E4z1aC6u310ItKYqNYZ8o
         wd2oqehxTd9VJWrFQRjeUWbmfzaNUTMKt+5SvoKp4agy5Gr//CcwZ+zEAiXEcKy7HNVN
         KWE4XChjN7N1b8ZC4KfNt09FASx3SAg23otryZ8O6i1i9r5kLgCHu/41KAk2r/x748Ou
         SrNcT4rmRX1OUeWmfF0K84do15cHWGXZrrWukrUjcE2OpwgqIL4G63RHNTsAgB52xB65
         E13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725117517; x=1725722317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2UMVUI4g4jmAYzAMZaHww404e5oQuUeTuA5pQ89qzU=;
        b=Bs6UnHMiGAX6z5XquOKcIh7a67kKeufE88ObKtIQkS6d6580Ze73MaeypmZgX0a3fW
         FIVnIJD30FWTTWL9C8x7Axl32cmG+Xnh+wq4/jtXTYZcEgD5/kvjghIriAW9DQyFrUiN
         DDt4LKpPw4uY4sqyRBGhb96DrS4vcwKmXcGepYa9vUIBUXkHhuhoUqE03LgxH69mYx2n
         smP/l5oWHhYpbq4zch6hDEVryjr2rLySzM1Od4FFTW7Mp/hUylgIIxcFfTVHb7zgLBv4
         CoWq+LiCIYFXJXDx3MFxXVfTEgh9cnmjiqZyyTUIqLEZ0PiPbft2sSsh/Z3sZmxFfd/r
         LP8w==
X-Gm-Message-State: AOJu0YxuqaAJuH0OKcmFa6oCiWGFFBeZP3YBkNr0+DhGvd/JrZLxh0Z2
	gORqncbVcc2ziFl4bVfXab+1ksor799Lz73pJA8t+8qu3RmWGgAj2Qw6yA6Ggl/3SFbs1fnP0bZ
	x
X-Google-Smtp-Source: AGHT+IHnYlkS8E4REc8Ny1vlpDOc+iNi6ECflb4ffQMy+IrZrp40HBH8iEQemeWdfUX1zjiECecP8w==
X-Received: by 2002:a05:6512:108f:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53546b223d3mr4451419e87.1.1725117516947;
        Sat, 31 Aug 2024 08:18:36 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989221c24sm332116066b.196.2024.08.31.08.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 08:18:36 -0700 (PDT)
Message-ID: <3a62b4cb-5c41-4c76-a957-af8e594ca8b1@linaro.org>
Date: Sat, 31 Aug 2024 16:18:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] Qualcomm iris video decoder driver
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The result of v4l2-compliance test on SM8250:
> 
> v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
> v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : iris_decoder

Hmm, so this is decoder only ?

What's the intention here for encoding support ?

I've verified your results on the test branch but I just noticed that 
sm8250 with the iris driver is decoder only - whereas the venus driver 
does both, which strikes me as a bit odd.

Is your intention to publish more patches to enable the encoder in 
another series ?

---
bod

