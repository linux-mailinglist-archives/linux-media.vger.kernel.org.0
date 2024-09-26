Return-Path: <linux-media+bounces-18619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEC2987208
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB176B2BE1E
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF81A1AD9EA;
	Thu, 26 Sep 2024 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OMMNOF27"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA31F95C;
	Thu, 26 Sep 2024 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347805; cv=none; b=alB+5d1Byxscu4cW9LVAFwswPmC+22Bn2za56yyMF7ayyP2tPTSLn8L/9deRb1JkwBf8G/1smz0p9Y5pmmqg728Kj47U7PSzzVNgRBfgc/nOJ3uUSW777kQ4aywPTWzN8ghPw0SaIqMaa4hruEBnv7npbavqiSn4cc9lAahzr0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347805; c=relaxed/simple;
	bh=KOdC+8emHz5ejUTsuk5zY8kEMhGHdjbO47X7KVOtWBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TDU43BxLNw5CoMin+6S3nB9ZN1SOoy18woCjme22HOhlZ1LM2qk2jk5w2zZ4oNqPWx/u2ymM2h4YWYE3JWxnepJyRRz+Ckv9QOKzFkXLbNusDFnObZyXnXiGhukABcejWa8H8QYe7YGo2UxH0bbatloe/SLhubQVztXxUcS81Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OMMNOF27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7AMsZ012498;
	Thu, 26 Sep 2024 10:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcJydtlwjUJkn6i5PhnCtNRqyeqaitWcbkYJI1diGt4=; b=OMMNOF272mROt4XI
	wZnr0SUyAzwGZH2PaXe9JuFXrjjbDPD+IjDUtHlcBBAdmamELPjEd8+HBl9zkmOs
	OxqWJ492vKltV9nnxwEtcdoJFbmwihPfZy8SJjHVzd1PePuZzmTby9zs8+Cs6q3L
	+54dKw0BZI8Qk8+neCgDZwSO2wk725gMbVi3WKie4P+/gsMohYDeSbditLc3L8Dy
	wF9qlv6JuelfH7ukiiFxRCSj2U3ryh9FIwiyM8ikvVDfja59g7BUIpA+ggLnyGpW
	1QV77t92MJCNQVFws7qYedKSoa/IEu/XXlApEeyYD+0ojmYqoj3V8HEvZo4JMMHL
	5qY/+w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnfpd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:49:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QAntPt016494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:49:55 GMT
Received: from [10.216.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 03:49:51 -0700
Message-ID: <8ff4265f-96b5-9f96-c8c2-32a95f447e78@quicinc.com>
Date: Thu, 26 Sep 2024 16:19:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/29] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-12-c5fdbbe65e70@quicinc.com>
 <78fbe221-57c3-495b-a9d8-2e40a1612e40@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <78fbe221-57c3-495b-a9d8-2e40a1612e40@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g9RmYKxZahC425uePAtkNb023jtfxDMm
X-Proofpoint-GUID: g9RmYKxZahC425uePAtkNb023jtfxDMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=605 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260072



On 9/24/2024 8:11 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement s_fmt, g_fmt and try_fmt IOCTL ops in
>> the driver with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
>> +
>> +    src_q = v4l2_m2m_get_src_vq(m2m_ctx);
>> +    memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
>> +    if (V4L2_TYPE_IS_OUTPUT(f->type)) {
>> +        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
>> +            f_inst = inst->fmt_src;
>> +            f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> +            f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> +            f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>> +        }
>> +    } else if (V4L2_TYPE_IS_CAPTURE(f->type)) {
>> +        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>> +            f_inst = inst->fmt_dst;
>> +            f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>> +            f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> +            f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> +        }
>> +        if (vb2_is_streaming(src_q)) {
>> +            f_inst = inst->fmt_src;
>> +            f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> +            f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> +        }
>> +    } else {
>> +        return -EINVAL;
>> +    }
>> +
> 
> <snip>
> 
>> +int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>> +{
>> +    struct v4l2_format *fmt, *output_fmt;
>> +    struct vb2_queue *q;
>> +    u32 codec_align;
>> +
>> +    int ret = 0;
>> +
>> +    q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
>> +    if (!q)
>> +        return -EINVAL;
>> +
>> +    iris_vdec_try_fmt(inst, f);
>> +
>> +    if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> 
> <snip>
> 
>> +       
>> +    } else if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> 
> <snip>
>> +    } else {
>> +        return -EINVAL;
>> +    }
> 
> I'd switch this instead of if/elsing.
> 
> A blanket comment for this series.
Sure, will revisit the whole driver code and convert if/else to switch
wherever possible/required.
> 
> 

