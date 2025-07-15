Return-Path: <linux-media+bounces-37732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353BB05240
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 143131AA78F1
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 06:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA0C26D4D9;
	Tue, 15 Jul 2025 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuHIrnti"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162D26E709
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752562413; cv=none; b=VmpNw53GXp4cpp0gWSVLWNc0mcVbbl1VUC0AvCZXt5/AMhn6w1ooedGeVItpao+6s7yodyM5DY7mxNidlqEv4M/1XzbbO/ooWlCqtmwt/aZ6XP8Qwr3i3zzMd9NiI1qrr37GeY/Cw35z/K9kgO+kXaVyngBWBgZsHlCISS9Ktk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752562413; c=relaxed/simple;
	bh=7Pgt3265MUvv0KO/DG+JIDcgier23nzqYxB6scwqRbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riqXkJkwcpUeMXGqMXcNnoqdSxDNi+c5oBIFg8kTqpM8zz1nPYxjGn6SitIG8lIchwXk0o3U8CFPTocU8lP+zULgIoGRDfuIvkKbZub32POwa+MCUJj2bOycMXjp8I4/RhNctG++PxKbIqxSNPfUYGgZjxu6Ve4EpuMkLD2Ddds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuHIrnti; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b4c37ebf3so8808121fa.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752562410; x=1753167210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvcOD4Cn8eI42dR9/vuoZROCEodBzgnn8pqK2R/ysOA=;
        b=uuHIrntiXVwd0zUT0sDuSkjZTDDfill65Dx/43o8Euv00KMBwcesYrjIW+Bj6IvBCj
         cS3/biyblTHaHzV+U7KF6UB9+XDUhLgvSVuYyajNSp08ATXYEQekD6gjiA0yLAUiH/s7
         B9iVIDYM3+2IgEkrWxw4M52ulWQmHyLaxXsNbVorPffNIGEPTaKHx7t9/US+h6m+3nUc
         a3IEuD7NJ4Wc9pF5Lks5n356u0yRHXqkW5SNo9kgxeNGDWGCEwWCdaUOr7yR7jsmpmrn
         ogp6alvjQAhdMgKEp1qpWoWyReXbv+eylOhrPJPvN9B2tekORXKjITTKwdT4QuWlKHvt
         1JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752562410; x=1753167210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvcOD4Cn8eI42dR9/vuoZROCEodBzgnn8pqK2R/ysOA=;
        b=W13+/qF1VR0qOh9PMmuq6VI2bHA7AiaG/f+G5zhiT6fxdiJh9kU8L7lSv593tNS089
         99+ZqVxtvGdXLwzdxkU5fLp189ItaY8dG3ddE7NFplWeIFkzEUs087MoQhov7KMquFZQ
         ovhGx28UPpYX9JG6lineFZ8It/YLxZ8Fo+hjdl+yviKEi0GLRYscBQmismZHZytFWHxM
         rl7JwHFoysRmRwOJfD9gvfnkAkXOOm3JayutC05EbIYN5Ghn4TeSaMHbBRPuoKNYpZt/
         mfK1JVIH7Hh3rCbX6VRmrGbjmWYfG93QLK/+qSt0S6JOKF93Mu9WxIsUkCO6w3e5jNWk
         fTUA==
X-Forwarded-Encrypted: i=1; AJvYcCWMtFRXlTu8BJA0L83H/JbO4UkeWGo/QAvbz5DOO0PlMQaXO2C7XASvyv8UyCMJXcY0Ps63K9hyRYD3qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSaQT0vtai1SqA+PzWDwAlwPcH06PjEilyZ8jkLdzWkYN0Dbm
	VJvmYGf/+QjM2SS4YmmKCH0AYhPQ74hSDak7mIjSDkokF4+V3yHv7ZiNoDOAuoW7YhI=
