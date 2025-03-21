Return-Path: <linux-media+bounces-28585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B4A6BFD1
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 17:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BA93B6BAC
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A34E22B8AC;
	Fri, 21 Mar 2025 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oU7Fs3ea"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344F1D86F2;
	Fri, 21 Mar 2025 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574228; cv=none; b=E1qqMRtuKGgvTe9Sxb+F9KsA8dFds9h5pqU06GLn8SSXfvXdSyFfjMkqMh6JkypMJFWzM2eObDCXmmxaK0q3LeFjOJJQwlfRHpAQK5CguP+s9qGiDboG41CQuCIG4QYFCzMd9hOZEgamFg/wYCuVTvoQIlmVVAWPuLnLAhyD/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574228; c=relaxed/simple;
	bh=/ouq0Vnbu9fdDtvgpsSzY689c7oKwvhmkvXS6uikKis=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xed1Jh7wnFVt3gB5E6P8KpYVl1CfcKkfgHic5cwMhrlcN/uY0SatHx65F2vr9dPYxnUSTJhqq0bYsWeiUSeUdgf8qW9vbOs8r+HWaJ5Gdv9lLvTLHZ1JX8d/8WSvVzFRztqfKMzCQpHnZnwSbZ6drOY8GbCvrU3aH4L0kqiaT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oU7Fs3ea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATAxR022089;
	Fri, 21 Mar 2025 16:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBRdEC2YlUOGNuYmFaUCuGN/I3DKMV8CuIRZm9h64e4=; b=oU7Fs3eaxw4keBvW
	9o7y/e38Sp5Sn2DxoMVfGfnzWgYEAD8ifRW+BEVes6Gkmka2BXisi4e+XqOSqEnd
	Y5jb39nKZ5jZXRrrR9WvsH0yHGAZnl6lbjyJugQZRzNUZLBOcQP95kuDbX4Zs9CA
	YpxXtLdVBMgZmqEpkplwqTH2CGoRqimllEgzeCfLMhVEBxi89Ozrf+21P+XDpvT8
	BCD6fJWEEh83NpGTgOGy6KO4/cxbMwQ7XNUMeOlmtsuTNlRO2YSWHGU5P4bUoCNL
	rDUZIL+dMzkDpdCk0rlpKYKST/T9a+dldEDsx6K7hhjTebc7miRm+hBtP/BzB+gR
	YToBng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wph8c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 16:15:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LGFRVj014152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 16:15:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 09:15:26 -0700
Message-ID: <6cf7d790-57a8-40b9-b5b0-dedfce78d074@quicinc.com>
Date: Fri, 21 Mar 2025 10:15:25 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
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
 <20250225-6-10-rocket-v2-7-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250225-6-10-rocket-v2-7-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BOfd9NSv-9Zt74cr0Av2_wp2C2GJ3ORR
X-Proofpoint-GUID: BOfd9NSv-9Zt74cr0Av2_wp2C2GJ3ORR
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd90a0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZfkCZY2BxkJJNCUMkzUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=916 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210119

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_rocket_fini_bo *args = data;
> +	struct drm_gem_object *gem_obj;
> +	struct rocket_gem_object *rkt_obj;
> +	struct drm_gem_shmem_object *shmem_obj;
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +
> +	gem_obj = drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	rkt_obj = to_rocket_bo(gem_obj);
> +	shmem_obj = &rkt_obj->base;
> +
> +	WARN_ON(rkt_obj->last_cpu_prep_op == 0);
> +
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {
> +		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
> +					    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
> +	}
> +
> +	rkt_obj->last_cpu_prep_op = 0;
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return 0;
> +}

flags must be 0, and you must check that here. You do not appear to be 
doing that. Otherwise, userspace may put a value in flags, which is 
ignored now, but later when you define flags for a purpose, existing 
userspace will be broken - a uapi violation.

