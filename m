Return-Path: <linux-media+bounces-39524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5BB21FF5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9949F3AAA00
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D092DFA27;
	Tue, 12 Aug 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MDEgMQIX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435A21D3F5;
	Tue, 12 Aug 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985250; cv=none; b=RkAL7QaLSwBYTR4WO33eFY/5guLRTg3AswkvlvPSR/hnoIlpFkJrooqHVVb/qCqqwuynu/3AGze/9Vkgch7zK+ksJStOdXEK6ozFnU0LS/pzV6OE9s8WYaltRFa+tpsYFrhwlNIX3QJC3tD0kyT9xJ1+gJnflbYqMRyX8rRrb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985250; c=relaxed/simple;
	bh=5ZJNrOvG62+G8wSEDV8YHrlOfH8zuqLSvFO3q8Tc9cc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=tNYDXQI08jtGp06+O4FgX/whMj7QCxkh0IUx4SWVwcROEBB+X/YfAD5QKiVjST2VS3W/ebtKllSOCrjwEOYdDoOfJtxcf/K9AyHvjdJGkgsamAW7mMm2vDJgjQtd5493Oewf2k+UjUEHdIJPSFYeP5rHyIbCfmg/eNjW0Ptc2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MDEgMQIX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C51fQl019036;
	Tue, 12 Aug 2025 07:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6yEFOFYSfqfaUAowNl7o6t+7yRibP2E7iMvJ1yRlAlk=; b=MDEgMQIXGAJFuNRE
	UAg33puKwfRW5rFRLsGfjSQNe/S9fH22+hFoOLe2Ca7usnooiWLlXmo/dO+od5/X
	PexBxK7pGf1J+MlxO+FMCFft6XKJnR7lgAQqLQzOywpiMQjkXBhkT00LXBYwI0Le
	lwPP7hc2TUfk0V/54pGAHGax2kWITzB3hKXY1nIeCnWctWQZJj3B+of1j2/xDHnp
	o2TADwV4LUXrGqKPgdQu9WFbsTX7inFR4SBLzbyERO3B7MQ8zKcuvy0PB+jE+ZWK
	18qJF3kF7bEp6qTV/oYG7ORjPE+KT9w3RZca2I3PA2nNdisgqc5BZwyNYcr8P44u
	hWKhPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduy9ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:54:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C7rxIU013582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:53:59 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 00:53:54 -0700
Message-ID: <c009fe77-8590-c467-a0a4-76bd6ec7cba4@quicinc.com>
Date: Tue, 12 Aug 2025 13:22:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v2 0/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689af318 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=uiWDzxgDrFXmigHyhEwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: k7B3iSPthe_nVLpKtyYgpsK-U7SwKcFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXwQ+5Roh/mKzL
 /nok21L+tDwrMVKM16s10U6uJ11v/ug9U9C8Hfcki7iGVrmv/6w37lML7AXf27DSTiiSIKbGa+A
 0BK0QbgnHoRklMUlnrtusZ+W/hdjSS/YLspfIGyBFJRYQjO3+Urya/PP2c8NO9DxqdgC+H1wiOC
 klGoQ9VeVrxPH1vhkAxBgkU0gxIaRxl6BWkNmOdWRyA7h3BmLsCdDBa9D2dn8rL/znQPpkw+9ZX
 adtE4rTEXpegGYIWMRediYqwieVRiylWiCMn2OPcDIAKu2apSPyrziwclXJ3ufduI0mBWeX8Psz
 y5o5GGme9UA7BRlY8FSo4p0givbHAFNWIHFLzenBmIIdgRXUNFCaGSWSUeZdKKAjv39oEBuv8vV
 Ptlpu0Yb
X-Proofpoint-GUID: k7B3iSPthe_nVLpKtyYgpsK-U7SwKcFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Unify power-off sequence with SM8650 and re-use existing callbacks.
> - Drop incorrect WRAPPER_CORE_POWER_CONTROL and unused
>   controller_resets.
> - Rename FW to qcom/vpu/vpu35_p4.mbn.
> - DT binding: correct typo + Rb tag.
> - Link to v1: https://lore.kernel.org/r/20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org
> 
> Firmware:
> =========
> Mot yet released, AFAIK. Will be hopefully released later by Qualcomm.

Its released here:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom?id=530f283206034b20ed791ef379f4394ca21fe63d

> 
> DTS for reference was posted here:
> https://lore.kernel.org/all/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org/
> 
> Description:
> ============
> Add support for SM8750 Iris codec with major differences against
> previous generation SM8650.
> 
> DTS will follow up separately (depends on other DTS patches so cannot be
> merged as is).
> 
> v4l2-compliance report:
> 
> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38
> 

Thank you for running the v4l2 compliance tests with your patches. While
these tests are helpful for verifying API compliance, they do not cover the
actual functional aspects of the new SOC support being added.

Please run a decoder use-case using either v4l2-ctl or GStreamer (GST) and
add the results in this cover letter.

Thanks,
Dikshita

