Return-Path: <linux-media+bounces-33289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385CAC290E
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A41957B94D0
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E046299A9A;
	Fri, 23 May 2025 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="euXxLVh4"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8EB298997;
	Fri, 23 May 2025 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022487; cv=none; b=F+UFSmD+uBEl4O1rvQhMeeGezizYRS0IjETyMixO504e3oh//aNkyC5N85p4ioYQBm6+LhL1WXXMYYuaHG1P6V+drlC6QrTlPXBOxEAbvs1rwJws0NEErW+kn5SEVO7ajDkGLvTFcF1j7xmNvfYolUcapwJfrl/1V2aKjKh+QtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022487; c=relaxed/simple;
	bh=Zla4eSAtyF5aQ3YrcAlzvxeTrpOdPZl2dsWyeEwuh5Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QNIF0qN/gSaoUWRh9WKHLSnOR7D3qTT5ZWuIck+X09obHX/kTHdhkGDCJXqBkDBjn7ZcmjqRYk28481BBapjYuGj/CZM1xkuI16fdJ3zqlRuRV7hRZ83Fd6gs3GPEBDe+kBtFdQePHNrL92NX4wi3ZL4/FDektDFTyLqJtD4qcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=euXxLVh4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748022482;
	bh=Zla4eSAtyF5aQ3YrcAlzvxeTrpOdPZl2dsWyeEwuh5Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=euXxLVh49w9rNZx0rVL5iRUQk39c5woIrQClkF10LRgPYvtnB7EBOhIICD3fGsNUT
	 QWmMM9uLwiKoRWdtXuambFSNqTgG93ZUv0YY5Jr2D7pwVH5dkXtqzF5N+anvNvcu5i
	 ei6fbDHadbF5WR/n+4o+g/uqZDutfL06C4+B/ZmMv27ZMwNDzSt90pI/VvvJkInzjX
	 YCNq4Ha8zMsTURLbFatzHvjQyneEH1uKjjPvPfUWIa120H5Ndn5d0NYbfHJtr+YAeQ
	 xO1Nf2OI8YjOjjbNnovFO68zw06GeyJhC8sm0wO6Ckk0NfD//CLESSxhcYM3pHQED2
	 wHMpuu0enAOdQ==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73CB317E0202;
	Fri, 23 May 2025 19:48:01 +0200 (CEST)
Message-ID: <932fcabd9e5f2188ec1e779b330ff694e6f161b4.camel@collabora.com>
Subject: Re: [PATCH v2 7/7] media: chips-media: wave5: Fix SError of kernel
 panic when closed
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 23 May 2025 13:48:00 -0400
In-Reply-To: <20250522072606.51-8-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-8-jackson.lee@chipsnmedia.com>
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
> Since applying "Reduce high CPU load" patch, SError of kernel panic rarely
> happened while testing fluster.
> The root cause was to enter suspend mode because timeout of autosuspend
> delay happened.

This would need to be done ahead of other patches, before it breaks. Toggling
auto-suspend seems suspicious. I'm pretty sure this was always a bit fishy, so
I'm fine with removing that. Normally get/put once everything is configured
should be fine.

> 
> [   48.834439] SError Interrupt on CPU0, code 0x00000000bf000000 -- SError
> [   48.834455] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
> [   48.834461] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-
> gbaf3aaa8ecfa 01/01/2025
> [   48.834464] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   48.834468] pc : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
> [   48.834488] lr : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
> [   48.834495] sp : ffff8000856e3a30
> [   48.834497] x29: ffff8000856e3a30 x28: ffff0008093f6010 x27: ffff000809158130
> [   48.834504] x26: 0000000000000000 x25: ffff00080b625000 x24: ffff000804a9ba80
> [   48.834509] x23: ffff000802343028 x22: ffff000809158150 x21: ffff000802218000
> [   48.834513] x20: ffff0008093f6000 x19: ffff0008093f6000 x18: 0000000000000000
> [   48.834518] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff74009618
> [   48.834523] x14: 000000010000000c x13: 0000000000000000 x12: 0000000000000000
> [   48.834527] x11: ffffffffffffffff x10: ffffffffffffffff x9 : ffff000802343028
> [   48.834532] x8 : ffff00080b6252a0 x7 : 0000000000000038 x6 : 0000000000000000
> [   48.834536] x5 : ffff00080b625060 x4 : 0000000000000000 x3 : 0000000000000000
> [   48.834541] x2 : 0000000000000000 x1 : ffff800084bf0118 x0 : ffff800084bf0000
> [   48.834547] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   48.834549] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7

