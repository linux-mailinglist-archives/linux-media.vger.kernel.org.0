Return-Path: <linux-media+bounces-21843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319D9D60A9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 15:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E78BB27410
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 14:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F40C14A4F7;
	Fri, 22 Nov 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CK3Ozqry"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502CB70823;
	Fri, 22 Nov 2024 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286559; cv=none; b=RSM3ZX5s/YZTZRYGW6QyxOKjRa8q2s2BJTrc1ddcx9jtGP3ahLHgcP0t27d2+HC7NyYyUW1N69I/+VYCqASMjAZGCF/cC1pWx9ap6W2f5OLslW+VXELgWFcu3HFxVjFqIG/XV8bukcKTXsqQqNBoDN1b4r+NIvMLaetZk0ABlv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286559; c=relaxed/simple;
	bh=yvoAZlYrp2lwBX78QCFhBDDhxQT+PbHSUgM1ZHLXPGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQG/H5CbtI1xIGWWdx6npGQTEQR5p42tzziIJdxZHoBQbw6zL5xMod3nuywi3YDZX+FOCw9trLpqaWJYJnfK346PP7PvHJrFHqP6C72OOQyyI2xwVS38SvU1WV6XTfP95OJr5tlxJNZhhtGSDPvU3+4h9WM8vLCQU3ZRDXwr0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CK3Ozqry; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F09A514;
	Fri, 22 Nov 2024 15:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732286536;
	bh=yvoAZlYrp2lwBX78QCFhBDDhxQT+PbHSUgM1ZHLXPGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CK3OzqryFp1iax8+Jbzb4kEAapp6Rg2+tYjAOV1za5rdXOekJdTOhZ5OY0Rfr2hba
	 n5aJJuGhXW+KsvsZOBNEsIyoUrrrphhIe9kR0pjy3RGqRyl2OBkdpanLWvBuyAyd2A
	 xy8y4A2pdhcXb+S256DPBZNHdKWCcTaovkd8XBQY=
Date: Fri, 22 Nov 2024 15:42:33 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible
 dummy buffer overrun
Message-ID: <whyu7ldlgfccyjpx6oqigfuska5nabfp2y6l7zha2unwlvipot@ouwgvjxovisx>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-5-naush@raspberrypi.com>
 <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
 <CAEmqJPrfGCB=hKN-+0cG3xFiZxS4BJ_FT=pXnt5U+48wk+A0sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPrfGCB=hKN-+0cG3xFiZxS4BJ_FT=pXnt5U+48wk+A0sw@mail.gmail.com>

Hi Naush

On Fri, Nov 22, 2024 at 11:35:59AM +0000, Naushir Patuck wrote:
> Hi Jacopo,

Thanks for the explanation

>
> On Fri, 22 Nov 2024 at 11:20, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hi Naush
> >
> > On Fri, Nov 22, 2024 at 08:41:51AM +0000, Naushir Patuck wrote:
> > > The Unicam hardware has been observed to cause a buffer overrun when
> > > using the dummy buffer as a circular buffer. The conditions that cause
> > > the overrun are not fully known, but it seems to occur when the memory
> > > bus is heavily loaded.
> > >
> > > To avoid the overrun, program the hardware with a buffer size of 0 when
> > > using the dummy buffer. This will cause overrun into the allocated dummy
> > > buffer, but avoid out of bounds writes.
> > >
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> > > ---
> > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > index 550eb1b064f1..f10064107d54 100644
> > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > @@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
> > >  static void unicam_wr_dma_addr(struct unicam_node *node,
> > >                              struct unicam_buffer *buf)
> > >  {
> > > -     dma_addr_t endaddr = buf->dma_addr + buf->size;
> > > +     /*
> > > +      * Due to a HW bug causing buffer overruns in circular buffer mode under
> > > +      * certain (not yet fully known) conditions, the dummy buffer allocation
> > > +      * is set to a a single page size, but the hardware gets programmed with
> > > +      * a buffer size of 0.
> > > +      */
> > > +     dma_addr_t endaddr = buf->dma_addr +
> > > +                          (buf != &node->dummy_buf ? buf->size : 0);
> >
> > So the DMA engine doesn't actually write any data to dummy_buf
> > anymore ?
> >
> >
> > Does it still need to be allocated at all ? Or can we simply set the
> > dma transfer size to 0 ?
>
> The DMA engine does still write to the buffer, so the allocation needs
> to occur. The zero size programmed into the register is a quirk of the
> HW itself, and is used to ensure the write wrap correctly in the
> buffer.
>
> Naush
>
> >
> > >
> > >       if (node->id == UNICAM_IMAGE_NODE) {
> > >               unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
> > > --
> > > 2.34.1
> > >
> > >
>

