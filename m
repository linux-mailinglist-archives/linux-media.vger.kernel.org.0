Return-Path: <linux-media+bounces-34899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9CADAF41
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF173B55E6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790932EA479;
	Mon, 16 Jun 2025 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BIcPgRsF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD17257458;
	Mon, 16 Jun 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074995; cv=none; b=jFkZiLds70M446brSYZhpxUauBqhtKyvvLiFermAPl1v14eOZ9e3BHfyKdkCAt68Rlsqrwj2e7XPEbU3Lpc7mjnzUq5OdEt8Fv+7na7L+JAjtqBZBQs7IGg7LNUvRFJBkbh6HfZ/RUKQhbwmxDDL9zl0plFWU8s8kPOVLQuFfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074995; c=relaxed/simple;
	bh=1BYl8vGZcp8qkQIS/k7/EDF7txlfV4e2fvxJT8xn5Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pTqff4FAutoDPbVEYRIGyotq3AXhA00ULQkTpV8nu6dGrA3ieeWD/tHCDBB6DC2l3jEC6cxb6Ik77+6jTgLxqKnRVPcjlEk01P3qaZP1wvyfI4c2GrfWNbJ6Kwv1KNPz1XvpBLBrmRSYuBtkFClsJsgANZ8VfnFHPVOmmIYEUZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BIcPgRsF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8QtHa031850;
	Mon, 16 Jun 2025 11:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtSOvAt0q/d0enJM4qc+OSsnJ7dqqVOnt42/ihjbwqQ=; b=BIcPgRsFgG3NZJXR
	71xfl07VSThDwEzHBM0Ku5ofB6k+nhor22vYd6fKn4fd3eV5t4FIebBydqGNDRqP
	9CSqi8a+kE4deEqOhMVDjldBnweFG47tsTsfz8TYEb6ylqtj/WsccbBPclgiZDMe
	jbJxsBrbqgChsd1fsg2Ft/iSwe8j2gDDBTEPllFBmyOQ6IxRyDCd/F0RO8kcR3Ad
	LSFLRjv78xMt0zqxo+VBia5ZWkcOVBO8UKTPc0qjgsxDZmAQar7fn49DX1Lc7JAT
	HZeX+vGCn0JJHXrfPrcRk0Lc+HaYL+5cJ5Uf4GmU3zfg0hc9oxC7L4Qx0YQbxhcz
	6pTHdw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9varu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:56:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBuTwX031350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:56:30 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:56:27 -0700
Message-ID: <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
Date: Mon, 16 Jun 2025 17:26:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_dikshita@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <loic.poulain@oss.qualcomm.com>, <mchehab@kernel.org>,
        <hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QfcPl0fUP-qRbJVCiZHgP8HGGykswjz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3NCBTYWx0ZWRfX5OkmvYYblrzY
 TIz039kHECRG2xs1tarlG56pFUiYSIS9Y+3yNqYayfQr3gUPWRGEU5ad6RJJqEtkNLrS+DpWO/b
 ML2J4cvrqBofjJD4dgifpmqNn2oXi+O/iMbwM/mrB/lXDa3WH9/6J02J2/7PzYpJWENe3MVwz0v
 jVBkcYkb+VkpeetPVcQXuWI98tq/LnE6FhQQjHSJAq5NcxVFM2EkA0UbJMYmFajXkhwlFWqB/Tn
 kY1ezHhTnVw8UPtCwcJEYE1mtC3e006btbglyrWGgO4qXNTX1cyrqmuXAgaLg1PmDVffRGY7Q5X
 uBTTZUTDLIxVgTJN0WZiSO+JxmFRadATKpLocgcboZoeyOkL9xG7+26UUNwe1mvofi2SHZhDZHA
 UU/B/w4dTBEyQAIF6MHWnPKjefc1PHXlTi+n9EKJSTBndkYTZGI0tDUFGjUfftOzC6QtS+Yy
X-Proofpoint-ORIG-GUID: QfcPl0fUP-qRbJVCiZHgP8HGGykswjz2
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6850066e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=U5IicJL0JrA6Xyt5t0MA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=767
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160074


On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> Ensure the IRQ is released before dismantling the ISR handler and
> clearing related pointers.
> 
> This prevents any possibility of the interrupt triggering after the
> handler context has been invalidated.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..d9d62d965bcf 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>  	venus_interface_queues_release(hdev);
>  	mutex_destroy(&hdev->lock);
>  	kfree(hdev);
> +	devm_free_irq(core->dev, core->irq, core);
Could you please check and add the handling here [1] as well ?

[1]
https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427

Regards,
Vikash
>  	core->ops = NULL;
>  }
>  

