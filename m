Return-Path: <linux-media+bounces-3457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB2829840
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 12:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09A72884AB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 11:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706DC45BF9;
	Wed, 10 Jan 2024 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eY4JI/qZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75D41746
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ccbbb5eb77so46512901fa.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 03:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704884603; x=1705489403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZC+BfL7VBFT+MXOIUs1PXUDcw++a29sikma7cyA3NA=;
        b=eY4JI/qZTahJ4DvULw0zdcJWObw9N92p3webg9fQvPH3MZq3U6XGheFhmr8PHg7PYd
         kMF56VgVoyoyUvsJECdY+FtNi0Zsx5gNyRqHd/YRTp6RDtTTT4HAlrlEZ5gnnqWNZIYx
         +R4wb3HZZ4TUK4RQHRzG44T/4U0PzW92k13CIUCrP1tTwuFury23LGo0L4twjABnb0/R
         D1ccHMQlPBpDtX7KCI0BwhDbZ+XsUtPojaJeR4zSTEy8XNwuwoB44gunIWHs43dooOXd
         gjX3ZI46f9x3fnc1PMoKhH1//u4IvJRZmU8+5mXzLCHBdRG6La5sZuzqcxOChY1z9q0E
         rEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704884603; x=1705489403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZC+BfL7VBFT+MXOIUs1PXUDcw++a29sikma7cyA3NA=;
        b=ZBnoMWM82W9M54Cr8cBgnrtsBG0z4hDQrOuCTiKrmi/WRELwGyx7tdR1qGzLcLASwx
         LG1MBEPF6Sxa7qRxP0dfFIswqj/Oa3LZPoQHbj/dWHFQMNMy0hr/Q4idbS5jelxl+GmA
         mQWYOuzWt2PjiKs6iqQWuowJwNnWCBwde3y8BozDHQaTdc+2KSX4RDJtl7G0muWT3Mla
         sUWzd76TQYlqKY8R9G2nzhzUKWUozTcMrk4SEdaJ/ek+GoeKjtYaZip8q6hgfPCHeGDN
         evhsC8G7tLd1532wOCPBKPmsEIcuczP+pbEqrQIL2kjdr9IveShu0fhbQr4Ie5O1Vi5k
         fgPg==
X-Gm-Message-State: AOJu0YxsBi4xjh9MwLFl16PmJl215MjWs7AwY1hM11DzvO8wHc8dMYzZ
	759ba/Et9E2HSYUeAt3zWGNYaAJqff2P+w==
X-Google-Smtp-Source: AGHT+IGd/bK2tTxR9PLQGzJbqy7pmb0WxHSefwbKRyb0ZJAHgelmtphi0KReJX4MC04C8QBPA8TDPQ==
X-Received: by 2002:a05:651c:623:b0:2cd:23ed:19dc with SMTP id k35-20020a05651c062300b002cd23ed19dcmr409303lje.39.1704884603341;
        Wed, 10 Jan 2024 03:03:23 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m7-20020a2ea587000000b002ccd2d688d8sm698861ljp.107.2024.01.10.03.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:03:23 -0800 (PST)
Message-ID: <4f8aafa2-2145-4090-afba-8a26242d5ac3@linaro.org>
Date: Wed, 10 Jan 2024 12:03:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc8280xp: camss: Add CCI
 definitions
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-0-b8e3a74a6e6a@linaro.org>
 <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-3-b8e3a74a6e6a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-3-b8e3a74a6e6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/24 17:06, Bryan O'Donoghue wrote:
> sc8280xp has four Camera Control Interface (CCI) blocks which pinout to
> two I2C master controllers for each CCI.
> 
> The CCI I2C pins are not muxed so we define them in the dtsi.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 307 +++++++++++++++++++++++++++++++++
>   1 file changed, 307 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index febf28356ff8..f48dfa5e5f36 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3451,6 +3451,169 @@ usb_1_role_switch: endpoint {
>   			};
>   		};
>   
> +		cci0: cci@ac4a000 {
> +			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac4a000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAMCC_CPAS_AHB_CLK>,
> +				 <&camcc CAMCC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci0_default>;
> +			pinctrl-1 = <&cci0_sleep>;
> +
property-names goes below property-n, just like with clocks 10 lines
above :/

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

