Return-Path: <linux-media+bounces-16693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45295DDDB
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 14:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75AFAB21EE5
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 12:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A609E1714A4;
	Sat, 24 Aug 2024 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xe4Vi/x9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B8757F3
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724503174; cv=none; b=XVTL+LtcsSx60XYAd9oWkEQSfmF4fVNnXkmNtOmz/sXnv5RPhD/i4woJK2WrJwlc/oPgzZncI0ZpJAHmjD5EOxqPgueoEC1Vuhwgwu1D56D3rK+vW4SMJrzjmMT+OTHigStHNF3zVrXRvy3/Uq/4DffsflzKs+Us3IHSUlHuwFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724503174; c=relaxed/simple;
	bh=tLKhk1Dqeuga5vFcKBXlbtIF9boLPuTez0DrzUJ4LHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6y51zheamFpgOkiKMXYZJgxI3xHmQWAmDkkV+emJyCiXucBo84nVR51EPD4VqiSPMrwEguTq5EaBuwh/h2dq4fnZllYzUbMvQEqds04XjBA3ytaV9wq1BB4HDbN3mERXTUQfcdBnSlmlrb/FqN9xE1nThzGTarzZReMs/xnDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xe4Vi/x9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53343652ec0so227337e87.2
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724503171; x=1725107971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WLovWuG5O/h+JKAhAP+8wr80DuIP20L0AXJGC3LYsE=;
        b=xe4Vi/x9rmV/Ta/j7bAWE8m7BcMDu4WU7Fd89FaLC7S+doSyplx9o48VLTx3+7G1uS
         Gb88qZyAqeDEztmnGCQdxY1vlsmc1/sTN6RZieqw5fkINYKBK6pvpuQvdURIr0N81ps6
         AxF0Aw5c6XyIQgkclNrLgYX1p6pWARuSNVW9MVt3A8R1otB6r3sJv6/PmdLYcPB5OeJN
         DiqTbYu6egotYhe2yXl/BGceDYZQ3lfraLQG9KNz/BdlO7G9hn6WZa1hqFaaiOjjZM0S
         6e1rZdzxK76zri/3RWDAx39ZxNyK+b/Px/WBAVKlIXw6zsxozlpOlR1HZSQTxsgg6JUy
         nevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724503171; x=1725107971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WLovWuG5O/h+JKAhAP+8wr80DuIP20L0AXJGC3LYsE=;
        b=iyzgxooHwxcIBjO4xxgGxwZVOLarz0iLMJ1ai+M1znYBmJAEVuLBoecayqAxvBKx14
         YGdAxZ9LNFDAP4AkWeQ4+xmRbwWjbbU28fmIrtAykqCK/ohBNBbTA9wPJPvzItVvS0z9
         uMziSsuwSmwnht9iiU6w/bBTJqlhN3vtB2WzltD9YzZL/kqiyhZG2b6hjE3t/CeH5Kkz
         HBr7pIy18vPQqYkbemXekLDNlcp5MmbnG6SutKTOAOxndjkOr6DZAnxThPOhpU+GeFVs
         r1g25R/FT9tgHmmEIWsEZ5y+vs4MpZvjYXW/m3l/Z8zz7XKITorYrq/NSgQFySaOZil+
         TFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwsdc/qCeOAm9MeXABP4o5tTys6MCb/IgTIamiDUvM2fYqmT94CJurESlypgX2HEOB3IQyjTWMzbfrlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0P/FdnrpJbHl8pc26bTSK6Ae/zUowVfD7YHJt+/8ZoQLn5yIq
	dVtRLWefs9rc2xFnsL/ny2r86kRQyJFknzCLslECVZpQm2VpxRSvtQf5zGsHyMU=
X-Google-Smtp-Source: AGHT+IE4GIGaXz6BRUFNUv+C4Yrnd1n3+Fx/NV7fdrXl7wd8p0uXcV/bVCCZ0xBRXLY/kqKV1HVMNg==
X-Received: by 2002:a05:6512:3195:b0:52e:93d9:8f39 with SMTP id 2adb3069b0e04-53438773ee8mr1773985e87.3.1724503170335;
        Sat, 24 Aug 2024 05:39:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334eda9a17sm825942e87.304.2024.08.24.05.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 05:39:30 -0700 (PDT)
Message-ID: <6c16ca04-2ac3-48be-ba84-579166de0369@linaro.org>
Date: Sat, 24 Aug 2024 15:39:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: Stop complaining about DT set clock rate
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, mailingradian@gmail.com,
 loic.poulain@linaro.org, rfoss@kernel.org
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <Zske2ptZAV12YLyf@radian>
 <20240824115900.40702-1-bryan.odonoghue@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240824115900.40702-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/24 14:59, Bryan O'Donoghue wrote:
> It is common practice in the downstream and upstream CCI dt to set CCI
> clock rates to 19.2 MHz. It appears to be fairly common for initial code to
> set the CCI clock rate to 37.5 MHz.
> 
> Applying the widely used CCI clock rates from downstream ought not to cause
> warning messages in the upstream kernel where our general policy is to
> usually copy downstream hardware clock rates across the range of Qualcomm
> drivers.
> 
> Drop the warning it is pervasive across CAMSS users but doesn't add any
> information or warrant any changes to the DT to align the DT clock rate to
> the bootloader clock rate.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

