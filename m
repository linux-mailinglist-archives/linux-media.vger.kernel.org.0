Return-Path: <linux-media+bounces-34898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E89ADAEEF
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEB353B5B59
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB892EB5D1;
	Mon, 16 Jun 2025 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ohFRlJy6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536162EACF3;
	Mon, 16 Jun 2025 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074282; cv=none; b=sMzXbRdJuaPdX1KoktBrqFRddrZw9qGst1gJ9bUJHBgHMeylhUYLdIViM5VxmfXu+kQ84gzRRyXb+jDlQ6ssq0CV4+g1ZFxqV6S1PRA0jpOkFim3Pj+7WyG63kJrg8/8ag6dpilMYypmX8cOQ/WIOYUbJiLKaAEh0sG0QATwFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074282; c=relaxed/simple;
	bh=pfS4a1mQcR8C1j18VxtN+3heDe0otE1topAqpcoliPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fI8b5XAJp1vqdr4IYH7A8qkDEE9+If0/u5bNCfFdEdcADQgpLx7+SvA+zJbubfI6RNHIONiLF/A+4O82EhfR6sJHokQ8/3L68xkH3ZsRdb92mOWrqQIBS+oyp2O/3YkFfFBPfujf9957WjCnh5ndESAkBDKmSAgi9uXOs0SzR3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ohFRlJy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8Z31r030943;
	Mon, 16 Jun 2025 11:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g04gCpq+CC9GlzZIX7or6RKgloPBqc2i2h253lrHOFw=; b=ohFRlJy6/NJgz2GQ
	/8PwMrEQXB4NLHn+ql41iw9QT28hp2tEYZaqIaLRn2nqVU1k/ahzpssVtx6z9aSw
	EAy9h1lgZhYSqFbsU/nzuQcztuF0pEU3psycZQjyZ9N+6nGHzbV24hdJN89gf9Q6
	bXw73Sxa6MknUqmdJAts/M8eO6Muth170slQULHn+tnkWWMGyVhMcxMq7EBikgK1
	Jnb9Mz+v4Kp1lfjyz230vib7NYRpBxr/51Kv9XKI5MJuXNXj3wdRNZ6rHfs5xpb9
	lKzDLbEv6Jn2fOIDDTipD80WJvNFVgHMfeao39R1fwKJOVm11Ay+xhEeD0kw6JTq
	N1yp8A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crma1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:44:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBiaEn006195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:44:36 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:44:33 -0700
Message-ID: <af4905a4-67b7-4e56-2df1-8bb81e96934a@quicinc.com>
Date: Mon, 16 Jun 2025 17:14:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_dikshita@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>
CC: <hans.verkuil@cisco.com>, <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A9_KDENXbhe8kRhv40hPMOADJ7k9Oi-j
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=685003a5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Ez5CtaCykSblQmOPNncA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: A9_KDENXbhe8kRhv40hPMOADJ7k9Oi-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfX5HohrvXbxb8Z
 a4SkCB3DzOKSNxjwE7eor2okB3oQ+Rqfwl04HvuSsOmzA7cp9JknNHaUfVP8Rm4WQw05eqfJdrY
 bQmoEaIIVWqWCqd9lT6hfy0BclvfYZnJWxy990TtMF+ikkKliOZ2Uk3okU9/OpCx/qppiL8A/g0
 zHTT4kBKqJDtya/Io2GT7HFuXYoEEqra8/GoX1wUT/dr3/1+3u/WMSEv7P64E94nlSmQCNJreiC
 J3O+MClsTe02eh9I7+dL6uQrIsn0TQXaFUVpEAVe3jVx+Izwg4N8ihRfK8RouRUbc7uG5rA+MKb
 k1X1kgbbJbznUMYBQGRxE1S8LfeT2OoJ1C9uvaQEE6K5RZYGoAuyMIicc2InSh6vLvsEUV0FRoA
 ihfW6Hf0qs7WCVVgqnXaAYB1Hab7ntjxaSrUmq5xABgC4d9rJXi+lpsFxXrtgMwig/CTVk0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=877 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160072


On 6/6/2025 8:55 PM, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  v3:
>     Added Fixes tag
>  v2:
>     Fix authorship
>     Fix spelling mistake
>  
>  drivers/media/platform/qcom/venus/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>  	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>  	init_waitqueue_head(&core->sys_err_done);
>  
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
>  		goto err_core_put;
>  
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>  	if (ret)
>  		goto err_core_put;
>  
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

