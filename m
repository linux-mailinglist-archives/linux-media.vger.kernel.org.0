Return-Path: <linux-media+bounces-45887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2AC18161
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 03:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8B7C4F7B94
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 02:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F12E8E06;
	Wed, 29 Oct 2025 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9tpOlwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EK6hwwDN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DB1F461A
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706015; cv=none; b=CwI+Yx2w+nRSJEkew6ptlWtYSvOm6AdVWQT35EWKF1lp40NmIRMMmWteor3D8X//mNLK4V1qn5LAJcuIMeHt2XwRcofxjH6UC5kGwnGWKlmUUrhiumg9LWIPLCdxsohm/kUigbH9psaIrRs78zvf+olLYIeZA6WOT5IlIujboJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706015; c=relaxed/simple;
	bh=zYjzIDm9ABKl+ZOGZ/TbmLZR2fmjqK+xd3V1IPtzHMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoQ4jAIAE5t+gx3s0JRObbVz7Cartx7jObaiBi3wIhawOo7Sdh0BgT19zV5KCArKlDsaDV2cNVqMDLU57aOiyAkKgABA4b9FpM1IFjvmB7FDayrAUgWjDgEhkXJ3uvjt6ukelx4yrRdb+HVBh8N7HFStbfDHH08InB42+/2O548=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9tpOlwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EK6hwwDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlPaO2616013
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqyJLEPdaFGCOUvgcTewJP26SEJfoypN64Nb4pdEp8U=; b=O9tpOlwp0o9hi496
	IinhBs2jxzJ2wfBpTQwjAWX5v0AJFGET2SAza8JE+PnE0WiH66Xi5QTko1d2I2sP
	fXeka/bI0y+fhdb07aDDMokyHwdoQvsLvdwykQ1bheeol0qz6bj/wKtEjBRNowZs
	KBwAT0zBCSxG6xAYbfBIjElviOMrcWTPbmnu0ZfXsGqhogYUM4At8JElJHj2Jr1Y
	ZmucJVWsQ+RJTHRvDvLkEt8zHSlAO7ENvrzDWjhsm83t/Jq3c3l4Txam3lP2IYD5
	gwoQBuYcRwHMIbKN7/9Si1PGoEaQbVDAcbs6OsLhlZZC1iFApo+BojhrmMY6eJn1
	oSzQHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0gwky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:46:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2728a359f2aso21801065ad.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761706007; x=1762310807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqyJLEPdaFGCOUvgcTewJP26SEJfoypN64Nb4pdEp8U=;
        b=EK6hwwDN+dsHQwtPkrvjehwAqBep4OHQVGQ3cXTss5uOKbTKTDuWg7b+UmJZSV8ZF6
         XTcfD5VZXILkihVYBl8Lpad58vX241/JV+Khl41gZKEP3SqXpXGuiVozyxfCOmuqshyK
         MCCDe9FoIIMEnQMlkx+JQsfJU5dQkDX+GVMWTG8zwB/0NXEULwC6O90gA9HGDtWB9err
         oxNUwyzmwFY0pB1NTNb0LSvcZt+6L339aMm12q5VTvEgihKc7RbDWL/y/Mki/oJ69jft
         SRz14srYhXuQLadoVQZZ9x04L4xki/AGWaQFnkpX7ac52kyH/C3ihHcONzloI8qP5Qrg
         qm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706007; x=1762310807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqyJLEPdaFGCOUvgcTewJP26SEJfoypN64Nb4pdEp8U=;
        b=vDPSZ87FgGgEjjUqmuoVcE6zkD/aR2BW0MxT/a20DKTkZASpvqWatsPT/FdbONA8MB
         0g3lw4GP5yR6M/hMH8rJLQ/dx5eRz4SzS+Unc7hoqd+CcfwJs9eQ3reVE8wQRuxGWlx4
         nw2wVQfWjSUmiynBKBfnHBU9EeqxR+05pPuAfdUA8K/LO9cP8tcHq2rhi/tMziopsgcD
         KU2UdcIEj8nxuK9gIGdV31AkIK2OnPj0hnrPZbvT1CIjSHxKbxzmILfk92VDWS/yDwkb
         aobxByQLn3fFfwRo8Ehvmdr/8Cyj9op+lgZaB+g3NEHDM9qSt8wVrBgTM9FWAeTx2hNE
         CqRw==
