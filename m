Return-Path: <linux-media+bounces-30209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B15A892DF
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 06:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C3D169A21
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 04:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE27218592;
	Tue, 15 Apr 2025 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LdCbjBjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15714B945;
	Tue, 15 Apr 2025 04:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691497; cv=none; b=WBVFK6+gxg2b6tmtph0WZ+hj93Ss9Hxj9T1OPmvCGT6vUUVnjEVBzRXOhg3fMlWgeC8t1qhyJlMqxPERw/NF5RPGPuPWyJb8346EjhtSvt2zNDr90DWACJxieIpwPhuySJ2qOGtfn3YsqQ/oHlsRy6UHyidKmNy9fyODDUH7+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691497; c=relaxed/simple;
	bh=aCRjpDq3+ND2KM7I8yi9ZkKhhnvnhglU2cxJu7K7NXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DOpbdH/MvlnrXhpy4YLhDiPrcysEcJoM5w5M8RY/aO3OE033FufVg+G0EiHtdGYi+hrD2Bo169DjoRJ5K3CZHYZOy5HhSfap+4GGSt7LLmY82//SaBJQzCMHwVm1IqGdGRM2xuzQ9VxQbNxMskquE2eBrzQIK/wmyrwbpWzKDvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LdCbjBjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15Pkh020421;
	Tue, 15 Apr 2025 04:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmOzbxWmY/uCMMaKk5U24eGShqG2fiQcxMUcfehvYJY=; b=LdCbjBjUgSuhTG56
	l/iSP2uRAI/Q7T7OIFSXlVQ9RW359oZ3sovunxzrRZaUMW+NvB+HihHzI1ZtbyxE
	Tm7QTWBNk0iYY5qk8kjq/91Nco/iGleUnb6ey1vbbjjNeJZgUMOYgYe8d5OThsHT
	h8LkbiRT9rb1bDMLY8+Tq8jy8oio46uubZKRSExEdQON6k5BlBKns54qTiW5Ft8n
	+v+TeJtTxbeOGFQZCi4gACnt66knMiT0fY6MbDbHC8+oy7/6Vk1N8HBzYQfzMrAc
	mdjMEGdyzQbKY7/0FiReH4xrqO1tbU6AUkU/KElWIlz4R8E7Y8zNaOe3XlH8hjJq
	kOQ25w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj96m45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:31:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F4VU3o028689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:31:30 GMT
Received: from [10.50.52.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 21:31:24 -0700
Message-ID: <0241cee0-c121-3f30-57a2-f1d15b5e0839@quicinc.com>
Date: Tue, 15 Apr 2025 10:01:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/20] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
 <b857d1dc-2b21-4b93-89db-808c5dd4035a@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <b857d1dc-2b21-4b93-89db-808c5dd4035a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YivqHSIH5wbCJK_wUuwV14lNg9i-ULfK
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fde123 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=NbXVrnjj69dCY6q0HAkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YivqHSIH5wbCJK_wUuwV14lNg9i-ULfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=961
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150028



On 4/11/2025 6:21 PM, Bryan O'Donoghue wrote:
> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>> Firmware sends buffers with 0 filled length which needs to be dropped,
>> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
>> Also make sure:
>> - These 0 length buffers are not returned as result of flush.
>> - Its not a buffer with LAST flag enabled which will also have 0 filled
>>    length.
> 
> Any buffer with a zero length must be flagged as LAST, else that buffer
> should be discarded.
> 
> Is this another bugfix ? Feels like one, processing redundant packets.
> 
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index b75a01641d5d..91c5f04dd926 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct
>> iris_inst *inst,
>>         buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst,
>> hfi_buffer->flags);
>>   +    if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
>> +        !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
>> +        !(inst->sub_state & IRIS_INST_SUB_DRC)) {
>> +        buf->flags |= V4L2_BUF_FLAG_ERROR;
>> +    }
>> +
> 
> Is this hypothetical or does it happen in real life ?
Yes, it does. As part of flush, firmware returns the buffers with 0 filled
length but those shouldn't be marked as ERROR, same applies for buffer with
LAST flag.
This conditional check make sure the ERROR flag is associated with only
frames which are supposed to be dropped/discarded.

Thanks,
Dikshita
> 
>>       return 0;
>>   }
>>  
> 
> ---
> bod

