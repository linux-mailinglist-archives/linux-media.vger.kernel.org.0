Return-Path: <linux-media+bounces-41352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA9B3C248
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 167B317CE71
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE38833472C;
	Fri, 29 Aug 2025 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H8S59Jpu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC73451A5;
	Fri, 29 Aug 2025 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756491195; cv=none; b=bOW9AKoXZwIQ7vEkekvf7FpxaW1a0qXAXDp4xFy/vJLGnbasIAu41haGHhJPERiuLRBDc76p2gIs5hgRR+fUOMqgDGiHDGkx9J+ej6tOO0sTD+kbJYzznRxTCJjYY0LsSPhBVtxH2vrNRhd1VXCedBN0T/9+5MGnmPf5lBgxcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756491195; c=relaxed/simple;
	bh=0bG+lj995fJnQVW3V0UapO0Q3pNVf/IGy5pigIWhuJY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AfKr9nDqiyAuDxiA3KN+xrkBFtR6Z9MNmER5pKg9Ek7LL2OVFbdfG7MkGFf8DArQatyFWhUAzzIm1JIBHGXK0TjDsXQfw8WXppOY7J8wXfv0P8fKVQi4Omilt6G7rEbuCUC6gXxQA0wEyvJFFTVDIdRrHMSEBAXB+oJ39RhPmmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H8S59Jpu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756491190;
	bh=0bG+lj995fJnQVW3V0UapO0Q3pNVf/IGy5pigIWhuJY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=H8S59Jpu4XqsbgZJIun8hRN1W1zsH1p6TC7XUI15I8Jj3JSEcCmLkdopm15R5HpGf
	 4HyWmHYDro67m9PmkmEjIijYdYS4i8aE33t7QV43FeyAHNKzy5akdTikGGLen0bSYW
	 pyvvCrctxsPT21i5frBJc+/FK0Hmr34IuGVL/wEv/qRrvNSLcAoS8TMarbKXyAfQaX
	 4HlzoxsdfV8i6UKwmi6KeqGLo113eJ0Sqi6qUdmwqh3F0E5gazTOResCdpkYD5NFZA
	 TkHrhcs7JOsbYghL8+Mmwc00xFD0uddf9aAbBnXVudkz8oGe7wjVKSl4kdKhHqePpI
	 LwL1EqOHXtyqw==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7D9617E04D6;
	Fri, 29 Aug 2025 20:13:09 +0200 (CEST)
Message-ID: <0c72bc346840152bcc414c37cfd9b5ca77ce069f.camel@collabora.com>
Subject: Re: [PATCH v3 2/4] media: chips-media: wave5: Fix Null reference
 while testing fluster
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 29 Aug 2025 14:13:08 -0400
In-Reply-To: <20250623002153.51-3-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <20250623002153.51-3-jackson.lee@chipsnmedia.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-C7ZmmrVWxwn5RKfIhSx8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-C7ZmmrVWxwn5RKfIhSx8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 09:21 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> When multi instances are created/destroyed, many interrupts happens
> or structures for decoder are removed.

Did you mean "and" instead of "or" ?

> "struct vpu_instance" this structure is shared for all flow in decoder,

* in the decoder

> so if the structure is not protected by lock, Null reference exception

Null dereference

