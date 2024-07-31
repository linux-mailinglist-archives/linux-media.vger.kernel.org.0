Return-Path: <linux-media+bounces-15667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8399B943963
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 01:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441DC2859D4
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 23:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFA916DEAE;
	Wed, 31 Jul 2024 23:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bovWnuJ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5266616D9A2
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 23:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722468493; cv=none; b=sEDvYCPufymVq5tB0iz1iOYIeN4ymVfVGUUA0NOcX4pgLXmPcVSpbJKsxQj0mdr+R7Bu/3FT0RdaZXGr3qNVVNfejHiR3CPeh2SAIPd6VUPSWEyCDLY/EbfL093yNO6vvtdSaSRv6+8sc6pmDjWnUeY7+iz15etBmH3LJrJTkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722468493; c=relaxed/simple;
	bh=d6AdsipEk4MLXXiJKWtkXUBzwbCvfSMjpdsOlyih8do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z050GJXTqWz2mg68Yp5dyL1oO0cIc/u3kmDK9t4RVs4JszJn/X5LSeKV6rKoq7R7y7JQwtfmMNBObTolL0oavxWdvObdZiFsjtQS3Fd4bIwXtiG+MBeINzH9FK9VW4UpO5qWupnfhMLW+9kgkv3iauY8d8yB/KEl/p8AjAnhcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bovWnuJ3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ef9714673so1044481e87.0
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 16:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722468488; x=1723073288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqHZocMKxa/Ko3Sh++uN9uzIJCUlsYXXKu9+HbfCVaU=;
        b=bovWnuJ3vZyq8Ub/XiRUeIjzciYuh84UqnqVB6vo3eDAY7o5w+ZFL+M8CIV2YeSxHB
         ghbYTKSawcFzwBlCQa9bam9kyU8Ih+fkCjNpl8cFn/jJKFTf77OpaLjQZAEQr5ikl+lp
         cQmUqFjGWh8EZqoq/XJtUMrBCptcLAFAC8IojUM7raH1Yw4i+fEJieNaVtORIDHAMiz/
         pINUEjQqe2o2bi+thvm2o3JzUqVHcB+iVYcv3AnYSuPDzMzGBVBZGBfiUTkpsY0/zpKT
         R7sdfnpydgXLJH7AMG+0xyKQA3BbbQnIxlxO12coKnM/3B2IxJVAOKmE0rd228q1qGxA
         0POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722468488; x=1723073288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqHZocMKxa/Ko3Sh++uN9uzIJCUlsYXXKu9+HbfCVaU=;
        b=UAb+7il/xt4EYvD4JZStG8JZeFbNOQ5MaNl7RWFnzYoYnVuNxTPLbJucYULMP4HTtU
         oSLiGl6Yblr6eOxLPurLmbb/7S+6+AKrkdMaGME8CN6oFk+GPnGHogBD2/lOn7hGTGNW
         xEDycNVSFVok9wfSvHXsXbZHJlE4i1gufKGvrw7XsJ5jz7C//1uRnvU7wDy5o/darwHV
         bJye/MkGMOi/yfsRuTL3n4GJCIfDeVJ4YcKw3K7JSqLf4T+uRYsBq0eSaBSyUm0iuKxs
         2LfQwh/HKrirrL2twA7g4dc4b/WRipSL3TVmRRM8cz2XNAxi+M09rb7i8QlMHgZb4ewP
         c9JA==
X-Forwarded-Encrypted: i=1; AJvYcCWtuoQsRSp8nTM0zBPnqKeVQW1I1Y+JVGyB16/m5GsVR4OOotGeVVre6lhzGq7rWttMjmygb7Vn5R9lwWcaCjtiNBM0ahP23AIVNVE=
X-Gm-Message-State: AOJu0YxieXPH9ccuHLpvjzIGZpYDYSMizbkuHz4GmumnEXKaSEEt19cr
	31LokorOG1nb/zPAq3Xv4BibDXaANtzNQntEHR1XBbce7PkBIAg/idkZKlFYrXk=
X-Google-Smtp-Source: AGHT+IEVnR6j3jFdtxUJKU/Jgck8FoyZtrhc91nFNQC6ya9loWcYJtZmkKE5MgCmxbWf3QzYhLwxmw==
X-Received: by 2002:a05:6512:ba3:b0:52f:e5:3765 with SMTP id 2adb3069b0e04-530b61f6825mr144386e87.6.1722468488246;
        Wed, 31 Jul 2024 16:28:08 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd12b4sm2401016e87.102.2024.07.31.16.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:28:07 -0700 (PDT)
Message-ID: <e051ad29-fc96-4d6c-9e4c-be46feb189ce@linaro.org>
Date: Thu, 1 Aug 2024 02:28:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] media: qcom: camss: csiphy-3ph: Rename struct
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-4-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240709160656.31146-4-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/24 19:06, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The existing structure captures the configuration of CSIPHY lane registers.
> Rename to struct csiphy_lane_regs to reflect.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

