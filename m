Return-Path: <linux-media+bounces-50454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4DD12320
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90FCA30DE9ED
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5ECC28F948;
	Mon, 12 Jan 2026 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHVPFa52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjYsendo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57C2820DB
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216167; cv=none; b=h2HQ1GqSWjnkuiwyezz8FJEXmVRcAvwJ0BB2roR9tIZUZu6b5+idIv5L/y6z5GG0egSiVGCkWR3lgC4AquVlNGBtbQo/ifrQ4APXYSHKvyiehtEZd6c4dqo2sqxWxJXoQTkk18IYTqWsU/jjgfU8mnI0lh69i5m99OkTqtRMz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216167; c=relaxed/simple;
	bh=F9fnjsc7wxE5WUOT2dZuyDtrByNpEJpdIy9Qs2a2Sxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgTHv6KTmxjtZfReLyooGIQoNRYRj1hDM1CnEckA9Npult4W+ho/Y4/Jxr+be+HsxdhHlqTc/rrZ7emvMnvIdtHYQrgNmYfPIaZWhzOAz9KfNHems/B1JwfFSqfwSDl/f9qa3qkhy3AB/JnQVNOqmUB/EZOBd7SCWmeHApVTYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHVPFa52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjYsendo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEeYp1315903
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbQcZeIoGK5ueJWkw4WLyp3e/HKxCl2Hby7gRumzRTE=; b=HHVPFa52SYPxb6dP
	RKxUYaEPRQumq1p9TG80J1/z+kVvpHKr+EQGdmo2JHVT/Ug0gtFLRmtnpMYyq1cN
	uF6IT1hNaNVMvvdpnrE6I6QUY4X9MtsbWUwTSHk78UdV36Xqfc6cv+exhWT7gpvb
	W5xcor+qoCUxzi9D43gJVumhsXHNo1In2n72Nrf/iMldWdES4QJN5zkrevB8TxzF
	tteFXojfwavZbVuYah+p03tRG7L4QAQcRAllPwI6OOyFAwZJf6a5muU3rbvuXClV
	CmUUMF4h+co0txkC5sD6Mhd3qMATfoFgcYTZedw9rnpLqW0yJc8wf8vvy8vTg/Fn
	USseRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg4pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:09:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4470131a12.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216164; x=1768820964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbQcZeIoGK5ueJWkw4WLyp3e/HKxCl2Hby7gRumzRTE=;
        b=kjYsendoJkDdcIO8klae1m0BMpPMzH035XxEkgNZVxI0FGo1kk8zGGCOJ5X5g5R9os
         H2OBrmUPcuwloQK6SqOvX0FRwD4gIY1xrubIp3b30nodRbgwNbQxb/1ELOLhlX41LYE7
         WXqV1HNcjzQ9EB5lh9EYqEuGDt3TwkNAf+nEmWFlMJ7D9k3L6oNbMX1thFvC7oJPoqP9
         SbDwBeteYAzGVlLaeL9i3yAsxCDHfEPWL/DHInoApglQHGUZ1YVP2mTVLErdATKV02fI
         0oX5MCaFyo1UEF+dddTUZ6xVNjxiGRviKMeLWT1X9/bK2nx1RwrJaO3LjndNtkGu1fbJ
         23OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216164; x=1768820964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbQcZeIoGK5ueJWkw4WLyp3e/HKxCl2Hby7gRumzRTE=;
        b=PoY+izCCKeuC/3FpOS5b43zPXZPXJjyKlDyoaEqkeq0dwHp7Z9+2Do0TwGa96WfHeM
         nE01FHt1MCY/aMoBsBAN3+FZ7MLAkM2AxSx+K2RZZhajjYpe64RE9260znBbM9d3x7z5
         XwJsnb7BXFDuoxfSc4eRQdwnjQ/hlMU2jT7hByacjnqJlkT4n+20NM9mn6e7eeNP9fyU
         Z/rEYWPM73rNUxve7krmeVkpJhDPNw2R+IN1nVy5795AgZteFKpcFcETSFcPTQrntkqV
         L0oMM+WOXoAmTYADLPNj6A9X+mTmMlqeT3Uc1aqjDagJw1JvxHgt/GX2ZzBG0pHpwSZU
         yJbA==
