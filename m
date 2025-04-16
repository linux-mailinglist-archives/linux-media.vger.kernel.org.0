Return-Path: <linux-media+bounces-30375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B117A90924
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A748A3BF3E6
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 16:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8C0212B13;
	Wed, 16 Apr 2025 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="efsHX+Re"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A31552E3;
	Wed, 16 Apr 2025 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821629; cv=none; b=N6JK3ASF3k4Xi1Tf28KEuMmSR5PqpC+jDgapsBlAGfAVjb1BNvQbXnJXTFKTEkJbBNspuzeXapVPvbo4glcILQLTRiz2nykOAXLlfz2Syos7QYsIo3GEpj3SACWPROlkP5rIn5eXKJ2zB/d1VbuLIwkrqsuQYjjd6Kzr3q2A+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821629; c=relaxed/simple;
	bh=kdWGzMC4e8Q/F55njWJtcJOc5uDVvyTSX+OFhhLoMs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kCY9WrfRx1c7rvnIHYbWJhK1+GR4pSo2ocnQWXIJ0CdLPiDT2XQnz0PviTeu+4UHCI7pQxwPclv5oBDBES08ufKfbbdECaHQbrdxdz29V76fJybObF8S5CCfXU8dg1ibRm3wsXkK92ma46YAtlOXfMXsIOEsfNPTG57oAZuRqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=efsHX+Re; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mFPI007029;
	Wed, 16 Apr 2025 16:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnCM84KjxzfyDSxb3gt85GemZL1H2aNhnuW7pS5CQkw=; b=efsHX+ReLvKFxozR
	N4FGKnp3F0eeNoPpxrqt4fc9ZzpVozHxy8mAYMk45aOKaKp8bceBNsK3Ej81F36s
	9ddC4lG3al5FsvWW19MyqSh1COcyzibaE1wLe1j1qi1pf3wzx48atJTG5IN75iTW
	4HVh4OU/M++RNCbyXXOi82ru0deY34IRCB0nNsQ+o8IkbKT5hdgiJpMpaxaTXXDy
	3JZHQddFUSht8hNvbn6UXZbsJ+2oF841hma5u+7v95nZgn6Pa5TcpnRfOl4MYHSK
	DibFQq3Q8ighMArntczOJm+V1wBAW/VgOkRvnC4qln0o5OC1rLDdDlIbHU57F/tJ
	u5Od1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjm46e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:40:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GGeLh7023006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:40:21 GMT
Received: from [10.50.19.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 09:40:15 -0700
Message-ID: <30ebc1b7-5746-59a3-0155-7a7870544622@quicinc.com>
Date: Wed, 16 Apr 2025 22:10:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
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
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
 <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
 <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
 <96bd9ffa-94f6-0d1f-d050-5bec13b3328f@quicinc.com>
 <70a630cb-06ad-403c-b2e2-ae6d26e0877e@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <70a630cb-06ad-403c-b2e2-ae6d26e0877e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3hVtaosg3CGbQh3bTYuTewtgMNNFml9Z
X-Proofpoint-ORIG-GUID: 3hVtaosg3CGbQh3bTYuTewtgMNNFml9Z
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ffdd76 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=UQm-4NqDxuu6OjQSYYYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=917 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160135



On 4/16/2025 5:40 PM, Bryan O'Donoghue wrote:
> On 15/04/2025 05:58, Dikshita Agarwal wrote:
>> Although firmware makes sure that during session close, all buffers are
>> returned to driver and driver will release them but still we shouldn't rely
>> for this on firmware and should handle in driver.
>> Will fix this in next patch set.
> 
> Shouldn't we reset iris in this case ?
> 
Not required.
> i.e. its a breaking of the software contract to have failed to have
> returned a buffer by - close.
> 
> Its not enough to free the memory on the APSS side as the remote end could
> still assume ownership of a buffer... right ?
> 
Before close, Stop will be called to firmware and firmware will return all
the buffers to driver, which will transfer the ownership to driver, so no
issue with freeing these buffers in close.

Thanks,
Dikshita
> ---
> bod

