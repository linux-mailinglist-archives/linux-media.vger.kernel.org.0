Return-Path: <linux-media+bounces-21836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66A79D5E44
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA614B25732
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2545B1DE2D2;
	Fri, 22 Nov 2024 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="H7fNy+cL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C61DDC2C
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732275398; cv=none; b=Estl1TXLzZtW1uWEmIl6lBZNIq9VkwE1BlgEUA7I1IrAqlUkxqulLGm2DnBVaV0UqkKUqKX4VbzxJGDu6Id5fYGy9iOPsr9h3X4kXXDoEy6RQs2+uvx2pv1k3aXdOl3uaATBk/tQ2p3P/1zzUNoSsV+zdZVeQ1CRskqlpwgHQWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732275398; c=relaxed/simple;
	bh=6JXoIT83nSYxTXOWHmaIE/r47HnugT4aXMkQeAn7dl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F46PYtSRKSDS+JrBhkm+Hpt33DDi4xdJpOwJgybqHvvEBU+o68ofpXRDFWBm6vaHpMx9Rt0Tejaz/7nRTWFbBCg90MtCdwnZIRktmlGlInBQ3SfwivpIZea1SmCNV16qRyEvTDJRtNO+mQwKieLtV1UrV9NEaT9qOviz2kZHgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=H7fNy+cL; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3890bec8d8so227866276.1
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 03:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732275395; x=1732880195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0sBqcbK1efD2Qn0RLXgO+HABCeGcow4GsKIzdjiZraQ=;
        b=H7fNy+cLO31G6MdhvOyI8a9EaoOeIsDYOwvqfkLshuyR5G6qFTXvirIEKD5iZDC4U2
         oskuDCMXwEHkG5l3U60CR/dELwAtyS9VhPA0QPqosy+hXS7wdeAYZOWIk0O+2XJ3Rkyu
         zuIevnmvKtzFw1Ac7edLtjeD5EWoGxdaFEBYVeb5cCyA7kKS2oMCZdAsouU7fJYNkqsm
         u4/AU+l+xvjQ9N1Zls11LQnIRED7olX2GIXTWrnsUPm5Ck74+SaNcwgViBrOwOavW0N2
         /m517r6gDusxWCHaYKIMJcxH4ytPJHhVAuY8scbK5gWBOzfBIJvFWWCHJs5DGpBNADVV
         nWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732275395; x=1732880195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sBqcbK1efD2Qn0RLXgO+HABCeGcow4GsKIzdjiZraQ=;
        b=IshC2Pl9mOyLvQEK5K8+Hvi/HqC8zF+HTS0KbOQO88W3lUBmiqGij/0XPN39YZiGhx
         w2cAUNVKnrGXjqIXBuS7YlgKfLVB4t7rkXEuFtNAFygpVsdppolv6/HJXuq02e1wc+OA
         /IJtB9Tg++U+Sv/xYzt+Nhb7ys+Ggr/xjjNWzN4bphW9z2FNvjqgMlafqY3VAifIiNQI
         98PfaHR26Jah//10YnvX70RPTKfGVCWDVbIB2+nBNfRHErHHkq0d7LnstMBUM83dvMi/
         LSwVzbJbqdEOEN+ZkqtWvPZizJk18O6GTznExkBrHh7jUGy2ZZ2gIJoCcfZv+S3bXYfP
         klYg==
X-Forwarded-Encrypted: i=1; AJvYcCVfvIaHpQr1Du8CFqqRAQo/Sq6qv9pDSUVnUcmOsC3nausQ8xymryViXZ92k5Kzt/qJre75sfS7BHXrAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwwaOUV4sChtS9iAHtklMZN0NBrOla3drhW4oJcxIo1lVvlfT
	AU/qgUEX/j8KBzO2WvPJOq4FYApxeeoro1dt6zqUqQWBKELQn5sesYrUHD6TO0Wldrg3cKwBKS+
	4AxwQw+xFYwt4c9bBXYgUUkIDYmRzs/4WshJ+kA==
X-Gm-Gg: ASbGncuWCZfQEvpPLLMAQC3tTedecAy70xzcg81/HeP+dcn22ed+SWGWu3iMnp4u2br
	1UPsecTEzvzXvfwrBINviyOkgwcZgrHd+zlNASISsMx6XAifwhedHiw5S3ZBl52c=
X-Google-Smtp-Source: AGHT+IHsakElmZNZXg6tWaPdffed3q6eehdNBbS91/o+k90QEJ+G92HBPismmAOKH8alO8lyFFv7OZaI5ksBZxAF2lo=
X-Received: by 2002:a05:690c:284a:b0:6c8:7827:f289 with SMTP id
 00721157ae682-6eee0a15571mr8183727b3.5.1732275395350; Fri, 22 Nov 2024
 03:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-5-naush@raspberrypi.com> <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
In-Reply-To: <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 22 Nov 2024 11:35:59 +0000
Message-ID: <CAEmqJPrfGCB=hKN-+0cG3xFiZxS4BJ_FT=pXnt5U+48wk+A0sw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible
 dummy buffer overrun
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

On Fri, 22 Nov 2024 at 11:20, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Naush
>
> On Fri, Nov 22, 2024 at 08:41:51AM +0000, Naushir Patuck wrote:
> > The Unicam hardware has been observed to cause a buffer overrun when
> > using the dummy buffer as a circular buffer. The conditions that cause
> > the overrun are not fully known, but it seems to occur when the memory
> > bus is heavily loaded.
> >
> > To avoid the overrun, program the hardware with a buffer size of 0 when
> > using the dummy buffer. This will cause overrun into the allocated dummy
> > buffer, but avoid out of bounds writes.
> >
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > ---
> >  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index 550eb1b064f1..f10064107d54 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
> >  static void unicam_wr_dma_addr(struct unicam_node *node,
> >                              struct unicam_buffer *buf)
> >  {
> > -     dma_addr_t endaddr = buf->dma_addr + buf->size;
> > +     /*
> > +      * Due to a HW bug causing buffer overruns in circular buffer mode under
> > +      * certain (not yet fully known) conditions, the dummy buffer allocation
> > +      * is set to a a single page size, but the hardware gets programmed with
> > +      * a buffer size of 0.
> > +      */
> > +     dma_addr_t endaddr = buf->dma_addr +
> > +                          (buf != &node->dummy_buf ? buf->size : 0);
>
> So the DMA engine doesn't actually write any data to dummy_buf
> anymore ?
>
>
> Does it still need to be allocated at all ? Or can we simply set the
> dma transfer size to 0 ?

The DMA engine does still write to the buffer, so the allocation needs
to occur. The zero size programmed into the register is a quirk of the
HW itself, and is used to ensure the write wrap correctly in the
buffer.

Naush

>
> >
> >       if (node->id == UNICAM_IMAGE_NODE) {
> >               unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
> > --
> > 2.34.1
> >
> >

