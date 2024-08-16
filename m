Return-Path: <linux-media+bounces-16390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B5954ABE
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 15:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE5051C232A7
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 13:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D231B9B46;
	Fri, 16 Aug 2024 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ab76XYGA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407C16EC0E;
	Fri, 16 Aug 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813648; cv=none; b=U3gtXQos59IqpOaaeVKP+LBicGV1klPYJAG0246PtMYvGlQJEnL9aPfC3ldnbDGAbdnuVFTX3mx0Ei5G6pa4z3cXyId0Vrck4HJXq+EMeu2/gaIToKt+f6MsZRszrb3BEyh6R3g5wIkuFmCgki7/EedO0iBV7JqovzAOYRC7csI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813648; c=relaxed/simple;
	bh=aHmlo+Dbc1Z0u/nYBM1wNCmoOZz46YLSFIhrM1zuVr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tuxuq1nG4kf6OZ+k+vpowqj5bgeg7DOEYjGENZoeQ/bXgcXlrz5hOO2/diktAwmJ1AhMyhjrQBFldnSoZq3DvUs2u8Ka0sBpmyHJn1UI8yWEen/TUd1ZjbbQ8FQ9jAMNC7UPyHQ5ISo2cr1NzNXDKPbUzTgangtU4+GyYJGs4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ab76XYGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G8Yu9G008091;
	Fri, 16 Aug 2024 13:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXaxTCzkH8hCgVclclwqkZp4TiIqcSzHkeLF/0XME28=; b=ab76XYGAcd4EPxHM
	6S5imYIVAZMM/3u2YM3NlMKnMAPXx90Y29qyjYjIltQKC1PLJHLE5QkAx/+41o8/
	cclLUVo8M87FlyD1zlS9yjKQppiviU5lx9WHdQA8tpG/ku058Id7crysUIa0Wt97
	DioJb8+kyAKg7xZqUlEzRl8KDgnCMfxXRPMacKc4xsWxeLMc9F3uYt3xxj+9SKK0
	0X7Kib2qOyivu1kby3VebNjBIUBM7zZ8Kvz3eoGxFB6lbT8S0bFRwgD8gOlLWT4K
	/OLGSPpXf71xRbbRMNBQakwNLBWTImVxZybXn9MVUErsizea0bqYjRCsbkBY0NP2
	WaoEUw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4123cugp5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 13:07:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GD7Jbq026094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 13:07:19 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 06:07:14 -0700
Message-ID: <cb665eab-ffeb-486a-bdaa-a69bdb681139@quicinc.com>
Date: Fri, 16 Aug 2024 21:07:12 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: vfe: Move common code into vfe
 core
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-10-quic_depengs@quicinc.com>
 <0611458d-b508-4e52-bafe-7f5612c63b72@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <0611458d-b508-4e52-bafe-7f5612c63b72@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VszRDPjk9uutn6tywO1YEUjSWRZIqLN0
X-Proofpoint-ORIG-GUID: VszRDPjk9uutn6tywO1YEUjSWRZIqLN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_05,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 mlxlogscore=741 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160095

Hi Bryan,

On 8/15/2024 8:09 AM, Bryan O'Donoghue wrote:

>> +
>> +/*
>> + * vfe_enable_v2 - Enable streaming on VFE line
>> + * @line: VFE line
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +int vfe_enable_v2(struct vfe_line *line)
>> +{
>> +    struct vfe_device *vfe = to_vfe(line);
>> +    int ret;
>> +
>> +    mutex_lock(&vfe->stream_lock);
>> +
>> +    if (vfe->res->hw_ops->enable_irq)
>> +        vfe->res->hw_ops->enable_irq(vfe);
> 
> Right so generally speaking I don't believe we should have any null 
> function pointers.
> 
> We just mandate that to be comitted, an impelmentation must provide a 
> dummy but, in this case when do we ever want a dummy function anyway 
> surely enable_irq() is a fundamental operation that is core to the logic.
> 
> Also a style nit-pick if you get a hw_ops pointer you don't have to jump 
> through so -> many -> indirection -> hoops.
> 

Ok, I will declare the hw_ops first.

> Code will look neater that way.
> 
> I'll go through the vfe_enable() stuff in more detail on your next drop.
> 
> Please ensure again with the hw_version() that you have equivalent logic 
> before and after => no behaviour change similarly with vfe_enable() and 
> friends.
> 
> The objective is to remove code duplication, not to change logical 
> behaviors at all, no matter how seemingly trival that change might be -> 
> hw_version 0xsomenumber instea of 0xX, 0xY 0xZ
> 
> It probably sounds dogmatic but, its safer that way.
> 

Sure, I won't change the original code.

Thanks,
Depeng

