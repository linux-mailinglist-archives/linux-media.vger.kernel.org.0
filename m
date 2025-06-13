Return-Path: <linux-media+bounces-34725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5ACAD87E5
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10EF3AF9B7
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0D0291C27;
	Fri, 13 Jun 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fwyq21dh"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE825A321;
	Fri, 13 Jun 2025 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807041; cv=none; b=MJXRn9kwf/Tg7N+lY84szoEt8Zfd3Qj/Rr+/J7iDed7CVvvIGkmb3FX1wiGECB/z+mm2l4q8XiMYb2v9auahJNGjjh7plBGCckgo4RYvAh3c5/S7s/y1MM26fwLMTrf+tdATX5FU9XFf/p7CLBrUmPlfVUWmaYv9vqWUumsJyCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807041; c=relaxed/simple;
	bh=4adj2/0BDm5vg8dnp5LhYk1LezexBVo3xysAfl3faqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5H1YqnAVmVVCtiP9KILzUgRoijZaoVQK1N0MqT+jUviv2xLqlryhZugc8XQ8Swq4LtiO21PT6QI98GBIlDMz3Xzgut6nh+T+n2qOZU7cWLh59qLlSQIvRyi4p0LL6CWEzxgdvc0vAhhYT2LbOyT3WtDlRGnz47SR1SrUSQwFb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fwyq21dh; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1749807035; bh=4adj2/0BDm5vg8dnp5LhYk1LezexBVo3xysAfl3faqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwyq21dhcFvWE8scCJgvxtKLUo9MqwqwULQKvlyNYHbA4IRUudvsEH2J+I7CW1v6N
	 fRxd5/SHhBA+FARtQWmopjSgNZUVyzQdwFf4AA/h9PrjL4LXDYfA0qm5P4Cl9d5bZv
	 9K2A5fJRzU2IqN2Uj2vbfHKrquYs0mkQwYmifn3DtgVYAwR5/Ti2uRQwz2SnOFQa7z
	 sigJnpnD88QbSYyu4fbtncSnIuczJJ4aQJY/R4EF3TBlDMauMSV6Z7FtrvJy+pC54O
	 WcvIrFQd7aOE8wWtvxd39Yf0OloDnpMZKRRlCdQfyYKWu694um84iUhS9/LXMS5CS8
	 yMghlVXQQeZxA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 33F9E100069; Fri, 13 Jun 2025 10:30:35 +0100 (BST)
Date: Fri, 13 Jun 2025 10:30:35 +0100
From: Sean Young <sean@mess.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: rc: ir-spi: constrain carrier frequency
Message-ID: <aEvvu2sez981pM6Q@gofer.mess.org>
References: <20250611112348.3576093-1-demonsingur@gmail.com>
 <20250611112348.3576093-3-demonsingur@gmail.com>
 <aEnifhd1M6oJjy1S@gofer.mess.org>
 <24d63ec4-a037-46fd-bbc1-9be2bef34c2b@gmail.com>
 <aEsycgtDxrypTU0v@gofer.mess.org>
 <aEs0Qr3O5myydP_L@gofer.mess.org>
 <94bc5863-f831-47b6-8bfd-57a807c8fe23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94bc5863-f831-47b6-8bfd-57a807c8fe23@gmail.com>

