Return-Path: <linux-media+bounces-38188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794EB0C88C
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 18:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A56F21AA7797
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 16:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2272E03E0;
	Mon, 21 Jul 2025 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DEmk0UJS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848CD2DFF22
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753114980; cv=none; b=R83xNJ4m6FNxcGgan9bxR7Y9xf+MusjT6mGU9xFOMPvabiVZ3ZII7JdrypQSeVHGfMmXH/hQG46l//wYecboSQHLI+n2NR8MnEqYwrXAmWNJWHAdEp0J4LZBOacQZ13KRmt9mzWu3uRvn8bYQhPlyt1FLgs4H5vw2Dnf8pe9BS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753114980; c=relaxed/simple;
	bh=O6I6F+JBtuzhpPwj1u61pe7YVmTjBrSZst347vFK+J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iINOcXd/cyS3rToBq8TQGcOINqIcGnj/D6a48z50mXKAWDwMvRTpnyWniatGz4tYDI0nEhjPwKw276cY0WkLkzu+odjMm4S+1db8lZUROOGiGmcdvlT1av1Qk6v/FlGcIWbDyeYUXKB6N3d8cgHE1AtBrSVlvFTPkPd8BDLwRi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DEmk0UJS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so3189089f8f.2
        for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753114977; x=1753719777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxA1HkWcihAgiHesUgMnXVmrELXQs8wNZG5+2Hm4nPA=;
        b=DEmk0UJSsid12IhrpLXiJXtFog3JemvWg/LklbuPAqxKfURTtRzYMrfXWiwRCaet57
         w7SviqKiLa5mA9T2jwRS0QdX13WVwNYNEx5GXV4Hidj21aG2aCnp75q/ZViVx0raakkK
         r1Xn3UnHiDUquIALYY3dgtwoZUWuNwNXw1RmBlkbRGLEuFQ2VGkFbX3Z6Jnayg74zsx0
         ayJIWmQ8J/gIbLPu8ghCz+20bKOidC1c+BNALo1R4y0zGADZZ2pI5SOGkPpC0ze8Yl6i
         58NzfwMWeD8kdBu+mZMCtjhBCnNoAMH6vhFH9l9gQ7DuGNPHMILWoH7iboQwLjdJiOU/
         4gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114977; x=1753719777;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxA1HkWcihAgiHesUgMnXVmrELXQs8wNZG5+2Hm4nPA=;
        b=raAOJWFsWc2hGdxD4dQ/DW+6Fv7CtQIL/w0Ciar36rRmzyytFiTsoUy5NZwJWyQtgD
         jK/Jg0AHvmc+7KSZ7JsmIgoQo5wHzvUDH/XmaKzP5BM4jr/W7Wd9sArDa7qo5oWsuHkA
         pEIo1IvBuchVlTGFnk8h6gk/EDNWgs9lFztKkSVM9BcE5vXQL/E7vSR0NfK/rrgCiVTC
         XVSqEo/aMiEbm5Qy13MgaUWeBzTQAB+rUbDijUh4vQmGH7xUrgQsEWXjRuRgdAYsGeY0
         +170Fr8ZURCRI/sOB3wmuz4zfDWAFzHzO2J3X5Yv/F6o5xs7MjtgxEq/Eq1EEumoCIqD
         IoVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA1LF629xTly7OXF0N1KbXFFbBlfqdTSp6GycBhOPKa297gQp2YOmj7Tyvqa93FziQMp4DqBHgmHZokQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7oGEZOpHolyu/U+5qZLSnYsjv5RQHQucQRZYiS+xRMgJxt2ZR
	NvDSbJedu5/IpPfDfkatMBaBN6DPXGPxynJ3HBRj+mYkfu1SSAMEvbYah9BPFf3ggJI=
X-Gm-Gg: ASbGncuzGZT+WRmcEfhuqqZNygC2TDdEUFys//TZdSfSZNnrhWBV3cgomJMvduxx6GN
	3wmRGsgDfC8vhjiu2MBJfQZjg6mQ9O+20rijdMvQb0OOadG7q+yrQQr7dHe21XvAg3Ck/D+vwrK
	Yq5nwpqrYAS/zK5v+fbJcY2jT8QPFvN7p438anz7g0fpzlAzIr2ANjWE5TZKA14dQTaX7ZLIXmr
	oy9kclLhKy5goLuT9+4Rp4haWlgsj8XqpNGGQQELy1tHJF5tE1QGfj0A2UmypF2mIKOQls1y/0o
	8vACaVWmMX9YjjGl2MrUnTG20760J4NJ3zZZGftAIMEb0WmAMMOyoi4hInCXg06E14F72fSH4qz
	3Gyx6gbSHODXWcx/oYaOIfa/nQ2vYlT5z62KNdPZJShSCTmdbKbcT/8LE6e6GRYM=
X-Google-Smtp-Source: AGHT+IHp3F1bGKZQuLQleiP5LQBGh2HZeuuoCI3Px72hTP9M9DOLyNGcLbYw36OIyWjFyB5RpreVGg==
X-Received: by 2002:a05:6000:658:b0:3b6:13a1:8861 with SMTP id ffacd0b85a97d-3b613a188a1mr12726134f8f.38.1753114976724;
        Mon, 21 Jul 2025 09:22:56 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d74asm10736869f8f.63.2025.07.21.09.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 09:22:56 -0700 (PDT)
Message-ID: <90a896f0-7b67-494a-abe4-dceb52067e65@linaro.org>
Date: Mon, 21 Jul 2025 17:22:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2025 17:16, Bryan O'Donoghue wrote:
> drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c Documentation/devicetree/ 
> bindings/parch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtsoc/ 
> meson-axg.dtsi

Documentation/devicetree/bindings/phDocumentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml

Rockchip, Broadcom, etc.

The allocation of lanes is known by CAMSS and easily communicated to a 
separate standalone node.

---
bod

