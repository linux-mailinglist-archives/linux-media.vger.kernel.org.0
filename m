Return-Path: <linux-media+bounces-17033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD59629EF
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F1D283188
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE49B18A6DC;
	Wed, 28 Aug 2024 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CKPsk5hp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07F189512;
	Wed, 28 Aug 2024 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724854319; cv=none; b=hYEq4EfP1s7+Baeu8T/4PPfUooevorSSe2DQWWw/SYjbtiE4iF/mTDIPotqR74Igh4wqH13Zf2V90SRyrXMkBpNxLvYt/kKdt1bhh9KqoKRm4vY1qYkFsv3slofEAbPaygSXRs8tn84BVi47pKoElDtlVRFDpiL6EPVS2EcAmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724854319; c=relaxed/simple;
	bh=JJXWJoMrNO4Gsh8t4+ahvDypothpTM3jC9jnVIAl5lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fbkud9uBNbNygJ4h4rtYLDCsnlrXKxgh13lz6krh8vpaWL+ha4w9fhzdmrxENB0+kvZ3sn/8h3OZrjUu6a4k1otGL4JLTBGdISm5Ug5duj3XIDTO0G4wEyjeKwP84TzuP/I0NODtbrOE3lz6Vk/wt8/3PyvRcHkNo/M69lQfEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CKPsk5hp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SAxrNC027129;
	Wed, 28 Aug 2024 14:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iHlp1ibTvLljzJlqeVILbKdL42Yrm6BLUJ7+iaPpLA=; b=CKPsk5hp45xucro4
	MUjo9sRzqPhSl8xFi5KXLgAsEc33GM5VjDQcMQlSf/39zKlfR7VfvdMCjHawSGpe
	PUYmVNEW+feLsQ6RkGbjoWMqc2Bcr7euLGGEN9Ayffa4b88ReqgguexQ2P3WbaBT
	iXfZm/lPyZZ3q9gxR8teTImGxuJ13kgT86+3gXhZ3Z23Qbkne+pbyb1EwR9dNabi
	Qx5j3hYlWYfE176gVSFvDXrEs9iTIG5USvKrQFYJCXUTUzO2/aygHVYRnosqiUYP
	aZqUd9zRgLW5D8q847IDlLphskBQW+t+sqogtfLRFlx4CiAwJ+FnTeQ9O8HbgN2a
	HCYO9g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putj0e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 14:11:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SEBqmE004256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 14:11:52 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 07:11:46 -0700
Message-ID: <23a8b53e-ae33-4f93-a1b9-3af2d37a4063@quicinc.com>
Date: Wed, 28 Aug 2024 22:11:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-6-quic_depengs@quicinc.com>
 <cc1484d4-7a61-4f5c-b617-a6ad99985bda@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <cc1484d4-7a61-4f5c-b617-a6ad99985bda@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TrEyfmn-pGeFmZMd3FdrZmj9MjzrZCXl
X-Proofpoint-ORIG-GUID: TrEyfmn-pGeFmZMd3FdrZmj9MjzrZCXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_05,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280101

Hi Bryan,

On 8/19/2024 8:01 AM, Vladimir Zapolskiy wrote:
> On 8/12/24 17:41, Depeng Shao wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> A .data field in the csiphy device structure allows us to extend out the
>> register layout of the three phase capable CSIPHY layer.
>>
>> Move the existing lane configuration structure to an encapsulating
>> structure -> struct csiphy_device_regs which is derived from the .data
>> field populated at PHY init time, as opposed to calculated at lane
>> configuration.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 55 ++++++++++++-------
>>   .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>>   2 files changed, 36 insertions(+), 20 deletions(-)

>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/ 
>> drivers/media/platform/qcom/camss/camss-csiphy.h
>> index bdf9a9c8bacc..cac1f800b7d8 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
>> @@ -95,6 +95,7 @@ struct csiphy_device {
>>       struct csiphy_config cfg;
>>       struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
>>       const struct csiphy_subdev_resources *res;
>> +    void *data;
> 
> I would suggest to make the type/name above explicit:
> 

I will follow Vladimir's suggestion to update the type/name, please 
reply this mail if you have other comment.

Thanks,
Depeng

