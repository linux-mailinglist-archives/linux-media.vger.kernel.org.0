Return-Path: <linux-media+bounces-22384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D59DF083
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 14:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F840161C61
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 13:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967021494B3;
	Sat, 30 Nov 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkJXOAUp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E80149E16
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732973698; cv=none; b=Kwinq8Pn/ZAkx2bQcluP0JvjH6+iiqiIC8KnLE+D6K+fDptb4ALlIzh9sFrbJP/wzFF6gIgog7v1RluodLHt8YcxKmV0bTx6TZqJz07OVZ4RGMsjyh2JTa3+sIXUmQN4doGoybvWKlus2MejYou5vodIUYPvh8hEla7cKHT4n2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732973698; c=relaxed/simple;
	bh=Usr4LZHuY36YIyHUlhmC56voNmbZ83rVw7kX6gPo2gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2IxmRp6YgXSfrOjNDKSkyX6OFCISpS2hTIW/BdZ5KjxOgAgDWbZKv7ZhYmNo9kE0cdi0BHU5SnqfZnRFmnmjQElMTPyGneKFSuigeG3xiBGQX/mlH+UrFO8HSLB4laLC5iaTCeO60+6Yg2X2QOumvpAtnQFN9T2T9uOPurTNR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkJXOAUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU9pMwD001755
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 13:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2VLO7yzmzpBOk/kD1jBsRCrAVGZQXpmF5LywqF4XOk=; b=JkJXOAUprXDAvALa
	pcOXfUSsdRAJ5RPVymR/Z7u1xHQWZvJq73naqbEg8NpRg+g/kOl/nHTLArcyxgO+
	cgke9hQq98WCxRgWiSWww5UCk/J9Cg9agYMyYspHLthIa1NMSRGKozqXCNBg3Xey
	Ugn6HKUFtTeDrAZIfC+1zNMs/jgWE6wsznQZ7ne/hCQ6LiYjFmhewc5fYk6ca8h+
	CFaVNgFd1hJg692/X+Vn1+VO14WnD2M1kcXjTNqvWCWuZGaHNYr6hGIVc891kDF9
	EottyI5sXlTvD298+OQmWpT9r+Q+SysZLbuJObvGb8VxN8Qq3zByhWxC38Ekyn70
	EYoZaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2rt7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 13:34:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46692fb862bso3524301cf.1
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 05:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732973695; x=1733578495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2VLO7yzmzpBOk/kD1jBsRCrAVGZQXpmF5LywqF4XOk=;
        b=OGdSDjQjviDIkjuPCX/Y6NPCL1tqOdBW7cGiKN7K1v5coKEvIkOVRdjcFxJwhI/JkS
         OCIintiMfbHftPw/q8ggIqD3gUv4djKufwk6yIQ+dQgzvgd5wat2Q6TrzT17DQ+wQCzl
         ujUc1aJhllb2CsDt32t1/ss9TVosvXS/0Sb8p5yzBdMAN5/oPvhE+PVyEroKYJNjS002
         xFfcLs2As3YD40FZQe3kB6JLgh/8W1LoEyUu0M9k+8WgXBEsPJG7T1DlnGZAcpQYW2H7
         rIeUENuXBQg2Y30ihQy13CH2HOY9RIi4viVKI0filfWDMB2soWXgbI2rTJGEwKWFySTg
         fmIg==
X-Gm-Message-State: AOJu0YwqhIoVUScJW6dzq2fwYjbxJwzSIq5/kzw1oFIg7AKY5Y9WwXGQ
	j80qabFM+Z7ZzL6/SvGrzl1SIaMJ0i85M64qvfwQdGMc/rd9g1Gc7h8IUDuqp5Y4J8FFndm3L1G
	aYtzNtKIgpnDvb8qXPiCIZZaj4xlJW/GHobKsfLVlYILPBDbGNGJXh1mUwaVHHA==
X-Gm-Gg: ASbGncvuHsh0AG73l6m8vvAvD4MU8kGelk7ItIEiMxWkg4ixt37GEp5MPsBvGEc9vRR
	T5U+oJEFNY0DbdQhVZlzGJnsGTJjCQsuKv3vqbvA8S0hdny+Ao99ZP62Keg7vqGMFW3lyhyHHBp
	hV4gnKnUShWtxlJQ872EnJg88qNwBNdupfCcVKiBgb8xwbmxDjzhpSFQ4ABKSUeiFyOeJ23Itb/
	mI6O+mnULdCBdqGlTRv7mwHpn1ggAJs40yQQaWLuA3b5sp+whTZDab6ORL9/r4J25klzfiw8M52
	fxEA3IFTJTk8ya06YZVVaPKGYGK6i7c=
X-Received: by 2002:a05:622a:5cf:b0:463:16ee:bd7 with SMTP id d75a77b69052e-466b357ee1amr92420771cf.9.1732973694660;
        Sat, 30 Nov 2024 05:34:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkRA/kQnxX8r0wEF6WBiAAJPb1xtL3Uef0kpFMGTVXF0cYbIVZY1PdQhdGQgKvLe+UgQ4tFg==
X-Received: by 2002:a05:622a:5cf:b0:463:16ee:bd7 with SMTP id d75a77b69052e-466b357ee1amr92420501cf.9.1732973694301;
        Sat, 30 Nov 2024 05:34:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e771csm285187766b.127.2024.11.30.05.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 05:34:53 -0800 (PST)
Message-ID: <1f1fa37a-a6b3-45e5-b1cb-66abf0f5430b@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 14:34:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add venus node for the qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-3-5a376b97a68e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-3-5a376b97a68e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EU4TdWzeL7qzdOfjDr6yuaSnU1vG9tOd
X-Proofpoint-GUID: EU4TdWzeL7qzdOfjDr6yuaSnU1vG9tOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300111

On 25.11.2024 6:34 AM, Renjiang Han wrote:
> Add venus node into devicetree for the qcs615 video.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 06deb5c499fe83f0eb20d7957ca14948de7aab34..18ad4da5ed194458aded424560f45a3a9f3163dc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -394,6 +394,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		pil_video_mem: pil-video@93400000 {
> +			reg = <0x0 0x93400000 0x0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -530,6 +535,87 @@ gem_noc: interconnect@9680000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,qcs615-venus";
> +			reg = <0x0 0xaa00000 0x0 0x100000>;

Please pad the address part to 8 hex digits with leading zeroes

> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "vcodec0_core",
> +				      "vcodec0_bus";
> +
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx";
> +
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 0

QCOM_ICC_TAG_ALWAYS

> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_VENUS_CFG 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

Konrad

