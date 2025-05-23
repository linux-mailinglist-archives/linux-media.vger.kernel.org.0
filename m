Return-Path: <linux-media+bounces-33284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB860AC286F
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA04E1B66B79
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8CA298262;
	Fri, 23 May 2025 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QVon2Plm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27BE2980B6;
	Fri, 23 May 2025 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020836; cv=none; b=BZyKlA3BksHOlyMoQg4nZnVSf1h754v6qc68uVy4Vx7eesqNSdD1WEsLNHyBVg42kRlvbvGqZwFmyBIwTHCXBrmGbFhqTibHqYGewFMEZgYxp0+OO5we/EddUx3UUJmCXgwXGBQuOZE/wO5RxSj7eiPGGPUBZNhEOcxj5Ur790A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020836; c=relaxed/simple;
	bh=5Cf734hkQ03C797pwsDu1Em6cex4eWIpbOSQ8YG1sr4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RvJJjHCIPnB1r/6JYDvJ9E4fm6j74x9pBDjahxda1vrszolz/nlSQQK1pNJCYrMM+yt7K4UBRHUcLP4c1JnAT8OWEKtNNceh35GqgZAuXjoKNKkI8nRN/FZCPqTP6mUPvNwF5Z2rFCB4Je9YrBD6DwyrvZ3x4IboIuaNo0IQEzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QVon2Plm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748020826;
	bh=5Cf734hkQ03C797pwsDu1Em6cex4eWIpbOSQ8YG1sr4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QVon2PlmpNl96OmP1GHRm4tri2xMB3SiHdLzfJxhXa3vFRRZGufF3dKtGV9SHr5qJ
	 BibqfdSqYF9kFmBaofxfpeFpKrXDot6eDpsXupo+zXlEFlASHuShExBU9tuJSbNNtQ
	 L8PP6Ph7vPPKXkkW6IC0KXGtmXEkXdwM3nkhEL7zu651dUjPR8kRIjD1mX0y0o88VN
	 VPo/6hwiLKwmVI0Zik9FGZq3NSgR3L1Jnk5U3avdm3o6Cm7/uwz2PrmE9qRjF9dalo
	 0nWFVLwBWkAl1BjoH3qHjUCnqPThIdKabN/S8GELUaInx+HxVb5+XUW+efeF0dO5L7
	 EUF2gVQpzGsIQ==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C95FD17E1045;
	Fri, 23 May 2025 19:20:24 +0200 (CEST)
