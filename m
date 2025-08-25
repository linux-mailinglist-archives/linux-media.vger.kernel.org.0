Return-Path: <linux-media+bounces-40854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA440B335DF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F6F189AA55
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73CE27605A;
	Mon, 25 Aug 2025 05:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="leEik16n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8CB2CCC0;
	Mon, 25 Aug 2025 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756100631; cv=none; b=CBh7+tDkDZbrH9LNY/mMwxVoBcJNbCluXtJ93sJiJ9FCcK8Yyhk+z+TY12Ga2RQxIIPbOZEvp+auKoCGfg730BdEA0IC/9f28LFvielzBVF9k2MlWRmpmTjfTtfvh1hRu2kqQGRa7VgaWRchL3I/CtK+xRxDIiJAuatUf43ARYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756100631; c=relaxed/simple;
	bh=r7jpIJCTtpAY4rTbJjjjHB9kaLAYfsnh+IBrsCEMMi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o08FWaH6x0NX83Fy8fIlrB7TtTkEdvDRVADaf0Ess2v75Yzy7avO+f4i05qgjjsXcdOYHO0r8Jild24Xv001MB0XzeorQrA4gUS42roqaLAh10mfVEJilHTMEv5ehmPAWg9BbePr4bcpdl9HFvad/AA/v4rl0nQATg2BN+PcVuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=leEik16n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0QjsE030554;
	Mon, 25 Aug 2025 05:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqLsuJjv75+xSIwUdfzxuoD0sfzpkQN7r4LliMlavNc=; b=leEik16nLq+pmIR8
	NLuNpqn56fj76K0f8ME65TR6rrQBijhC5rt18zGeYaIJPTfZjveKa7lweN/h52Gb
	/1j6/n/TLOjJ1zBTmgyfktVpnGUwbYIL1vuB+Yw4IhZy7hBP749+sFidVxNoh7cD
	4d1G00m86OK3mRveSx7jh1bFj6geZkYIg9Hiu+ak1l+ickxSqU4cMFudRDSAI6u5
	+vF2pWFFhPVlJkrkkzh6qzeVYNQxYtyAbzuPE1+I2p2khXPqxQj0xuGKqq2uW0lS
	u2B5W3TBJpeJU8/rbtRZWG8Q2LUHjRw0ElmIesYk/SlwtQH3oiayiX0M2HtyWM+I
	MYh91g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfbwry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:43:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P5hYSx003541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:43:34 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 22:43:30 -0700
Message-ID: <67250733-63b2-c3b0-146d-84334be4afe2@quicinc.com>
Date: Mon, 25 Aug 2025 11:13:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <0662da96-8987-45ae-ab06-c60003ef26e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX930TkQhBCzI1
 r25Sw/P9v9Yk5jgs81fDkolTL/OveEt9CbqLXQojzgOIUCYIxv/3mNkmIyVcyXQacFoNX0K15Wb
 6f38NYOOK8BSurS3TVqHIJ1X41DV/F/vuj1W31wJzTz27W/vhVkmvVSgKaMGpLNDz6yuBihmLli
 01+AC5ozK+jZkCXQrLbvyDz006E7KR8/V5+hzG8jLaSxWxIydtDCixcJ5KDuXQ616rcQ6IGdB+p
 +uXEPPNjR4Ptt0jqjX5wiIHeCHzMfA8GbPOh06ngjnZhQdjjWb8s1Jx+Up1K/9OxcYDjUANDBW8
 0EFPGVlIzwQgUQGh6+mZrZHZDJ07ZxGbKXzyXJENp4K8ZPCGPCAn2olZEImqeKn55XfNK9/7eTk
 0Al2Fv5Y
X-Proofpoint-GUID: GviIyifL7oiVo-ABV0gBeYa6WbHfGL9k
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68abf807 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=TCLbTnLOaD7g1CH0Mj0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GviIyifL7oiVo-ABV0gBeYa6WbHfGL9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/22/2025 4:38 PM, Neil Armstrong wrote:
> On 22/08/2025 12:09, Vikash Garodia wrote:
>>
>> On 8/22/2025 1:47 PM, Neil Armstrong wrote:
>>> [  157.299604] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>>> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
>>> [  157.311341] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>>> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0
>>> MultiSliceMode:0
>>> [  157.325847] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>>> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 9563648 vs FW HFI macro
>>> size = 7953920 vs FW golden buffer size = 5833728
>>> [  157.344542] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>>> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 299008 vs FW
>>> HFI macro size = 299264 vs FW golden buffer size = 299264
>>> [  157.363944] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>>> venc_c2Start(3860): Send HFI_CMD_START error response for port 1
>>> [  157.376855] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.389836] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.402827] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.415816] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>>> [  157.428832] qcom-iris aa00000.video-codec: session error received 0x1000005:
>>> unknown
>>> [  157.436848] qcom-iris aa00000.video-codec: session error received 0x1000005:
>>> unknown
>>
>> Thank you for the logs, the issue is due to driver non_comv macro size (299008)
>> is less than firmware requirement (299264). Please try below fix, if that works
>> for SM8650
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 558dba37dbfbc..3247ad736a17c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -967,7 +967,8 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
>>          if (inst->codec == V4L2_PIX_FMT_HEVC) {
>>                  lcu_size = 32;
>>                  return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
>> -                                              lcu_size, HFI_CODEC_ENCODE_HEVC);
>> +                                              lcu_size, HFI_CODEC_ENCODE_HEVC) +
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

Good to know it worked for you for SM8650. Appreciate your efforts in bringing
it up on SM8650.

> 
> Do you want me to add it to the iri33 buffer size patch I'm preparing ?

This(non comv) change need to go to common buffer calculation. Dikshita will add
in her encoder series.

Regards,
Vikash
> 
> Thanks,
> Neil
> 
>>
>> Regards,
>> Vikash
> 

