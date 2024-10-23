Return-Path: <linux-media+bounces-20109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 288389AC8EF
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 13:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D5E2823C5
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 11:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E187C1AAE37;
	Wed, 23 Oct 2024 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AAZYn6Cw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F31145B1B;
	Wed, 23 Oct 2024 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729683081; cv=none; b=jFJuyz+gpEYT/Ul49xvSH2qXUI7FsgcFCDjxvMU2YzHs1cKBDnwdmRbdzOvOat4R1H8aCkLHLeFLg8wqsPb2gowrahSlcOqvwKw5+0swu+zDHtQUb+X5DZU/CnqF88a/RuEqVG0udM6+5+1QO3B9kSWvGqv+enXHZae2iSClEog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729683081; c=relaxed/simple;
	bh=ewHoWcFkWh06SU3I3qkb/UiJCEdNK9w+nLRz0rDIEDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XlmiUSry2tTYk4JdDHfa4NXiOWl0d8vRvrdDw91+w/bYnXstEAS1hRgs49iQ14Ynl7iTOjjPJOCG3t3xHtJT7/Vc3qjtqujhjRx7Mtc14Q5ydddq6AjeGwYQcNnGwRPEzmNzv6ezt9HppsxqyURzca6zqLQUNVBMCLgWga3GYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AAZYn6Cw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9hxoK025444;
	Wed, 23 Oct 2024 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9cYMmbebG1hDrghxE1wnhoNmTTlTMcqgbTzOfzVsjg=; b=AAZYn6CwcS33u5vI
	x2VJ45YW23GTFiBqqkO8k1et0kw3AsaedDYfGVSkFbVDcAi/zt0CTOb2z2ZOOlP/
	5JTn14ITSKoNYix5huV8f4yauEHaZAbIxIKEoKrIlsw74T68SG0G/iU/L++SZ9a2
	mH+hvvg9ROWejhms0KdUMFUwiPA8NKVKWlLDi7Wc2jkU4yNHsDZKeXoI50aUXdm8
	riBOHfiWieHSc6YAgfBNgnbS0u5yRfVDPs1hNRn+KpO3Wo2mxs5YznC0XepNi8D4
	J9yb8LeZTFjhbSsjNqKNTBFZZ+LdXksKGk8W1aHejm8uTN6Km1bG5CaalNBOx0XX
	AviZGw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41syve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 11:31:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NBV9n1010193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 11:31:09 GMT
Received: from [10.216.48.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 04:31:04 -0700
Message-ID: <c841e94e-0468-5863-9cb1-403b83c3510d@quicinc.com>
Date: Wed, 23 Oct 2024 17:01:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 11/28] media: iris: implement g_selection ioctl
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-11-c5eaa4e9ab9e@quicinc.com>
 <ffbbb1f2-81b0-40f5-806c-4bda3c9a3ce0@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ffbbb1f2-81b0-40f5-806c-4bda3c9a3ce0@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ybdtXgu1g8Xtr6EhN0C0gfX2qpvTlWN_
X-Proofpoint-ORIG-GUID: ybdtXgu1g8Xtr6EhN0C0gfX2qpvTlWN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230068



On 10/23/2024 4:15 PM, Hans Verkuil wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement g_selection ioctl in the driver with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vidc.c | 29 ++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 05146970189b..481fa0a7b7f3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -256,6 +256,34 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>>  	return ret;
>>  }
>>  
>> +static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> 
> For g/s_selection the MPLANE type will always be mapped to the non-mplane type,
> so you'll never see V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE here.
> 
> See v4l_g/s_selection in v4l2-core/v4l2-ioctl.c.
> 
> It's a bit of an historical artifact.
> 
I see, Will remove the check for MPLANE then and keep only for
V4L2_BUF_TYPE_VIDEO_CAPTURE.

Thanks,
Dikshita
>> +	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	switch (s->target) {
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +	case V4L2_SEL_TGT_CROP:
>> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
>> +	case V4L2_SEL_TGT_COMPOSE_PADDED:
>> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>> +	case V4L2_SEL_TGT_COMPOSE:
>> +		s->r.left = inst->crop.left;
>> +		s->r.top = inst->crop.top;
>> +		s->r.width = inst->crop.width;
>> +		s->r.height = inst->crop.height;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>>  	.owner                          = THIS_MODULE,
>>  	.open                           = iris_open,
>> @@ -277,6 +305,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>  	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
>>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_g_selection             = iris_g_selection,
>>  };
>>  
>>  void iris_init_ops(struct iris_core *core)
>>
> 
> Regards,
> 
> 	Hans

