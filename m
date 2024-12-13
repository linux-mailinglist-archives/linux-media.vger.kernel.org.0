Return-Path: <linux-media+bounces-23399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C15189F1690
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 20:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 817412847A1
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 19:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AC31F9A90;
	Fri, 13 Dec 2024 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gt+hq/Up"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AC1F03EB;
	Fri, 13 Dec 2024 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734118583; cv=none; b=p4OToulrEmVfDnV/aNkvOvj4Ndp59TOFhuaRcKzvC9I5WTWumdeROiJpVzgMNudzFVb3O5szGgAzI9yZyYd7CojA1zUlJ1+Jicts+5KyA/R1W9pPz7BdQK9+ge05687cmYvAl6NBkcnjHF5TjOdNydc09jECrb63Gi+Ys0G05uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734118583; c=relaxed/simple;
	bh=LBRn7osDqXe/qf+KiQRKkN2I4wgAtgsnoye5yF+RoLg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l4qTikBks24Xb0T8K17aZDVLAF+vvOWe2yMHCA1WmQyaz4AqS1/VGDmO7yfHkI+Op/fdllCG5Sl8CcO3iQMBp7/Tg+tcphTbfp48DeZ0qnKDgovAVLP1yKQnmGMNndsKXVnpC5p+7R5DCdJCqRylahb24VyilZsnSnS9QDZvbgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gt+hq/Up; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734118578;
	bh=LBRn7osDqXe/qf+KiQRKkN2I4wgAtgsnoye5yF+RoLg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gt+hq/UpR1FcxF6/5k1a0vh+3jy7VmXl4wXmk3hOcMIeIvZeTFmdTYJnDQzy6JzR8
	 RAYHfXj0SKKP+lu1yr8eyd48QV7WvtlT4kz+N9iV/npho1imm30ruriq5Sd2fw4ABJ
	 RbC+ZLPv1rquprlvCcJsbFra3ekjuW8crfdtYgZPhjNQCG/UKKBqY/hj7Sl+5qtFB+
	 74Q2ASfw8s9h15PhAFPJMKe6g5UpYm50imdsTXMXYm4/OPrxSjSIgZNdZuceugMml1
	 6Zl13O2vIK/0XMgAKNYpdp6ezwuUVLk3iIQB655IbldEYr63LfnJQdkpeOH3NVeB9m
	 l/uYVm/O47KlQ==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C170117E3767;
	Fri, 13 Dec 2024 20:36:16 +0100 (CET)
Message-ID: <9b7be78c58d0bd157541a6c4db0d742e3f9bab58.camel@collabora.com>
Subject: Re: [PATCH v1 2/5] media: chips-media: wave5: Avoid race condition
 for interrupt handling
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 13 Dec 2024 14:36:15 -0500
In-Reply-To: <20241209053654.52-3-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
	 <20241209053654.52-3-jackson.lee@chipsnmedia.com>
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

Le lundi 09 décembre 2024 à 14:36 +0900, Jackson.lee a écrit :
> In case of multi instance, interrupts can occurr for other instances as
> soon as interrupt is cleared. If driver reads the instance_info after
> clearing the interrupt, it is not guaranteed that the instance_info is
> valid for the current interrupt.
> 
> Read the instance_info register for each interrupt before clearing the
> interrupt.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
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

Right, and was a bit silly to read the register N-times, good catch.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>  
>  		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
>  		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {


