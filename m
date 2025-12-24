Return-Path: <linux-media+bounces-49442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D1CDB55C
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 05:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07DD2300A9E4
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 04:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DADE1AA1D2;
	Wed, 24 Dec 2025 04:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEpRLwer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKqnDj5s"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BABF7261C
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766550705; cv=none; b=DwZFkgN6SbbIAy2swe0wKDLqPP9G3kpbCUSkglAv2qsV61z5OG94SkDCvjHNJ/rDEHNtm3sQ8kQkkuCpDw+Oh6aHqJxhYjCW63Um3irHXiAm/o0RFGqJ7A1DWyF/ZzLQ/iC6iZQxnX0UvUW4EDErFY2GaFCqQcgaRKnv0kWtI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766550705; c=relaxed/simple;
	bh=yr2wRcJQncKJ7/NIYroCn53RQ3DcYr+MyFIGaxoBPVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCe+198LwACVHYYIeqSk8u//mpEhnvpt+A8Pjn3VkigjXgNiORuaphfGrzuNRY+RsR/1X1wblWvY+UyRPjtG0ryB/xTaXaMmmm3aUO3jNKfuPH/y2OsaL2QOBtU4ZSh9m0iQrpslnhT73tr3qWAgXFXzku5PicAL9gktAnINpRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEpRLwer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKqnDj5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXplY1207083
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tL8XWRXnZGwliZDVVR1osmuHXfvZwqwbU7NgrSBBLzM=; b=NEpRLwerM5MvFTDQ
	23/pAhPM3vX2IWoyVc4R7UydhXGLxKe5Ev0y9G7XvCQs4S26Gh2cIYcM8wYBEKHP
	VK/b+J9g5Gh9vhr0ABwuA8YIsIB8/oAu1aYDuevsN8Xc95onlI3aAhzJ0FN+9yF0
	NqNz9nrzW36ySWd7X1btUUR6LR/1CfOFNzSOqxX10ulx5Gu5jujs/595XbIqYJCd
	JQJi20b2aeN9z2XRA5DkiEXASO2rw+F1K0I/jmmbyaeEoF3uowmVVT6acQHYZq92
	R9j6izq6c1W1dUxMknIfdyN/dlecq7UI/WHKvZEPerOtlbcbHwAUbViVTsNUWtkh
	etfq2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0yag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea3d12fcso268309685a.0
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 20:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766550702; x=1767155502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tL8XWRXnZGwliZDVVR1osmuHXfvZwqwbU7NgrSBBLzM=;
        b=dKqnDj5sfY4uZkMrcQvPPS55tT0lPpZmR2iTP+uFCt6g2qpOO6Rnj2ASRSQvGq1wmt
         Rn8RZx05puaaFnxiTTnvp+8Joavb1uQ/timkMFNL8Pi5JVPPSnlC4ibBlD/lvRLTj8+s
         wO5ZRst1eu9WOPcx43D0+RWv5/1PzhvV7nKPTqszEsJXn8Wis1dx3FZm9bo7MxNez6I7
         C8yJSVwiJVu4eCivv6/IthFVAeU/25qf/nu7r9S+EUHXuOcTEhYGWgG+Z5td6mvRKoD6
         2IPc7PI8y1p0WXuC4wb8UU8BmBF+AAVcBvfipKr3t9cl7El7J2BtiS9VZ/I0n78WdrXL
         QJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766550702; x=1767155502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tL8XWRXnZGwliZDVVR1osmuHXfvZwqwbU7NgrSBBLzM=;
        b=X2hA+9N/jyG/zNrJIOEZd+LQMMBRHdafRaClh1PoJiEvcGjeAyR7pFVjX0Nswt7Mhu
         8cZqlE9DuKSIthqNr0R/Fycl4at3PFiUrLUCw7H8AAI5AmcUuSwPpbdm58N4BfauBc0w
         L/S/OYc1s/nQYM/IQqv7stfmZ/YTGNxDo8X677G+wpBe+J8kBA/ge5bHesyp9nFLNr9b
         ZGWclXYEVdJSImhvPND6smu2Dd4Y4QEPh7XRvvkqb+dd9Ho1vVnl3kZq3ai5FD5baWWK
         SRvLCF182CqdbvphsmodVn43JiHInoAC+nOLSrCObFbBOAzl/6GOaf3j2BRoxmgUCLNT
         /9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg3OfPvMHeHbB+REirs7ckDeLEXmslFH1i0mgimL+cmhgTpCfWM/b/ZfWAnyUmz1Qrfa4gg2ipGpgAig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEOOeBbfKX44U24ShVJHUYVhAmUa+r9uRAsuFPJjbB4nLPqjZI
	8o9y4vt11grf0fQG9YrnAaiRdkxnkUmsWH71llE8XiTtFrpq3Zq1WXstYfIezeycTByey89b05f
	6cTZdkThauyR6zxHndQPb4lLTMXWxE9Y/f4Kz/0H8X90Bru+HlzgA712wZaC34aVb0w==
