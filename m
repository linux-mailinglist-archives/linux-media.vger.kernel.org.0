Return-Path: <linux-media+bounces-37682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64733B0444A
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A8F189C9B0
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467A526B2A1;
	Mon, 14 Jul 2025 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OpV+l75w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068C325D53B
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507056; cv=none; b=bfJwdRXSYIvMXScKO7Z+hZGnn+u7h6d8JsJ0dkBvu/hYOKfGorgT+4NTWhDipWahZ2qEhkVo3jjAE4h0XJNOHJBodWb7cWNtisP2zAIXvdNjRVCapRbx5jEKmpRLA8fhENsZY5Gv0dSTlbDMH4+GX25SWuum+D9yFXKSfVM8ukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507056; c=relaxed/simple;
	bh=fA43pWYFrATPW6o5X367Dz4sZp9Qsee5YWb/rsDVtHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+SxnRdMyY4PXgki9KhyatR+8rd2mb5r//pDCOrluoh9KzTgxQZ22VfmqyuI4Ur8+C2AQ7UVutJChO7OqHC+/NqmO+DIvRt1M5HagCXrrH7xj5MLf5E5H87ogxiizlpb1d/hllgXaTIPegCp2Ijisxyo73Uro1tkBa7c91DP7AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OpV+l75w; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553d27801b4so259576e87.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752507052; x=1753111852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhPM3WYx0FxLSMjDVhXzRCwSNY+8UAUHTyFHv1jdzFE=;
        b=OpV+l75wSKtdSC6QHwVfpc5V8y+cLJrZLCHK7El9n9SBmWloBzGrX8Bb2tP6eUN2Ea
         ovzkOiIwEaAyQX7IrxEW4UUbjkFndypRsVZtWMmWwIzinwBE6sQ666BaD1mmyuZVs4GM
         7inWAj08Bq6P0NvC6M260Hub3oHnOiorTRyTH0vWrPhj+oTgtx6IpWm5jVdhX4WsblIG
         EPjPx81ClEuesSAO51IbGn2SqaqA/4p2lZ8/ZFo83QFfu0XG/ZzIl+F0wf+vlr+pLVzf
         XWaX8PQhiMhqhu7YTVoopo18W8ONQUu8khEfBxu1QRtISeGH8cUEhFu4bIteK/uKVWI0
         /dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507052; x=1753111852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhPM3WYx0FxLSMjDVhXzRCwSNY+8UAUHTyFHv1jdzFE=;
        b=prx6P65flcMzfblHM3JDPg+bVtU1wn9H/HQBV7ko27Yt0qVqELCj8ve1pqhDGC+2sY
         +j8iJtjRqW/WOOCeSW81sXZHEe2B0l8im+MfqcRW3+beSs7A5xx+qSrRONiV8LdGLCw0
         mGIBxllt4/pFgyrFRp3IW/dXImK2yuw1CJ42ZF3dVk1dweG/Y5uk2m47mfK44uSX4Od2
         UkD8L9oVa55tkxZWNtFMh2TdjFtdTgf58RZZjPEV/M8KvbE69L2QfoLQaIY2bRamR0kR
         mNiu95UO+C3mPYz2NzNAY+wXH+T9nLEcCK79YWhOY0fccmlpxFEao2OaJfBh3AXeUvCf
         1/7w==
X-Forwarded-Encrypted: i=1; AJvYcCVC7uJt9ntBDDYm3F0t7NMx8R2Vvh2xnw94yDO/DaVzDqil0j9qYtd2JSfw8pU+1nncPYz6Bf6cO1+nAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygGMVG1oQENPapVvy+9eMVJkjruFfGUVlvyGs2mRBUJ7AFrz7U
	CvyobrTH/A5WDb0hJNw8NdgpJi/l2t5kT4/NUvjhPDyhxOZCYLIwti45uHo77PbbsUE=
X-Gm-Gg: ASbGncuzCoTQepexVwuQ64YhnPg8LyNnKQci2NBewmlTIbYazXVpqrfwB5P/GGQei67
	zvqn+fGUfrxuiSq37MEKGroXEOwPB1rJFnAImU26MKwxSt9vKe82m+ioaz6FRpq4dv3qiioo0qg
	voCqyj9GhBIHL/e9vSP1ZDiDR1Dvte0OfQ09DeYHX0/MJ6ggELYZLskdJjTpyMizJ1ips1bbZB/
	tigIgODgXcxpUJCGGRVfztW9CWsoid0we2rows+bz+XHz/bhl4QBQCwhPIGx/TqnX8EbdlrR/rv
	DOUMPGQdgLLMuUHkktojgnsYQxPmJviBF0M8lT+2YkCxh8O+F8ggzZL9h4GWMzdRuco+793HVh2
	sT3YcsYeUzeDwaQyF1xnDAhIqkKZN+eARnQhN8KbMKKB+87pYl7mIwYAbAo07rMC8RlkynLth7u
	Sd
X-Google-Smtp-Source: AGHT+IHfIWtfLwmI4o3tG95if0xJBRcWewfBclWlcePGlLyhwHi1HTCoA+WOs0ItuEmU884D+uo5xw==
X-Received: by 2002:a05:6512:2388:b0:554:f76a:bab8 with SMTP id 2adb3069b0e04-55a049b4b48mr1393417e87.15.1752507051897;
        Mon, 14 Jul 2025 08:30:51 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d0f35sm1985120e87.108.2025.07.14.08.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:30:51 -0700 (PDT)
Message-ID: <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
Date: Mon, 14 Jul 2025 18:30:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 18:17, Bryan O'Donoghue wrote:
> On 14/07/2025 15:58, Vladimir Zapolskiy wrote:
>>
>> This proposed device node scheme does not solve the known and already
>> discussed technical issue expectedly, namely there is no given way
>> to describe a combo mode hardware configuration, when two independant
>> sensors are wired to the same CSIPHY. This is an unsolvable problem
>> with this design.
> 
> I think that is genuinely something we should handle in camss-csid.c
> maybe with some meta-data inside of the ports/endpoints..
> 

This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
of sensors to a CSIPHY. Where is the relation to CSID here? There is no.

Please share at least a device tree node description, which supports
a connection of two sensors to a single CSIPHY, like it shall be done
expectedly.

-- 
Best wishes,
Vladimir

