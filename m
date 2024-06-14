Return-Path: <linux-media+bounces-13276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604D909005
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 18:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E02288A2A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAF4171082;
	Fri, 14 Jun 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EbysnwGS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77304637;
	Fri, 14 Jun 2024 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382114; cv=none; b=cjeIkLDOPUlZ72RhrejbfJFd1v0Ut2DvBFcrKburxQaH3AOsgPa4ogv/HR5L/f0pCfMc3SuH/OjZLAF6dyWA2KltGPJNt9u4eTkh6Bav1sURYqXmMZCsANwtD2s/4AK21uMDGi/U6Xg8ScJM/Q+2KWn+CSIsSHQBVQF2B19SINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382114; c=relaxed/simple;
	bh=3gS7lmJ3XLUEPpg7b58zfXEwl9wGyHzOeGQZBUzLDLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fkphN0MeBC+H+d9Rc7iv0Gfg8rsQSb/BsVzioVFnPQNQigBssE3c6I2BdYeNGDT5ErJu4vraC5fOwf6RVj/dXFcnk2XOYulEPI8pXMSmnK3bzjkjLnncfeblcSlGVzZB0y6sE/fylFN9jEhPzqp8ItKXDRJKwt0zfyZgzq0vTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EbysnwGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E8GgVF030966;
	Fri, 14 Jun 2024 16:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppnvC/ArPtVIlJzIvzpz61ZVN8j+4Yift9Ae0cCDUcs=; b=EbysnwGS4cZTYbl7
	gHvKS8jTcdGgA5daWROx/eJIKIglFFN/dmfctbWv/NXSFQRsKmyuTRSuhbqOShjO
	w8rJkVpxr1R2DKvQ3+wV+LZnBZVDlCjAtiq6ijb3oz8ME1SlJH2L5jdz5WCmPFii
	92UUmEqYX5XK4ivkU726APmqZgwl7/X2Qo3x31XgGDgVcte5pKfrzbFzVGTZSpgs
	FPO5CCJ3zdYZgWkh7AKzwEjQTRpSaZwAavo8H+Y4LZzjS7tb4ehFZZiXPKGvIoNC
	z+I9Q1aTvgdK9roXrA4FsZTZUhqSyJIEktt783ajsLXXjwG7Em7XjUYBKOErR/Kg
	ykRo2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q2t9pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 16:21:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45EGLNuO021852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 16:21:23 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 09:21:23 -0700
Message-ID: <8f0ab2e9-3f41-3b39-6733-e5063dd7ca43@quicinc.com>
Date: Fri, 14 Jun 2024 10:21:22 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/9] accel/rocket: Add IOCTL for BO creation
Content-Language: en-US
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>,
        Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Heiko Stuebner
	<heiko@sntech.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Oded Gabbay
	<ogabbay@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
        David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
CC: <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-7-060e48eea250@tomeuvizoso.net>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240612-6-10-rocket-v1-7-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cfgQbnp0Qu7uwDjEmxhNpEZP84sCt-Lp
X-Proofpoint-GUID: cfgQbnp0Qu7uwDjEmxhNpEZP84sCt-Lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_14,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=666 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140110

On 6/12/2024 7:53 AM, Tomeu Vizoso wrote:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

