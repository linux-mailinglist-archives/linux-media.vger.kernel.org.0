Return-Path: <linux-media+bounces-50064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B669CFA908
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 20:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 931F43188161
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 18:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE334347BCB;
	Tue,  6 Jan 2026 18:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKKYMF1b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvTuEJOB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95386346768
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724080; cv=none; b=iA6fSKzDh1ZvKcDq8Y0CSBTari5vtRcuv1PAKtNtesfVGeQNHFKpVgPcgCEHZmmORAO8ldMUvMzTqeKHlu0sZMTNiQ5+aq2IQkKp87EzDvM8hOSqrSlXUT3sHlXZbhKWicDIg+hhaRG7WzTjmu8L4nUNjL2kOm7OwKqDk+OVm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724080; c=relaxed/simple;
	bh=hevyR2v5UnvB3P1hEItKYkWCuAwttD5s0/yqjxNhfi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtyzjABVsCL6PNQLolZ2Eob/NpvnKeYTQBAy8q/Jd5LYV8DwRL+2lZ6cmkaI+PEJVMGKrsVPnTdOS31w+Z24QAVGjShg9Y38X1c82GdaXGjS76nCAH4IE5n13dv7ea8kOgsJuS6sVwIt3t6eDOHjrjLxFNVmZqdTqm3U2XJaY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKKYMF1b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvTuEJOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Gik6W4137369
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 18:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zbq27qXc2G+YUG9Eao1aPz+j
	rHm7MvW1CZEwhgSHi7I=; b=UKKYMF1baR+GgszvcS/NaOHiu9HShC/B0c7Flz8Q
	UBGk8OabmyAlD7L2l/t30Ublwiadtdnw3lwK1l17BFCeIaoNmj9JuioEqSb9jKGe
	QMl5O/YE3SeID4n64Tc6TYFcVEQu0UIfPjU0u+4sQF9leEjMyKN8jN3WokeJt6PH
	jJmh62mCGjy5+j4LEcE3iFWC/zxdq6WY73mDaButx4I7VQODvKhRiGdvGxZEK3DZ
	MvpJR2Ugw36HWkObBMWS4d291F3mAtFZUiFEfKwhZxa/5MiYQjASfeNZpStzoKFx
	D4LvhF84xpQQOODcOGuy2u7b69T41FG7iKb8RsWeG2bjMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e0anb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 18:27:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee16731ceaso26954841cf.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724072; x=1768328872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbq27qXc2G+YUG9Eao1aPz+jrHm7MvW1CZEwhgSHi7I=;
        b=JvTuEJOBpFAuVrymIrDzkcdmKThYu/WqVMeMkQN3c8+PaX+umibJItnR+7vX6fa5/i
         MTY3at60DLiYam40waTtDf4HMIeg8M/FOOWuYUnRqlxvbTOQpWxnwLnR4JmBcfEVktdR
         ErdkZgls4WZsONLAx1kZV8o4d2/qNrazpmeINYA8cGM4F+FGB4CMMBycEn/HaEhg7rON
         FgPpWDSwBVKwUQM3C0PPKD6Xe3oFlDbbGKfA7uioxdUl2jeBXGVbFWTcuO0RCAyhCR1J
         LTavqV3FaZqyGoRpWfrUtraHR8h7pe6EQZdF6ebyA1Dg2OqJ7jsJQe34q4sS2qeuMSB4
         NHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724072; x=1768328872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbq27qXc2G+YUG9Eao1aPz+jrHm7MvW1CZEwhgSHi7I=;
        b=CrJJgBLZIUUsDuv8vnsfX9ntOj2VDbYAgD+4WxprzPJu1Ku9xYsQEpdVOPlx8Al3cP
         JOdmdHEObQvwZJlBlS5iTScN56LHVquGODLpGJD6CpqRwgC2cjrsvtMq40vrCDFvYqeS
         W7cmF5zf7PKHvAe83KZ4orr8epYdA5YqBq+M98HcM/ain8pvKAunt/rE4l0WXtGYQ94I
         usbyDXmIrEPgitA+1fAuSk2UfI3YHOKWsSNf5lAuTPwPviyHpy0Xl2ZUkq3WA8Ay9PED
         rXvcQYsBQSj9DGkCYtSerJcNyM3x8l75oxmAbIaWH6LFxPnSBZWvDXdRwd0Ffb8UjAYn
         1o8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlnyPrwwO1+wkvVtbYPnHFuIAbi7nG9P9lZ0qCipDh0Z3ADGtqnKr2oZRWWzGJIOh8DDaS1tmIVYQlPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jc5bKcrAES8Gb8fv5rceTIGZbEWo9jOnPq99tVq4eKxhol1w
	tX1f9wUdyQHQN2bP1H56C0/5HX2m8LWpAOruHAaeTSHNJVUD6FGjBx6Lq4AoC2LRTznjeKivyE4
	8K5wRwDQA+Xbn7a8Ihf7mpAZESjH6sRVbo/lp46WMTyQJ/KkiShHbi1t+mu0smx2QUg==
