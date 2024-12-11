Return-Path: <linux-media+bounces-23181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516E9EC934
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0E6285DC8
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7441C5CD7;
	Wed, 11 Dec 2024 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RX1RBuAB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48C236F8A;
	Wed, 11 Dec 2024 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909695; cv=none; b=kpNBJHMGhFiKhj+dea+1QDU56imk+a5TzW9TmeMizu4PgsTn5hP8VZAIisB2us65+a0E2/vhl6ZWHE849avJvj8TQ2nT2quGnAUefqfXgBsC+j3KYGo6t3Gds7MKkXK3gGy0Fj8PiDm8bqiBA5/rSggBe9IfrZcqHKtHF9LBRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909695; c=relaxed/simple;
	bh=c33r2ehWBz7rLYoK0HOIx4wTOrhHkdzo8wwdPoBOn1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m2pNPJgcm7Ub12ARUVT8fPqnS1L7EunsbNQTygLNIszHIohDAOKeAuOOVmRyRCgED+4apXT/oNSDt65Koa4wZcuOYjdh6G6JYKaBuT2N4/GB1yO+jH6BIjnHcPuqIj+n1txuN8cfN2ixFclIDNqY8jztdiNebcjCISDzRBbiLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RX1RBuAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8BeZD006119;
	Wed, 11 Dec 2024 09:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2RiG0qpypFvoxKundumQMo+byYQ/wLpKnn8/3NAce8=; b=RX1RBuABabqVoqWQ
	pErd/L8ROHP8jz7/8YVZRkp6Ta+Jrt+Kl9EDPukijbpywsj0Al+LkrShN3Vk40TZ
	+awyPwoyhUZQlc8MbXDj0QQILGAyEb+5jNwh8nXrH2+fFJt/EonYC3v5Y4FzaaXR
	HUYmU338b3BWOKVJthOzJTEiWi4GXxoeFik2BJGgec5xdmghP+//abMSt5psoPws
	jE+gy80sA1WS/PEHLNO2y0AM6sCljfFi+VPN4EJQRlGdO6y+gruIx4inp6293s7n
	zp3AGwDYOCMFeajmpFIFwMQEJMN4015kaDFxHRprbzSgCXesHh5+HHpiFI0dLcR8
	TuFDqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f70w089s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:34:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB9Yglq018103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:34:42 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 01:34:36 -0800
Message-ID: <27a2ca82-2e8c-8cf9-012c-602cd421bd66@quicinc.com>
Date: Wed, 11 Dec 2024 15:04:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 16/28] media: iris: implement vb2 streaming ops
Content-Language: en-US
To: Stefan Schmidt <stefan.schmidt@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
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
        <linux-kernel@vger.kernel.org>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
 <20241210-qcom-video-iris-v8-16-42c5403cb1a3@quicinc.com>
 <CAEvtbuus3scTvcjMuxxrfcqnd61+vqM5G=os-aUuM3+SLp2abQ@mail.gmail.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <CAEvtbuus3scTvcjMuxxrfcqnd61+vqM5G=os-aUuM3+SLp2abQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AcOaE0BGX18j-WHv4XDUhR_ISXhm6M2W
X-Proofpoint-ORIG-GUID: AcOaE0BGX18j-WHv4XDUhR_ISXhm6M2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=745 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110072



On 12/10/2024 6:20 PM, Stefan Schmidt wrote:
> Hello Dikshita,
> 
> On Tue, 10 Dec 2024 at 12:07, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>> +static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>> +{
>> +       struct hfi_session_flush_pkt flush_pkt;
>> +       struct iris_core *core = inst->core;
>> +       struct hfi_session_pkt pkt;
>> +       u32 flush_type = 0;
>> +       int ret = 0;
>> +
>> +       if ((V4L2_TYPE_IS_OUTPUT(plane) &&
>> +            inst->state == IRIS_INST_INPUT_STREAMING) ||
>> +           (V4L2_TYPE_IS_CAPTURE(plane) &&
>> +            inst->state == IRIS_INST_OUTPUT_STREAMING) ||
>> +           inst->state == IRIS_INST_ERROR) {
>> +               reinit_completion(&inst->completion);
>> +               iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
>> +               ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
>> +               if (!ret)
>> +                       ret = iris_wait_for_session_response(inst, false);
>> +
>> +               reinit_completion(&inst->completion);
>> +               iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
>> +               ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
>> +               if (!ret)
>> +                       ret = iris_wait_for_session_response(inst, false);
>> +       } else if (inst->state == IRIS_INST_STREAMING) {
>> +               if (V4L2_TYPE_IS_OUTPUT(plane))
>> +                       flush_type = HFI_FLUSH_ALL;
>> +               else if (V4L2_TYPE_IS_CAPTURE(plane))
>> +                       flush_type = HFI_FLUSH_OUTPUT;
> 
> Below there is also HFI_FLUSH_OUTPUT2 defined. Do we need to handle
> this flush type here as well?
The behavior for HFI_FLUSH_OUTPUT2 is same as HFI_FLUSH_OUTPUT so there is
no need to add specific handling for HFI_FLUSH_OUTPUT2.

Thanks,
Dikshita
> 
> [...]
> 
>> +#define HFI_FLUSH_OUTPUT                               0x1000002
>> +#define HFI_FLUSH_OUTPUT2                              0x1000003
> 
> regards
> Stefan Schmidt