X-Gm-Gg: AY/fxX7/vroucly8gYGBQunhkaJizbwV4cyf7UZW3O+P7+PzeL3gM74ubJqpXSRvCbs
	LaRRCQXiQfulg/BmT5Kh1q27RfNTxwBkgHQW3MqA0jRaBoBblDqkHbUwpO0fPajPcc0eqp8cZ/b
	0JKlhdzF40d1pmpWYC7THHT85RaqU5XXisjNQRQWoXzRNEa14eWhYNqXJ5heG+m/49yIeAwbE9T
	TpK8eI0d1mERpgmDwoCDM1zg2eQ+Ea9o6FTWtqL/dcPHj8vXQ0bm8Mh6TYIPyQH2DXJ6m3FrJuH
	BXoOvV7UIQ/gYJrnwKwlzDHbinMysLne14b+kN9RQnJb9WE+tbM3a2ALKJ/lE5TR84sHBv4ZsyU
	i6/cC++llsPF49kihY+D05zC8AGZftMhiTYkoHzeGzcIOYsQUnMB7IfejMN2NgWeZNWmSwKHcKw
	==
X-Received: by 2002:a05:620a:290a:b0:8b2:e598:e31e with SMTP id af79cd13be357-8c090120432mr2506758485a.56.1766550702374;
        Tue, 23 Dec 2025 20:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY0QWP4SS3wQ8tDcpMKfGB5FvduXRyQiLGiCwsXQ9cNuEhFzHSX1VVghG/xzega15yROjwfg==
X-Received: by 2002:a05:620a:290a:b0:8b2:e598:e31e with SMTP id af79cd13be357-8c090120432mr2506756085a.56.1766550701819;
        Tue, 23 Dec 2025 20:31:41 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ed974sm1223904385a.30.2025.12.23.20.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 20:31:41 -0800 (PST)
Message-ID: <6b52d19e-8ff1-4bd6-b854-bcabccc7cd74@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:31:33 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
 <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
 <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: --X5_Rrb5QHzZB9CpDlkelmK-sxuY1AI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzNSBTYWx0ZWRfXyRbEpoZWkO29
 Zq90Y4ofVp3GBxDqNKDm/ggivBdOk4v0xBgnJ4+bVo5pzRzWzyERMvoneODytYWLFjN/6bqgIaR
 JeFaRN37dpDaICn+5XxSW7MDN5TmNIfh/iiJJ9jbxp8uCMP4I13cVAVcZj7DfM9G70HyE51VRGS
 K6EYC0zw9uIPG0yx172NLb/3e3qz9q/Eh1d3oK7YinTn2O3T/X2AfgPlryIeybeEHte+KOFXzXX
 2E9PUJA2U1005+ED8cZsuUwItwu2StJxRm4dZezx8DdDeU25HBZM11drZ3T4NHsGWXNJORsymdA
 cDMQXvdt7vZmy5AxdUktVnQA6Qzx4ZT+ac2WdtLm3o5WhWthnHj4lEJZZ6d3SL1zApX5avG4BQu
 xZ9eZxYTLZAUBWrvPUAfRnNhcKyxKVOu1ayT5WZG1lUR4k0GvKJF40ursxZZaVT3jsOe9yYUDG1
 JrIM8tajQSf0G1LZT9Q==
X-Proofpoint-GUID: --X5_Rrb5QHzZB9CpDlkelmK-sxuY1AI
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b6caf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=svOBXStEYVJDFbwpH1gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240035



On 12/24/2025 12:21 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 24, 2025 at 11:18:02AM +0800, Wenmeng Liu wrote:
>>
>>
>> On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
>>>> +  interconnects:
>>>> +    maxItems: 4
>>>> +
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: ahb
>>>> +      - const: hf0_mnoc
>>>> +      - const: hf1_mnoc
>>>
>>> Same comments as before, do not invent names.
>>
>> <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>
>> This platform(qcs615) is different from others. It has two types of sf,
>> namely sf0 and sf1.
>> The same as it is:
>> sc7180 sc8180x sdm670 sdm845 sm8150
>> Do you have any suggestions about this?
> 
> Which _names_ are used on other platforms? This question is quite clear
> from Krzysztof's comment.

The platform mentioned above either has no camss ICC node or no support 
for CAMSS on the upstream, so this is a new one.

Thanks,
Wenmeng

