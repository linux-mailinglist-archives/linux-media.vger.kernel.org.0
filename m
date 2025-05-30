Return-Path: <linux-media+bounces-33695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E59FAC9368
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 18:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9A0160B68
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 16:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8990B258A;
	Fri, 30 May 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNjXMMHH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945DF5674E
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622055; cv=none; b=SIwOUsGff8vtGu0y9SvNOXa/TYl6rplj1WlOuaHNgosgfnE66nImBCgVw3wS1L9ChcGUaDJviusrl2G3bP3hT/Fjf9d+kvalZNmvVVYEkjLxOaS1AGmwZBfGl0U+mDKHUwZrTkqRO0iILMJPdUivSRFbpNIMUFULPextjH0HJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622055; c=relaxed/simple;
	bh=eFE+NqKb4FGUzqVJCt/1VJwNtjUVrG/QUobe9Pt85YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE8dJ345N7KzKhr0g4Rk5o1PbRej2+x7K8eYnQr8HKhPFJ063/JsvRCcjQRULfVpG7PRNVpiZuPtGJx46QNP0RWi1xJfoXXI4L9my6zqzsynhJevFePJhsPaWiwjOeUv5VQEIZnudFh370r0dHAC0GpeSzpCuXcj2BWhpO/OW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNjXMMHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBo2ec017995
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=; b=mNjXMMHHA9/IsnPJ
	bLB6OGDnRHH6TsGyzMA9Y6YkKzuXxYzxYKwYBQX+y+WDSDMLnUbl3xlPyN9RKEFU
	VR3/076P8sMLc4qnBFFmc4zhLDyfAcT7Lbljewd8Rk48yxywVfXPLzNIH2pSUDeV
	FpSbfvepy+aBXNj6PUFKHihnQ8dK3XhbEU6CuA1z0EsuVpqK7yNpuQ4kySb2CHsp
	VDzwbNirXwHGIaLJfPCVsmK4kjj2HUigxBXP08htjUMTjgmKTfbGe5A9aAilBuOV
	Bc70kDQml7vGlIt3HFedEAWQGOLVSgL82pvT9rhxMt5NwjuYCgdvp5QjQ+fvWGFd
	tM5RYA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yrtqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:20:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-745fd5b7b65so1784467b3a.0
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 09:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622051; x=1749226851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=;
        b=ktjKQabpSOi87kjUax0bUPYSbpQRE95lMNDDIbErY7qD6QqioWMqJpnSLdGikxrJEx
         iGzIhwFgruVHo3OhocrbX2LsdyW9oA4BPJ4ijEq9IrhVcXz3Sf6nl4GNRWV5tkRknLFW
         I5pb7NtuM4NkrEvqcsi+TnT/BFWxgUczociiDvy3RZBeRhA8aOyhPykDXcxOdmD5B4IU
         AbGM5YA694IZDCTszKSk8CZ72ApWI4iuZzhVk0QeIV29KKdC38SPUv+o4zh/3Q60H1N4
         dJ+z10COw2anVzEKUuOiW2Ae/plFZ4CLIgRZPVpP4LD0P6NclfJwz+L2TEiK5Af1/uMR
         HB7g==
X-Forwarded-Encrypted: i=1; AJvYcCWRnWgiIhpV6OO1NOO+jPPMiW7nTZfPP5Ip1B4EKjD3pCcLLzxBaAj70e1VILZhJfZc2xs9PRdNyBTPRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQvFHOqC6gpLPBaBMSDGdYHR03+hmGXoh/PaeqTi0vWciIPn+f
	/QtgRenUrw7uWYe97jpLZTyL9oCrdw/jYMNIZ6Zfl5bFoaD8FkWLPRYDABAJAZc2dUdjZfxJ79P
	vSSYo2QEBMNwMjVZLkjBxMrrQLGZVPqcq388DyWuwhteCqnNH1ejbH14QNRUlogiq3A==
