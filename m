Return-Path: <linux-media+bounces-34544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED341AD5FE2
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 22:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C9117B077
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 20:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FA62BDC28;
	Wed, 11 Jun 2025 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fBzsLyWg"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B8221F1C;
	Wed, 11 Jun 2025 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749672584; cv=none; b=nDTJiGVeddijU2ZMHAK+YPc4mJi8QjpERhhnKmTua/Uq2eA7R4/VbaReHSYk4r/JTqbG0oAT2GHdY8FaE9XfqgXPfkvOPaOGFOP/jLe/pBJZzKVLHH9zn1uuHgDRMRnSRu1stJ9WV6XTtmGV8DaeGKQO/ir8ynL8lPOOv7tl1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749672584; c=relaxed/simple;
	bh=95CplAYh589c94KT4OHeDw6dyXWciFWaE0dM3Q8zu4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KevIeQe8rgfw3g+YOEQ9/dmHzkuUHTImutD6gl7P3XAJ1O9FPhEZ692Ua+k6bxFykCqkWawhG0hKJ0YYbN6WIVK7EvpAq7sxao1V5njOcTYvg0yytrsmd5IzDsoHOTBL64hbXEDa/GNZPr3LOVTKqPxdTEdeolAcHVTzkeGUCgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fBzsLyWg; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749672575; bh=95CplAYh589c94KT4OHeDw6dyXWciFWaE0dM3Q8zu4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBzsLyWgfrKlL9tvvk7RXWndSrn28DGDmTq6rgQD7fT7+ATd797KTZHN/r0e5Mdvr
	 6Qjtvrj0QY1QvhCMHaaN2DHzTckqqKpgzp0X+x9l1NlhSfIgonBIUNsOoLgi6Y7p6w
	 w6Di/AoXl5fumu2wGrbu4IRCIaUR+hW2Ty/Hl86ePA5yOFGBhmCNZc3xvTPoOTpYTJ
	 lLwYLAJUQhCrx2COaLtEYdapXJDPucy2no2sj8Ib5r60ixtqy7WfrMQZZ+POoK9pbM
	 LxNHq7UXYjj3QsfcEIoUXbHWV3xw9dbsBtaYAjwMUVHMz4UKkaoZKLeoFSj+pVkjTt
	 kB7uDSPkLOr6A==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id F2C43100069; Wed, 11 Jun 2025 21:09:34 +0100 (BST)
Date: Wed, 11 Jun 2025 21:09:34 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: rc: ir-spi: constrain carrier frequency
Message-ID: <aEnifhd1M6oJjy1S@gofer.mess.org>
References: <20250611112348.3576093-1-demonsingur@gmail.com>
 <20250611112348.3576093-3-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611112348.3576093-3-demonsingur@gmail.com>

On Wed, Jun 11, 2025 at 02:23:44PM +0300, Cosmin Tanislav wrote:
> Carrier frequency is currently unconstrained, allowing the SPI transfer
> to be allocated and filled only for it to be later rejected by the SPI
> controller since the frequency is too large.
> 
> Add a check to constrain the carrier frequency inside
> ir_spi_set_tx_carrier().
> 
> Also, move the number of bits per pulse to a macro since it is not used
> in multiple places.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/media/rc/ir-spi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> index 50e30e2fae22..bf731204c81e 100644
> --- a/drivers/media/rc/ir-spi.c
> +++ b/drivers/media/rc/ir-spi.c
> @@ -21,6 +21,7 @@
>  #define IR_SPI_DRIVER_NAME		"ir-spi"
>  
>  #define IR_SPI_DEFAULT_FREQUENCY	38000
> +#define IR_SPI_BITS_PER_PULSE		16
>  
>  struct ir_spi_data {
>  	u32 freq;
> @@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>  
>  	memset(&xfer, 0, sizeof(xfer));
>  
> -	xfer.speed_hz = idata->freq * 16;
> +	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
>  	xfer.len = len * sizeof(*tx_buf);
>  	xfer.tx_buf = tx_buf;
>  
> @@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
>  	if (!carrier)
>  		return -EINVAL;
>  
> +	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
> +		return -EINVAL;

Just a nitpick.

I think carrier * IR_SPI_BITS_PER_PULSE could overflow, and then the check
wouldn't work. It might be better to do:

	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)

However since IR_SPI_BITS_PER_PULSE is 16, which is just a shift left by 4,
I don't think this can be abused in any useful way.


Sean

> +
>  	idata->freq = carrier;
>  
>  	return 0;
> -- 
> 2.49.0
> 

