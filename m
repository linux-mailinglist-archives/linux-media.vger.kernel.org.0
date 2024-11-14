Return-Path: <linux-media+bounces-21397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804B9C82C2
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 06:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C041B26EC7
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 05:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112ED1E9066;
	Thu, 14 Nov 2024 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BsYHpOIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B5654723;
	Thu, 14 Nov 2024 05:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563289; cv=none; b=b7KSD0usYw3voXZ4F2IJzebYne506GBZhWxAosJSOJPrjj32xbkRWHkg8g+dfsOv4RPfeDD3rWt2Ml/nZNW3vwK8yDxRIeX3joz1W33ehCSENP368rXvASo4RbnCHjY0DBsj8TpDJK57E1lAXrLjws2qsPWEABStxHx3W9sVfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563289; c=relaxed/simple;
	bh=UUVZ+s2eWTJ6wFBSTgTKNpdW/n+MH5XoZgb7GGA1Aik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mg4hEzoc7YvhVylPU2tqER5X4Gdl8LaEaDmGpD3qBMgmMQIkmNWAIpGw9Kjw6ZpF2pb2mXSnP/2DGroQVw3OQgN9kM5uBtMHOAOg0NoavnyDJ/7EAFHjze1XNN3OpQc0DvXpsUE6VdgYC8mkywN9t/SVhX/PYwssG9HRk+/OSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BsYHpOIO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1OGh021963;
	Thu, 14 Nov 2024 05:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IMgdQNRR4Zb4R3bPlJdvqkt3knnF08Yoqh+v3Bhu1c=; b=BsYHpOIOJoXcSts8
	sVe/nAhbp5RDsBLiwImqDBBPK/o5GXynvN33N0AsfxlAI9uyx16p4Ar5i7k9XcRH
	wtYCcCBtMTCiApD8wnEpzLGRtSVc63ehvv2Y6O0ZhMIJV7u23fLV9KVXp6lJXpkM
	XdOwAKSAhaOMCin1xGGRpQCZNAWEgpJC8uArK5T354pqOZ8jOZ1YECBjgbBszQy4
	geOqwMY5Z7rutDa1elQP0LLUQGLwm75iDgRwtsIMDsvOwxwbS05dVedOZYubKrpc
	btsXdMcVgkhO/fpqxfnvRYDvxrTa1lHenZQJ+nz7q3WvVawX04WaumTkK6iwUoK2
	zdNUxg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsg52ukg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:47:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE5lga9030126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:47:42 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 21:47:37 -0800
Message-ID: <1e88f7d3-7823-d550-f0d1-5f50cfee79ac@quicinc.com>
Date: Thu, 14 Nov 2024 11:17:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 05/28] media: iris: implement video firmware
 load/unload
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-5-a88e7c220f78@quicinc.com>
 <537ee97b-97d9-4ed8-9e11-eb3489eeff26@linaro.org>
 <f16dac0e-aa0f-5984-2cee-3e4e684e93db@quicinc.com>
 <be7b67ce-f601-4c93-a8b6-b5660f0e753e@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <be7b67ce-f601-4c93-a8b6-b5660f0e753e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UZtjmgRLpOc45CpiWXNB-V2VRFt_GfPV
X-Proofpoint-ORIG-GUID: UZtjmgRLpOc45CpiWXNB-V2VRFt_GfPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=828 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140043



On 11/13/2024 9:26 PM, Bryan O'Donoghue wrote:
> On 13/11/2024 05:20, Dikshita Agarwal wrote:
>>>> +err_put_node:
>>>> +    of_node_put(node);
>>> remove
>> Sure, Will make the change.
>> but are we just trying to avoid using "goto" here?
>>
>> Thanks,
>> Dikshita
> 
> Currently you'd be leaking because you only do the put on the error path.
> 
>> +    rmem = of_reserved_mem_lookup(node);
> 
> of_node_put(node);
> 
Ah, Right!
Will fix this

Thanks,
Dikshita
> ---
> bod

