Return-Path: <linux-media+bounces-23832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 709C09F83C8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3E96188B6B3
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD4C1A9B35;
	Thu, 19 Dec 2024 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOpUjl63"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6919E826
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734635245; cv=none; b=NyimoEAf6FNF040w7M3UR6oWewgcn6y4qgXHqDnb7jffnAtSc6g4QZ2FVnk5q0P8lE5pMg3QVfCMWxUM1LxYyjv+jP+yZj9fsP13h/ojCvemvhpH6HdodXPqZ9KitkxrNiEX7MRI1LBLrTKjZRSK1WwSO5UgV36hYPHEXoRDm4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734635245; c=relaxed/simple;
	bh=BXyyuqobYjU1FYVdrLm66hU1E+pekmTlprDf0Mz3zog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fya/TtzRKD3+Rlo3gAnIBy+8uEvz13AOqp5hOwTxfEPBsHA4Fe8IHaQyjzA46T/b/25wyFqrHlJl6i7K6SBprp5Dw+FCiqXy8+xXsUCIVBCB8rK0RO5nDwip6R9Ij2vWVVOtCdyIlICsEXgltkLGDIb1U0jRdWDIhRQBXG+hiBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOpUjl63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHZcgh021574
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xme2slGOLEbJocB9IGjx7rTsSbBQsnZE7uGnFV/HUcU=; b=lOpUjl63XbC7NSLu
	CZQNKN6Qvy+74280qGjzpjH5O++8tY1BbypdaBhJgO7BviWzx41v80LhQm7izMib
	kdA4vzVFHbpq37PNAldmNNPARLfdn2ndwDav/kPTYE/kdAX8UEbPRxzvdmmJSyBO
	KmOEkIWZBGyaGm0zMgESXrVQQ8YxzxTGKKRxk1X+m3jbfRZZF46yGU3vOWE8v1s6
	1Sm/HV9eEEargOUzgMTq6cPgK8tJddtVZbglK+yEe+Cvzap1nKLCV7/ruhhTMEoV
	ygo4NIGB+UdJxUkd1GQpL+Xnm3HTCEjJysGy0LiU1VE3BIuWtBTRi1PSOlpZprEs
	fc54Uw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mfup9nm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:07:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467bb3eeb04so2167321cf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 11:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635242; x=1735240042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xme2slGOLEbJocB9IGjx7rTsSbBQsnZE7uGnFV/HUcU=;
        b=EqYfWUTQ/T50M/lN0HwdAor4BlXQz+0Zj8ajw/QYw5MPbtUy6DxNuppeGFd3FcHaSn
         4NnGJ4Rp1clfZQaR7ycmKai5tQTFBqxOmNPyg9Nj0PAcgTP/z5PLKiofo2C049ZFru8B
         4+Xj9R4YYjU82wT0xwe3tqvWHmDBoHHuNn0lznbSWMI4MJT3M2/yc3SGZi7lak/mN6mV
         HXwTiicQ765QScQ/F4wDODYYrgQaXrEzTDwKqB+TMlw8/K0vsOesxGqKHI87+Ndsels0
         e8L8JGnb8I4tH/XBm+gx8/iKWdlHN3yxGZ5OnjJ67F1RDIZKKVpXTT8U8sNWbN69RdBP
         hMNg==
X-Forwarded-Encrypted: i=1; AJvYcCVap1rKFAtJdjs9YVOCu3cYg4QTbC8tzYD0OyamAXlMJQV/m0kyMINsUXWBwcjqROeiiFbFK8DzJZnv2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5QcmrgDnIrdFQsAJTaEgCVM9zt90UoJ83b+7b4hXtJfoBzS80
	jM5alqNTVddtZcyeH9a74UHUzNCpy7NveXkuRv85F0CO9GdQ1+ADzhMwCWVSjn/mmuBlAh13aJe
	YhicSixDkliRe3CvwUtBSGz3Wg2njLN7byK9Juom2HI97mbBy4PWvyZVeMLLCjA==
X-Gm-Gg: ASbGnct/M1aSaIEMp55QHMdwqaNv6AkCFK6CYd25LxPbaURc6meNiJO/9ingfhra4es
	nkIk/Url/fFdBOhOyVcEKIfB8CcB4L6RYwH1LVL3X7Bc8FlwxOtg0u9+6h+7yP0b87sX8ysJR8+
	zSLljCeZmQd+vWV45uG0qikJ0/Qp5paDk7EvW7m17gBQKKBVbLZEKLL8/NpzxDfkurtTQ4gKs01
	JnRD+EmebPAyN3FGYam4NgLidCpn/f1wIJd3CnWsU5FAcuY/ixKeWFhL86pwcajY4eSgK+CKWlZ
	y4qD0Kei6PiBUo1ZiKVO0X1iEOddSNgWMVk=
X-Received: by 2002:a05:622a:1794:b0:467:5715:25c8 with SMTP id d75a77b69052e-46a4a8b81a9mr959001cf.1.1734635242117;
        Thu, 19 Dec 2024 11:07:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiLwg4qpvhyo6XSbciUnY8+6IEVaUWF1WSYXCTk5jZqKx2WFc24CxCnir5+qhYN0wAyYx1/g==
X-Received: by 2002:a05:622a:1794:b0:467:5715:25c8 with SMTP id d75a77b69052e-46a4a8b81a9mr958821cf.1.1734635241755;
        Thu, 19 Dec 2024 11:07:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4917sm94313566b.121.2024.12.19.11.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:07:21 -0800 (PST)
Message-ID: <5c4c4ee0-9e2f-4ed4-9fe4-ca41d18321bf@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217140656.965235-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MsLHnKve2HgTyBi_LkIhzR3rkzVr1-SS
X-Proofpoint-ORIG-GUID: MsLHnKve2HgTyBi_LkIhzR3rkzVr1-SS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=890 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190152

On 17.12.2024 3:06 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

