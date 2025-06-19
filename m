Return-Path: <linux-media+bounces-35415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB61AE0C5F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 967C64A57B1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F1D30E84D;
	Thu, 19 Jun 2025 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CQOUOu6n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44230E825;
	Thu, 19 Jun 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356689; cv=none; b=oNTVhkufQ0icSMg3oBHzQfuFyWjEj5+ZW2FmD07dY2qXXnRXt9ufQ+o6j44/4zntk4s9Kb69aZYqsjBPA+DjwP9bFODJ7h2Bs+tccNer0yYQVkVWxkaoQy0ElaW15SJ3j26L9ZIUPTVNPhnuPPL7joNqbYkMJ1wK//nKHs3hf90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356689; c=relaxed/simple;
	bh=gndn72D5AOE6O4oF4sfccge8o/V0cR4aj2LeYA5Vo5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SRI+yOJCv1O/nue7MseAsJsvRvKVJBCTeBBUu9bB91qY/lgeEITqIrUZkoA3OCNy0XZEWs04Txuzk27uKdIE6Us+ex+zL0WZaa2cznX86b6GxFQ2YYQokoHO2qMnX5RIwJu4FgjKUkgrnggDmEET6W33sp+njVixWky90/vWPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CQOUOu6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDYA80002625;
	Thu, 19 Jun 2025 18:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KF3Rq9p7XDPS8vG/WULk68Pn/cCnnM7nBO7pj/8AOk=; b=CQOUOu6nHUHcD14A
	S7o9PU3Ms8vyFhy5dxGXjbaD98eGoZpc6I5CafCcqb5IL5uVF6PCo/5NWJ/Ff6la
	AZGkX7Wo3Vp20gvQRpM/pnrnedkhdzPvlnQ7QK4QJ0draT5OcWF31F+PKw0MMfbr
	er8PpZujI3NmvQIz8EinYK3nA5AavKZolLBGyAc5JZxl56dCGPQFUf5zfrS/4fNo
	TiBE9B+ghjqGrqvipUqLwMDZlWquSrBDQz6fZX7sn3Pj13CkQKpFHi78mrr63sGQ
	hsrwliByl50VEuSCM5L0dhZ2yUuWVVs8yrbx/I4S84MxZ0HnsgcOgla+W9fZtAg/
	gr31oA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd8y38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 18:11:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55JIBM5L008400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 18:11:22 GMT
Received: from [10.50.57.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Jun
 2025 11:11:20 -0700
Message-ID: <16982155-d51a-82a0-6b16-785cd99ab502@quicinc.com>
Date: Thu, 19 Jun 2025 23:41:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: venus: hfi: explicitly release IRQ during
 teardown
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE0OSBTYWx0ZWRfXy6bUkQd9Apvy
 So2V1g3ZViBeUrj+EhkPVa0DfkVoQUwE8ltVVp0gKrPoP56QGof2X/1p7swa+7OxcmAr5ivJiom
 tiLJtuPlgEz16UDnVeFtiyEAC2lp/QyJsgt87oK3btXr4YcKrp+vPlh2waTFZslwHgRTBJl1Obj
 Wq1Q50dMdPErNTVzPIdHV50TO90l2/9FT149UGE5V061KYp0HCqdi86tRdinlUVO+Acr80g435F
 k3XpmFx7RGrXzyI8NIE4bmDYyHvxBODXK3o/njvyIQ86jI3z3VbS1ZUJl6mjQVnC9pQ8cQgt3MH
 D73Z3Xq/pXWFV1G50mGLv9VAcnMTGo8Ot1YH1iLLxxMaggaw1m+izkUCRmLZoQ3iarTdTGy4UAC
 9tjlU5DJwz7Q7fq831mwTQrHeCmcx6zi9DyVn8RufRU7iXcilPvwjgA9VlVH1bngyGe4tQj0
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685452cb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KVH4ev5q36qbvSy0r5QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KsF7CixRg6lBuvtxuTN8PhVRIDRx0iHP
X-Proofpoint-GUID: KsF7CixRg6lBuvtxuTN8PhVRIDRx0iHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=647 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190149



On 6/19/2025 1:18 PM, Jorge Ramirez-Ortiz wrote:
> Ensure the IRQ is disabled - and all pending handlers completed - before
> dismantling the interrupt routing and clearing related pointers.
> 
> This prevents any possibility of the interrupt triggering after the
> handler context has been invalidated.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
> 
>  v2:
>     disable the handler and block until complete.
>     allow devres to release and free the allocated irq
> 
>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..ed003adb0282 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>  	venus_interface_queues_release(hdev);
>  	mutex_destroy(&hdev->lock);
>  	kfree(hdev);
> +	disable_irq(core->irq);
>  	core->ops = NULL;
>  }
>  
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Dikshita Agarwal <quic_dikshita@quicinc.com> # RB5

