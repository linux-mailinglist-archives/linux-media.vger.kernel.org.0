Return-Path: <linux-media+bounces-40531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E77B2F04E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B26713BF003
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B292E9EA7;
	Thu, 21 Aug 2025 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dA7PoDtW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576EA2E92D6;
	Thu, 21 Aug 2025 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763006; cv=none; b=cxRS/HQ++0CS9evm4tIgprf1XMiUpAW8XC3zmW3Au3i6v6h9SHEuJI5Xa6Zi2Zo+KDqTtvymdnLz9uyqW82hSHWUBFxF+LiUm/ot+bi6op1tTuaujd/HbrKYF/BrFrsp6hugNO2YDgIKrRs+/IQBbBnc1I/ef+yyP1jjDQ+oVVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763006; c=relaxed/simple;
	bh=XoCpPVB5wOAtJ7m6MaTrQOLr2oFV7hOj0Lum1iwDtxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YaxTW0HMiq2Z8AqTZ/dYnUNLNH58SJd9s8k9bCgakNrGnTElx04rVrekJc79hkzodeb9R6qv+5aYPEh/tnX0NV6L3AHdAbb7k+3nR3m/WafteQK+2Fixmg+I7/7xgjcLhquZCXNY4A8LUluFyAOfQqKG9HC77BoYJ9yz0wvIpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dA7PoDtW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L7kSve020839;
	Thu, 21 Aug 2025 07:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIJ8sGJ241dgJr/7UiTgj7Fpjrs1hEGq9F6pHGgt3Mg=; b=dA7PoDtWgU0xFjOG
	d1uVW3s1BqkUAISUghRkRi2mtmRJVHeNXPDshgFAnuggnwV90pD55bD5TCkt1W5S
	S4JK6zPggVFIvtgIZasunmhuOuY+KlQ2tYSb+RsTBxbqTmfoZCs3X+MPFBUWGZcD
	RrDBGrzAkVismrg9uAOmXavjjLaw7i1yDijMkqqSJ4SsDW1e4sR4k2qYEu9eGvdi
	9sa57WmEEN0xh9+vGSj/smYB2aVp8OBeHe3fZ2Kj9elm+eS3xfQ6xIqUFG92FEzX
	MilW5j6q98xUFVAkBIA7dl1EzwIgzpXWKXRbdvzxjYDAAQa8qIz18YYZV9db16Ee
	lUNeGg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5294hdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 07:56:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57L7uc3N020678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 07:56:38 GMT
Received: from [10.216.5.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 00:56:34 -0700
Message-ID: <f104c9d8-16ae-64c6-4494-49981ef950ea@quicinc.com>
Date: Thu, 21 Aug 2025 13:26:31 +0530
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
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: coqtGhz_i8faQO0kYJcT4v4KLTBE27P-
X-Proofpoint-ORIG-GUID: coqtGhz_i8faQO0kYJcT4v4KLTBE27P-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX62ksjgec8+4J
 a0yg17uHEBxaLJhqkjCEzhR2UXrHS+/L3Eov4e5edOys/wcd/JKZWa0XpBamJ41fvIMyjrT1WnA
 RqB2c4lhKqZUWfy4Ji3dVSCQGs7hg2nIloWHWiVBXNtxFy8cMGmdJCQPFl/BwZ5QDyKfokYELBV
 TIt8edelrg+6BuLe+I2oRVv1D48LGV6gnvJMlhEiOM8gwGJWAjqhNUoN3n7IyObKPvod/PhsBO9
 4/bTlFoRTwD8r7XddEN7EMiFsVBfz67q6CE8lxR7MdtV2WcYSjyTfwBqE0Sda/hLUJWJTYbgTUT
 +P3Mq5SVyw/o6iAJfgB1MZghfhjjoexK3Yz7OvCC6EsD4gGXquiYSgYYipsyuXQ+qe725AzJYRV
 mYynnLpxgyUqG0DaZ1u6aAkblh21Cw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a6d137 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=s6u6a83h0psUokLNlGwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013


On 8/21/2025 12:51 PM, Dikshita Agarwal wrote:
>> The change occurs around Aug 14 2024, So I checked the downstream driver
>> and I found that fixes the encoding:
>> ===========================><=================================================
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -863,9 +863,18 @@ static inline
>>  u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>                        u32 frame_width_coded)
>>  {
>> -       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
>> -                     (((((max_t(u32, (frame_width_coded),
>> -                                (frame_height_coded)) + 3) >> 2) << 5) +
>> 256) * 16)), 256);
>> +       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0,
>> vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0,
>> size_top = 0;
>> +
>> +       vpss_4tap_top = ((((max_t(u32, frame_width_coded,
>> frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
>> +       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>> +       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded)
>> + 3) >> 2) << 4) + 256;
>> +       vpss_div2_left = ((((max_t(u32, frame_width_coded,
>> frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
>> +       vpss_top_lb = (frame_width_coded + 1) << 3;
>> +       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>> +       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>> +       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>> +
>> +       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb,
>> DMA_ALIGNMENT);
>>  }
> Seems this calculation is different for iris3 and iris33, hence you see
> this issue on SM8650.
> 
> Updating this calculation in common code will increase the buffer size with
> from ~400KB to ~2.2 MBs (for 640x480) and even more for higher resolution.
> 
> @vikash, pls comment if we should update in common code or have this
> implemented specific for iris33 separately using some ops.

increasing 1.8 MBs for VGA and assuming it grows further for higher resolution,
i would recommend to separate it out for line buffer alone.

Neil,
We are doing something similar as a preparation for enabling an upcoming SOC,
maybe let me share the pseudo code offline with you. When you add encode support
for SM8650, you can raise that change to extend the line buffer calculation for
iris33.

Regards,
Vikash

