Return-Path: <linux-media+bounces-31087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AFA9D3D5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 23:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8361A7A8DAF
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 21:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2372248AC;
	Fri, 25 Apr 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLiAfY/3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55B21E082
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615202; cv=none; b=KMU0mgCSv8s6HBWJvYgN5qb80u1m8mKgol+JPjl5FSSUSFRqQe7CWuHScnMZZhMIgZ/+49iI+GoDSjfUx3WY1YMWKWAAMiHEQsDWOI1BDWwnzoxuujYP+L7fdZCYVCnZCzVPTz20ZSmev56JE7abLqDuRAGa0oNaVixofBOnje4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615202; c=relaxed/simple;
	bh=JxPwV9RN/TrvkttuKLa/6dUXo2D0QhD01ILVdfvCR9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvGytqIPGIBkSHUpT2d6naXK+ffOKytJbusYRGndC0aQpnhdrykNLFDz99WWAnZ2tS7tXjNFk3JEXjgxlNJDQUWwWaiTmtpAJlz/l7yq1ftXoopL1y741euBJsz6FP9khO0yqbgQuT2djB/r/OvRdLWblfq6cpF5kss0crzsfwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLiAfY/3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so481786066b.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745615198; x=1746219998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=SLiAfY/3zy/nBvPh2AwEot8ZjqvAlLgo59CcRUdC/ajyNpQkyhbgYWdhdnzNeDg6so
         YABYDKbJ9udeaPnO2y9lNYEenGGFpXXcn0Ba+8P+NqP+2Sd0O7Smo+OXE7ivtgzLDMcN
         9DMyI5okiZluoHvR/Glxpm2kEO2sQUFqubGR9ZOSb87ZSyJfuFQEqz+3tJKn9nt6VNwe
         UT+OvMkUBtQw0sQSM4KAD5RTD5f8+14OFao3Y8hbjsqygPeVnP+EPtZMqeZE7RGzy69S
         kznm5NR8YVJd1zC/m0S6b+82rWhLjKuL8aB0p0alOYXP8tNtUtioRUMtb6KGEvSBdwTo
         GCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615198; x=1746219998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=hNyvSaqbou43ditM8SghUhX2HPEIT/FdUdpDmfGzkV7mqqCPcf8uTBrqUJJdq/qBuX
         xQGHlaXDSq31CcVo1tBFvUbsebm8U0RL6ElkX4iTMtgbMkU+sCpn5v5ZBtMDH0viGuNv
         0gkaNezePFW4PT5nBqOdt8RSK8lcWTfMTReKbS62GlX+6JmmMvcZv7oSD/b9P0DGfzk0
         W4cE8Dq/ftg9PoGgXM098bIL/5CoaH/0vBoUeEbp45i+Nx74Yn020rjhqHQp1j7KaAEz
         LibxtlvyQSwseWKmz1kOsucg6qLbJgY7iYc6tbdWuFxlo/OjdNspy1IZ5fwpNITJRnC2
         PkJA==
X-Forwarded-Encrypted: i=1; AJvYcCU+WUvALHJhi6uMVJeTeyJ7yx8VNHVbXwk/lV72/Ou7sBQlCwXlFSE33/JXEVnFWMljGNSM2ey73OJmQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPTBOXwhRNMfPf1858OQ+5HHaHjV96N0mpdGZnSGuX1v93YEN
	z3aQ7pgYoQ8vk+tpYphhyoCwol3CDQk79yD9T2Hqm4I6fGgdW9ZkylXAiskpQUw=
X-Gm-Gg: ASbGncuGH6trBfuzpyeX0irOS2geMQqKuJg9dxPuGSZwM4MZ9LRf/LafNS/+W9dLJWt
	fuz2wiHC36GicMGZa15gOz2KO+sqIj1vKg5tOr99sVc+Z3jm41Q44HTCL50A8woJx2r9WjV8a4p
	4PYjOmHrKRrBsYVxFLqWuouck8YIMJva6gkMpeOaJZxP/IoyO36a7JoX6eArF77i5TV8lmEQDm3
	/d5HmuG71jciqnTWHRtAlRDbY7CUxsNmppJyHW75M9mRpKUIobmS/K0UjXorWO6JH0FMR9SFqQu
	AEe0InIBNfZ5BIZzps86R91mMLMAqa7ZPhaLx1xWKnY3CXOUinRIaZJ8yUYub++Yujxk96FcBpz
	sI5d9LA==
X-Google-Smtp-Source: AGHT+IGoNP03/XEhQmgiGugXT7Kubo8eKyImPsEDnz3PTHi9TCSVIYUFM2j7d3vzwbsmvsEDl1RFXw==
X-Received: by 2002:a17:907:720d:b0:ac7:eb12:dc69 with SMTP id a640c23a62f3a-ace7110bb7emr383246566b.28.1745615198360;
        Fri, 25 Apr 2025 14:06:38 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a47sm190854466b.104.2025.04.25.14.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:37 -0700 (PDT)
Message-ID: <6841b51f-a4f6-452a-b5f4-c018ac2ec94b@linaro.org>
Date: Fri, 25 Apr 2025 22:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
 <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 22:01, Konrad Dybcio wrote:
>> +		orientation = <0>; /* front facing */
> This most definitely needs a dt binding definition instead of a comment

That's standard somewhere.

But now that you mention it, it should be a define not an integer.

---
bod

