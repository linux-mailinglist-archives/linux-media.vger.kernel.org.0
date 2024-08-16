Return-Path: <linux-media+bounces-16396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D81954D14
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 16:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CDF288362
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F10D1D0DE0;
	Fri, 16 Aug 2024 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwbM9O56"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249E1BE84B
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819529; cv=none; b=s0G3+yysm93CuWKx1YwAwQZN0o4zEE3Wevjh6W8Y6FTV/3LJhxQHO8ghQOV6ORrZHqfUYpP0XFeIQ5K+FWlYE671p2XtEFIRG3zvnu9sz1OZVtvWktt0TsNVJM4CgzCoZ4BojkOpmGnD4Fhxjb4ZpRm30dkwy0feqTCWF/DW/+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819529; c=relaxed/simple;
	bh=BI7MuylcQK3ZXHmA98uj6u1YKYT1+iGrzoZMjdOEJ9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+SitruMkTdf+3CXlRmQ/OyzFACoTzsleuHGR9exxubT1c8Qp8pTiYIoXLpgF0pq4RSdP/dKbGPmWrK/i56ya9Cvvc3YJ8xIdbEqQWM8h8cxafemD7hVd/oQ2YRSae2KP6nyNJsHNa/vMm6S/i9XH+miFSSSFWXeLnu080u2W2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwbM9O56; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37189d8e637so1094390f8f.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723819526; x=1724424326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pM0IxVfUAgz/aVGrXk4MOjMvyy59N50bkR2SdLwMpVI=;
        b=JwbM9O56UoplVzla+bADGTCJW/uRJ+qoO1Ls0ctaMKnQ0WuaNgPnqJcIo0bN+cBGmz
         1LMGRM12XIcR4AlnUwf/dcp05DByp1EEbBSI3S4UW3dw5HOMjcXO4rfwpIDKiz4ebBkc
         uMUm/tnsA8DYoDl9rhB354p3gokhCYw4Wk2mEY4PMVZoEE0P7iLQR3Tqp6NRyheFd44P
         073Ci1HCF6HFic7267vI5H5f4xMsRmEEcO+KpU8tFzukqY/c+Ln2D4jVSV0zUXPZosLT
         rNJCdqzcBuaL6wyWW/ezmtna+lYzbyMUFJfDFPkC7H5ptT8uhY5tR0heCUEv0ilfW65N
         vFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723819526; x=1724424326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pM0IxVfUAgz/aVGrXk4MOjMvyy59N50bkR2SdLwMpVI=;
        b=Oos8Ko3dfeQoatus170/NnjcGXuLJ4ID4MMeidX+1aSajS0FXDVcnPvjOqqlV1ozWW
         mr/HKbmzED+TRTSj3TCiKQCffR90tuYErUlHT67JKqd08YcwwzfyKLUTu2U3g7yVK1zL
         HTOSpnQC/shSoH2K4sRkqTH3rY8GBbop5JwwumIdYHSThkwWR93MfW+qTcJYvwLxVZN5
         H2972okBPGIqTk2l3OZ+uhWiBQ6RL4bMI0Lt9SnkkwQS+ztnZSLhIw3Hcvm4faGtaw8d
         Vh7aJ7E+VvSvnoHS4o5ytYuUrCohW0cMJdFjgrwi86l8R8Blg2FQJ8nIkirqRQbKHuBZ
         bQlg==
X-Forwarded-Encrypted: i=1; AJvYcCXRcNkvdFdy72syREsld0t1TCpyIpa7RhGUR0PXuEitjA6aUDMJKtYiqqA7/xcKlCI67CtFmvRmmN3dfqXAldDYCxYklU19vKqFjMw=
X-Gm-Message-State: AOJu0Yz1tnEhHxob25gD8dC4sLLRXbPkvfZbb3C2XwXVoM/AoDOaXIu0
	l/iSCB3g63R5msEtno4j/ttVr8SWZzxShx2h0FkwBLCM/g5T8nTAdtsSqCiclCc=
X-Google-Smtp-Source: AGHT+IE+6LiCeGLtwEyOTB58wu64M6S8/9DUPY48nOkbc1RupL99ZjvumTXM/hq9C9+KYVAfnNaHXQ==
X-Received: by 2002:adf:f7c5:0:b0:371:7e19:b9c8 with SMTP id ffacd0b85a97d-371946a797cmr1782914f8f.58.1723819525665;
        Fri, 16 Aug 2024 07:45:25 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed78480fsm24288965e9.34.2024.08.16.07.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 07:45:25 -0700 (PDT)
Message-ID: <5b9af1ec-b327-43e1-ad36-067153f7fd98@linaro.org>
Date: Fri, 16 Aug 2024 15:45:24 +0100
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
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +			writel(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);

IRQ_CMD_CLEAR is for the CSID block not per RDI.

I think you need to move the write outside of this loop too.

> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_MASK);
> +		}

---
bod

