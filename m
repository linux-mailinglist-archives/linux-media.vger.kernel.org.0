Return-Path: <linux-media+bounces-37834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F04B06E41
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DADC17F788
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F68728313F;
	Wed, 16 Jul 2025 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WIVA7TK+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D63289355;
	Wed, 16 Jul 2025 06:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752648780; cv=none; b=A3U6pTPyLkRkL3To73Bq0SeJ7utxGFQiVSO1KK1GdUz4Hd61BIO58U0WrkZMzISAT36dytJWUhj4TZfQqBAS9MfSQreh1y8Lgjz+r9LiV/Chn+8U74ff//UtSvdrM+H9Ht6x5XRNym6XhwZCVBxyRt+vv7sDJa90r+/wdxOA/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752648780; c=relaxed/simple;
	bh=cgVHA/OB+eRqZfnwMf2HNeD0no0x8uloxiGvFwMwLNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I56oPOULF9RfPvf1XmgnA5sI2RhHeu3fMrO/AjLR+vXmIcL3Js7yRcT1pSVMPyEf5dx6dmzfL/Ibl+05v4kyTYewQ/JpZEa1MzDaY1+5WjKD+4Xp/kogGj8jiN/v6yTFDJ8FszyxQKn+yT8i1lQTphhoIiUOMjWHj0Hrhryetew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WIVA7TK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6LD70017609;
	Wed, 16 Jul 2025 06:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egOdM31x5gY/v7DIT6AM5oiEc+O5SnbM33Ejbq97LjE=; b=WIVA7TK+mTTThUqX
	aRqP0+hhNV39+NMmFcvU92/VdLS6oF5g6MDbuo/A++7WOLh3/Fq6Ww8rdLuZ3NJf
	5nJ+xOhfmaIykclq4aNu0Dg0I0Hl+va6OOjVPQVl4lPQz+Uwi1aW85XxlrMmNJDg
	0TLCHnbqze8UUlL5TYKPaD1zp7jJQUubwWVpBWkU63bl2XGyPcA0jyxDGQbvWOmH
	KkSbO3pCUSyLxMmYd8z78f6qJBjGKDrytHAtrWCy9u8XQGwzhA65wYE7L787VOkz
	oEFPAPGXwD5Nw4U3bYYhd/8YcslHOBs8KIGufD5Bqe0ewwJC3px44ylq9HWHEi2h
	rJMSlA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8arjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:52:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G6qoSO026811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:52:50 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:52:47 -0700
Message-ID: <15296d36-b452-c889-d200-d65d7055b934@quicinc.com>
Date: Wed, 16 Jul 2025 12:22:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/25] media: iris: Allow substate transition to load
 resources during output streaming
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
 <20250704-iris-video-encoder-v1-6-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-6-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2MCBTYWx0ZWRfXypLPVypG9Idd
 Pv9FNwNHAdu73fvsKYYjm7z3B5ZhixGa/LTQ2SnyHgm80343+f3q+i4FUARZIxVApLv89eemWZn
 QRkuc+AG8i660fg5GFTV22zyj9AwxksWlVuyfAT1gkNzZFN2p6eUy45330QrUk+DFPq/HquJUbr
 Yw63AG5WedI+aBlMWjY9BiwjHlAG4fd0FCDDgQxSDHhhTf+RirybbNErkuTbC7jgEmV4dpzTU3H
 Ky70euPx5/4gZ9NMxWdMfz9QLenm42FF8YqhuGb7i+N5DR+YrGNQPp0Te2FTkqWoWpsW1djt82r
 wOdueLb+QCwiWwr7q5QmIr1Ii9BqhD6zQgbUMhC0Gc6Rt7FfFYoVVeT9tvAzOwE+YGDysPTehJa
 9kuRFNPu4PnXi9PaD3XYQRnGThg4LqrUCXcNMi7mjRVJm7BxnS0z6KHJ312Sl0eK+ytzfOQL
X-Proofpoint-ORIG-GUID: FLv6MbWFuS1fEUJYthp6Afdsl0ngatwR
X-Proofpoint-GUID: FLv6MbWFuS1fEUJYthp6Afdsl0ngatwR
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68774c43 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=dGS_VvM44AjYl6akgdIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160060


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Previously, the transition to load resources substate was only allowed
> when instance state was INIT, since capture port streaming was not
> permitted before output port streaming in the driver.
> However, now after removing that restriction, the instance state can be
> OUTPUT_STREAMING when firmware start is triggered and substate needs to
> be moved to LOAD_RESOURCES.
> 
> Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_state.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index 104e1687ad39dab93ff66450ba3a97c309b1e1e1..a21238d2818f9606871953bd0bee25382cca0474 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -122,7 +122,8 @@ static bool iris_inst_allow_sub_state(struct iris_inst *inst, enum iris_inst_sub
>  		return false;
>  	case IRIS_INST_OUTPUT_STREAMING:
>  		if (sub_state & (IRIS_INST_SUB_DRC_LAST |
> -			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE))
> +			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE |
> +			IRIS_INST_SUB_LOAD_RESOURCES))
>  			return true;
>  		return false;
>  	case IRIS_INST_STREAMING:
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

