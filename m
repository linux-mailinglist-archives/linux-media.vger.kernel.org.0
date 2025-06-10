Return-Path: <linux-media+bounces-34453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA457AD3938
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96BBA1BA49BC
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFA9246BD2;
	Tue, 10 Jun 2025 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BCKRCFwl"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CB0226533;
	Tue, 10 Jun 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561675; cv=none; b=Hrh0sQfhXcfPEQSLV6S8+R8efgYNksFKjE6X8Agtvuj3vcieSSsoj3jQ8ZyTg8eQhsLwKQGKQCYUrIgSgWMcs2CUks2jR1AnY+bNva/IZvMfse4P3T400kwbyMkkrpOIgk2vBShGLEpmt0RivQ18bPMP8nBxO/GBxOo0YqcilIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561675; c=relaxed/simple;
	bh=kOr0tkG3PuVS+TTaILnLIQBnipKUm+QpY+o9dkJKWW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQumLL3kQk3nFiKqlW2J4LKdUuUZmDVquaEmFN4zeohpYKdn/uelm9UonqzWj1zbPXVmZ77wJOqrFn8b4Gl7otscFqAZXVLy2pp5F4N89YaVlxV+HyVWxu+5IYQY0dSr57wrln0jkbFIjYo+PVg0YPrU/z2DvTtjjN1lErMwGTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BCKRCFwl; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749561670; bh=kOr0tkG3PuVS+TTaILnLIQBnipKUm+QpY+o9dkJKWW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCKRCFwloMOvMeJl2UYwbk/c6svmS0NA9xTKnQVbxmfBeoOZcdCq0ayf+ZEl+geKf
	 Kx3H3OYDJaMm2l38MzMDib+HB5iupfr9oWycpfEFdb/8Iakd/RpgTeiHGu9Mi3Ahfu
	 zJRncVMoS4Bbgmea9urtUV9YwM9tbBbSZVLDd2suoX+oE3BnMIv+ivG1rOt+7A8j01
	 MmfUcF38TTmEQojAG/QQVwvn7n+RW6b7HPEZKIsswDyk9AP2LYN3BLrPOjJhypL4U4
	 pqJ4dXkYilp//TXzkA9GvxsKAM5ejMDpnzrO2NZDl3me3R83e3tITGCBUOAQjTCtnv
	 QQrMCPLPUZ7uw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id E95C6100069; Tue, 10 Jun 2025 14:21:10 +0100 (BST)
Date: Tue, 10 Jun 2025 14:21:10 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: rc: ir-spi: allocate buffer dynamically
Message-ID: <aEgxRrR0DqNwpdbP@gofer.mess.org>
References: <20250609111715.2572138-1-demonsingur@gmail.com>
 <aEf9b17JU1a5q2hC@gofer.mess.org>
 <8efe62a8-2c90-4599-82f3-4e41d8d859aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8efe62a8-2c90-4599-82f3-4e41d8d859aa@gmail.com>

On Tue, Jun 10, 2025 at 01:15:32PM +0300, Cosmin Tanislav wrote:
> On 6/10/25 12:39 PM, Sean Young wrote:
> > On Mon, Jun 09, 2025 at 02:17:13PM +0300, Cosmin Tanislav wrote:
> > > Replace the static transmit buffer with a dynamically allocated one,
> > > removing the limit imposed on the number of pulses to transmit.
> > > 
> > > Calculate the number of pulses for each duration in the received buffer
> > > ahead of time, while also adding up the total pulses, to be able to
> > > allocate a buffer that perfectly fits the total number of pulses, then
> > > populate it.
> > > 
> > > Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > > ---
> > > V3:
> > >   * move the allocation to be done per-TX operation
> > > 
> > > V2:
> > >   * use devm_krealloc_array
> > > 
> > >   drivers/media/rc/ir-spi.c | 33 ++++++++++++++++++++-------------
> > >   1 file changed, 20 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> > > index 8fc8e496e6aa..50e30e2fae22 100644
> > > --- a/drivers/media/rc/ir-spi.c
> > > +++ b/drivers/media/rc/ir-spi.c
> > > @@ -21,13 +21,11 @@
> > >   #define IR_SPI_DRIVER_NAME		"ir-spi"
> > >   #define IR_SPI_DEFAULT_FREQUENCY	38000
> > > -#define IR_SPI_MAX_BUFSIZE		 4096
> > >   struct ir_spi_data {
> > >   	u32 freq;
> > >   	bool negated;
> > > -	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
> > >   	u16 pulse;
> > >   	u16 space;
> > > @@ -43,37 +41,42 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
> > >   	unsigned int len = 0;
> > >   	struct ir_spi_data *idata = dev->priv;
> > >   	struct spi_transfer xfer;
> > > +	u16 *tx_buf;
> > >   	/* convert the pulse/space signal to raw binary signal */
> > >   	for (i = 0; i < count; i++) {
> > > -		unsigned int periods;
> > > +		buffer[i] = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
> > > +		len += buffer[i];
> > > +	}
> > 
> > This looks great, thank you.
> > 
> > I do have one concern though. If someone sets a carrier of U32_MAX - 1 then
> > this code could be doing largish allocations, spending too long in kernel
> > space filling them with data and spi can't send it anyway. Actually
> > the kmalloc might fail which doesn't look good in the logs.
> > 
> > We may have to constrain the carrier to something spi can handle.
> > 
> 
> The SPI device has a max_speed_hz, maybe we should check that?
> 
> It seems to be set based on the spi-max-frequency property in
> the device tree node of the SPI device, and uses the max_speed_hz
> of the SPI controller as a fallback.
> 
> Should I add a separate patch that adds a check in
> ir_spi_set_tx_carrier?
> 
> if (carrier * 16 > idata->spi->max_speed_hz)
> 	return -EINVAL.
> 
> Something along these lines.

That's perfect. The 16 will need a comment or a #define


Sean

