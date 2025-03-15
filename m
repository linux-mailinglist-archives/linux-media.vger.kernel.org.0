Return-Path: <linux-media+bounces-28289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F15A62DA1
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F6117B1D0
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FD71FDA78;
	Sat, 15 Mar 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmgEhgos"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69F1FDA79
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046218; cv=none; b=daxk92rvgsZVDtooLC3bTTZ1LbJ3Loa2BNXWTnmIN3/hUvqVPQTXyy3BKmsF8GFkAffd+ta3JEulfI55WSK4clgSc6L8Z3smpov5BHm5bDguSFxkg6foVDQmPs42RX9rQURgqcNLu2At6kWTp3PdfHeKXF42L7FdfIj5SNIdTFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046218; c=relaxed/simple;
	bh=JVuh+mhc/FwpTmDaaZmTnWUK0YVL4MNTJLdpJeZnUw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cu3LJix+nMvMqCmQR+1GA0Xeig5+wndmK8zvQmqNXHuzmlQgHC/9DsfBKyND/2R6jU+SrVGK63I45tMcdmQuW6v6RnxT4ERPu8O/xcFrnj7jXZ6nYDH9GyOAqRx8W/LCI103xWyiKuyQr4e/i1BYdFzMyUqjmT/J+IoJuURZQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmgEhgos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FD0Vup003099
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHgAsLdlTbAsNFH5Qo9LSY7aWOa7CrR7kjhEOgV/rqI=; b=LmgEhgosFjWf4/+C
	oFTo8vKFXXjr7sCc65R2x0nvqpSAJFzh1JSUFH7tmJq1QO764OYVm9zOekCe+kz7
	grTBdzB+XN3pLpnlCm8dXSuHbSaIsdU/8zBzJwoi7U2pplhNiel8dk9xDmT2zCQv
	f7ovh0E113129mp8+FdigxPzHzTh5aHFLKyOXg/Fhiq+wghUQWWL5RR72I8zst78
	v7SJGjjiEmnch8HEuGGJcM4lu9STbEEU5NrFcMO3hoA4dzcHcg8yY3MIqykBxoRC
	IZRuhtyS62X7CKrS3cHSHxwMPg0MQ1AGNuUVHGilz7pq99daf1rfUADq/FVgqRJO
	0nl9yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdgrg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:43:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso11312285a.3
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046215; x=1742651015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHgAsLdlTbAsNFH5Qo9LSY7aWOa7CrR7kjhEOgV/rqI=;
        b=aAOIvqah/Z8edHJ6bQqV8M1KPw6ly860Rr0/Ta3ynehsFe3RIvtaEJQOpouFQNl7wZ
         bKKZ+3Ptj/V3HkFNlQPXc6G8i7/VESagFPMTnTjEvZ7iUGXso7sFIzbMTUvbcjJ5DMwI
         /g1zMl5vU2Qij0sCtQUINkLc4st7aHtAd70k6JS2F9NAdp5fo14t0tJRZqMzpegh51eM
         YpDfYN5nl4GDqsfCFl5iDBU3W5X3xuc0CB/5SPsELdsSfIGmc2ZWPBwTfrfsLcAfbHwi
         53lqe3zHBFhwQ8ECj5ejKRQ/uFMybc6s01QXRuyzGT2pvgWZLzyEKwDE5maeOswd/6Lc
         jtFA==
X-Forwarded-Encrypted: i=1; AJvYcCU49ILya1J7lKXHetGD+TAAlvXVm4w93fOy23DcHlmYfXeAsRQQAObnPYdfy3A3qC2Mz1vuIZ5wMJUokA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybEK2jkSQps6lecC+QZGq/OXhEQ2ooN15uF/HFjffF3UKeUYL7
	+DC07SpmcDlUf5SeBt+pq/vAT7UrYR8/Z+BnVvRt6f7pgpSRrjyBNE4/4U78z1ATg3LqEkpclkW
	viu4q8XEwYT6yfG+ycNoqLSb0xbzxeMfCP2HMfsObdUUu1Bs2/8+Xm99dqh46/GVaawvlSQ==
X-Gm-Gg: ASbGnctzX9/9fP7nEtQOQ7Z7ShuAPmsBSVAvVA9AhU0Ud3M0GG3Ule5DbRT/RHKBX64
	9WblGqRseagMDAUR5j3r4NjzLjFLUOCrJk9B33rPYCYq4YSTSF8B8kI7gzZM/HKiffpOm0b6brI
	vU7hGHEFK29mc0P4bJaxuVxSCRip+x/7bKcHU4D+vZcac+kuh/tBza2UGF4Fa0Vl1iB4USujw5q
	z2kqn94htTd2ky2V7tKxfsAge1xw+aH34M99cYw6Mv79xw7dlxr5Y0kUXzMt9NhU6pfMPWRoeRg
	8SM4QHAFw/NhVb02+izQcpyskm/pV1JMq2d6YhSM0z5JZm+Tn4SVhQO9+2vjV082AVcAlA==
X-Received: by 2002:a05:620a:2410:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c57c931333mr349095385a.14.1742046214641;
        Sat, 15 Mar 2025 06:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS2nqxwW8/paMLInQIBoFDddr15kcIeLrw4iAy+U7F4I0nXMeEk8ATlZcPQydgmcJFGW3Efg==
X-Received: by 2002:a05:620a:2410:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c57c931333mr349093085a.14.1742046214233;
        Sat, 15 Mar 2025 06:43:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b04dasm3363342a12.37.2025.03.15.06.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 06:43:33 -0700 (PDT)
Message-ID: <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 14:43:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d58408 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=o0DAOHxMhK4SEvgiHlYA:9 a=m1fupbwp798LcsAA:21 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QxVRd-TE5rbBUrzyJJYYNDrPgiiN5ol1
X-Proofpoint-GUID: QxVRd-TE5rbBUrzyJJYYNDrPgiiN5ol1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150097

On 3/11/25 1:03 PM, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sa8775p-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd SA8775P_MXC>,
> +					<&rpmhpd SA8775P_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,

This path should use QCOM_ICC_TAG_ACTIVE_ONLY on both endpoints

> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";

If it needs different firmware, I have my doubts over why 8550's data
would be fully reused. Are you sure everything in iris_platform_sm8550.c
applies?

> +			memory-region = <&pil_video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x0880 0x0400>,
> +				 <&apps_smmu 0x0887 0x0400>;
> +			dma-coherent;
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};

Please add a newline between subsequent subnodes

Konrad

