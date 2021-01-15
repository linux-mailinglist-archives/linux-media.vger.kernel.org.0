Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD682F87E4
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 22:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbhAOVte (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 16:49:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51526 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbhAOVte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 16:49:34 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9178858B;
        Fri, 15 Jan 2021 22:48:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610747331;
        bh=E2nJPXoeI0w+X4GetsqfJnMDZCkC2pS+PvUrW4KNNT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TwI5xLdpjkl6mebXxtAm2lsGRJmLDKxl6i7s9LIqu8bLcdvXc0Hz6+fTvrle5+cfP
         zyGZ1UjQHEylQWeGOh8SebtTwSupnRGDgTE24QJO8q4CDFym8at6qCUykSeSW1nkHX
         z1Ztd946mt/+HHtGFnyyDQvhzFxQjsmY9uVSj3pA=
Date:   Fri, 15 Jan 2021 23:48:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-async: Improve
 v4l2_async_notifier_add_*_subdev() API
Message-ID: <YAINsr+dI/ang2og@pendragon.ideasonboard.com>
References: <20210114030719.28172-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210115095621.GQ11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115095621.GQ11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jan 15, 2021 at 11:56:21AM +0200, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the patch. It's a really nice improvement.
> 
> On Thu, Jan 14, 2021 at 05:07:19AM +0200, Laurent Pinchart wrote:
> > The functions that add an async subdev to an async subdev notifier take
> > as an argument the size of the container structure they need to
> > allocate. This is error prone, as passing an invalid size will not be
> > caught by the compiler. Wrap those functions in macros that take a
> > container type instead of a size, and cast the returned pointer to the
> > desired type. The compiler will catch mistakes if the incorrect type is
> > passed to the macro, as the assignment types won't match.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> > This patch is based on top of Ezequiel's "[PATCH 00/13] V4L2 Async
> > notifier API cleanup" series. It makes errors such as the one fixed by
> > "[PATCH] media: ti-vpe: cal: fix write to unallocated memory" impossible
> > to occur in the first place.
> > 
> >  drivers/media/i2c/max9286.c                   |  2 +-
> >  drivers/media/i2c/st-mipid02.c                |  2 +-
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 10 ++---
> >  drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
> >  drivers/media/platform/atmel/atmel-isi.c      |  2 +-
> >  .../media/platform/atmel/atmel-sama5d2-isc.c  |  2 +-
> >  drivers/media/platform/cadence/cdns-csi2rx.c  |  3 +-
> >  drivers/media/platform/davinci/vpif_capture.c |  2 +-
> >  drivers/media/platform/exynos4-is/media-dev.c |  3 +-
> >  .../media/platform/marvell-ccic/cafe-driver.c |  2 +-
> >  .../media/platform/marvell-ccic/mmp-driver.c  |  4 +-
> >  drivers/media/platform/omap3isp/isp.c         | 16 +++-----
> >  drivers/media/platform/pxa_camera.c           |  4 +-
> >  drivers/media/platform/qcom/camss/camss.c     | 11 ++----
> >  drivers/media/platform/rcar-vin/rcar-core.c   |  5 ++-
> >  drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
> >  drivers/media/platform/rcar_drif.c            |  2 +-
> >  drivers/media/platform/renesas-ceu.c          | 20 ++++------
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 10 ++---
> >  drivers/media/platform/stm32/stm32-dcmi.c     |  3 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +-
> >  drivers/media/platform/ti-vpe/cal.c           | 12 +++---
> >  drivers/media/platform/video-mux.c            |  2 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   | 10 ++---
> >  drivers/media/v4l2-core/v4l2-async.c          | 38 +++++++++----------
> >  drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
> >  drivers/staging/media/imx/imx-media-csi.c     |  2 +-
> >  drivers/staging/media/imx/imx-media-of.c      |  2 +-
> >  drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
> >  drivers/staging/media/imx/imx7-media-csi.c    |  2 +-
> >  drivers/staging/media/imx/imx7-mipi-csis.c    |  2 +-
> >  drivers/staging/media/tegra-video/vi.c        | 10 ++---
> >  include/media/v4l2-async.h                    | 36 ++++++++++++------
> >  33 files changed, 116 insertions(+), 117 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index c82c1493e099..c31858548d34 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -580,7 +580,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
> >  
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> >  							    source->fwnode,
> > -							    sizeof(*asd));
> > +							    struct v4l2_async_subdev);
> 
> Would it be possible to use *asd here instead?

Is that really better ? I mean, we could add even more shortcuts by
defining the macro as

#define v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep, __var) \
__var = (typeof(var)__v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep, \
                                                         sizeof(*__var)))

and using it as

		v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
						      source->fwnode, asd);

but at some point it becomes confusing. Passing a struct type to a macro
is a fairly well established practice in the kernel, I think it would be
best to stick to it.

> You'd need typeof(), too.
> 
> Same for the rest.

-- 
Regards,

Laurent Pinchart
