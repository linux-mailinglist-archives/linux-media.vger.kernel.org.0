Return-Path: <linux-media+bounces-37829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9FB06D99
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340E617107B
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04A52857E4;
	Wed, 16 Jul 2025 06:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PRCyJacq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88B17A2EB;
	Wed, 16 Jul 2025 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752645885; cv=none; b=lVqGHBhl4jvwh+jeBg79oJpEWu3yF1pKwJJmqn8oKjug2m06Rtgn+VLjQUaRFrSSrgk+3YcC6UBv9WrIxeQutt81bzGmN+0AD5eo1M4/+GlezsehEAym9zhnC9xfxxs1TC+jL3F6Sy3x6o6kCzUmRkIAoILAPx/oU6leVzc7BkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752645885; c=relaxed/simple;
	bh=V1l8a7hS0pJ14LEuviKYyRjxZZ5ohF4DFaYBCF48HC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SN1AHK/Ds7+ThLyCqtilOOV9sBWDCVCWRI9HM/1jFmaJxKbpH4bzL6/mT6ycV3xYFGxwHxPkakbsuLy5VLuWNRSgWrG5AFYTWBqrJUK/lhPLSYgIgRjBwG5tPpZobLEx6mRATBG0pOKzTu2mHYfqAvx4RDvgBkCjnYEgWBsubPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PRCyJacq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDYx5018423;
	Wed, 16 Jul 2025 06:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZsRfSKu8TfMbACRDWcKzCZPAh8rj5FgGy4oiyM4KTM=; b=PRCyJacqsMuIfwOH
	S3dICDHOu54C3JnWnfesCBPFahLCrp8OA3Hq/y4BcZUCsSnGis/1psc99tKcy6WC
	C3qKC8g+VPHtc9gAraLxX7Atn0hv5ROoeh0g0CalsZYDzrPCOFnVOWH0Xn5+pVgW
	yzxrLAv4o4XMq7vpDY1g955iR+yIpxOMSxAbsLWv4mG62E7zfxPtiz3bs9myMP0C
	rPhw88k2ki3Nl6aaktV+pYMDzEUR2q35cHfjFCimnSEY08u7j0xcyojQPxpoW97N
	hV/NZ6TcZMowDMwPNBrqvTdz8zHhhOoWGJvHeIk9QorI+No9MQR2CPOrl0zwofFx
	wE1vkA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8am6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:04:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G64aQl014727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:04:36 GMT
Received: from [10.50.25.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:04:33 -0700
Message-ID: <c4193425-22c9-8994-aa6d-2957bded9c1f@quicinc.com>
Date: Wed, 16 Jul 2025 11:34:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 01/25] media: iris: Fix buffer count reporting in internal
 buffer check
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
 <20250704-iris-video-encoder-v1-1-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-1-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA1MiBTYWx0ZWRfX+Cdxfe8uXwxG
 ka1EIDK632i6/rcEQYB3yWhHEalXbwnrpkCBNJicB+2g32sARJXC5kzUr585GEqGc5n04G/4/6B
 omzfzw7VITO0FyTL3fh4NuhWiyH3MLOS1NRqz5KIbkWBKc5qUvi40uVzHekjnDE6LoYqTi3VI2N
 Uhvndk8VIZwmVdMh0uDo4D4EDsViQePmm+LZNhuKjJToM7ZQBQANza7TnvNeK4NxqJBA77Jd5NH
 4wkIDtq/80wDOY7PNK2uJB53WUpJW0M9/i3fKrSvl35Cnm2U9GsTXKzg3GFRhErWHuU2SKluul4
 syDp64Hz3Jl5ibeAepnuMNHZuaUayBS1gPI9WRrKThtPj/gfe4Z891N2tr3aBC/wcZazQHpM8cz
 PtxEQrieAERJRysVwnAMfdu8fvaWIwuvIDK5LG7p+addWbFKZFF7asnNfSqPhhjQBuZ6E34d
X-Proofpoint-ORIG-GUID: 8M2ir7BlUZHuTemeYvwqrlxBiRgcbKSS
X-Proofpoint-GUID: 8M2ir7BlUZHuTemeYvwqrlxBiRgcbKSS
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687740f5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=WrvcyPJzpl4kmZTfN_0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160052


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Initialize the count variable to zero before counting unreleased
> internal buffers in iris_check_num_queued_internal_buffers().
> This prevents stale values from previous iterations and ensures accurate
> error reporting for each buffer type. Without this initialization, the
> count could accumulate across types, leading to incorrect log messages.
> 
> Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index c417e8c31f806e03555cd5e2a662a6efe5d58f3e..8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -240,6 +240,7 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
>  
>  	for (i = 0; i < internal_buffer_count; i++) {
>  		buffers = &inst->buffers[internal_buf_type[i]];
> +		count = 0;
>  		list_for_each_entry_safe(buf, next, &buffers->list, list)
>  			count++;
>  		if (count)
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