Hopefully you also test on mainline.

Nicolas

> [   48.834554] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-
> gbaf3aaa8ecfa 01/01/2025
> [   48.834556] Call trace:
> [   48.834559]  dump_backtrace+0x94/0xec
> [   48.834574]  show_stack+0x18/0x24
> [   48.834579]  dump_stack_lvl+0x38/0x90
> [   48.834585]  dump_stack+0x18/0x24
> [   48.834588]  panic+0x35c/0x3e0
> [   48.834592]  nmi_panic+0x40/0x8c
> [   48.834595]  arm64_serror_panic+0x64/0x70
> [   48.834598]  do_serror+0x3c/0x78
> [   48.834601]  el1h_64_error_handler+0x34/0x4c
> [   48.834605]  el1h_64_error+0x64/0x68
> [   48.834608]  wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
> [   48.834615]  wave5_vpu_dec_clr_disp_flag+0x54/0x80 [wave5]
> [   48.834622]  wave5_vpu_dec_buf_queue+0x19c/0x1a0 [wave5]
> [   48.834628]  __enqueue_in_driver+0x3c/0x74 [videobuf2_common]
> [   48.834639]  vb2_core_qbuf+0x508/0x61c [videobuf2_common]
> [   48.834646]  vb2_qbuf+0xa4/0x168 [videobuf2_v4l2]
> [   48.834656]  v4l2_m2m_qbuf+0x80/0x238 [v4l2_mem2mem]
> [   48.834666]  v4l2_m2m_ioctl_qbuf+0x18/0x24 [v4l2_mem2mem]
> [   48.834673]  v4l_qbuf+0x48/0x5c [videodev]
> [   48.834704]  __video_do_ioctl+0x180/0x3f0 [videodev]
> [   48.834725]  video_usercopy+0x2ec/0x68c [videodev]
> [   48.834745]  video_ioctl2+0x18/0x24 [videodev]
> [   48.834766]  v4l2_ioctl+0x40/0x60 [videodev]
> [   48.834786]  __arm64_sys_ioctl+0xa8/0xec
> [   48.834793]  invoke_syscall+0x44/0x100
> [   48.834800]  el0_svc_common.constprop.0+0xc0/0xe0
> [   48.834804]  do_el0_svc+0x1c/0x28
> [   48.834809]  el0_svc+0x30/0xd0
> [   48.834813]  el0t_64_sync_handler+0xc0/0xc4
> [   48.834816]  el0t_64_sync+0x190/0x194
> [   48.834820] SMP: stopping secondary CPUs
> [   48.834831] Kernel Offset: disabled
> [   48.834833] CPU features: 0x08,00002002,80200000,4200421b
> [   48.834837] Memory Limit: none
> [   49.161404] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave5/wave5-vpu-dec.c   |  3 ---
>  .../platform/chips-media/wave5/wave5-vpu-enc.c   |  3 ---
>  .../media/platform/chips-media/wave5/wave5-vpu.c |  2 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.c    | 16 ----------------
>  4 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-dec.c
> index 421a9e1a6f15..b4b522d7fa84 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1865,9 +1865,6 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
>  
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
>  	list_add_tail(&inst->list, &dev->instances);
>  
>  	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-enc.c
> index 52a1a00fd9bb..7f1aa392805f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1779,9 +1779,6 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
>  
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
>  	list_add_tail(&inst->list, &dev->instances);
>  
>  	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-
> vpu.c
> index a2c09523d76b..24a9001966e7 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -368,7 +368,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
>  	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
>  
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-
> vpuapi.c
> index d7318d596b73..1f7f4d214b3c 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	int retry = 0;
>  	struct vpu_device *vpu_dev = inst->dev;
>  	int i;
> -	int inst_count = 0;
> -	struct vpu_instance *inst_elm;
>  	struct dec_output_info dec_info;
>  
>  	*fail_res = 0;
> @@ -265,12 +263,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	}
>  
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> -
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count == 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -
>  	mutex_destroy(&inst->feed_lock);
>  
>  unlock_and_return:
> @@ -738,8 +730,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>  	int ret;
>  	int retry = 0;
>  	struct vpu_device *vpu_dev = inst->dev;
> -	int inst_count = 0;
> -	struct vpu_instance *inst_elm;
>  
>  	*fail_res = 0;
>  	if (!inst->codec_info)
> @@ -782,12 +772,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>  	}
>  
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
> -
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count == 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -
>  	mutex_unlock(&vpu_dev->hw_lock);
>  	pm_runtime_put_sync(inst->dev->dev);
>  

