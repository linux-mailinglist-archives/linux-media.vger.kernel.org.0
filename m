Return-Path: <linux-media+bounces-30708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB784A96846
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC8393B5991
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC1527CB0D;
	Tue, 22 Apr 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xreADrxM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593C1BD01F
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323153; cv=none; b=I5YFg/cKG7JBbb42wrM6J4VnfKhkFSgtFxOu+Ty+no+X0Eq7mmMO6tYHe54LrBgzaOQ8q0AERwpu2jdBpnIGe0iOru4AMBG0jDQqgwZcT43MbczVumbJqcauPz0xZq9P5PNP/nVVRkTJ+FEi7rGmgUECehE0p2RN3V1plhxrV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323153; c=relaxed/simple;
	bh=B8KDn3QvXvfYLh7t8A/lONT5acg89ujQ4x71zHRXKm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tlb4xcfFJicJpycJjAJVVuuQtVcbXpykqlDAInUSxtI9qEUqPcGVF/Mj6jrkLVscAwBko46LsfidtI7t15+wCf8cm0P3+z70nf5s5Oaquv3pg3Y8h2N/87wJiNKRwUFSK/TawTPJjGb2LAsYFRREOmtJjieMEq0LKq9itzkUyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xreADrxM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso55254625e9.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745323148; x=1745927948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtemBd3G/uirmnOoOQusjnqcdAhM8s88bXls8NzP5Fk=;
        b=xreADrxMbOd7nlDXWdt/NNWXmNZjNDEbLWeofh1TLSTPaR7YeWtH2om/GyLNnTuFwF
         MQshkEa8q0zor3+fqNiSkQWI5iBzADFggkeEbAmryDAovXFxs1ju6G4bHblUAuizF2Zj
         Yib3cr6Maw2t/TKyLJ3OrhkFBB7OZ+I3F+huuLPsWkMfPnfTfBlJTgutUzaqt+XwNyTk
         NdwWmRxa0aSt5oArN6j9vhwmilGBTj5maOXWSxDafR7TqEtGWO1p4xRwMH3m0/ZPs4PZ
         fX3C1496TGNpskbhSDWEEYMphOzg9p5TVtXe7IEJMfPsSRXtJhspAzFVYDKUzQM1NSAY
         7W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323148; x=1745927948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtemBd3G/uirmnOoOQusjnqcdAhM8s88bXls8NzP5Fk=;
        b=swJg7J2w1TfGcYn4fC5lywQ8WouJjEIbLL+RqhZYJ+TUXLuldr7Ds4zCp6K0pNVfzd
         SXP8dqgy+qLRLtb8NU1zAsIgoK/X+SOg/Gif4HdecvM7r79C5o7ZfpAwfizPe6FMDij6
         LvEF1ePc1v/Utd4iTU48Hak1I/jOZ4LCPOut/1vZf8NnSVyiX/LGIYf/wkrwGav19j4b
         M6zarGmWeEJz6yWmDgKcu3yE3hlwXKsywFCLZj1Gi4OrbyWnaQdhuCkQG3Pu7Sl/OPxL
         fXT7z1/f5dO2GdJEtZapO+61PVp0bNY9lH9iKzKkkt3cWHF4CB5jJf8QpKGwEZT1uQ/I
         8a7w==
X-Forwarded-Encrypted: i=1; AJvYcCU7T0vChjNr8RLg5WUOJWFIkqrGBt6Vjh7xTQcISPaYC2NYYRwHZIS9MkygRdSpwy55cQFw9fcNLvSjyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7N0M31r7RsTBbgGbTsheZdlQVZ1D/AFY4twwhfKslnnBR+yP/
	mimlhDOgcAFU5vRFKoveW3f8KXR+cBLRzsbtiZRUHI6X/+cAo6rn8OWk/WmiHp4=
X-Gm-Gg: ASbGncs6kHQi0fXkMl630LC2/XTzGDoUle/uJzpAbfzOtu4DdV2Kz+/uGq6SQQuxcM7
	NC5Kpu3JOSZQiThgY15XBXsvgW+stCYogiX81K4vZf+jVDxXa9/eKZdqbv6UcpcLjDlbXDLAj6z
	oGhUTpQzp6oUBdSST+DnTaJX2atXPshobfs3wS0ZUTLDIE7BHCh9uIyQwZwhJe0Np1KpZSp+hmY
	oXmymNw3z61rPtDGdYFUg8K2uyrfMCYr+ySbFfg+l9jA6R9AUdWXP8Eb5o7n8Eb6ca1dBAPiiyb
	73lQgaNgW0nR85zdXHMY3XQS7s1+NvNGVoL0v7c1KJCF7JuC6brNZTvKAmF4RGZQafmUWh44E6I
	liCVyPQ==
X-Google-Smtp-Source: AGHT+IF1y0d12KuMkqHmAdbxu4rB1xn7kfvQc2RyPvUyr9/eORSwE/0jB/0/qhRoefW+QRojCB8LlQ==
X-Received: by 2002:a05:6000:290b:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39efba3867amr13238328f8f.5.1745323147811;
        Tue, 22 Apr 2025 04:59:07 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4235dasm14809380f8f.9.2025.04.22.04.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:59:07 -0700 (PDT)
Message-ID: <d19ce1ba-2b72-4c04-b405-f5a9d3df07e1@linaro.org>
Date: Tue, 22 Apr 2025 12:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: dt-bindings: media: camss: Add
 qcom,qcm2290-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
 <20250418141147.205179-6-loic.poulain@oss.qualcomm.com>
 <20250422-nonchalant-bald-mink-7c2d34@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250422-nonchalant-bald-mink-7c2d34@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 10:15, Krzysztof Kozlowski wrote:
> On Fri, Apr 18, 2025 at 04:11:46PM GMT, Loic Poulain wrote:
>> +  vdda-csiphy-1p2-supply:
> 
> Why isn't this named vdd-phy-supply like in every other binding?
> 
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSI PHYs.
>> +
>> +  vdda-pll-1p8-supply:
> 
> Similar question.
> 
>> +    description:
>> +      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
> 
> Best regards,
> Krzysztof
> 

In this series we agreed to include the voltage level in the regulator name.

https://lore.kernel.org/linux-arm-msm/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org/

---
bod

