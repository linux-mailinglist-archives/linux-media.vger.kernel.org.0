Return-Path: <linux-media+bounces-67463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KIxACVG/VGpuqgMAu9opvQ
	(envelope-from <linux-media+bounces-67463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:34:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE78A749DF9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V+gCeISA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ts0T2PH2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67463-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67463-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5685130427E1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC44380FD1;
	Mon, 13 Jul 2026 10:34:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E5241CB7
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938862; cv=none; b=s2ReeveTYWTc1xRxrzSdP6AbiV2QqwgJ9O18VErH5dP1V0LCbFEsJlUuXgMHd5Kj+TypwqjPB5FCUG6YC1A5GE1LtaNKPHKF5UTkZ7VQI/9gqipK+VazPQtpTKvkkAE35eoOfASyIEjQbZKiVxGMZM6jdNGlxMFeCZp+siowRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938862; c=relaxed/simple;
	bh=80uvDt5MU1fMdxcH8e+Lh30RDkAELmAtxtlNNHoW8+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUsVz5y1Gwl147HGWoNSdFKOI02w/iLxORDyKRr/VrmSfnjE/cUeqtBwG8jFBy0q60yYiPn/NzpKFkEmNCJEU95e+/GCtZE8zK7ZFhD4SYX7tibeVamISv5M/FlIMTfr94CoovKDzkAVPwc0ouh95VjHe4Tnz3+bnCWij3sV69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+gCeISA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts0T2PH2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nqt7507366
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=; b=V+gCeISAvfz1jB1z
	zjcsdfJMqSC8J9qKGLfLRi7G7QlXsrHxw0GteUuJDKtCcoyugYbWufARqcQ845y6
	D0Em2KCROztDRovkWvTsnKpwPLTTF8ZvVLJvmgfQ+EYgDGnGLybk1pMvheCosQZI
	H2OdfBSavI1FSZu7slnxEekGwINhbAIQfFspf6KoYloGchjEacDYJy+kSLcIVzwn
	lJUveFzMUGelHx9iAgSIdNOuedCGXG3rz8cec+PY//P4U7eGNb4veuvEMuorigIF
	rlP1rMdqSKQac748gSJa0x0toM188gKucmezY33huD8tHU8YRMKBqG4KPqg6xILX
	dWsoJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h2me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:34:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso59896631cf.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938859; x=1784543659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=;
        b=Ts0T2PH2DpVlkkhqCAijdswi6oNnu8jgJHfnVHZrRCJwp7ZLFRUynpTMN7A9anyQ+i
         vuHLSdADr4Lcz1MiC+EgR92nH8ZwrNrl8ZC5WCqaRpbVTCUP1xSt9EYQIiNzDwKdqGRP
         JTBjFVgAJ11Kt2RL2o7jfOnXTfG17+gNSIPaYwraceSeDmByQhLPAhZm/0nIA1EbebjN
         MnsugcCJtTeh0EUCp1Aol1v4L1R09RgFivU+peQO/iMq3LpSNEeoPrt6kwsWyBTvruoK
         P3jbj2qNNsgr8o6SaYRf6+SX/MyWKJ4VypLWBLjhwALbcldi2nuZ0mTrJa5sPbDW9O62
         U1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938859; x=1784543659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=;
        b=SSFKIPQpX2fOo5gAJFLWGmVHSSMdgDV1xPsH0I+UCvtds3OiwvjhdbtR00bDaTefEg
         G1tvflcSRTQG3PjlYkXrOZ1ITMGBYe5GwyMHWQwF+wY7wEdz8/XjcMjL0IEF2aVPieNW
         XZTrpF8rUrGbY8QwB9HsI1g6RNxI2fhkWLgOBzMg5GwSf3o6jGLwVh+461Ar7USToYfN
         E2livcoIUw5Ll34ooJYbyXRwjducvcCdTrQHUkelCnDS3OZQ5ZQ0T0ORFZ/z5pHdcoc1
         i/5reAMF0Ma3oVjcxLuy+r7EA9ZaetY6abrnBu16mMC77OjrnmSZMHABQcAgEM4B6iML
         mU+A==
X-Gm-Message-State: AOJu0YxFbyQ+tKU3nXz5DBueFcxH2rrSU+ipR8KxsC3O0Mf04znSbX88
	BNYx6h6ygYO7DFYNmCUYKTme3O5JcmSJiG/7VvbO6gEoen5OIu7SdKGfS3sxixJ4mc2CVKIIo9E
	5H7Em3Hh2zxLyfjZPJ737exT6un+BBMrlVUeYXKT1n/LOIWwdS7X12taMK/FouLyhmt271ee/vg
	==
X-Gm-Gg: AfdE7clLaqpfLhOcS7CjbQ3IJpj7NyWipT5cpy1h5ZbF8CUiyDFv9QrM+d0LedasBpE
	7DXOobG0eWx34/VA4SNdTS4UKZCTSLl/4b4vcG19NS9zJLvDvTyd/ur3l2qnsb/9L7wZeW9I7yg
	nFGtZus1l7EdHZAkn96vIWzm+s3w8d6MJCjsAilrM9GH8txpg/15k1FxOzo2uCozfBaU5/JhU2Q
	b5WNdp31NVih10YadB9x1VFVbGxgYztafTKil7TdFltULwmBkxNhihk3e1zaksHlEkBt59YE3Wo
	Zce/4YiZSgQU20sT4ExaE/dk+O2xWqjDtDLl1fagaPtrGyC9FJ0IUy0I7UAS7WvUDbeyQSc+FKJ
	nuzBptWmx+DoFoqMxYOInilw3QLhXZViGytB93wrBz4k=
X-Received: by 2002:a05:622a:95:b0:51a:8c97:fb9b with SMTP id d75a77b69052e-51cbf2feb65mr80671011cf.68.1783938858772;
        Mon, 13 Jul 2026 03:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:51a:8c97:fb9b with SMTP id d75a77b69052e-51cbf2feb65mr80670781cf.68.1783938858362;
        Mon, 13 Jul 2026 03:34:18 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15de6c565fsm662932066b.2.2026.07.13.03.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:34:17 -0700 (PDT)
Message-ID: <b2f62e42-b909-481a-8aab-07aa5e866665@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:34:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
 <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q1uBKGFfhHeA89RcyWQEZTzwnT7KSVvK
X-Proofpoint-ORIG-GUID: Q1uBKGFfhHeA89RcyWQEZTzwnT7KSVvK
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bf2b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VDI__ZYCjcDFRWE0z6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX7KcIKYUtWWbW
 RzDqJr0wRzv9llTCi4FH2l2Jq/F3qQJd8hyr92WzHlY+e5G0dqT+jDhK97np7Z0TwsktSA8fUBK
 /ey1UPzwmSKgda57RxDtLoIDzgka6mk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX7Jo4Qvx5K//w
 MpxOFsTcTaO+InB6tY7W3IEwppwzrhEJCQ0u96EM7Dwu95Qmjq7NBgcH/2e5+ubBDGUz8Hvk5pM
 MGCRQBiyT0TYW4corz5bEhmFkFp+DoefEhK3gvOOGGT5ZPn/p78+V+SDNEwC+Nhd7hrEwU69g6t
 J/QogNEi0DoTidH9neEP7Fsfb9mU0Vlnge+Fh5zeOjVgkeS9M5rIWFFxYdPUemtSAFRoNUVogFD
 FSQoQ7WttCzorbAAx9/y209q8roZ+pIhrYm+7iHfcHpR4sBt1HC66tZUSj8UoJivX0pP8Obw8sF
 sBLKcXpZQV1NfCRTR3oDeZ4wNKIYqvvk6mMxDAw+xn+tqGpSIK3XNaMsgj5M3NQetKuUM+Jsgps
 mtg5jwqpkMYaqi1kJdDwKq0Nb50tdLowZ4hTxKMzVd4KlrzibdgIXO38lYLjNzQBTfVW1G9snln
 mZ9srRrPEKVV80WcZCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67463-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE78A749DF9

On 7/6/2026 3:45 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:11:12AM +0300, Atanas Filipov wrote:
>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 7076720413ab..a089b706f60c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -12,6 +12,7 @@
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>> @@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
>>   
>>   		camss: camss@ac6a000 {
>>   			compatible = "qcom,sm8250-camss";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>>   			status = "disabled";
>>   
>>   			reg = <0 0x0ac6a000 0 0x2000>,
>> @@ -4649,6 +4654,82 @@ port@5 {
>>   					reg = <5>;
>>   				};
>>   			};
>> +
>> +			jpeg-encoder@ac53000 {
>> +				compatible = "qcom,sm8250-jenc";
>> +
>> +				reg = <0 0x0ac53000 0 0x1000>;
> 
> 0x0 instead of just 0
> 
>> +
>> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +					 <&camcc CAM_CC_JPEG_CLK>;
>> +
>> +				clock-names = "hf_axi",
>> +					      "sf_axi",
>> +					      "core_ahb",
>> +					      "cpas_ahb",
>> +					      "cnoc_axi",
>> +					      "jpeg";
> 
> What are the clock _inputs_ on the JPEG core side?
>

CAM_CC_JPEG_CLK is the JPEG-specific core clock. CAM_CC_CAMNOC_AXI_CLK
gates the CAMNOC data path and directly affects encode throughput.

>> +
>> +				interconnects = <&gem_noc MASTER_AMPSS_M0
>> +						 QCOM_ICC_TAG_ACTIVE_ONLY
> 
> Put tags on the previous line (even if it is longer than 80 chars).
> 
>> +						 &config_noc SLAVE_CAMERA_CFG
>> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +						<&mmss_noc MASTER_CAMNOC_HF
>> +						 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI_CH0
>> +						 QCOM_ICC_TAG_ALWAYS>,
>> +						<&mmss_noc MASTER_CAMNOC_SF
>> +						 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI_CH0
>> +						 QCOM_ICC_TAG_ALWAYS>;
>> +				interconnect-names = "cpu-cfg",
>> +						     "hf-mnoc",
>> +						     "sf-mnoc";
>> +
>> +				iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +				operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +				jpeg_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-100000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <100000000>;
>> +						required-opps = <&rpmhpd_opp_min_svs>;

In downstream there is a dedicated CPAS driver that aggregates AHB/AXI
clock votes and bandwidth requests from all camera IP clients. No
equivalent exists in upstream. So, IMO a few approaches are possible:
1. A dedicated ICC provider that derives clock rates from bandwidth
    requests — we have a successful experimental POC of this approach.
2. A dedicated driver similar to downstream CPAS.
3. The CAMSS-as-parent approach — trade-offs already discussed in this
    thread.

Having each client set camnoc_axi rate independently is not a good
solution due to last-write-wins semantics. For JPEG specifically this
is a performance issue only — the encoder functions even at the parked
19.2 MHz — but it is a correctness problem in principle.

Until a proper aggregation mechanism exists upstream, the OPP table is
the only way to ensure camnoc_axi is at the correct frequency when JPEG
runs standalone.

> 
> Inside the DT example i saw bandwidth votes. Why are they gone from the
> DT?
> 

Same root cause — without a shared resource aggregation mechanism,
opp-peak/avg-kBps bandwidth votes have no effect today. Will be
revisited when such infrastructure is available upstream.

Best regards,
Atanas

>> +					};
>> +
>> +					opp-200000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <200000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-400000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <400000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-480000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <480000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-600000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <600000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +			};
>>   		};
>>   
>>   		camcc: clock-controller@ad00000 {
>> -- 
>> 2.34.1
>>
> 


