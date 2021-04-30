Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A95936F624
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 09:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhD3HEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 03:04:30 -0400
Received: from mga12.intel.com ([192.55.52.136]:1089 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231206AbhD3HE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 03:04:29 -0400
IronPort-SDR: cxhfpUA9kd+48UkAGLn70/SAVhS7IsrkkosTLkjAbyrwHBBp4uo3AiIhbBRaHNgZZq/bep1Xsh
 P0Kltbggp51g==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="176697246"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; 
   d="scan'208";a="176697246"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 00:03:41 -0700
IronPort-SDR: J7Fc2bH4kUscPm97/LRSU1qnj7zRZHZV/4m2uHukkibE+IGiG2XW4I9SMuGCXGSTMoLDpPvSB7
 90aftG8YcM3Q==
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; 
   d="scan'208";a="387266731"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 00:03:40 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 25D0D203B0;
        Fri, 30 Apr 2021 10:03:38 +0300 (EEST)
Date:   Fri, 30 Apr 2021 10:03:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, ezequiel.garcia@collabora.com
Subject: Re: [PATCH v2 4/4] v4l: async, fwnode: Improve module organisation
Message-ID: <20210430070338.GD3@paasikivi.fi.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
 <20210312125657.25442-5-sakari.ailus@linux.intel.com>
 <8f28218c90cdf22dd7f3d2cea259f4013ff263c4.camel@collabora.com>
 <20210323192742.GA3@paasikivi.fi.intel.com>
 <d0736505a4814aa2ba19c3c2cd9480d44b0781ef.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0736505a4814aa2ba19c3c2cd9480d44b0781ef.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Sun, Mar 28, 2021 at 10:27:35AM -0300, Ezequiel Garcia wrote:
> On Tue, 2021-03-23 at 21:27 +0200, Sakari Ailus wrote:
> > Hi Ezequiel,
> > 
> > On Tue, Mar 23, 2021 at 02:46:04PM -0300, Ezequiel Garcia wrote:
> > > On Fri, 2021-03-12 at 14:56 +0200, Sakari Ailus wrote:
> > > > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > > > also depends on the former. There is only one exception, the CAFE_CCIC
> > > > driver, which uses V4L2 async but does not need V4L2 fwnode.
> > > > 
> > > > At the same time there is a vast number of systems that need videodev
> > > > module, but have no use for v4l2-async that's now part of videodev.
> > > > 
> > > > In order to improve, build v4l2-async and v4l2-fwnode as a single module
> > > > called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> > > > Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> > > > 
> > > 
> > > Seems this is not what this patch is doing: the symbol is not renamed,
> > > and now we have two modules v4l2-fwnode.ko and v4l2-async.ko, unless
> > > I'm confused.
> > 
> > Oh, well, I changed what the patch does but forgot to update this. :-I
> > 
> > Basically this now splits v4l2-async out of videodev.
> > 
> > > 
> > > I personally was more fond of having just one v4l2-async.ko module,
> > > but I'm not sure if you found any obstacles.
> > > 
> > > > This also moves the initialisation of the debufs entries for async subdevs
> > > > to loading of the v4l2-async module. The directory is named as
> > > > "v4l2-async".
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/i2c/Kconfig            |  8 ++++++++
> > > >  drivers/media/v4l2-core/Kconfig      |  4 ++++
> > > >  drivers/media/v4l2-core/Makefile     | 11 +++++++++--
> > > >  drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++--
> > > >  drivers/media/v4l2-core/v4l2-dev.c   |  5 -----
> > > >  5 files changed, 42 insertions(+), 9 deletions(-)
> > > > 
> > > [..]
> > > > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > > > index e4cd589b99a5..eb5ebb5461fd 100644
> > > > --- a/drivers/media/v4l2-core/Makefile
> > > > +++ b/drivers/media/v4l2-core/Makefile
> > > > @@ -7,15 +7,22 @@ tuner-objs    :=      tuner-core.o
> > > >  
> > > >  videodev-objs  :=      v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> > > >                         v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
> > > > -                       v4l2-async.o v4l2-common.o
> > > > +                       v4l2-common.o
> > > >  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
> > > >  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
> > > >  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
> > > >  videodev-$(CONFIG_SPI) += v4l2-spi.o
> > > >  videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
> > > >  
> > > > -obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> > > >  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> > > > +ifneq ($(findstring y,$(CONFIG_V4L2_ASYNC)$(CONFIG_V4L2_FWNODE)),)
> > > 
> > > Hm, to me this ifdefery is an indication that we are trying
> > > to do something fishy.
> > 
> > What's happening here is that v4l2-fwnode depends on v4l2-async, but for
> > drivers to avoid selecting both, v4l2-async is built if only
> > CONFIG_V4L2_FWNODE is set.
> > 
> > So this perhaps isn't too pretty but it saves hassle in Kconfig files.
> > 
> 
> How about:
> 
> v4l2-async-objs := v4l2-async-core.o
> v4l2-async-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
> 
> config V4L2_FWNODE
>         bool
>         select V4L2_ASYNC

Drivers are using select to enable V4L2_FWNODE. Select will select the
config option but will not care about its dependencies, i.e. V4L2_ASYNC in
this case.

I guess another option could be just to sprinkle both in Kconfig files as
needed.

I'm fraknkly not too concerned about the few lines in the Makefile. If
there's a need to get rid of them, there's always an easy way to get rid of
it.

> 
> config V4L2_ASYNC
>         tristate
> 
> This avoids the ifdefs and expresses the same behavior
> you stated above:
> 
> * v4l2-async is now out of videodev
> * v4l2-fwnode depends on v4l2-async (through select in this case,
>   given they are helper modules).
> * v4l2-async is built if CONFIG_V4L2_FWNODE is set.
> 
> And v4l2-async is a module or built-in, depending on the
> media subsystem (MEDIA_SUPPORT) being module or built-in,
> which I think makes sense.

-- 
Kind regards,

Sakari Ailus
