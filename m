Return-Path: <linux-media+bounces-23591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2FF9F4D0F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5BA1674EE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730C51F4733;
	Tue, 17 Dec 2024 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j62NSpcx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716A1E485;
	Tue, 17 Dec 2024 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444272; cv=none; b=dJ/523rK9sVnjxSnrhuIyAhL3L5PwqTODXJ/og4eexEn6fzAXTqMNMVTwcltahFHob8HglY25AMe7QkI5vMkBYFGRTcdgxHur9aPRTg+ecEzLZvdNppV1xhBf0smHG9r4Gns8GwPoCbimyz8elCdAqoZzOcbSATH1KALs6S3oRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444272; c=relaxed/simple;
	bh=XgMH8OitkFMJ0x07j4kDr/A7+LLK+Tj8hjkTRcg6a40=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZ2iMhzaT9N0Mpa5J2m5eZjtnVdPe3brCEWa+TuMtDHvpBhZWdc4AnOVCmbjQsXLwocnqj6cx/Mt8/snte4QYjnvWDJWyGdlB2KyDIUSzmQDv6U/fasHtyJg0RdB3p5Rlj7fFon1OcQv8AST8acjzDl3Ot76BaVzxRtof1nYFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j62NSpcx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734444269;
	bh=XgMH8OitkFMJ0x07j4kDr/A7+LLK+Tj8hjkTRcg6a40=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=j62NSpcxjeB0WLipOhihPibb2PIAzbGqtLU5K0EFHSg64nAtRtdmnADzjFk/KwDQg
	 U0wi3CeANQR+H31gkotqnlELXbHPfq5rnXofJxpaHRnxDzZ2ssIaAqH2wrHt8rJHdZ
	 U8cwxEqSF+WIDzabGxH7abPWa/l1uy330QtwTmOWtWTNTj8sQbjzyxn+ESxHqPinvt
	 7BZCzUDE4Dzp8Ug6vi68B+kqhT2HLHAFsR4NRjfZbAa1oV+eLy8fdvcc5b3CtguIzs
	 tX5fhHEApX6tuG9+48Nj5/uTkeSJ0EJeapxINk+etry+P1GXkp7Bmxl/dxXLTH3GS0
	 ntIrcpD5gjZWA==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82E1017E376F;
	Tue, 17 Dec 2024 15:04:27 +0100 (CET)
Message-ID: <a50b3e0f6e1ce7cad421039abeb5574cf74410fe.camel@collabora.com>
Subject: Re: [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition
 for interrupt handling
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Tue, 17 Dec 2024 09:04:25 -0500
In-Reply-To: <20241217045125.58-3-jackson.lee@chipsnmedia.com>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
	 <20241217045125.58-3-jackson.lee@chipsnmedia.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mardi 17 décembre 2024 à 13:51 +0900, Jackson.lee a écrit :
> In case of multi instance, interrupts can occur for other instances as
> soon as interrupt is cleared. If driver reads the instance_info after
> clearing the interrupt, it is not guaranteed that the instance_info is
> valid for the current interrupt.
> 
> Read the instance_info register for each interrupt before clearing the
> interrupt.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Same, what is the Fixes tag ?

> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index 6b294a2d6717..63a607d10433 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -55,12 +55,12 @@ static void wave5_vpu_handle_irq(void *dev_id)
>  	struct vpu_device *dev = dev_id;
>  
>  	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> +	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
> +	cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
>  	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
>  	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
>  
>  	list_for_each_entry(inst, &dev->instances, list) {
> -		seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
> -		cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
>  
>  		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
>  		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {


