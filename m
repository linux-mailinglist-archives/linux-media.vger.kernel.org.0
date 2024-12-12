Return-Path: <linux-media+bounces-23235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D829EDCE9
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 02:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E33188A10D
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 01:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2152745A;
	Thu, 12 Dec 2024 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uc9uDMOI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387318028
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 01:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733965622; cv=none; b=spk1nUsNjs067sALmBNU7UeO3yZUnH3BGupOC5b1oLSjcvY2h4oele0Q7gvaj+hTKhuDSZAXMq2CjuifgDiKX16Z9Z7XUYMdyFadqJCgzA2QzTyuEX4Q1e8AkX6j2BBP2lIQkZ73hGVxa4uvg8ic32+YfI5VrpFF0q/ESCo0CH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733965622; c=relaxed/simple;
	bh=gJ1t7jFV9t3JAZ44S7dAGAuFRDkQYiEA9nywpShlryo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIMjs1+Yq6TSIbVnYDADMjJU/KpFc5r4+a+FgCDp8F9ih/XZM/RmNI/KolrvZgViRqmCR9tDHMC/jXSnBitkVosV8mBqNIbPOHHEe21OfJ3HNe9XiazKxsY6djhgA1hK5y8OBXgHzOCwaq0GDevemml/iBrNhfKfjVjRSeFQJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uc9uDMOI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53de3ba3d39so13982e87.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733965619; x=1734570419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+woOY8TwWcN5XSeyhfjDCS7hZ8p+Y2VZWaYuLrMvp8=;
        b=Uc9uDMOIf0vUP6Sc85rbtXLFe7SF4L8WzXyRw/Iu6d+pXwtE53Rz0U0wT/JnlWupVe
         Klrz7h16ibZsLx3E2u8wEMAszOfBiT96jWzU/Jfsi4rS37SsG12qh+ghFsiLCTXqLlx6
         83hzhGzBGvtAe9M9+BOGjg8peGvedyd+7GpRWo00GIf86WvV78M29Z2DLGaY6nD7zLFQ
         V+ehlEHRVOBTZ8ZpxmqWpsVpmmUSmbnpzgVG6PYSQGp2Y39ac30xPFpJgxF9RZf8CQX5
         JYVsr9ssh46tlYnXZi/NwaedwE3zQ7KzqpQbbAR1U79kUYARG4CrbOU5vwORbtTcnsbG
         41Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733965619; x=1734570419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i+woOY8TwWcN5XSeyhfjDCS7hZ8p+Y2VZWaYuLrMvp8=;
        b=wDmFGyZzDavINI5mVknKSfmcF3zqMYB986KFJ7YIV/m3jSol9kebZJroDI9Ux6ia+F
         PMvfIkrkPoGDzsdHXK7G201UY1NaRwKk5nNM+cw6XmwVIS8eUq4UkBf7nXrgBs2qIDCO
         Vi+8P+wcMVES74BtP187xhAchh9rXvBaXbZBvFRTBDKf16zUe2Xwbk4qJ8GBaUEMTH+3
         pX9murPIJK4//ERFYMBQc4BT42PvIzVogkAmbXWLuyo/Y47gv+zDIw8eknQpKkjbUjYe
         FgqA7xdj8inLwZuDC6XhU4TX1DpfVEgyhWwkBA2wAWVrXJne8eJVFbsuzTAKKrNVyFAS
         HzfA==
X-Forwarded-Encrypted: i=1; AJvYcCXW1gxQgWsZJEpyHOuYAuApFVOJKi0QCnroK9O3CPX4AcdjL2ThoHHfVXTaSpN/+Kn395Nz/G3XcLXAag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdW7fVPd2Zcpbn3Q7tQ3rFW8P+IILuxf/cf9yWbqLLNEYG+aZf
	geogNBnT/yesrjL1Q98wfOI72WprBYfUQ/XTaPIg1i1vGXFS/EEBRjI9Ih9k3Wk=
X-Gm-Gg: ASbGnctiQHeawBfZQauSz8uH1BJtx899l6KH+tYoH5KWo+FphEAZNip+xFBZJu4EUJd
	br0yTt+pzFZ+HLYR4d8MqjBdfkzZH79RfWGlM9yUqmBgPUQVTxWmsk6oORP08uSakOI6ScRbtFA
	8pC8qmd0nBgA3Tt6PIGXSqmL9oLF14LGv1M8WQp0VInembwecJPOMDWqEOR5vq820OHdt9UfyCC
	WfIO9KBDzzugknGy398koeLRsSxgMibrR7G0K4/Vzr1jdNeUMYf0Az3uuHP+l8KAvCgSAdFAG98
	8w4jTIEPxTKMBbT5kt/VJ12iXELECGKS
X-Google-Smtp-Source: AGHT+IGYDFFDuvEn3S5kjDIQpMD7AfzDjFeKfQ1ro/dx9kV4l9MhXuvGNQD+2H1a8bnVqwoSvbDeaw==
X-Received: by 2002:a05:6512:2207:b0:540:2f74:e826 with SMTP id 2adb3069b0e04-5402f74eb92mr149898e87.5.1733965618907;
        Wed, 11 Dec 2024 17:06:58 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2297441esm2191877e87.61.2024.12.11.17.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:06:57 -0800 (PST)
Message-ID: <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
Date: Thu, 12 Dec 2024 03:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: vfe: Move common code into vfe
 core
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-9-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211140738.3835588-9-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 12/11/24 16:07, Depeng Shao wrote:
> Some v4l2 buffer related logic functions can be moved to vfe core as
> common code, then the vfe driver of different hw version can reuse them,
> this also can avoid adding duplicate code for new version supporting.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-17x.c | 112 +------
>   .../media/platform/qcom/camss/camss-vfe-4-1.c |   9 -
>   .../media/platform/qcom/camss/camss-vfe-4-7.c |  11 -
>   .../media/platform/qcom/camss/camss-vfe-4-8.c |  11 -
>   .../media/platform/qcom/camss/camss-vfe-480.c | 301 +++---------------
>   drivers/media/platform/qcom/camss/camss-vfe.c | 276 +++++++++++++++-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  57 +++-
>   7 files changed, 376 insertions(+), 401 deletions(-)

I've spent some time on regression testing, and bisected that this particular
change breaks TPG on SM8250 (RB5 board and navigation mezzanine), but in
a different way than in v4 or v5, namely frames are not captured at all.

This change consists of multiple logically independent parts, it would be
good to see them split into separate changes and get the regression fixed.

This is a massive and a functional change, since it causes a regression,
it might be better to make the change non-functional.

--
Best wishes,
Vladimir

