Return-Path: <linux-media+bounces-37648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EFB04206
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B86E77ABD05
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7936D2571C2;
	Mon, 14 Jul 2025 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q40qDfwz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3E923ABB7
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504144; cv=none; b=PNMBx4qyxzUu44Kg1KQ/Q8OWOsTq5GJ8d09CHRPuxMplxrg5v7wlPTW+GPYm1vmIJ9t/UeP1cWoEMqThC0A13QNGV3oCzvIoRXlAoLz60vUQ8Uec/2a41sbdxD3KmWUg8wMS7l9Np8c347JvL6F1a59MzviWYMqKj6ANqaS52fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504144; c=relaxed/simple;
	bh=I7Pxnln1BUjfe7HcY5t1QvJulXfLwXmFHrmFWRkwVbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXh9aJEDDvZVIDeAAdSk7CnPvCDVMbZIQ6+qVSxiB68z87f37QKD8jAuN7hEKB1gmTAPiCQ+50CrDUQM0cA6zsy+Unu41qmSpUqXOrUApzhnzEUXja7/HUtawj7ilVwUP1z+Uyuo+W6ioascpiTNEf6dTHf/noy+KTRtUxLno8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q40qDfwz; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3528234f8f.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752504142; x=1753108942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgT/ZO8DO6Wf1bRdrDifcHYIjUyKTX9Eo/tSV9XIcEY=;
        b=q40qDfwzSIA14x1r/J2rEkv6K1gxFsLR9g71YzjpsE6p6yyKnDL03XaUeaipq9qbtE
         sPSscV7zXPXPszZUWxrwFO2bmGXSxRHADAfkUMipJq5vD+gKVUVDzVPI9fX/tAosqAyW
         9e5VLaDKcTtGFlDJLH8CG+W2sj1fsnVEj5yJP9PqvcMk7KH+2MaeMRSgKRJTsyh0zky+
         UQSSKm0HPvwQ5EQnxzpi449raR24hCiotmch5uSmR6aZCoU72L4RvO+Y88A/q9YeQpQp
         eFi3WaqKBvxd/WWVjVI8UX/00lhKz8RDu8qhZo1MfAoQrPkssUCcWq3FDos4k6BkosUC
         bk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504142; x=1753108942;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgT/ZO8DO6Wf1bRdrDifcHYIjUyKTX9Eo/tSV9XIcEY=;
        b=YyY054q6ds1JSztixfUifcBUdYsuuNVqqRAAtBFJjdkiyG44JONStTPbMk9E/Ac3XT
         1TGyTAh+8Ff1R47olghggeKkbj8QU+B/4oaC0qidk/B/TytmWL+27+YPD5kBsu3KJbpj
         3heSpCIw076VbWLU937T/kpYO058VVpl/KzrVgNNnbnIzLI7n0fYObfJDqCU20FBmsZv
         feobRaRl001v1om1xfgwBxTTGGmShBf43IK9tXBz/U4C1ux4bztdKoT6kO68B3HH0xKG
         pxMO8kLGZO70QfVjGdM6eCxZp7Q3k4qTYFLTAGuwnRvStZvO0RriosO4bbArUXh0moBT
         BBTg==
X-Forwarded-Encrypted: i=1; AJvYcCX6iYh4VeBimW923DJVnmt250vyChIeuUmrVEoeQmPuyG8ge1C5uY3J9k1aR6g4FmapwI4otINijmUOpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwF/YjnUSDFGU+/YEX9Wb6H5OTlQp6d/pxOa7pA5dQMAdIOT/
	Y4OvheYrgAJx/TUFwfe14/+MlzXoLemJ0oe5llWPWiQvZqEaE7Yet/F3SAUgOABdE/A=
X-Gm-Gg: ASbGncsayIc+a/AsamoCaceojvFF03gQdZBbXaDAqIGsL15zmbkA5NxnFuTpjjUYg8r
	yJ3IUkXGtqvyOvPTg1/pGc8+XoVha40bGhB1fyvLMAO9it13XI1yZOLAtabY0L2Ik5itHiI5S7y
	zP7D1YUL7HDeLFoEU/cNvf3GAIfJX2Us6DVjRUS5gWNRKZwQ5vFcEvUTu50xT5fb830DhwZYGKZ
	W1bhO3v6rv9zmdJgUbP5qGE2Pw9UcI9ydms7ObeYic5y7PoN4c99Ts4aEcZQYPwCbaTYtuu0v90
	X9xVHtHj5pTeuJdQenkvfDRVs4DRxiSZTTE+dir27XcY+cuooN5gZMXe9tHm5akuQVVfbGEE5eG
	ORuyACc36EG+I3o/fS4o8IkCAMmnyM57UpW4arpOwM6BSIs4IDM4t70LXZInN0Ok=
X-Google-Smtp-Source: AGHT+IEi60GCx6StklZNLN6fInXr5r58gDpnVQSjnfRk5TaJycuEkJOCyklDv2cd+DxYgwPBiYqnHQ==
X-Received: by 2002:a05:6000:240d:b0:3a5:6860:f47f with SMTP id ffacd0b85a97d-3b5f1c67c67mr12717295f8f.6.1752504141614;
        Mon, 14 Jul 2025 07:42:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ee3sm12845397f8f.96.2025.07.14.07.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:42:21 -0700 (PDT)
Message-ID: <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
Date: Mon, 14 Jul 2025 15:42:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
 <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 15:13, Vladimir Zapolskiy wrote:
> 
> There is no ports at all, which makes the device tree node unusable,
> since you can not provide a way to connect any sensors to the phy.

data-ports should go from sensor to the consumer of the data camss/csid 
not to the PHY.

Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml

https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com/

---
bod

