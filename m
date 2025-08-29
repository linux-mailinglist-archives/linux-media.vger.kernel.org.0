Return-Path: <linux-media+bounces-41334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AFB3BD1F
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97608A47651
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A03731DDBA;
	Fri, 29 Aug 2025 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhf2/Hoi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9DC2701DC;
	Fri, 29 Aug 2025 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756476369; cv=none; b=nE838hVwasi1KB/5JrIksx8wSnVkhITmk94k0xhIjiNYx1rPogPROpZ5gastemJGCzruWXYr7LKcfIFmZFsTxW58XwyImARLb5VZg4E5RXnHaP8tWJPkFmttjhPxF5YuKfonD9JKpfDsiXsdpdFGnezJ1QZyrxMrd4aXKEiqqe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756476369; c=relaxed/simple;
	bh=5hnfrxB59btF5GVW6Vc7xXSqfEVv47osUlR/KT5zvJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzqX9sXdnnO1vMMa9uPDK3WZ6teKM4CeKsohU48o/VBViV+mz9dJ/ojerbGrNdv/QQ5xe29bWGdeNuf9EVj1ojOQCiRI/dCKKmssgoPuan3YyGvkEtawNCQ/lOos4XoDzFSTT34I4boY2gYqkfQVmRBSrp67E70DMPdu6kZBVyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhf2/Hoi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CF0C4CEF0;
	Fri, 29 Aug 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756476368;
	bh=5hnfrxB59btF5GVW6Vc7xXSqfEVv47osUlR/KT5zvJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uhf2/HoiXGKYEqu/pkUaMb2gMLZ+iBw5kivrOV03qQ9PCcUoxKw51pzRvZEYvJ/ab
	 knEgYDfSXfewnVQYciMw0Mw0dVOcaC6gB85gV6iuC991zGcd2Palbsg+OFI81+InTD
	 jcXXpoPWlB/uIrVzYh5CGlL72Os0fwEKfHZDzS09Ft8ZUR9Ee+C2WABDq9UzEwKGSR
	 rsIPmQyUUMnidYFGTy/HXIlkXq5A3lIO0BKhqiOQvOYg2yC18ZJdiVtm59zWMQGVzd
	 ZCqrjgLZj4cSKK8h69DA1Emr5ISXUPR9TjJlXarSrabTK8Eu0CyBDBHkom9rteQMAF
	 +KDIdWBUpNRpA==
Message-ID: <5502f52d-d302-4479-93b8-1da47731cf1d@kernel.org>
Date: Fri, 29 Aug 2025 16:06:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control
 driver
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
 lafley.kim@chipsnmedia.com, Ming Qian <ming.qian@oss.nxp.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-9-nas.chung@chipsnmedia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250829084649.359-9-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2025 10:46, Nas Chung wrote:
> +
> +static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
> +{
> +	struct wave6_vpu_device *vpu = context;
> +
> +	guard(mutex)(&vpu->lock);

Why? How could this be called in parallel, before the probe?

> +
> +	if (!fw || !fw->data) {
> +		dev_err(vpu->dev, "No firmware.\n");
> +		return;
> +	}
> +
> +	if (!vpu->fw_available)
> +		goto exit;
> +
> +	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
> +		dev_err(vpu->dev, "firmware size (%ld > %zd) is too big\n",
> +			fw->size, vpu->code_buf.size);
> +		vpu->fw_available = false;
> +		goto exit;
> +	}
> +
> +	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
> +
> +	vpu->get_vpu = wave6_vpu_get;
> +	vpu->put_vpu = wave6_vpu_put;
> +	vpu->req_work_buffer = wave6_vpu_require_work_buffer;
> +	of_platform_populate(vpu->dev->of_node, NULL, NULL, vpu->dev);
> +
> +exit:
> +	release_firmware(fw);
> +}
> +
> +static int wave6_vpu_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np;
> +	struct wave6_vpu_device *vpu;
> +	const struct wave6_vpu_resource *res;
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	res = of_device_get_match_data(&pdev->dev);
> +	if (!res)
> +		return -ENODEV;
> +
> +	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
> +	if (!vpu)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
> +	if (ret)
> +		return ret;
> +
> +	atomic_set(&vpu->core_count, 0);
> +	INIT_LIST_HEAD(&vpu->work_buffers);
> +	dev_set_drvdata(&pdev->dev, vpu);
> +	vpu->dev = &pdev->dev;
> +	vpu->res = res;
> +	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(vpu->reg_base))
> +		return PTR_ERR(vpu->reg_base);
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
> +	if (ret < 0) {
> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);

You need to handle deferred probe.

> +		ret = 0;
> +	}
> +	vpu->num_clks = ret;
Best regards,
Krzysztof

