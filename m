Return-Path: <linux-media+bounces-16394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3E954C45
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 16:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1567D1C24403
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D074C1E520;
	Fri, 16 Aug 2024 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guwriQEW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2231BC069
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818070; cv=none; b=aQy1azboVg7j2ZIRRVJDFIOgpNJ3z4rU9cPCHThGoZEQC/JtL7o1NsjndMRepHP+GvgVmTYGVSUv/al1Q9YXGix4GvyfAGqGkeWTgtN/8fHkCtz91hqoee0ieXgPvqoCdyhSanCHAUO6Ue7kORq3t+P3qo6TitZbOY3eytCQqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818070; c=relaxed/simple;
	bh=LYIvL2aCKI6DvgZCGVQrwv1dVzMR+ddvSaY8gJtRBqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATL+9a+oUJfqpp7iuAHtZgBPy2ZyBSvVvGx0C5HG6JbmJjzpZ5sOL4a4hCjh47xbPZw98WcbLi8Lc2GF65ltMPMrZGwFiLh1ZnpuE0zNeaZOE6t4WVxVLw/RS2Zls28F+6KbvJZEPuHBoo3F+Ia/0IIaXfdsn0IAmRS+hNuJj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guwriQEW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37196229343so398917f8f.0
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723818067; x=1724422867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pX+qhgpFaUEMlgLNTLJN0UUFwlGpHiwB1h8EJe7S0iI=;
        b=guwriQEWRhP6J/eDfXBpNuhe7zBqa5kMEfJpO8+SxhXPgVVFXTIzH/B23dEONu1hcV
         0iAknge0J68AqqBXUcFEL6LjmeEs0BLdq3sugz4X+kWdd3580HtjgSOV9Uv0MJpB6Xpz
         StWA9SDHKexje9ECvaZ5JCsbgSHYzp98ZWawHTautY+fMtZZs0zeumPkAHwJULJs2txK
         fssszuQoP2KGkVIdbY7HGSIGX3ZmtzI5fTShFwtyP0p6+v9TN2/yPcUdJVLxB+OqcVul
         rTkyMDYCHNOHIag84mn2T8GZxukyssLg0tLwI2XEHKx93SoX1HXAGceTMqfL/emenOov
         iGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723818067; x=1724422867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pX+qhgpFaUEMlgLNTLJN0UUFwlGpHiwB1h8EJe7S0iI=;
        b=uXPxHREN7V+YQ9rFWb8XlZjfJHGdBE4qNdGF3EEbq/zKMbXCTBYPdaFemGiqjhavsk
         1/O/4G9rkINr8/EGahIdZuDiYsOcfYVOFUmfNYqwcgkUXKgNiSrwnIf4b4emu6fHWE34
         e2YNcrOejo7S3GwemONv4lLS/LRXBRrDCm0z5pcylkNi7gRRiEure01kj69umMrs4scx
         PMCIs/FJXhcVoSQZcSLHkHRH17fLTQBfpj9/wJ3GCRdgDcv/UbDB0ERsu4UWUlTkWJEE
         XNiIckHmBBp2YjvyifLnTBA0Yf5erfrjZvX8OzHx1OTDOV7g7kMUTauIDSQ2tpQAmvYw
         JPag==
X-Forwarded-Encrypted: i=1; AJvYcCUCCn9zKBlAZWK5ALTYhqDRqzeb5OOz1H6nXnS2toXzjqnKueuyWGuWXt9gAQcugEb2sGOFrqaTO8N5sTgBTIwOZxUMr7vLEbspJTc=
X-Gm-Message-State: AOJu0YzCUu9lVvYryLZ+CsjId2NH4RKS/IFpglfOFNQBVJFWRHL+Bsft
	dnZOJDvDvpqv7QZl/08F+Asp/EIPqGzLfFfEKZIL04xxJFT7xs0EdZMr6I+pHmA=
X-Google-Smtp-Source: AGHT+IF86Kn2yd17AhLJ6H/eJJ9YsESRDoCf+PYPIgA5eUrMMA9HT+lbZuCMhOOf+lIzMbKsxJjweg==
X-Received: by 2002:adf:f2c5:0:b0:371:7cd1:86e5 with SMTP id ffacd0b85a97d-37194314fa2mr1727789f8f.8.1723818066623;
        Fri, 16 Aug 2024 07:21:06 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897034sm3756413f8f.67.2024.08.16.07.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 07:21:05 -0700 (PDT)
Message-ID: <a1aae525-4d38-4520-a6c0-0905f87922fc@linaro.org>
Date: Fri, 16 Aug 2024 15:21:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
> +#define		RDI_CFG1_DROP_H_EN		5
> +#define		RDI_CFG1_DROP_V_EN		6
> +#define		RDI_CFG1_CROP_H_EN		7
> +#define		RDI_CFG1_CROP_V_EN		8
> +#define		RDI_CFG1_PIX_STORE		10

Hmm - is bit 10 valid ? I'm looking at a register set derived from 8550 
and don't see it

> +#define		RDI_CFG1_PACKING_FORMAT		15

Bit 15 selects either BIT(15) = 0 PACKING_FORMAT_PLAIN or BIT(15) = 1 
PACKING_FORMAT_MIPI

Please give this bit a more descriptive name =>

#define		RDI_CFG1_PACKING_FORMAT_MIPI		15

---
bod

