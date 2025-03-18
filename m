Return-Path: <linux-media+bounces-28426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46FA67678
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 15:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CCE3177E52
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 14:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B114F20E00A;
	Tue, 18 Mar 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv0v35Ub"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8520CCEA
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308409; cv=none; b=gvQp2vjmdYBlYYhONMn5xAEERuGCMB1NHGMkw0ltcE9ymarV8yE3Us2sSXOaO1XIbkw/VoJGOm+O+3i9CroM9O1kZnIfi7WkZVlbBBZI4EgcdTyBDeJJF3LXT5wS0ti+fTPYEHCBLN2tg6+qKKEnVISoZBZwiNM/qDlA9C86K+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308409; c=relaxed/simple;
	bh=eas+vQ1ReggmI3VLIUXfF3opvpqo6XgOUi6ufjd5atQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQzlCWyJ9dZ+a4vvb4bZRRsBTNpmm4XIQVJF1bPjH3YR21K/3wbR755mjvL9pa4XEv+ctnLYi7wIIde0rnXlyswPdaAUWPFFUyC0JSi/wbeDfaj+Mztj3xj0lHrD/yfani1F7PCnnDayLdC792t/9CALmmtnqCLY4wJWNNqmlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv0v35Ub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAVrgq027058
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 14:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gSHyxlizzu6L+Z9HZ3/usswbAq6JRVp+YGuaZi/mPc=; b=Wv0v35UbW/m6fi/1
	pyNrOYQ3+YBprgYemg0KkFBPGYCo0+N+uwrypKcQO3S4F2Y5Ef+xvwx6eBxrSPnj
	kcb55JOjnff6xIwQdXMWiyCj8HPY3THX62nhKbJ8YbJIOOrrIjEJgU4uyGhpmznj
	cBnPE2aqaD+zehBaFEXbBv3sBKsqdM/fgZT0TarPXhtGVOO2XIB96bzU1ePpNWtU
	ogWfLqa1muOcAAGbu16j7i2XX/51iz8XagTpGG3vvdSY9CwEAiuNwfJXljovzMuz
	t59qW+e7W1OGA9jVukhX76SmNtLneZdBk7i1eDeGh+W0e6ay+02Xj4YJ5/v+ge9T
	gukyog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtj7p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 14:33:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9c5af3dso9749906d6.1
        for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 07:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308405; x=1742913205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gSHyxlizzu6L+Z9HZ3/usswbAq6JRVp+YGuaZi/mPc=;
        b=h0kks4WT8KfED3rYjqlMOTJIflXIMWzCTRGLdJgK2p7CaYGZaX36jJIJ3ANGTLqYQi
         JAptgy5VsKR0jeFT9JdmLGXvl+Zy123wDyY95HgURSEfEn1D55W9Xw2qbOl2bUsYAUZe
         EZb97akBVqAbX0I7lKD1UTUwFgeBkPVfBwOeYVJRUzPpRZiYicFVaWGe65AUygkNJ/5s
         CTnnOEoqdnCxw9WnQUgrT8UBLuaYhgnljwLqmB7gAn43/V/nt6DwHtijk7VHGoKZIRbZ
         1iJASTtspkQRd7k3dkBYuJDxYUiMNPlWhp1jWLxKWafxUiEFOUeJxes/7s6FxL20yVds
         uKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNk1DZTUq1yx5u68cyQjHP61AytqLlwxOljxiTV6XPwsz0D44aX1OtxM11SJFNXiuSe3zpga9OvW6shA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrijoEbdmzl0EDPxb/BLxFylvdhI6v67+3i26Sm/BZJPSinzG
	96uH4n4MN+kfBW0bhO/wOxDsFn4JiPvOkNZUy8eZ4IFSlYJIQtzKvEEL8DswKqJ4osswLgRpqFM
	DUIa148hCKr8QiHzrN6fan2QrEpelDefbqZLvze/qO+2v2pVm5KMaiIyFMSPajQ==
X-Gm-Gg: ASbGncvY0Yf/39AkNOPupGF6tf3Nta6dqd/FFTSRDJ1KYLEcNHQocpSztoVTkt24Wex
	3ZGOTHorCO9zt85oacQXiQdHpRnv8H1SzfeG6R1eUCy9zWmw6heoh/FGF8WFkzBRNZZMafPQKeC
	AZS73SMfzfWtTw16PHVyrlldesSj8IpmbWbECWfBO52LryX6XGgjHjOxnUiL8aj49JH9HVRvLzR
	pIpnkIu7eccHwvxQr3mYxq8p5kFjrvSpxAruLzWxeDUOkpKgezmU2LQKHMRHxmW+XRsEjdVtLLJ
	N/Bv8SupcmFDFnPi6iiN+2AYRz7oIl9F/J00AZQ0GSs0tOBo+T7U4DwqKKblKnY0/eW9CA==
X-Received: by 2002:a05:622a:180e:b0:472:2122:5a37 with SMTP id d75a77b69052e-476c81410fcmr97651661cf.4.1742308404962;
        Tue, 18 Mar 2025 07:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGijmIEbCtzUiyK4kMVgUNiQ4VrmlRjM2YTS3V022dmP4rU4NWQYFESVJkXCh24tWs7ZzGqWQ==
X-Received: by 2002:a05:622a:180e:b0:472:2122:5a37 with SMTP id d75a77b69052e-476c81410fcmr97651381cf.4.1742308404588;
        Tue, 18 Mar 2025 07:33:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a40f61sm853965466b.134.2025.03.18.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:33:24 -0700 (PDT)
Message-ID: <9940290b-6b97-4339-848d-ea95a365f74c@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <8f7c1c08-6776-968c-530e-b640ded940b3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8f7c1c08-6776-968c-530e-b640ded940b3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xHrmPWXKDUG5f2P4Bc0YQvO2YjOyKuoZ
X-Proofpoint-ORIG-GUID: xHrmPWXKDUG5f2P4Bc0YQvO2YjOyKuoZ
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d98436 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=TSMI0u4FDo7tO7E2M5oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180107

On 3/18/25 3:24 PM, Vikash Garodia wrote:
> 
> On 3/15/2025 7:13 PM, Konrad Dybcio wrote:
>> On 3/11/25 1:03 PM, Vikash Garodia wrote:
>>> Video node enables video on Qualcomm SA8775P platform.
>>>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 67 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -10,6 +10,7 @@
>>>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>>>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>>  		};
>>>  
>>> +		iris: video-codec@aa00000 {
>>> +			compatible = "qcom,sa8775p-iris";
>>> +
>>> +			reg = <0 0x0aa00000 0 0xf0000>;
>>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>>> +					<&rpmhpd SA8775P_MXC>,
>>> +					<&rpmhpd SA8775P_MMCX>;
>>> +			power-domain-names = "venus",
>>> +					     "vcodec0",
>>> +					     "mx",
>>> +					     "mmcx";
>>> +			operating-points-v2 = <&iris_opp_table>;
>>> +
>>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>>> +			clock-names = "iface",
>>> +				      "core",
>>> +				      "vcodec0_core";
>>> +
>>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
>>
>> This path should use QCOM_ICC_TAG_ACTIVE_ONLY on both endpoints
> What is the advantage of "ALWAYS" vs "ACTIVE_ONLY". Thinking of a possibility of
> APSS power collapsed, while video hardware is processing a frame ?

That's totally okay, I'm requesting ACTIVE_ONLY just on the cpu-cfg path,
which must not be used if APSS if offline anyway

Konrad

