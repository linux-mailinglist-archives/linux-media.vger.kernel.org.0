Return-Path: <linux-media+bounces-47156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75686C5F819
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 23:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 16AED35E474
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F7A31C56D;
	Fri, 14 Nov 2025 22:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwhIA2Cb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvWM+nmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F412FCC10
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158782; cv=none; b=dGqrd8fzzp7m3ZTVeMO71PXrBBf61bG4G4p7SNyDz8LtG204oT6zE2BRQzJE5YfDrLKjzxRDLQT7y4SD7tESwjMp5s+tWLPIk98DeLpIutuZEjcwlVQEMjCpmEdFyGbINc3WQN4tmDBTOWFJFnyyNL42p1jIZ0gS+y2iKIH49qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158782; c=relaxed/simple;
	bh=2tVmh/m4Oh5kSRKpTxbSZMwljl4RjgLGV4CD3IiSlms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbJfZpfAo4pz5yuCntMVS1lnLpWldJjzLxm3ylYTcHLpP572K99kLcju6P8buMCJuo8auHkBPBUfGrS3CKfEjmP5BWfzwdYA++luxfwX79CIMIwzf2NEmDjylHycj2ghAShWhA0OWoepFRPP2JdKXDptQDC7tuyLU3jKKFTTM0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwhIA2Cb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvWM+nmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEJLx664150742
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=; b=IwhIA2CbmGxDzYND
	Gu462zOvplCcRiD5OK5QyYSXpzBON4wjWozEORmY5Yv3WpwDPmTzm6RWSob9b5Dp
	s3lusEoIAy65bY6jNWvgsKP490hvOpgPba2Hf1j+kIbX8dFX9GGlxXv87pa+LnpF
	+Uxh33KXuI057UF3pi2odbRKRUzgelROvNzMLMDx1/3Q5fVdM+khidhtN/bx0p6G
	54plcKsCKBX+XDU1K4JbH2YWdamAdl5JozIk7aJFxIEE1h+FEapaWrPF7qkSVrNN
	oRTgfb4w69f8yzQO8+4MZcak1+gZa83jZWcwEK0Hf6BycLREv1TgACwqu6ZZoz32
	olCGgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeagyre2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:19:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso9151391cf.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 14:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158779; x=1763763579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=;
        b=AvWM+nmITBy0f7SKOFesBQvhotN/+/4TsChs6XpVkU4s2DFnD3o9goBcXEF9OpLCPz
         F5zFGkFHPe+YXznzHsRwlLL93VF10nSB2Cak9DTfTo2NvB1TJlLh6uodJ/YY9DX7LBBT
         ++SnAruhx5utL6X61vHTfkGvuKPbuYH1M2t35CTYZhq8DX7vsEUKoZL/p2o2GAWtOkbQ
         sKaH+UqxsnMn+uQRuDOrKecHs80fni5b6MSP8WX5ETQQbgSfU1lStsFQ2ZOf5WbUGqZe
         4S1rm28YLcl/JCmeerrUM9kkx7W0CWFmGo8Afc23YVlu7VzMMmNIAZBEGizDQemjX72F
         susA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158779; x=1763763579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=;
        b=HaGpJvi4/bjvQt4+mTNysmjoQS//aA4p2nvyKJNvAXLdoiCAgqyjuqtmWtUtdt/rPM
         WpLVYxd8ACEjE5+iT2upzTy0aqcIEwHE6izJahjXe899H8PeQ758HnyQrGZ6PeASduZL
         99pLjddCHDuwxYTXFQXqdR+OKrksE+ZY0x6+3CRi1H5jSA7yukgTUUXsdpYAFbZTejYi
         tal9dcO/Atk9nt6oSzz67xancuEP+0L5xhwMoy5lGxqbiFTAXsY59GPFVl+g2r3VirrZ
         AVUZfur7H/Xo02cN2ZDKaOjkjH2kjFsALyGmfZMO/QbLK/xDUC1Y3DmXYFmiNLEAhIJV
         1j6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV98IXTe9ITxi90gD3v3NcwHhkwT6Cr72uyx/tZgmphWwApapOfkuWVobr2CLMrYwpT8gPIvgJqQ9uf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIUxms+EDV+nJZbolwmj4ct6HGGXbzEiqyUImALiVbQOxGB+5
	XSA0GfInbXzRtCr+Azv4ZLpWzJaQvVWYeCzJTrDlTM5Q+QjgxLoXcS09lQQPQPjLFJ3v4ZQiEpw
	rhZJhzeCLL0xBm/VaD8fE8QUUSRL5eauldOAattau1YDAmoY6vDQ+q4ch3nH5I9ksnA==
