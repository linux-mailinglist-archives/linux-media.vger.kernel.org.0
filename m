Return-Path: <linux-media+bounces-19281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33669995457
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 18:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6486B1C25790
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 16:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66531E0DC5;
	Tue,  8 Oct 2024 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SzyjBO2O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659433986;
	Tue,  8 Oct 2024 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404687; cv=none; b=K0Y8TjKMW9JziBofzM/kXC5SVDjPUcj1719UubMvGlw6ytAAhd9FprB/JgfS/Y4MOgu+dILFhUffBqTEL+T/g4uKSL2DwYu4oo6wplTgXE7mEVOZwOWzlcqzxou9MOgOVHRviyfHP8U/CJEHH1BcBKDIvNva/Rdvv1aCUlQJB3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404687; c=relaxed/simple;
	bh=XrWf0ultc9CsENNBmzVlak6dmE7LYWtEiie1YLK1cl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BwlzNZD1t9lMtXBHL0lusCfgvxJPnxqCXNEG2NFJjX0W8M+pmtu8+z7ixnBHGNLCF/gguh/gYQIOBI1gjoXFcj8gjOnKiNZHbgWORnsLg1YsgQvwlTv6Z2mh7i+Q3mqO5U6IAw1bxKwTLyH6eMKEv4ikiUGFz54olzwZYlxxfB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SzyjBO2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498ChnSv000565;
	Tue, 8 Oct 2024 16:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5CjsZrc4+dNwhi5R1lRevCq15H6EJOESvb7Q2PcGGk=; b=SzyjBO2OZpf9p0L2
	humqDVrAgvsZC+OGStCZunNnwYLEM1cPEghdfatah7h9734MYVN1n+tSpM9wP6FK
	cl4wXVy4wgmdVPxft8ehiOt/B6mHcbEAa8X7nQbKlixS0+k2Xey3JrWtb1m+CHGl
	Lhfk8Li/XGtNFowLfyscOuAn0nuQQgkJlVrawR6QoHAA4gRE4+a+8i65rt1euviW
	I2y/MN1MfFmzcHMJO3Is5NXitgJulD7IrIlk7l9n4n/4OBdZ0xQqUj8XDUQNhCON
	pwv4QrLaTRf4VWBsyhs3VEWriTwn7mlqSCsFNDvIFAPJKXvKK73J+GkgJcMyDEPS
	B1KJTA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wgs21hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 16:24:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498GOdd2002546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 16:24:39 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 09:24:35 -0700
Message-ID: <82a302ee-f0e6-4b65-8c4d-12f79701aa57@quicinc.com>
Date: Wed, 9 Oct 2024 00:24:33 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
 <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
 <c18a92f0-5824-417c-94b2-ed10f4580cfd@linaro.org>
 <bb138ed9-2abe-43ec-80af-2d77b7349b37@linaro.org>
 <86d95099-4053-4c3f-a36c-cfb4b63e627d@linaro.org>
 <cdeec240-5a13-472f-b144-fc0012facc6e@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <cdeec240-5a13-472f-b144-fc0012facc6e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JesbTe2B1k4R3KehXoG6HQf-WF2RrmG4
X-Proofpoint-ORIG-GUID: JesbTe2B1k4R3KehXoG6HQf-WF2RrmG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=967
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080104

Hi Bryan, Vladimir,

On 10/8/2024 11:51 PM, Bryan O'Donoghue wrote:
> On 08/10/2024 16:38, Vladimir Zapolskiy wrote:
>>
>> % echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/unbind
>> % echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/bind
> 
> Yes understood.
> 
> Lets go through the process of checking the qcom docs to make sure we 
> are making the right change per Bjorn and Krzysztof's queries.
> 
> I'll do that, I have the necessary network credentials.
> 

I have checked this, the trigger type of camera interrupt is _Edge_ what 
is listed in Qualcomm ipcatalog website.

I also verified IRQ_TYPE_EDGE_RISING on SM8550 platform, it works good.

Thanks,
Depeng

