Return-Path: <linux-media+bounces-40851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF31B334F0
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4100480768
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 04:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED12522D4FF;
	Mon, 25 Aug 2025 04:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XfPSsiXd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2FBA3F;
	Mon, 25 Aug 2025 04:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756095361; cv=none; b=F4rql2xLSRi7fbiqdpg/j4EnUyfOdg2Z+c1XGcISU84i1ncyVWGARE4/chlkr6AEs34+vN99aid32acEgsv+cLiSOhebLLM0t+McU/dFklnT47mKgbUs9xaZYv57j2D9L66gdG/O96/e7MYPgzJdKxc+AZ4wrkxZ7zYHTXC13z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756095361; c=relaxed/simple;
	bh=Mbi6TWOYUfc8LmbMhpKw7QiwB1wxGKBFef4w+wiAJZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M8jrFt2exiojCAImzwYuEBVo/K5XUcP7rolyqXdNtwneDS/IYFGexosYOUOaHfQ6OJz6TJKePP8qJ7oyAVSCeqVABzacCXc2c51CPnHmhc4/s7sDEunC2aYzPtlNa05WomldQiWp8X9LNvVCsQEYGvBkW0KKMpJqc6i3qhhtSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XfPSsiXd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0dCDO012844;
	Mon, 25 Aug 2025 04:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEIi+pLn05TWMmEVfmcngyhJVXogtfWxwJi9qeEZiDo=; b=XfPSsiXdSfZBFMl/
	97x2dBWRalr9NEGL+wh3PxtMH2ZCnjeD/paGER80oyQs42ON8GDtT07Wt/LQt29v
	EH4NZ8nO6rnzwmVOQL4nyerA8/rMVEzbu7Wey9fpWJfZRdSoDP8hOB9ce32QwyZ4
	ZMfg8mYZctO0udK0suCltKQl7xTdJMWI6VDFXFpK5/0qPlejoJjyIJJzrcQsoC5T
	QLE3Nljx6Zz+t9JBdvxh3kRxMIbj6hNjBGH43ZdOE50wHWeKi5NRSCLAPzZWS2X7
	SWKR5jOpv4Qtn/noJKoIGCNFI4wfC/BNCwZKSV8iYF5kyIaldghZOb89D8rpM5ek
	AOMPbg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de3mfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 04:15:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P4Fru2020295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 04:15:53 GMT
