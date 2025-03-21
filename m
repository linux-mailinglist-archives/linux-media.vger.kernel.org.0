Return-Path: <linux-media+bounces-28583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 517BDA6BF05
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 17:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256B417AFC7
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0021227BAD;
	Fri, 21 Mar 2025 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="je9FwhF5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B51C5F14;
	Fri, 21 Mar 2025 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573093; cv=none; b=bChEjxoLJCbc3kop6X8yruITWnrcQTH1GDfIFg+bYta5GWdMp0tdc810Sc7ty3WlLAY+hpzJhNIGaI5pNM+RYcnti+zg82J/y6N03HMEbaz7AuCAX2S2rrUdXvgXMUIpWYoN/q6f0noyaCPg1JWZ+X1gC1Ghb5dF2tsy8fQZAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573093; c=relaxed/simple;
	bh=Pd6byN8AqaaGbe/CWb1WrNcQyAL0zcuGOo+g+Mp/pK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oIGX8HPcZwc32GC0+qnxYYMRrky3ovnbH19FleiL3W3m6RWHocbR7bgRkJ3e7NijOFVC6MX/YNhcIracCn2LaxtwT6fTLtNGgj0kPmca5GptPnlhY2b3cIC6vb58USjeXqdTU6gnhQGmIYi6jbQUqYxKRRSr0LiTjJH89qBAwbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=je9FwhF5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAThKi015854;
	Fri, 21 Mar 2025 15:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/ONfvw+x8a27A/BQ561OBzH4SKrnRVr3eIQSdmNCaw=; b=je9FwhF5PJH2fz5I
	7bsQTxqUXeTEitNoUuG3FDXPkf7N/0dCiJYZdkZvwRczTcWDAaP5EWlDye9uYBK8
	3t658jB3gl4JwEV7r9nkRMbmWPRKh4aHv5zOi4p/3WDBhNqiZu+B2TC7GK8Z4Wrh
	bAZUNZnACNlwzdQAQs7BFiMaVW0a+pPUKJZJN95Jipaz+XpoYpvXyhFpys5z/w6A
	1ZdCBk4D5GA97CNLEyt/FvXdFYPe2z/DIaSxUsHJhi291SLDc3J5himfMGf9toNZ
	wo08UC4ku/dgQ+qydCDyIAJtadfs2myzyJvwR2nvnhSpktxhkBFiaEIv/8gtXI3+
	K3BpcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngng41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 15:56:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LFuOVd005443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 15:56:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 08:56:23 -0700
Message-ID: <24721e4c-ea9e-4405-81f8-084b3ce8b138@quicinc.com>
Date: Fri, 21 Mar 2025 09:56:22 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian
 Reichel <sebastian.reichel@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W-BfmQYQibuV4EVJsdNt4KMNnB_uwp2L
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd8c29 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=uuLSczJ1SNS1zB8tvcoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: W-BfmQYQibuV4EVJsdNt4KMNnB_uwp2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=755 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210117

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +/**
> + * rocket_gem_create_object - Implementation of driver->gem_create_object.
> + * @dev: DRM device
> + * @size: Size in bytes of the memory the object will reference
> + *
> + * This lets the GEM helpers allocate object structs for us, and keep
> + * our BO stats correct.
> + */

I would expect that this would throw a warning when making the kernel 
documentation since you are not describing the return value.



