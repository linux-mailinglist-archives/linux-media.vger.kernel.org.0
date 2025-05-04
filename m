Return-Path: <linux-media+bounces-31674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A1AA8746
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 17:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 794D93B37D8
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 15:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804231DB13E;
	Sun,  4 May 2025 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CcTO0zei"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E81D5ADC;
	Sun,  4 May 2025 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746372199; cv=none; b=XVDbd2U/n9njN37cJiBy3Qci9Wna4mI4oAlkhd9NDKKCX27HARIG66PsHXqhcItE/9837rTgamMKsIDxTnI6Xss080Jiz9uV82C9eB8+ZTqH62chEHIXMPDy7orwgbwPIqmwSFbDmQyNd9qixPWFjkWnY+45NqZH0rEEBz6eafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746372199; c=relaxed/simple;
	bh=XEwlcJCA5Da41SdMBLYzYGyCaFgKHLG5pnLQnEwVluY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q2jRNsuz77rH+4TsKo1ftmAO6yGYfPBfy8Xf1jcE90UE4ywr8xPUi+UuU2As4xyz2qUscgCSHXMVxY1o6Oad5KcWVee55IIfi3MftaZe1uKOO4mMtNnWrGc6oB1PZIyFzNeUEJMTtfP0er12znRh5SUJsAfx0/1lk3tySMWT0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CcTO0zei; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5449HoAu015704;
	Sun, 4 May 2025 15:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9ZECEvCO6mT81rT0VaO77s5JpEISdiJilPBgZHWCN0=; b=CcTO0zeimd7ggz7+
	7fjF7U5muBhNPijAjRnh3oUdkv/rFhBNlIQ30HAjr7FWlSA8oBs4X9PUYVP37ArS
	fe3zoS5suCUGDTeRI/N6unmRZ9GeIH3Uveh0tykIpZ22gs9ZU8DggIK6kGfawvj4
	GB6m9oGmeinWtMvYuboJyyzm6vFxFTfNgZ82x+uGm/Ofp3TQVjBySanoJpShAE4Q
	292B/oC2TS4UGP0eVGp8l8w3h19g6AnhCw+7xIjV9ujY9xbYQFcamvnP2iLP9JMu
	MtqSWl+SBgEs+qRMgPSM67HoMlGMwHHNDXDijJNjACxW0li505i2jd8vdXeRyJXJ
	5rRt1w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t5c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 15:23:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 544FNBuY019445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 4 May 2025 15:23:11 GMT
Received: from [10.50.60.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 May 2025
 08:23:04 -0700
Message-ID: <36757fb1-b1a9-5b49-c5b8-62cde4dea1c5@quicinc.com>
Date: Sun, 4 May 2025 20:53:01 +0530
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
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <1b204ed7bc63373f52973b96af68e64e24be8cde.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0NCBTYWx0ZWRfXyJpsbDNgig2v
 MQQrh8FSydxA1YaPgsJdWa1dBE2hGK3rATvWZ8gWFyMY9TjJnRBiRkI1tjZbvv6NqNjkzWzhQUV
 CiJYa013ZA9oLdoGuyWHpwPkxew6iOKI5VNcNH/pylu30QpWJ7UfwMI6Eg9QJGLCTuyIFn1/Cg+
 au0Z1B+HpkiuKla4QUgeQ/BokHujqTyXuKZtgB6KofRFiubGXB9+F2cXz+fimnHhJ+l7yC3SIww
 feJUJS9iHyY9X1RlZVvBN+9c8niTnRzMyeRwstXGDsDPtyRDx0GFYqz3PvChIDIhi0RfTZwWRet
 /HYHIYHv4ZY1RKxU0V0TH1xrVAmWPKk97OcIJTlGMO7S7YvFzee0CrgNCxI//56iyPZuULRRfzD
 hKM6Alkf/8vHtOHe+Txea2iJME/ZDa5JlsrJ7UNXFnIvkjpGF3H7AvLyrd2QW7cexF5OAkr4
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68178660 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=RZNktNr6s82MSkpdd14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CFLOB_yY5Vj3h-r7k7tlM8ZGU_c1dNyA
X-Proofpoint-ORIG-GUID: CFLOB_yY5Vj3h-r7k7tlM8ZGU_c1dNyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040144



On 5/3/2025 9:39 PM, Nicolas Dufresne wrote:
> Hi Dikshita,
> 
> Le vendredi 02 mai 2025 à 00:43 +0530, Dikshita Agarwal a écrit :
>> Firmware sends buffers with 0 filled length which needs to be dropped,
>> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
>> Also make sure:
>> - These 0 length buffers are not returned as result of flush.
>> - Its not a buffer with LAST flag enabled which will also have 0 filled
>>   length.
> 
> This message is quite vague, is this about capture or output buffers ?
> If its output buffers that don't produce capture, I don't see why they
> have to be flagged as errors, or why the payload size matter. Then, if
> its about assigned capture buffers that did not get used in the end, you
> should put them back in the queue instead of returning them to user
> space.
> 
> Returning a capture buffers to userspace should only be used if a frame
> could not be produced. That imply copying the cookie timestamp from the
> src buffers into the capture buffer. Please make sure you don't endup
> returning fake erorrs to userspace, which may lead to some frame
> metadata being dropped erroneously.
> 
The capture buffers which I am trying to handle here are of 0 byteused
which means they don't have any valid data and they have the timestamp
copied from src buffers.
How these buffers will be handled by client? if we don't associate error
flag to such buffers?

Thanks,
Dikshita
> Nicolas
> 
>>
>> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 4488540d1d41..3bb326843a7b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>>  
>>  	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>>  
>> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
>> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
>> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
>> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
>> +	}
>> +
>>  	return 0;
>>  }
>>  