X-Gm-Message-State: AOJu0Yy3oCKmSyDS3DwDSjz4SGEVmvokaXSYJbvhVcmJ4y0rP46ZpddR
	RuME33pICdfF/FlVcQbo93BRJ/TA4BkJZEfs/AcT2pAdycRoKIkUsCdBHtVoQRsfu2p9fqBLQPE
	bTGtEjUvihN/dkA2xz3KN0Q/ZLiFyubiZ/WKhswl+/5P0VZGyld3iNR0EUoONHhoELA==
X-Gm-Gg: ASbGnctoy0N0AXkzakdj9OGI8WAoUlW1c5wmAB5hi/I3sdogHBtD9lY5aX1K/jv9Tx8
	PwDmDAOl3zyvDUBXAnxqx+7RF0PFt3RBELHEgJ9P7zI+uaM/U3IFgwSgY0odprQrMrnL6Ji2udl
	y/LD0Prh051uQEiGENqz+CqxCt4WfuKy7KpRQ0UiVYTAZM7FK3G8WycjiloKsvHfT+O8NtHYAfs
	qjXcgbnrMzDrK2gyx98Qo3g3a1da1R7NaG9pl2/yLR9mz48DsufIamgbvTTkr/4lHQkUz1Y0089
	pg7RWzG94p1+xb+6QkXgBJID4r5ejcak3qI3XgEzfTJmW5qfG01E3dNkVThF1edI054BfIiJxmJ
	MqI4Xfb9UJ+BZA+TgYXB76tgOkykp17+yLvAHKtCMsacsGBms0rbf33Oy5cbjJw==
X-Received: by 2002:a17:902:c94f:b0:290:aaff:344e with SMTP id d9443c01a7336-294dedf038emr8322455ad.2.1761706006877;
        Tue, 28 Oct 2025 19:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIaEorWbdWrtQRaIxHW6+iYUPDhBJvev9YHPdHVbjv49WU5Ec/dfmT0UCM0EsdfJljtKLrDw==
X-Received: by 2002:a17:902:c94f:b0:290:aaff:344e with SMTP id d9443c01a7336-294dedf038emr8322215ad.2.1761706006091;
        Tue, 28 Oct 2025 19:46:46 -0700 (PDT)
Received: from [10.110.87.192] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4b17sm135580525ad.5.2025.10.28.19.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 19:46:45 -0700 (PDT)
Message-ID: <e6614642-95c6-4ed8-ae0a-b0d458216725@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 19:46:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-4-964a5478139e@oss.qualcomm.com>
 <7c188b49-f95d-5ea4-f278-3f1fef17c424@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <7c188b49-f95d-5ea4-f278-3f1fef17c424@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=69018018 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RNmkLvDkPVEoyolOC-kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _cZRi1eP-ayqkRrZabve7XF4hjPlZyMJ
X-Proofpoint-ORIG-GUID: _cZRi1eP-ayqkRrZabve7XF4hjPlZyMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMSBTYWx0ZWRfX1AlauG288pMq
 k9WzqoV+wyhj9aAjO+fVCJ+6L7fDKng7yf6Y+VNzd1+/LEsIIRGoZyQVfJXbwgWkTiXlMFZRUQC
 g/gvjxcn8MvqCig9qLfPVq8gOlmGC/WtmbKf6vqRY98PrF52cdPUWWL130xv5NUuXUSMVRHWljp
 gymEpjRqx7jPPbNnrwX9kAllYgldAPI2XkI5aJfiYkhzdWuPmn66E/hjWDh4BlEb7ZVBtAXWpFC
 cqiAT69OSkFYy6w8jkXAucVo9juOxp2VjQmHZTwgWGhq+Iw+yOoHL7gec8dvxU/BT4Z/qCJkwxb
 uqFIZRoUdHjUAjI6p2wSATFJF56gpdqCuuBPTAj0TaH/m6mYrysyoVDjIvW9zUMIv/n1q2cI5Rz
 9oSDP2iL0qJPefXaEPsORFSgahjTSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290021


