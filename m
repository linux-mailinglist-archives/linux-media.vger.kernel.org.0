Return-Path: <linux-media+bounces-30360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF5A9073D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 17:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4380E3BB905
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291D41FCFF8;
	Wed, 16 Apr 2025 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isg1z9tC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5E1FF1B4
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815778; cv=none; b=IINb2GrcSHax4NoII98tsBfvPr/eMGkCY5NJNpEG9ZWjBC1bHnk5DJH6E1GH9b78Pa0wSBUTlUL3XuQOFX/cr77qTIZ5obvsBfRaWeLERMR1qjE5mVynemwFWDG+qdaeUOarhKMn3gu8GkGE9Qk0B34VrXoYmY4H978MALJbBLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815778; c=relaxed/simple;
	bh=qqp+iF9k1PUQMWye0J4q1Ozyi8J2ju+JFzT71gcgTHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9iUc2GucCBfzt1SbtiMnSe5LBPLRLP51umZ7OgI617v0BWGUklKukQnYbRDz6jo21MWGi2jL0lRU9CIrD4/G/Qhtmt6Vi/KAsBH6Ki5eRgMhv0e5Gnwb9hiwFEmS+umTPZ1epwTaOAH6ATNLLB4qA4iotOxYnyBq/loc46mNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isg1z9tC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDpT020618
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHlUKLWdjyOn8eGsWRMxu2AoM12JPk/lOZumkZ5CpWs=; b=Isg1z9tCaQJIsdY/
	5aiH58WZnkVlB/dGDySmrbwNL20kK2nDNu7QUtYrudCwRYo3HFH5Dif1Hp79GsOf
	WXQpSPVLBsxT/5HIw+yEJZVqrrdO+7KGcC0H6IMoSMPAATPp1ALwbhgXj4Rl6AX+
	dVIwKr4N8jnxqs1pS0GxPP8eX1bG2uUssXbrWWmTuFPtgqZ5Y4nsB7g3R8bFzt55
	ITTQF3OFlBSRloLyWwa5+b/ZgUVxyONs83t+wsEMQjpFdLKnJZhV34CxaS8Dbr4l
	UTqFNmed2H0zUCknFLmjgqVanEYxJKbhu6E4SgE/illeHS9deyyBGXdAlVpnKfLe
	TFW9Hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wkwgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:02:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso167578385a.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 08:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815774; x=1745420574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHlUKLWdjyOn8eGsWRMxu2AoM12JPk/lOZumkZ5CpWs=;
        b=pzIZW/foMXMSiRlH+BSFiKQC3eIgA46TwoV3OfaWy+E5inWzK8ZXNTIYvGqZ6pK+Ju
         4WYTiiKzMq488qUNrLs++Qv+jdRKr55HRWpVLCqDH2k4nXkCbMoc0FkaHIS9rYVGrSmu
         3PadVXZ1UVC7q/NeMPDSINlMKUQDeWWEkgQGlekRkMsq7ZDA6uHr6oq6l28qH4EiAnKg
         PXbE4rt7f1FreqUP98oRMf3Xh9lzFAuqgPk5PJSt3WNxJzGmY1xSZHbIqJs9L91jP/pq
         pHb91lirlI7Jna84nmwriSckSFhC2AQPIsuET0JfBgHczSl/Ve7cSlEyZEyynZqLZI/z
         Kosg==
X-Forwarded-Encrypted: i=1; AJvYcCV/yplX3gJvxVMvSRc2OxMsQ5orFK4FvZsQKYSfqmhWfgPHlvJDrSXedmMgFUnoB8FbNrG3z3szlIMbCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDq09izNbKL3PqsKCuutixAZfiAIiGHyvARWp+fXGeHePO0hpe
	oSyZrvEyXQAB+wKb00CYHRx97g9y71fPJtVzrSSESnD13XrH+n+BMoJhGAAPbXfduleLri4ohl6
	g+18yH2ZXCVppihJsR2pJeAjdpueyacofzgeptl473droklsIw9LFAi2b2XGaFw==
X-Gm-Gg: ASbGncvMORI3dMS3avfnRmnvLjbPuuxCVwydZRz4mZZacZbDg6yhA3pBnpftFZ0lLd6
	7Gj+7lKsAiydVFyOY7pzSM3zjNyDsybTDDYJD16UJ/RgJn90qYAxdvCCYj6lElVyUFLjICmZpp6
	NE9CMbwWRlkbuIg28EAVwlPh9LFhGg2fSYaDH2HfDVZ8/+UL348DoFwm58h7nVUR/Nvcfc9rkQ0
	sqycUoCk0tCg+YY5CBThU0md8I+GFh3QFNWZCtKv7NHhCagdcupJbtD5r/05xMEY2SZxKZBVTv4
	CqJ6iWNM29R6uPfw39ZKCVKq15zOnntlnE+XhwFLZzDvRvq5gqCYq8jWnABraTPWPV8=
X-Received: by 2002:a05:620a:28c9:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7c91cfd6dfcmr7149885a.6.1744815773865;
        Wed, 16 Apr 2025 08:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHdWF23lk8itqdoiPfDmzJehQJ7Pz8aPQIK5CQ9C8A/C0YsZyb53/7Ikzkw9MgQBpt7i4MWA==
X-Received: by 2002:a05:620a:28c9:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7c91cfd6dfcmr7146985a.6.1744815773300;
        Wed, 16 Apr 2025 08:02:53 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde0719sm137891266b.52.2025.04.16.08.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:02:52 -0700 (PDT)
Message-ID: <1bb2c12a-df9a-4ff8-bb76-0b5dec86ee3c@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 17:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
 <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
 <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67ffc69e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=-qh7dGIBTJxnWlHWowgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gBeVhQDFAWTH53BKRF3i048WTLyAJX6Z
X-Proofpoint-GUID: gBeVhQDFAWTH53BKRF3i048WTLyAJX6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=933 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160123

On 4/16/25 5:01 PM, Loic Poulain wrote:
> On Wed, Apr 16, 2025 at 4:46 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/16/25 2:09 PM, Loic Poulain wrote:
>>> Add node for the QCM2290 camera subsystem.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 93 +++++++++++++++++++++++++++
>>>  1 file changed, 93 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> index f0746123e594..4b81e721e50c 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> @@ -1579,6 +1579,99 @@ adreno_smmu: iommu@59a0000 {
>>>                       #iommu-cells = <2>;
>>>               };
>>>
>>> +             camss: camss@5c52000 {
>>
>> @5c6e000
>> (first reg entry)
> 
> Ah right, I reordered reg to be aligned with other camss drivers.
> Should I keep that order (and update node name) or reorder with phy
> lower addresses first (PHYs)?

That seems to be wildly different across a number of socs, so let's
just say this is okay as is, as we're not gonna find any reasonable
order in here

Konrad

