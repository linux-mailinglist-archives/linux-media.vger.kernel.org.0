Return-Path: <linux-media+bounces-34410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABCAD3248
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 992C716D0E4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C14F28B7D4;
	Tue, 10 Jun 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Dq0DXZvi"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB541FF5F9;
	Tue, 10 Jun 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548409; cv=none; b=OwJQb+eOiZQgaDy/KATMojV15XpR3kYR/qZxDyRnBK5kx/jbgEwf2moAEr4h06HZa10/Dporw0nTHRB5x5NSDHEHgtMPW55OHk4We4+6lb65UE1WcVkN1fxOFi7uRAWHHU2PbbbCpL0i31B+xu45SVVCw7sRcaw6cM+dof0WKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548409; c=relaxed/simple;
	bh=awHKpsNEyCNJT9lEmoxwlN/VEcuxoMNmatZUA2P/LaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnurLtjvh3b+t1APTANI4u3d5p91WSMy/1YHBnr6XCW43JVkuXk+m61HAq1CzmWh3RTO5cvMvQJgRrnSy3Caqze9clZFgbeQAtcqnXoyYs9ODKik5ipV5PrwNQOGXtJwuQHPjCftWPMdUbu1LcMRYpowq8lj+9VrYjRyjc8eF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Dq0DXZvi; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749548399; bh=awHKpsNEyCNJT9lEmoxwlN/VEcuxoMNmatZUA2P/LaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dq0DXZviV0zJqjttNPfQRXvKNsIKlCw1qgup8hUgk+UsWLpTSSlfy1OFlDvKziDcc
	 FrdVHI4xhtqHRnZxjFhafaoU3w6BlBAKqZ5MHX0DMoTieu/XuVuJFDIFHJc0UfY4Ty
	 Oq3HR9TzRgV6jI3BpXixaBy14kq1mR9lC7OqdgF1lktzey0ibIYKvjLszX85kqqQoR
	 3d7uuTNq9shYlmCJ0if7NvISqW3ml6XX6RgVIZeBJjCwPWpzXjSA6LHQq870Shdjck
	 VfYVotrDoWhzWCzdnkkUZ8aoyxNz1CAJx9Y/uIk+2LDSIgTSKNGXvmVkB+Ns39Sg8B
	 N90fRzvIFGUJw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id A5F07100069; Tue, 10 Jun 2025 10:39:59 +0100 (BST)
Date: Tue, 10 Jun 2025 10:39:59 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: rc: ir-spi: allocate buffer dynamically
Message-ID: <aEf9b17JU1a5q2hC@gofer.mess.org>
References: <20250609111715.2572138-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609111715.2572138-1-demonsingur@gmail.com>

On Mon, Jun 09, 2025 at 02:17:13PM +0300, Cosmin Tanislav wrote:
> Replace the static transmit buffer with a dynamically allocated one,
> removing the limit imposed on the number of pulses to transmit.
> 
> Calculate the number of pulses for each duration in the received buffer
> ahead of time, while also adding up the total pulses, to be able to
> allocate a buffer that perfectly fits the total number of pulses, then
> populate it.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
> V3:
>  * move the allocation to be done per-TX operation
> 
> V2:
>  * use devm_krealloc_array
> 
>  drivers/media/rc/ir-spi.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> index 8fc8e496e6aa..50e30e2fae22 100644
> --- a/drivers/media/rc/ir-spi.c
> +++ b/drivers/media/rc/ir-spi.c
> @@ -21,13 +21,11 @@
>  #define IR_SPI_DRIVER_NAME		"ir-spi"
>  
>  #define IR_SPI_DEFAULT_FREQUENCY	38000
> -#define IR_SPI_MAX_BUFSIZE		 4096
>  
>  struct ir_spi_data {
>  	u32 freq;
>  	bool negated;
>  
> -	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
>  	u16 pulse;
>  	u16 space;
>  
> @@ -43,37 +41,42 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>  	unsigned int len = 0;
>  	struct ir_spi_data *idata = dev->priv;
>  	struct spi_transfer xfer;
> +	u16 *tx_buf;
>  
>  	/* convert the pulse/space signal to raw binary signal */
>  	for (i = 0; i < count; i++) {
> -		unsigned int periods;
> +		buffer[i] = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
> +		len += buffer[i];
> +	}

This looks great, thank you.

I do have one concern though. If someone sets a carrier of U32_MAX - 1 then
this code could be doing largish allocations, spending too long in kernel
space filling them with data and spi can't send it anyway. Actually
the kmalloc might fail which doesn't look good in the logs.

We may have to constrain the carrier to something spi can handle.


Sean

> +
> +	tx_buf = kmalloc_array(len, sizeof(*tx_buf), GFP_KERNEL);
> +	if (!tx_buf)
> +		return -ENOMEM;
> +
> +	len = 0;
> +	for (i = 0; i < count; i++) {
>  		int j;
>  		u16 val;
>  
> -		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
> -
> -		if (len + periods >= IR_SPI_MAX_BUFSIZE)
> -			return -EINVAL;
> -
>  		/*
>  		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
>  		 * contain a pulse duration. On the contrary, 1, 3, 5, ...
>  		 * contain a space duration.
>  		 */
>  		val = (i % 2) ? idata->space : idata->pulse;
> -		for (j = 0; j < periods; j++)
> -			idata->tx_buf[len++] = val;
> +		for (j = 0; j < buffer[i]; j++)
> +			tx_buf[len++] = val;
>  	}
>  
>  	memset(&xfer, 0, sizeof(xfer));
>  
>  	xfer.speed_hz = idata->freq * 16;
> -	xfer.len = len * sizeof(*idata->tx_buf);
> -	xfer.tx_buf = idata->tx_buf;
> +	xfer.len = len * sizeof(*tx_buf);
> +	xfer.tx_buf = tx_buf;
>  
>  	ret = regulator_enable(idata->regulator);
>  	if (ret)
> -		return ret;
> +		goto err_free_tx_buf;
>  
>  	ret = spi_sync_transfer(idata->spi, &xfer, 1);
>  	if (ret)
> @@ -81,6 +84,10 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>  
>  	regulator_disable(idata->regulator);
>  
> +err_free_tx_buf:
> +
> +	kfree(tx_buf);
> +
>  	return ret ? ret : count;
>  }
>  
> -- 
> 2.49.0
> 

