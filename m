Return-Path: <linux-media+bounces-33441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBBAC4A09
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 10:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DE717516F
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 08:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CC7248F70;
	Tue, 27 May 2025 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVTYCAhX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0796248867
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333974; cv=none; b=nvWb4PuhPexOO3KniwB1kn1CHLmoXPg/bQ4fAIABfPbzRc3R6DMb1oFI6xUnKLsQkPOJGcjqyHjrf2Plu3ff0LtwjcXFXBahtezCHPDKUL69Mg/JeW+5Sx14kLc/HKsznIlklQvISXfaMWjKJCXLhEcljqusBSwDZ2p03bz4614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333974; c=relaxed/simple;
	bh=ia8kZdP0HFoJkRuqfb9xYK3PP1X9WFdfCow4Ewno8P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP6QtXdnHBoEPHzlexrampZaNF7/ldwE9V1YM2YRpKg2XvK0lPgg4y83OBsTGXNcGX1jKSV4WV3/7rFX71FmFbo3Zesf1LPOkAXBF4Z6r6esG3mGGRI9ivpXzj5yLy9OuhX2QJGE1ZTu98kA6s7wr29VvZtVGNnlyHepWxJpB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVTYCAhX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so35960305e9.3
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748333971; x=1748938771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMOUzI+Rl9kCd96v3bJcE+T2pFM5Ij46/8q1c510Oug=;
        b=pVTYCAhXK0P46qJjOhOoNjEwGWdy7Z6CbVLokeqZf5mbK9vDAB/ep6MskK6VIrTfQM
         EcTNKvJs+jSB34M0oV7Na+ujMXdhffd4tDC/8qp063d2j4XOksNeFdgISMj/X30xiJty
         gM+/hTM8P4rLkgm6gk2IOrhD/j7Ci+M7BfWzfv9DnF6kAqPTK2xRO1y0N6Ys3TGzHWo0
         jvogReYJOQsXzrxW+qlqyBAHShL3nJ0lctCRC0DL2X8DM5+R6m5IQS9P03ZJenMhK1Zd
         Uw4mVOIF5+8jAq/hpmbzULXJXPlhDQVhVoIvDYV/IacmYptdI0gtYpQbDqi5O1XyNlnJ
         3w6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333971; x=1748938771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMOUzI+Rl9kCd96v3bJcE+T2pFM5Ij46/8q1c510Oug=;
        b=VaptTMmYuLTK5NueRUMZtd9cfDI43DdCOTqmBoYOmKB4GPStlIwqx/U77tl9/OfEFQ
         9B7cFeeZ11RerhGfkBeLqVshyKTN3sHtcqqEDbTzoRDF+wGfBKPfQ4FXSuDSN6EQhSR4
         YtyJ7wy3mzp6AcfLFYod83+zYvWU3/r01z4i9cOUUXRKQL9Ulv3dp87nRD4T5q9UMYCQ
         TEa/xs5Ku1ob+b1G2YbqNgWlHRKhGpAapvYED/oydmZTLvW7AGzKitB4vC35OBOqgxHi
         UQPrlf+i/HdNBNEPmIBQX7suQN2ZfiUIgAFGc8i+dRkMhEmp8Kd6cENjQxZmJejemuty
         8z4g==
X-Forwarded-Encrypted: i=1; AJvYcCW9jHNx7oGjMIiV5u0vYu7+INOJhJH3UMZ0e+5+U9Ve8i2nWml7WnctW2XLlzGRpnzhWx6yxtarpkCOXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MwLSBPtOS+y6iubXpkv+JWA7Us7GOyUqfZtgXxZ6tBIRVImq
	aIYNyhfadx7qr66S7LcpbZyMD5UmMU1xC5OkUvxwQLa3CBNv/3Mpxfkqgm4aBRIEOCE=
X-Gm-Gg: ASbGncudJHM4yWuQ+0ebo7wjfXbT+7Jyont0egbHXaDLLdIoA8pg/4Y8T2mIP3Q2iy7
	/bekwdaNehEiahmo8hr9QgNJpXrh0ask7UWcxSE9o8pDe2kRVmuwTxSH4rbBLxglUqcbial2pKp
	rlL871UodqAGRJ5Oah4iZKc7uKn5yy0QW72bfC78kOqLZh6k+QCA71HDt4DwzPcO8w9GdYMdgzR
	7B+AFeQTQ/o6Nd6oc3BeE/Znnd5UeMpWXHN3AIr5A8nMbD/n/Uqx0itbA/EAe3RmyUf/OK4Sj8T
	O+dBNMkcgz7OWmUD5rRu5fdtA2QRDO6Tla3vssEm6Jq8YSvHR/wjKpxjvvYJSjRZGWOCZKVu4NC
	gE9OCFe7C4krzWnWu
X-Google-Smtp-Source: AGHT+IFjTsGVi2CK4OkLJrI3Smdv4M+APjpCmrgDiR1D6zlgPXvjVIxxpzIlokGl7A7BbOpPT/vmFw==
X-Received: by 2002:a05:600c:a13:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-44c91dd151amr132439605e9.10.1748333971167;
        Tue, 27 May 2025 01:19:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d53ce0b4sm6807921f8f.37.2025.05.27.01.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:19:30 -0700 (PDT)
Message-ID: <b3d4b080-5a9e-4af0-bce7-41c06d1d27f0@linaro.org>
Date: Tue, 27 May 2025 09:19:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <f2162241-6423-43b3-a6b5-74e373cd8834@linaro.org>
 <10c45ae1d2453f7c81dadeb132b6c2911ab7d95c.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <10c45ae1d2453f7c81dadeb132b6c2911ab7d95c.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/05/2025 17:20, Vincent Knecht wrote:
>> You have both
>>
>> if (vfe->res->has_vbif) {
>>
>> and the above switch, there's no point in checking this twice in two
>> different ways.
>>
>> Choose one, suggest has_vbif is enough.
> I think the switch is still needed, so that distinct settings
> can be applied for different SoCs.
> 
> Or should I just apply the 8939 settings unconditionally, and keep it
> as an exercice for the next dev who need other settings for another SoC
> to deal with ? 🙂
> 
> Thanks

The flag should be enough.

---
bod

