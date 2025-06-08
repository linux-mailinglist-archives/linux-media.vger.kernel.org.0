Return-Path: <linux-media+bounces-34315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC2AD143C
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 22:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C92D3AABE4
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 20:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F331E254849;
	Sun,  8 Jun 2025 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="q6Ugdy5I"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96271148850;
	Sun,  8 Jun 2025 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749414921; cv=none; b=A2caKYODCZpgt0Cq1qonr1UijV4NDoSEG3bVNnprXtFCmQZtk0L0W8l5BJOI3bWM8aaDKm9pHN4oLVUdLlzmTNwPHJCOsHMtBxzpc9+m6NeZf7cyK7VLF5nM8igwbHoRKiIzZKJYiJAQa74tCTW13cECSqBcqTbV0mleaN35YLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749414921; c=relaxed/simple;
	bh=3osOd4N+A2iVsWtQM8/3BkjPQWM9WE3z52e2zkBanmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdzny3AGr3lHs63lOT9gG8UBkIS4JJpyqyGicKtJ5VUsIalEKfcXSzOPBC+orb5JuVUdJrfz0eZFDrU+5Eeg/sVTlkTfk1CCilO2ZMftd9OB6SQ0XNsdO9F0IhuaZdn58u3Kk8pP97K1Ry+yQWD7tu9MQsM7LP3t48l3FdBWCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=q6Ugdy5I; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749414323; bh=3osOd4N+A2iVsWtQM8/3BkjPQWM9WE3z52e2zkBanmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6Ugdy5IP+Zyzm7NnWy/VwhYxvGHunLpTPNyNu1LzGAKVatRTascTRiKfQY4XIL6d
	 MWKsPzTrLCipvdXzVUlzkhnp/EDegSOAR8nXqn1sARyj5xSt2CaI2l088r+5skvMEd
	 Fbu01CrVNyw/eHR5TOqQ4naA9Tt/ejFO3Fd1o42MInsupuvFqT28FPT+HeiVBR59l4
	 5VY2ROJm+WPgVE/xBpDtYFMojkhzrKNaEiRDBtILuJmBHuJd5aUD74bJXjRfmLCkhT
	 fBJT6j7gA+kXW0MmHb3zc9UrbthTQN8B3YnAnqajR1c9Xy4AOcLw+bE09PJ/WcAUMJ
	 bETC0h95hWc/A==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 4FF96100069; Sun,  8 Jun 2025 21:25:23 +0100 (BST)
Date: Sun, 8 Jun 2025 21:25:23 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rc: ir-spi: reallocate buffer dynamically
Message-ID: <aEXxs4xsNR7Srdvx@gofer.mess.org>
References: <20250608191536.2181756-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608191536.2181756-1-demonsingur@gmail.com>

On Sun, Jun 08, 2025 at 10:15:33PM +0300, Cosmin Tanislav wrote:
> Replace the static transmit buffer with a dynamically allocated one,
> allowing the buffer to grow as needed based on the length of the
> message being transmitted.
> 
> Introduce a helper function ir_buf_realloc() to manage the allocation
> and reallocation of the buffer. Use it during probe to preallocate
> a buffer matching the original static buffer, then reallocate it as
> needed, with an overhead to avoid frequent reallocations.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
> V2:
>  * use devm_krealloc_array
> 
>  drivers/media/rc/ir-spi.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> index 8fc8e496e6aa..2f931950e107 100644
> --- a/drivers/media/rc/ir-spi.c
> +++ b/drivers/media/rc/ir-spi.c
> @@ -27,7 +27,8 @@ struct ir_spi_data {
>  	u32 freq;
>  	bool negated;
>  
> -	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
> +	u16 *tx_buf;
> +	size_t tx_len;
>  	u16 pulse;
>  	u16 space;
>  
> @@ -36,6 +37,26 @@ struct ir_spi_data {
>  	struct regulator *regulator;
>  };
>  
> +static int ir_buf_realloc(struct ir_spi_data *idata, size_t len)
> +{
> +	u16 *tx_buf;
> +
> +	if (len <= idata->tx_len)
> +		return 0;
> +
> +	len = max(len, idata->tx_len + IR_SPI_MAX_BUFSIZE);
> +
> +	tx_buf = devm_krealloc_array(&idata->spi->dev, idata->tx_buf, len,
> +				     sizeof(*idata->tx_buf), GFP_KERNEL);
> +	if (!tx_buf)
> +		return -ENOMEM;
> +
> +	idata->tx_buf = tx_buf;
> +	idata->tx_len = len;
> +
> +	return 0;
> +}
> +
>  static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int count)
>  {
>  	int i;
> @@ -52,8 +73,9 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>  
>  		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
>  
> -		if (len + periods >= IR_SPI_MAX_BUFSIZE)
> -			return -EINVAL;
> +		ret = ir_buf_realloc(idata, len + periods);

You're reallocating in a loop. That causes a lot of churn.

> +		if (ret)
> +			return ret;
>  
>  		/*
>  		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
> @@ -153,6 +175,10 @@ static int ir_spi_probe(struct spi_device *spi)
>  
>  	idata->freq = IR_SPI_DEFAULT_FREQUENCY;
>  
> +	ret = ir_buf_realloc(idata, IR_SPI_MAX_BUFSIZE);
> +	if (ret)
> +		return ret;
> +

By default, you're allocating IR_SPI_MAX_BUFSIZE already at probe time. So
until someone does a transmit, you haven't saved any memory compared to
before. In fact, the text size will be more so things are worse.

It might make sense to allocate IR_SPI_MAX_BUFSIZE once for each transmit;
most drivers do an allocation per transmit which is perfectly acceptable.


Thanks,

Sean

>  	return devm_rc_register_device(dev, idata->rc);
>  }
>  
> -- 
> 2.49.0

