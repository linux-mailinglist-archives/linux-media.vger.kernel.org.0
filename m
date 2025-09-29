Return-Path: <linux-media+bounces-43310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA6CBA8065
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 07:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B5F174E4D
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 05:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FF029ACDD;
	Mon, 29 Sep 2025 05:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KWnDkct+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ECD34BA42;
	Mon, 29 Sep 2025 05:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124780; cv=none; b=rH2Zg2Cz753jEJAtJu+jVe7DjviotZ2KgePszjkUVDOMfiZj4aNo4nn/sUivGP+r0kgDmjdOyLMf9DdyFbOuGdkUPoSc/3TSKMkwbj3mDcVJAwR0NibK8LIkxKyirQe5QuC93niEtKr7dC4dQ9ZbQpo4qM9YeBasJT/uGaPuCQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124780; c=relaxed/simple;
	bh=/BCKnP9LLStsZ2pcOjdrygxXTQCMzRy8wBpDPkUclz0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=KuLh7u4SoLToAG/TYlbQaUca+oaNE/noz0PUNxErfExKhu/vvPr0g8BKFTfeZhRQSa1+Ka0dw+JCmENZStlEBr7d1gndLgp9WK4ukPyxkNp3oi8OlsvyJ8XhrX807RzYkICP6qbq/4dAfXzD5OorRRBNBV0sy8mBe09oSKDsnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KWnDkct+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMT6gf024852;
	Mon, 29 Sep 2025 05:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCQh13e1Fqnc8fR6Slf3DciQbG9KSAiQjl70xO6uGhU=; b=KWnDkct+FooT6ykA
	lFt8hfSM8kcFMVkMu5AmH4SBM7vX3V6IoFahNI5J21Y1G/ySfSANmGB+X7oX0FQk
	jYWuvIbOgXs8hCSvZIe47/iKq212s2FSrTPS/Gmhq6k6EFeNDDscEqjvXCeWw/DM
	4ETI3j9cLHdnksZwuBL/zEjLQesuHr0Y2hu5eIIStNzP9WsmBLXku9ShriySqo0O
	IUpnzhQVEUBZdTPbVF3BxWsGNLB5yt5Uoim4WNuv5+X5/q49l1GPw1ITtvHJxEis
	h7l0rhvYI7bZ/f9mhcGFtprbt1rtjEJyVXHKIuqDzy9u1SMWQeV078O7v6JadQXM
	m7mHzg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdbtu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 05:46:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58T5k3t9002586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 05:46:03 GMT
Received: from [10.206.105.120] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 28 Sep
 2025 22:45:40 -0700
Message-ID: <68686586-f161-c6c6-cd3f-c5eb87e33954@quicinc.com>
Date: Mon, 29 Sep 2025 11:15:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 7/8] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia
	<vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal
	<dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-7-e323c0b3c0cd@oss.qualcomm.com>
 <3355306e-4059-4af5-8865-3b5335356382@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3355306e-4059-4af5-8865-3b5335356382@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3xGClGbpI5jbUg7H2rY8sIiuJzfy_qHS
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da1d1b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=6dCTXIr_CiDOCL04YTIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 3xGClGbpI5jbUg7H2rY8sIiuJzfy_qHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX/S60ujBRVqHx
 3HlbucP6wd8Ffb5YKejGhxJbgHKkEWSttMwW8jglMsAwE7tFbDWbd8ImbAzQoXOnV39H9dtbXoH
 DTqGneWABAR2eIJ9fBMem2UOnVEQca6fUa0KVhp0xLMHcT5XH4Wk9zq4mJozdIxjkKtH0LBCQ6d
 0jE8YK3tBCg/bI+MXd26Y8bBjiLSTDGZ4dkrl21jBU/ttHqltwMUepb8zPckb+7bgffFLOSpNEa
 xXjYijTExFtBDBWnk9g5FP56vI+eLSh4YCvBlDkgdnFkDvh7+bRnSR60MHcGJmkciAMKWkYrm8R
 02lH11Tx1IGZHGS/QfEA1kEqFq2c2v7n3SO5x/qm76YSCaObd/q5YtC3Ysx+XBqWZT75Eb1MusG
 DoENV/OW0nTXK+OAhf18SvfuPak9sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036



On 9/25/2025 2:48 PM, Konrad Dybcio wrote:
> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>> Add power sequence for vpu4 by reusing from previous generation wherever
>> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
>> earlier generation wherever feasible, like clock calculation in this
>> case.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#include <linux/iopoll.h>
>> +#include <linux/reset.h>
>> +#include "iris_instance.h"
>> +#include "iris_vpu_common.h"
>> +#include "iris_vpu_register_defines.h"
>> +
>> +#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
>> +#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
>> +#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
>> +#define DISABLE_VIDEO_APV_BIT			BIT(27)
>> +#define DISABLE_VIDEO_VPP1_BIT			BIT(28)
>> +#define DISABLE_VIDEO_VPP0_BIT			BIT(29)
>> +#define CORE_CLK_HALT				BIT(0)
>> +#define APV_CLK_HALT				BIT(1)
>> +#define CORE_PWR_ON				BIT(1)
>> +
>> +static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode)
>> +{
>> +	u32 value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
> 
> I think this could use some explanations.
> 
> I'll go ahead and assume that the eFuse tells us that parts of the
> IP are disables (hopefully not all three at once.. we shouldn't
> advertise the v4l2 device then, probably)
> 
> You read back the fuse register a lot, even though I presume it's not
> supposed to change at runtime. How about we add:
> 
> bool vpp0_fused_off
> bool vpp1_fused_off
> bool apv_fused_off
> 
> instead?
> 

  Hi Konrad, Thanks for your review and suggestion.

  The poweroff and poweron ops will be called in each test. There is no
  ops available that called onetime only to cache these values.
  And, to create any variable, Need to add as static global in this file
  because these are specific to this platform and I feel it's not
  recommended code to add into any common structures as a member.

  Do you have any suggestion from your side how this can be do it in a
  simple way?

> [...]
> 
>> +	if (!(value & DISABLE_VIDEO_VPP0_BIT)) {
>> +		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
>> +						[IRIS_VPP0_HW_POWER_DOMAIN]);
> 
> Maybe the iris_en/disable_foo functions could get a wrapper like:
> 
> int iris_enable_power_domains_if(core, pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
> 				 !foo->vpp0_fused_off)
> 
> I'm not super sure about it, but that's something to consider
> 
> [...]
> 
>> +	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN, value,
>> +			   value & 0x7103, 2000, 20000);
> 
> That's a nice magic number.. but what does it mean?
> 

  ACK, Will add macro definitions for these numbers.

> [...]
> 
>> +	writel(0x070103, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +			   value, value == 0x070103, 200, 2000);
> 
> That's a slightly different magic number, but it's oddly similar to
> the one above
> 

  ACK.

  Thanks and regards,
  Vishnu Reddy

