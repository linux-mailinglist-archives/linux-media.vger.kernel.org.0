Return-Path: <linux-media+bounces-21833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 541EC9D5DE6
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6754B2565C
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BA91DE4D3;
	Fri, 22 Nov 2024 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S52zSAXE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E7142E83;
	Fri, 22 Nov 2024 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732274298; cv=none; b=Cc84ki/vEac0OQwA+nzBs24gUfQGAxEHTdv7qCLKdDwQNZRo1738s2hQwciUuYe5/wjoXzziMxWRBC8jl+ROwZyhT00wwSLahbQOZC3oWeGlzgBOLc0dAgqnJKveniGiuBVeQuhmFAKeHqTktmw5gADdX3/jaWJhXV30AtfJusY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732274298; c=relaxed/simple;
	bh=+TycvT76QBlSTG2Wc1ml2WaPiIwhkCQW9F/t/pgRKLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ3hPPr+6OGYvhczxDCcGRjDXYl212U+Z7qvUKUfCqq6ESVCump8h1RCQDdI81TtY9xMVhajBt0bomaoPX0CYPFq2hU7YukDqWfSM+oeJWNutH1Q0BGif8eXdH3p83a0fghn3h2/4bGp1z5O70LUav/oeKy7b+vbUyw0XLLWyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S52zSAXE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDA70F86;
	Fri, 22 Nov 2024 12:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274275;
	bh=+TycvT76QBlSTG2Wc1ml2WaPiIwhkCQW9F/t/pgRKLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S52zSAXEm86LGZseLzveT2rpxu9vOjQl/1U5c4hbXS69HIW5BLM8Nx9F0C4dJKBTr
	 mgvE2bSor40TjmrLQxmLJJjkN7uPLXxBbbl19swwJKOiPvp20jaSnCfcpc5gqI3toX
	 sN+0Q3W1CJmv9nAawn0ZpT2IKHS/wpYljzXgAjd8=
Date: Fri, 22 Nov 2024 12:18:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 3/5] drivers: media: bcm2835-unicam: Disable trigger
 mode operation
Message-ID: <qylnmgwawjmzuzkawku7ti6orj4a7ju6bckie25ion5ii5satz@slyawn2rm7gm>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-4-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-4-naush@raspberrypi.com>

Hi Naush

On Fri, Nov 22, 2024 at 08:41:50AM +0000, Naushir Patuck wrote:
> The imx219/imx708 sensors frequently generate a single corrupt frame
> (image or embedded data) when the sensor first starts. This can either
> be a missing line, or invalid samples within the line. This only occurrs
> using the upstream Unicam kernel driver.

I think the last statement can b dropped.

>
> Disabling trigger mode elimiates this corruption. Since trigger mode is
> a legacy feature copied from the firmware driver and not expected to be
> needed, remove it. Tested on the Raspberry Pi cameras and shows no ill
> effects.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index d573d4d89881..550eb1b064f1 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -834,11 +834,6 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  		}
>  	}
>
> -	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
> -		/* Switch out of trigger mode if selected */
> -		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> -		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
> -	}
>  	return IRQ_HANDLED;
>  }
>
> @@ -1002,8 +997,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
>
>  	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
>
> -	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
> -	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
> +	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_IBOB;
>  	line_int_freq = max(fmt->height >> 2, 128);
>  	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
>  	unicam_reg_write(unicam, UNICAM_ICTL, val);
> --
> 2.34.1
>
>

