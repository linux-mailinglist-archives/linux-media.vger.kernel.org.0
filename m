Return-Path: <linux-media+bounces-34680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE00AD7BB0
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 22:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4393D3B5BA4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 20:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93C12DECD0;
	Thu, 12 Jun 2025 20:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BeCpa18K"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418F2C326E;
	Thu, 12 Jun 2025 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749758583; cv=none; b=R7ZHOGlRn1bt8vboHsOpkIF9cMCEQlr77MpxZdctC0QZSsA3cK15oT6iLpDyfK/3emVpPKPFDgDLYQ1Fy3/prf3+NLrMDGlmTz5GUawO8PemaqDlujCMnXR3Xmrl56lCy7k+vE6niKD6Bvi3VKA/+HggNxLMgo7xofdW9WxC7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749758583; c=relaxed/simple;
	bh=9PAgFh2Rs+8amMX0IEnn4DbVMXUpSwgI04vMhuK5+J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7l+OO3U9+SKlMTVrrCVnACqpUeusGKtuOj28+pCQ+zdlhOCtJL2sh2c0Bh2gMic6ppm1zSYPnwU5WHbVM9GRXnBzMdGF6KTBiNXXFNVttWx8HYWVfel4C0/u1MMYkeBAJxk+3Xqs3Phhf8I76MyXgrqtEKfEmDpVVqYsUd8OMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BeCpa18K; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749758579; bh=9PAgFh2Rs+8amMX0IEnn4DbVMXUpSwgI04vMhuK5+J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BeCpa18KugoVstac64qyGfYXu5qhGDNen7Z68UnEzdx3t4DJpZg12auMSbj9OyUd9
	 L9m8SwGWqwzwnsl9w3Eh7+IcPfIaVVOdqTqZofnGkyuJOUA2OHaLZg1M0JTLxm2Mk1
	 MwgEHtBxxy6sAz1bIj1Co2aKtWa+gqIEoj505kURR64NRVdXex9aa0tRxKERLwYLa6
	 6zp2ukmyygLPpJRIUnayQlMr78PU4uxVShIHTEVKSRm+obSbltL/EoO0a6XUd0FeUI
	 A4C7lQnSPJ/epqNb5FG1ZNZAyIagy3mJGt9DoSZPRuQjq559WYRJZGV84xd6nq/9jE
	 QMut30DSJ/zKQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 16025100069; Thu, 12 Jun 2025 21:02:59 +0100 (BST)
Date: Thu, 12 Jun 2025 21:02:58 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: rc: ir-spi: constrain carrier frequency
Message-ID: <aEsycgtDxrypTU0v@gofer.mess.org>
References: <20250611112348.3576093-1-demonsingur@gmail.com>
 <20250611112348.3576093-3-demonsingur@gmail.com>
 <aEnifhd1M6oJjy1S@gofer.mess.org>
 <24d63ec4-a037-46fd-bbc1-9be2bef34c2b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24d63ec4-a037-46fd-bbc1-9be2bef34c2b@gmail.com>

On Wed, Jun 11, 2025 at 11:35:21PM +0300, Cosmin Tanislav wrote:
> On 6/11/25 11:09 PM, Sean Young wrote:
> > On Wed, Jun 11, 2025 at 02:23:44PM +0300, Cosmin Tanislav wrote:
> > > Carrier frequency is currently unconstrained, allowing the SPI transfer
> > > to be allocated and filled only for it to be later rejected by the SPI
> > > controller since the frequency is too large.
> > > 
> > > Add a check to constrain the carrier frequency inside
> > > ir_spi_set_tx_carrier().
> > > 
> > > Also, move the number of bits per pulse to a macro since it is not used
> > > in multiple places.
> > > 
> > > Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > > ---
> > >   drivers/media/rc/ir-spi.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> > > index 50e30e2fae22..bf731204c81e 100644
> > > --- a/drivers/media/rc/ir-spi.c
> > > +++ b/drivers/media/rc/ir-spi.c
> > > @@ -21,6 +21,7 @@
> > >   #define IR_SPI_DRIVER_NAME		"ir-spi"
> > >   #define IR_SPI_DEFAULT_FREQUENCY	38000
> > > +#define IR_SPI_BITS_PER_PULSE		16
> > >   struct ir_spi_data {
> > >   	u32 freq;
> > > @@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
> > >   	memset(&xfer, 0, sizeof(xfer));
> > > -	xfer.speed_hz = idata->freq * 16;
> > > +	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
> > >   	xfer.len = len * sizeof(*tx_buf);
> > >   	xfer.tx_buf = tx_buf;
> > > @@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
> > >   	if (!carrier)
> > >   		return -EINVAL;
> > > +	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
> > > +		return -EINVAL;
> > 
> > Just a nitpick.
> > 
> > I think carrier * IR_SPI_BITS_PER_PULSE could overflow, and then the check
> > wouldn't work. It might be better to do:
> > 
> > 	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)
> > 
> > However since IR_SPI_BITS_PER_PULSE is 16, which is just a shift left by 4,
> > I don't think this can be abused in any useful way.
> > 
> 
> I have another concern regarding overflow, inside ir_spi_tx().
> 
> DIV_ROUND_CLOSEST() is called with buffer[i] * idata->freq and 1000000.
> buffer[i] comes from userspace, it's the number of microseconds for this
> pulse. It's unsigned int. lirc core already checks that each element
> is not bigger than 500000 microseconds. Issue is, at 500000, it would
> take a carrier frequency as low as 8590 to overflow the unsigned int.

Interesting, you are right.

> Maybe it would make sense to switch this one to mult_frac()? But we
> would lose rounding.
> 
> mult_frac(buffer[i], idata->freq, 1000000)
> 
> Optionally, we could cast buffer[i] to u64/unsigned long long, and use
> DIV_ROUND_CLOSEST_ULL.
> 
> DIV_ROUND_CLOSEST_ULL((u64)buffer[i] * idata->freq, 1000000)
> 
> Let me know what you think.

I've given it some thought and I'm not sure there is a better solution. It's
an edge case of course, but we should deal with it correctly.

Nice catch, solution looks good.


Sean

