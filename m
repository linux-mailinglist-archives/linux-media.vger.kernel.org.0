Return-Path: <linux-media+bounces-23177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954D9EC862
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4815128600A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB9E1F8683;
	Wed, 11 Dec 2024 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ri2oFfl7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EE81FA8C6;
	Wed, 11 Dec 2024 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908057; cv=none; b=XgcdV3c1cPA4jAcAgGQBW2TNQ54kVPEQNOJ+W54nZq80LjYFnx53IEudqPDPMzXwyU52GY1GT29+zFEijgL4gubVdAaaWXe8j1tlyyRRIlYCOXQL0+fTtCn+kYl7FWgdxY7so6xuvff8+r/G003El5MNQJlRJk4mbIsISx2HbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908057; c=relaxed/simple;
	bh=wmanOrS6IBAieOeEiPju79hm31QnCPFJnTba4kktl7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dfj4UGy6VZR1Kmr2N0zd6Gr1cEVkB7zHRLVwr/af12ienTDIEU8zUrKAB4gZu0OWiuFbgsBszKL6eKi/wNyW+hMBZNWlU/FZ3yLSLh9XjqIFBI1RQDUOH96YmC94JiTAPQzMG6ZhWDTv1/JukU9o1hTXN0ADXKlBuDalDs3jPWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ri2oFfl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB42jXt029986;
	Wed, 11 Dec 2024 09:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygTw34RFG+QsXzi8XIQ0y5UIKU4LEhaldbnorSXCWOg=; b=Ri2oFfl7tvfPPlPh
	MhAJwcUbRREVVBCRg6lkZqhGIoqMBHyA977PvA/mve8HF0Rzqkbsj0IN4n8s4CWY
	BkxUcK6mUVXosIRyfjLH4l84ZSkHrNoGCMaUbxKwlrQsltEWQE7/FTmf5EVQPU04
	uYNESj4s8OK0imn3nx6+K2IEmnR4bCV9tdYCuIJHBxuuw6ZxE7qJM5TLzTIH6bYn
	sfOznXC2ALMJCh52+XIzKytwwCCFYeQr4d1j2o8NzkYlhoUA7NnePWJuytpoMvRH
	nca2f7ICfW7y95QK96DMUX+Xg0NlkgZgQJPwgSgpnExZ3ShyxrKBN7P4A9zdtind
	38mP3w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eqr32rdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:07:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB97NZI005094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:07:24 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 01:07:18 -0800
Message-ID: <5220b8ad-021f-38f6-8617-34352093e494@quicinc.com>
Date: Wed, 11 Dec 2024 14:37:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
 <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
 <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
 <b4f35301-6361-9e07-73dc-023e87c80857@quicinc.com>
 <35tpvx2uok22tmq76fe6mluiqnkymm2es6iu5jjj2zapeio6me@l4obuknsn3gz>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <35tpvx2uok22tmq76fe6mluiqnkymm2es6iu5jjj2zapeio6me@l4obuknsn3gz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QZzpPx6faxf4V806hxRMmcAu27IwfKf3
X-Proofpoint-GUID: QZzpPx6faxf4V806hxRMmcAu27IwfKf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110068



On 12/11/2024 2:17 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 11:54:09AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 12/10/2024 9:53 PM, Stefan Schmidt wrote:
>>> hello Dikshita,
>>>
>>> On Tue, 10 Dec 2024 at 12:08, Dikshita Agarwal
>>> <quic_dikshita@quicinc.com> wrote:
>>>>
>>>> Initialize the platform data and enable video driver probe of SM8250
>>>> SoC. Add a kernel param to select between venus and iris drivers for
>>>> platforms supported by both drivers, for ex: SM8250.
>>>>
>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>
>>> [...]
>>>
>>>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>>>> @@ -17,6 +17,8 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
>>>>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>>>  {
>>>>         switch (id) {
>>>> +       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>>>> +               return DEBLOCK;
>>>>         case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>>>>                 return PROFILE;
>>>>         case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>>>> @@ -32,6 +34,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>>>>                 return 0;
>>>>
>>>>         switch (cap_id) {
>>>> +       case DEBLOCK:
>>>> +               return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
>>>>         case PROFILE:
>>>
>>> The handling for DEBLOCK does not seem to be part of the SM8250
>>> enablement. Or did I miss something?
>>> It seems they should be part of a different patch that makes use of
>>> the DEBLOCK cap.
>>>
>> this cap is part of platform caps of SM8250 and the value(set by
>> client/default) of this will set to firmware as part of start streaming
>> through set APIs.
> 
> Then it still makes sense to split into two parts: one for DEBLOCK
> handling, one for the platform data only. Or you can safely merge
> DEBLOCK into the main caps commit.
I am just adding the platform caps for SM8250 and mapping between cap id
and corresponding v4l2 id in this patch.
Handling of all these caps are already part of main commit.

> 
>> {
>> +		.cap_id = DEBLOCK,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
>> +		.set = iris_set_u32,
>> +	},
>>
>> Thanks,
>> Dikshita
>>> regards
>>> Stefan Schmidt
> 

