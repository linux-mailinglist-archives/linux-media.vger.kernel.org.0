Return-Path: <linux-media+bounces-23229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41FB9ED91F
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 22:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58861648E2
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 21:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAB91F0E30;
	Wed, 11 Dec 2024 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0972Ano"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF51DBB13
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954156; cv=none; b=Hj6J/bwEpcs7IV3Lp0jIIMyFHFelYL0Z/J+VOqkAYkcgwJONH7xYECGGuAM4GYoJa1iHZZja8fHgu6gZYUd7TYz9s5AxAY1pz82M16fsgZWdnlxzh2youZRwA0wyIh3pCIU/Eb8TX5qs9RN3W/igD/l/DRnqmUCsigmUQJMRCDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954156; c=relaxed/simple;
	bh=JjNDGyhZRcofBHcBLf7je5rl2TBTgB1GQVEGlYse7mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1ktdxPiD37bbBZWWx2oixtDefAtmdfQ108AOZH3zs9mbvPBoa6oRHrITz//dkQHimDAn2lcY8tuQnLZohyc73rTAgEfqg3CWZckWBPIVfoSLBDfVdJFmKV6htOjvtTfAmjVBmEpflmKs+ym4gQUKJfsRRP2UPy3BGggV+28uJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0972Ano; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f664af5so10221925e9.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 13:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733954152; x=1734558952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEL/ngtdEw8neicpLCHejnO5DowOyBjzk0ap1ZcfbTY=;
        b=y0972Anov0HOMt71WrAg4DFLKd8ucDNo8Fiu8pwjrX44xf8BCxJeFmbzU7BMy+Pvjl
         Y/c85nYA/K4YIZZwyD3ieyS1uuXb8Ux3oVgo5HyS/KHvll/RpkPbalOzCA3jEV5pB59p
         jDj0J/MkOjyUns87p9ca2tdmUCgH9zJ90rjzjXYzaiujU416PCCZAxWWufaveRLk6RAW
         Xi/yN0Manfv3+wH5dVqgIOqD575CLYoKSdkOl+haC5zy8MTQr05i30R1uL8MnYsH2eI1
         iGaev0x/emdQgEdF7cddeLewgoWaApTHG4B+QoSLdyvqD8TOarmxl1Ji6q7JOSlIckbq
         BRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954152; x=1734558952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEL/ngtdEw8neicpLCHejnO5DowOyBjzk0ap1ZcfbTY=;
        b=J+sqd/uQLFKUC+/BFF98TmGMmeLs6anjkOOiYmTH3vmgAu+/5WCaL5Q6E7fjI1ofYa
         An733G5mxWnCnKoDlxS2Q5m+QWHUNFGYc297xWgXqO+JXbj0GmSJB5B5IUr8zyEEPNi8
         qWCrwlWQcXz3FUr/ErL1dRy0a8dhm7EVtqW+APsPwAiQzBB4Q3zZswWZOHZFPCcnLPBz
         SKqtOx3Um2+oA0RXOhGfci1eW+G59oVpTXtUlu19KfSINXDxZqVKCJMnct/ImkRwEWIa
         Mm0lNI7rilqCIM/iurVYCCzGeLCHw2W9xXTEkG3mOBneq63Rbccq4qKtIFuoHDFL7S9N
         9Z9g==
X-Forwarded-Encrypted: i=1; AJvYcCUfPP494S9m/fNa6We1H638CE9vfwqoQividpuIB207jIHpUVThPKPbqQQ6SW5AOoVYp/uxgTRJWy1oVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv4uDJHDYXgkmxYD8TizgeN6XAUAEDvAQqhdOO7upeqLybaA79
	mrNZqkfQmZ8rH+mMeQ8sRmUGnWTsg6DO/uAL8FbxB4fFYUiExXSJCiuhJ3uq5lk=
X-Gm-Gg: ASbGncvVwDGWXnS95OYKNo7wcPg6H7MsoH64TSFsH5OWEm3omEyltrDMz4sANPaWDra
	R8qsAHqsCAJJoizW5okHu7fsQeocqu+9AnCWQCJwe8mLt3fQy242Q9/ga8fqF4n4otQsYiI8GO3
	spGV5pLnF7lMnCTrijuVGYJ8uJELw1DYpNBFbvkh+LptpD7meyum5L9ZH7EGdKzpA3JoMsh55d/
	7VwYA20l6QAqWCFqnxBWFvY8BHt9VtcK6xji0V/iLFMhVglUuXjr5uQRH5z7ytPLe4=
X-Google-Smtp-Source: AGHT+IGuZnMKThgf4eD8YAuWutLkKfQCQWNUHlMDV+U1hMo6NUpM8D0pvxDc/5kFCuDbLvPC0Vi7Uw==
X-Received: by 2002:a05:6000:4911:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38787524a7amr999734f8f.0.1733954152175;
        Wed, 11 Dec 2024 13:55:52 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a5005sm2192808f8f.41.2024.12.11.13.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 13:55:51 -0800 (PST)
Message-ID: <86015568-a283-42f5-a8c0-6bfdf078bc91@linaro.org>
Date: Wed, 11 Dec 2024 21:55:49 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] media: qcom: camss: csid: Add v4l2 ctrl if TPG mode
 isn't disabled
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> There is no CSID TPG in some modern HW, so the v4l2 ctrl in CSID driver
> shouldn't be registered. Checking the supported TPG modes to indicate
> if the TPG HW is existing or not, and only register v4l2 ctrl for CSID
>   only when TPG HW is existing.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
"media: qcom: camss: csid: Add v4l2 ctrl if TPG mode isn't disabled"

The double negation is confusing

->

"media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is 
available"

---
bod

