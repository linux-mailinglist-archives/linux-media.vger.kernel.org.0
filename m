Return-Path: <linux-media+bounces-33286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2BAC28F1
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E463A23E2
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA86298996;
	Fri, 23 May 2025 17:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gCthoF2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3E297130;
	Fri, 23 May 2025 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022085; cv=none; b=Fus5iDN+K2wIHqzMA1n+sSBLNkR6/u84S4RuSPTRXiEcsBzOMJefIOvx+t0eIQnmyiCtsKj5uACfL+A3Ee5bP9cRiNJTCkleyraxUnmWWVUagolKR3j4hkBxZWdZGiUbSdtxSwihgwnYcGvflTxsrDre0gk0mzwwOvIc053atx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022085; c=relaxed/simple;
	bh=KXzeAjYGWYxpzCQl/ulh4lqpOBCCKxz+EIeek8nD1Cg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U6hlDdYWw6XDmye7SgDLn92WiQCgprg9QyYTBaYEd+w28tz1+SKmhU/YUl0LVC+CL3/I2XnsCrnNs6oZ9KbscmJ+pFL9yeGqL8PwH8vyJjJKMC1htuOJr+Xpo789pnrMl4B+2vBnJldkLmzaxwMkIQAOobT2MZMY5ETqxioFjvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gCthoF2Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748022082;
	bh=KXzeAjYGWYxpzCQl/ulh4lqpOBCCKxz+EIeek8nD1Cg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gCthoF2QtNe6lVEitsdxQRvcGNwlyZjI9MjW0QIYZvM9MkeKiie/pgYB0gh56p32j
	 Gyb4PlVK3B9i7sZZWFYXnFNvPUJTOsNoE5y0CbH/4U4MIzWH8H/OxpIz/veUT3EKDp
	 GNN7nwZhibwts6/dxZzrjDQnaGXox/VYIGeSRYRdPIWhj8hX/EZe6D31TkauKHazex
	 TDHm+bQ1qKPHnaHBdGgyUzSTqvgi/2jGrK2yvPmpW83WXPqMXymj/NanatGzTrjE8r
	 2kLJmAs7+y7B6Jc6DqqPAjzkteDx0XCzhYN8EwyyddCrMmVZYcJgp9Deh60PGP3bO+
	 qu1rDmSQOyM1Q==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9489317E0A5F;
	Fri, 23 May 2025 19:41:20 +0200 (CEST)
Message-ID: <effe40f0d4caef43bf772d350a67d68833941cbb.camel@collabora.com>
Subject: Re: [PATCH v2 4/7] media: chips-media: wave5: Use spinlock whenever
 statue is changed
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 23 May 2025 13:41:18 -0400
In-Reply-To: <20250522072606.51-5-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-5-jackson.lee@chipsnmedia.com>
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
> The device_run and finish_decode is not any more synchronized,
> so lock was needed in the device_run whenever state was changed.

Can you try to introduce the locking ahead of the patches, otherwise
this break bisectability as the in-between become racy.

Nicolas

> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-dec.c
> index 42981c3b49bc..719c5527eb7f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1577,6 +1577,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>  	struct queue_status_info q_status;
>  	u32 fail_res = 0;
>  	int ret = 0;
> +	unsigned long flags;
>  
>  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
>  	pm_runtime_resume_and_get(inst->dev->dev);
> @@ -1617,7 +1618,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>  			}
>  			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  		} else {
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
>  			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  		}
>  
>  		break;
> @@ -1628,8 +1631,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		 * we had a chance to switch, which leads to an invalid state
>  		 * change.
>  		 */
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
>  		switch_state(inst, VPU_INST_STATE_PIC_RUN);
> -
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  		/*
>  		 * During DRC, the picture decoding remains pending, so just leave the job
>  		 * active until this decode operation completes.
> @@ -1643,7 +1647,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		ret = wave5_prepare_fb(inst);
>  		if (ret) {
>  			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
>  			switch_state(inst, VPU_INST_STATE_STOP);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  			break;
>  		}
>  

