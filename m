Return-Path: <linux-media+bounces-33457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9BDAC4EFD
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE3F16372C
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 12:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE60A26B0B6;
	Tue, 27 May 2025 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QpIE7PKA"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517E26A0FF;
	Tue, 27 May 2025 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350647; cv=none; b=qrGKAvqfrl0/F85Q26sHuXwxs5y+e24Rc0MvpCUw2xPLFGk5emqlhPYJaEYvQiPXgoINZGGq7Xywl43UEbEM+MNoOMrwgVFxK6N7z2Y/4F0KgNbgv2fIXAmyeGbOzCrA89iwVVbl2thnneB7dOBOwsiHCQfj8UhhtVoFztqhcHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350647; c=relaxed/simple;
	bh=A0EiZr3nFw8kQJWhh9gZbtgrJuyB6pBp8rf9GHbmv6E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mtTXEVa/iyoi/mygaFWC7/SYPWhqKUPS60TtbTonR/i38s4kVdU9IvmpWzNjQSc/3cuIXuqZrT4Th14DXMVJrEceAzCuy38626GFlmZYIqnGCkBJOyY0SKouHJNVpVcVdS1ylP3Pw6N3vcN6FAvRUQq5Zg+WmCt1ycdIOJXEVUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QpIE7PKA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748350642;
	bh=A0EiZr3nFw8kQJWhh9gZbtgrJuyB6pBp8rf9GHbmv6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QpIE7PKAtQZi8T28EoOcVE8AmkMPE0Vl2FX81AtgeXAXDIkCfUSXTDMg4J2Qa5ALJ
	 Wj9SHAvfqqHnB8RIlVvqbdM85x6TlcE/G44hz3QkPv6DOCNxbMFQoFchu24XVKRqlb
	 kxRWLOI70S7upRDXYXZayhlXkG8aZHxHTZzjdHY++2FW+YMyaPanvDR9eecWfYG+Qv
	 IATulMCbZa9JVuFCKj/xzf9jvYiae4FNhl6P/aFjU4/TT1GQSe+qbMEGGnKPtb3cZd
	 dbYH2iRooDFlXKwTW/BXoMj/RT4U5LF9kcslAHXp/CKUH0VbpOTDKD9v+uowSkIdYq
	 JHj15Q5fzgw1w==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B515E17E1509;
	Tue, 27 May 2025 14:57:20 +0200 (CEST)
Message-ID: <bc129d87b5e6b42a330f83b2b02e43f98cf0e0f7.camel@collabora.com>
Subject: Re: [PATCH v2 1/7] media: chips-media: wave5: Fix Null reference
 while testing fluster
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "sebastian.fricke@collabora.com"	
 <sebastian.fricke@collabora.com>, "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>, "dafna.hirschfeld@collabora.com"	
 <dafna.hirschfeld@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Tue, 27 May 2025 08:57:19 -0400
In-Reply-To: <SE1P216MB1303FB37E655EA32249E0A03ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
		 <20250522072606.51-2-jackson.lee@chipsnmedia.com>
	 <3c51d1d6503354e75ea620e30758649547db5374.camel@collabora.com>
	 <SE1P216MB1303FB37E655EA32249E0A03ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le mardi 27 mai 2025 à 04:05 +0000, jackson.lee a écrit :
