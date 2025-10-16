Return-Path: <linux-media+bounces-44761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF8BE512F
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 20:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0CCA93593AA
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 18:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76591238C19;
	Thu, 16 Oct 2025 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYm4RAxv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439FF1E1C22
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760639833; cv=none; b=dPKhsVcm/MS1JrIQ0kOF5H8PKZ6BbSRJVO4yq90K96F+bbHxGJRs7taOUBPoxSBsOBF6wOKE7wgaj/jQUaPa/pqKhry5smisieQtGkcKO5o7hWFNBbfvBpZ0N+hoqaYh+qlbHLq3o8btw4M2fZqANXtifGujWZbWEyEPcDf1VUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760639833; c=relaxed/simple;
	bh=OB5eSYWFZISVNnfXCEn0GDxedvGCMQF6SoJ+Ow7mZKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plPwU4dQio2w4NuePYMy8Uz/ON2s1MB28BOEFe2orkGcGzqg/7UFyNTJ/lOWuMZdlVtX/tN1t3AUB9UTLybbc8JMkuSuRdNfb7Juc7KHBF8mzN1sNX56oXVdDXOkP+IBlT5ZGFI2B1LICxoxfrg+XpQ23ZXgDEJk98TGqBW1Qbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYm4RAxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GGT93e002584
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 18:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/Uh0mqL0LErWoe7liCsyTCPPXrnktV2gL3UQ900aTY=; b=dYm4RAxvOcNd8pKf
	wLZRQWzDYFESSAXoZVX+5lcwFmJb8ZOC5HQq3U6Lr2DL0+7l7FbQ7atF3fkU5mCn
	iTPEDGxWHJr9i3EJi2YpJxtnDTlGuZeWE8G37vo/OZoeC+uFGzsu+JurLfvAMEWI
	lsISHFnuy11JtNbGyzQhWZZ/LaK6+PKLelOq99T2oin12NUhgbMtxIbTHw74N0wC
	xPAf2OOgKVeSpaVA5Jjio6m5S53gJlnEu19uIEw9jQiwnMR708cSFCiP9aYGm4wK
	XKdy0AitUNOZjxIv2yKPan5hV3/nNvqRpYrSqctjnAN0JFmJCkviY251u9YfcdsS
	IfZpjw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8hdr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 18:37:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6a2409137dso995878a12.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760639830; x=1761244630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/Uh0mqL0LErWoe7liCsyTCPPXrnktV2gL3UQ900aTY=;
        b=qcfMHjy8527sTRvN2n0ar8d6mrVBBmbSIP5nYCeF1XE5nj9UDW94YHh1Ts8Tqy9a7f
         ACdTLfwC1y3+89AkvkTxmtJZKQQ5uVe+fxWSd9RLCRuxP9b2m6VA602DM9vk4YFqRWPu
         Q5OYeYH50ZxVq+8f/633pcNRJljazXdSZAvzmwx6YNFF1VFyA7pCv7ZTtOg7UN5tIxyU
         UkoTHDDcK79M8penXQG5VrIyz6FGH8zLbip70GwBI0uCa8k6AcHMYf/rE0kfHmOjWkdd
         he6+XpZgAFrbvm9WG+bxA1Pw5Q9HO2syDBp8s4paUKrLF2Wl3ojuw94dUiMwwNOg34IZ
         2/OA==
X-Forwarded-Encrypted: i=1; AJvYcCUd5H4G8OYLp3LVnde+6ZotWWUUJX/Lc/TDqMZkf169MBtXBotcrKFVo5r9wBzuAhlBZXgaIERdP5rT4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DB/K4HMtuMGWSpu5SJFhv1MF8K6FsKRtVNyLgBHotMfhb83R
	VUXGH55ehgXoIoz0iaU4o6FE4GOoi2yFG7KfC8ahcp7jwLnGLc2ViXrVcTcxAR4ZHV9q5kmvaO8
	3DqdGo64ksCXOwetgqSBS0+fSf5MhsFdfmaVXvKjzbHarHyzx8C0qqn1nGH16U+AScg==
