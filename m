Return-Path: <linux-media+bounces-33714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48842AC9896
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 02:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 149E4500D92
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 00:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C452904;
	Sat, 31 May 2025 00:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SZ3WEEmu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1520EB;
	Sat, 31 May 2025 00:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748650039; cv=none; b=H1LXE46e8/lzCE1KzbGf4I5P1/Os/9Qt96fSkMQcVZtMACA2KaIF7SP8CBastOZOE9LNSD3I6uasjmvMbeA+EEpg5+J7QTSrlk06UXNMdL0U8g7+79e7O+zsGVqdwrwXX1yOAMn0tPdxbwjIZldbspnUyIa8LlHKfxdTxte3kSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748650039; c=relaxed/simple;
	bh=6P2BOfkmq6SK+1DJGmrhFE0FP889wpKT8Pb6lR+FzAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nlouQPGwOYNVq8LooOd/ZGqZ6JiCmDgzzmgKh/CrQciIhpdSlykMhgqRErFOkm1bsMXh6i7zjdFSfezDxl+MCtXGaqLrCReTETfkCatKaLQ7OUFBi5yp/UbT0byIPBnJjrGLFqOkPgd2gefdr3OrNuUc6nt/ubhvOnncphLYcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SZ3WEEmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UK5P9x031636;
	Sat, 31 May 2025 00:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1DxtKSUm4YO/O6cfYrBMX3tv7BN7U6IHTFgw0lhgAw=; b=SZ3WEEmuu0uAC0t+
	KHiDZfwsAagFasols/zHyQ82gitS+AAd7pSmHHMfGTfSjW5/vp1j3dAC5I9zblrh
	7pFQAHAEPxHCEpKfB+8dn16okKdYTBguWT8rE/Ze4FFJB4V9TREo8WXSZKzrkKU+
	As0YWK869gUjQ+iD8MqnBR6Uw27KqAWV0NuIwLilwMebBF2bvYA5dH+of3bcxE7d
	pzQtc9PSJOkuoeCL+YDSLbK5XAIZtT3Sc/AB4DybOI2POcNfniwlOlwSGKqyFjF4
	EvXa3F5GWD338ZuzQhu1BVctHPXy7KWoeoKbUM5nnd6B7ODHCUFGWpjk68FCK5hN
	IVxeDQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk2srm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 00:07:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54V07DdG017063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 00:07:13 GMT
Received: from [10.253.36.123] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 17:07:08 -0700
Message-ID: <05ccb3ce-1954-4a6c-8cfc-edc8313e9875@quicinc.com>
Date: Sat, 31 May 2025 08:07:06 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
 <qeuxv2mpnnsieygdwvsb63k4n53tnc6yekiv2wels4jjwwpxf3@wutnfkefi7yj>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <qeuxv2mpnnsieygdwvsb63k4n53tnc6yekiv2wels4jjwwpxf3@wutnfkefi7yj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683a4831 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8
 a=COk6AnOGAAAA:8 a=fn3D7n7na-j4QsXFkkQA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Fd3sYspjoHUdzUYZmKFbQ5lhkuufbabZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIxNyBTYWx0ZWRfXyNmtBR/E8z1Z
 99cleeQHqNMgjr2vYGvbHh3oIAvGTlTXETUtNm6MxJ385B8rXljs8azfJot52xB1rB/mUXH6+F5
 a7LWKKuO5nGJhfPUBnTRq88iYeLxj0CWh4WvGuMBr1T6VFFEIF/XuNrurvGzSvDEkGx/bmhVsX0
 DincYf8jMp+Ah6MR59VxRLzB/pGVNqOnDJYELgx2HHeH2w3B8yPEL8BFXsvQ2v5abMc22E/CtrC
 ACRDcIJqDqJSp8tU0x8scGKDFID5Ix5Z9rGxezLtr+lx8oHEAe7BvOIOfCg9apB8eGC0322NDXi
 4v/DANsWvhl/YFneUYkXARToPmJmResG92reND60H+Ve97CqlTKIUpN2ltIIU4qLYF8YkCWEFw+
 RaparYTTX5lYOxgisdqJ7G8iCUVKnWQQN7RLaKWPxYD9PP8XAlZbBlDj29mEOccVTJXLsltN
X-Proofpoint-GUID: Fd3sYspjoHUdzUYZmKFbQ5lhkuufbabZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=919 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300217


On 5/31/2025 4:31 AM, Dmitry Baryshkov wrote:
> On Fri, May 30, 2025 at 09:32:15AM +0530, Renjiang Han wrote:
>> Enable the venus node to allow the video codec to start working properly
>> by setting its status to "okay".
>>
>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -338,6 +338,10 @@ &ufs_mem_phy {
>>   	status = "okay";
>>   };
>>   
>> +&venus {
>> +	status = "okay";
> Does QCS615 work with existing qcom/venus-5.4/venus.mbn or does it need
> another VPU firmware?
yes, QCS615 works with existing qcom/venus-5.4/venus.mbn.
>
>> +};
>> +
>>   &watchdog {
>>   	clocks = <&sleep_clk>;
>>   };
>>
>> -- 
>> 2.34.1
>>
-- 
Best Regards,
Renjiang


