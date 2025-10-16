Return-Path: <linux-media+bounces-44696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591EBE241B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 260673AD8A3
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D83930F539;
	Thu, 16 Oct 2025 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T+FXG3CK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047630DEBB;
	Thu, 16 Oct 2025 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760605176; cv=none; b=HShMjD3qrDWyIytskIbCXCnKLgVRTIkOhUAPaN5w+b98J9jjOoBhefC48gRKcynYTsbazfTrDlOWnpCXIepD1+CN3VrFmkEIfOzjQtpiez2g6NOaGxp9MIjD68rgfL2IYDCepOTfrhIL312z+UgIqERBOOHJDZo6D2goj4H+Jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760605176; c=relaxed/simple;
	bh=CT88UpQFI3HX6bNSK3aTU+q2j9WrgvX5OffmctqOo90=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gQeWXOji56h9tMiz3sBif7bNh+wDl+GrMc+VOIg0fmlees34fHbIJzVWQTX14EX/VQB25gAKb+V3ANU/UJNXz9aWVu6JvOKn8hxy5juXKz6gw5mXhEByDsYao/hy/iY6zY1cE/ImD4dcOvl826Ajxvo6RovsHTrucitsAx7BkD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T+FXG3CK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6kenm004423;
	Thu, 16 Oct 2025 08:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnxBezHZ0UxBuUOJ4/hD8M12ol/OfEDLD1l8lQnE+tM=; b=T+FXG3CKhpq4JiHf
	Lgz+M19LWqvEuGJVqribtSHhcySZWYGAodaOgUrY9NoJUViS8bwwmHs48vr/vZOx
	CWo/QJcuh0jD6J/vkxPhSb1LGo3dsUCTnTmcrKWxJf0WqeJfQfgjLeeKYpp1Y/x0
	TRf2bVczLZvhZ+bGgjbnqO+BOul8eTY3IM6FNtrp8hb3ls/WXpEn03/Xo/yqJQ6f
	PG9APHIZBdmG1s7ugg0DujjHueEaC8m8txR6dh1cRMUkuO0KI0TcepAmP122mWcf
	2XQam5tJTjzfzqJmHylvruLsTKJXFLXpl/dlO7MFzWB7Rear2RoJSuoSUCDrwi66
	uMdo6Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1akx8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 08:59:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59G8xTTO031675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 08:59:29 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 16 Oct
 2025 01:59:26 -0700
Message-ID: <7d9f8ec0-574b-4535-8064-7deb2309e74b@quicinc.com>
Date: Thu, 16 Oct 2025 16:59:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: qcom: iris: Add sanity check for stop streaming
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        <vikash.garodia@oss.qualcomm.com>, <dikshita.agarwal@oss.qualcomm.com>,
        <abhinav.kumar@linux.dev>, <bod@kernel.org>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_qiweil@quicinc.com>
References: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f0b3f2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8kNo1vfqJQJ2e38LGaYA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: _-lmbAKBUh_CH4L4AsKSeIDwjXZJt19W
X-Proofpoint-ORIG-GUID: _-lmbAKBUh_CH4L4AsKSeIDwjXZJt19W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX+h9aob9XKnxi
 CZLK2A13cmUbr5sozJ1/C5hiXGKiUBX22IdSUazBa4DCuMeuDGi2rTjLNieEeO1QZnnFFqyxDPc
 JHrfcO6W1+OBccjDTF1FoT+2Rxf5w7SD75UKCsItcclCJGdWFrG3U34kW/rBt6kZ+XK8PvTJV3f
 MNa/TsNa9NiKtsUQYwvrnT2fNONRWAzgUrCs9ULMVd0ih3zlJUTJNfdimcqjjZTfkuSEKPPlCbH
 3Uoaz8FMMI7Z/GrlJ8WDkm+fTokxKGDPHfLoRYOuPFnS+/EdS2Lq8XMDO28llNrXrlmmPaF4dOf
 Y8k7kvlwAFGzf4ivVAWlGDQYmNlsK6ElQVYnSJQFPraMuNnGAw9Wo3h31SJQ0wI0U8gJlCONUyp
 mug2RttbooesM4UiGB6gpuKfeqGMYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035


On 10/16/2025 3:25 PM, Wangao Wang wrote:
> Add sanity check in iris_vb2_stop_streaming. If inst->state is
> already IRIS_INST_ERROR, we should skip the stream_off operation
> because it would still send packets to the firmware.
>
> In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
> and session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 139b821f7952..c1647fb4f0cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,16 +231,20 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   		return;
>   
>   	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;
> +		goto error;
> +	}
>   
>   	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>   	    !V4L2_TYPE_IS_CAPTURE(q->type))
> -		goto exit;
> +		goto error;
>   
>   	ret = iris_session_streamoff(inst, q->type);
>   	if (ret)
> -		goto exit;
> +		goto error;
>   
> -exit:
> +error:
>   	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
It is necessary to distinguish between error and normal states.
>   	if (ret)
>   		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
Best Regards,
Renjiang


