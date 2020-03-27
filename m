Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9391D1958AE
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 15:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgC0OKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 10:10:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47284 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgC0OKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 10:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=AnRhIg5RFm3Qrmnieov4E28AVf0Oay6d4xBVbwT6Ib8=; b=I+lMVe6WHg2ORatRALBx73Uwfe
        PLBUIk7eiW0elbpwfhczMcTrsKaUhkR28D33yjkLvAKlBmrS6lWqBy0sbDdEdObb/eO1rWX93fqDj
        7AK7WNufeo9ygdfvwOg9n2gM2BqSylQj4lD3lXhM+ZroZKicuc0W1ypP8PEv3ri1xKvEPIuJLNn43
        djvYCLfS2tar5jC+h1sEdo4NFN1dZXuARAffHJit7et69qRd+qcCX9t8fQavtp0XuMOU+GspAYPZB
        NZX7vlg6EvWId8ono6jADqvpX+CsDskmHbcOXbQT61YV1B5/ohBzroaZ8ISSXnQjNxU/s9gw9ISwC
        WfaS+FyQ==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHpgo-000443-Hr; Fri, 27 Mar 2020 14:10:26 +0000
Date:   Fri, 27 Mar 2020 15:10:20 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Ira Krufky <mkrufky@gmail.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH 2/2] media: Remove VIDEO_DEV unneeded dependency
Message-ID: <20200327151020.231cf045@coco.lan>
In-Reply-To: <c82b6c7be2e2f05c6924df00256caee6c5e32b23.camel@collabora.com>
References: <20200323211022.28297-1-ezequiel@collabora.com>
        <20200323211022.28297-3-ezequiel@collabora.com>
        <20200324104722.1c605792@coco.lan>
        <0336a046563a3d0556c988a67be2642194831710.camel@collabora.com>
        <c82b6c7be2e2f05c6924df00256caee6c5e32b23.camel@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 27 Mar 2020 10:47:44 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Hi Mauro,
> 
> On Tue, 2020-03-24 at 07:18 -0300, Ezequiel Garcia wrote:
> > On Tue, 2020-03-24 at 10:47 +0100, Mauro Carvalho Chehab wrote:  
> > > Em Mon, 23 Mar 2020 18:10:22 -0300
> > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > >   
> > > > Enable VIDEO_DEV (which compiles Video4Linux core)
> > > > when MEDIA_SUPPORT is selected. This is needed, in order
> > > > to be able to enable devices such as stateless codecs.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > >  drivers/media/Kconfig | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > > > index b36a41332867..7de472ad07a2 100644
> > > > --- a/drivers/media/Kconfig
> > > > +++ b/drivers/media/Kconfig
> > > > @@ -93,13 +93,11 @@ source "drivers/media/mc/Kconfig"
> > > >  
> > > >  #
> > > >  # Video4Linux support
> > > > -#	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
> > > >  #
> > > >  
> > > >  config VIDEO_DEV
> > > >  	tristate
> > > >  	depends on MEDIA_SUPPORT
> > > > -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> > > >  	default y
> > > >  
> > > >  config VIDEO_V4L2_SUBDEV_API  
> > > 
> > > The rationale of the above is to exclude Digital TV and remote
> > > controller.
> > > 
> > > Removing the above will make the V4L2 core available every time, even
> > > if all the user wants is remote controller or Digital TV support.
> > >   
> > 
> > Hm, right.
> >   
> > > I'm working on a patchset that should hopefully address the issues
> > > you're concerning.
> > >   
> > 
> > Thanks, I'll appreciate that.
> >   
> 
> It seems the config rework you sent will undergo some
> extended discussions, which is fine given it's a full rework.
> 
> I'd like to send a smaller (ideally just one or two patches)
> series, so we can improve the situation on codecs on a smaller
> timeframe.

I won't be merging anything new until the end of the merge
window. So, we have around 20 days where no patches will
be merged at linux media (except by critical bug fixes,
merge conflicts, build breakages and similar stuff).

So, there are plenty of time to review such series.

Thanks,
Mauro
