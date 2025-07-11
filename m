Return-Path: <linux-media+bounces-37529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EFFB022D2
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 19:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96ADE5A760A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 17:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E301D2F1984;
	Fri, 11 Jul 2025 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MfxRnRrK"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256C2F1991;
	Fri, 11 Jul 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255676; cv=none; b=CnoR/2SbiHJ8hB/lKhYKay+sR/pIFD4RA3qu39y8nPiVqG+k5OEuo4RE2alEDcS+IpSFI8m3cfO8jUuIrS3UUNgJylH2pUNiNKJCGjP5OFkOu9+MbUn2sbzvuhAhX/alx5FjmF6eZYLeXaddwgVnYJbC1j2pS8JuBRTGrN5B8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255676; c=relaxed/simple;
	bh=A+IZMmbCmHFz7LA5U90SHkR83aX68N0xOOmAhTQfdps=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lgMAVqy913t/8HMojoP8HR427pl38aGBjbIT0QmCvu4wHANJEInGQbGY1PJ7CmAn2Yi9lN2da1RFD5aZFaZIsehdtTcUTsGbR1+Sj1JuqpcQRIvdupELZCqEo+aIJRrj9tc3a0MJ/khpB+tDC7AI5a6IMhlZ4Zh4vFS76uUptTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MfxRnRrK; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BHemug1861107;
	Fri, 11 Jul 2025 12:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752255648;
	bh=avkCSBI/cy3dHICmDxAzJXYe1H+unqcSXKS5zVohgaE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MfxRnRrKgfCUgO2J9UsENDPiXwTOrv7M+KRQK4+WubWagVc1t8P07KW7Eqp+XtZUK
	 kEbQVJRSEM/E4NEI1bAIugDacmCrpCTnuo/gdgQp7j9MAA3mc4VLjM+KuTu0R+rRO6
	 ZiN1UFF5JJS6uX5fPKjBaY5Yzkevs1GL6yNSaKfk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BHem8U533293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 12:40:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 12:40:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 12:40:47 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BHekf83588411;
	Fri, 11 Jul 2025 12:40:46 -0500
Message-ID: <7178abc9-8f92-4bba-9b50-ffdf5f8d1279@ti.com>
Date: Fri, 11 Jul 2025 12:40:46 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] accel/rocket: Add IOCTL for BO creation
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
 Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli
	<nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da
 Xue <da@libre.computer>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/6/25 1:28 AM, Tomeu Vizoso wrote:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
> 
> v2:
> - Sync the IOMMUs for the other cores when mapping and unmapping.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   drivers/accel/rocket/Makefile        |   3 +-
>   drivers/accel/rocket/rocket_device.c |   4 ++
>   drivers/accel/rocket/rocket_device.h |   2 +
>   drivers/accel/rocket/rocket_drv.c    |   7 ++-
>   drivers/accel/rocket/rocket_gem.c    | 115 +++++++++++++++++++++++++++++++++++
>   drivers/accel/rocket/rocket_gem.h    |  27 ++++++++
>   include/uapi/drm/rocket_accel.h      |  44 ++++++++++++++
>   7 files changed, 200 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> index abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96..4deef267f9e1238c4d8bd108dcc8afd9dc8b2b8f 100644
> --- a/drivers/accel/rocket/Makefile
> +++ b/drivers/accel/rocket/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
>   rocket-y := \
>   	rocket_core.o \
>   	rocket_device.o \
> -	rocket_drv.o
> +	rocket_drv.o \
> +	rocket_gem.o
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index a05c103e117e3eaa6439884b7acb6e3483296edb..5e559104741af22c528914c96e44558323ab6c89 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -4,6 +4,7 @@
>   #include <linux/array_size.h>
>   #include <linux/clk.h>
>   #include <linux/dev_printk.h>
> +#include <linux/mutex.h>
>   
>   #include "rocket_device.h"
>   
> @@ -16,10 +17,13 @@ int rocket_device_init(struct rocket_device *rdev)
>   	if (err)
>   		return err;
>   
> +	mutex_init(&rdev->iommu_lock);

devm_mutex_init() again keeps you from needing rocket_device_fini().
Same in the next patch even if you don't end up needing the iommu_lock.

Andrew

