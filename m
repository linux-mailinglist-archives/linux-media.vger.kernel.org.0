Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD89F19D69F
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 14:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403836AbgDCMV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 08:21:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55678 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbgDCMV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 08:21:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 953162984BA
Message-ID: <a36a825bc048821b4b7088feea71bd31e9e17211.camel@collabora.com>
Subject: Re: [PATCH] cedrus: Drop unneeded CONFIG_OF dependency
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>
Date:   Fri, 03 Apr 2020 09:21:49 -0300
In-Reply-To: <20200403082206.GA626942@aptenodytes>
References: <20200402194653.13535-1-ezequiel@collabora.com>
         <20200403082206.GA626942@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-04-03 at 10:22 +0200, Paul Kocialkowski wrote:
> Hi Ezequiel,
> 
> On Thu 02 Apr 20, 16:46, Ezequiel Garcia wrote:
> > The driver is perfectly capable of being built without CONFIG_OF.
> > Remove this dependency, which is useful for compile-only tests.
> 
> Thanks for the patch!
> 
> Alas, the driver won't do anything useful without OF enabled, so it seems
> useful to keep that dependency.
> 

I'm not convinced about this argument, I like to have
dependencies on things the driver needs to compile
(except the machine option, see below).

> I would suggest making this a: depends on OF || COMPILE_TEST
> instead. What do you think?
> 

Although there are a handful, I don't see many drivers doing that.
To be honest, I don't like this much.

Also, if you want to make sure this driver can only be selected
where it makes sense, you consider having a ARCH_SUNXI || COMPILE_TEST.

IMO, the dependency on OF should be dropped as well.

Cheers,
Eze

> Cheers,
> 
> Paul
> 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging/media/sunxi/cedrus/Kconfig
> > index 17733e9a088f..59b8d1b29865 100644
> > --- a/drivers/staging/media/sunxi/cedrus/Kconfig
> > +++ b/drivers/staging/media/sunxi/cedrus/Kconfig
> > @@ -3,7 +3,6 @@ config VIDEO_SUNXI_CEDRUS
> >  	tristate "Allwinner Cedrus VPU driver"
> >  	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
> >  	depends on HAS_DMA
> > -	depends on OF
> >  	depends on MEDIA_CONTROLLER_REQUEST_API
> >  	select SUNXI_SRAM
> >  	select VIDEOBUF2_DMA_CONTIG
> > -- 
> > 2.26.0.rc2
> > 


