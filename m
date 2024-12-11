Return-Path: <linux-media+bounces-23190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E629ECCE1
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA03C2846A6
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 13:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2941229140;
	Wed, 11 Dec 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aiGlVvBn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CBC23FD26;
	Wed, 11 Dec 2024 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733922564; cv=none; b=o64mZirXh4ci2o6HBGaMuf3nFT8wxYtZU0hNMZsG4O/SeYJ6ATXFL4j1LMXOCUzQQCoHBKalfL9eV+bAUZOt7JY6XCa8H9WwBkOerRHBJ6NS95THIPnM70cjae3k8isZAPZA8SP+HOVxu81BKC1vsE2Ha7vUfS6eW7hx7OHo1tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733922564; c=relaxed/simple;
	bh=SXwxWPUxfjbFQeeE6nxx2F3ZpznqTytClHi08wiKhkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hvJg1b0oYH1zYWov9HGWOhhAhxRRl9uURSu/OiXB7wppHXpII5Q7FMAc/3ej6pZwlOEv0Jxt4/D+37GdROOIE7muB+rvUkJGF4ZpYwYcl50nvxvDgfuouGEld23at4tUetX9oiiwhjyBZr/DYQ41C6GinTd5vnUb3mlKuhFFuvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aiGlVvBn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB6xd3E032199;
	Wed, 11 Dec 2024 13:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFr8bdJ6Lv/ycMxAcCO4jzHxLdWwsDYPRMFnbHTyqnY=; b=aiGlVvBnVNQLKTWf
	tEWpCU+7NXBaUYbt+wH9sA099CmiDgjabfMkJDM0RZq76vQv4Z/mIZyQr4ZWvrMI
	UkQPB7qZzeLO81CT4Hi+nMyi0a/9zTMsjm7nNvAbQxu1zSUYbb7gcDaXg9ZZLbIm
	c4ZEAEbeMdRu+B67iN7Kp33OeyAArGr3YVIcr6+Hut6OYhk9F5ddCV/HJvNWSlUN
	pCITtyEodF+SsEhIp14tlkblrNHHsxiUFeQ7vazTyO08s3SVhgVXLMZ907SPHx5f
	j2Dk/Q/AxmjsCd/s52LpXQLCsVDOCTyHIyQCiyEPyusdm4uDj/P8T3jtGI+dSmut
	ifxNGQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8tvw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 13:09:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBD9DxH021759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 13:09:13 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 05:09:07 -0800
Message-ID: <3d0cac81-1ffe-4e7d-b009-78ec5241a3bf@quicinc.com>
Date: Wed, 11 Dec 2024 21:09:04 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: csid: Make TPG optional
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-9-quic_depengs@quicinc.com>
 <124bb490-58d9-4c8c-a83f-7c3d45f61e43@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <124bb490-58d9-4c8c-a83f-7c3d45f61e43@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wUH3p6xSXKZ-jjipihOkLhNLBz8EXF9M
X-Proofpoint-GUID: wUH3p6xSXKZ-jjipihOkLhNLBz8EXF9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110096

Hi Vladimir,


>> ---
>>   .../media/platform/qcom/camss/camss-csid.c    | 33 ++++++++++++-------
>>   1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/ 
>> media/platform/qcom/camss/camss-csid.c
>> index 6cf8e434dc05..2cb8c37982f8 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -838,7 +838,7 @@ static void csid_try_format(struct csid_device *csid,
>>           break;
>>       case MSM_CSID_PAD_SRC:
>> -        if (csid->testgen_mode->cur.val == 0) {
>> +        if (!csid->testgen_mode || csid->testgen_mode->cur.val == 0) {
>>               /* Test generator is disabled, */
>>               /* keep pad formats in sync */
>>               u32 code = fmt->code;
>> @@ -1042,6 +1042,7 @@ static int csid_init_formats(struct v4l2_subdev 
>> *sd, struct v4l2_subdev_fh *fh)
>>   static int csid_set_test_pattern(struct csid_device *csid, s32 value)
>>   {
>>       struct csid_testgen_config *tg = &csid->testgen;
>> +    const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>>       /* If CSID is linked to CSIPHY, do not allow to enable test 
>> generator */
>>       if (value && media_pad_remote_pad_first(&csid- 
>> >pads[MSM_CSID_PAD_SINK]))
>> @@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct 
>> csid_device *csid, s32 value)
>>       tg->enabled = !!value;
>> -    return csid->res->hw_ops->configure_testgen_pattern(csid, value);
>> +    if (hw_ops->configure_testgen_pattern)
>> +        return -EOPNOTSUPP;
>> +    else
>> +        return hw_ops->configure_testgen_pattern(csid, value);
> 
> Last time I reported about the regression here, it is announced as fixed 
> in the
> changelog, but I see it is not, unfortunately.
> 

Sorry, I just picked Bryan's standalone change, then forget your 
comments. Will update it in new version. Will set the tpg mode as 
CSID_PAYLOAD_MODE_DISABLED in configure_testgen_pattern interface.


Thanks,
Depeng


