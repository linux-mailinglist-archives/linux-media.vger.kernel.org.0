Return-Path: <linux-media+bounces-30370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAAA9085E
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C8919E093A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 16:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35B72135D1;
	Wed, 16 Apr 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmzkTcl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A5212FBC
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819761; cv=none; b=EMVplB8tle5Gmt9UsdYxch0u2fu8MouKHhL1LcSvoRgA3xuwqan11rXD+sFfs/c6Mz9mhpy0G13wPv27AQWAYQz2lkcpiKEsP9P0gaPezjHLeLtzGcC+3HN8rUCpBetdvrUf5PO0448XUmBiMMbgx0HFdIYgsfE6mR0tPKN1LQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819761; c=relaxed/simple;
	bh=FwIeW4qgOB5haxONFHXw7a6R1kS+Pg8/36trjRhroCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBlpw2sZZG6xWn46lQ2Vcc2ony/e+40BtJVbo1EPX2Ex8E0bbuUbHvSpk9qwKE/R713Duljh7NvbCYCtvab9eo43nY64NZ4Fv8GEc5FDsOmaFDZb0qG14Rs/EAcu2yBwmFh0HZQ/r33oiNgvX0fCrAvnzlIZ+L88VvRJyzpxyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmzkTcl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDMK000304
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=; b=AmzkTcl3OozdoeXI
	QOXa/7IT9EFhYmScZ021lQK85PBqhd/1vF8wBbc/9HjrE1131NbqkhogJz5pWlce
	T4PoC4Wvfj/9JUB/KBOVG1CYWgl34wZOo1J4qIEJlME9TiUuzZz0F3lcDvAJR3X+
	5Zf9uCwfTBXVamSw9o6zEnV3uibaPIaF1nPaJ1lP79yQRNUUHcxmcKJX3kItSKvo
	sBxrhH0+QAW3OhNCw83pBVU/A5HFGu+SfGJRTledNqAQUWCP/VhKMXVeLnsBR+v5
	B1OUXkFys97L5RMOsRgWvyfNgFPNeONuCNVzs2z4m2/w8CSZFEOouSVyUxDCEKFA
	iQj6lg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vm7kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 16:09:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so167420485a.3
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 09:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819756; x=1745424556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=;
        b=WGbNBbUkYnH5giy1KPRA3f34z235HpVThMuwrKLLVOr4n8EiftQT5Xb7d65JLFfhxZ
         aYge+FoZ8GrSawM3u6/UKhMudp7uZmGe+In6D3tC31N9Be9qHj+XFBVyREY8HjiRxYa8
         egliZVwXuP3vzdJsZI7aCkIlA9KNj6rIMPCsxlrMvCoQO8ls/n+HNavyq2x7wfsw80X0
         IOs9PKP5U8ni+EQ4/JaxPw8w5gawuQNFnuz6AsisFxxEgiRn5in0q9yOvFbT/ST5qgYe
         d7OrSvC9CVScM8KmFr1QtFTvnyY3RPr4NHxNSmeeGTAqA6z5glUmO1chVtKfIj4kBmJU
         x/1w==
X-Forwarded-Encrypted: i=1; AJvYcCV/iKzQt7dfKBzopgA8AfsUeAvBCEj7gTQCE7Fva+1PMHz7gSPUvQ0Q9mlOEkpAvZdWcvSbJB6Ou4aToQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQz7t3Ki1g7racFl1jwWt2UT+mKpXoEV6teWuCdZpRn5fxG3R
	ieI/VVrYElwa5R5e/EKT0HIxszNxybDlj02VjTz8fAy2IipWh8Q48bJQtfW2mt3vAQBylMAuwEo
	UIHrKh/Ywmx+muJ1NBevi5N3EouYdbXIEvy+pwI2HC7CYG8CYGL0t9KDXb+8Qdw==
X-Gm-Gg: ASbGnct1d2EYpyiniIUXrQ7M76afpnHARpUqwDyyECeu8JlNZ7iAYi8ymA77HM3Gtpu
	LnrMEiiKHZeqSZquakajwlTWfJ0lPc9FiyVnZEUKDcUF5t7DoS39+1nj0xPqCMyvtjN0eNhWbgw
	IkfJgv71STXHznFp1fPnGpTySYwgXvyt/1Higi3JIbWRGsk/dduCkJzJqTI1YM04u9ExErXBOkc
	2ejEtKSZ8MCcemD+aqBV/Q7ItHpsZMzgoSKMALPmyVbYApYxYJpBf1ElG1/TWv+6ccuYtEZLx+P
	rWpjBQKofSaPtk9zzph+NppmjrwmI7Iyn+qpBgmMWN9VAlz6rDaSaPVyNjtybhrN8fI=
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1424176d6.2.1744819755827;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqTEn4ZwnP85Wl9OFLZVFMob3CDIEgC8OxR/srPtQNfxgXZMTXzLdDo2GRaFTa3vUSJvc1xg==
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1423916d6.2.1744819755308;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d127970sm153280866b.113.2025.04.16.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 09:09:14 -0700 (PDT)
Message-ID: <b6c941d3-85d4-45e8-ae69-9d9e4dab8440@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 18:09:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <6e98b5ca-3ff1-44c3-928f-e993cf29215f@oss.qualcomm.com>
 <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y6X4TAjz_l-P45uYedjmZs_bK_ZdP18u
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ffd62d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=eWPriOLmkRKYu5JWBSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: y6X4TAjz_l-P45uYedjmZs_bK_ZdP18u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=908 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160132

On 4/16/25 5:29 PM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:14 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>>>   1 file changed, 187 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 3394ae2d1300..83640fef05d2 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -7,6 +7,7 @@
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>> @@ -3796,6 +3797,192 @@ videocc: clock-controller@abf0000 {
>>>               #power-domain-cells = <1>;
>>>           };
>>>   +        camss: isp@ac7a000 {
>>> +            compatible = "qcom,sa8775p-camss";
>>> +
>>> +            reg = <0x0 0xac7a000 0x0 0x0f01>,
>>> +                  <0x0 0xac7c000 0x0 0x0f01>,
>>> +                  <0x0 0xac84000 0x0 0x0f01>,
>>> +                  <0x0 0xac88000 0x0 0x0f01>,
>>> +                  <0x0 0xac8c000 0x0 0x0f01>,
>>> +                  <0x0 0xac90000 0x0 0x0f01>,
>>> +                  <0x0 0xac94000 0x0 0x0f01>,
>> These I think should begin 0x1000 earlier and as a result be 0x1000
> Hi Konrad,
> Thanks for your comments.
> First 0x1000 bytes of CSID are for secure usecase. Actually CSID register address space starts from
> 'TITAN_A_RT_1_CSID_WRAPPER_CLC_CSID0_HW_VERSION' which is 0xac7a000.

Alright, thanks

Konrad