X-Gm-Gg: AY/fxX5YCgcXK2Z2CxGuvKn0iA0Y3jAMWdUuBsUAu4Ihn3TpeGHMk84EgUrcwdhEE+5
	ONnVcnOWaUBkhCjtpKKN20B4Q4h2+ueTCfX52Bzm1QF49muzMbusvozL/ClyCmtcOAJdR0JT9Wq
	dEqQOmpcdq7q38uQxutBa/8DnLLD2hDqd4mbgfTpVvYjpjU9kUIxvVE0KChnPiJUI3hjUbOGCcY
	R7HLHfLGBV+m12SaSrEmvOwO2k3Pky9Uhhl7z5ufZQPKvnHnH79LR9LZ7YbH4zcIRX/w6AKxPU4
	XFCWNSSUwfhzMn6k8KK1nC6WkPe7ku/CELB6mzfPxwtnoQLKjuTAIB4qkySXUUutQTfJpc0G4ef
	rFVeIwYYhuBdm/5DjRdoMQCrIMNGl94fp/ny3gGB8SLdgAdVBY7QUQ25PhsKjzAQEf3yyAR+uBN
	wgJFWGlJLweQgpM5qkAZpuUc4=
X-Received: by 2002:a05:622a:1106:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4ffa7808058mr50291651cf.66.1767724072168;
        Tue, 06 Jan 2026 10:27:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpa8t2J+xNbmiBOjOlobvGIsyKnixEwHEuIMtCBrOGb618b9Xf2yvBuMmE8Lwt1egtbEQvqA==
X-Received: by 2002:a05:622a:1106:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4ffa7808058mr50291151cf.66.1767724071584;
        Tue, 06 Jan 2026 10:27:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6cc4d11csm203749e87.74.2026.01.06.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:27:50 -0800 (PST)
Date: Tue, 6 Jan 2026 20:27:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add CCI definitions
Message-ID: <z2co4ligqcydhk5cxzjdi72nuhf2gm36hrf4qae5hb36m7yvbs@sen7esib2k2x>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MCBTYWx0ZWRfXwQYcVcQzgdK3
 HTF5oG9rl0AaRNQtFYLCMoqcXPmindJHjABNGsgSuy9BDHm59BxMfdYkGsxVivvAGCehieydvnK
 BtVUDZW34P/jKoooxA+6CeJqZ/TxnhDZRypgUpDwP/lVuTJJcRFcBZziHTuiGWs9UneGjLXdMXW
 yFVtkv9ROrugtm9UUKJsaWxh9oRsvkXZgLSYTcxMLiHqpoI7Sm7jPwQr4kb2tRfKeCWTSOIy3Kt
 cZMGrwlJPInQcTjz/Sy9GgCIa0leAo2GUMjG+NouzQ+3WCWYDWlJtrwse609WZb/TzQposJjHOD
 CM2RHAf6TixTVnLLGtQgDQI/x+MV7IvxeM96WygSv11R7ujvc6OvcQ7nM9QSq9lMaRMPdz27IV+
 may5AudlQ8Rg51RrPSABKrkBHJ4T0b6lLRlN2wkI24xy8n+mDdTVx/cQ/JLGnlUswpykHK49QnZ
 ZgxhaNfHjplTIiqb+vA==
X-Proofpoint-GUID: pL_AEq17uv3_HlDDkZz6ccxTM0y0MZUx
X-Proofpoint-ORIG-GUID: pL_AEq17uv3_HlDDkZz6ccxTM0y0MZUx
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d542c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Io2tlQXC3H8IfOpeASMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060160

On Tue, Jan 06, 2026 at 05:39:54PM +0800, Wenmeng Liu wrote:
> Qualcomm Talos SoC contains single controller,
> containing 2 I2C hosts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 72 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index e1dfaff9b6bf8641b19a685e74d60ad4e1e99d41..461a39968d928260828993ff3549aa15fd1870df 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1549,6 +1549,42 @@ tlmm: pinctrl@3100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			cci_default: cci0-default-state {
> +				cci_i2c0_default: cci-i2c0-default-pins {

These need to be split, having just one host per state.

> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci_i2c1_default: cci-i2c1-default-pins {
> +					/* SDA, SCL */
> +					pins = "gpio34", "gpio35";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci_sleep: cci-sleep-state {
> +				cci_i2c0_sleep: cci-i2c0-sleep-state {

The same

> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci_i2c1_sleep: cci-i2c1-sleep-state {
> +					/* SDA, SCL */
> +					pins = "gpio34", "gpio35";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>  				pins = "gpio4", "gpio5";
>  				function = "qup0";
> @@ -3785,6 +3821,42 @@ videocc: clock-controller@ab00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
> +
> +			reg = <0x0 0x0ac4a000  0x0 0x4000>;

Extra double space.

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK>;
> +			clock-names = "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci_default>;
> +			pinctrl-1 = <&cci_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		camss: isp@acb3000 {
>  			compatible = "qcom,sm6150-camss";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

