Return-Path: <linux-media+bounces-22818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CB9E7FF7
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 13:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66D8166927
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 12:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25DB1E4BE;
	Sat,  7 Dec 2024 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZcbW689"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F78BA49
	for <linux-media@vger.kernel.org>; Sat,  7 Dec 2024 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576052; cv=none; b=u1CTizmH0++JCp+hedv6JcZVHi71PQMxrzN2Yg5rcGSfE971sS8SdifxS8xVXxbED4vjfaNv4i7bnXuMbVrOF+KqaFaik2rueiN/MWMT6utyhtP85Eaa1BJI1pYJZKUCbQc0s72RaM1oQBOZlQUS9cV3NVNFbMgvk0FycJD7mSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576052; c=relaxed/simple;
	bh=+xpWbnlKN0xIcwG1gfDbBIpqe9Xe15ljIylCd0kf7zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjtyKUs9fm4RFu0l7BUAkCUDXWUwo0OTI569DW1b4cDa3ijoDjHDA8Fc0Z8E/Cpq/vBAsJf0gemIW0THD2uJXn7btp/sE/iGbT+44NAboTbxxuBSTVv2+dITq9xHYy9N3Vk3e6J8Red2VCKNNs0Gjw6MIEA6ZDvBpl6iTEWbxN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZcbW689; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6332dde13so205196066b.1
        for <linux-media@vger.kernel.org>; Sat, 07 Dec 2024 04:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733576049; x=1734180849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xpWbnlKN0xIcwG1gfDbBIpqe9Xe15ljIylCd0kf7zg=;
        b=vZcbW689fo9hzgFT96Kn11WBOtOmQxJIb0z1krKuK/Z4iKbkLRRwB5pv3My+Ec7mO0
         v1Y1DJUC5O0af/NyvYZQ1EteMj1qnoGXF2m549WDFNmrpHtGYvGvOEUs9KBWMnk09LeE
         i1ZK9HohEIofn7JLQP0ZNdkZr6+5YqyDe86AAEm33SpYEz6mzcB0d1GF3wWpkyoE7oKA
         wDJNwXkU2kTfjHS6JRgfbADXToFAy4sSpZY7YPJdIqlXVibmVN2Ds+lTEvR7cOTnFltG
         te6zqD5lZnmHHAk2n/3fwVdFf2vob419E2deYM++vHOBuMTBBxROTCa6xyOSKGd0kbKB
         OlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576049; x=1734180849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xpWbnlKN0xIcwG1gfDbBIpqe9Xe15ljIylCd0kf7zg=;
        b=T98lNiLSIxPMJSpXM0yIZL77gUr6VY0K/rblL8MqcQYMlcS+hhyXVn4KwbMEZvtN/D
         HftE4qk3daOcVsIKCiIAxY1JhMIs681nbfyuQlugRM+SSgs6pqHRV1RLVR+kCY3jT1Ow
         535uQDk1zX70c4qpPtTuubHA6ZEZ63t8cZVt/zwFsmr2r/x1sQB1QyXQJS2mE1BHUBx3
         K1WWRrz+CneTty5xbaSM2GPruBoKFruU988HFxAqsjqdw8MGaLh13/HaacpvK6HXR4ok
         yZ1HkhqPuwGORw19Zk1ImulaDalJ6pP5/D1GAWimXk37rd9bHmJADEbqO0/6E4quEq7X
         6iHA==
X-Forwarded-Encrypted: i=1; AJvYcCVEl4UZKN3yY2QliMw0yw7dI53yoRaW09XpvY83MmpZJTjgPfwngakIeUuokQCLtTIsmjR98o/OC4wSUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1BZZ/aGF9OSBNkZIe+Rh/hCrtfnI4fIGMk3yyNcjSMPMFOOo
	VItfEp93H2kW0TtE3PoPbOEeeiE2g9ZXCmtd2edg3CJM0RXLlGQhBaIimsCjHQ0=
X-Gm-Gg: ASbGncvMGv0C+4aGA3MRO+cmLmsGe6ezmWgf8T1kun1OiqSGuop/ouMeMDTYrjoE7US
	Vffch9vHhbXL5b3xV+HRIynrNT6dOEQkbdPfBqIVGdV38ZfP0R0/pG5/KyxmYJ973Zb9rW9+JbI
	EPQCpygkVqRvX/Cw5Nnx23DT5GSZZKAOuB9cuj8BW9iFNu49B5gye9p7ziQHMyEZDCTN9e7ko0s
	RytUeXIlYKAgXCGIAdXBG1yTwihrxw0BHRBpEe729DjqW10r+GHlc0dpg7qKsM=
X-Google-Smtp-Source: AGHT+IFc59lrx1M6saKGPjF02Omnnsj0HLfp4v7ByL1sRkcUPHF3WsyaIILgsB+Yi9QNF0Qp9YtwjA==
X-Received: by 2002:a17:907:7814:b0:aa6:19f3:d083 with SMTP id a640c23a62f3a-aa63a07357dmr584148866b.30.1733576048745;
        Sat, 07 Dec 2024 04:54:08 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66b96a249sm19541366b.159.2024.12.07.04.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 04:54:08 -0800 (PST)
Message-ID: <444a0d03-7518-4f54-a29d-2d3c85d9743d@linaro.org>
Date: Sat, 7 Dec 2024 12:54:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
 <b5400627-6359-4dfc-abb2-2c142217a28b@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b5400627-6359-4dfc-abb2-2c142217a28b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2024 11:59, Konrad Dybcio wrote:
> Otherwise looks good and I can attest to this working, as the sensor on the
> SL7 happily talks back

:x

---
bod

