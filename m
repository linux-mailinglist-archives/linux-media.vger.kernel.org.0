Return-Path: <linux-media+bounces-41351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748CB3C23B
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E588BA0822B
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180973431F7;
	Fri, 29 Aug 2025 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pP5t/5fL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A921019E;
	Fri, 29 Aug 2025 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490821; cv=none; b=DkCVdF2u7V0s6bZg7RIyF+xvD29Nnu6Tk3HtH0hQlCD1oN4gKQkT3lqIquYIp+1yUMDvAW/jmgFhNBfyQz3OpxTSNLjj8ECUK2NEG2E7Zx4eb+GkIjBLCm8CLefaQH00RFO0v5cjvewkVLUjxXukjaQcHz+JZsNOs/9vdPWQS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490821; c=relaxed/simple;
	bh=gh4BtveoclPRfsi619KfjHVuQLrHKsEBTiSbhqe0ZIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZSXFG63s4gEexrZQpNoxO02pL7tRwqodHaVnAYMSo+dcrTTVSo23MEbjDTjc3J1e/PkYkGH4lbNjsvydSbrNBqW264kOsKgR4eoei5s5vGEb/1pKO72Emkrnt9GxsAwnjXEnejfc3/ZPtp7ABKutXXG+9q60LHxqW+lFLVANoXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pP5t/5fL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85RKv032471;
	Fri, 29 Aug 2025 18:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NWcftQ9sByIGoJwYg7DuNerhyMKFe2bgHR2XaZF9JQ=; b=pP5t/5fLxEc5yHRU
	UxZ46KKd9eunHIk07IzjW+I4grgoQmfeuAlPo1MW5v81x0DHRx07RSJC+YQs2MZ7
	LUlygqVYMz45/10OMHSVt5Kk7kkRnJDpiE49oVs565tHBEJNNc7879uQCGmSJybV
	r6s90pMSXVUli5/MwZQOxwDoDcbPaM1i58WakOJvrydiRzPd+B2fU0rDhdC3Kzm7
	RDTZmdoqthi7mvhmu9twOU7tWbUVzPPPz/1/VHJZK8pVkec1o7JB2WbNPWJuTBIz
	4C8eTt7sdWL2j9JubiLRxGCkCmnDslIRTnp4mS4HHJY/+JMKOiGAIEsC8vepSU5s
	9nwoRw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5vc93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 18:06:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57TI6f5v029709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 18:06:41 GMT
Received: from [10.50.32.220] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 29 Aug
 2025 11:06:36 -0700
Message-ID: <e9f86dee-3938-b9ac-4ec9-ee8ed419882a@quicinc.com>
Date: Fri, 29 Aug 2025 23:36:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 24/26] media: iris: Allocate and queue internal buffers
 for encoder video device
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
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
        Wangao Wang <quic_wangaow@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
 <RkFtovt6YeFZgD2napWwptCOf-5LP3ZqNbmfbDB-Z__cCvrJA5DfFRVU1IxihkEayS3ksQp8AzL1dE9Kd7r_2Q==@protonmail.internalid>
 <20250825-iris-video-encoder-v4-24-84aa2bc0a46b@quicinc.com>
 <9210ea3a-970b-4cf3-8ab5-35952a9c5cf6@kernel.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <9210ea3a-970b-4cf3-8ab5-35952a9c5cf6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxf4H8m7e/Nxj
 /QMNxCdSqqeMtbP6bPYBOeJ4auympyKEDQVUDZVZcDzmfEmbUlyLzLT6lR8Sv8SAF25heJlGkLY
 JXcM+KcTTmLVdLW6Oux3lc4rwuJsboMzS30o3udbH88eFE3XOCD0Fg/rMISiiu5/wAClXti0sjz
 kipmWK4ecMMdp4aVTkzDlmBi0Ptd+krMoMy07e2yOq9Xf4Q8zSQbtXvpP2gwTtmpDaJ9P3Voib+
 tAb6/7CGNAVB173qECKlPQD3jYCOzf83Mhis2JsR1+gb5poze4ZSUv1+n8TMLgmkINCBZhct0sr
 4xHt0KHRQexfbEzZX+/GTDT1ZATlKIksrzBTjHqbBpkKc+U6+J5wTldGgAXYNeLs24X6lYOIsyz
 tYsGdB5b
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b1ec32 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=E2upXWrYFGlahwAtZIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dHN2rDbAyuip8OXhmS6p-pAfg6AK7Iih
X-Proofpoint-ORIG-GUID: dHN2rDbAyuip8OXhmS6p-pAfg6AK7Iih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/29/2025 2:35 PM, Bryan O'Donoghue wrote:
> On 25/08/2025 08:00, Dikshita Agarwal wrote:
>> +static inline
>> +u32 size_enc_single_pipe(u32 rc_type, u32 bitbin_size, u32 num_vpp_pipes,
>> +             u32 frame_width, u32 frame_height, u32 lcu_size)
>> +{
>> +    u32 size_aligned_height = ALIGN((frame_height), lcu_size);
>> +    u32 size_aligned_width = ALIGN((frame_width), lcu_size);
>> +    u32 size_single_pipe_eval = 0, sao_bin_buffer_size = 0;
>> +    u32 padded_bin_sz;
>> +
>> +    if ((size_aligned_width * size_aligned_height) > (3840 * 2160))
>> +        size_single_pipe_eval = (bitbin_size / num_vpp_pipes);
>> +    else if (num_vpp_pipes > 2)
>> +        size_single_pipe_eval = bitbin_size / 2;
>> +    else
>> +        size_single_pipe_eval = bitbin_size;
>> +
>> +    sao_bin_buffer_size = (64 * ((((frame_width) + 32) * ((frame_height)
>> + 32)) >> 10)) + 384;
>> +    padded_bin_sz = ALIGN(size_single_pipe_eval, 256);
>> +    size_single_pipe_eval = sao_bin_buffer_size + padded_bin_sz;
>> +
>> +    return ALIGN(size_single_pipe_eval, 256);
>> +}
> 
> Applying your full series, this function is unused and causes a warning in CI.
> 
> Assuming tests pass for me, I'll be dropping this function in the PR and
> you can resubmit it if/when you find a use for it.

you're right, this is unused. Strangely I didn't see any such warnings
during my runs, but yes, this is good to be dropped.

Thanks,
Dikshita
> 
> ---
> bod

