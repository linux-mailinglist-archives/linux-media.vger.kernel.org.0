Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42083346901
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 20:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbhCWT16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 15:27:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:40450 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232742AbhCWT1q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 15:27:46 -0400
IronPort-SDR: MX3vijo/tEQlDHm4lhQwA8s2RQxFqCT8TeU1YrwOvpqlI0q2eOCXHYebKJtaNqv1RLm1+qg5bk
 sCKUOBlk7qRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="210638257"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="210638257"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 12:27:46 -0700
IronPort-SDR: rA+QKtIDAHxoWazssGoA61xpXO85FBmRLbqsId+RciPE1bvLzd+R0pWKNEqh7LZsLbn3B/ybfH
 /1QyfobjlG6w==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="604406443"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 12:27:44 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C705920168;
        Tue, 23 Mar 2021 21:27:42 +0200 (EET)
Date:   Tue, 23 Mar 2021 21:27:42 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, ezequiel.garcia@collabora.com
Subject: Re: [PATCH v2 4/4] v4l: async, fwnode: Improve module organisation
Message-ID: <20210323192742.GA3@paasikivi.fi.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
 <20210312125657.25442-5-sakari.ailus@linux.intel.com>
 <8f28218c90cdf22dd7f3d2cea259f4013ff263c4.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f28218c90cdf22dd7f3d2cea259f4013ff263c4.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Mar 23, 2021 at 02:46:04PM -0300, Ezequiel Garcia wrote:
> On Fri, 2021-03-12 at 14:56 +0200, Sakari Ailus wrote:
> > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > also depends on the former. There is only one exception, the CAFE_CCIC
> > driver, which uses V4L2 async but does not need V4L2 fwnode.
> > 
> > At the same time there is a vast number of systems that need videodev
> > module, but have no use for v4l2-async that's now part of videodev.
> > 
> > In order to improve, build v4l2-async and v4l2-fwnode as a single module
> > called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> > Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> > 
> 
> Seems this is not what this patch is doing: the symbol is not renamed,
> and now we have two modules v4l2-fwnode.ko and v4l2-async.ko, unless
> I'm confused.

Oh, well, I changed what the patch does but forgot to update this. :-I

Basically this now splits v4l2-async out of videodev.

> 
> I personally was more fond of having just one v4l2-async.ko module,
> but I'm not sure if you found any obstacles.
> 
> > This also moves the initialisation of the debufs entries for async subdevs
> > to loading of the v4l2-async module. The directory is named as
> > "v4l2-async".
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/Kconfig            |  8 ++++++++
> >  drivers/media/v4l2-core/Kconfig      |  4 ++++
> >  drivers/media/v4l2-core/Makefile     | 11 +++++++++--
> >  drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++--
> >  drivers/media/v4l2-core/v4l2-dev.c   |  5 -----
> >  5 files changed, 42 insertions(+), 9 deletions(-)
> > 
> [..]
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index e4cd589b99a5..eb5ebb5461fd 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -7,15 +7,22 @@ tuner-objs    :=      tuner-core.o
> >  
> >  videodev-objs  :=      v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> >                         v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
> > -                       v4l2-async.o v4l2-common.o
> > +                       v4l2-common.o
> >  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
> >  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
> >  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
> >  videodev-$(CONFIG_SPI) += v4l2-spi.o
> >  videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
> >  
> > -obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> >  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> > +ifneq ($(findstring y,$(CONFIG_V4L2_ASYNC)$(CONFIG_V4L2_FWNODE)),)
> 
> Hm, to me this ifdefery is an indication that we are trying
> to do something fishy.

What's happening here is that v4l2-fwnode depends on v4l2-async, but for
drivers to avoid selecting both, v4l2-async is built if only
CONFIG_V4L2_FWNODE is set.

So this perhaps isn't too pretty but it saves hassle in Kconfig files.

-- 
Kind regards,

Sakari Ailus
