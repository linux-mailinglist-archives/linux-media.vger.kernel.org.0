Return-Path: <linux-media+bounces-17637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9977196CEBB
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 07:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3C52815BF
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 05:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE8189523;
	Thu,  5 Sep 2024 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="psqQq3ku"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C7621;
	Thu,  5 Sep 2024 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725515293; cv=none; b=pL2/4zHIqGXxqSTBdM+f+EAi6cDD/erPhtVsUtC7HmM1/xr3pE3IaWj8wG2c7mniqgOcC45V7wDRSgroqTMkMIeNwXmJeQx2FvlAXSEZR+AWThKLBAU4HvD7zqy0j976fgRTMU6f8oUDs5QHPaUKfiDXxTFLWzFr+FiXdfozOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725515293; c=relaxed/simple;
	bh=5zTPWjKAM7d+wRqP8nC+qU/IRqwRn348++OHKbUOlcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=axdroXQBtK0prLRkurvQZmSDWRJbmwXqOAnXYeiwjwAut5SfQSSQcUWBAgTUcsemrZ2SNDy4TVVEMNv75ebR/gS8Dcbf+uX3LzFOoYv3cwg6++rkfdc+EdnaylE/UtAmchK4ZYoQb8S9GmJ75zLocQlwbL1YGlxiqRTbBUrbaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=psqQq3ku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484L488H024309;
	Thu, 5 Sep 2024 05:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxoU3VAhg+dJLVK8CVBfig5iLDsWG2NthGmgKGRMOjA=; b=psqQq3kuT9sf9boL
	LKKtqT0aJoVjZDMFzGHp/1CaNU92s252BBrvw9eRBI4ibezT2RT5uQIDroA8CRAB
	wd14pjeHOnnolbcyIUUL5Goy+jgTiqlpiqMqKN+Izjs9kPwmWNHBcYooZf03kHJK
	pvHRLDm5dWm92qRxSVyPPnvoMrIEfvcXtRa+YxEeLkPqB143osQeZb5Uezq/pHak
	JIf8H5I2oMVQdZoUZ3LhxCHFDPkpf2YkoBYlKeCx1s0u8r+NTW+8JjUFBo4sxqA1
	GBLsb1Z4PIXWFuAe243sxbGRyMSpDgcKEJ6NZ+oLl83b15asoftVn91vns1pAdKg
	6RRwyQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxvvuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:48:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4855m3qT012633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 05:48:03 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 22:47:58 -0700
Message-ID: <809c359f-6c24-f2d4-3c4b-83e543d8c120@quicinc.com>
Date: Thu, 5 Sep 2024 11:17:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 02/29] media: MAINTAINERS: Add Qualcomm Iris video
 accelerator driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-2-c5fdbbe65e70@quicinc.com>
 <afba364d-8299-49b6-9848-ed1660f86327@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <afba364d-8299-49b6-9848-ed1660f86327@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Znh6gIFAnIYYoXUm3QexFk5APCe6sGaG
X-Proofpoint-ORIG-GUID: Znh6gIFAnIYYoXUm3QexFk5APCe6sGaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=976 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409050040



On 8/27/2024 4:12 PM, Krzysztof Kozlowski wrote:
> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Add an entry for Iris video decoder accelerator driver.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  MAINTAINERS | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8766f3e5e87e..105e67fca308 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18898,6 +18898,17 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>>  F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>>  
>> +QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>> +M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>> +M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
>> +R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
>> +L:	linux-media@vger.kernel.org
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media_tree.git
> 
> Drop, you do not maintain that Git tree.
Sure, will remove
> 
>> +F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>> +F:	drivers/media/platform/qcom/iris/
> 
> Drop, does not exist. Or fix your patch order.
Are you suggesting to add this patch as the last patch of the series?
or remove just below entry and add one more patch at the end to update
MAINTAINERS file with the same?
+F:	drivers/media/platform/qcom/iris/

Thanks,
Dikshita
> 
> 
> Best regards,
> Krzysztof
> 
> 