On Thu, Jun 12, 2025 at 11:20:28PM +0300, Cosmin Tanislav wrote:
> On 6/12/25 11:10 PM, Sean Young wrote:
> > On Thu, Jun 12, 2025 at 09:02:59PM +0100, Sean Young wrote:
> > > On Wed, Jun 11, 2025 at 11:35:21PM +0300, Cosmin Tanislav wrote:
> > > > On 6/11/25 11:09 PM, Sean Young wrote:
> > > > > On Wed, Jun 11, 2025 at 02:23:44PM +0300, Cosmin Tanislav wrote:
> > > > > > Carrier frequency is currently unconstrained, allowing the SPI transfer
> > > > > > to be allocated and filled only for it to be later rejected by the SPI
> > > > > > controller since the frequency is too large.
> > > > > > 
> > > > > > Add a check to constrain the carrier frequency inside
> > > > > > ir_spi_set_tx_carrier().
> > > > > > 
> > > > > > Also, move the number of bits per pulse to a macro since it is not used
> > > > > > in multiple places.
> > > > > > 
> > > > > > Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > > > > > ---
> > > > > >    drivers/media/rc/ir-spi.c | 6 +++++-
> > > > > >    1 file changed, 5 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> > > > > > index 50e30e2fae22..bf731204c81e 100644
> > > > > > --- a/drivers/media/rc/ir-spi.c
> > > > > > +++ b/drivers/media/rc/ir-spi.c
> > > > > > @@ -21,6 +21,7 @@
> > > > > >    #define IR_SPI_DRIVER_NAME		"ir-spi"
> > > > > >    #define IR_SPI_DEFAULT_FREQUENCY	38000
> > > > > > +#define IR_SPI_BITS_PER_PULSE		16
> > > > > >    struct ir_spi_data {
> > > > > >    	u32 freq;
> > > > > > @@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
> > > > > >    	memset(&xfer, 0, sizeof(xfer));
> > > > > > -	xfer.speed_hz = idata->freq * 16;
> > > > > > +	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
> > > > > >    	xfer.len = len * sizeof(*tx_buf);
> > > > > >    	xfer.tx_buf = tx_buf;
> > > > > > @@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
> > > > > >    	if (!carrier)
> > > > > >    		return -EINVAL;
> > > > > > +	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
> > > > > > +		return -EINVAL;
> > > > > 
> > > > > Just a nitpick.
> > > > > 
> > > > > I think carrier * IR_SPI_BITS_PER_PULSE could overflow, and then the check
> > > > > wouldn't work. It might be better to do:
> > > > > 
> > > > > 	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)
> > > > > 
> > > > > However since IR_SPI_BITS_PER_PULSE is 16, which is just a shift left by 4,
> > > > > I don't think this can be abused in any useful way.
> > > > > 
> > > > 
> > > > I have another concern regarding overflow, inside ir_spi_tx().
> > > > 
> > > > DIV_ROUND_CLOSEST() is called with buffer[i] * idata->freq and 1000000.
> > > > buffer[i] comes from userspace, it's the number of microseconds for this
> > > > pulse. It's unsigned int. lirc core already checks that each element
> > > > is not bigger than 500000 microseconds. Issue is, at 500000, it would
> > > > take a carrier frequency as low as 8590 to overflow the unsigned int.
> > > 
> > > Interesting, you are right.
> > > 
> > > > Maybe it would make sense to switch this one to mult_frac()? But we
> > > > would lose rounding.
> > > > 
> > > > mult_frac(buffer[i], idata->freq, 1000000)
> > > > 
> > > > Optionally, we could cast buffer[i] to u64/unsigned long long, and use
> > > > DIV_ROUND_CLOSEST_ULL.
> > > > 
> > > > DIV_ROUND_CLOSEST_ULL((u64)buffer[i] * idata->freq, 1000000)
> > > > 
> > > > Let me know what you think.
> > > 
> > > I've given it some thought and I'm not sure there is a better solution. It's
> > > an edge case of course, but we should deal with it correctly.
> > 
> > Actually could we use check_mul_overflow() for this?
> > 
> 
> I think we're better off using DIV_ROUND_CLOSEST_ULL(), since after the
> multiplication, there's a division by 1000000, which might bring us back
> in 32-bit territory, even if the multiplication overflowed. If we use
> check_mul_overflow(), we would just invalidate a case that would have
> worked fine.

I don't have a strong opinion on this, but in the current code the overflow
is not detected and garbage is sent, right?


Sean