On 10/27/2025 2:07 AM, Dikshita Agarwal wrote:
>
> On 10/18/2025 12:05 AM, Deepa Guthyappa Madivalara wrote:
>> Defining platform specific capabilities specific to AV1 decoder.
>> Set and subscribe to manadatory properties to firmware for AV1.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 110 ++++++++++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
>>   .../platform/qcom/iris/iris_platform_common.h      |  13 ++
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 133 ++++++++++++++++++++-
>>   .../platform/qcom/iris/iris_platform_sm8250.c      |   1 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>>   10 files changed, 296 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -42,6 +42,7 @@ enum iris_buffer_type {
>>   	BUF_SCRATCH_1,
>>   	BUF_SCRATCH_2,
>>   	BUF_VPSS,
>> +	BUF_PARTIAL,
>>   	BUF_TYPE_MAX,
>>   };
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>   		return B_FRAME_QP_H264;
>>   	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>>   		return B_FRAME_QP_HEVC;
>> +	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
>> +		return PROFILE_AV1;
>> +	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
>> +		return LEVEL_AV1;
>>   	default:
>>   		return INST_FW_CAP_MAX;
>>   	}
>> @@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>>   		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>>   	case B_FRAME_QP_HEVC:
>>   		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
>> +	case PROFILE_AV1:
>> +		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
>> +	case LEVEL_AV1:
>> +		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
>>   	default:
>>   		return 0;
>>   	}
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> @@ -141,6 +141,9 @@ struct hfi_subscription_params {
>>   	u32	profile;
>>   	u32	level;
>>   	u32	tier;
>> +	u32	drap;
>> +	u32	film_grain;
>> +	u32	super_block;
>>   };
>>   
>>   u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 4ce71a14250832440099e4cf3835b4aedfb749e8..86fa5ab02bfe3701e0c3dd38f1a9cadc88f5e4cd 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -10,6 +10,7 @@
>>   
>>   #define UNSPECIFIED_COLOR_FORMAT 5
>>   #define NUM_SYS_INIT_PACKETS 8
>> +#define NUM_COMV_AV1 18
>>   
>>   #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>>   	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
>> @@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>>   		case BUF_COMV:
>>   		case BUF_NON_COMV:
>>   		case BUF_LINE:
>> +		case BUF_PARTIAL:
>>   			return HFI_PORT_BITSTREAM;
>>   		case BUF_OUTPUT:
>>   		case BUF_DPB:
>> @@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
>>   	case V4L2_PIX_FMT_H264:
>>   		profile = inst->fw_caps[PROFILE_H264].value;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		profile = inst->fw_caps[PROFILE_AV1].value;
>> +		break;
>>   	}
>>   
>>   	inst_hfi_gen2->src_subcr_params.profile = profile;
>> @@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>>   	case V4L2_PIX_FMT_H264:
>>   		level = inst->fw_caps[LEVEL_H264].value;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		level = inst->fw_caps[LEVEL_AV1].value;
>> +		break;
>>   	}
>>   
>>   	inst_hfi_gen2->src_subcr_params.level = level;
>> @@ -480,10 +488,12 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>   
>>   static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>>   {
>> -	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>>   	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>>   	u32 tier = inst->fw_caps[TIER].value;
>>   
>> +	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
>> +							inst->fw_caps[TIER].value;
>>   	inst_hfi_gen2->src_subcr_params.tier = tier;
>>   
>>   	return iris_hfi_gen2_session_set_property(inst,
>> @@ -509,6 +519,56 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
>>   						  sizeof(u32));
>>   }
>>   
>> +static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +	u32 film_grain;
> u32 film_grain = inst->fw_caps[FILM_GRAIN].value;
<ack>
>
>> +
>> +	film_grain = inst->fw_caps[FILM_GRAIN].value;
>> +	inst_hfi_gen2->src_subcr_params.film_grain = film_grain;
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_AV1_FILM_GRAIN_PRESENT,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32_ENUM,
>> +						  &film_grain,
>> +						  sizeof(u32));
>> +}
>> +
>> +static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +	u32 super_block;
>> +
>> +	super_block = inst->fw_caps[SUPER_BLOCK].value;
> u32 super_block = inst->fw_caps[SUPER_BLOCK].value;
<ack>
>> +	inst_hfi_gen2->src_subcr_params.super_block = super_block;
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32_ENUM,
>> +						  &super_block,
>> +						  sizeof(u32));
>> +}
>> +
>> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	u32 opb_enable = iris_split_mode_enabled(inst);
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_OPB_ENABLE,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32,
>> +						  &opb_enable,
>> +						  sizeof(u32));
>> +}
>> +
> https://lore.kernel.org/linux-media/20251008-video-iris-ubwc-enable-v2-1-478ba2d96427@oss.qualcomm.com/
> is adding the support for above.
<ack>
>>   static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>>   {
>>   	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
>> @@ -531,6 +591,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>>   		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>>   		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
>> +		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
>> +		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
>> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>>   	};
>>   
>>   	if (inst->domain == DECODER) {
>> @@ -544,12 +607,20 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>   			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
>>   				config_params = pdata->dec_input_config_params_vp9;
>>   				config_params_size = pdata->dec_input_config_params_vp9_size;
>> +			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +				config_params = pdata->dec_input_config_params_av1;
>> +				config_params_size = pdata->dec_input_config_params_av1_size;
>>   			} else {
>>   				return -EINVAL;
>>   			}
>>   		} else {
>> -			config_params = pdata->dec_output_config_params;
>> -			config_params_size = pdata->dec_output_config_params_size;
>> +			if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +				config_params = pdata->dec_output_config_params_av1;
>> +				config_params_size = pdata->dec_output_config_params_av1_size;
>> +			} else {
>> +				config_params = pdata->dec_output_config_params;
>> +				config_params_size = pdata->dec_output_config_params_size;
>> +			}
> with
> https://lore.kernel.org/linux-media/20251008-video-iris-ubwc-enable-v2-1-478ba2d96427@oss.qualcomm.com/,
> this change will not be required.
<ack>
>>   		}
>>   	} else {
>>   		if (V4L2_TYPE_IS_OUTPUT(plane)) {
>> @@ -598,6 +669,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>>   		break;
>>   	case V4L2_PIX_FMT_VP9:
>>   		codec = HFI_CODEC_DECODE_VP9;
>> +		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		codec = HFI_CODEC_DECODE_AV1;
>>   	}
>>   
>>   	iris_hfi_gen2_packet_session_property(inst,
>> @@ -763,6 +837,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>>   		change_param_size =
>>   			core->iris_platform_data->dec_input_config_params_vp9_size;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		change_param = core->iris_platform_data->dec_input_config_params_av1;
>> +		change_param_size =
>> +			core->iris_platform_data->dec_input_config_params_av1_size;
>> +		break;
>>   	}
>>   
>>   	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
>> @@ -845,6 +924,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>>   				payload_size = sizeof(u32);
>>   				payload_type = HFI_PAYLOAD_U32;
>>   				break;
>> +			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
>> +				payload[0] = subsc_params.film_grain;
>> +				payload_size = sizeof(u32);
>> +				payload_type = HFI_PAYLOAD_U32;
>> +				break;
>> +			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
>> +				payload[0] = subsc_params.super_block;
>> +				payload_size = sizeof(u32);
>> +				payload_type = HFI_PAYLOAD_U32;
>> +				break;
>>   			default:
>>   				prop_type = 0;
>>   				ret = -EINVAL;
>> @@ -900,6 +989,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>>   			subscribe_prop_size =
>>   				core->iris_platform_data->dec_output_prop_vp9_size;
>>   			break;
>> +		case V4L2_PIX_FMT_AV1:
>> +			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
>> +			subscribe_prop_size =
>> +				core->iris_platform_data->dec_output_prop_av1_size;
>> +			break;
>>   		}
>>   	}
>>   
>> @@ -1075,6 +1169,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>>   		return HFI_BUFFER_ARP;
>>   	case BUF_VPSS:
>>   		return HFI_BUFFER_VPSS;
>> +	case BUF_PARTIAL:
>> +		return HFI_BUFFER_PARTIAL_DATA;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -1087,7 +1183,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
>>   	u32 num_comv;
>>   
>>   	caps = core->iris_platform_data->inst_caps;
>> -	num_comv = caps->num_comv;
>> +
>> +	/*
>> +	 * AV1 needs more comv buffers than other codecs.
>> +	 * Update accordingly.
>> +	 */
>> +	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
>> +				NUM_COMV_AV1 : caps->num_comv;
>>   
>>   	return core->hfi_ops->session_set_property(inst,
>>   						   HFI_PROP_COMV_BUFFER_COUNT,
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index bbfe7a0851ea94fb7041a868b4df8b2ec63bf427..9cc0989c67d74a9e051725e9ee571a2ab9160519 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -89,9 +89,18 @@ enum hfi_seq_header_mode {
>>   #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>>   #define HFI_PROP_NO_OUTPUT			0x0300016a
>>   #define HFI_PROP_BUFFER_MARK			0x0300016c
>> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
>> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
>> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
>> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
>> +#define HFI_PROP_AV1_OP_POINT				0x03000182
>> +#define HFI_PROP_OPB_ENABLE                 0x03000184
>> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
>> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>>   #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> Pls maintain the order when adding new macro definitions.
> This should go up.
<ack>
>>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
>>   #define HFI_PROP_END				0x03FFFFFF
>>   
>>   #define HFI_SESSION_ERROR_BEGIN			0x04000000
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>>   			return BUF_SCRATCH_2;
>>   	case HFI_BUFFER_PERSIST:
>>   		return BUF_PERSIST;
>> +	case HFI_BUFFER_PARTIAL_DATA:
>> +		return BUF_PARTIAL;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>>   	case HFI_BUFFER_DPB:
>>   	case HFI_BUFFER_PERSIST:
>>   	case HFI_BUFFER_VPSS:
>> +	case HFI_BUFFER_PARTIAL_DATA:
>>   		return true;
>>   	default:
>>   		return false;
>> @@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>   		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
>>   		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
>> +		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
>> +		break;
>>   	}
>>   
>>   	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>> @@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
>>   	}
>>   
>> +	if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
>> +		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
>> +	}
>> +
>>   	inst->fw_min_count = subsc_params.fw_min_count;
>>   	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>>   	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
>> @@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>>   	case HFI_PROP_NO_OUTPUT:
>>   		inst_hfi_gen2->hfi_frame_info.no_output = 1;
>>   		break;
>> +	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
>> +		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
>> +		break;
>> +	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
>> +		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
>> +		break;
>>   	case HFI_PROP_QUALITY_MODE:
>>   	case HFI_PROP_STAGE:
>>   	case HFI_PROP_PIPE:
>> @@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
>>   		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
>>   		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
>> +		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
>> +		break;
>>   	}
>>   
>>   	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94..19f0660f0388499ab71a1413b2c05f891bd5d511 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -100,6 +100,13 @@ enum platform_inst_fw_cap_type {
>>   	LEVEL_H264,
>>   	LEVEL_HEVC,
>>   	LEVEL_VP9,
>> +	PROFILE_AV1,
>> +	LEVEL_AV1,
>> +	TIER_AV1,
>> +	DRAP,
>> +	FILM_GRAIN,
>> +	SUPER_BLOCK,
>> +	ENH_LAYER_COUNT,
>>   	INPUT_BUF_HOST_MAX_COUNT,
>>   	OUTPUT_BUF_HOST_MAX_COUNT,
>>   	STAGE,
>> @@ -237,8 +244,12 @@ struct iris_platform_data {
>>   	unsigned int dec_input_config_params_hevc_size;
>>   	const u32 *dec_input_config_params_vp9;
>>   	unsigned int dec_input_config_params_vp9_size;
>> +	const u32 *dec_input_config_params_av1;
>> +	unsigned int dec_input_config_params_av1_size;
>>   	const u32 *dec_output_config_params;
>>   	unsigned int dec_output_config_params_size;
>> +	const u32 *dec_output_config_params_av1;
>> +	unsigned int dec_output_config_params_av1_size;
>>   	const u32 *enc_input_config_params;
>>   	unsigned int enc_input_config_params_size;
>>   	const u32 *enc_output_config_params;
>> @@ -251,6 +262,8 @@ struct iris_platform_data {
>>   	unsigned int dec_output_prop_hevc_size;
>>   	const u32 *dec_output_prop_vp9;
>>   	unsigned int dec_output_prop_vp9_size;
>> +	const u32 *dec_output_prop_av1;
>> +	unsigned int dec_output_prop_av1_size;
>>   	const u32 *dec_ip_int_buf_tbl;
>>   	unsigned int dec_ip_int_buf_tbl_size;
>>   	const u32 *dec_op_int_buf_tbl;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 15a38b7122af6d978fac433e8c02b4da5c141e1a..600664b2aea88067a7f66a20beaacd42181f9532 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>   		.set = iris_set_u32_enum,
>>   	},
>> +	{
>> +		.cap_id = PROFILE_AV1,
>> +		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
>> +		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
>> +		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
>> +		.hfi_id = HFI_PROP_PROFILE,
>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +		.set = iris_set_u32_enum,
>> +	},
>>   	{
>>   		.cap_id = PROFILE_VP9,
>>   		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> @@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>   		.set = iris_set_u32_enum,
>>   	},
>> +	{
>> +		.cap_id = LEVEL_AV1,
>> +		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
>> +		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
>> +		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
>> +		.hfi_id = HFI_PROP_LEVEL,
>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +		.set = iris_set_u32_enum,
>> +	},
>>   	{
>>   		.cap_id = TIER,
>>   		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
>> @@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>   		.set = iris_set_u32_enum,
>>   	},
>> +	{
>> +		.cap_id = TIER_AV1,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_TIER,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +		.set = iris_set_u32,
>> +	},
>> +	{
>> +		.cap_id = DRAP,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +		.set = iris_set_u32,
>> +	},
> In the current design, this property would be set for even non-av1 case,
> hope you checked that its OK and doesn't create any issue with other
> codecs, same applies to TIER_AV1.
I have run h264, hevc and vp9 gst test for sanity.
>> +	{
>> +		.cap_id = FILM_GRAIN,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
>> +		.flags = CAP_FLAG_VOLATILE,
>> +	},
>> +	{
>> +		.cap_id = SUPER_BLOCK,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
>> +	},
>> +	{
>> +		.cap_id = ENH_LAYER_COUNT,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_OP_POINT,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +		.set = iris_set_u32,
>> +	},
>>   	{
>>   		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
>>   		.min = DEFAULT_MAX_HOST_BUF_COUNT,
>> @@ -701,6 +785,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
>>   	HFI_PROP_LEVEL,
>>   };
>>   
>> +static const u32 sm8550_vdec_input_config_param_av1[] = {
>> +	HFI_PROP_BITSTREAM_RESOLUTION,
>> +	HFI_PROP_CROP_OFFSETS,
>> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
>> +	HFI_PROP_PROFILE,
>> +	HFI_PROP_LEVEL,
>> +	HFI_PROP_TIER,
>> +	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
>> +	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
>> +	HFI_PROP_SIGNAL_COLOR_INFO,
>> +};
>> +
>>   static const u32 sm8550_venc_input_config_params[] = {
>>   	HFI_PROP_COLOR_FORMAT,
>>   	HFI_PROP_RAW_RESOLUTION,
>> @@ -714,6 +811,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
>>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>   };
>>   
>> +static const u32 sm8550_vdec_output_config_param_av1[] = {
>> +	HFI_PROP_OPB_ENABLE,
>> +	HFI_PROP_COLOR_FORMAT,
>> +	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>> +};
>> +
>>   static const u32 sm8550_venc_output_config_params[] = {
>>   	HFI_PROP_BITSTREAM_RESOLUTION,
>>   	HFI_PROP_CROP_OFFSETS,
>> @@ -737,11 +840,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
>>   	HFI_PROP_PICTURE_TYPE,
>>   };
>>   
>> +static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
>> +	HFI_PROP_PICTURE_TYPE,
>> +	HFI_PROP_WORST_COMPRESSION_RATIO,
>> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
>> +};
>> +
>>   static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>>   	BUF_BIN,
>>   	BUF_COMV,
>>   	BUF_NON_COMV,
>>   	BUF_LINE,
>> +	BUF_PARTIAL,
>>   };
>>   
>>   static const u32 sm8550_dec_op_int_buf_tbl[] = {
>> @@ -806,11 +916,18 @@ struct iris_platform_data sm8550_data = {
>>   		sm8550_vdec_input_config_param_vp9,
>>   	.dec_input_config_params_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.dec_input_config_params_av1 =
>> +		sm8550_vdec_input_config_param_av1,
>> +	.dec_input_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>   	.dec_output_config_params =
>>   		sm8550_vdec_output_config_params,
>>   	.dec_output_config_params_size =
>>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> -
>> +	.dec_output_config_params_av1 =
>> +		sm8550_vdec_output_config_param_av1,
>> +	.dec_output_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>>   	.enc_input_config_params =
>>   		sm8550_venc_input_config_params,
>>   	.enc_input_config_params_size =
>> @@ -831,6 +948,9 @@ struct iris_platform_data sm8550_data = {
>>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>>   	.dec_output_prop_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +	.dec_output_prop_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>   
>>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> @@ -900,10 +1020,18 @@ struct iris_platform_data sm8650_data = {
>>   		sm8550_vdec_input_config_param_vp9,
>>   	.dec_input_config_params_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.dec_input_config_params_av1 =
>> +		sm8550_vdec_input_config_param_av1,
>> +	.dec_input_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>   	.dec_output_config_params =
>>   		sm8550_vdec_output_config_params,
>>   	.dec_output_config_params_size =
>>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +	.dec_output_config_params_av1 =
>> +		sm8550_vdec_output_config_param_av1,
>> +	.dec_output_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>>   
>>   	.enc_input_config_params =
>>   		sm8550_venc_input_config_params,
>> @@ -925,6 +1053,9 @@ struct iris_platform_data sm8650_data = {
>>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>>   	.dec_output_prop_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +	.dec_output_prop_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>   
>>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 8342a0b6f825b385192baedfc67c50bba7661470..0297756a3724181498ed8e5776dd5b872f1d4304 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -11,6 +11,7 @@
>>   #include "iris_hfi_gen1_defines.h"
>>   #include "iris_vpu_buffer.h"
>>   #include "iris_vpu_common.h"
>> +#include "iris_instance.h"
> why is this change needed here?
Fixes kernel test robot compile failure
>
> Thanks,
> Dikshita
>
>>   
>>   #define BITRATE_MIN		32000
>>   #define BITRATE_MAX		160000000
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..05eec18f937a51d3c081d0f98a8ffa6bbd30d166 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -178,6 +178,7 @@ int iris_open(struct file *filp)
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
>> +	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>>   	init_completion(&inst->completion);
>>   	init_completion(&inst->flush_completion);
>>   
>>