X-Gm-Gg: ASbGncs2NIL75SGPFqRS20F/nfw/zohe8rSw/0VcYMzzxiR+2bDNpdChvTqOA5CcrlN
	hjQrnyy0qW/ZAP13oVr0Ulk0WjYGYLhu3LDnGp+Zv143euRbYe2dtlJ8EN9ffCTnGYWnzgNsLiO
	v4o1eqPtJPD6IkzrPQW5/pUFfOmzV0b8hj/3KD3chw18t+tnzynNtkZ1Jd+erJB4JdrGDjXNY7k
	KU/3BxKwZtIzxU2DYP3BXFkEUOMOFCKit1kXeXRil2AhXZ2lswD77cehgvU9BIibO+6ReqqHYzr
	w3MKFjo4Jp2Vu/q8WWdWWLODJNEZZV2R6opdVCiEBzc6vHYex4B6s1vXJZKFCh25X9Bb7m8B
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995547b3a.23.1748622050765;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3KvuYJT4qbQ5u5CbTu0XT/yKXicfsd+dn08wq+4nYHqmMZGv9KAdolvB8TbaAHA/+TUu3/A==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995515b3a.23.1748622050335;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd2c86sm3325986b3a.144.2025.05.30.09.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:20:49 -0700 (PDT)
Message-ID: <463162bb-5e2d-4768-8811-ede7b2063c85@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:20:47 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NCBTYWx0ZWRfXy5ZrRL6QAEGq
 StcQcOuk+23yP9HxEIvlqyxJ6zdddKE6kO0mNVyoOvdj/Ii8+Oc0Gzw5k724EaICrwuIQflVg/9
 WAh59SBEY7Y3YeH67n1DCpPPIxUm3jf6W4ZqFwFSPJyzt4Px3C/DPSgA0CEOy738RqDKxGDIn15
 fgKFmNrv2V3yKV1WRxkFMhit2XgPuC5dTz/0jt6Ck/wAZj0ySXt16oGlzt6rgDL0QG6NlLEPh4o
 gL8u58SLQD5AnztUQxpzNBTJRE34PW4/gozIhvkvdspBvT+4SQBXt7padZ6gcuK3cWHdFEkoD+8
 OBc5Gjr2kgITYROJGoyZEDfPYnZ3F0i09X6+cdeSDbdDc71M297V9fbW3G8rclfoJi/es9Lj01I
 qgrqpQwTNHcVur62fw366tpLfG290tNsimkn4dXzRsVbu9ArM1U5l8U+nyXx0A6toDHK5O38
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839dae3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=HlDAqVJfg7-00m_e3XEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: X_8-W8MXfctr1iGxyaqmDLwbWNdT5be1
X-Proofpoint-ORIG-GUID: X_8-W8MXfctr1iGxyaqmDLwbWNdT5be1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=898 malwarescore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300144

On 5/20/2025 4:26 AM, Tomeu Vizoso wrote:
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..55f4da252cfbd1f102c56e5009472deff59aaaec
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DEVICE_H__
> +#define __ROCKET_DEVICE_H__
> +
> +#include <drm/drm_device.h>
> +#include <linux/clk.h>
> +
> +#include "rocket_core.h"
> +
> +struct rocket_device {
> +	struct drm_device ddev;
> +
> +	struct clk_bulk_data clks[2];
> +
> +	struct rocket_core *cores;
> +	unsigned int num_cores;
> +};
> +
> +int rocket_device_init(struct rocket_device *rdev);
> +void rocket_device_fini(struct rocket_device *rdev);
> +
> +#define to_rocket_device(drm_dev) \
> +	((struct rocket_device *)container_of(drm_dev, struct rocket_device, ddev))

Include container_of.h?

> +static int rocket_drm_bind(struct device *dev)
> +{
> +	struct device_node *core_node;
> +	struct rocket_device *rdev;
> +	struct drm_device *ddev;
> +	unsigned int num_cores = 1;
> +	int err;
> +
> +	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	ddev = &rdev->ddev;
> +	dev_set_drvdata(dev, rdev);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
> +
> +	rdev->cores = devm_kmalloc_array(dev, num_cores, sizeof(*rdev->cores),
> +					 GFP_KERNEL | __GFP_ZERO);

devm_kcalloc will handle the ZERO flag for you.



