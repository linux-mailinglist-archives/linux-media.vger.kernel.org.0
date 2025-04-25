Return-Path: <linux-media+bounces-31077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587CA9D071
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 20:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB59C9E05A7
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 18:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13ED217716;
	Fri, 25 Apr 2025 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FQXA+UJm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4A188733;
	Fri, 25 Apr 2025 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745605423; cv=pass; b=Qiuv55P5m9X/4p3eGJuyynmoq3lHLz0eqBiOygePdzzEBp4tYAjAHEjzD6sO+gO85gZJf7PqwIetsYMnyRUTVj1tJnzDOj0EMBcR9qRzGapjxmY2jSxnJdI3kuuBRFMw2S6NheZ4xeVzCiH+OFT5H4UF+x4NktH4nPGjrXMwCtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745605423; c=relaxed/simple;
	bh=cTAlc/+Wf4vVMxPoxY1qiiaZu7vV+g+7hcErx0GI2WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6mze749H7Rulpwvdk0JECzvBcpesYQ4cVnxXek1vt6PubPqdk8SbXLvvoi9dO/MwJDGyNs8eST/iB72Fn4NR5cPWivW3ff5+oFgwMYT1h2Nnf2sf/OfLchs83vSY1CzHVBcnjd9OpzzJy2auccajkBGgU3CM2doMyx8CUygIEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=FQXA+UJm; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745605385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XR4vgjGGKgdTAQTS2rACu8DaNC0+4UT/y6l9t417lb2cEStrUiXb49602fgwtccUsuX6Y7kHT14MvO7LiXz/8vP2d9vyBMllb1yfwmw+lyFAzcy6j11bYeX9roXbD72We6/FhhaGdz4R22SLlAc7fOCP1UFTbutm9Mb8ATzOW+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745605385; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0RChf9eM3DaEmdKL7oMWpMmY3Kl6bXdjA82ZsWOcius=; 
	b=HeWEfNg05JGno+gblt9+NGBaOAc8R0q0ykioi6LxZ/YCrqqzWMn92WJP7wUnuLEU13sUQx4iPR0F5Y8oudQIORyGqJl3AQ9iSL4f4awb9YYVdgX3oO0WCm07xBMCeaAvUIncNk9u6U6px46oXvLSeXZ9mNfpdGv7lcXldvx9ml4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745605385;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=0RChf9eM3DaEmdKL7oMWpMmY3Kl6bXdjA82ZsWOcius=;
	b=FQXA+UJmtg+IY7UgzEQ+P9azZOu+hNcePPWPRlkIrfJ+s8uJDDZI/ISowa6uJow9
	FRLma6kBaxPxT8zOpGE3SAbplMgma1cSyjpRidXiVhN8Llw9AXWiT7APRkqa5RxjwLk
	uqkyIB9cMsYFPNm1mNRFQkNmUZ1p3tlYCA5RYoVA=
Received: by mx.zohomail.com with SMTPS id 1745605383428608.9673402692126;
	Fri, 25 Apr 2025 11:23:03 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-rockchip@lists.infradead.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 4/7] accel/rocket: Add a new driver for Rockchip's NPU
Date: Fri, 25 Apr 2025 20:22:55 +0200
Message-ID: <2950819.ElGaqSPkdT@workhorse>
In-Reply-To: <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
References:
 <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 25 February 2025 08:55:50 Central European Summer Time Tomeu Vizoso wrote:
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
> 
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
> 
> This commit adds just hardware initialization and power management.
> 
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  Documentation/accel/index.rst           |    1 +
>  Documentation/accel/rocket/index.rst    |   19 +
>  MAINTAINERS                             |    8 +
>  drivers/accel/Kconfig                   |    1 +
>  drivers/accel/Makefile                  |    1 +
>  drivers/accel/rocket/Kconfig            |   25 +
>  drivers/accel/rocket/Makefile           |    8 +
>  drivers/accel/rocket/rocket_core.c      |   71 +
>  drivers/accel/rocket/rocket_core.h      |   29 +
>  drivers/accel/rocket/rocket_device.c    |   29 +
>  drivers/accel/rocket/rocket_device.h    |   29 +
>  drivers/accel/rocket/rocket_drv.c       |  273 ++
>  drivers/accel/rocket/rocket_drv.h       |   13 +
>  drivers/accel/rocket/rocket_registers.h | 4425 +++++++++++++++++++++++++++++++
>  14 files changed, 4932 insertions(+)
> 
> [...]
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c22d965f20f1239a36b1d823d5fe5f372713555d
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -0,0 +1,273 @@
> [...]
> +static int rocket_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device_node *core_node;
> +
> +	if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk3588-rknn-core"))
> +		return component_add(&pdev->dev, &rocket_core_ops);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core") {
> +		if (!of_device_is_available(core_node))
> +			continue;
> +
> +		drm_of_component_match_add(&pdev->dev, &match,
> +					   component_compare_of, core_node);
> +	}
> +
> +	return component_master_add_with_match(&pdev->dev, &rocket_drm_ops, match);
> +}

Hi Tomeu,

something I've noticed while playing with this: currently, it doesn't seem like
it's possible to support 1-core NPUs. rknn-core-top is a real core, but if no
rknn-core is enabled beside it, it'll call component_master_add_with_match with
match being NULL. This causes a kernel Oops.

I'm not sure what the proper fix is, since the component API doesn't seem to
really have a consideration for a master with no other components.

I ran into this when I was trying to debug why I get job timeouts followed by
a full SoC lock-up on RK3576 by running with only one of the two cores enabled.

As an aside note, my throwaway rocket-on-RK3576-hacking-branch is at [1] and
contains some changes you may want to consider for v3, e.g. [2] and [3]+[4]. In
[4], specifically the `domain-supply` part which means the NPU regulators don't
have to be always-on. Though feel free to pull in my entire ROCK 5B enablement
patch.

Kind regards,
Nicolas Frattaroli, who discovered that his cat is apparently 5% space heater
according to mobilenet while playing with this patch series.

[1]: https://gitlab.collabora.com/fratti/linux/-/commits/tomeu-npu?ref_type=heads
[2]: https://gitlab.collabora.com/fratti/linux/-/commit/73aba31a00b34c254be575b524da568e115d985d
[3]: https://gitlab.collabora.com/fratti/linux/-/commit/bd3a7bf5054c54c2915a9dc0396730d0f24b3b7c
[4]: https://gitlab.collabora.com/fratti/linux/-/commit/5da44d61b09c345309f76159574d447d071c295d




