Return-Path: <linux-media+bounces-15877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E8949BCA
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 01:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA2E1C220AF
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 23:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B11175D38;
	Tue,  6 Aug 2024 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JMFqieiy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0F616EC0B
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985500; cv=none; b=p7xAaB1QjaFz3JlOnDtAEWY6jLcjiQscd86/RGafhZfyaeOoKaUl3nsb1AiaYu2b9O3RqMmMM07R8OU6hXvSbXWMVvzQ1TDDt5y22jpYr9yN0nEXi0k2cM2leXgEFRMgmmFRA0J5aPtmK9vCxFTo0jArhFApyrE/99wKyKCG+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985500; c=relaxed/simple;
	bh=eCHRZfbVih8dU7pR6xWQRl/juLSmaH8RtChWF+l8FCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pnc2E9x+ybTvrHLGEEBqbpd1YwDGJmrWz+mxJbqqAtgQmIcASadhPr6n2aH3IQE1e+r9xDaWXNxD9mRCx+bHATfRG/C6T+rm83yZTcr2n9wEvrUbZwgfHujSz8y1xQRrk09OFgOBCz7cK+nBeui1Samg4b0Jnhwg0hju3VbvLXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JMFqieiy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42808071810so7868595e9.1
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985496; x=1723590296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVTzUvpo2J//Q7IWbA8OuCEthqk1HNLB6DJMBCparG0=;
        b=JMFqieiyZFZzLwuzGVnC6yuLWbsRouzjw87bCX2G4cDkTMiWOdm/HQ0VshXxe424sO
         EPkTuV7lkzRi0QzH0xFe69BcQJDRJSXKjjXPt4kS2oWCT3mz4DX4MyriF9KxLFxra87G
         3Syhbpxb3RYkLPBh8hew3BBtS6ho8ex/b5UKrQaf4WjdMtUxAe0Pn2p1qdqUoA6rssvt
         7FZGHcpcHQ8UavxwYSywuMNhp3T6t9ICg0uOQT52EV+06ZdBSoY+/oqtzL0AQz6vrRwS
         WGHnvIxAJn/TsLbajf4J+DvgOZgIEml+gAfSm9WXXGxxmHAgISzyXVUcuUhHNTKPRhmp
         AAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985496; x=1723590296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVTzUvpo2J//Q7IWbA8OuCEthqk1HNLB6DJMBCparG0=;
        b=CctW4/CDpwTc2z1II3LAhvG/lNZKEKLPIqwLs01oe//15CDiFyQGs7m4mkcaCTiGBw
         7OcNZiPrr/mjeThohKh3htpUpNcYVX268hqknH/YjJWGNjmsidnR6UeBMUX5JfTEXd3Q
         r7TEgEOmrSclBKbMpCW3gTJqS8z3AS1++PMLJyEZaRElS/Lt+iDBMgb18DRICZV/Nn4K
         2g/7J5oBXEmbCRcgeQMB7UWWs0UhQ2LQOfnDP8wcox5pBembsHcqgsrF6D+PucPaP1Vh
         GUOFoaG/gcMt2Qdca5qnRoPJtpuRi4kAQDNTulGakXJ+rWD9N9bJK2vTdTMCTtgtvl21
         DSQw==
X-Forwarded-Encrypted: i=1; AJvYcCVKvyKbWT9ZL3A7BCd+EtwA4ZBm7700rfnx0m1muByYrFMwDTIUjeXifzZihoCoodHdKGRY6uvACBp7I3XJZgh3Vq4l0TV7+EK0UpQ=
X-Gm-Message-State: AOJu0YxdzrefKMdiB8v1j0IQleKskwtMVQoALjAhY8BD44IzKuGx6PEe
	RtyAXTyQeYRLeGZQgg0wIl6SMndjTy5/zOSAGjboteY30nbP5sgYX8keCyYFoNQ=
X-Google-Smtp-Source: AGHT+IG9YNHqbFX5l53AQ9wQth8ckoaQl2Thoi3GWV3148tXmmgL0gEm989pTRxvAg0gBDDK8748SQ==
X-Received: by 2002:a05:600c:1ca9:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-428e6b037f1mr120214305e9.15.1722985495634;
        Tue, 06 Aug 2024 16:04:55 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059801sm14212373f8f.83.2024.08.06.16.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:04:55 -0700 (PDT)
Message-ID: <e27f0610-820c-4a65-a119-a5bb4fd5cef0@linaro.org>
Date: Wed, 7 Aug 2024 00:04:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-11-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

> +
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +

You're adding camcc here too which is inconsistent with the commit log.

Personally I'm a fan, perhaps the only fan, of very granular patches and 
I'd break this up - at a minimum into

1. Adding CAMCC
2. Adding CCI and CAMSS

---
bod


