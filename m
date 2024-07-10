Return-Path: <linux-media+bounces-14840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B248692D0A7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C7A828194A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2410819047D;
	Wed, 10 Jul 2024 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SEihtFgq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10D18FC9E;
	Wed, 10 Jul 2024 11:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720610857; cv=none; b=X4M4kuNGoMhNhRDYCYvU5DLhKUyZqzqHoH0WT1YesIqSo1TBHV91gkQ1uepHlsp6nABbJPNA3kW0HwJJ9ST2c8S0O0oYRPHEveh3zdsfCBGt4GmuY9SenF6DinnhS6AlHjledYBd0E/uIYUnjtVbgcQ7jShGRsFHQOXwiy6qmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720610857; c=relaxed/simple;
	bh=7HW65aC46Fy441/fbPOqQ+AlcVAiKyLPoMZ44HnLOGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nzz6mT+M+pNy4s0+UndDutONaPOeHTz1HGRbY/80ZQBMGR1Lv3dicGcZ63N797ZkkNV3oTd8AwWHFmYAXhIpiYC2R4eHgBkvwRJCA2hXf8IwVwRJkha5IaQ51QrxHJFIXpXjuL2hfhx9FYvjNEkcEU57Cl4ltSJUxVrjijF/EQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SEihtFgq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A3F7AY003892;
	Wed, 10 Jul 2024 11:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpxodBtotGvIpVffqv8CzX155NnEOCfhisxhAlwWL4k=; b=SEihtFgqjonp2fYX
	7uYkm7u6bAiGw3Yu/u9ylDF3qHDnZbI3HJ/AcfU51Q6HHugw+1L30QmSYaZFyB21
	S+H/sS1cuR156jauMITwSjNx5j8KVyQSH2d04hX9YEWvh3YavLSqH9t2ZMaCVV6G
	/MwY2f16yiAjQzPPhymH2Q16oF10CY7Wnmczve1Rsk/2R6BpdUzCvIOTmZezug1z
	iPhM7D6JqKla6iXuaHEyo++gLoD+RFSpzZIK81eP3yl6cdeXN9u3nhyHPuCiJZTr
	ocEjooBdvB8lJVYy4IzuX4168NlIm/8S9fSSe914ZDl1ysy6sGhH/2pDGRkWltEh
	ObVzjw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0rc0sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 11:27:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46ABRUWk018382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 11:27:30 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 04:27:25 -0700
Message-ID: <d8d6574a-2823-4955-898d-d6637e40946e@quicinc.com>
Date: Wed, 10 Jul 2024 19:27:22 +0800
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
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <55e850dd-1b45-4bad-a11f-f645cca07f2a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HcG7iWEXqcvhA-xRNuhRGOMjkGkJtyWz
X-Proofpoint-GUID: HcG7iWEXqcvhA-xRNuhRGOMjkGkJtyWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=963
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100079



On 7/10/2024 7:08 PM, Krzysztof Kozlowski wrote:
> On 09/07/2024 18:06, Depeng Shao wrote:
>> V3:
>> - Rebased the change based on below change which will be merged firstly.
>>    "Move camss version related defs in to resources"
>> Link: https://lore.kernel.org/all/20240522154659.510-1-quic_grosikop@quicinc.com/
>> - Rebased the change based on Bryan's csiphy optimization change and add
>> these changes into this series, so that the new csiphy-3ph driver don't
>> need to add duplicate code. This has got Bryan's permission to add his
>> patches into this series.
>> - Refactor some changes based on the comments to move the random code to
>> patches where they are used.
>> - Remove the vfe780 irq function since it isn't doing the actual work.
>> - Add dt-binding for sm8550 camss driver.
>> Link to V2: https://lore.kernel.org/all/20240320141136.26827-1-quic_depengs@quicinc.com/
> 
> I asked for reference to upstream DTS - where can I find the DTS patches?
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Sorry for that, I thought add the dt-binding is also fine, since I saw 
other patches also do like this. Will add add the DTS in next patch set.

Thanks,
Depeng

