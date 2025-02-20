Return-Path: <linux-media+bounces-26498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0EA3DF87
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33F83A4C4D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C9920D4E5;
	Thu, 20 Feb 2025 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CBn5mjLD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E921FFC75;
	Thu, 20 Feb 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066969; cv=none; b=ArFc2wJZdxCfehNG3KQ5EBtGDVb6pwEcGlqv8liZrmUGl6n7VA8HeOf4SNXzfMivJ/aRJ6KAWGRRgLwLnT3YgiVD/5fnEWRO//2jeRquj/I9WBRM9ZIBw2ilWFlS0ysM89CtJ99v0vtj997v94tM1LxdQJDS2KkIrwr2U4x5TR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066969; c=relaxed/simple;
	bh=csYMwQYi1/ukoONMPh7xjnuAaW6ABJTCc8Cmm3+Jzgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UCpIQ5+CAEpSvOOcATRWcFDLF7hnXkbEuq1WJ9f6dG83DQl+tSHbDi8z6osBdwqJfLQFbAldWUH5a+Rfk27uuDwo+YvAODNJfCDm2fOyy7gPUH3zmkVTXNp7+lFmMN226rBgJmtR4DBl3YGNIJzzh0mVX/cEPNGxH9xVq2q470M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CBn5mjLD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KFDd9x022494;
	Thu, 20 Feb 2025 15:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwUmOPS/L7EcNqYj17pKL2o1WKtP7IUxBa4fM6nNd4s=; b=CBn5mjLDlJQeazw7
	zS6GAfSqTqZJot++YjrV7BHDJzvN29yt5Ac4HlTjybPA020iTSszFpAcAeQ/na3P
	A8nEUM5irrW30EKbM9FUBtzw5PMUxrjeOjdjht5N+coKbpMdL9TIVRXa4n5yGFfN
	DfEkbS/DRn+EotOPCYpto7qaxgOLuM+jEycKkMiVAffnw6neSyLpmwzVol4gWCPh
	2xHqI0vBwSSRgwEx2RQDrPF1FdVS7OU28XYG4Zv0tJqI+U7TwEPDRrFgNc8jbUTC
	HY+T3qoy4HvqIhj8m4iFL2oqTOVGtVBJ8mcfosyMnUlHVifdjbsNHa37Qv9YA2z5
	aROr4Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3pqcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:56:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KFu0LR001519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:56:00 GMT
Received: from [10.216.21.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 07:55:56 -0800
Message-ID: <b1721d46-ffbf-e21c-ce18-e96e3e8ee35f@quicinc.com>
Date: Thu, 20 Feb 2025 21:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/4] media: venus: hfi: add a check to handle OOB in
 sfr region
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
 <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com>
 <e794c047-ab0e-4589-a1d2-0f73b813eacc@xs4all.nl>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <e794c047-ab0e-4589-a1d2-0f73b813eacc@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bt0_6-EXNdK8Sfwpl33svMnQiDYhg7yq
X-Proofpoint-ORIG-GUID: bt0_6-EXNdK8Sfwpl33svMnQiDYhg7yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200112


On 2/20/2025 8:53 PM, Hans Verkuil wrote:
> On 2/7/25 09:24, Vikash Garodia wrote:
>> sfr->buf_size is in shared memory and can be modified by malicious user.
>> OOB write is possible when the size is made higher than actual sfr data
>> buffer. Cap the size to allocated size for such cases.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index 6b615270c5dae470c6fad408c9b5bc037883e56e..c3113420d266e61fcab44688580288d7408b50f4 100644
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
> 
> If this is ever 0...
> 
>> +	if (size > ALIGNED_SFR_SIZE)
>> +		size = ALIGNED_SFR_SIZE;
>> +
>> +	p = memchr(sfr->data, '\0', size);
>>  	/*
>>  	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>>  	 * that Venus is in the process of crashing.
>>  	 */
>>  	if (!p)
>> -		sfr->data[sfr->buf_size - 1] = '\0';
>> +		sfr->data[size - 1] = '\0';
> 
> ...then this will overwrite memory. It probably can't be 0, but a check or perhaps
> just a comment might be good. It looks a bit scary.
Thats correct, it would not be 0 as its a prefixed one [1]. I can put up a
comment here.

[1]
https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/platform/qcom/venus/hfi_venus.c#L836
> 
> Regards,
> 
> 	Hans
> 
>>  
>>  	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>>  }
>>
Regards,
Vikash

