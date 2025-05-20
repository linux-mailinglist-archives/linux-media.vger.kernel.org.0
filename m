Return-Path: <linux-media+bounces-32865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D3ABD092
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F618A3649
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158FC25DB0B;
	Tue, 20 May 2025 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBCD7X/I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6520A25CC56;
	Tue, 20 May 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726663; cv=none; b=tpDmegiVfXhN614MPIcvyb+wMxJNhk2tuKOQcJQCrVSjrmmbowbYzMBLjNLOLU38XjeXUBdfQq92T/Ta7FPXE+yAuTX/PVReFOf62UEDy/vEHhuJwWdGPXMm9ac+B9hYV6/YXrOYbqZ68qPg9EznTZrA3fXfdBiYQMqjaM+fOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726663; c=relaxed/simple;
	bh=fVyiR8D7qQA0+vUTgX2LRrLxivKrGYmC1L9B3HBhIp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYPG6A+GOfrWNyezMs8Se5zHDnyEaAiWNtYC9FArYne07a4m8YHpz4eSROY5r0zVb5D3SPIIEVKo3TtCBfr2edcnYj3s2NYuzsSrqC8/SDaob78X9qzXoXmRbvnolvS7hzMANyx8/ZCVjzf97ibE4OUwdCktQ7+1Zt+SRCdviL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBCD7X/I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48570C4CEE9;
	Tue, 20 May 2025 07:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726662;
	bh=fVyiR8D7qQA0+vUTgX2LRrLxivKrGYmC1L9B3HBhIp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBCD7X/Ibe+2sYG6xP8sVpZb/vvzfhqkfWycoZsODdRu0VlV9AzpwEbDry/P8F/Ki
	 160DahL5vOyYPwKvMHogsbRJjloc+9RW95QTgbAOYkHGrvyU6pZOIzBMpLDSRvv58+
	 BUnXAyXUkB275DFTYj37RQ48hOiD4G6tZPHThU8pDoh7Q96nKggGXnvCvaWTssLPXy
	 D4Lxnato7ApFWIGCt02TmsNFsgVWDS05ddVMquc+IEx925tVwN1KoOstszxYB9LJSg
	 931bNAa+VGLwHHpB9NalKtr0s4Ta9DlL0WsQCce7tNWGaAiywZjHqBSPLO//shlkOy
	 Xncs2LCkxJUOg==
Date: Tue, 20 May 2025 09:37:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
Message-ID: <20250520-silent-prophetic-cricket-fa0fa9@kuoka>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
 <20250519-6-10-rocket-v4-5-d6dff6b4c0ae@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519-6-10-rocket-v4-5-d6dff6b4c0ae@tomeuvizoso.net>

On Mon, May 19, 2025 at 03:43:37PM GMT, Tomeu Vizoso wrote:
> +#endif
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bb469ac87d36249157f4ba9d9f7106ad558309e4
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <linux/clk.h>
> +#include <linux/dev_printk.h>
> +
> +#include "rocket_device.h"
> +
> +int rocket_device_init(struct rocket_device *rdev)
> +{
> +	struct device *dev = rdev->cores[0].dev;
> +	int err;
> +
> +	rdev->clk_npu = devm_clk_get(dev, "npu");
> +	if (IS_ERR(rdev->clk_npu)) {
> +		err = PTR_ERR(rdev->clk_npu);
> +		dev_err(dev, "devm_clk_get failed %d for clock npu\n", err);
> +		return err;
> +	}

That's probe path? so use standard syntax:

return dev_err_probe(). One line instead of four.

> +
> +	rdev->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(rdev->pclk)) {
> +		err = PTR_ERR(rdev->pclk);
> +		dev_err(dev, "devm_clk_get failed %d for clock pclk\n", err);
> +		return err;

Same here... except that this should be blk API and entire function gets
smaller.

> +	}
> +
> +	/* Initialize core 0 (top) */
> +	err = rocket_core_init(&rdev->cores[0]);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}

...

> +static int rocket_device_runtime_resume(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +	int core = find_core_for_dev(dev);
> +	int err = 0;
> +
> +	if (core < 0)
> +		return -ENODEV;
> +
> +	if (core == 0) {
> +		err = clk_prepare_enable(rdev->clk_npu);
> +		if (err) {
> +			dev_err(dev, "clk_prepare_enable failed %d for clock npu\n", err);
> +			return err;
> +		}
> +
> +		err = clk_prepare_enable(rdev->pclk);
> +		if (err) {
> +			dev_err(dev, "clk_prepare_enable failed %d for clock pclk\n", err);
> +			goto error_clk_npu;
> +		}
> +	}
> +
> +	err = clk_prepare_enable(rdev->cores[core].a_clk);
> +	if (err) {
> +		dev_err(dev, "clk_prepare_enable failed %d for a_clk in core %d\n", err, core);
> +		goto error_pclk;
> +	}
> +
> +	err = clk_prepare_enable(rdev->cores[core].h_clk);
> +	if (err) {
> +		dev_err(dev, "clk_prepare_enable failed %d for h_clk in core %d\n", err, core);
> +		goto error_a_clk;
> +	}

All four above calls could be just one call with bulk API.

> +
> +	return 0;
> +
> +error_a_clk:
> +	clk_disable_unprepare(rdev->cores[core].a_clk);
> +
> +error_pclk:
> +	if (core == 0)
> +		clk_disable_unprepare(rdev->pclk);
> +
> +error_clk_npu:
> +	if (core == 0)
> +		clk_disable_unprepare(rdev->clk_npu);

And all this would be gone...

> +
> +	return err;

Best regards,
Krzysztof


