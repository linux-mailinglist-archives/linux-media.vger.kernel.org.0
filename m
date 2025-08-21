Return-Path: <linux-media+bounces-40552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C0B2F542
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73DA460364E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7472F548F;
	Thu, 21 Aug 2025 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PxSg9ijH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544D2EFD90;
	Thu, 21 Aug 2025 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771903; cv=none; b=QA8sB57nd5mez/WTg0md8j1DNtNSiQdPtALHdjXRtgZaoKtP9Dpx3JzAAXmvKY2vmI+Yx8mXNI9MlpdHsVWFXJhiubkL9Sxb5DyXgN4125bhape+vvM2xt/AhFl8sbnM41VDF6g3ngctHp+/7sHcsprBzj/Vf4WAbokallSJY+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771903; c=relaxed/simple;
	bh=fjmCed1oZBvE21aaDulsfrBk7Z14nhP22uubJRCY/Jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NRHjKGFQwN4UPobAGFts5iLoSh/lL4hw03B/+PxZHEWuMlpgucjzpdlXpvrrtYl5vwh5X/Z75m+oFjv35Lnuf+rOb7yKSMeZ7A+7fod2sw4YkXSPeJKZxip3Ovu2VdVOLJudmI0S6qDy6zA9p3QzqAfLYK22PD+JECnrHJAWTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PxSg9ijH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bD38027108;
	Thu, 21 Aug 2025 10:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AlFsaE/B+QKqo4myHkKfY2SzAKKYx7A3/V4kQZIiYb8=; b=PxSg9ijHsvPZwCmX
	Ufglbo0E48dwmbECy8phCK86fLbC/kcWhJnoWSQLIXeI9DbdCmL24CvMixTvoSFi
	qn93abRq1xp10M9pmX9D0O4sAeH0ohOdA7kO3qLh3Dd8fee/X6HRZH17Ssp7hhKY
	5Vq3usSjQdCYsjcFLW+3e5Rha02CH2HNo0W2wlgjui7XxGEx4FB5DmPV55gTu9fA
	dOBaBk+89MVd90fVK6bkwqkH0EYyZO3c4XTmmSXLsz9t0xA3/ASxNos6Dque9HO9
	HBJGg5T0Gv82l5IMNnunpjLwBNGt9JmRqRVRcH8NaamNM4isIuGSR09Fa7mEon07
	8ta3nA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w1ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:24:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAOn8q018845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:24:49 GMT
Received: from [10.216.5.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 03:24:45 -0700
Message-ID: <a2d2e93f-30d9-cecb-174e-81249a90d09c@quicinc.com>
Date: Thu, 21 Aug 2025 15:54:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <f104c9d8-16ae-64c6-4494-49981ef950ea@quicinc.com>
 <086d3bce-b8fa-40fd-8efd-9e457bb01650@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <086d3bce-b8fa-40fd-8efd-9e457bb01650@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a6f3f3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=k1arelEpqhot-3V0fXAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: G6UClrgk-KhIchCsV801pl7B_YuG9ryS
X-Proofpoint-ORIG-GUID: G6UClrgk-KhIchCsV801pl7B_YuG9ryS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4fy+ilZijY47
 L28ctVteNQJmqTxmYYKAyzW9WTv8EHkUw/dcZMRHZMNqHuHVLQQPXOqsnwD4kzkGzY/COm+JXlw
 pKDJEMWjKhcR4EqVPPXdev71F+I5JcRVo3poAXw1pXdjWTlhEzNo9u6sC0TaOGimJajX7B2CFZx
 wo4MSQ6sEtFAXJMsRXAeYji/0IHK8/jurD14vHO2Xnt7hNC2279EcPeQFhDrqFgfstwldDDhglg
 fCYxB+uhZC4QY3yD7SSlK2bHJ7tZbakD0g0m8wrcWpRbRMs1X0ROKfCNtwI7tRUi5eeGGWuIBRa
 BdlENFlAQzZJw1US61qHGDsQeNDiwRiOaBQZXjQTrfX+bkPKQBeZ6r04Xg2LgJy3MTmloBk6Vqh
 9K5+EbqNO48aIi4P6NCBwMVQxGOzxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013


On 8/21/2025 2:14 PM, Neil Armstrong wrote:
> Hi,
> 
> On 21/08/2025 09:56, Vikash Garodia wrote:
>>
>> On 8/21/2025 12:51 PM, Dikshita Agarwal wrote:
>>>> The change occurs around Aug 14 2024, So I checked the downstream driver
>>>> and I found that fixes the encoding:
>>>> ===========================><=================================================
>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>>> @@ -863,9 +863,18 @@ static inline
>>>>   u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>>>                         u32 frame_width_coded)
>>>>   {
>>>> -       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
>>>> -                     (((((max_t(u32, (frame_width_coded),
>>>> -                                (frame_height_coded)) + 3) >> 2) << 5) +
>>>> 256) * 16)), 256);
>>>> +       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0,
>>>> vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0,
>>>> size_top = 0;
>>>> +
>>>> +       vpss_4tap_top = ((((max_t(u32, frame_width_coded,
>>>> frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
>>>> +       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>>>> +       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded)
>>>> + 3) >> 2) << 4) + 256;
>>>> +       vpss_div2_left = ((((max_t(u32, frame_width_coded,
>>>> frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
>>>> +       vpss_top_lb = (frame_width_coded + 1) << 3;
>>>> +       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>>>> +       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>>>> +       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>>>> +
>>>> +       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb,
>>>> DMA_ALIGNMENT);
>>>>   }
>>> Seems this calculation is different for iris3 and iris33, hence you see
>>> this issue on SM8650.
>>>
>>> Updating this calculation in common code will increase the buffer size with
>>> from ~400KB to ~2.2 MBs (for 640x480) and even more for higher resolution.
>>>
>>> @vikash, pls comment if we should update in common code or have this
>>> implemented specific for iris33 separately using some ops.
>>
>> increasing 1.8 MBs for VGA and assuming it grows further for higher resolution,
>> i would recommend to separate it out for line buffer alone.
>>
>> Neil,
>> We are doing something similar as a preparation for enabling an upcoming SOC,
>> maybe let me share the pseudo code offline with you. When you add encode support
>> for SM8650, you can raise that change to extend the line buffer calculation for
>> iris33.
> 
> I don't understand your point, encoding is already enabled with this patchset and
> works fine with _old_ firmwares, it just completely fail to encode anything with
> the firmware sent on linux-firmware yesterday.

IIUC, the patch looks to increase the size of line buffer, and it worked with
the firmware could be due to increased size meeting the firmware need. I was
trying to say that if there is an increase in size (in MBs), it is not a good
idea to increase in common which increases for all enabled SOCs.
> 
> But yes I can provide a fixup patch for vpu33 on top of this serie to be merged
> in the same
> time based on your pseudo code.

Shared with you on a way to abstract the line buffer calculation for iris33 soc.
> 
> Neil
> 
>>
>> Regards,
>> Vikash
> 

