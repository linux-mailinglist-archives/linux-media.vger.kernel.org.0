Return-Path: <linux-media+bounces-30389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B16AA90FBB
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 01:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1883B9BA7
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 23:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8271624BC03;
	Wed, 16 Apr 2025 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjRW7+dq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869B2459F4
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846698; cv=none; b=kt5gNDlQYWP9SwDSV8WnsBGkvrpI9lRrFYnFhvkPz+ieyFY+7UDXCAwGDdDg/mVQ3ZSAzISzFZTJ5lDsR9Htkhm7PJuIfWInsPeDsxkArta87Y9ky8+5dxLzWdoI2UziC31grwPE0R+U+intEJIjiVTyQ+ab5EoeNcystcDrLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846698; c=relaxed/simple;
	bh=g2QVmNXl5Ww36gdjvP7omDNKUjJYLG1PI+JsXbS41KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK89W/P15aD4R3tWmed80RAZAKLLwDmaqPCq/4s+kjVr2HVXv7Iw6UJtQPMFNwZoe+bYt/MVgno1vqzP+BryMGM3ZEKGSlPbTD+OxHP1nGvCqPYKx1QD4xkMnwMCgd5hl0I+YDeFLvKTnujgXUIipkfiQRAecsgC9x/7oqCT488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjRW7+dq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so126251f8f.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744846695; x=1745451495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2QVmNXl5Ww36gdjvP7omDNKUjJYLG1PI+JsXbS41KY=;
        b=XjRW7+dqsrRZDwudHxlHPFTL8IHBjtpqdRlYHHHlTUNZVmfG8cS7zrRUQ/MlsQhyV8
         MvKRLKfIflGU+LqJA3g1olm2iKqYVx8qyMUkK/K5nLR18urm8aEaouSEKZcUgQXemDAa
         MIcmkKfZOumhO9zZ2X84hBNjfW7PeKbURTuucGKtt3MVVT4Q2ApyA0A8DXy3Kuac+YdJ
         w20vtotm70rXZjslAzwCiN2zuGXd0yvETGf5bkWMoczt9P8P7VJu6piYdjEC5ePZCxN/
         fECmeouAew+T5FEKwn4ke0N6pP2fYJ/KST/X8QL7BEwJZ2E2YrQzGiVF+0YQVQWb/XGp
         fbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744846695; x=1745451495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2QVmNXl5Ww36gdjvP7omDNKUjJYLG1PI+JsXbS41KY=;
        b=j9dP1NCFTjJqF1ETSEriupZ/LxMtZq073TuHZreJp6c4y+pgJTKSMQgzfhIBjTWjR2
         ZEGof9ZZUYFJrvzn2qJP6YdG4ekAdfcgm7PSs0e+yrx5f91ZwiWN34Ha3gvSeBO5MOZh
         GAt/6oxPSfOfZ7vnW9WmSSe0mTosuWkXWvr77AXOVoc3YMM231O6nI6wOeWJY4v9DS1N
         iWdmnPXn5uZUypeIAzASbtY8Kx8m8uPn0Us3ooSuA+Tc8qHepudiMi0xYGqPHheqszB+
         tkdM2D6h6Xd/MeiRCtd6/bT1XC5y5MDneF5UqxmnOyeB4dXbtuTUWJ3B7y2uqolGIhkk
         EQTA==
X-Forwarded-Encrypted: i=1; AJvYcCU+IiaTpAPmMr3wApOCaRMJC71vQY714QawxjFEPUkz/VNkgfzb19hoisAYH8QSaWFU6BJ/PdSLLL1f4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRFqLjEiGD+BnXIGN4l92+2dMRYgnLemv9fR+7WmMYSE9Af7l
	XNUCofm/dwY4SKJbjztXVt7+7Uhinsoqjg9EZIiBAoROGLtAQWW79ye+1kN5HbY=
X-Gm-Gg: ASbGncu1LbvDrJSarFySCq0lfdBHGkMVAj65RiGB9zYe4NA6k0SzUYYfegNgVacgTo5
	QPRmUPLldGYbVKuDH4luUaNgd8GJLkNSARuOSYYPPQnlD8y0+EYoM21LJkZz4rkAkDGCu9keG8Z
	2tI9x3DFLQAyONhWdZUbO6Nq3TjfQIj+Icuj6RWNGGB2XaUPlCq7nJhwz0/viyMYs0QnSNy5TTg
	gRm4OkSImvObfNY56xJhm/xu/CW/2O43NtgrVwDsrosmghR8TVJZI0U/WUdSA9Ij416bmgmzhTa
	3zOvH2XQGAuwePxD4bxRW2u7gJXypD3XOXJTXLAWcJNp3+6uUT/XnHCBlSUvDo/Q2mqQbrklcX+
	7zJYF1w0VYGj91nkv
X-Google-Smtp-Source: AGHT+IEsUGhnZeo6N9qyRuGOXeA4IIrbhFbh4yfkkwI9r1JHh3TkDWmK/o+1wvxvOJUt+CJZWV6UZA==
X-Received: by 2002:a05:6000:2287:b0:39c:2688:6edd with SMTP id ffacd0b85a97d-39ee5b16f7emr3483954f8f.15.1744846695474;
        Wed, 16 Apr 2025 16:38:15 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640fdsm18172312f8f.7.2025.04.16.16.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 16:38:15 -0700 (PDT)
Message-ID: <65051936-2b8f-477b-89b8-2c14872c31f8@linaro.org>
Date: Thu, 17 Apr 2025 00:38:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
 <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
 <CAFEp6-1iUapOg3DU2+NG7q9E5EPgwBuNUvpgLJL2jWKT=0SOkw@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-1iUapOg3DU2+NG7q9E5EPgwBuNUvpgLJL2jWKT=0SOkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 17:16, Loic Poulain wrote:
>> we also have a pair of TPGs at 0x5c6[68]000 - I think it would be good to
>> describe them from the get-go
> If we want to be ready for TPG, we may also want a camss 'top' reg
> (0x05C11000), since it seems to be required for configuring CSID input
> mux (TPG vs CSIPHY).

There's no harm in including the TPG in the reg list.

---
bod

