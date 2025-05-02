Return-Path: <linux-media+bounces-31590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32607AA7408
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632A61BC06CB
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A875255F35;
	Fri,  2 May 2025 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GNItcvbf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F742550AE;
	Fri,  2 May 2025 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193326; cv=none; b=c9X75XXeRw52mEaJiZSpLyEECME8JSpMVg6LeajiNjj3BWHzWdZ+a0bCQ5kTC3YGilEWuF0RCSSR4/vrt7yyK3EGOFYr2tGZVxI8G7gjT6d91tfW0M96Q8JEhtT2cIj+lgcBKT2IWRNvKMW1MsSj+wVeRxAL5DNruLsa9J51ngk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193326; c=relaxed/simple;
	bh=LBQpFwnogayjHCjmBx/rgvhkKi2m1CY1DawfUDKgsEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NajO63QrhmLiT+XK21XpQgthBMT2ag/CFOwOC9soBswK/XjnFZaF709TRQ6cwZoAoYfGAI5w9syV1HuJEUJiOKh9q13W519CupUnw0ryYowkb4XOKCzLsIy2KmkicHr7seZfvsv21s+d/8heD/OGdpsAQgj1d74u7Eu0PbCvWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GNItcvbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N555017442;
	Fri, 2 May 2025 13:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zx94rD5edA0KgsGVOpE54/wmGF57FL5v+Fex8bgxLSU=; b=GNItcvbfVLQ1pf+G
	EA1xUO+iPdEa8hW4wzrL9+JyI4FIrV28ss9kaVKOWwdLatDs1zvW5/BbgymiQUOD
	5t7FWJg/f8WDcfaroc2RwFGKYRuV4Rx6C98ApnIlUULuQr+HtLriJFGnsMqedY2T
	tv0pbZ4HgnZPBlFWcSt9yBXrE8lmLgHKrAve0nmR5aZFBxWK714yPWQXoHxqslvx
	RMAvonGh1Q82vuFL6HSrgm99UPBlXYblzpxvWBxH/uEym8TzSjdRFGO2yDKK6VvV
	hrEZL3c2XlhbHaLE4a+bh0FS+fJhE5FdeGjeogeqoojvLU0M97LAtXm9nvegv7ru
	sDzyfQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78fja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 13:41:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542Dfh1q020746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 13:41:43 GMT
Received: from [10.50.25.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 06:41:37 -0700
Message-ID: <56c87a9a-0f7e-7d1a-af27-d70d46b50b41@quicinc.com>
Date: Fri, 2 May 2025 19:11:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 10/23] media: iris: Track flush responses to prevent
 premature completion
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-10-552158a10a7d@quicinc.com>
 <bc9ba136-bd99-4c6c-be97-8915464cfb11@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <bc9ba136-bd99-4c6c-be97-8915464cfb11@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwOSBTYWx0ZWRfX7LGy4KbL3C3a dQHmDLd2y0xi8E/1jYnNSyNLtJcy1Os2R9F2mJSm81DseEuIk9WWapCUEND8/DP5a1O5JtO5GGH bpKUGUfqUnkEGXet7aJ1r58HNA0O7sw7mFLbpudBiJGSp9xEbS5324/0f42L7AEDSiz4C8eWr2U
 D95UB1NfomPmN5fXBuvvp4JTpe6N7Ni6VV+/bLHODwoml8UF8ECjg0mPPB1xmfVNSpgcMsojGzx LyHIvbfXIQkV7rReBo1jRO1ktYxzXqQTamhGncnUuTEnsrh28L3HJBrjvJHse+dQx4wBSmcfvqQ +JaC8Ss6wDolLGQzzIijkK2lpB5lV3dtZQNB2TDESHVsdpwTWNyjkDhab1YAyZI9JXIiviWTRCB
 txZE+T83jvA9mSOybvH3pOFIafmyU15cnbE8eljkoLa8ZD8uVKEiJvbqbbDarWgc9V0w8pQ8
X-Proofpoint-GUID: aSl2b9MQ70lgc7RM7h6WGulCPKdLOxKh
X-Proofpoint-ORIG-GUID: aSl2b9MQ70lgc7RM7h6WGulCPKdLOxKh
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6814cb98 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=kYgUE9KTLWQu3_OCR8gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020109



On 5/2/2025 6:10 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> Currently, two types of flush commands are queued to the firmware,
>> the first flush queued as part of sequence change, does not wait for a
>> response, while the second flush queued as part of stop, expects a
>> completion response before proceeding further.
>>
>> Due to timing issue, the flush response corresponding to the first
>> command could arrive after the second flush is issued. This casuses the
>> driver to incorrectly assume that the second flush has completed,
>> leading to the premature signaling of flush_completion.
>>
>> To address this, introduce a counter to track the number of pending
>> flush responses and signal flush completion only when all expected
>> responses are received.
> 
> Is there no other way to correlate command/response than a counter on the
> APSS side ?
> 
> Usually command/response protocols have some kind of identifier field or
> sequence number embedded in the protocol headers.
> 
There is no such identifier field for flush command and response at the moment.

Thanks,
Dikshita
> ---
> bod

