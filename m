Return-Path: <linux-media+bounces-13539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE9A90CB79
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951E4282007
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3F5137905;
	Tue, 18 Jun 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XzKmwjn8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353A7345C;
	Tue, 18 Jun 2024 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713131; cv=none; b=RxdTEftMFWwYjxM5BONtkOXDGwL79coee2bFNKx652UyiMB6IOUNNLKYxQhmkz3lcczNA3d9xhmKu+nT2Bvm3feTgt1B3294wtaySikGL8RNQYjbt1Zjwk8icNOzv8EpvUZuRKJ/JuSazzen9tM5vM95iySxUc5aLJ5RrFpnERM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713131; c=relaxed/simple;
	bh=D8ihPWEJhdRpdyr1SOcn0c/tZezPRDWNeLvq29yLwFY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=IS4GX6zEySKGK2clnJnpYJhMrC14U/EhB9fvLbo1GFmJEpRTcXZkADjVTcof4vWla++2R1Uv1D5ez7vmJUlf3sNzD3H/5sgY2i2Dqf0HZ4Q9Xy1jREmB8apXgby8s9p7m/RUgWwToRryVwRFz4bCIO/UEkKSKiy/6GoBA+GiQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XzKmwjn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8c479009345;
	Tue, 18 Jun 2024 12:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsIQfOWwO2j2+yCOfMgo3UpYsU+EIIQ8PzJUT46lHfc=; b=XzKmwjn82tpHMaiP
	OesFIqHOATmGZ5QOIwHJTbXvK+m7vPwABhRsB7pJmAO8xdznEeICQ14fQK7UbfAV
	+c/jijroy/AFlG2lQFK516aDva71S7u4fgxTPZzgUOTdWpF64fuCMbNDJrgrHndZ
	Qi8lXb9LWJV7fgf7CM7Flz9VAsjtIkKmKTuKIkvwnv3tskE1y8JHl4/CK4Bqql1P
	B685u0RvInueDejUtBIptomhkp24RGTg3xC02VZj09myPPNFbtJhaGhzJssaxDoj
	yxAjPT1RsnP6bQ7dMxknVlN/9/GraKMWq1OB1z0bI1XxA5E5IKUqo4cJtWfdmPFq
	bp7pPg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu6wa8mtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:18:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICIOOM006098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:18:24 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:18:19 -0700
Message-ID: <b5c29e6d-ab5f-9a06-081b-c9911416e86e@quicinc.com>
Date: Tue, 18 Jun 2024 17:48:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/18] media: venus: Refactor struct
 hfi_session_get_property_pkt
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
        Michael Tretter
	<m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-12-cda09c535816@chromium.org>
 <1d952b60-7042-bef6-443d-325de75a864d@quicinc.com>
In-Reply-To: <1d952b60-7042-bef6-443d-325de75a864d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uj4bT3wkbBzhfhX9mkW8WwTjetyAmCT9
X-Proofpoint-ORIG-GUID: uj4bT3wkbBzhfhX9mkW8WwTjetyAmCT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180091


On 6/18/2024 5:35 PM, Vikash Garodia wrote:
> 
> On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
>> The struct hfi_session_get_property_pkt is always used to fectch a
fectch -> fetch

>> single property. Make that explicit in the code and avoid a single
>> element array at the end of the struct.
>>
>> This change fixes the following cocci warning:
>> drivers/media/platform/qcom/venus/hfi_cmds.h:194:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/platform/qcom/venus/hfi_cmds.c | 4 ++--
>>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
>> index 3418d2dd9371..75f4a3d3e748 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>> @@ -402,7 +402,7 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
>>  	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
>>  	pkt->shdr.session_id = hash32_ptr(cookie);
>>  	pkt->num_properties = 1;
>> -	pkt->data[0] = ptype;
>> +	pkt->data = ptype;
>>  
>>  	return 0;
>>  }
>> @@ -1110,7 +1110,7 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
>>  
>>  	switch (ptype) {
>>  	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
>> -		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
>> +		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
>>  		break;
>>  	default:
>>  		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
>> index 6dff949c4402..f5708fdfb197 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
>> @@ -191,7 +191,7 @@ struct hfi_session_resume_pkt {
>>  struct hfi_session_get_property_pkt {
>>  	struct hfi_session_hdr_pkt shdr;
>>  	u32 num_properties;
>> -	u32 data[1];
>> +	u32 data;
>>  };
>>  
>>  struct hfi_session_release_buffer_pkt {
>>
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

