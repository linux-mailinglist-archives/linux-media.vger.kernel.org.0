Return-Path: <linux-media+bounces-37998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA58B08C6D
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 054A97BC4A6
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DEF29DB78;
	Thu, 17 Jul 2025 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O1T7GrUX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447429C339;
	Thu, 17 Jul 2025 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753745; cv=none; b=kUkzcZn9xctjtgW5YJpIJ9jRWNYsm9BLHJmILngIaYfQWT/mTRWmowy9zwVy1blxLOSkxQlAWTtCXgWPIuq9u1xgRbku6DQC9p2L46S3N8axroeefzGM3Yay48KBOXNfJzWpZtS1t+G3DGYYblez6rFPtIqZsc/RqPW4m9fVkFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753745; c=relaxed/simple;
	bh=U9UwDrSbWaiDmvTA0BWFaYzVtEq4zRVfB/UuI5qqODI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bgBAGetbBFz0ARNSUggALp+sOQFcBhjuO4/p6Cv1bJ2gVNzXQPI6QTz+pEjEi087em0lAg+jV/jWra1Eytc3PyLZB1cuD4WAm6A56/7sF6s8whsisLE8u4sqqVUZdidEMkKRVLz3VuYarcLk/wxhcQ9cdzfLgZduadQVQRQ0UiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O1T7GrUX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H44NNR028071;
	Thu, 17 Jul 2025 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgbN5SgJ+4eZw4UavhDcuBv73OTeH2sfBYqdzXx9WzM=; b=O1T7GrUXnOvod8An
	Y4NLIcUZmtafNazj/PcZnoppXwSkkOeGhkM8qDbY1HMHelbZkwbTfJDUnm44GeHo
	oWybS+Vl8+kaSy/EqxiiovFTqRbzKqVxEF1suqvaMjcOcUjMpNSS9Bo7mrEK/XgK
	ZtMfPN4vP67o9QsWZkhZiuZ40IDpQSX+cKaT0FyiNnU/pgIu81A/PqgQJIm2DKPU
	zoz9NpWgJ4tZfviJxE0BEorxKbeL1OBD9LP1EatSomf+htAi0WIgMpsM3e77lE4z
	ldfxQz9PEGiRWh3H21MzK+VXP2NzBMzFhlSw2mcUQjldkDHQRY1t0CLYQU7aWMdf
	WVt6lw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5yruc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:02:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HC28sV017128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:02:08 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 05:02:04 -0700
Message-ID: <2d5edf11-2d13-bcc7-93a9-e0a223bd6eb8@quicinc.com>
Date: Thu, 17 Jul 2025 17:32:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
 <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
 <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
 <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
 <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
 <3a87c37b-b392-598a-736f-bb01e4c311e1@quicinc.com>
 <f6f86227-8d26-400b-9ad6-605cee966b56@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f6f86227-8d26-400b-9ad6-605cee966b56@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878e640 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=ONz1pvL7zxQUDdDM2XMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8qbDmR90wHf7hglQOvKe1nz6DD92OhHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEwNSBTYWx0ZWRfX3a5JuebAMS5L
 201l8H1DNnntdIukv+pEVAjbS8Bd1Jl0UM6z+kq7ehDFmoTONv3ZNL5ntkNVwm8zGfrU8QPW/N+
 I99XOK5Cj0m/A4n5XpHje9t6xrLl15ZZDHVzE56ovn530s+m9AM+rCr/j8z9ReN6OVLgjRblMZa
 UZhQOxjBaz95vPBtT+fuhdDFvAWiopLPcqE3RwOfYv9ew2OS7/fYFDPg0H83AAbP/loilAq1tfZ
 x1yebKZI+RMtar0Q8i8+0aNt5xuKMTzBJYOJxUI/2aUPdP0jc2LdMDFtpvf3bGG6dqAMscaHS4g
 NSYSVdzI8ngpN5D6f0lf2M++APXSM3u/g/cVFT2X3h8I45dOGgm1HQFv2meDEs1ENNowkVfQPE8
 XmNByKDWmR/rIbtHbMdLvgjw+J3Zp+BGZCB4ZSmG+UfWTur65s5aIcCnk6j0TJb5ZX3dBYza
X-Proofpoint-ORIG-GUID: 8qbDmR90wHf7hglQOvKe1nz6DD92OhHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=848 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170105


On 7/17/2025 4:24 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 12:50, Dikshita Agarwal wrote:
>>>>>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>>>>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>>>>>> +					 val, val & 0x400000, 2000, 20000);
>>>>>>> +		if (ret)
>>>>>>> +			goto disable_power;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>>>>>> +				 val, val & BIT(0), 200, 2000);
>>>>>> what are you polling here for?
>>>>>
>>>>>
>>>>> This is not different than existing code. I don't understand why you are
>>>>> commenting on something which is already there.
>>>>
>>>> Which code are you referring to?
>>>
>>> To the existing vpu33 which had Reviewed-by: Vikash Garodia
>>> <quic_vgarodia@quicinc.com>
>>>
>>> You understand that everything here is the same, everything is a copy
>>> while adding just few more things?
>>>
>>> My patch is not doing in this respect anything different that what you
>>> reviewed.
>>>
>>
>> It seems to have been missed in vpu33 power off sequence as well and should
>> be fixed.
>>
>> Still, as mentioned earlier as well, your reference should be
>> HPG/downstream driver of SM8750 not the previous generation (SM8650).
> 
> Yes and partially no, because we write upstream code matching or
> extending existing upstream driver. As you said earlier, downstream is
> not the truth always:
> 
> "That shouldn’t be the case. The downstream design is different, which
> is why the driver requires the above code to move the GDSC"
> 
> so here I built on top of SM8650 and re-iterate whatever mistakes are
> there. The best if someone fixes VPU33 and then I rebase on top,
> re-using fixed code as my base.

You have mixed different comments made earlier.

1. Downstream GDSCs are still in HW_CTRL mode, while upstream GDSCs are migrated
to HW_CTRL_TRIGGER. This does not need a fix in SM8650, but in the
"iris_vpu35_power_on_hw" which you have added in this patch for SM8750.

2. Register write "AON_WRAPPER_MVP_NOC_LPI_CONTROL" with 0x1 is needed on both
SM8650 and SM8750, before polling AON_WRAPPER_MVP_NOC_LPI_STATUS in
"iris_vpu35_power_off_hw" function.

I can soon submit a patch to fix SM8650 with the missing register write, but i
do not see a need to wait for it to continue your development on SM8750.

Regards,
Vikash

