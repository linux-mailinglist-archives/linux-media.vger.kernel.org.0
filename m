Return-Path: <linux-media+bounces-20983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2A9BDF48
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B179284E76
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0AA1CC17B;
	Wed,  6 Nov 2024 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BP8788lp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F64192B61;
	Wed,  6 Nov 2024 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730877703; cv=none; b=N79ydiPY6nAZbD/yW6jvkCO4Rn8cz8OzktWY8TdGWn8QbrijdO+XCw9JhR8+9GeOpB88MNDgJgsCFyZWCGfo3OoejbzyTwxYzSxOvCuCiOrM7qWBWCcYwrsdEXG/Ruc6SECSMg52ZNuiDxltzz+ey+G8RzlFwiMsVIU1zChINgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730877703; c=relaxed/simple;
	bh=YNKf3BZI3u1WrgngoCNtp79cRg1OCQ5Qdn+2ucp/2K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oADkUBRbo04HFS8VEsplUiI9QLnppBM/YzvPabcmJsGHHTW13Od2POXMwbJK+0rbdxSSUOUiZol8Vjezem9GHu06bipUtaQ6690p5H1A746YjsqzNcR+zHOw+A/vHW8KhNaQFj5hbEUvisvQR/1uJ/Jqzc1u1wPYoW3bIJv8nEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BP8788lp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KpQqj004167;
	Wed, 6 Nov 2024 07:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	En6P/4Ux2VmeApA4xvzacrYMsGlncN/pQo65ukkibtg=; b=BP8788lpTZT7ZsrI
	kzHvJVHT6ju0Xbltd4GnFJwCFx+m8un0EGfpEIIBtHxGFNlXBK1PBPkCfJQUulcz
	SlWQkvSaNfbFuGbYhfnpZbFbVzpaZ9kKIRNURRm1QbPEacONC62Qvb+Co84pEOwu
	xMfiinPJcTXCwk5r8GpRTv/JTihkIJ5ZyA9D5zdlXYYnCzl/wkvxdWj9ngRFLXqe
	9F8S1aRS8NnmSqWWVAQAbI40jaDY2cvhE4/t2ZL3BnNy1rZKu3S2kaG3oIyTKg0Q
	royVoKtNPquGKgMoc8ua15TcPEjvxHEb4mPFP9M5o0XZW+1fDK07f6aKQgC6874V
	YVnyxw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbub2bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:21:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A67LOpx006493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 07:21:24 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 23:21:22 -0800
Message-ID: <1016831e-f3fc-2724-5005-4929badf4994@quicinc.com>
Date: Wed, 6 Nov 2024 12:51:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/4] media: venus: hfi: add a check to handle OOB in sfr
 region
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-4-8d4feedfe2bb@quicinc.com>
 <mthuolorbcsykmetqpfaaoyuxgjskwvtvtv4mfl235enlq7win@jdhn2s2cgmui>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <mthuolorbcsykmetqpfaaoyuxgjskwvtvtv4mfl235enlq7win@jdhn2s2cgmui>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ov67Aba6V2GYB1ge-DlSnOSSDUgjM1jM
X-Proofpoint-GUID: Ov67Aba6V2GYB1ge-DlSnOSSDUgjM1jM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=932 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060057


On 11/5/2024 7:28 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 05, 2024 at 02:24:57PM +0530, Vikash Garodia wrote:
>> sfr->buf_size is in shared memory and can be modified by malicious user.
>> OOB write is possible when the size is made higher than actual sfr data
>> buffer.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index 50d92214190d88eff273a5ba3f95486f758bcc05..c19d6bf686d0f31c6a2f551de3f7eb08031bde85 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
>>  {
>>  	struct device *dev = hdev->core->dev;
>>  	struct hfi_sfr *sfr = hdev->sfr.kva;
>> +	u32 size;
>>  	void *p;
>>  
>>  	if (!sfr)
>>  		return;
>>  
>> -	p = memchr(sfr->data, '\0', sfr->buf_size);
>> +	size = sfr->buf_size;
>> +	if (size > ALIGNED_SFR_SIZE)
>> +		return;
> 
> Why can't you just limit size to ALIGNED_SFR_SIZE, still allowing the
> data to be captured?
That should do as well. Updating above check to below would take care of it.
if (size > ALIGNED_SFR_SIZE)
    size = ALIGNED_SFR_SIZE;

Regards,
Vikash
> 
>> +
>> +	p = memchr(sfr->data, '\0', size);
>>  	/*
>>  	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>>  	 * that Venus is in the process of crashing.
>>  	 */
>>  	if (!p)
>> -		sfr->data[sfr->buf_size - 1] = '\0';
>> +		sfr->data[size - 1] = '\0';
>>  
>>  	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>>  }
>>
>> -- 
>> 2.34.1
>>
> 

