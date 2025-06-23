Return-Path: <linux-media+bounces-35618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C321EAE3DBF
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C62216F1FA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3693223E32B;
	Mon, 23 Jun 2025 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcul20EF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0CAD2C
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677398; cv=none; b=TrV1lTJHleomDK9dPOndaQCKw+GsbkOUP0uFc3xKF85QjC5ZPb7T+MbrwnGwNHp/gPL/hy/8VpTONyInCGZAIzknmreOXWnh4uJ8Ie8HSxBAyT6J130pyAe8EHLE3EGDlhyX2R3IKci0EVG4EyFFok5SP86kzFBirc8/eU/mLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677398; c=relaxed/simple;
	bh=UQwjt7347aONCY5rnhswMRSp+U6chmWKidTflR/+f3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5T98k3cW31sRfKqCHT70GYOW8OW2qXbDefwu53+qH5z1gjkWrxXYGIdlLW9U5tL52YivoY0GIFSb37Vjz6VLn4fmMsLy03W+undlxgjAwF18vJC19VUdiyOaQP/BXHOltKiq9oowwGPhQq0v/n1hokvzCvryDTPzHNgPGTeG3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcul20EF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9OOt6020680
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrDbtpWRMSm/kr1xs/mgSja/sLZX0KXtv6bDiZCQcvc=; b=fcul20EFry0/TD9d
	N4r9fF1lSDPL+PW9xOFzCHfRRYkdQ1KdNNkeH57B3+UI5O7r3Hn05F4KyEJxKSo3
	OAdoJsZy6ytsJbsjfegGix2XLZed4rKrLemdEJVtK6jav88Vobdr+H8pOgCf00h8
	hCHC7PnP7l0lgFt8BR6OVLUcGRrzf5kRR40Iosk2fDpKxMiRS3MrkMHv9DGusk8Z
	aC78oUERbFH8QAjED1FzZh6JfugMSABIPjX5ij9Tgq7if89Os3Zvx+4duzgLpMSR
	h1/h+gLb37Nv+pJ2SIiAAiRh25qioTN28qj6tQ+QM88mM9Bn1FVESEQnGalpmO7R
	tP2k3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7tp99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:16:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so7744936d6.0
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 04:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677394; x=1751282194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrDbtpWRMSm/kr1xs/mgSja/sLZX0KXtv6bDiZCQcvc=;
        b=fct9IRM6MpZCA0lPxpk4zjKi9ybg8+yziolasL3CS1brD7dbbeTmbB+8NG5D02DFLl
         OB74gEr0kyscvEst8SJrvB5ZeGKhFLE/c4lLQ4HSENuztB0oqo/YauqhW6mnXY3pUOdj
         XL4RezQlvjGZLFfdHGxSQ5sZ2lK0KZaV6KhSaVgdxOaflBxEBs5ggHsI8gYw4Rl9p/dF
         19z07gsonbv/NCkUOPGqM9u0b4NLajrh10PwYyZcr+WwqLRQuvisFtjGSfGXE86Rz+lD
         GVekvUdlgQRsiSjqzyl5OSA0EXyWWAnjR+EGwg9K6XEieSxGvaajtDu/er3StclQgI5y
         tTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWgLqvT6y56PI8nj7GVTiBmpzxkr6iMeiKokA7l0sxpY5bevp6b+8piOnjZnBgIIAXLfD7/ooXdfOvDzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6CvDB3M0dU3gBYb5usmZXfTVLv7+t947noc0KQ4JaPjM7JGM
	ioQsU1jLuNj3Clg9c1H+U4USBiqBSCqeLfAqSF+LAf8AcB21GPw6Lg/ieNWGgv5JO8Wi4rlbz87
	UwvpdOJhC4bCxpfX6wMTa16VkpIEe5k+1FB/7PwZd5pzzT8g5sG3ExIunuQHtkt5Z7Q==
X-Gm-Gg: ASbGncs2ezLrOjTJaJhTvW4ZBCerd6apT7LQVfd07dKIkU5A8cCQM7PZJJFELwVrH7J
	vmew2uXP9txqZ3VIqYkdCbLzylQzimoGPw3hb+/mahFYck4iG4iq02akIaGqVBMGmYjqsxqtz/3
	jo6oAWq7e26tkAeu6mIL2L4tLQQk+nvpKbdqphd6PHIVIJZmNRUQt8TYjzNe//qqnqMApD5TdDL
	si/VYypHe7O4fLU45kNtHAG7UuMKQdTwkh2q0oXnM8sOFypE6WZEry71S3bELozFHjMrF5GSv9z
	3faBfL6jav2gd+meOBEEfhN9tcvmKHz9cbou74Gc/eHXfS57/F9ItfMHLjXekxtUJoVNTXEpjAO
	z1fk=
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr750042485a.3.1750677394020;
        Mon, 23 Jun 2025 04:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErRVlQUFFeGPmGZC/8eoEBmktimYrsxF0ZbBHv0b3VKQG26/vaCmd+0yLc9oLeTHm9CKRZsQ==
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr750040085a.3.1750677393639;
        Mon, 23 Jun 2025 04:16:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0c8sm702962866b.64.2025.06.23.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:16:33 -0700 (PDT)
Message-ID: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -62OucSZcbHyy3uPfWstSuI9caDCYdyo
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68593792 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=uB77vd0A16Pi4IlZOKoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NyBTYWx0ZWRfX0uGf8q0Bk/RO
 AdLNYqdYDW2jUsL8zb9HxW4M4eGkMxpM3WdBiH5+7QQzEmLUE1Lxxn/u6HHIIpCx25iyCaVrfJw
 zPq89xYwGh5mKsUIn6e4deoh0eLuFE6LzOEKSZflI+u+DNsReAPE/uEZtwu45e0O63Pkx40q9yM
 okabf7UUszQkLfq0qhxhASNcLTsTk4vauAO8w8shFDPYK5NExP1jn7F7Cbxs+hfUlZnIKnbZXpd
 jgwfHwhhXUzYiFwIXyILnxeDXr1iFCnSFDPvrq47ftMgNeqO1Crf0BaObBYIhTn+D/7EtRe9wAv
 8u443hbEJ/b70TsRh2eBy1wMMgWMC+5j/MPxLQvcfVGg/JQjWBBfPa51cQYZacaDtAMZ+HgBIM4
 wZBAAiQ3NMTqisUZDNcLhzAyCbu519OnaSdH9/9Ai5NAnuXcPxf+upbOXxkE/JO1mNFly/91
X-Proofpoint-GUID: -62OucSZcbHyy3uPfWstSuI9caDCYdyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230067

On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
> Add DT entries for the qcm2290 venus encoder/decoder.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +		venus: video-codec@5a00000 {
> +			compatible = "qcom,qcm2290-venus";
> +			reg = <0 0x5a00000 0 0xff000>;

the size seems to be 0xf0000 instead

> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus", "vcodec0", "cx";

one per line, please, also below

> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,

On other platforms, this clock is consumed by videocc

> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus", "throttle",
> +				      "vcodec0_core", "vcodec0_bus";
> +
> +			memory-region = <&pil_video_mem>;
> +			iommus = <&apps_smmu 0x860 0x0>,
> +				 <&apps_smmu 0x880 0x0>,
> +				 <&apps_smmu 0x861 0x04>,
> +				 <&apps_smmu 0x863 0x0>,
> +				 <&apps_smmu 0x804 0xE0>;

lowercase hex is preferred

> +
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,

for this path: RPM_ALWAYS_TAG> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;

for this one: RPM_ACTIVE_TAG

> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +				opp-133000000 {

please add a newline before the subnode

Konrad

