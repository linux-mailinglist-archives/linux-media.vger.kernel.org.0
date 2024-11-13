Return-Path: <linux-media+bounces-21365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6B9C6C1D
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 10:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F213289E9C
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EB31F9A9D;
	Wed, 13 Nov 2024 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzeYPeAk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D51F81AC
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491607; cv=none; b=Q9+ZRschFvHIZ3WOXWZ9c+6VK1tjIwcFDyh0NFM36We3OLlPsXEtPb2Ft9TXKqVkcU878SKg74Ej8WK79Fj6yQM38D2spnEX3KK5wy1wFOxwZRwu0IHzDTkngdsPQ1q6a4WDPxmpN345/j6MshlouwHVH3f4O4abor/1OorC4FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491607; c=relaxed/simple;
	bh=Uug7HgmHCE18MUaMvJMyzBCDFL3S+vw07GzHBz1/g/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbty+/wtycsiknTbZzlor2/aaGn8IhzAGb3BGKipkRhnFmhP9W9o+fp2MpCL9CmOXGvH5pcGmbyCwZNMcqRxkxjjCiHyt2yfpcEqAZD9uRlo6+98/P9FFhqavrC/Zdy37idE+yCpUCDJKrZn/ql1mobheLo6F/ZX067aX1Ms08w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzeYPeAk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539ee1acb86so7272868e87.0
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731491604; x=1732096404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRiI8ug3AYbE8oUaAFF3LUV+ji3WnDg4RK6r/3kZnGA=;
        b=XzeYPeAkMtcM/xTlsf0bb330SHvo1qoae5C5ycWP1mLxnAt8X5rU6Ni7WjKQFjN7r7
         8KCUKxwY+DZ41/EM8qb5RVifMABJBrB6d1uFndxW4l5fLxrTI1YHObBtHeGbxx6ry7r/
         Ap14PZS4zyAsxPv+tiZzmVt+xJUx0TNEWbh7ro5W2AcNLWS9cerpN0MyVr9iDRGDMLnS
         dn9oH1zjc7gsO9/qzwFc4/uNDijse3DVhlk/WcorArNRzeUjZRYBLLxtBvKcVK0kM06c
         xEW8miQ8xXw9/d5LEjvRiFrkyR5iNdPJZHxrRtd7RRUb34ivaK5Bfnqy73pndnFo2ojQ
         Bklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491604; x=1732096404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRiI8ug3AYbE8oUaAFF3LUV+ji3WnDg4RK6r/3kZnGA=;
        b=TroxgFiejbVFtvknQwAQ/JXBq2kp+5Mm0pZMc1eMXro47frsqD82zf0u2LuaNF0hW1
         WaAqMcANZARpASaCTPeysi1tGd4aJHGThZzhEADZt31aOHZPGciGvdMVeG2b5mPDOqiQ
         /oLAYicN4SlOG9q6l++KBV+UMjnoDSkUuU25MxXaDcOfFWfW1X5b06pdin914bHORKoI
         JWwa83oCWUGBNNCH/9AkcU6nJRpj2ZIZrk/m86f8LM+TFLqKfvyy2X2hFsJhgnMVlD/F
         oNgbeXCloGwoqcoNGrtmw1+xgn/cNwBH+Rn3E4kR55IZPRhOuiOO2eighUjz+WKyMLij
         NKJw==
X-Forwarded-Encrypted: i=1; AJvYcCXBjrKadd0FDT8uU1CcUhrkGx5mkNJrtTtqqiVYR2QCpB92IFagr9mTX/dQqTUF0tv5dqeLhH6zcDytbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcypaVWnxUumvorCM9ccebWGDMalmLzeNTsU4TQ0ke+WK8tto1
	IdOhAYGFEvEIfajnvmC8OZAWhTdYPGv6Q8lq8zK0lFsTL7ywajYg1Qokc5SfDyo=
X-Google-Smtp-Source: AGHT+IFp2XO8/M1hfYDyTXRtoRIwGiCo6RswIKBUnV2CYhn1kxcSXeWiw9nYRa78XmlRcQ91ayRAOg==
X-Received: by 2002:a19:7708:0:b0:53d:a000:1817 with SMTP id 2adb3069b0e04-53da000188emr717956e87.22.1731491603427;
        Wed, 13 Nov 2024 01:53:23 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d55051easm18906635e9.24.2024.11.13.01.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 01:53:23 -0800 (PST)
Message-ID: <7f8172ee-8285-4e7c-8ba3-826a5516fa9b@linaro.org>
Date: Wed, 13 Nov 2024 09:53:23 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add MSM8953 resources
To: barnabas.czeman@mainlining.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
 <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
 <6833ebc6-9210-471a-8ca6-5f3605155f33@linaro.org>
 <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/2024 08:01, barnabas.czeman@mainlining.org wrote:
>> I see that you do reuse csiphy_res_8x16 for this platform support, in
>> this case let me ask you to double check/test that the "vdda" regulator
>> is actually a CSIPHY regulator, and if so, please move the registration
>> of the regulators to csiphy_res_8x16 as a preceding change.
> It is placed in CSID at downstream and this is the documentation of
> the downstream property:
> - qcom,mipi-csi-vdd-supply : should contain regulator to be used for
>      this csid core
> so it should be a csid regulator as i understand.
> It is also placed at CSIDs in msm8953-camera.dtsi

No, the regulator(s) supply voltage to the PHY.

Make sure you have:

commit 44fdbb9d1a3892db92b2c9cf5f46e32ca4095d92
Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Fri Sep 27 00:19:56 2024 +0300

     media: qcom: camss: add management of supply regulators to CSIPHY

and give the change a try.

---
bod

