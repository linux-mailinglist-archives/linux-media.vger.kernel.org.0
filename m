Return-Path: <linux-media+bounces-30538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BFAA93605
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B9619E8286
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8D52741B6;
	Fri, 18 Apr 2025 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFWIAJvE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE49270EAF
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972142; cv=none; b=QZrWyw2mwlOy26K9n98TL6VRzBh1Hp2iHnM3MHNf8N3azg1upBfyfZGnc5N4BRvDjnJp54Na1Lom/QOsdVCNvqRbIF6Bof8+vDj4DQ2pbQPsPqzOcAxrDrTfrox/kbe9ICy11OZxZy/QvpyTLn8FC7GyxCy5tilAbI+WTq0vpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972142; c=relaxed/simple;
	bh=PXjUbokpUcI7LlH+tMOmZc96wIGbaznXSlWcnx3/Za4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbRBQOrp8EzM3DzDcKTlkAz5nRD2woLq4YfVYfrbBXWtMeniEwCMclNceLTKhLYqp+c25iCRISq1QLepl1unyi5bXfIM1kbyWzuIVq81WJURlx52WlrXfDWMgHJ9UtfLw/5A6OjojLY44a4AV33Xyvp0l5gkFunrGI+xaEiEGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFWIAJvE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so19967225e9.2
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972139; x=1745576939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O7HleWCohYPjMIRO73sV8qZDTMfJD2N23urCmVc53xI=;
        b=BFWIAJvEgNkWTZJrQwsOWWqaSmPJBcRta2Ei8DZ2Anq+hBHFa79MXDdug6IIdxOeJ6
         RVfbOfMRXvGxkHbvZ7LwOV7hupUsvf0ouOq62agRNUlMac1jPWJqDm/R52qy2N0nTBGi
         fwczznx3yIQFYJBtMbl1ztcxQvez0HTntx1EueCe2P9Uk+0olXQWi9tLhjrteQh47qit
         O5rD/yXhvObBnJ6xUZ0bNSCcTtAZMfHwOpHGafd+ME0rPcyAfCfRDR2i/TGSVTnqUV+f
         KN2cBES9xDKsAFd7JqK4nycou3yPuI8L8Ut5HnCpZs4QLF8z23j3aZksKZJD+4YhH/6n
         L/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972139; x=1745576939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7HleWCohYPjMIRO73sV8qZDTMfJD2N23urCmVc53xI=;
        b=gqyHNEdSA8tfGfxjQUxxoXkIVe6NfZMYj7JLphcsncJDZkl3trlIz8BAiee6RI/u0X
         qSzP5AgbAVu9hEm6dAvMB1fO6tL99OdxkN2oxxZrsqYrxU6hrW0n0vU9pnVwayZpsKfV
         kvMRzfLAEHzHH3MRcmiK5M574MPJSByKZkYxJ+b+Yots+d9mb+9tMKqsS+e7oKOsYiC1
         uB4773N2B65h3S7KFE1rjaGMTTZFtJCMX1JYZ8n6HNY/UoTWdUNWGo1kZpzE767KheNS
         sPuPqcpmmZpbVcCqfa9iJS0KpC8BWz4lOb0YYl1V7SWGr31BZ/v2w5Pqek9XUKTJrdZM
         V9qw==
X-Gm-Message-State: AOJu0YwBDPUKSQh4aeAUCe9GexBRPbjizJA+tBkGUjB2BOtAY2c/dUpy
	fg1S+Ybdtv3n/0IDD9s9VqZAJK+fhe6OguXeAQaoJQIMwKeL7uXxhzl0vtDGAJE=
X-Gm-Gg: ASbGncv7UDYuNa5ORnb6+suG5OTwnSJHIsrt3npAVh1R6Ipbu4gdUmNf7beCxUb/6B1
	i/uHyIUqTrLk5SLb6/9F+0RAubGH7dgq7nSe5IVh23zU2tqjxRAmXctcPNf4h9RmhU8R9SOSRU0
	f37nJ1pVNMjoQ5T2eIgFyCcBu0d0ejGLvj9JjRA7oe2/EzXWuuRsi3IIyWxqBpraxUDQPlPLsGT
	sRD8S/e5/UYEmF75UWklILe7BYFoTUMpaQ3RJogu4npZWeOKVpcuwOSQks4UODZeuEabYHOYLJ+
	9Ylnj4ZKJP9+E8Uy57gzC9pZRTRa3CaG8U8bZTCKzl8duG/ZFBudmn2B8SOuDrssGiCMFy1UtId
	03r/agg==
X-Google-Smtp-Source: AGHT+IHJxlKM+V9zjxNju1detD9GdxRElBAn2xumwvGV5gII8CVWfwTLrPeirgJsQNjdQc0gV17/RQ==
X-Received: by 2002:a05:600c:8508:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-4406ab93c98mr22161755e9.9.1744972139340;
        Fri, 18 Apr 2025 03:28:59 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa421c79sm2337770f8f.1.2025.04.18.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:28:58 -0700 (PDT)
Message-ID: <ed3f537a-ac1f-44c8-952d-42a5d83c3a69@linaro.org>
Date: Fri, 18 Apr 2025 11:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs8300-ride: enable video
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 07:28, Vikash Garodia wrote:
> Enable video nodes on the qcs8300-ride board.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index b5c9f89b34356bbf8387643e8702a2a5f50b332f..87114a349fedd80296abaf3d2f5f284b5adbbdfe 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -285,6 +285,10 @@ queue3 {
>   	};
>   };
>   
> +&iris {
> +	status = "okay";
> +};
> +
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