X-Gm-Gg: ASbGncsaAuP+lWfFHHFpi/sDk0G/WgIj/Wj9/MmIz/jtjFzjY5EuN+Q8NcbadDneFZW
	/2gnTNj9xRdUCHd5u9fX/fMFO+Naux5xS9tkaMpJcXecpX5CFgkP8l2NcXzH7lLw+wodLP/kFX4
	sYdrV/l5QV7A7GCAySZZ3ZASSQm4QrPYvrix26Jt6CeNqsr7nLbdNgkXBNrw/IaowM5WcTcIU3W
	PFJmfV/V9KFLUhuMNU/y4r/VLEmRKh8mqQkvSjd5qa6cpJCH/ja8iPFpTOBjpJzVUggyPRY6KZG
	uNymC2bdKdn+7oAwXAhZFfVPa8OCdGGvTEfuobu5dltTWEOTYizdu8m1clQolEA9YMjjDJURTWQ
	iOg4czMOuAFv61Y1t+2QTWRZMYgUbe0BLHIJ5XuZacKJIIu1+TOtna2S0CIEXB8LmXwYCCsgADu
	6X
X-Google-Smtp-Source: AGHT+IFodu1HnNtyzy2FJlD/fynnVpnoIvnN8l+K4AJ3AsUd4f17BT9WXmpIiPUMoelKfh8FHowKUQ==
X-Received: by 2002:a05:6512:32c1:b0:549:8fd0:ddaa with SMTP id 2adb3069b0e04-55a1fc78578mr60358e87.0.1752562409993;
        Mon, 14 Jul 2025 23:53:29 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8abfasm2204780e87.255.2025.07.14.23.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:53:29 -0700 (PDT)
Message-ID: <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
Date: Tue, 15 Jul 2025 09:53:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/25 15:57, Bryan O'Donoghue wrote:
> v7:
> 
> - Reimagine the PHYs as individual nodes.
>    A v1 of the schmea and driver for the CSI PHY has been published with
>    some review feedback from Rob Herring and Konrad Dybcio
> 
>    https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org
> 
>    Both the clock name changes from Rob and OPP changes suggested by Konrad
>    are _not_ yet present in this submission however stipulating to those
>    changes, I think publishing this v7 of the CAMSS/DT changes is warranted.
> 
>    Its important to publish a whole view of changes for reviewers without
>    necessarily munging everything together in one sprawling series.
> 
>    TL;DR I moved the PHY driver to its own series review comments there
>    are not reflected here yet but "shouldn't" have a big impact here.
> 
> - Having separate nodes in the DT for the PHYS allows for switching on PHYs
>    as we do for just about every other PHYs.
>    &csiphyX {
>        status = "okay";
>    };
> 
>    We just list phys = <> in the core dtsi and enable the PHYs we want in
>    the platform dts.
> 
> - The level of code change in CAMSS itself turns out to be quite small.
>    Adding the PHY structure to the CSIPHY device
>    Differentiating the existing camss.c -> camss-csiphy.c init functions
>    A few new function pointers to facilitate parallel support of legacy
>    and new PHY interfaces.
> 
> - A key goal of this updated series is both to introduce a new PHY method
>    to CAMSS but to do it _only_ for a new SoC while taking care to ensure
>    that legacy CAMSS-PHY and legacy DT ABI continues to work.
> 
>    This is a key point coming from the DT people which I've slowly imbibed
>    and hopefully succeeded in implementing.
> 
> - In addition to the CRD both T14s and Slim7x are supported.
>    I have the Inspirion14 working and the XPS but since we haven't landed
>    the Inspirion upstream yet, I've chosen to hold off on the XPS too.
> 
> - There is another proposal on the list to make PHY devices as sub-devices
>    
>    I believe having those separate like most of our other PHYs
>    is the more appropriate way to go.
> 
>    Similarly there is less code change to the CAMSS driver with this change.
> 
>    Finally I believe we should contine to have endpoints go from the sensor
>    to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
>    not the PHY.
> 

1. This is an incorrect assumption, unfortunately it was not discussed
previously for whatever reason, good news now it gets a discussion under
drivers/phy changeset.

2. The whole new changes for legacy/new CSIPHY support is not present
in v1-v6 of this changeset, it just appears out of nowhere in the v7,
and since it is broken it should be removed from v8 expectedly.

It's a pity to realize that instead of providing any review comments
for the CSIPHY support series sent to you one month ago a lot of time
is wastefully burnt on a broken by design change development.

-- 
Best wishes,
Vladimir

