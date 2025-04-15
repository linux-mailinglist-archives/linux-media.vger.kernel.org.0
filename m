Return-Path: <linux-media+bounces-30210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A8A89303
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 06:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E116817FFBE
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 04:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E222DFBE;
	Tue, 15 Apr 2025 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p4zLcD8F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534062192EA;
	Tue, 15 Apr 2025 04:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691608; cv=none; b=NCaQYLU/qUv8tsR+mgBPbR4Auy1SDhlSTfzlzsCUyinnsNNj0a5Qr6QjLl9YQDHmk+5Yq5d8htWnYGdltBNeh5CZs6MF6PTHvrfHOvd7gUKUl5K8ZNqvv7VgTduCbqPnGVfZJHPCJCE4Q22LnqLHPXU6yFEvR4tFIEsSgAk3uCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691608; c=relaxed/simple;
	bh=K5+qgArux3ZyubowfggS35OIq+EEZWr0Uaq4Des8B5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DOUsoAy8WAJTcd69CyIdLXBefVPXhLP+5HINbMrqc4OGUZyRRkZ1ZF1gqDXBrfcxbua4LLXQofqQwVSMBvP5v08i4FadT89Y6b2tel3f1cEGYc4kXZkL74tLNSuedr0LX/lizm/nJd8KPonmCciJavtWAvveB5bXR29SfXCgZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p4zLcD8F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15gb6018730;
	Tue, 15 Apr 2025 04:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZN8fYmQrCzqb7XQJomP7URJ4xJiq/Z69DABjp5OSfKM=; b=p4zLcD8FHZ1NQrcA
	beuCDlybTNWgdNJQr1NbjICEpYHMfrUD4ZSZo9/EBmL9uVlTL4WBryInnVpYXjfL
	jx+BNaXl01wvPGUBGChnGkxZ8r9FOpuDkzzflcMqzXDs66Pxetl1Pg2DEcewMb0s
	mAcisqMZBv3v2NnrsXnH/ehWRhms30kCFxvbCNWLp1v9c9y2C+HmZ/BNQPmXdhJQ
	pNXOil5tGl+VnnJYEj8cV84yELpD3lOfGcZKQE5O/Ck/WOyAawy3Ar3ogvDC0c11
	bHCq9fZ/y9ZTRq3UqC6h0fZb1zplkx3oOI/nlutQgZjUevfGV4cbBPKhKlSbvcfE
	p9JrQA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wem60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:33:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F4XM99002496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:33:22 GMT
Received: from [10.50.52.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 21:33:16 -0700
Message-ID: <867bd193-3317-095c-21e8-e5d20a1b3893@quicinc.com>
Date: Tue, 15 Apr 2025 10:03:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/20] media: iris: Avoid updating frame size to firmware
 during reconfig
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
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
 <159f1df0-6c7e-40a5-9c62-ef6ebcb189ba@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <159f1df0-6c7e-40a5-9c62-ef6ebcb189ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fde193 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=0bJS6A5VOtW8r0s1qZkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yLEJgzeQ3u3Qd-KflfesMEMJq1a1krZ9
X-Proofpoint-GUID: yLEJgzeQ3u3Qd-KflfesMEMJq1a1krZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=961 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150028



On 4/11/2025 6:17 PM, Bryan O'Donoghue wrote:
> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>> During reconfig, the firmware sends the resolution aligned to 8 bytes.
>> If the driver sends the same resolution back to the firmware the resolution
>> will be aligned to 16 bytes not 8.
>>
>> The alignment mismatch would then subsequently cause the firmware to
>> send another redundant sequence change.
>>
>> Fix this by not setting the resolution property during reconfig.
> The log implies to me a missing Fixes: tag
Sure.

Thanks,
Dikshita
> 
> ---
> bod

