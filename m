Return-Path: <linux-media+bounces-20156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5C39ADBB2
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0495B227B1
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 05:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C5B176FB6;
	Thu, 24 Oct 2024 05:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PSRigfJi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0B175D47;
	Thu, 24 Oct 2024 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729749144; cv=none; b=Nx8Rd8h6JSmpUG8j2LNLinLGKTQ4gYjlOw58kxhuSQA65rhQS2VPkhYc56i4gtX8AdwD36NVQ5yX+gKj6hvZcF/9C7wfwsdFBcGvTtIzSR0fSUMgB28Db/SYul/a7rc9HM28L/GCI4HvcCLr6jBmW4UUhUfmrMN4kd7VLkQSFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729749144; c=relaxed/simple;
	bh=H/v2vKPXkcQ5t90AgsLCbyIR8E+ZB2BVZJQwBlliVgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DcjShZh7PwHbei3dwewcFYMFfDlV0QdoaHh4mtCB5x4na0Yx5Q+A71Bek2cuR5g1XY5U1VcDJ7KBvXiVfFpB0bElQ5lhoefsWF2I93c0l+5Bff+quoz5isjyPdH3BaR57XhVd2yo3/r6cn7GLoL6DKmxcmGYgQwuDwEC1Ojl83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PSRigfJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NL9gY1029454;
	Thu, 24 Oct 2024 05:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJeOHwrcBgZcKztjE3nBe45ohKy9u2fJ3xGNMkWvCLA=; b=PSRigfJi33NbqriX
	L1rqFq62ZD2sYOpBuUVBf/MwJlG4uZLtmJHLcQQ83g3yBeeHF1uy5uemLKHm+yya
	fvnho2mritjSD3iY0mJYeXCOCKUn0yIGxWe8dYj7re3ciPmzbZ2MVE9A/yZOQ2XZ
	YSjXJD/oRByFTIUAjI18V6lo+IZSb26oa8fIiDxIwjEWYdFPklXiWTa1hR3EJs9F
	3NDLjkKyDAhYyFogQubpVnlGTSCl+0ELREqNWYSFbkobDsn7Wi9Q33tqL3LxmIqh
	S5ia2Xkc8SJwCykVFsG/jIVU9vsrugNbxUj0ZmUwD/0aFpWIduLD68p+Sfpsry7j
	3Sbxgg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w4mv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 05:50:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O5oH18019941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 05:50:17 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 22:50:13 -0700
Message-ID: <593ea165-c3d0-e247-b6fc-d9266673858b@quicinc.com>
Date: Thu, 24 Oct 2024 11:20:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 15/28] media: iris: implement query_cap, query_ctrl and
 query_menu ioctls
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
 <20241014-qcom-video-iris-v4-v4-15-c5eaa4e9ab9e@quicinc.com>
 <c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vqQSDjV-aW-yArHobwcxZhxJ71ppJbSf
X-Proofpoint-GUID: vqQSDjV-aW-yArHobwcxZhxJ71ppJbSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240041



On 10/23/2024 4:35 PM, Hans Verkuil wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement query_cap, query_ctrl and query_menu ioctls
>> with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vidc.c | 52 ++++++++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 93d2be118a81..60ee05b67f86 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -300,6 +300,55 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
>>  	return 0;
>>  }
>>  
>> +static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
>> +	strscpy(cap->bus_info, IRIS_BUS_NAME, sizeof(cap->bus_info));
> 
> Filled in automatically, just drop this.
Sure, will do.
> 
>> +	memset(cap->reserved, 0, sizeof(cap->reserved));
> 
> The core zeroes this already, just drop this.
> 
Sure, will do.
>> +	strscpy(cap->card, "iris_decoder", sizeof(cap->card));
>> +
>> +	return 0;
>> +}
>> +
>> +static int iris_queryctrl(struct file *filp, void *fh, struct v4l2_queryctrl *q_ctrl)
>> +{
>> +	struct v4l2_ctrl *ctrl;
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +
>> +	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, q_ctrl->id);
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	q_ctrl->minimum = ctrl->minimum;
>> +	q_ctrl->maximum = ctrl->maximum;
>> +	q_ctrl->default_value = ctrl->default_value;
>> +	q_ctrl->flags = 0;
>> +	q_ctrl->step = ctrl->step;
>> +
>> +	return 0;
>> +}
> 
> Huh???
> 
>> +
>> +static int iris_querymenu(struct file *filp, void *fh, struct v4l2_querymenu *qmenu)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +	struct v4l2_ctrl *ctrl;
>> +
>> +	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, qmenu->id);
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	if (ctrl->type != V4L2_CTRL_TYPE_MENU)
>> +		return -EINVAL;
>> +
>> +	if (qmenu->index < ctrl->minimum || qmenu->index > ctrl->maximum)
>> +		return -EINVAL;
>> +
>> +	if (ctrl->menu_skip_mask & (1 << qmenu->index))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
> 
> Huh??
> 
>> +
>>  static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
>>  {
>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> @@ -366,6 +415,9 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_querycap                = iris_querycap,
>> +	.vidioc_queryctrl               = iris_queryctrl,
>> +	.vidioc_querymenu               = iris_querymenu,
> 
> queryctrl/menu are handled by the core if you set ctrl_handler in the v4l2_fh struct.
> 
> If you use the control handler, then this should never be used.Right, make sense, will remove these.

Thanks,
Dikshita
> 
>>  	.vidioc_g_selection             = iris_g_selection,
>>  	.vidioc_subscribe_event         = iris_subscribe_event,
>>  	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
>>
> 
> Regards,
> 
> 	Hans