Received: from [10.50.27.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 24 Aug
 2025 21:15:47 -0700
Message-ID: <d5335ff7-3d66-600e-edcb-c688bec74f59@quicinc.com>
Date: Mon, 25 Aug 2025 09:45:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <19f844ee-da08-4497-a4f7-c90d45554534@linaro.org>
 <cdce193e-c055-6599-16e5-83e33123099e@quicinc.com>
 <92f50738-571c-479c-9be8-b72c32fd8b70@linaro.org>
 <25d44811-953c-1145-73b9-967909fc3983@quicinc.com>
 <0662da96-8987-45ae-ab06-c60003ef26e3@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <0662da96-8987-45ae-ab06-c60003ef26e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXw4x20aTjuLhd
 6AnuQf1rriAnfaqt4nU3TfGaazcsl/BXMCLRtutG2HDh0Es9/g4NxAzTRF9plvFgVlPKEIU7lXn
 Hj4XajjOd5m50CevT8wyGUoVNRuCCThKn6+jEByrBX2rRqQFLp8vZRLEieTo2z3+LVt2YesNsev
 oKrgaKLHEgkSerX023cnWKf6alfnUgOBaT4P+iFPy2bdcCwKX0m8D/jpAxTUdewcker/vJvX01u
 LcD4l0jPp4qDMUjbWks8rtIitGiNcGBhwVQyNfvn5H2GL7e8CUOeb5T2+apRD4cGyvTS+CfoPeQ
 su+cEVpEwavHptHxbaz8iO2dvu9rJ2kHLMPnQfgHRkbue5bM1IU2XwDgfE5SFRosbEBS3q7ei/z
 H9N+vl3J
X-Proofpoint-ORIG-GUID: MW6-44usHFqWyjRcdb2jqoUkyXLAErR5
X-Proofpoint-GUID: MW6-44usHFqWyjRcdb2jqoUkyXLAErR5
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68abe379 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=TCLbTnLOaD7g1CH0Mj0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037



On 8/22/2025 4:38 PM, Neil Armstrong wrote:
> On 22/08/2025 12:09, Vikash Garodia wrote:
>>
>> On 8/22/2025 1:47 PM, Neil Armstrong wrote:
>>> [  157.299604] qcom-iris aa00000.video-codec:
>>> <VFW_H:CmdDec:265e:a723e008:00>
>>> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
>>> [  157.311341] qcom-iris aa00000.video-codec:
>>> <VFW_H:CmdDec:265e:a723e008:00>
>>> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0
>>> MultiSliceMode:0
>>> [  157.325847] qcom-iris aa00000.video-codec:
>>> <VFW_H:CmdDec:265e:a723e008:00>
>>> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 9563648 vs FW
>>> HFI macro
>>> size = 7953920 vs FW golden buffer size = 5833728
>>> [  157.344542] qcom-iris aa00000.video-codec:
>>> <VFW_H:CmdDec:265e:a723e008:00>
>>> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size =
>>> 299008 vs FW
>>> HFI macro size = 299264 vs FW golden buffer size = 299264
>>> [  157.363944] qcom-iris aa00000.video-codec:
>>> <VFW_E:CmdDec:265e:a723e008:00>
>>> venc_c2Start(3860): Send HFI_CMD_START error response for port 1
>>> [  157.376855] qcom-iris aa00000.video-codec:
>>> <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.389836] qcom-iris aa00000.video-codec:
>>> <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.402827] qcom-iris aa00000.video-codec:
>>> <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.415816] qcom-iris aa00000.video-codec:
>>> <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.428832] qcom-iris aa00000.video-codec: session error received
>>> 0x1000005:
>>> unknown
>>> [  157.436848] qcom-iris aa00000.video-codec: session error received
>>> 0x1000005:
>>> unknown
>>
>> Thank you for the logs, the issue is due to driver non_comv macro size
>> (299008)
>> is less than firmware requirement (299264). Please try below fix, if that
>> works
>> for SM8650
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 558dba37dbfbc..3247ad736a17c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -967,7 +967,8 @@ static u32 iris_vpu_enc_non_comv_size(struct
>> iris_inst *inst)
>>          if (inst->codec == V4L2_PIX_FMT_HEVC) {
>>                  lcu_size = 32;
>>                  return hfi_buffer_non_comv_enc(width, height,
>> num_vpp_pipes,
>> -                                              lcu_size,
>> HFI_CODEC_ENCODE_HEVC);
>> +                                              lcu_size,
>> HFI_CODEC_ENCODE_HEVC) +
>> +                                              SIZE_ONE_SLICE_BUF;
>>          }
>>
>>          return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 1ff1b07ecbaa8..94668c5b3d15f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -41,6 +41,7 @@ struct iris_inst;
>> #define SIZE_SLIST_BUF_H265 (BIT(10))
>> #define H265_DISPLAY_BUF_SIZE (3072)
>> #define H265_NUM_FRM_INFO (48)
>> +#define SIZE_ONE_SLICE_BUF 256
>>
>> #define VP9_NUM_FRAME_INFO_BUF 32
>> #define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
> 
> Works like a charm !

Great!

> 
> Do you want me to add it to the iri33 buffer size patch I'm preparing ?

This change will go in common code, since it applies to all iris3 generations.

Thanks,
Dikshita
> 
> Thanks,
> Neil
> 
>>
>> Regards,
>> Vikash
> 

