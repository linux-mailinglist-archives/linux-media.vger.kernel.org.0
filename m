Return-Path: <linux-media+bounces-32951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913F8ABE3BC
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 21:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0375A8A6302
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 19:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A787281374;
	Tue, 20 May 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMsYIeeb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA2C157487
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769437; cv=none; b=oKJkR5UYKJ9oyzmeS1OR/mC110N31ZnYTMQNzvfDO00ycFbAy2TsGg339pNDlefc8xGQR0veVSiAWNT71cMRbzVqYDzP2UzNjjGMLDH5eE2iSrxZJAe4t52xQTNOIXjIT8V4YNhNR4uVvAtK49leBLi0RgrnXmbomvgn8s7fPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769437; c=relaxed/simple;
	bh=x6AxyMhQqdGqFN1K69xSDMF+wdj9jfMXh15jVfyPOFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9bZH4guRcCV2eCzS/FEyIZmDcelET7kJrHt7c4OFPg9Ath6cHqM0BUhuw7KXnvSBh6MFdV6PCdgNtLtlRoRZIf2MkB+wQNLxijNedwEResJwhUPTFfi4nTolCphk5CMIgxcnDIfOPZH/YsI//kmdFrBA7ninSd1T3EYi6a4EOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMsYIeeb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fadfb256so270845e87.2
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747769432; x=1748374232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3p0VWyDXbjKjlLoZSFw2DHo0Iai22UkFrPhJcqj/s=;
        b=nMsYIeeblcIh1Ony7Af43AZXWN6eYaHh5VwH3oLBkQE+/DK/4l8STejhdEvja6AeL9
         HWP9vPQG/6JWMuK5+1tL6JngchNJcDZMtXCN6/OnRKK+NHbUTr3E9b3csIA038npQX6k
         g2NK3c2YuZAmB4zCSC5hwJT0SB4Utl1EV32/im33TRGIBjXGzPv4aaMV+bSiPU0Y1HPr
         AjVW9vT57Z7H6KgELx2bp0HqFJtQ0/fM1CmIceOpnWmZlcvszOCgxXjMynQmiasz/II3
         hi/cAyXLi5DsSrnoLvV9c6hbhqp8Nmq85cnt6au7RkVz0rtQU/UJdHzEj+9d0lZJdXH2
         ksVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769432; x=1748374232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3p0VWyDXbjKjlLoZSFw2DHo0Iai22UkFrPhJcqj/s=;
        b=ooaZVyXixty/AC1Gc8fc8GrlLdlK8ZYbCjTAaa6i2EuSc/LW0WP+6RQtK0jowCLgP0
         G4Grcjy5ZxDRvH7IxL5bOLDG7U83hglZAgheymPKKr8rkicOGSnI2ayBwdsdAZ+WRzQj
         D7mvXTBxIMszgeA+hfD//bojQv7WR4CI0G1dp++lsBxs3uqBvpkL4L8PCOswpCPQhaeo
         GD67mUDM9iQR3UKFXG8vjEGtf+V+phcD6w2BAiRPrCBwQ5/00m84Fu3+PRX5gDqsB0fH
         AtCUW4Z1kV2JFHPCPs3GkloOYqfkbLHWDgHxxj26/rrL+wHqRoLXxQr87CtNYSVBAC43
         zQpA==
X-Forwarded-Encrypted: i=1; AJvYcCXr+QxXg9q5Q/cjS2/GJ2DwJdVmjkihzlugXesddPgYqb9anCGofHDP5F6gHiCn3CDyoPb1GTPPak4vCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QOzRgCBO1zLqNpO/sfyD6LZPZ11r225sMvIq7WdkpEMIjfhn
	kDwUYWfZlIz4Uv3u9uMCuBBPnBOSD+JDZcL/UFg30y5PXdr1i6sgBmh4gStqdOfCBmw=
X-Gm-Gg: ASbGncvnTX0Pn8/PDK3yFcrvpd5i7JrVUANsXbcqmnMqNdhPSlL9R/qalPQTMsC44yv
	q6exKXGReTLZNaZUUyxXmGJYdoJ6KHD/I+TDYfwA2Nb8y0v/AQMhKJuFKvYKCjk3In8Wh0c1g14
	xIr/92eYth0y+eL2UXcMcOS1F+G+jM1186nkeREEVyB4wBE95UCXV0748Hmrfa/olGk+1LbYbnq
	J+/jpQzEuQi7ah1Ju8fjpP0xoUT7YlWz1YIFCRFDoIWWv6HYOcdkHUPLUFvQwQcQs0jpFFMXZPE
	FgD3jpkeQ0a0cCjzfzEjJwgeRrgCb0Nq6qDqOAbIaw5u1uJ+ia8zCV92cOk5ppXriBX8zHWhTpr
	WqYjJb7DyhG5rKc581GBFORrxNTqKHQ==
X-Google-Smtp-Source: AGHT+IF36LoL0W1B2tdbhvaX+VoqQRr0ZxEehxaTQy+98wAF5xfwJrfsSoWGXqZoOmJCEe1+CmJLiQ==
X-Received: by 2002:a05:6512:b9b:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-550e71cfd72mr1915127e87.7.1747769432371;
        Tue, 20 May 2025 12:30:32 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dba0sm2442502e87.199.2025.05.20.12.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:30:32 -0700 (PDT)
Message-ID: <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
Date: Tue, 20 May 2025 22:30:30 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 5/20/25 21:39, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
>   arch/arm64/boot/dts/qcom/msm8939.dtsi        | 152 +++++++++++++++++++++++++++

Please split SoC specific changes from the board specific ones into
separate patches.

>   2 files changed, 156 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> @@ -11,6 +11,10 @@
>   #include "msm8939.dtsi"
>   #include "pm8916.dtsi"
>   
> +&camss {
> +	vdda-supply = <&pm8916_l2>;
> +};
> +

What is the benefit of enabling CAMSS on a board without any sensors
connected to the SoC? Likely the board specific change has to be removed.

--
Best wishes,
Vladimir

