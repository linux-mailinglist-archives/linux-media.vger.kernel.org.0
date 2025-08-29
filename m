Return-Path: <linux-media+bounces-41333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E15B3BD11
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E49A46550
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AB731E111;
	Fri, 29 Aug 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4+yTiGf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262931E0E6;
	Fri, 29 Aug 2025 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756476163; cv=none; b=J7tvGpgliy2aVpcDu/lTt4hYWyJOt2TiOFVI9jhLnB91dH+Eafh8s4yJ5YM+PcowTxdwrk3at3G3KgLoGo2ixU0nBsCnNsy9RaYNh4C36GlLKVpL7MOMKg7xhmP08FjAv97arkfx3Lk9u5n5/ISNcBEpNYJ0/URUiBjAyRXVcPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756476163; c=relaxed/simple;
	bh=rYk7kh2K0XNkrKe1b/8Qa6EV2yfNmK1OMJY9R4tVrM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJza2zRyTTt6aXG3FU5eNNgjanrKHNKBUcTGp3Pz0iRp8gIc8KnBTOz6/shk+/eX0A2ZbxEdb1MSeAItfnLSWvhu3BIn5kt7snNeSaQMyLjL/rIqRBloYRljHHPqxvjFYefgFOkw5CywwU9J9uOKbu/e5v3FE7MM349IhVp6QMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4+yTiGf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4E2C4CEF0;
	Fri, 29 Aug 2025 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756476162;
	bh=rYk7kh2K0XNkrKe1b/8Qa6EV2yfNmK1OMJY9R4tVrM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H4+yTiGfnX3YWu36m9+qObMcDf+3Xd84tneLcq5ddTQ01i9fF2TsDhnVpDmHrSNJr
	 LErQu3xvfxKgeYjxNOJl0ZRf/cgn3G+VF/4S+Cyn1unxOQUtYdPKk8XAATSLF2WGuV
	 qyEJ+kkaZyBDyb6eoAVjRMIaHtNxzvsdTx+JCEghMUGMcoOmS5/PlzDqqTG1y0qFZX
	 +PRyJ14/DKqxUdLoGFor5pfxYDWx7jDvrvgf0x9WksZN0UCe0FGn2SPvGZAMrQvv7X
	 rA6y9oxen5kjMyfYhtA5AIl+/CgmyAAev/+MOCWI//D1zAbZ/BXbOpKjDFCIBFRmhW
	 /ikGTzPPf2Ctg==
Message-ID: <19196605-50fb-440f-9666-7502de9ddfd5@kernel.org>
Date: Fri, 29 Aug 2025 16:02:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] media: chips-media: wave6: Add Wave6 core driver
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
 lafley.kim@chipsnmedia.com, Ming Qian <ming.qian@oss.nxp.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-6-nas.chung@chipsnmedia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250829084649.359-6-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2025 10:46, Nas Chung wrote:
> This adds the core driver for the Chips&Media Wave6 video codec IP.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> The core region provides the encoding and decoding capabilities of
> the VPU and depends on the control region for firmware and shared
> resource management.
> 


...

> +
> +static int wave6_vpu_core_probe(struct platform_device *pdev)
> +{
> +	struct vpu_core_device *core;
> +	const struct wave6_vpu_core_resource *res;
> +	int ret;
> +	int irq;
> +
> +	res = device_get_match_data(&pdev->dev);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing resource\n");

This is almost impossible condition. Not worth printing errors.

> +		return -EINVAL;
> +	}
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +	if (!core)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	init_completion(&core->irq_done);
> +	dev_set_drvdata(&pdev->dev, core);
> +	core->dev = &pdev->dev;
> +	core->res = res;
> +
> +	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
> +	    !strcmp(pdev->dev.parent->driver->name, WAVE6_VPU_PLATFORM_DRIVER_NAME))
> +		core->vpu = dev_get_drvdata(pdev->dev.parent);
> +
> +	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->reg_base))
> +		return PTR_ERR(core->reg_base);
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
> +	if (ret < 0) {
> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);

You should handle deferred probe instead.

> +		ret = 0;
> +	}
> +	core->num_clks = ret;
> +
> +	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wave6_vpu_init_m2m_dev(core);
> +	if (ret)
> +		goto err_v4l2_unregister;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "failed to get irq resource\n");

Syntax is: dev_err_probe

> +		ret = -ENXIO;

Don't override error codes.

> +		goto err_m2m_dev_release;
> +	}
> +
> +	ret = kfifo_alloc(&core->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to allocate fifo\n");
> +		goto err_m2m_dev_release;
> +	}
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					wave6_vpu_core_irq,
> +					wave6_vpu_core_irq_thread,
> +					0, "vpu_irq", core);
> +	if (ret) {
> +		dev_err(&pdev->dev, "fail to register interrupt handler: %d\n", ret);
> +		goto err_kfifo_free;
> +	}
> +
> +	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
> +	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
> +	if (ret) {
> +		dev_err(&pdev->dev, "alloc temp of size %zu failed\n",
> +			core->temp_vbuf.size);
> +		goto err_kfifo_free;
> +	}
> +
> +	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +	if (IS_ERR_OR_NULL(core->debugfs))
> +		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	if (core->res->codec_types & WAVE6_IS_DEC) {
> +		ret = wave6_vpu_dec_register_device(core);
> +		if (ret) {
> +			dev_err(&pdev->dev, "wave6_vpu_dec_register_device fail: %d\n", ret);
> +			goto err_temp_vbuf_free;
> +		}
> +	}
> +	if (core->res->codec_types & WAVE6_IS_ENC) {
> +		ret = wave6_vpu_enc_register_device(core);
> +		if (ret) {
> +			dev_err(&pdev->dev, "wave6_vpu_enc_register_device fail: %d\n", ret);
> +			goto err_dec_unreg;
> +		}
> +	}
Best regards,
Krzysztof

