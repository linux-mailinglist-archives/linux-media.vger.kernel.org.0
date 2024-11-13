Return-Path: <linux-media+bounces-21350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE29C68B7
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 06:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD799B25652
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 05:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E36D176AA1;
	Wed, 13 Nov 2024 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L4Kkrldl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D3433CE;
	Wed, 13 Nov 2024 05:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731475698; cv=none; b=Uh00i5QUjGifjGCVsDEeYqBI6un6VEjTg9xewrsXFZehFD6YHdquKCAdGRmNMtPn9yG0pj0R0mEuGXNVr/JMJ+HB+amEcqUB3skN9itiIZZfCe2uvjTFqiw/P1z0LNPlcRFa6QiI6GqhZkL3hyvjjCRWER4mIdbs+Cchuw4wMLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731475698; c=relaxed/simple;
	bh=bFhDbcibcUIfqOUCObArlhGre9CxabtpfkyUFGyTGZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NmH8RX/6MQU33bYLg32gzGlt7+CVfptTC58D8L076ZWBhD5lG2Wj87e4AH4YFRpznBkvX4JUx/cZnQ0795VQsCKCuM6A6uPKWuQUV9FDDgPcicQZmH0PZCKco62WWXKjeGYtUMk0oAO7r1APaxEqvPpW8rlHPD0gYrD1hCBynXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L4Kkrldl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRQCk015377;
	Wed, 13 Nov 2024 05:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GewPUP69RvDIsXiVEHqDKeE6ME+K9aiD7VrhgIl7120=; b=L4Kkrldl0ZyxLBij
	0bKi1wDhvaEoIvia6iYffWJ511ZBjsHn4B/nXLizPNPX+p+mxbInNhclI3CAw4Mz
	HxGbXWCiHP4y7970KNV/MbeT2DyKxusMR/nv5/z7j9Gfo1P58e0XvfV1CuoELpz0
	Wy08GL8RSMnPl1h0OUQVeYikIqJQd/g5gqydCq0/Ne83j8YA+3WhKay3JkiRg0E9
	a3bQ/KKiDOAXKaHKllCEM97U6n8FBCFE9ru3Wjd3DbCC3Lrz/manBSoCTrDKKr+3
	qvrSpGGyVsH3+60bQS6+eaaN2k1EOXfp0du9Kds7XtSieaePzRGupi8Q71D2yqoy
	2aCa3g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t1189nd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:28:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD5S8uN027714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:28:08 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 21:27:59 -0800
Message-ID: <999d6a7f-c0c8-498f-04e8-7d38a23cd327@quicinc.com>
Date: Wed, 13 Nov 2024 10:57:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 15/28] media: iris: implement query_cap ioctl
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Sebastian Fricke <sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-15-a88e7c220f78@quicinc.com>
 <39aa2f6f-200f-4578-bd4a-4599a8f9f7ec@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <39aa2f6f-200f-4578-bd4a-4599a8f9f7ec@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F98OfzpxJlRa2YGqzhDGUbi2gde8WTZw
X-Proofpoint-GUID: F98OfzpxJlRa2YGqzhDGUbi2gde8WTZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130047



On 11/12/2024 3:54 PM, Hans Verkuil wrote:
> On 05/11/2024 07:55, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement query_cap ioctl with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vidc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 820d98da3190..e270711b8f6b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -303,6 +303,14 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
>>  	return 0;
>>  }
>>  
>> +static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
>> +	strscpy(cap->card, "iris_decoder", sizeof(cap->card));
> 
> The card field is supposed to be a human readable strings, so I
> would suggest using "Iris Decoder" instead. Up to you, though.
> 
That sounds better, will update.

Thanks,
Dikshita
> Regards,
> 
> 	Hans
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
>>  {
>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> @@ -361,6 +369,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_querycap                = iris_querycap,
>>  	.vidioc_g_selection             = iris_g_selection,
>>  	.vidioc_subscribe_event         = iris_subscribe_event,
>>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>>
> 

