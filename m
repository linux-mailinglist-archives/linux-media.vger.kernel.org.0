Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F2875507
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 19:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfGYRDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 13:03:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38372 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfGYRDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 13:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+NJ/X1Vx/ZNAPT3c2YqD0OKL9PPx4Sk1QYFSGZtMSc4=; b=jOhgC47S+KE5Ihuz26ddPHwo1
        lh/N6xH55L244KOI+EcX2fHCnKetVMqnJjhueC9uIWthpyrA7l//NaHNjsMWKtOonFFcbhzZaqpBA
        u38ydcXynH29hee2/s3BASkQadtoIo/J+/MyfoQAwRspC9aiGSaIExbWTHXJ6z0QbAEmlJFbmw0XI
        +L3qpt7wDpijtiKrFaWqGZHO/8DbOFwrVoJe33UsYv13Dk/zquhkB4XR4gk/4uzcFR/yHGSz8yapv
        e+VJtstQk/jEPercfPefowdRDt9TydyDItk3Iy5hHX5LoyZQ0qZG2HJoXJF9PSuDAGTO3QWRvVklv
        7mlcyl6Qg==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqh92-000772-0c; Thu, 25 Jul 2019 17:03:08 +0000
Date:   Thu, 25 Jul 2019 14:03:04 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/6] media: v4l2-core: Module re-organization
Message-ID: <20190725140304.2443e337@coco.lan>
In-Reply-To: <dda7c97b491935a7bee85cfa4400c81bb96a5adf.camel@collabora.com>
References: <20190715210649.31681-1-ezequiel@collabora.com>
        <20190715210649.31681-3-ezequiel@collabora.com>
        <20190725133137.4a99dc05@coco.lan>
        <dda7c97b491935a7bee85cfa4400c81bb96a5adf.camel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 25 Jul 2019 13:41:34 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> On Thu, 2019-07-25 at 13:31 -0300, Mauro Carvalho Chehab wrote:
> > Em Mon, 15 Jul 2019 18:06:43 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >   
> > > videodev.ko and v4l2-common.ko driver are built under
> > > the same conditions. Therefore, it doesn't make much sense
> > > to split them in two different modules.
> > > 
> > > Splitting v4l2-common to its own driver has done many
> > > years ago:
> > > 
> > >   commit a9254475bbfbed5f0596d952c6a3c9806e19dd0b
> > >   Author: Mauro Carvalho Chehab <mchehab@infradead.org>
> > >   Date:   Tue Jan 29 18:32:35 2008 -0300
> > > 
> > >       V4L/DVB (7115): Fix bug #9833: regression when compiling V4L without I2C
> > > 
> > > Back then, the subsystem organization was different.
> > > However, With the current organization, there is no issue
> > > compiling V4L2 with I2C as y/m/n.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/v4l2-core/Makefile | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > > index 4d42418e603e..8e2f52f7800b 100644
> > > --- a/drivers/media/v4l2-core/Makefile
> > > +++ b/drivers/media/v4l2-core/Makefile
> > > @@ -7,14 +7,13 @@ tuner-objs	:=	tuner-core.o
> > >  
> > >  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> > >  			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o v4l2-clk.o \
> > > -			v4l2-async.o
> > > +			v4l2-async.o v4l2-common.o
> > >  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
> > >  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
> > >  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
> > >  
> > >  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> > >  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> > > -obj-$(CONFIG_VIDEO_V4L2) += v4l2-common.o
> > >  obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
> > >  
> > >  obj-$(CONFIG_VIDEO_TUNER) += tuner.o  
> > 
> > Huh? This patch sounds incomplete... Where are you removing the
> > MODULE_foo macros) from v4l2-common.c?
> >   
> 
> If you are refering to:
> 
> MODULE_AUTHOR("Bill Dirks, Justin Schoeman, Gerd Knorr");
> MODULE_DESCRIPTION("misc helper functions for v4l2 device drivers");
> MODULE_LICENSE("GPL");
> 
> I decided to keep them for documentation purposes,
> but more importantly because they were already there
> before commit a9254475bbfbed5f0596d952c6a3c9806e19dd0b
> (when v4l2-common.c was not a module, afaics).
> 
> Do you think we should remove them?

Well, it needs to be handled somehow. Please notice, however, that
there are some differences between v4l2-common and v4l2-dev:

drivers/media/v4l2-core/v4l2-common.c:MODULE_AUTHOR("Bill Dirks, Justin Schoeman, Gerd Knorr");
drivers/media/v4l2-core/v4l2-common.c:MODULE_DESCRIPTION("misc helper functions for v4l2 device drivers");
drivers/media/v4l2-core/v4l2-common.c:MODULE_LICENSE("GPL");
drivers/media/v4l2-core/v4l2-common.c:	request_module(I2C_MODULE_PREFIX "%s", info->type);
drivers/media/v4l2-core/v4l2-dev.c:MODULE_AUTHOR("Alan Cox, Mauro Carvalho Chehab <mchehab@kernel.org>");
drivers/media/v4l2-core/v4l2-dev.c:MODULE_DESCRIPTION("Device registrar for Video4Linux drivers v2");
drivers/media/v4l2-core/v4l2-dev.c:MODULE_LICENSE("GPL");
drivers/media/v4l2-core/v4l2-dev.c:MODULE_ALIAS_CHARDEV_MAJOR(VIDEO_MAJOR);

So, you can't simply remove. You'll probably need to touch
both files, do some cleanup and keep some things under the
licensing comment at the top of the file (if not there yet).

Thanks,
Mauro