> could happens sometimes.
> IRQ Handler was spilt to two phases and Lock was added as well.
>=20
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
> =C2=A0.../platform/chips-media/wave5/wave5-helper.c | 23 ++++++-
> =C2=A0.../chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
> =C2=A0.../platform/chips-media/wave5/wave5-vpu.c=C2=A0=C2=A0=C2=A0 | 69 +=
+++++++++++++++---
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.h |=C2=A0 6 ++
> =C2=A05 files changed, 99 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.c
> index 2c9d8cbca6e4..02914dc1ca56 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -49,7 +49,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
> =C2=A0		v4l2_fh_del(&inst->v4l2_fh);
> =C2=A0		v4l2_fh_exit(&inst->v4l2_fh);
> =C2=A0	}
> -	list_del_init(&inst->list);
> +	kfifo_free(&inst->irq_status);
> =C2=A0	ida_free(&inst->dev->inst_ida, inst->id);
> =C2=A0	kfree(inst->codec_info);
> =C2=A0	kfree(inst);
> @@ -61,8 +61,29 @@ int wave5_vpu_release_device(struct file *filp,
> =C2=A0{
> =C2=A0	struct vpu_instance *inst =3D wave5_to_vpu_inst(filp->private_data=
);
> =C2=A0	int ret =3D 0;
> +	unsigned long flags;
> =C2=A0
> =C2=A0	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +	/*
> +	 * To prevent Null reference exception, the existing irq handler were
> +	 * separated to two modules.
> +	 * One is to queue interrupt reason into the irq handler,
> +	 * the other is irq_thread to call the wave5_vpu_dec_finish_decode
> +	 * to get decoded frame.
> +	 * The list of instances should be protected between all flow of the
> +	 * decoding process, but to protect the list in the irq_handler, spin l=
ock
> +	 * should be used, and mutex should be used in the irq_thread because s=
pin lock
> +	 * is not able to be used because mutex is already being used
> +	 * in the wave5_vpu_dec_finish_decode.
> +	 * So the spin lock and mutex were used to protect the list in the rele=
ase function.
> +	 */
> +	ret =3D mutex_lock_interruptible(&inst->dev->irq_lock);
> +	if (ret)
> +		return ret;
> +	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
> +	list_del_init(&inst->list);
> +	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
> +	mutex_unlock(&inst->dev->irq_lock);
> =C2=A0	if (inst->state !=3D VPU_INST_STATE_NONE) {
> =C2=A0		u32 fail_res;
> =C2=A0
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 216b024c42d8..2df7668575f4 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1811,6 +1811,11 @@ static int wave5_vpu_open_dec(struct file *filp)
> =C2=A0	inst->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> =C2=A0
> =C2=A0	init_completion(&inst->irq_done);
> +	ret =3D kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> +		goto cleanup_inst;
> +	}
> =C2=A0
> =C2=A0	inst->id =3D ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
> =C2=A0	if (inst->id < 0) {
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index cf20f774ed1b..7f1aa392805f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
> =C2=A0	inst->frame_rate =3D 30;
> =C2=A0
> =C2=A0	init_completion(&inst->irq_done);
> +	ret =3D kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> +		goto cleanup_inst;
> +	}
> =C2=A0
> =C2=A0	inst->id =3D ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
> =C2=A0	if (inst->id < 0) {

Can you prepend a patch that deduplicates this initialization code, put thi=
s in
wave5-helper.c, this way you won't have to copy paste this fix. The
kfifo_alloc/free will also now be in the same C file.<

Question here, I've been wondering if the list is strictly required on real
hardware ? I often thought this complex machinary was made to support a rea=
lly
slow simulated CPU. But all this happened way before me being involved.

> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drive=
rs/media/platform/chips-media/wave5/wave5-vpu.c
> index b3c633dd3df1..24a9001966e7 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
> =C2=A0	u32 seq_done;
> =C2=A0	u32 cmd_done;
> =C2=A0	u32 irq_reason;
> -	struct vpu_instance *inst;
> +	u32 irq_subreason;
> +	struct vpu_instance *inst, *tmp;
> =C2=A0	struct vpu_device *dev =3D dev_id;
> +	int val;
> +	unsigned long flags;
> =C2=A0
> =C2=A0	irq_reason =3D wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> =C2=A0	seq_done =3D wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE=
_INFO);
> @@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
> =C2=A0	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
> =C2=A0	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
> =C2=A0
> -	list_for_each_entry(inst, &dev->instances, list) {
> +	spin_lock_irqsave(&dev->irq_spinlock, flags);
> +	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
> =C2=A0
> =C2=A0		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
> @@ -82,14 +86,22 @@ static void wave5_vpu_handle_irq(void *dev_id)
> =C2=A0		=C2=A0=C2=A0=C2=A0 irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
> =C2=A0			if (cmd_done & BIT(inst->id)) {
> =C2=A0				cmd_done &=3D ~BIT(inst->id);
> -				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
> -							 cmd_done);
> -				inst->ops->finish_process(inst);
> +				if (dev->irq >=3D 0) {
> +					irq_subreason =3D
> +						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> +					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
> +						wave5_vdi_write_register(dev,
> +									 W5_RET_QUEUE_CMD_DONE_INST,
> +									 cmd_done);
> +				}
> +				val =3D BIT(INT_WAVE5_DEC_PIC);
> +				kfifo_in(&inst->irq_status, &val, sizeof(int));
> =C2=A0			}
> =C2=A0		}
> -
> -		wave5_vpu_clear_interrupt(inst, irq_reason);
> =C2=A0	}
> +	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
> +
> +	up(&dev->irq_sem);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
> @@ -121,6 +133,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback=
(struct hrtimer *timer)
> =C2=A0	return HRTIMER_RESTART;
> =C2=A0}
> =C2=A0
> +static int irq_thread(void *data)

Have you considered using threaded IRQ instead ? Is that an option ? Otherw=
ise,
why not ?

cheers,
Nicolas