X-Gm-Gg: ASbGncvXml+LY6PYcOTVRDi5zzliCWq/sn9UwCl8VRCrgz9wSzwvow5G97r/+oCHC3m
	wPbdW0ze+8LHtoI3QnzoZFK7jWIx/49VXOJvNTiII3TpH8QsoHvpuc3kX2JySyGReRrsNfyKkuM
	x9fukA3F3TOz9P/gGwBl7Z/ZDKoS4wtzY3NBr1Dxa4GJ6MogxWdtIEcksosa5WT/1xS9h89fTEl
	q6z/GDVCPdDJlAtOPMLyLczzId79TztqcdtqwrpIarqoBd0yyy0OzgPMYfixP1JpVrrmGG/wbLt
	IWbxMai9/P7g0fCLqrmHnCU7GZsTAhcvk3oE1JxWIjdN6eBggRjgaKuxvHwVAMkQMTExPNnz6Nv
	K/5jvjovmbbooYL5Aeg0/37LwjiQuHaZuAA==
X-Received: by 2002:a17:902:d584:b0:275:f156:965c with SMTP id d9443c01a7336-290cb65b61dmr10962945ad.52.1760639829646;
        Thu, 16 Oct 2025 11:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFopTCf5Sn+ugIQazeLjzMKZ4AaB+rCH/4DczDVKRWHWy44mdCx7hroKoHEE+1V8Q7zPobuqA==
X-Received: by 2002:a17:902:d584:b0:275:f156:965c with SMTP id d9443c01a7336-290cb65b61dmr10962635ad.52.1760639829227;
        Thu, 16 Oct 2025 11:37:09 -0700 (PDT)
Received: from [192.168.0.167] ([49.205.248.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290c5c7d305sm11890295ad.70.2025.10.16.11.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 11:37:08 -0700 (PDT)
Message-ID: <c4c40efb-ceda-c13c-115f-a473af5e8fcb@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 00:07:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
 <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iyFbEGu2QffIS5chMYU-4D_pVhRYQDwc
X-Proofpoint-ORIG-GUID: iyFbEGu2QffIS5chMYU-4D_pVhRYQDwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX3N+2ROp1nFIR
 HBeWuscYs4+HAoFeEqILBAlhijln00eRgfuTNMTrgEaC6A7E6yJjOpfCbWjylHAN2iJvJLpRawp
 HsMTAGt80tSOolC7qv3zeuB/1nZ8ioPVBwc8pAhEYiSL3DR81H2aWrLU5YBC/OoIsMu3OuaWRid
 5/uCG3mkQoZsX0YzGvE0M2KBA5eoysY/Z+C/ishOFJ8OriVeyI0DU6V7PMuuSNgHLPtwz+iJTCL
 ykq7AirI2JbLyu8CeXYydYZ8jw8piaTkcM+LJII0T5r1X4FrGUHJnVofi0HFMdUNoj4N4QieXnh
 8aZ/uin53UhppOqBfyHuQlIbXxSswshBPBLruS+HKufbkrEEqEqOgTlcdDdGWdtS7sVK6PDXFS7
 C4Jo3EJWiHMfsjhT+RUjDHpA21Sw5g==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f13b57 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=LqmlnLjRnrQCSl2bsDkM0Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Da5OPgB5uXQvAvJx2EkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017


On 10/16/2025 7:17 PM, Dmitry Baryshkov wrote:
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..6474f561c8dc29d1975bb44792595d86f16b6cff 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> @@ -9,9 +9,38 @@
>>  #define VCODEC_BASE_OFFS			0x00000000
>>  #define CPU_BASE_OFFS				0x000A0000
>>  #define WRAPPER_BASE_OFFS			0x000B0000
>> +#define AON_BASE_OFFS				0x000E0000
>> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
>> +#define AON_MVP_NOC_RESET			0x0001F000
>>  
>>  #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
>>  
>>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
>> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
>> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
>> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
>> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> Registers here got totally unsorted (they were in the original source
> file). Seeing this makes me sad.
> 

Sure, i will be improving this part in v2.

>> +
>> +#define CORE_BRIDGE_SW_RESET			BIT(0)
>> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
>> +#define MSK_CORE_POWER_ON			BIT(1)
>> +#define CTL_AXI_CLK_HALT			BIT(0)
>> +#define CTL_CLK_HALT				BIT(1)
>> +#define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define RESET_HIGH				BIT(0)
>> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
>> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
>> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> Ugh. This mixed all the bits, loosing connection between the register
> and the corresponding bits. I'm going to pick up this patch into the
> sc7280 series and I will improve it there, keeping the link between
> registers and bit fields.
> 

Ok, not updating this part in the next revision of my series. Do you mean
something like

#define CORE_BRIDGE_SW_RESET_BIT0		BIT(0)
#define CORE_BRIDGE_HW_RESET_DISABLE_BIT1	BIT(1)

Regards,
Vikash

