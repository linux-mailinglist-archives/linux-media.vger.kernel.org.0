Return-Path: <linux-media+bounces-38190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C8B0C8C5
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 18:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E3C6C5CAA
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 16:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447102E06EA;
	Mon, 21 Jul 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBu3kRPr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC212218AD4
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115381; cv=none; b=CTVxlqJTLedv9b2Dr+ub0ASxoUmB3PogOT9HjHMDqkz6Y70fmDDlanyRC+VZqA/BOT0+FmohEtbsl+oLdFi8yzmUNsVx1DgXTTpykwVxdX1GA5ffF6zAaqMU5wtzllQjp5eeBGh+MwMQJHUDITteVaIghYSIZFi417KYGsIGddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115381; c=relaxed/simple;
	bh=nQg4mVGlavPAkrQIuNcIrVz2XSMjt/8NcDVu2xUbWhA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lUKRXn5ZE6SHXCim7AhIn0MWPDU3lUmSRcD6Y3tZ8XiJNUafPq9vCq28h7y3UdBFRFwprRzVCpTMOKmtwNvRY+NFvboziDh0/1bgr3wv+gxlQpMkETnQqsLiLGXE/16kwjsp3KnwE+IGN9g8j62MXCVQNfV0guqZc4TRCw/ipTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBu3kRPr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b45edf2303so4221252f8f.2
        for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753115378; x=1753720178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDqcrroJ3qLkh5t4BQvEhf/oMY2x7lp1dD/3eXpKYqI=;
        b=IBu3kRPrQ398nv2yhgdtrkH/3nWKZq1OHOnk6R5/Urband4ZwRQ34680+5SQj0rLAX
         A+CXraSefg9nE6jEsz/4Q9ukpXxiHdaw6wwkytUYV9kRUN1yt0fojLBXFxJiuWVQkdtJ
         BnhqzOgPj+FLY2oDJ7WVxMnma7xLpLHm6H5ySrr0ZtjwappbiOVII/AqUt86lAOAX6O+
         NuCDMj8qUTv1Zz3HkJiwl3KtcRF+0/76h7Dk/CmiwBWd9iRF+x88f7KdHgjLA47+1kJn
         nNCCRahN+SmNh6ZFJUO8d20lMuxZhjABbKTJtGjhw+ACfGQUCUxlAkzbcEZ6PFBOrN5Y
         AzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115378; x=1753720178;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDqcrroJ3qLkh5t4BQvEhf/oMY2x7lp1dD/3eXpKYqI=;
        b=oN0o53M0jEpsOQjZFRZ5HznAvdbMJnFsWJTYYAqxvXnbyETUuk6ZDAmzTT3cH88++8
         2VnS/bvHJ0N+aQ1hi+TLCrJbOwRdp1eaHvwzo1yjCmBO/LejRyAoQsIIBfJvTw3+fWbW
         4sNtBHigaAE60g4q4yat4HX1+AsfQQdGW7T2/iOV1QGYNHjEQmE9eQV603y2uO2SDzKd
         0us1EYLdONO/Mofeiy39DVSybJGAXJffBhEHBa4C69meShGg6SpY0k1BFX97Se89OWws
         XX7T2kA0yf/GmOCzaozPModZ/IFZcxitIpLBswb1p/IMXc6mSi0OBnuFOwLL69x0DFQc
         GGeg==
X-Forwarded-Encrypted: i=1; AJvYcCUGMQ1BEd2pjeI2rZG5MFBbo2sP73dvv3KyFOI+o1a7WsGcxKcRgf+RH9bzGan20Jsd99xtJbUu9ft17A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnlxrMqVvRBtMsAbUe993vWJ6VmbqHx4G7mI+kSeWo5z0YUvr
	G/YVfVhxBzQ0TbICxT94gthhokHBzw1Ss1hrFG9EZ5R2RJfI0FQNBXmVX/GHt4M7fHs=
X-Gm-Gg: ASbGncvlnLk8EwqeLhG6aGqJXa1CbDfjmlUQgk1juUKjF7aXchkY/IDdJMKh3QUNGVx
	sNanikbz9f+bGZQK2wzzok0wukK3pxtt8L5l0QzAnNW1RixO/q2Sls7FHYhrXeT/hsMrf6dR5Z6
	Scwxt2sRix29hNF/SPfxABJssnEENvlNHVIBmWhVqedEG9Ve6+jtSpZwJzvbdbdDRlBvQJV5ks2
	P8lr8LjOCg/Y9kHb07NReaOqm8megUajAbukMgHZufCQ2ONJv9WTY5VfR63mh45LUJRSdLEMl0E
	UV8yNwgNTFZoqltFvs3wQ9Uxz/CSnOy9VKCyNHqP8R4SObCrXxZvHK1x7Hbby7AhzhKKhYuk1q4
	xizrBtimTGw6bn48ByriLWRcT7FkxPjb0A2K7R6KucJuoN+Uh6bmpvZPcAz3cAsA=
X-Google-Smtp-Source: AGHT+IEyGrnEx/ClY8Jxxfj68ZCw16qbV6UiWvo0mvnQsuihoYuu1pQ1oczOVmJPNRJcxc4Dt5O++w==
X-Received: by 2002:a05:6000:2482:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3b60dd4a88emr17973192f8f.2.1753115378060;
        Mon, 21 Jul 2025 09:29:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c8besm10819066f8f.81.2025.07.21.09.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 09:29:37 -0700 (PDT)
Message-ID: <94ca7625-4943-49a7-bc91-5e354d62cfaf@linaro.org>
Date: Mon, 21 Jul 2025 17:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
 <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
 <3UXVZ6ANM9mDjVdMV4SXsiIx_pT3S1lp3RC_Q7mh_o7jF2dpYsni1Sl2TAWv6OCMCRTFmi9aE6BxDquGkOnwEg==@protonmail.internalid>
 <8b908a20-0bf3-447d-82ea-a5ecee1bf54c@linaro.org>
 <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
 <90a896f0-7b67-494a-abe4-dceb52067e65@linaro.org>
Content-Language: en-US
In-Reply-To: <90a896f0-7b67-494a-abe4-dceb52067e65@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2025 17:22, Bryan O'Donoghue wrote:
> On 21/07/2025 17:16, Bryan O'Donoghue wrote:
>> drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c Documentation/ 
>> devicetree/ bindings/parch/arm64/boot/dts/amlogic/meson-khadas-vim3- 
>> ts050.dtsoc/ meson-axg.dtsi
> 
> Documentation/devicetree/bindings/phDocumentation/devicetree/bindings/ 
> phy/amlogic,axg-mipi-dphy.yaml
> 
> Rockchip, Broadcom, etc.
> 
> The allocation of lanes is known by CAMSS and easily communicated to a 
> separate standalone node.
> 
> ---
> bod

In fact its part of the dphy params data structure...

---
bod