X-Gm-Gg: ASbGnctIhjrp1rp0xQ/cfAbz28Wo99I+H5SwBV3f1a0rPC48OnqATPfPE9KoVb/gCI3
	wNfuCUEswYu3oDn7azHXfIcq3hbhpflqoZdmVBVuUB7OEfNJ7zFzStho8cRdYPlXGHhFWmkbu8d
	39wCxRv+Z3VL97vPDopbDzubKxdt3snTolxBjKQo3avxE0SuZzeqUhyQ/BByL9RDKn/GEixc3bo
	WRVK+ZSRy6gLfggWUEQ+dvtc7priGUBdYCBIH0bAWHlZTyiNtjxF7APBpcAfZDvAq/Oj7+DOxnu
	jjK+XAkmEI4YU5lmv//Ci/k2Ku5T/5/MBjdBEfzJxLFipK8lEhALRwoTddP5+ytn9TKQSPxPalL
	a3qFm+2vdAwcmeZ5VLyVn5iCXjCl1w88YAuOq/YuTWDKzI8utm4rOElFc
X-Received: by 2002:ac8:7f87:0:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4edf3441d01mr39997301cf.0.1763158779364;
        Fri, 14 Nov 2025 14:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjbG+BUiaIkkQZyS73j/X+Rt+OSfewkVEELl3ZfmiAtanj7Nkpm9CmHByNJrV/E1aDIWckHg==
X-Received: by 2002:ac8:7f87:0:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4edf3441d01mr39997011cf.0.1763158778906;
        Fri, 14 Nov 2025 14:19:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac68dsm470137366b.62.2025.11.14.14.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:19:38 -0800 (PST)
Message-ID: <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:19:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nihalkum@quicinc.com, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114064541.446276-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _PKVOvBTSW95QsAXc6jrxCFjwmzfVIPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MiBTYWx0ZWRfX0Z0LKXrdSbUc
 kOotoLLkiJrpuIKScIDe9x1uETdhUUFxzUhB03EjdBiN2/t+ytMv/eSCiC5n4XXkIHa9HKRI26x
 MMjjPMYax8wTHUUbw9Gd+tmCbUzoyDksclhs5qdfxLI/GxnU2ONK7tx8CcasSp6slolgIlzfxFB
 AURim2c2JNyGsV9NPNWrl7A/czndsfz7E9U/9ZJYBsyqKLD3mYKFwIwHnmeczc2iW/YZDxItHDq
 nTPLkwNHhHVVavjBWhVNQVDDr8oY5Pp/BehIy+YVKGbodP2FSRQU7aAaAL/viPQpdqSTayywzW4
 HhnIDRAE9gU2g2xvmO3ukKUZumzDmYu3ZktPqucte/WX4W/f242tZmgPymJOTqPqVxQM5Wk+S4o
 So27Ae0HDH1X5ziwT5WXrZAlUiytaQ==
X-Proofpoint-GUID: _PKVOvBTSW95QsAXc6jrxCFjwmzfVIPy
X-Authority-Analysis: v=2.4 cv=Go1PO01C c=1 sm=1 tr=0 ts=6917aafc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=xh7zYxaUke6ZEiU0VLUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140182

On 11/14/25 7:45 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.

[...]

> +&{/} {
> +	vreg_cam1_2p8: vreg-cam1-2p8 {

Where does this regulator lie physically? Is its presence dependent
on the connection of the sensor, is it part of the EVK carrier board,
or perhaps something else?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;

property-n
property-names

please

[...]

> +&tlmm {
> +	/*
> +	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
> +	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
> +	 * So, here it's MCLK1 pin for instance.
> +	 */

I don't really see the value in these comments..

Vladimir requested you to move the 'description' (meaning the node
describing the hardware, not a comment explaining the function of the
DT hunk in natural language) to monaco.dtsi too

Konrad

