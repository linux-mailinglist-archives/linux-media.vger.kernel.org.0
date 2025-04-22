Return-Path: <linux-media+bounces-30739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F8A97735
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E94E91B64CCC
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFE62C259C;
	Tue, 22 Apr 2025 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgq/4TT/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580A29E04F
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353413; cv=none; b=czVDUdZ1KAFg77oBIJlokCMSUdJaeD/amoGl9KMq04e7HyI2HC0ReU1GS6GV2jGQeA2yvveb3z0sg5qy6Y75tJdW/4+UkPucxQ/Jm2rQ73dkY1NcvH9ajtxDEZDlG9h0QndFArGqUPkqVijVxMWYzZYBNGWTel9qhwQUj385ZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353413; c=relaxed/simple;
	bh=r7VN/7Fwi7LiN6yHe4w5kse7GPTw6IFPJr8dfDaKAtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSw25qTJjh9hgM/qsu8E66I7FjRcOB2x8CHTqtN+r2qnwxqHPc+fKixwc3FbvsHnpKJiBSk0ENPCNgbKMVsJSU0gUK7i5hMlXIV0OUV49RAyLUDgwdKDDoowFhAPFKb7eRchE7t1mRnqY0JJuyxHO/fP+CToVm1Xr4BGTv5tuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tgq/4TT/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acacb8743a7so41773966b.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745353410; x=1745958210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKmp2FHEFAuiUwLcrSsEVcw270aFZSaF5P3fuGST3Ec=;
        b=tgq/4TT/VtgRFxTLJg57kr3MEhrwvkIuKAcR5MeiutgTY34yDHL6UaXjrtP1wZ1r0/
         LjA590VpM6nsL3dnlU96cGNouGY+ytsbTX4KyEMOzvWewyo1Uo+4/lwpAgH5UCZlzFh1
         Pyg6JufnAp3jK6C+xxEKdlm8lmnHhhoc/EypKmcDiqqEHwRG3jlIyAlerhaBuD+4eUv1
         CNmNzV4dgy9JREbuPnw9eTZTDpD6YoGJKa0wVG81dtg+lqg/5tIvEg8GlffwDsIco+bA
         fdcuTLphHYO2HSB0LQGtb0IsqTeXfpIHsHITywl8Jdu4zTlWFUAv19q72pbk+YLbxRzM
         /UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353410; x=1745958210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKmp2FHEFAuiUwLcrSsEVcw270aFZSaF5P3fuGST3Ec=;
        b=rAYXJhIiF08hiKrko0ixi+gSqFTKu0PQN/ltEQ7u+RfvRtAZZ/8syQyMvj337xM3IV
         zoJd3mB3zAP0uDGZ+SAeBFoIKSGWlEC5YjooIIcGdjYoHEowhivhn03pNI4o8e1g+t4f
         DP0MCxrqXcbqjBBhhsCfUZGHS9TLY4fbkE7zr/I6tjsNlGvSitHC+yvMEo9gITmW6WQi
         cUxxbJ5oBgQXpalJG2u5LH8yqt5vfsi5jMAWT7SXlhpzu8ec4OyKYLm84Kfd5rQY7PR4
         WWO1s2Iv5xBNt2AArLDXafKN6vbEakxnpZaOpGdm3dFA7KLxL911ZGKUMflvX9Xxh445
         6Z+A==
X-Forwarded-Encrypted: i=1; AJvYcCUzpvuDdRBlplr9P+nfTpbSNIfe92nAUg0TLMPu+fAA1oG0oS/uQwRHac01mNT38YDKaoDa0RAEx2LQWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05G/vJq3bJsj7u9j5nvp4JDPFmoHffWdOB1XofAOLndL8FYD9
	rfPV0dLZgyE9BslckhYqhvUTpPexpdKaP2TzSoD6c7Yl+rtR0ZTv9veH6mY9p0o=
X-Gm-Gg: ASbGncvMAqL0/J5oHbNAIlwlSUv4vblMJZ51FW73TiC7aRnm4SEpQBhGMFOtyqWydCp
	fSykwq9MBUXR9OOLMKmeBAllYOUgi6BzdZyzzM1Kw/doSuuHe3i4DpIV6k6EHbNNUflhrKdmjLx
	f5+rdDigrrTgNTEPwkkvJaib3NQ2ByTcP55h+cG+TlfQdnZs0e5a6Z9EIxNzJlWEYY4iOequt7B
	PdMdCoHTneqox2G16kyl2aRFh2BfR3WLUDuFxf8BsH+X37PzR3gy781ItxT+9yR5N4k4Qcf3SNZ
	0Nqm7o/CxWMLl6ggXtWal1PhJrvL6UKfwkd6aKjzn0mm3JWgMzU5zImjaj+QmvL2qEWqrq9LdQo
	GYzVPnw==
X-Google-Smtp-Source: AGHT+IHDWbdX3oYlKDdl8Py4UsbyXU5LNv4eXhMD0AhhXKJZ3V/Gp5bf0YjPavO4S4LF0mBvKGNmkQ==
X-Received: by 2002:a17:907:9704:b0:aca:d29e:53f1 with SMTP id a640c23a62f3a-ace3f4e3ce2mr24940266b.12.1745353410101;
        Tue, 22 Apr 2025 13:23:30 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc703sm706512966b.94.2025.04.22.13.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:23:29 -0700 (PDT)
Message-ID: <1a35fa10-cd83-4f36-9cc2-179c3a2a4909@linaro.org>
Date: Tue, 22 Apr 2025 21:23:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] media: iris: Add handling for no show frames
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-6-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-6-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> @@ -642,9 +644,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   
> -	if (pkt->port != HFI_PORT_BITSTREAM)
> -		return 0;
> -

How is this part of the change related to adding no show frames ?

---
bod

