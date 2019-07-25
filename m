Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDE57544C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 18:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389386AbfGYQlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 12:41:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45994 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388123AbfGYQlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 12:41:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 55D4828BC12
Message-ID: <dda7c97b491935a7bee85cfa4400c81bb96a5adf.camel@collabora.com>
Subject: Re: [PATCH 2/6] media: v4l2-core: Module re-organization
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        linux-media@vger.kernel.org
Date:   Thu, 25 Jul 2019 13:41:34 -0300
In-Reply-To: <20190725133137.4a99dc05@coco.lan>
References: <20190715210649.31681-1-ezequiel@collabora.com>
         <20190715210649.31681-3-ezequiel@collabora.com>
         <20190725133137.4a99dc05@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-07-25 at 13:31 -0300, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Jul 2019 18:06:43 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > videodev.ko and v4l2-common.ko driver are built under
> > the same conditions. Therefore, it doesn't make much sense
> > to split them in two different modules.
> > 
> > Splitting v4l2-common to its own driver has done many
> > years ago:
> > 
> >   commit a9254475bbfbed5f0596d952c6a3c9806e19dd0b
> >   Author: Mauro Carvalho Chehab <mchehab@infradead.org>
> >   Date:   Tue Jan 29 18:32:35 2008 -0300
> > 
> >       V4L/DVB (7115): Fix bug #9833: regression when compiling V4L without I2C
> > 
> > Back then, the subsystem organization was different.
> > However, With the current organization, there is no issue
> > compiling V4L2 with I2C as y/m/n.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/Makefile | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index 4d42418e603e..8e2f52f7800b 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -7,14 +7,13 @@ tuner-objs	:=	tuner-core.o
> >  
> >  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> >  			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o v4l2-clk.o \
> > -			v4l2-async.o
> > +			v4l2-async.o v4l2-common.o
> >  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
> >  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
> >  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
> >  
> >  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> >  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> > -obj-$(CONFIG_VIDEO_V4L2) += v4l2-common.o
> >  obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
> >  
> >  obj-$(CONFIG_VIDEO_TUNER) += tuner.o
> 
> Huh? This patch sounds incomplete... Where are you removing the
> MODULE_foo macros) from v4l2-common.c?
> 

If you are refering to:

MODULE_AUTHOR("Bill Dirks, Justin Schoeman, Gerd Knorr");
MODULE_DESCRIPTION("misc helper functions for v4l2 device drivers");
MODULE_LICENSE("GPL");

I decided to keep them for documentation purposes,
but more importantly because they were already there
before commit a9254475bbfbed5f0596d952c6a3c9806e19dd0b
(when v4l2-common.c was not a module, afaics).

Do you think we should remove them?

Thanks,
Ezequiel

