Return-Path: <linux-media+bounces-26490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB49BA3DE6E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16AB716E4DC
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CFC1FECC1;
	Thu, 20 Feb 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E4RJ4BhS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4461FCE;
	Thu, 20 Feb 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065151; cv=none; b=OLxYydejTROlmYoll7N47HRtdyRMXdol8BUVxAMNkYOYywm7K/jJ9vAgv+WgVqj/jeQGwU7H1msNvgjuEwARgXyHRHTN/86f/RP2B+uvYHhJYguSN4gAtnS/RpI81TwNuyU4aUOcoPW8WvCw7aQrgte/6UoJZQdOzlUIIgF3n9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065151; c=relaxed/simple;
	bh=aUV7XJHURqIqXA9IYJs/KCb516w8a2NMURdCektzsOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=upsgzPtSVuCAyFiUNMsE5ZkZWftvcSJnKAPmmeh/Rx5cPV4XP0iWesjxx0w7AsfjZUKuOtUSS8QBVKuwHqYC8RBYfI1Evan9kIzIRD2lwE4vXCKMbnRR17eu9gaPljg21BQN751nftHOFYOAlT514jjCMQXxQkO2PTVi9VwSnB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E4RJ4BhS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6opK7015969;
	Thu, 20 Feb 2025 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fz4PC2JqTy47/xiLWsMkpo8LYjL/Gtss7Ry2BGuMDuQ=; b=E4RJ4BhS3XaD/3r+
	IXQP14w2Bf9YAyaQrh7F54u+8rt+ncSf3ulMlObCKFrclaJXzshqNJKCUVfqy3db
	cq0mniBh6f0ijR5su2IJCJO2R1jOp68aTIEWhoT3fjKPXPSPjzNi0+H1dN08g+Gr
	rjgV2ndf/nEaslqCiStmloH5e69UT3wU4saKnOPIAkHaWsi4EB1hU7Ddn0mP2By8
	Akt9xsEqUo91/boti9dMxd9/8+ElYfjqmxjfsMXckMBX0vE+AA3+2xjPTV5GC+tN
	vni8ghawmQ46WAhlb0sRb3uDjKRctKYrz+9Jv+8ykbnSIorJwMWnFG/RLT9UizyA
	fD+kFw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4ejub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:25:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KFPhCZ008943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:25:43 GMT
Received: from [10.216.21.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 07:25:39 -0800
Message-ID: <f5d5f17d-3059-8f3b-1258-1c21c934952a@quicinc.com>
Date: Thu, 20 Feb 2025 20:55:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/4] media: venus: hfi_parser: add check to avoid out
 of bound access
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-1-522da0b68b22@quicinc.com>
 <41e9f6a8-1f72-465e-b6c4-0bebdc462d31@xs4all.nl>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <41e9f6a8-1f72-465e-b6c4-0bebdc462d31@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DQUG7MeI492akoUHSJSIjld0krpIOjRP
X-Proofpoint-ORIG-GUID: DQUG7MeI492akoUHSJSIjld0krpIOjRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200110


On 2/20/2025 8:46 PM, Hans Verkuil wrote:
> On 2/7/25 09:24, Vikash Garodia wrote:
>> There is a possibility that init_codecs is invoked multiple times during
>> manipulated payload from video firmware. In such case, if codecs_count
>> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
>> access. Reset the count so that it always starts from beginning.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/venus/hfi_parser.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
>> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..1cc17f3dc8948160ea6c3015d2c03e475b8aa29e 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
>> @@ -17,6 +17,7 @@ typedef void (*func)(struct hfi_plat_caps *cap, const void *data,
>>  static void init_codecs(struct venus_core *core)
>>  {
>>  	struct hfi_plat_caps *caps = core->caps, *cap;
>> +	core->codecs_count = 0;
> 
> This really should be moved down to before the 'if'. There is no reason to mix the assignment
> with variable declarations.
Thats correct, will move it below.
> 
>>  	unsigned long bit;
>>  
>>  	if (hweight_long(core->dec_codecs) + hweight_long(core->enc_codecs) > MAX_CODEC_NUM)
>>
> 
> Regards,
> 
> 	Hans
Regards,
Vikash

