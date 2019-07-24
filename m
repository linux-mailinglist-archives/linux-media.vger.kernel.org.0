Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBC97370C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 20:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbfGXSz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 14:55:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:43298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbfGXSz7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 14:55:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2806821841;
        Wed, 24 Jul 2019 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563994558;
        bh=GgYLktbjTBkYgCVChbyiHJpTl/bxCXYku5nBzDfyRt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P46Ee79rSFjOLHYBUUJBdY4ZA61cUWKAhuv3XpnLO9i4YCjbOQ3H3RZV/FBWMPv3Z
         PewBY6bD3voCVZiedzT/hCGgmVklm6wnH77NkjKB/Xa4hr7CKeR/W9D4pH/b0ViGkr
         LdvvfGcrfM1LToBhB1GlwpfaW8eJ4YupAZ/UGk6Q=
Date:   Wed, 24 Jul 2019 20:55:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Joe Perches <joe@perches.com>
Cc:     devel@driverdev.osuosl.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 11/12] staging: media: cedrus: Fix misuse of GENMASK macro
Message-ID: <20190724185556.GA5486@kroah.com>
References: <cover.1562734889.git.joe@perches.com>
 <cd543a5f26b031a0bbd3baa55e1f15813f59f107.1562734889.git.joe@perches.com>
 <be536d37a3b58557cdacd33943915d397bcb5037.camel@perches.com>
 <20190724183522.GA30299@kroah.com>
 <90a8807311ba434a63c9ab6331396d7094492323.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90a8807311ba434a63c9ab6331396d7094492323.camel@perches.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 24, 2019 at 11:39:03AM -0700, Joe Perches wrote:
> On Wed, 2019-07-24 at 20:35 +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 24, 2019 at 10:09:44AM -0700, Joe Perches wrote:
> > > On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > > > Arguments are supposed to be ordered high then low.
> > > > 
> > > > Signed-off-by: Joe Perches <joe@perches.com>
> > > > ---
> > > >  drivers/staging/media/sunxi/cedrus/cedrus_regs.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > > index 3e9931416e45..ddd29788d685 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > > @@ -110,7 +110,7 @@
> > > >  #define VE_DEC_MPEG_MBADDR			(VE_ENGINE_DEC_MPEG + 0x10)
> > > >  
> > > >  #define VE_DEC_MPEG_MBADDR_X(w)			(((w) << 8) & GENMASK(15, 8))
> > > > -#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(0, 7))
> > > > +#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(7, 0))
> > > >  
> > > >  #define VE_DEC_MPEG_CTRL			(VE_ENGINE_DEC_MPEG + 0x14)
> > > 
> > > Greg?  ping?
> > >  
> > > 
> > 
> > I am not the maintainer of drivers/staging/media, that is Mauro.
> 
> Maybe you want:
> ---
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f7dc5bad396a..2fb95ad6ebef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15312,6 +15312,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>  L:	devel@driverdev.osuosl.org
>  S:	Supported
>  F:	drivers/staging/
> +X:	drivers/staging/media/
>  

Not really, it's nice to see the patches flow by :)