> +{
> +	struct vpu_device *dev =3D (struct vpu_device *)data;
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
> +				ret =3D kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
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
> =C2=A0static int wave5_vpu_load_firmware(struct device *dev, const char *=
fw_name,
> =C2=A0				=C2=A0=C2=A0 u32 *revision)
> =C2=A0{
> @@ -224,6 +265,8 @@ static int wave5_vpu_probe(struct platform_device *pd=
ev)
> =C2=A0
> =C2=A0	mutex_init(&dev->dev_lock);
> =C2=A0	mutex_init(&dev->hw_lock);
> +	mutex_init(&dev->irq_lock);
> +	spin_lock_init(&dev->irq_spinlock);
> =C2=A0	dev_set_drvdata(&pdev->dev, dev);
> =C2=A0	dev->dev =3D &pdev->dev;
> =C2=A0
> @@ -266,6 +309,10 @@ static int wave5_vpu_probe(struct platform_device *p=
dev)
> =C2=A0	}
> =C2=A0	dev->product =3D wave5_vpu_get_product_id(dev);
> =C2=A0
> +	sema_init(&dev->irq_sem, 1);
> +	INIT_LIST_HEAD(&dev->instances);
> +	dev->irq_thread =3D kthread_run(irq_thread, dev, "irq thread");
> +
> =C2=A0	dev->irq =3D platform_get_irq(pdev, 0);
> =C2=A0	if (dev->irq < 0) {
> =C2=A0		dev_err(&pdev->dev, "failed to get irq resource, falling back to =
polling\n");
> @@ -288,7 +335,6 @@ static int wave5_vpu_probe(struct platform_device *pd=
ev)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	INIT_LIST_HEAD(&dev->instances);
> =C2=A0	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
> @@ -351,6 +397,12 @@ static void wave5_vpu_remove(struct platform_device =
*pdev)
> =C2=A0{
> =C2=A0	struct vpu_device *dev =3D dev_get_drvdata(&pdev->dev);
> =C2=A0
> +	if (dev->irq_thread) {
> +		kthread_stop(dev->irq_thread);
> +		up(&dev->irq_sem);
> +		dev->irq_thread =3D NULL;
> +	}
> +
> =C2=A0	if (dev->irq < 0) {
> =C2=A0		kthread_destroy_worker(dev->worker);
> =C2=A0		hrtimer_cancel(&dev->hrtimer);
> @@ -361,6 +413,7 @@ static void wave5_vpu_remove(struct platform_device *=
pdev)
> =C2=A0
> =C2=A0	mutex_destroy(&dev->dev_lock);
> =C2=A0	mutex_destroy(&dev->hw_lock);
> +	mutex_destroy(&dev->irq_lock);
> =C2=A0	reset_control_assert(dev->resets);
> =C2=A0	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> =C2=A0	wave5_vpu_enc_unregister_device(dev);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index 45615c15beca..bc101397204d 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -8,6 +8,7 @@
> =C2=A0#ifndef VPUAPI_H_INCLUDED
> =C2=A0#define VPUAPI_H_INCLUDED
> =C2=A0
> +#include <linux/kfifo.h>
> =C2=A0#include <linux/idr.h>
> =C2=A0#include <linux/genalloc.h>
> =C2=A0#include <media/v4l2-device.h>
> @@ -747,6 +748,7 @@ struct vpu_device {
> =C2=A0	struct video_device *video_dev_enc;
> =C2=A0	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
> =C2=A0	struct mutex hw_lock; /* lock hw configurations */
> +	struct mutex irq_lock;
> =C2=A0	int irq;
> =C2=A0	enum product_id product;
> =C2=A0	struct vpu_attr attr;
> @@ -764,7 +766,10 @@ struct vpu_device {
> =C2=A0	struct kthread_worker *worker;
> =C2=A0	int vpu_poll_interval;
> =C2=A0	int num_clks;
> +	struct task_struct *irq_thread;
> +	struct semaphore irq_sem; /* signal to irq_thread when interrupt happen=
s*/
> =C2=A0	struct reset_control *resets;
> +	spinlock_t irq_spinlock; /* protect instances list */
> =C2=A0};
> =C2=A0
> =C2=A0struct vpu_instance;
> @@ -788,6 +793,7 @@ struct vpu_instance {
> =C2=A0	enum v4l2_ycbcr_encoding ycbcr_enc;
> =C2=A0	enum v4l2_quantization quantization;
> =C2=A0
> +	struct kfifo irq_status;
> =C2=A0	enum vpu_instance_state state;
> =C2=A0	enum vpu_instance_type type;
> =C2=A0	const struct vpu_instance_ops *ops;

--=-C7ZmmrVWxwn5RKfIhSx8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLHttAAKCRDZQZRRKWBy
9A4PAQDt6/cl2087qPezd7igpAoAUiItm9hOn7wfmXEButF62gD/akQP2jNSBKJY
5M5cOgXyfi3xMa2Ow0hlSFLscX4TnQQ=
=DBiz
-----END PGP SIGNATURE-----

--=-C7ZmmrVWxwn5RKfIhSx8--

