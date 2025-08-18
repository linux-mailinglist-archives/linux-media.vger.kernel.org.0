Return-Path: <linux-media+bounces-40085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 611BEB29976
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18FE3AF6B3
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054062737E2;
	Mon, 18 Aug 2025 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gBwOfdvn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7735272E57;
	Mon, 18 Aug 2025 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497531; cv=none; b=ThvPKTnTsOkeAic8qSi9qNO8LqAfij+huwLnfyqy0/V7oRBx6N7OzfA1jhSRsh/pfXCjYv6xxLlBcmc9q7tjPx/FJi3ygDxETr5V4dQqtlyWxAYCmOrDhyDyuow2a/eaoXwBWqV1ZtpCrrRriB4NFnCo0dJiZSiYu0m9zPUNlIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497531; c=relaxed/simple;
	bh=k5+lnZCy3bbJQWIQlZajAPBCXul72lc5YgzY0UiCoZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CPLvgeQL3IUFF9oeoxHnZreFuaWi4yXXZ2+MKxt3loGF34F4zQmaSkxeP0yVk0evi4OeP8rchih40JsUYSg9V6yC9chGl/pm4WnArPE+DgF4WeC/Ct58S0ljxXVvu8bU8+Iz8vWeX91leePXL8irYYrfBlNihhImFrJUusQTQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gBwOfdvn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMK1ut029297;
	Mon, 18 Aug 2025 06:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAzgVjzlROh+WMlimNMYUi0EuuZ3Rm0ae5ucHon2lUU=; b=gBwOfdvnXaOjhzT6
	laQs/RR04vodlSRotiYsNxmbVkHNyEcImJI+98GLrUesDKXLRylTg2Vr86eBKsm8
	JBnANaw8ulHfL0Q7j3D2Sb2SblJIhVurBne8LASH+vuVtWT1209gujEHasHO2n0L
	JUTsGlIA1djvuJ09oGse5nwWJBBNetCj4J+k9Vafw5soqxEIa4WVpBfqG+a4GJI9
	aZW/+ZfAW/NP/SONmB97Qu4CFPV//Go/Rf4sR0aqI5nQMpVC+DvXEK+LhgYuoy5H
	rQ1W4RSNjGmMItPSov50dmP7nwtf/BkuGwEosqFGGcvkz7w6vJIo3DQi1F1J+27e
	hs3yiw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ubgg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 06:12:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I6C3n0032142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 06:12:03 GMT
Received: from [10.216.58.185] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 23:12:00 -0700
Message-ID: <ae63b3c0-e3cb-b81e-6bf0-13818a5cc42e@quicinc.com>
Date: Mon, 18 Aug 2025 11:41:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 17/24] media: iris: Add support for G/S_SELECTION for
 encoder video device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-17-c725ff673078@quicinc.com>
 <35023387-c0f3-8c55-c6e5-8e3faad31c34@quicinc.com>
 <95ccec65-585b-bfa8-f568-30d18fc2d65f@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <95ccec65-585b-bfa8-f568-30d18fc2d65f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a2c434 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=Xin4P_2dbwo8wyik3rEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: H9nUwhOUbSLNhiklG1zxoMqfaDqRdELo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX0L6a0Wi8HHHS
 1lDwAOOJ+XCPCVs/CvKhr2NmsHXj0E8bdHy4k9g+QTyOsWFq1l2lFYFwfwuuaSzmVdH9umj89AO
 QasCApaeI5lEZ/fPFgFXqfMYuo/nsW4Cf2OoXWC6ZQ9DXF8rUVzJPMQQuRlqRax/xFt7XuyoFdl
 IBcvyUc3Ir62HP/mqSaP94NB4klKSS7ur7BDZkRT8Rm4/W5P5fRv2sr63pvFdo2+kN6tN2E2c01
 MobbRTQsd+agWFFqhBYIsEUx50fPeTbnWC5CmYqQ0MX9HEUirWpny4FY4wBa/3xfeFqVzYRAWau
 YU5DOvTGX5gFFYhIyP+uKtZNst2SCepQzHTh9Aa8lK8G2TEw2S7em3ISFlMWc1/GiLa4Sz29nN2
 /pl0IRLC
X-Proofpoint-GUID: H9nUwhOUbSLNhiklG1zxoMqfaDqRdELo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031


On 8/18/2025 8:55 AM, Dikshita Agarwal wrote:
>>> +int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
>>> +{
>>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>>> +		return -EINVAL;
>>> +
>>> +	switch (s->target) {
>>> +	case V4L2_SEL_TGT_CROP:
>>> +		s->r.left = 0;
>>> +		s->r.top = 0;
>>> +
>>> +		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
>>> +		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
>>> +			return -EINVAL;
>>> +
>>> +		inst->crop.left = s->r.left;
>>> +		inst->crop.top = s->r.top;
>>> +		inst->crop.width = s->r.width;
>>> +		inst->crop.height = s->r.height;
>>> +		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
>>> +		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
>>> +		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>> Why do you need a return here ?
> We actually don't, it should be safe to remove this, will fix.

With that fixed,

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

