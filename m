Return-Path: <linux-media+bounces-31841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF0AAC2E0
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 13:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ACDC1B68A3D
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 11:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1718D27AC20;
	Tue,  6 May 2025 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j0w/eYBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB0A217F46;
	Tue,  6 May 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531658; cv=none; b=dvZqJlBMqD5rMD40NuvTTUGWJaNNsygmSXZS6DRyJG7vsfPb92teiTJzYA7rP/73uNK2HmufBJuX14Jt+GXmmthtTNjs2dBXj3oyUPDRtWgi1dO7+3P2Xj/v5OfdyM0RCW7WYiuVpWZ6J8hIgKNdD55tzizYdeXOUnH1gRqN9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531658; c=relaxed/simple;
	bh=Ed88oetsz9wlCSH0SmjZiuB5Oln0Rxz0W5vzteG2fZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tNfLWNwTNa3BWMSeuWuDjoX7qOznu9tYep3peh/ErQRv2ravs8X1UBlGFIbQgvLRqzIl8M8NbaJ6YVvVezwLRAfCRXyZRzjjpMOo/a7+G4EwRTlWFoRMD8usHb5fqRkWJzoqSGz2BCUf+YzfwTCJjsQeqmc1TE4QfA1mKWwWpJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j0w/eYBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468fHxf028727;
	Tue, 6 May 2025 11:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Im3uw8NKOSgvVb6WK1S3zOgojGT8/zc5ELOc1okV9sk=; b=j0w/eYBMrnjaKCkg
	mz21cdMJrEZqYrWkdXeiYqVlOZSEP3Y1SdnPLj3stlmDjsLqQ0z+PTFvWxwEeyrY
	Cwh7J/iCm5mPnwVVGzH4zq0b/rjLaUuvWDadAe2JhSxzznMFZSbmcNwRH9ro9BRR
	Hb2Zx/Opy6Zt5S8GKTtYFy8p1dI0F4ecmUiDHfXxLsGvRali4wk2z1U0iRyU42SR
	IwZ8nNV/K0YHS5qeyjIYB6Msw1fyXnyr6YpnXhBSTAZ6JV2LQUTbZ/O94pZDlElZ
	8nUnK/bQCHJYKOnPjjmzM2RkK4dfcbcwNiflr6lwi3c44JB+rdiECcUn9sHKoQJs
	epCzkA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv2491-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 11:40:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546BepK2007618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 11:40:51 GMT
Received: from [10.50.35.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 04:40:45 -0700
Message-ID: <29d8792b-cf1d-ff20-6aa9-88ef6e39751e@quicinc.com>
Date: Tue, 6 May 2025 17:10:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/23] media: iris: Send V4L2_BUF_FLAG_ERROR for
 buffers with 0 filled length
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
 <1b204ed7bc63373f52973b96af68e64e24be8cde.camel@collabora.com>
 <36757fb1-b1a9-5b49-c5b8-62cde4dea1c5@quicinc.com>
 <fc4d70d3d3a98da8c0a8679bcea87d8d1e83fc5e.camel@collabora.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <fc4d70d3d3a98da8c0a8679bcea87d8d1e83fc5e.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h74QdcyonXVR8xMB7aK83273XFq1NyOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMiBTYWx0ZWRfX2LR8gdOe7kBv
 lea5qwawzYXprPF3DvbkDEpT96LM1Hc5QuCV0cB72PXJj0/IGZIqkuDIF9a3SksIZLQqI5Bc+Oo
 g8CbyhThDhuWYF9y02C7ZxYF5mpw5Yq7dvNuxZKtX+R8smEkMvHZpD3KdEm9u/YQtFOuUSXSlBP
 +2G2zaskrGQ4yqFgb79s7LZdsbhjRX9BogWk0DlBShx9KwuQWZlDZ8oAg6Px95hpGwT6maxnf+W
 hwosIo053td9ctl+LEcGmbjaQsc6Vso9FdfJ0+iR0HtWWQfDYx0T0PD4XPVeSYS9QrxITufK2Qm
 KDsFXw1PqAqZ28Kdf1b9yuUevg6DKX7xr4HcMv0ZGqWt0PnhGlrwX7qnctmHbg+j9YPnMxA9mWN
 YC6n/OfRRL0a6X1mdSYJY7fQ5TkOXDBdTH+ci2d1QuQtPJhP/eqvSiaiA2Y2R2gb5sUZ58+U
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=6819f544 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=uSiamyEwBMr1O7zqun4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: h74QdcyonXVR8xMB7aK83273XFq1NyOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060112



On 5/5/2025 6:07 PM, Nicolas Dufresne wrote:
> Hi Dikshita,
> 
> Le dimanche 04 mai 2025 à 20:53 +0530, Dikshita Agarwal a écrit :
>>
>>
>> On 5/3/2025 9:39 PM, Nicolas Dufresne wrote:
>>> Hi Dikshita,
>>>
>>> Le vendredi 02 mai 2025 à 00:43 +0530, Dikshita Agarwal a écrit :
>>>> Firmware sends buffers with 0 filled length which needs to be dropped,
>>>> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
>>>> Also make sure:
>>>> - These 0 length buffers are not returned as result of flush.
>>>> - Its not a buffer with LAST flag enabled which will also have 0 filled
>>>>   length.
>>>
>>> This message is quite vague, is this about capture or output buffers ?
>>> If its output buffers that don't produce capture, I don't see why they
>>> have to be flagged as errors, or why the payload size matter. Then, if
>>> its about assigned capture buffers that did not get used in the end, you
>>> should put them back in the queue instead of returning them to user
>>> space.
>>>
>>> Returning a capture buffers to userspace should only be used if a frame
>>> could not be produced. That imply copying the cookie timestamp from the
>>> src buffers into the capture buffer. Please make sure you don't endup
>>> returning fake erorrs to userspace, which may lead to some frame
>>> metadata being dropped erroneously.
>>>
>> The capture buffers which I am trying to handle here are of 0 byteused
>> which means they don't have any valid data and they have the timestamp
>> copied from src buffers.
>> How these buffers will be handled by client? if we don't associate error
>> flag to such buffers?
> 
> Please share a link to the stream and specify which frames are handled
> this way by your firmware. The answer to your question is entirely
> dependent on the stream you are decoding.
> 
one such stream is
JCT-VC-HEVC_V1 -tv NoOutPrior_A_Qualcomm_1 (fluster stream)

for this stream, POC 17, 22 and 24 are not supposed to be displayed (output
is false), the corresponding capture buffers are returned with 0 filled
length by firmware to driver and expected to be dropped by the client.

Thanks,
Dikshita

> Nicolas
> 
>>
>> Thanks,
>> Dikshita
>>> Nicolas
>>>
>>>>
>>>> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> index 4488540d1d41..3bb326843a7b 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>>>>  
>>>>  	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>>>>  
>>>> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
>>>> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
>>>> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
>>>> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
>>>> +	}
>>>> +
>>>>  	return 0;
>>>>  }
>>>>  

