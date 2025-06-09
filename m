Return-Path: <linux-media+bounces-34328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C9AD19AF
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE613A2EE8
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 08:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92361FBEAC;
	Mon,  9 Jun 2025 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="lz+vGiu3"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B5A92E;
	Mon,  9 Jun 2025 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456947; cv=none; b=dpZ7cvxDr522SgLbpHj4He+IobBIFjd9R1N8iU4u2SZfa6Q8iP6jLvy2W6G2XoiAAIY20AKX9nBCogv3UFBxDnwX1EzF7MM5bwuDzmJXSFgqa+nqYimjzyx1ASc4iYNqRZI62TB7u3khfGgCb6FIyoLebqy8+O3f7XL1RSlFWBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456947; c=relaxed/simple;
	bh=tCw+BuHgAhUGJpCWZDApcTvFD9Za8MWexienPul33e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6iEJrs93+3nJfY2Qsp34MKLM37gI1ekSzOn8KK3Q3ctKX0nNbG3R5UOy7tVyPDWkCQ4iXTHuFtOtUN57Fhu/Kzmn1ewPYr6p7O3mnO4qW8RvoQmpyYmON1YPokgrkNmiFevOUIWkjv5C3GQfdHnmstN35msVVDGuGR7PYlgBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=lz+vGiu3; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749456942; bh=tCw+BuHgAhUGJpCWZDApcTvFD9Za8MWexienPul33e8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz+vGiu3DNVfiDg2R1my90UZB01iKmuVOQq9MPBDN0zdrVPub2YHeib5tj/ndGD2m
	 aaMgJP5QBDvibpUNN1QxKtLA+veQed9BUv3JE9ZI89AvO81KRVFh+XVRSDHpKSNJow
	 KRVMdt1uQQZVj3F9M1KhM82EtH46dRWbTg1VtkH5wvTrzhnNxdPjS9WFXTsMeeRlmQ
	 gni2j9WtApH6em6kU2qG0r62V0aYP2t8zQtnQZ6ttErV/3/bBQaCiqwM1FULao4+Vz
	 NqRWHbIMCHFLjFcYUuQuC3RuctFUhjeGOSrI9dEDB2Tk7H3WD2L+na7Qxqdo8fxrHU
	 vmKKZ3qCOp20Q==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D2150100069; Mon,  9 Jun 2025 09:15:42 +0100 (BST)
Date: Mon, 9 Jun 2025 09:15:42 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rc: ir-spi: reallocate buffer dynamically
Message-ID: <aEaYLnDejiSXmJgN@gofer.mess.org>
References: <20250608191536.2181756-1-demonsingur@gmail.com>
 <aEXxs4xsNR7Srdvx@gofer.mess.org>
 <f6730384-92ca-4f3d-8316-996edc2750fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6730384-92ca-4f3d-8316-996edc2750fa@gmail.com>

On Mon, Jun 09, 2025 at 12:52:56AM +0300, Cosmin Tanislav wrote:
> On 6/8/25 11:25 PM, Sean Young wrote:
> > On Sun, Jun 08, 2025 at 10:15:33PM +0300, Cosmin Tanislav wrote:
> > > Replace the static transmit buffer with a dynamically allocated one,
> > > allowing the buffer to grow as needed based on the length of the
> > > message being transmitted.
> > > 
> > > Introduce a helper function ir_buf_realloc() to manage the allocation
> > > and reallocation of the buffer. Use it during probe to preallocate
> > > a buffer matching the original static buffer, then reallocate it as
> > > needed, with an overhead to avoid frequent reallocations.
> > > 
> > > Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > > ---
> > > V2:
> > >   * use devm_krealloc_array
> > > 
> > >   drivers/media/rc/ir-spi.c | 32 +++++++++++++++++++++++++++++---
> > >   1 file changed, 29 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> > > index 8fc8e496e6aa..2f931950e107 100644
> > > --- a/drivers/media/rc/ir-spi.c
> > > +++ b/drivers/media/rc/ir-spi.c
> > > @@ -27,7 +27,8 @@ struct ir_spi_data {
> > >   	u32 freq;
> > >   	bool negated;
> > > -	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
> > > +	u16 *tx_buf;
> > > +	size_t tx_len;
> > >   	u16 pulse;
> > >   	u16 space;
> > > @@ -36,6 +37,26 @@ struct ir_spi_data {
> > >   	struct regulator *regulator;
> > >   };
> > > +static int ir_buf_realloc(struct ir_spi_data *idata, size_t len)
> > > +{
> > > +	u16 *tx_buf;
> > > +
> > > +	if (len <= idata->tx_len)
> > > +		return 0;
> > > +
> > > +	len = max(len, idata->tx_len + IR_SPI_MAX_BUFSIZE);
> > > +
> > > +	tx_buf = devm_krealloc_array(&idata->spi->dev, idata->tx_buf, len,
> > > +				     sizeof(*idata->tx_buf), GFP_KERNEL);
> > > +	if (!tx_buf)
> > > +		return -ENOMEM;
> > > +
> > > +	idata->tx_buf = tx_buf;
> > > +	idata->tx_len = len;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int count)
> > >   {
> > >   	int i;
> > > @@ -52,8 +73,9 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
> > >   		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
> > > -		if (len + periods >= IR_SPI_MAX_BUFSIZE)
> > > -			return -EINVAL;
> > > +		ret = ir_buf_realloc(idata, len + periods);
> > 
> > You're reallocating in a loop. That causes a lot of churn.
> > 
> 
> I'm allocating in a loop indeed, but I add at least IR_SPI_MAX_BUFSIZE
> each time the new length exceeds the existing length. This should cut
> down on the amount of allocations.

Yes, you're right.

> In my testing, controlling various devices around the house using IR,
> I haven't exceeded two allocations, aka 8192. But having this static
> size in place prevents bigger transfers from being done.

The name IR_SPI_MAX_BUFSIZE is no longer correct, the buffer can get larger
than that. It should have a new name.
> 
> > > +		if (ret)
> > > +			return ret;
> > >   		/*
> > >   		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
> > > @@ -153,6 +175,10 @@ static int ir_spi_probe(struct spi_device *spi)
> > >   	idata->freq = IR_SPI_DEFAULT_FREQUENCY;
> > > +	ret = ir_buf_realloc(idata, IR_SPI_MAX_BUFSIZE);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > 
> > By default, you're allocating IR_SPI_MAX_BUFSIZE already at probe time. So
> > until someone does a transmit, you haven't saved any memory compared to
> > before. In fact, the text size will be more so things are worse.
> > 
> > It might make sense to allocate IR_SPI_MAX_BUFSIZE once for each transmit;
> > most drivers do an allocation per transmit which is perfectly acceptable.
> > 
> 
> My reasoning was not to save memory, but to allow transfers bigger than
> IR_SPI_MAX_BUFSIZE, which currently is 4096. Note that that's periods,
> not number of pulses/spaces.
> 
> If you want an allocation per transfer then we should compute the total
> period size and allocate a big enough buffer to fit all the periods.
> 
> Each pulse/space value translates to a different period (depending on
> the carrier frequency) so we'd have to compute it once ahead of time
> to allocate the periods buffer, and once again afterwards.
> 
> To avoid doing the period finding two times we could reuse the passed in
> buffer to hold the calculated period, but we'd still be iterating two
> times over the passed in buffer.

This all makes sense.

There is no reason to do an allocation in the probe function. We should free
the buffer after the transmit too.


Sean

