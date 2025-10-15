Return-Path: <linux-media+bounces-44548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1FBDD5E4
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239D3189A802
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03F02DEA6E;
	Wed, 15 Oct 2025 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uur9uFih"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9F2D2495
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760516634; cv=none; b=N6s5N3krGXu2tQFcnbCPc9kj4XRkuUzTCWIczov+iMj3lpIWZ5N2MJ4ZsitPqR8ZD8j/sSevjvY1+W6aQWDcOZ+tdJ5bfBDg2zf74nzO93roTmxLlY+felt+LdYtUQ0Iz6wCv+9008GsaBY0pHGGU95l6D8GvKjJEP24X56UeOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760516634; c=relaxed/simple;
	bh=zjowPA6LA2JyKNy8/VG7vz2tOZi4UHzYurZ1ohlQmjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf8Gvb8quhv3fuOLS25MEMHOZes/0TP5h/1HHMOdf4dpI+FNYQOWBeLswS1W12n8MhxnJnwyLuln+Sit22CQ9VlkOEUOwItXPewGCVHjTs1S4PpiJ8S+v9NUfb/Gjyf6kD8Az3mj4hj4QnYcAL4iSsC9ifKargAJNHVLwOx5asY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uur9uFih; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63bc12a5608so3909234a12.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760516630; x=1761121430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEWfeOPoDT8hEUhHinrJj37kfG+XXphWeZaOer8q0XA=;
        b=uur9uFihiQuKWrBEgfq/R4pBrAvhOye4itMhsn3NjK82CW1bFW//9TO2z6VKRXB/7D
         OFt8DenKT1PrwX6bdCtax8ry5QOICiZ6o8yQyhZEqoCS/gRHZgphi2mnXChMgWXton0y
         PiW3PEUIyB0aB77+Yc5XS4luA/Yks+o9P2QDwnx56yC3w07Qv7Ws+nGvXjiss3Ts1BXI
         PAD57dapqzgZRM9gwIZquYPBb8V0nnfIqIHD6o03mw49/FO4zIId9iw4+MiAFpcpJue+
         YkBz/W99QUPHu4yW05LggXa4zd7NHdbUaqApYnbEUw61ZOlKXIIBQKPGOl2Ve7q9tJP8
         EDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516630; x=1761121430;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEWfeOPoDT8hEUhHinrJj37kfG+XXphWeZaOer8q0XA=;
        b=uOgGs4cVNR3zBdPi7OdXr+mgQyuGKxfJwxwZHnZ/6gDTXhJ9H+GBmOter+Tw+HyLyB
         ogqGTQTbNZe8APSv9pcCAgdqWXSurNbIeTimQUm7/vIBURvLvQjc5Xhgy2RAwPyDBjOh
         1CpHBm8dRy8XNdUNXHEBB8xzJqzW2UIT8XtgtS4JXYm4cg0zHrBC2LgNIGPFEVm5la7U
         Mey6cR8OxF3Qd/gCyU0uSV6otHyfnKYc3ZIb9zu/rWZrHC3+orQD3Nl/L0c90EuGaIWG
         Mn2zfLdsKpLGXpj4O9q5435j/bw5nEUsxOyRuXFFH1eyH0vrj9f8FRTv0URu2WGURaG4
         gZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCWXgHWUbMo/Iwh0rwrnLr2LoxwdqL/yBw1TKD0NIH2tEoyJdK4elKmgXFLN5+LWorQ3Y1I7DKAcN/DD5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6glao8TFHVxWpUtNn40YFyxbO9zhVQ1JjOtU/LbIk1thTLhH
	Kb57NMux/vSB3ZhHQKeJrjAj4NVHGFJ1T6t959VQcZPWCkP563fRu7PERCuXBnrvdow=
X-Gm-Gg: ASbGncv2n4Up3KstdU0eWZpel/LbnJubwsSSYpBVKQuLHyQEPA/cn7/n5Bh66WYeONb
	g8HIvXENRHyhz2/NRccqLcae2AgtgXhDlL3d3nISWMgQ1eXZ14mANnvncPpbYgQx9ihyXZS9PyG
	ds4k1YTnfF4gPywHlU1B0w2qxtFty51MC65M7puh/EpHE8ZgCJcmvY2/twcl84sIxXd4L5zcIMB
	0alPJpnDRtMSsxpaflb1g5PhLUNn+JNOjxYGGxx22leO4W2NdLlpQNxiqNw7yAiQRjqMiSqTJaI
	iAzZNqINDirGqymRRv4rqjfBrpoUrdlYEhyP1VUc5wDF3Xj26qsvZ9TxFcXps1HVVggq7mXUyST
	FUfAxdsUI4t0MEJcd2iDzlpBzJVuK82MbPwji7kg7aVeFb5Hwh98tzVdcxA2WHFc3YEiwX3flZu
	xFTUJN21D4FpZrI3sz6CLSeN9yq97zM8Nw
X-Google-Smtp-Source: AGHT+IHxbqlKJ1VsMlPtKXhUfB9UFCf51KlIdgD/eUSC/bM2tWlthk0OOIVYAVvC9wH/4v5Ovq+w4g==
X-Received: by 2002:a05:6402:2812:b0:632:d9b:271e with SMTP id 4fb4d7f45d1cf-639d5c3630emr27126917a12.22.1760516630160;
        Wed, 15 Oct 2025 01:23:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e7ebsm12712602a12.1.2025.10.15.01.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:23:49 -0700 (PDT)
Message-ID: <1c422fbb-dd93-46ce-9227-57c94eb55db4@linaro.org>
Date: Wed, 15 Oct 2025 09:23:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 03:43, Hangxiang Ma wrote:
> On hardware architectures where a single CAMNOC module is split into
> two, one for each of the real time (RT) and non real time (NRT) modules
> within camera sub system, processing VFE output over the AXI bus
> requires enabling and setting the appropriate clock rate for the RT
> CAMNOC. This change lays the groundwork for supporting such
> configurations.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> This change lays the groundwork for supporting configurations for
> hardware architectures that split a single CAMNOC module into real time
> (RT) and non real time (NRT).
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index ee08dbbddf88..09b29ba383f1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>   	return (!strcmp(clock->name, vfe_name) ||
>   		!strcmp(clock->name, vfe_lite_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
> -		!strcmp(clock->name, "camnoc_axi"));
> +		!strcmp(clock->name, "camnoc_axi") ||
> +		!strcmp(clock->name, "camnoc_rt_axi"));
>   }
>   
>   /*
> 
> ---
> base-commit: 69a67cb382f428c6dd8ba63e44cd2c59cb84f736
> change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

