Return-Path: <linux-media+bounces-25942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E0A2F570
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 627B87A25D4
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4E5255E41;
	Mon, 10 Feb 2025 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yz/w29BX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D14690;
	Mon, 10 Feb 2025 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209070; cv=none; b=WIfJDTfO032G1wQJ7gyABaoQ7eq3vV/G29CIfZIZ9MKTcXpwtbxLko0pi1gNSQNavzKLuji6Bo7Vv1+DP2GiN7nhF5oiLWjAMc8rgKLEW7mQmHJIb6FQTU2EveJqtYi/kJ84r3tOdjFAbV9fSW0ZlNXfXuDIBnfB+dfpG11yiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209070; c=relaxed/simple;
	bh=ZHvhVHZPAWcr/LsvWZUEqNdGcfT0gR+ANC+5K9rR1hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDessc0BfoHecBITAsbP/4CCdIYLaG6E8akzUteOnDr05A/WGeGqrBRKpTiGqnT9idQFe/EXpzSdvnFSB3og0/simgeXkIwtyYXOYGL0ERF0u/4V50ghHsOnjJQrSncSWI3wK+Z0J/WWpF5Tv5rTGlk9K3CPY0w1smNeQGIdkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yz/w29BX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D65C4CEE5;
	Mon, 10 Feb 2025 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739209069;
	bh=ZHvhVHZPAWcr/LsvWZUEqNdGcfT0gR+ANC+5K9rR1hw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yz/w29BXqKtKuah7/Gjos0WKIWqiAHV0yuukQ3iqe/FkH3SLtH13QEYx0BUdfeTLx
	 AkWBxH4zU1e6bLVmNB7A+ST4n7GncznRM5KVNMypj3gLlJGhamKLBDparWy96+AV9n
	 ksYpIDyPxqfMCQN++J2Jumi0QXM8IswMEE/uj9g7Y3yxKlaM7mIuzW3LNJKKUnrFM3
	 aV0lmCgGtQkkeztUYrvJLGvLVZJzrlJV3B5faPw0IOp4x6Qx3TjTYiBZ0LivWFWMD3
	 Y8KYjnDwQ7k3ZTCgqI023P8pIJTIypqWgeKCDqI1Hkgao+/IcjIlGRePG6VroooPRV
	 u4RQEQLZuCM7g==
Message-ID: <2c3b9e21-06fc-4108-80d7-c4e2c4ceb2fa@kernel.org>
Date: Mon, 10 Feb 2025 18:37:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
 lafley.kim@chipsnmedia.com
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-8-nas.chung@chipsnmedia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250210090725.4580-8-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 10:07, Nas Chung wrote:
> +
> +int wave6_vpu_ctrl_resume_and_get(struct device *dev, struct wave6_vpu_entity *entity)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
> +	bool boot;
> +	int ret;
> +
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	if (!entity || !entity->dev || !entity->read_reg || !entity->write_reg)
> +		return -EINVAL;
> +
> +	mutex_lock(&ctrl->ctrl_lock);
> +
> +	ret = pm_runtime_resume_and_get(ctrl->dev);
> +	if (ret) {
> +		dev_err(dev, "pm runtime resume fail, ret = %d\n", ret);
> +		mutex_unlock(&ctrl->ctrl_lock);
> +		return ret;
> +	}
> +
> +	entity->booted = false;
> +
> +	if (ctrl->current_entity)
> +		boot = false;
> +	else
> +		boot = list_empty(&ctrl->entities) ? true : false;
> +
> +	list_add_tail(&entity->list, &ctrl->entities);
> +	if (boot)
> +		ret = wave6_vpu_ctrl_try_boot(ctrl, entity);
> +
> +	if (ctrl->state == WAVE6_VPU_STATE_ON)
> +		wave6_vpu_ctrl_on_boot(entity);
> +
> +	if (ret)
> +		pm_runtime_put_sync(ctrl->dev);
> +
> +	mutex_unlock(&ctrl->ctrl_lock);
> +
> +	return ret;
> +}

Drop entire function.

> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_resume_and_get);

Drop.

> +
> +void wave6_vpu_ctrl_put_sync(struct device *dev, struct wave6_vpu_entity *entity)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
> +
> +	if (!ctrl)
> +		return;
> +
> +	if (entity == ctrl->current_entity)
> +		wave6_vpu_ctrl_wait_done(dev);
> +
> +	mutex_lock(&ctrl->ctrl_lock);
> +
> +	if (!wave6_vpu_ctrl_find_entity(ctrl, entity))
> +		goto exit;
> +
> +	list_del_init(&entity->list);
> +	if (list_empty(&ctrl->entities)) {
> +		if (!entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC))
> +			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
> +		else
> +			wave6_vpu_ctrl_sleep(ctrl, entity);
> +	}
> +
> +	if (!pm_runtime_suspended(ctrl->dev))
> +		pm_runtime_put_sync(ctrl->dev);
> +exit:
> +	mutex_unlock(&ctrl->ctrl_lock);
> +}
> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_put_sync);

Drop entire function. Dead code.

... or you arranged your patches really incorrectly, but this I can't
really judge.