> Hi Nicolas
> 
> 
> > -----Original Message-----
> > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Sent: Saturday, May 24, 2025 2:20 AM
> > To: jackson.lee <jackson.lee@chipsnmedia.com>; mchehab@kernel.org;
> > hverkuil-cisco@xs4all.nl; sebastian.fricke@collabora.com;
> > bob.beckett@collabora.com; dafna.hirschfeld@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; lafley.kim
> > <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; hverkuil@xs4all.nl; Nas
> > Chung <nas.chung@chipsnmedia.com>
> > Subject: Re: [PATCH v2 1/7] media: chips-media: wave5: Fix Null reference
> > while testing fluster
> > 
> > Hi,
> > 
> > Le jeudi 22 mai 2025 à 16:26 +0900, Jackson.lee a écrit :
> > > From: Jackson Lee <jackson.lee@chipsnmedia.com>
> > > 
> > > When multi instances are created/destroyed, many interrupts happens or
> > > structures for decoder are removed.
> > > "struct vpu_instance" this structure is shared for all flow in
> > > decoder, so if the structure is not protected by lock, Null reference
> > > exception could happens sometimes.
> > > IRQ Handler was spilt to two phases and Lock was added as well.
> > > 
> > > Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> > > Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> > > Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> > > ---
> > >  .../platform/chips-media/wave5/wave5-helper.c | 10 ++-
> > >  .../chips-media/wave5/wave5-vpu-dec.c         |  5 ++
> > >  .../chips-media/wave5/wave5-vpu-enc.c         |  5 ++
> > >  .../platform/chips-media/wave5/wave5-vpu.c    | 69
> > > ++++++++++++++++---
> > >  .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
> > >  5 files changed, 86 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > b/drivers/media/platform/chips-media/wave5/wave5-
> > > helper.c
> > > index 2c9d8cbca6e4..5d9969bb7ada 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > @@ -49,7 +49,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
> > >  		v4l2_fh_del(&inst->v4l2_fh);
> > >  		v4l2_fh_exit(&inst->v4l2_fh);
> > >  	}
> > > -	list_del_init(&inst->list);
> > > +	kfifo_free(&inst->irq_status);
> > >  	ida_free(&inst->dev->inst_ida, inst->id);
> > >  	kfree(inst->codec_info);
> > >  	kfree(inst);
> > > @@ -61,8 +61,16 @@ int wave5_vpu_release_device(struct file *filp,
> > >  {
> > >  	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
> > >  	int ret = 0;
> > > +	unsigned long flags;
> > > 
> > >  	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> > > +	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
> > > +	if (ret)
> > > +		return ret;
> > 
> > This is quite some heavy locking, why do you need both the mutex and the
> > spinlock ?
> 
> 
> To prevent Null reference exception, the existing irq handler were separated to two modules
> One is to queue interrupt reason in the irq hander, the other is to call  the wave5_vpu_dec_finish_decode to get
> decoded frame.
> The list of instances should be protected between all flow of the decoding process, but to protect the list in the
> irq_handler, spin lock should be used, and 
> mutex should be used in the irq_thread because spin lock is not able to be used because mutex is being used in the
> wave5_vpu_dec_finish_decode.
> So to protect the list in the release function, spin lock and mutex were used.

I don't have a better solution without massively refactoring this driver,
so I'd say its fine. But all this explanation should be found in the code
as comment as its not obvious and quite easy to break.

regards,
Nicolas

> 
> 
> 
> > 
> > > +	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
> > > +	list_del_init(&inst->list);
> > > +	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
> > > +	mutex_unlock(&inst->dev->irq_lock);
> > >  	if (inst->state != VPU_INST_STATE_NONE) {
> > >  		u32 fail_res;
> > > 
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > b/drivers/media/platform/chips- media/wave5/wave5-vpu-dec.c index
> > > fd71f0c43ac3..32de43de1870 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > @@ -1811,6 +1811,11 @@ static int wave5_vpu_open_dec(struct file *filp)
> > >  	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > > 
> > >  	init_completion(&inst->irq_done);
> > > +	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> > > +	if (ret) {
> > > +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> > > +		goto cleanup_inst;
> > > +	}
> > > 
> > >  	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
> > >  	if (inst->id < 0) {
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > b/drivers/media/platform/chips- media/wave5/wave5-vpu-enc.c index
> > > 1e5fc5f8b856..52a1a00fd9bb 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > @@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
> > >  	inst->frame_rate = 30;
> > > 
> > >  	init_completion(&inst->irq_done);
> > > +	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> > > +	if (ret) {
> > > +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> > > +		goto cleanup_inst;
> > > +	}
> > > 
> > >  	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
> > >  	if (inst->id < 0) {
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > b/drivers/media/platform/chips-media/wave5/wave5-
> > > vpu.c
> > > index e1715d3f43b0..a2c09523d76b 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > @@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
> > >  	u32 seq_done;
> > >  	u32 cmd_done;
> > >  	u32 irq_reason;
> > > -	struct vpu_instance *inst;
> > > +	u32 irq_subreason;
> > > +	struct vpu_instance *inst, *tmp;
> > >  	struct vpu_device *dev = dev_id;
> > > +	int val;
> > > +	unsigned long flags;
> > > 
> > >  	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> > >  	seq_done = wave5_vdi_read_register(dev,
> > > W5_RET_SEQ_DONE_INSTANCE_INFO); @@ -60,7 +63,8 @@ static void
> > wave5_vpu_handle_irq(void *dev_id)
> > >  	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
> > >  	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
> > > 
> > > -	list_for_each_entry(inst, &dev->instances, list) {
> > > +	spin_lock_irqsave(&dev->irq_spinlock, flags);
> > > +	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
> > > 
> > >  		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
> > >  		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) { @@ -82,14
> > +86,22
> > > @@ static void wave5_vpu_handle_irq(void *dev_id)
> > >  		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
> > >  			if (cmd_done & BIT(inst->id)) {
> > >  				cmd_done &= ~BIT(inst->id);
> > > -				wave5_vdi_write_register(dev,
> > W5_RET_QUEUE_CMD_DONE_INST,
> > > -							 cmd_done);
> > > -				inst->ops->finish_process(inst);
> > > +				if (dev->irq >= 0) {
> > > +					irq_subreason =
> > > +						wave5_vdi_read_register(dev,
> > W5_VPU_VINT_REASON);
> > > +					if (!(irq_subreason &
> > BIT(INT_WAVE5_DEC_PIC)))
> > > +						wave5_vdi_write_register(dev,
> > > +
> > W5_RET_QUEUE_CMD_DONE_INST,
> > > +									 cmd_done);
> > > +				}
> > > +				val = BIT(INT_WAVE5_DEC_PIC);
> > > +				kfifo_in(&inst->irq_status, &val, sizeof(int));
> > >  			}
> > >  		}
> > > -
> > > -		wave5_vpu_clear_interrupt(inst, irq_reason);
> > >  	}
> > > +	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
> > > +
> > > +	up(&dev->irq_sem);
> > >  }
> > > 
> > >  static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id) @@
> > > -121,6 +133,35 @@ static enum hrtimer_restart
> > wave5_vpu_timer_callback(struct hrtimer *timer)
> > >  	return HRTIMER_RESTART;
> > >  }
> > > 
> > > +static int irq_thread(void *data)
> > > +{
> > > +	struct vpu_device *dev = (struct vpu_device *)data;
> > > +	struct vpu_instance *inst, *tmp;
> > > +	int irq_status, ret;
> > > +
> > > +	while (!kthread_should_stop()) {
> > > +		if (down_interruptible(&dev->irq_sem))
> > > +			continue;
> > > +
> > > +		if (kthread_should_stop())
> > > +			break;
> > > +
> > > +		mutex_lock(&dev->irq_lock);
> > > +		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
> > > +			while (kfifo_len(&inst->irq_status)) {
> > > +				ret = kfifo_out(&inst->irq_status, &irq_status,
> > sizeof(int));
> > > +				if (!ret)
> > > +					break;
> > > +
> > > +				inst->ops->finish_process(inst);
> > > +			}
> > > +		}
> > > +		mutex_unlock(&dev->irq_lock);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int wave5_vpu_load_firmware(struct device *dev, const char
> > *fw_name,
> > >  				   u32 *revision)
> > >  {
> > > @@ -224,6 +265,8 @@ static int wave5_vpu_probe(struct platform_device
> > > *pdev)
> > > 
> > >  	mutex_init(&dev->dev_lock);
> > >  	mutex_init(&dev->hw_lock);
> > > +	mutex_init(&dev->irq_lock);
> > > +	spin_lock_init(&dev->irq_spinlock);
> > >  	dev_set_drvdata(&pdev->dev, dev);
> > >  	dev->dev = &pdev->dev;
> > > 
> > > @@ -266,6 +309,10 @@ static int wave5_vpu_probe(struct platform_device
> > *pdev)
> > >  	}
> > >  	dev->product = wave5_vpu_get_product_id(dev);
> > > 
> > > +	sema_init(&dev->irq_sem, 1);
> > > +	INIT_LIST_HEAD(&dev->instances);
> > > +	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
> > > +
> > >  	dev->irq = platform_get_irq(pdev, 0);
> > >  	if (dev->irq < 0) {
> > >  		dev_err(&pdev->dev, "failed to get irq resource, falling
> > back to
> > > polling\n"); @@ -288,7 +335,6 @@ static int wave5_vpu_probe(struct
> > platform_device *pdev)
> > >  		}
> > >  	}
> > > 
> > > -	INIT_LIST_HEAD(&dev->instances);
> > >  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > >  	if (ret) {
> > >  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
> > @@
> > > -351,6 +397,12 @@ static void wave5_vpu_remove(struct platform_device
> > > *pdev)
> > >  {
> > >  	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
> > > 
> > > +	if (dev->irq_thread) {
> > > +		kthread_stop(dev->irq_thread);
> > > +		up(&dev->irq_sem);
> > > +		dev->irq_thread = NULL;
> > > +	}
> > > +
> > >  	if (dev->irq < 0) {
> > >  		kthread_destroy_worker(dev->worker);
> > >  		hrtimer_cancel(&dev->hrtimer);
> > > @@ -361,6 +413,7 @@ static void wave5_vpu_remove(struct
> > > platform_device *pdev)
> > > 
> > >  	mutex_destroy(&dev->dev_lock);
> > >  	mutex_destroy(&dev->hw_lock);
> > > +	mutex_destroy(&dev->irq_lock);
> > >  	reset_control_assert(dev->resets);
> > >  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> > >  	wave5_vpu_enc_unregister_device(dev);
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > b/drivers/media/platform/chips-media/wave5/wave5-
> > > vpuapi.h
> > > index 45615c15beca..f3c1ad6fb3be 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > @@ -8,6 +8,7 @@
> > >  #ifndef VPUAPI_H_INCLUDED
> > >  #define VPUAPI_H_INCLUDED
> > > 
> > > +#include <linux/kfifo.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/genalloc.h>
> > >  #include <media/v4l2-device.h>
> > > @@ -747,6 +748,7 @@ struct vpu_device {
> > >  	struct video_device *video_dev_enc;
> > >  	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
> > >  	struct mutex hw_lock; /* lock hw configurations */
> > > +	struct mutex irq_lock;
> > >  	int irq;
> > >  	enum product_id product;
> > >  	struct vpu_attr attr;
> > > @@ -764,7 +766,10 @@ struct vpu_device {
> > >  	struct kthread_worker *worker;
> > >  	int vpu_poll_interval;
> > >  	int num_clks;
> > > +	struct task_struct *irq_thread;
> > > +	struct semaphore irq_sem;
> > 
> > Can you comment on what they actually protect ?
> 
> Okay
> 
> > 
> > >  	struct reset_control *resets;
> > > +	spinlock_t irq_spinlock; /* protect instances list */
> > >  };
> > > 
> > >  struct vpu_instance;
> > > @@ -788,6 +793,7 @@ struct vpu_instance {
> > >  	enum v4l2_ycbcr_encoding ycbcr_enc;
> > >  	enum v4l2_quantization quantization;
> > > 
> > > +	struct kfifo irq_status;
> > >  	enum vpu_instance_state state;
> > >  	enum vpu_instance_type type;
> > >  	const struct vpu_instance_ops *ops;

