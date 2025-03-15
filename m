Return-Path: <linux-media+bounces-28291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B01A62DD5
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885393BA302
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E0C202C45;
	Sat, 15 Mar 2025 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hgx++xQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EFB1F8BAC
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742047504; cv=none; b=nGRbtOxMmcvCtCI85gQdCi5etlZlzSq2TSNmMxnXCz6rEdQA+Ac+VPsVO0wpQPKynzXGavOlrmxwT74bP2gLQfbJYE37cER2FS5mLhypGvtSHiG4USK9l+TkTn7rgYHhhQeJ/10WC324p3Z9dZAJHxKjwZG4/C6y1HhNBxsoawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742047504; c=relaxed/simple;
	bh=YfnsnyLlpurE1a++zCcgvEc6AWvYcBKTlVAoyEBchJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoH+e47hPuNtjtZRgT3tL0PQnfPngmgWja0I68AmtgJFzzafdmB4u8+hNUH3JOCckQzTSZs0wCUdNaoScPm6zLhVMJ36BzuTU6e+ca7eVh+SB0waM1CNqKVBBeMxRAUmCcYMacp3Dx9QA1C0yVxqGCSQQ4bzHQHMe8z1Ttenlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hgx++xQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FAcQtD024984
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUAncCVozCVnivHbsq+9DBQDI1K0/A8x8y1E+4sWtHU=; b=Hgx++xQL8Di2wary
	8uMa2bK6aDp58xjjYHyFnzRsi08SDWn1E26qtnnzdRcrHyzBmPU/NAK2hmgeW2JD
	6vWmu3oKSQEEH1YJlwWA7Ja0pwHk1laVYs/3SK9LCOA3ziEVSPZWVX1EEMBe/vY7
	AJDtnCKYIYojLs3w5Pf9Dw86MJ91/kWHaK/yqXGTfIIlWf0RfYC0SAjIu37xlNhZ
	psR7FartVqZtzV0pxQ8qlyJMVKlEpYeGUtE1g2LkLUE3setUYv9tfDTUqqkI7Xnf
	F9WJy9lHT30QKX+QssXQL+2G6mv2bS/kMSpRoOCM9LHBWyi2EJSOwIvwkdTCp55f
	5zVBfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r10s2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:05:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso36864685a.2
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 07:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742047501; x=1742652301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUAncCVozCVnivHbsq+9DBQDI1K0/A8x8y1E+4sWtHU=;
        b=VcYNYp3RPIB+d/fnzRopfiYCeqKMuLD/spJzPn9ftt1YwTrsShXN+evd8kRmtRv1VX
         HvyYUbufp3IchuiJdT/A3T4JdG78JljupgmuxextYXmkvDZDqmfL94AgsXuKprTHTnOj
         5D1sQn6N9f6DemUlV7IgP363usaaG9a3b5pB3kdfyF5lJCUCvFVIAzarU7vd3yEDeylW
         5j9sNF2MfXEg94eFzzEuyPM9xsE1RtNqjGLZEWtk4WdRXkJrTyFH0mp+nx9wPC3EdbEO
         MVXzeINypWmroIT8o1ekuJUOXRee9dTQI88aegTI+gz/9OBybei9LZOk/0WFCGvFuEI9
         L2KA==
X-Forwarded-Encrypted: i=1; AJvYcCXFf5QAxBRVusiTM/LILMsxFfVg5/8I3jKG+tE7Pn02vofEKfLwQnC2C7qClq6/6Zj9674CpaOZEnBfVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbGoOYSlUBT/BC/LByo9yVILUdMUmPejYFirj4FM/K9NNSl6jX
	sKb4gcwXvhkxS9CcKN6R+LIyb+gYOwTci6kgxE4f4lZJj4+dEF6/WLOerPSVxaqvydy8zgk6Fj6
	miv/4ymrtLuB4d6VynHGnGEgqJkH6hmWKnTpV7Inp/3PH1/5Sw+28HQ5PP5Vvgg==
X-Gm-Gg: ASbGnctKFNcWp6r/sBUadtGLvT+H2pm0Uvua7+jv+dgGFNNUZeJQUPQEGFomaj4ZBRv
	WbZV9M+mcZjL9l8npmTQp0kyS45jkgoLzPrnFcK+wNJvi8dCbkZHVkcVTQhqvLuBlPWEhSYlcLU
	tSLQ/pxEKilyHXmP8d7Ru269o2MGU10JIW4rxcdSX5vh+slgGuo3pLNPXsjMcTl4c212EeJ1mug
	p587hw2O1KIpSNXvsB5khZ/qgdcOVYb4Br9E/55WFCzW8AxOjyHkVqa1SNpUz1grpAv8b806vgZ
	UzPOW/6qCWDXc0j4+g9XOfBxEF9jkgIUFaB8RcV87262NIM6Fnq/jmQMuXwSSBqhGeF+CA==
X-Received: by 2002:a05:620a:2416:b0:7c0:c024:d5 with SMTP id af79cd13be357-7c57c80ef86mr336345085a.8.1742047501238;
        Sat, 15 Mar 2025 07:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTRd1Ia2aDyV8PsrPTlCP6muG2Qdkuvkpuw2KdrP05cGmco0YbeElKaqwrAOB48+digijbtA==
X-Received: by 2002:a05:620a:2416:b0:7c0:c024:d5 with SMTP id af79cd13be357-7c57c80ef86mr336343185a.8.1742047500879;
        Sat, 15 Mar 2025 07:05:00 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea756sm9418031fa.35.2025.03.15.07.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 07:05:00 -0700 (PDT)
Message-ID: <6a652ced-1226-4ff3-8b26-9fb78b075ce2@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 15:04:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
 <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d5890e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=L28Ds1LcoDUPICagkq0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gzblU1jOWaTWLcZ72t0BH6KiVVmmG7Yq
X-Proofpoint-ORIG-GUID: gzblU1jOWaTWLcZ72t0BH6KiVVmmG7Yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150100

On 3/15/25 2:43 PM, Konrad Dybcio wrote:
> On 3/11/25 1:03 PM, Vikash Garodia wrote:
>> Video node enables video on Qualcomm SA8775P platform.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>  		};
>>  
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,sa8775p-iris";
>> +
>> +			reg = <0 0x0aa00000 0 0xf0000>;
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd SA8775P_MXC>,
>> +					<&rpmhpd SA8775P_MMCX>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mx",
>> +					     "mmcx";
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core";
>> +
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
> 
> This path should use QCOM_ICC_TAG_ACTIVE_ONLY on both endpoints

Please also align the &s

Konrad

