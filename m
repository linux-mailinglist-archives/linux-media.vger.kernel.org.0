Return-Path: <linux-media+bounces-36251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D9AED669
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C3A16BDA2
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 08:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C93B242D7A;
	Mon, 30 Jun 2025 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JXXodVTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D22405E5;
	Mon, 30 Jun 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270314; cv=none; b=hD3o4s3ZloB71JqHwwNAXpNAjzGv+DyLMYiHJ1FRiFUWuL6cQlNTE7mmyHmVAc7P42xicMvgpMofcK6nKRbTy+eNAT6dUE6XnzVNws5W24iTJtnc+HnnkWBwNBVaalcgau+ijN3MHsS+kX3y3b0Hj5n/rlogMjI4NJIaZrNBqMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270314; c=relaxed/simple;
	bh=ZZMTRhA3Q5vK75m9Bm+TXk1PAEHuycK5wPjmcJ/x21c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tZkPHq0DgGvWs+Btlsvxt9+xbfB3ZYtyeg1XB8FP13N1Do4yy7md+hGNq8pOLzrpt4/XdxA/S6iTEPHTbZsK8jr3+xVDn3s2KaxxCh8ECa4iDXH4rqvycSiQz4KmK+7QswWxOzY0g7BMqy352hYbbXX2R7IAzWJqsShSWWNDgA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JXXodVTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U4ph3T015659;
	Mon, 30 Jun 2025 07:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GI5N/15siM0TnE6K77k2Bo0tTxSu+QdEjI1bUxwSYo=; b=JXXodVTJK1hctFbR
	Q05TETF0RdiCdNTlb3yPDaDj7fvLcyfJzbvOriAmB+JvkHnsGchWiOqXfeontZDg
	4a2odNY9jadEfDn7QM+gTEknf1qhcizITH+wAp2p6THaJ5sJTr2t32cWuGyjiqL5
	UhaCh2xas9RxQsaB3bNu4R2QJa+GbabJa11JpJ7HTdQp+nQpyN+ppFwwPGRGoOiZ
	oIGgHkIAM81Bujr+4u4KlrcbJgCLvf/7h/xdhFJONMxrkYzPVvYrENEmbdQZ4Tcx
	GehoINsvg9LMciv82wfUMFJofzVwEHukCW6eaHPQIGUuXV7/PHw70OjH9nx6Esog
	zas7uQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkwrre94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 07:58:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U7wQ3M004652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 07:58:26 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Jun
 2025 00:58:23 -0700
Message-ID: <4b7b1406-a730-a0eb-1787-63cce6817ba0@quicinc.com>
Date: Mon, 30 Jun 2025 13:28:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
 <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XeCJzJ55 c=1 sm=1 tr=0 ts=686243a3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8
 a=COk6AnOGAAAA:8 a=OXM8fBZ5ErSyUVfw0poA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2NSBTYWx0ZWRfX1BzwmhAllKIG
 sauQ7sM7Gc0vGXqNU6xC8v8Tj0rEYd5X8eJ2fXVVdK6psDhHzIuD3cN2lbwfZO4xrB+78p63i6q
 Ub+rv6r/WX9nIx+0TxhngB4E/PhpWDhhYil03HBoDHIIvA7RbVvfpbjzS05XB+d8CBgPz67T1iA
 zHrOhg8hWjZ7jYoh7BHbP7UcsBRNRW93pW93Wa7c7KksFEmzNd9YXDL5kJ5UFAB4cTXDAbrXuMR
 WiYxIX4mqA3zhGsHjNyP6txlPNz2+jR2qZTsiOX2M2vN08ttlHZS7W3f/9gvyoXMU8YNxPi2Yov
 DHuCQJDPeBntbH5qdAB7oNRSxO+iQ4XkFZKIoD0SbjwP70OMdD8ZBrH+BXODWXPuTBB0nbQ3z9/
 jhmH+4q3MJiRlkaRTRhJiSxZBm99uGMUwY439eiVa4LNGmCvTJssYeQ4GBb/wfkxphCFkGbH
X-Proofpoint-GUID: upn4LHC0jnaVAxEpG6vyIwUPjp3jdoDp
X-Proofpoint-ORIG-GUID: upn4LHC0jnaVAxEpG6vyIwUPjp3jdoDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300065



On 6/27/2025 10:38 PM, Bryan O'Donoghue wrote:
> On 27/06/2025 16:48, Vikash Garodia wrote:
>> While setting up the vb2 queues, assign "non_pixel" device to manage
>> OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
>> the non_pixel device(np_dev) when available, falling back to core->dev
>> otherwise.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index
>> cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>>       *num_planes = 1;
>>       sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>   +    if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
>> +        q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +        q->dev = core->np_dev ? core->np_dev : core->dev;
>> +
>>   unlock:
>>       mutex_unlock(&inst->lock);
>>  
> 
> q->dev = core->dev;
> 
> if (thing || thing_else)
>     q->dev = core->np_dev;
when IF condition is not met, q->dev assignment would be unnecessary i.e for
plane types other than V4L2_BUF_TYPE_VIDEO_OUTPUT. Refer [1] for the dev
assignment to queue.

Regards,
Vikash

[1]
https://elixir.bootlin.com/linux/v6.15.3/source/drivers/media/platform/qcom/iris/iris_vidc.c#L106
> 
> ---
> bod

