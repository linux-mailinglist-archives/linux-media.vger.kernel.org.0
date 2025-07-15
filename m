Return-Path: <linux-media+bounces-37730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBBFB051F8
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5CB1AA651A
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 06:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29A82594BD;
	Tue, 15 Jul 2025 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1sm9XCl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B226C39E
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561616; cv=none; b=F7hVqfBuLxneGV2esmqB8dperiKwht8b5haFvSxCV28f+x3gwEcTpRS9pgN9hwtIf3vGB5RVCrjwGWPe2wWTvWNNu0P1A7/EKnnQXMkVaBo7tvCWtC7DqllSWSKvtD2R+5lyYqQaV966EFHsRcJsg6U2XUBn+89l8viyvibo2Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561616; c=relaxed/simple;
	bh=XvhUwch1kWk+h7hXn8TTsbFUD7dvqo/TCnjlMoY8wd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCOkfllX5VteCoUi3qOxODm3rFpvG5ULhGPlYbZL/vA0+jPWoDcJYTSUjXsMg3gZhebfODfl6CGRelgtxJqX/+wDA/dko7oC5/yHi47tN8ovyCHRklv84XdwXFSZ3YozcC6TlR92yii1sY3OcSNEd8pKWl6VbPePj7Oc2qqwTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1sm9XCl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55a1da7ee7fso86020e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561612; x=1753166412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIQ0MAA7ilgsnxpjHpbsqjmKUfNKURLm5JM6QSNd4g8=;
        b=T1sm9XClcdjyQFwItMITvys5cQI8JEk6Umd1TG/Zj5ieX//afOIqm370efy1SEzhv5
         wc0dmvJFqHf6AeJGJLER2KGNlRMV7uqWlVDk/PyDLyuUMXg+2MzaIzmaaUg2IGKIjtYG
         q/3cGSnz41ghCUKsoIKJ0f7rbMRXd5EvbQoclrCtrA5GnXhaUuHh+434QtIjavZ9v6uU
         hbHKD+tCWgp5bt6m+9NY88SH+dWSKEUcXyU1HS3XR4Y+2ik7LDOu/hsmxZ9U0utzQ1G7
         5f9CCqWdScFflJjJmoZ8WWWiOafZrBTyPoa39tF8MygHaCBDKtNKve1vcgKreEi+vwcV
         7tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561612; x=1753166412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIQ0MAA7ilgsnxpjHpbsqjmKUfNKURLm5JM6QSNd4g8=;
        b=nUGVykM5aa3Hsg+aY3XApJEaAy4bILcycu0oVF4rDQivkv9MLWautjPSF+HvvNfwlR
         OYskZRhvIdt1N0gFAc5qVvgnVlZSJFBIT/HKyYbUICjh69/D2GiRk1TfM0E8AKYgY1Bd
         yO8rsfO6HVxIOVPko4IE2kjl9FgzG4sgzWFTUv4nf6K78LBSGpZxjwyaKZ8Eb7hcs36c
         ZRBUCEyf+BQW0xPsYTfGHxYx0PtNT+Hrb8iB2cJMo4F/iqIqUbCBAMqb1bBPTAXN4JjR
         UOPe+sDDuMJHM8Rfgzjf0/q3OCfqJV7oa8qb+CKgu3DN4ubnoS8WBCxAiShHcFoxCDrL
         RjSg==
X-Forwarded-Encrypted: i=1; AJvYcCUdsBAuVeH7sE72rv3G4oGG14Hq25EZAFjSTBRGQ5bYv7L10USVTybO02IsQGATavH2DufQL2wZXYidOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/gQnTYag2tSW7Z1ZiBL8gIj9dhzA55Vu8q08TvURg2JEM7idS
	BQu6bRg3u838jfMAf6XYpyNT4xfjc+G8mdTim2A7nHtGydYEj87UKBELpBlU6pSFYec=
X-Gm-Gg: ASbGnctBcsyJpiopNjANw8I4hMLxbR4GUxT4glgQigx+AW9wGKbttCSvdqP8l/+SMb1
	4+ILona1HhMqfUJvPAUZFTfkdDhE70HQ9M5mrlmiYxrb/V9IPnzj2ww7HERMw4xqh8q8kNR87ny
	IviPAAGsnfVIZDskdQI0qk8VO/UwGuLVzt+wTgDzaYh6LqeTpt/t0DM8mTlDyLPrjei5+9hBFUK
	BSRnEfcCKLeU1P/nWiHklk2BdOwkGzP7YdgjbHQbJWHRSxmZ8Zd9JqnbIaC5PBEz2kbB9rx2DEi
	w5XK8tk+Zp/zOpuiot8sSUWqpDQ4QAdksRMCYQZhTu8LflaarjdFdbPGlgBKMbFwZSTqimNE/dy
	rgPAbDovuKoLnRt8guntldnxbIa5IWt71yGS/8jLEo38ClsUo4m2cuJ0zUQz0XXTnjuMqj/onZQ
	5h
X-Google-Smtp-Source: AGHT+IGaFJXLkox1nF/8pLLN1OAvLc85Z5RHAm50nAQslP1unGzqc1kserBe9j82STD5G66WKnTIuA==
X-Received: by 2002:a05:651c:1a0b:b0:32a:7d76:2660 with SMTP id 38308e7fff4ca-330872d2995mr581861fa.2.1752561612382;
        Mon, 14 Jul 2025 23:40:12 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8bf2e1sm16881731fa.55.2025.07.14.23.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:40:12 -0700 (PDT)
Message-ID: <dd3c2fea-2c85-4a4e-b048-68f95f4a7d5d@linaro.org>
Date: Tue, 15 Jul 2025 09:40:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
 <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
 <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 17:42, Bryan O'Donoghue wrote:
> On 14/07/2025 15:13, Vladimir Zapolskiy wrote:
>>
>> There is no ports at all, which makes the device tree node unusable,
>> since you can not provide a way to connect any sensors to the phy.
> 
> data-ports should go from sensor to the consumer of the data camss/csid
> not to the PHY.

No, this is an invalid description of links between hardware IPs, and
this mistake shall not be copied to CSIPHY/CAMSS.

> Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> 
> https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com/
> 

-- 
Best wishes,
Vladimir