Message-ID: <3c51d1d6503354e75ea620e30758649547db5374.camel@collabora.com>
Subject: Re: [PATCH v2 1/7] media: chips-media: wave5: Fix Null reference
 while testing fluster
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 23 May 2025 13:20:22 -0400
In-Reply-To: <20250522072606.51-2-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-2-jackson.lee@chipsnmedia.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le jeudi 22 mai 2025 à 16:26 +0900, Jackson.lee a écrit :
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> When multi instances are created/destroyed, many interrupts happens
> or structures for decoder are removed.
> "struct vpu_instance" this structure is shared for all flow in decoder,
> so if the structure is not protected by lock, Null reference exception
> could happens sometimes.
> IRQ Handler was spilt to two phases and Lock was added as well.
> 
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave5/wave5-helper.c | 10 ++-
>  .../chips-media/wave5/wave5-vpu-dec.c         |  5 ++
>  .../chips-media/wave5/wave5-vpu-enc.c         |  5 ++
>  .../platform/chips-media/wave5/wave5-vpu.c    | 69 ++++++++++++++++---
>  .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
>  5 files changed, 86 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-
> helper.c
> index 2c9d8cbca6e4..5d9969bb7ada 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -49,7 +49,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
>  		v4l2_fh_del(&inst->v4l2_fh);
>  		v4l2_fh_exit(&inst->v4l2_fh);
>  	}
> -	list_del_init(&inst->list);
> +	kfifo_free(&inst->irq_status);
>  	ida_free(&inst->dev->inst_ida, inst->id);
>  	kfree(inst->codec_info);
>  	kfree(inst);
> @@ -61,8 +61,16 @@ int wave5_vpu_release_device(struct file *filp,
>  {
>  	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
>  	int ret = 0;
> +	unsigned long flags;
>  
>  	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
> +	if (ret)
> +		return ret;

This is quite some heavy locking, why do you need both the mutex and
the spinlock ?

> +	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
> +	list_del_init(&inst->list);
> +	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
> +	mutex_unlock(&inst->dev->irq_lock);
>  	if (inst->state != VPU_INST_STATE_NONE) {
>  		u32 fail_res;
>  
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-dec.c
> index fd71f0c43ac3..32de43de1870 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1811,6 +1811,11 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>  
>  	init_completion(&inst->irq_done);
> +	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> +		goto cleanup_inst;
> +	}
>  
>  	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
>  	if (inst->id < 0) {
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-enc.c
> index 1e5fc5f8b856..52a1a00fd9bb 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	inst->frame_rate = 30;
>  
>  	init_completion(&inst->irq_done);
> +	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> +		goto cleanup_inst;
> +	}
>  
>  	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
>  	if (inst->id < 0) {
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-
> vpu.c
> index e1715d3f43b0..a2c09523d76b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
>  	u32 seq_done;
>  	u32 cmd_done;
>  	u32 irq_reason;
> -	struct vpu_instance *inst;
> +	u32 irq_subreason;
> +	struct vpu_instance *inst, *tmp;
>  	struct vpu_device *dev = dev_id;
> +	int val;
> +	unsigned long flags;
>  
>  	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
>  	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
> @@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
>  	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
>  	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
>  
> -	list_for_each_entry(inst, &dev->instances, list) {
> +	spin_lock_irqsave(&dev->irq_spinlock, flags);
> +	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
>  
>  		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
>  		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
> @@ -82,14 +86,22 @@ static void wave5_vpu_handle_irq(void *dev_id)
>  		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
>  			if (cmd_done & BIT(inst->id)) {
>  				cmd_done &= ~BIT(inst->id);
> -				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
> -							 cmd_done);
> -				inst->ops->finish_process(inst);
> +				if (dev->irq >= 0) {
> +					irq_subreason =
> +						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> +					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
> +						wave5_vdi_write_register(dev,
> +									 W5_RET_QUEUE_CMD_DONE_INST,
> +									 cmd_done);
> +				}
> +				val = BIT(INT_WAVE5_DEC_PIC);
> +				kfifo_in(&inst->irq_status, &val, sizeof(int));
>  			}
>  		}
> -
> -		wave5_vpu_clear_interrupt(inst, irq_reason);
>  	}
> +	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
> +
> +	up(&dev->irq_sem);
>  }
>  
>  static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
> @@ -121,6 +133,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
>  	return HRTIMER_RESTART;
>  }
>  
> +static int irq_thread(void *data)
> +{
> +	struct vpu_device *dev = (struct vpu_device *)data;
> +	struct vpu_instance *inst, *tmp;
> +	int irq_status, ret;
> +
> +	while (!kthread_should_stop()) {
> +		if (down_interruptible(&dev->irq_sem))
> +			continue;
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		mutex_lock(&dev->irq_lock);
> +		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
> +			while (kfifo_len(&inst->irq_status)) {
> +				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
> +				if (!ret)
> +					break;
> +
> +				inst->ops->finish_process(inst);
> +			}
> +		}
> +		mutex_unlock(&dev->irq_lock);
> +	}
> +
> +	return 0;
> +}
> +
>  static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
>  				   u32 *revision)
>  {
> @@ -224,6 +265,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  
>  	mutex_init(&dev->dev_lock);
>  	mutex_init(&dev->hw_lock);
> +	mutex_init(&dev->irq_lock);
> +	spin_lock_init(&dev->irq_spinlock);
>  	dev_set_drvdata(&pdev->dev, dev);
>  	dev->dev = &pdev->dev;
>  
> @@ -266,6 +309,10 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  	}
>  	dev->product = wave5_vpu_get_product_id(dev);
>  
> +	sema_init(&dev->irq_sem, 1);
> +	INIT_LIST_HEAD(&dev->instances);
> +	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
> +
>  	dev->irq = platform_get_irq(pdev, 0);
>  	if (dev->irq < 0) {
>  		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
> @@ -288,7 +335,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	INIT_LIST_HEAD(&dev->instances);
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
> @@ -351,6 +397,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
>  {
>  	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
>  
> +	if (dev->irq_thread) {
> +		kthread_stop(dev->irq_thread);
> +		up(&dev->irq_sem);
> +		dev->irq_thread = NULL;
> +	}
> +
>  	if (dev->irq < 0) {
>  		kthread_destroy_worker(dev->worker);
>  		hrtimer_cancel(&dev->hrtimer);
> @@ -361,6 +413,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->dev_lock);
>  	mutex_destroy(&dev->hw_lock);
> +	mutex_destroy(&dev->irq_lock);
>  	reset_control_assert(dev->resets);
>  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
>  	wave5_vpu_enc_unregister_device(dev);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-
> vpuapi.h
> index 45615c15beca..f3c1ad6fb3be 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -8,6 +8,7 @@
>  #ifndef VPUAPI_H_INCLUDED
>  #define VPUAPI_H_INCLUDED
>  
> +#include <linux/kfifo.h>
>  #include <linux/idr.h>
>  #include <linux/genalloc.h>
>  #include <media/v4l2-device.h>
> @@ -747,6 +748,7 @@ struct vpu_device {
>  	struct video_device *video_dev_enc;
>  	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
>  	struct mutex hw_lock; /* lock hw configurations */
> +	struct mutex irq_lock;
>  	int irq;
>  	enum product_id product;
>  	struct vpu_attr attr;
> @@ -764,7 +766,10 @@ struct vpu_device {
>  	struct kthread_worker *worker;
>  	int vpu_poll_interval;
>  	int num_clks;
> +	struct task_struct *irq_thread;
> +	struct semaphore irq_sem;

Can you comment on what they actually protect ?

>  	struct reset_control *resets;
> +	spinlock_t irq_spinlock; /* protect instances list */
>  };
>  
>  struct vpu_instance;
> @@ -788,6 +793,7 @@ struct vpu_instance {
>  	enum v4l2_ycbcr_encoding ycbcr_enc;
>  	enum v4l2_quantization quantization;
>  
> +	struct kfifo irq_status;
>  	enum vpu_instance_state state;
>  	enum vpu_instance_type type;
>  	const struct vpu_instance_ops *ops;