X-Gm-Message-State: AOJu0Yw1Ldmu4PdwD7Fj4nb417EX+MDCHZNTkqsKaSKqGhU5CNjMJZ72
	r4Ed2kxjRx3qeaDvRpC9aVMOShMHYGNSqMj+LfnZjWXbTRvdkWlNdAJ4zYRHqKVtJjQnpRP2LZS
	Ez+Ez/D7QGRsMR4UO3oedD1A5LhQkTKMOt0/IsC4UHAPi9noa/aUx9RSwUMv1JrbT7Q==
X-Gm-Gg: AY/fxX5BO+hCZdZllW0PNFGogrcL/IMdgzwZBFmVhwSnbkA8K47PYHKbNc0+xM/NUDS
	5Nh3uiaWpbZ4PXpu6AW2dwoectqcNqQGJhFH/aPWd1lm8UjL1t15KM9aLCaW5nhf0gRCxuctDhH
	msOADb96juC2iOda2c42ibkW2qeeAeBapL88DwI3J2jV9c2vqAs5krlqqi8PuXr+9DHhfHtteWs
	9MH1hrhP8I7qBgORWjcoMAI6Bt9D8H5inGz3DXx8x6N1Y+LZ82MGX4iNdu/Aqc9mmDM9WO9bKuE
	RZmhR4VunqyMnVkky0Mh7vEBs/mUiKusZo4YOxVjqrXWwxts4isMoA2P2G8BnjCEYsmHmuVYGcz
	/QjGbcMLj+sHldycbz2YQI8RVIPPY+w1RqCe6/nPcpXw=
X-Received: by 2002:a05:6a00:f92:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f52d90cc0mr3092841b3a.33.1768216164533;
        Mon, 12 Jan 2026 03:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3DqqiVAGDuMadEVug6aPn1DZj+wCnH5DiJ7gmZozwb6jXrl8SRz3fKLb98e1+Nt+IkrwPtA==
X-Received: by 2002:a05:6a00:f92:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f52d90cc0mr3092818b3a.33.1768216164086;
        Mon, 12 Jan 2026 03:09:24 -0800 (PST)
Received: from [192.168.0.171] ([49.205.249.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e4c0f183bsm8967543b3a.42.2026.01.12.03.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:09:23 -0800 (PST)
Message-ID: <f443d903-b69e-4e59-8366-e1970dca913b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:39:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IzI50mZlUp5RYoVM9WOvHrPipzb_1pff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX4cc0rlCujhmf
 M3BMe7yiRCzYFPyX+Ndit6b4sqqcY7udf1E0aPeeOt3pEjL/VkaqbxH1pFKTisUZayh9G1yvDvX
 S2Qe0PZCMhTojJZ+2JaGygr+9Mndx9HL2dqu03AJSWMyZ0rL6qX6rgYBywITXLVAhwnapE+lOhR
 xCM+uZPTz/juIUiy2FXGVvblm8RUrO63cbK1DkSWA0C3NHQvqmlFDo6DIsJcoliTLlXGreOUKcw
 K35DRVpmxZMPNOkoJgNbaXZpFFMiCKusm5iRj198XEojQQU9q7mZFP22IBlXDz8cgPxHMvBXcWz
 ZpRrnhHbL4m0hDl5Ws3nypIG9VihDQsxL+knzcIAR8UQb4tp4t8v08LJDBo7Si+ztsPPbV8Bl6q
 BlsQHWyxM2BiTtRuN+u/S4Fc/Ywbsrb2LaPsS7+ie/y8rUf2UbDLH4B6ZYBiCtIBCJtc8sA52WN
 s9YfO2f8SgCQ/47tEgQ==
X-Proofpoint-ORIG-GUID: IzI50mZlUp5RYoVM9WOvHrPipzb_1pff
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d665 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ntuG9qRpOVxPRPblRsQ5Fw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ERLT3ukgNE3iqUHOUQAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
> session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
> to firmware to fix that.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	int ret = 0;
>   
> +	if (!inst_hfi_gen2->packet)
> +		return -EINVAL;
> +
>   	reinit_completion(&inst->completion);
>   
>   	iris_hfi_gen2_packet_session_command(inst,
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>

