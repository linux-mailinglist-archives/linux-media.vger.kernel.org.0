Return-Path: <linux-media+bounces-21834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D75579D5DF0
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8881F21559
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D031DE4FC;
	Fri, 22 Nov 2024 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EL7V0rG5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089E17E00E;
	Fri, 22 Nov 2024 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732274446; cv=none; b=B3og1pqWJcCeC7PVC4cdlKen19A9OD3klYpIYathfRpL4nlDOQkdlBVqWDKHACFEKlzFTKZy2T15s8yWXgEU809X7bhQMyXu9wm7Ut17+4580VUao2DpHVhr1i3ddUjtswq20Py5YOBnjjgluHIaJ+pOLuLjxT7vXVy1gXNTuE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732274446; c=relaxed/simple;
	bh=IRgrCb6NBNtdhKLpJ2c31xozwLFzsO9letozRyoDWbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kU/3h+TEsf43DRG1pkrz6mpG4J8Lxh7t2xlVNQzw1VFZVZR2ah1fgZYDkbMOfBd+VUMyzHG9hl4GatkJqSCZn3lEYBnpfH3oQ3Wy0pdTqDzn1XunfI12P3KXd9dX3+B2bD5Q5zonOw33FQyo90ooenk20Y+XceCvrhpa7ICqtF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EL7V0rG5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 524824C9;
	Fri, 22 Nov 2024 12:20:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274424;
	bh=IRgrCb6NBNtdhKLpJ2c31xozwLFzsO9letozRyoDWbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EL7V0rG55eLDxd2z3URajDlhIhfEpZiPoixLdd3Vl6MN9vGADzG/3TnbEWtB5XEZr
	 lLAHX/8oX5/npsIaSdOvJePCe0A/7AFcuwBGJmr9nrGfMslDbA+9ejPAzAsknZA2n8
	 PJJAQ1TXgxNmc+wHOlYsAVnfldxDPWE49dvjrbfY=
Date: Fri, 22 Nov 2024 12:20:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible
 dummy buffer overrun
Message-ID: <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-5-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-5-naush@raspberrypi.com>

Hi Naush

On Fri, Nov 22, 2024 at 08:41:51AM +0000, Naushir Patuck wrote:
> The Unicam hardware has been observed to cause a buffer overrun when
> using the dummy buffer as a circular buffer. The conditions that cause
> the overrun are not fully known, but it seems to occur when the memory
> bus is heavily loaded.
>
> To avoid the overrun, program the hardware with a buffer size of 0 when
> using the dummy buffer. This will cause overrun into the allocated dummy
> buffer, but avoid out of bounds writes.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 550eb1b064f1..f10064107d54 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
>  static void unicam_wr_dma_addr(struct unicam_node *node,
>  			       struct unicam_buffer *buf)
>  {
> -	dma_addr_t endaddr = buf->dma_addr + buf->size;
> +	/*
> +	 * Due to a HW bug causing buffer overruns in circular buffer mode under
> +	 * certain (not yet fully known) conditions, the dummy buffer allocation
> +	 * is set to a a single page size, but the hardware gets programmed with
> +	 * a buffer size of 0.
> +	 */
> +	dma_addr_t endaddr = buf->dma_addr +
> +			     (buf != &node->dummy_buf ? buf->size : 0);

So the DMA engine doesn't actually write any data to dummy_buf
anymore ?

Does it still need to be allocated at all ? Or can we simply set the
dma transfer size to 0 ?

>
>  	if (node->id == UNICAM_IMAGE_NODE) {
>  		unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
> --
> 2.34.1
>
>