> +
> +int wave6_vpu_ctrl_wait_done(struct device *dev)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	if (ctrl->state == WAVE6_VPU_STATE_OFF)
> +		return -EINVAL;
> +
> +	if (ctrl->state == WAVE6_VPU_STATE_ON)
> +		return 0;
> +
> +	ret = wave6_wait_event_freezable_timeout(ctrl->load_fw_wq,
> +						 wave6_vpu_ctrl_get_state(dev) ==
> +						 WAVE6_VPU_STATE_ON,
> +						 msecs_to_jiffies(W6_BOOT_WAIT_TIMEOUT));
> +	if (ret == -ERESTARTSYS || !ret) {
> +		dev_err(ctrl->dev, "fail to wait vcpu boot done,ret %d\n", ret);
> +		mutex_lock(&ctrl->ctrl_lock);
> +		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
> +		mutex_unlock(&ctrl->ctrl_lock);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&ctrl->ctrl_lock);
> +	wave6_vpu_ctrl_boot_done(ctrl, 0);
> +	mutex_unlock(&ctrl->ctrl_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_wait_done);

There is no user of this outside. Drop.


> +
> +int wave6_vpu_ctrl_get_state(struct device *dev)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
> +
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	return ctrl->state;
> +}
> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_get_state);

There is no user of this outside. Drop.

Whatever export stays, must be used by a following patch. You *must* add
the kerneldoc for it.

> +
> +static void wave6_vpu_ctrl_init_reserved_boot_region(struct vpu_ctrl *ctrl)
> +{
> +	if (ctrl->boot_mem.size < WAVE6_CODE_BUF_SIZE) {
> +		dev_warn(ctrl->dev, "boot memory size (%zu) is too small\n", ctrl->boot_mem.size);
> +		ctrl->boot_mem.phys_addr = 0;
> +		ctrl->boot_mem.size = 0;
> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
> +		return;
> +	}
> +
> +	ctrl->boot_mem.vaddr = devm_memremap(ctrl->dev,
> +					     ctrl->boot_mem.phys_addr,
> +					     ctrl->boot_mem.size,
> +					     MEMREMAP_WC);
> +	if (!ctrl->boot_mem.vaddr) {
> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
> +		return;
> +	}
> +
> +	ctrl->boot_mem.dma_addr = dma_map_resource(ctrl->dev,
> +						   ctrl->boot_mem.phys_addr,
> +						   ctrl->boot_mem.size,
> +						   DMA_BIDIRECTIONAL,
> +						   0);
> +	if (!ctrl->boot_mem.dma_addr) {
> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
> +		return;
> +	}
> +
> +	dev_info(ctrl->dev, "boot phys_addr: %pad, dma_addr: %pad, size: 0x%zx\n",
> +		 &ctrl->boot_mem.phys_addr,
> +		 &ctrl->boot_mem.dma_addr,
> +		 ctrl->boot_mem.size);

No, drop. Reasoning further.

> +}
...

> +
> +	ctrl->num_clks = ret;
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "boot", 0);
> +	if (np) {
> +		struct resource mem;
> +
> +		ret = of_address_to_resource(np, 0, &mem);
> +		of_node_put(np);
> +		if (!ret) {
> +			ctrl->boot_mem.phys_addr = mem.start;
> +			ctrl->boot_mem.size = resource_size(&mem);
> +			wave6_vpu_ctrl_init_reserved_boot_region(ctrl);
> +		} else {
> +			dev_warn(&pdev->dev, "boot resource is not available.\n");
> +		}
> +	}
> +
> +	ctrl->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	if (ctrl->sram_pool) {
> +		ctrl->sram_buf.size = ctrl->res->sram_size;
> +		ctrl->sram_buf.vaddr = gen_pool_dma_alloc(ctrl->sram_pool,
> +							  ctrl->sram_buf.size,
> +							  &ctrl->sram_buf.phys_addr);
> +		if (!ctrl->sram_buf.vaddr)
> +			ctrl->sram_buf.size = 0;
> +		else
> +			ctrl->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
> +								   ctrl->sram_buf.phys_addr,
> +								   ctrl->sram_buf.size,
> +								   DMA_BIDIRECTIONAL,
> +								   0);
> +
> +		dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
> +			 &ctrl->sram_buf.phys_addr, &ctrl->sram_buf.dma_addr, ctrl->sram_buf.size);

You are not supposed to print addresses. This look like fixed hardware
mappings, so probably harmless but dma_addr not. Drop entire dev_info,
this is really discouraged practice.


> +	}
> +
> +	if (of_find_property(pdev->dev.of_node, "support-follower", NULL))
> +		ctrl->support_follower = true;
> +
> +	wave6_cooling_init(ctrl);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static void wave6_vpu_ctrl_remove(struct platform_device *pdev)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	wave6_vpu_ctrl_clear_buffers(ctrl);
> +	wave6_cooling_remove(ctrl);
> +	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
> +		dma_unmap_resource(&pdev->dev,
> +				   ctrl->sram_buf.dma_addr,
> +				   ctrl->sram_buf.size,
> +				   DMA_BIDIRECTIONAL,
> +				   0);
> +		gen_pool_free(ctrl->sram_pool,
> +			      (unsigned long)ctrl->sram_buf.vaddr,
> +			      ctrl->sram_buf.size);
> +	}
> +	if (ctrl->boot_mem.dma_addr)
> +		dma_unmap_resource(&pdev->dev,
> +				   ctrl->boot_mem.dma_addr,
> +				   ctrl->boot_mem.size,
> +				   DMA_BIDIRECTIONAL,
> +				   0);
> +	mutex_destroy(&ctrl->ctrl_lock);
> +}
> +
> +#ifdef CONFIG_PM
> +static int wave6_vpu_ctrl_runtime_suspend(struct device *dev)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(ctrl->num_clks, ctrl->clks);
> +	return 0;
> +}
> +
> +static int wave6_vpu_ctrl_runtime_resume(struct device *dev)
> +{
> +	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(ctrl->num_clks, ctrl->clks);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int wave6_vpu_ctrl_suspend(struct device *dev)
> +{
> +	return 0;

Why do you need empty callbacks?

Best regards,
Krzysztof

