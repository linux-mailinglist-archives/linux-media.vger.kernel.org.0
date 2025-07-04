Return-Path: <linux-media+bounces-36763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D510AF89FA
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93639582C36
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDB5285C86;
	Fri,  4 Jul 2025 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ig/tlWKx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E342857D8;
	Fri,  4 Jul 2025 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615451; cv=none; b=Wa1xhxKU0ynn5H7ndmtykIdkZ4LyccRZ+f2JGFjqIDLGD12F2rQlsgJvanq0H1Ltt0Sc3dMTwXEM4jdf0WLsrlLJCWtp+KaZUep9nvL5mZjDW0VQWlgHu3rm7CSD/ZalGdqKGmiFyWq4r512wKRrmt6d/kAq5m2wDJFGL9PHsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615451; c=relaxed/simple;
	bh=ainldMWXH95+0mdbO2xfiGBkvdblX2SlXYiV2ilXPD0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=HD7+fzLujxMInz4FSclxcT0WvOdtvQRW7o/Q8mOGOijHSRoS/0WZfw8nkMeoIkOQMIq68MxqAD1WDMLDR7iI/9+nhFwmsIAwBzvIG5FAiuCyBgExO7tI+AvMp8JyF5FjQ//HzIBFqCVkaxWtvpbKy3MAGjZmx/JwRuticESfb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ig/tlWKx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5646R4Kd018560;
	Fri, 4 Jul 2025 07:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16j1SCIKLECntUMnMZz1v9Z2VNbZfjMaIL7AOkzyZAo=; b=ig/tlWKxOgMbLhsR
	BXKGINlco8GTdcWuJF4zTX5A8+OQVf/g6OWVFmcEci6Qkp18ZuqyuNJ3i2o4bnus
	WMPcAiRzFDD0/+rpmi9wHz/GDXhG1aQtduyDh1plIe5JAFFqrCnZBTNychnbO8v7
	i0UqU153XSJ40/zkLMTayZVvR3i7r1Aj2WRk1aQtzIcn4X0vqdscPeDhONlyJZM4
	jTQd9kxKBiy5BIQGk9q1JZOxnHlA8H1TlD1t+JC+nboFa1r9jltqSEvgATiuy4u6
	y/oDa8ogzic+RzxrRtLtAQc/ortmnn3jdpqC/Fn5G0SiuW+2B0Xkink49yDru1hE
	XAL7sA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxu20q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:50:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647ojkZ023639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:50:45 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 00:50:43 -0700
Message-ID: <cee197ea-7403-4c1a-beb2-dd1fc9404cd5@quicinc.com>
Date: Fri, 4 Jul 2025 15:50:41 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: use opp-table for the
 frequency
From: Renjiang Han <quic_renjiang@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250612-use_freq_with_opp_table-v2-1-42b03648fba8@quicinc.com>
 <f87b6127-a416-45fe-8b17-bd32574e20a3@quicinc.com>
Content-Language: en-US
In-Reply-To: <f87b6127-a416-45fe-8b17-bd32574e20a3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX4PEE9ieg7kyW
 Kwm62cMAcZ1gw/Q3TQduy8eWazlAftG0mrwsuadIyOEBH74QUn146qP1r7O4JNnY3rZt985tYdG
 3RBG6phsx257lJuXaIxL1GLBr29nuy3QNpJ5UasgyF4YbWFhdI7IQ6hsQ5WLOJAPj7Z8Ubd95bY
 3JKLag+zmPjwQ/tN8XQFvmdWQHs6ixHx34aDkm5VRHlb6XtkQ4dZ3WP2XodGZNivFBt/RdE7frt
 SqQzw+A0O9N8CKZ51MMjf4G5VbMju3J3Jm9bHhq2hxIDRtTVRuMSq5mZS/zdLVKX3d1/r2qWjIk
 QL4fqyucgTMM2art4gxUSDbV4Cwl75e/7MNTDMDIQQaNPkBCcgNhUcmux7Wdgx6/89HkgGwziPH
 /CfqWLIOKlYdnDrFBGJHmae0PsNAMA4sbrfCwWSJyxR//0+CsvNP3R2ERawAkPnreKt7nVVZ
X-Proofpoint-GUID: Cm2iqx7JVHYDqLEiLOe-748P8VdZdgsl
X-Proofpoint-ORIG-GUID: Cm2iqx7JVHYDqLEiLOe-748P8VdZdgsl
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686787d6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=vZOkXSo_Td5SYMaHLBcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060


On 7/4/2025 3:21 PM, Renjiang Han wrote:
>
> On 6/12/2025 10:23 AM, Renjiang Han wrote:
>> Some platforms (such as qcs615 and sc7180) use the same core but have
>> different frequency tables. Using the opp-table allows us to separate
>> the core description from the frequency data and supports the use of
>> fallback compatibles.
>>
>> Reviewed-by: Vikash Garodia<quic_vgarodia@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> Signed-off-by: Renjiang Han<quic_renjiang@quicinc.com>
>> ---
>> video core in QCS615 is same as that in SC7180, while the clock 
>> frequency
>> corners are different. In such cases, the clock frequencies are better
>> represented in DT than static table in video driver. The patch make use
>> of OPP table in DT to choose the frequency corner to scale.
>>
>> Note:
>> Earlier discussion was concluded in [1] where it was agreed to rely on
>> opp-table for QCS615.
>>
>> [1]https://lore.kernel.org/linux-arm-msm/c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com/ 
>>
>> ---
>> Changes in v2:
>> - 1. Update message based on the review comment.
>> - Link to 
>> v1:https://lore.kernel.org/r/20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 58 
>> +++++++++++++++-----------
>>   1 file changed, 34 insertions(+), 24 deletions(-)
> I’d appreciate any thoughts you might have on this.
>
This patch has already been picked up, please ignore last email.

-- 
Best Regards,
Renjiang


