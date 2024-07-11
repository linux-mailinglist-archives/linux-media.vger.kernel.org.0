Return-Path: <linux-media+bounces-14912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2F92E656
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD52BB25FD4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B2816D336;
	Thu, 11 Jul 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S7stCx4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086715E5CC;
	Thu, 11 Jul 2024 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696470; cv=none; b=WgtNfA05EDLfrv87q3m5deq45F2UsG1kfE+j5KQ0SNAiG0vigaQSr+hYdeQmbOdLH4ejdLW4QI2ztGneW90NpabDYxTH4KPx1vUya5WB72Qn9Vas/0PDYa/NC0OLYPFPtMWx6WbIZ2GepjgEtg0dqK4r5hertdaTHRVJ5BdT9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696470; c=relaxed/simple;
	bh=ojExgSxv7HK1T6Of78y0TLEr332VUmoqzlLiLXM0IJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qYBAYIcK8Zj2wsvWn19O9HMLkZq3f2pbx5pFeMwNEhHU2ChEtjLSL/gzdzH4Hbiagcw3z52/aZvXJW9luGVfIM+z4qwUY9Bf/NGTxBbrdhdJYONy7IG0MOxfkjkZhyE+qPZW173tGD3uiX7CrxjyJlfJWwWxqkCFtMit+fgKRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S7stCx4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mo0X011655;
	Thu, 11 Jul 2024 11:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpkcDIuzdPc4JQfo1GuwWE0pqv1GLcWVFeXFcswOLx0=; b=S7stCx4U2p/Qa7gZ
	gBnMujhWMSGkNdo+T4StMZ72EU4ixY93ovjIFVvZ1DbRetipl+I7HdYlGrsnD2EB
	jQZRjK6o3Vh4EPX0sYi3p/gNKuIMQYvXF96NZAEw82HtOwFidBHWNQ/FXaTqfqr+
	eY1x7bA7CVdjmwNl7ayyLt//NVjmcQbQQGtpUotsV33m3o7Zb+mbIiG8lRxO9ewN
	SQx83oWXNNtxuW2oeLajY1AaP9SxX8MvmRArnYlieI/kL7lKDsmHLepGvaPlJN3n
	Q7s7JhkI5zWdEvXyMlQ7vbC7Bxj+vX3LYNA3XI4UvgxtSxq3dAIz/gpb0Il2oD7m
	To+nBA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwv5up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:14:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BBEME5017097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:14:22 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 04:14:16 -0700
Message-ID: <0324e8e8-2ad4-4ce6-9616-3038b8e02ff9@quicinc.com>
Date: Thu, 11 Jul 2024 19:14:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 00/13] media: qcom: camss: Add sm8550 support
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <55e850dd-1b45-4bad-a11f-f645cca07f2a@kernel.org>
 <d8d6574a-2823-4955-898d-d6637e40946e@quicinc.com>
 <d72ec08a-bd5c-482b-8af9-3fc923820d25@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <d72ec08a-bd5c-482b-8af9-3fc923820d25@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -CdDd2WTXGQH3GY0bfTBXA0OT1tWhIUC
X-Proofpoint-ORIG-GUID: -CdDd2WTXGQH3GY0bfTBXA0OT1tWhIUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=981 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110079


Hi Krzysztof,

On 7/10/2024 8:30 PM, Krzysztof Kozlowski wrote:
> On 10/07/2024 13:27, Depeng Shao wrote:
>>
>>
>> On 7/10/2024 7:08 PM, Krzysztof Kozlowski wrote:
>>> On 09/07/2024 18:06, Depeng Shao wrote:
>>>> V3:
>>>> - Rebased the change based on below change which will be merged firstly.
>>>>     "Move camss version related defs in to resources"
>>>> Link: https://lore.kernel.org/all/20240522154659.510-1-quic_grosikop@quicinc.com/
>>>> - Rebased the change based on Bryan's csiphy optimization change and add
>>>> these changes into this series, so that the new csiphy-3ph driver don't
>>>> need to add duplicate code. This has got Bryan's permission to add his
>>>> patches into this series.
>>>> - Refactor some changes based on the comments to move the random code to
>>>> patches where they are used.
>>>> - Remove the vfe780 irq function since it isn't doing the actual work.
>>>> - Add dt-binding for sm8550 camss driver.
>>>> Link to V2: https://lore.kernel.org/all/20240320141136.26827-1-quic_depengs@quicinc.com/
>>>
>>> I asked for reference to upstream DTS - where can I find the DTS patches?
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Hi Krzysztof,
>>
>> Sorry for that, I thought add the dt-binding is also fine, since I saw
>> other patches also do like this. Will add add the DTS in next patch set.
> 
> DTS should not be part of this patchset, but sent separately.  It's
> enough if you post a lore link to it.
> 

Thanks for the explanation, I will post the link in new version series.

> Best regards,
> Krzysztof
> 

Thanks,
Depeng

