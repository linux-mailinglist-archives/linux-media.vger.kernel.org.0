Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0D03C3D9F
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 17:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbhGKP2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jul 2021 11:28:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:48414 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235631AbhGKP2P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jul 2021 11:28:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="190262880"
X-IronPort-AV: E=Sophos;i="5.84,231,1620716400"; 
   d="scan'208";a="190262880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2021 08:25:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,231,1620716400"; 
   d="scan'208";a="411841430"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2021 08:25:25 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C755020556;
        Sun, 11 Jul 2021 18:25:19 +0300 (EEST)
Date:   Sun, 11 Jul 2021 18:25:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 07/27] media: entity: Use pad as the starting point
 for a pipeline
Message-ID: <20210711152519.GB3@paasikivi.fi.intel.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-8-tomi.valkeinen@ideasonboard.com>
 <20210708123620.vltqnczhrsh3yl4s@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708123620.vltqnczhrsh3yl4s@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Jul 08, 2021 at 02:36:20PM +0200, Jacopo Mondi wrote:
> Hello Tomi,
>     A few minors and a question below
> 
> On Mon, May 24, 2021 at 01:43:48PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > The pipeline has been moved from the entity to the pads; reflect this in
> > the media pipeline function API.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  Documentation/driver-api/media/mc-core.rst    |  6 ++--
> >  drivers/media/mc/mc-entity.c                  | 24 ++++++-------
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  6 ++--
> >  .../media/platform/exynos4-is/fimc-capture.c  |  8 ++---
> >  .../platform/exynos4-is/fimc-isp-video.c      |  8 ++---
> >  drivers/media/platform/exynos4-is/fimc-lite.c |  8 ++---
> >  drivers/media/platform/omap3isp/ispvideo.c    |  6 ++--
> >  .../media/platform/qcom/camss/camss-video.c   |  6 ++--
> >  drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++--
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c |  6 ++--
> >  .../media/platform/s3c-camif/camif-capture.c  |  6 ++--
> >  drivers/media/platform/stm32/stm32-dcmi.c     |  6 ++--
> >  .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
> >  .../platform/sunxi/sun6i-csi/sun6i_video.c    |  6 ++--
> >  drivers/media/platform/ti-vpe/cal-video.c     |  6 ++--
> >  drivers/media/platform/vsp1/vsp1_video.c      |  6 ++--
> >  drivers/media/platform/xilinx/xilinx-dma.c    |  6 ++--
> >  .../media/test-drivers/vimc/vimc-capture.c    |  6 ++--
> >  drivers/media/usb/au0828/au0828-core.c        |  8 ++---
> >  drivers/staging/media/imx/imx-media-utils.c   |  6 ++--
> >  drivers/staging/media/ipu3/ipu3-v4l2.c        |  6 ++--
> >  drivers/staging/media/omap4iss/iss_video.c    |  6 ++--
> >  drivers/staging/media/tegra-video/tegra210.c  |  6 ++--
> >  include/media/media-entity.h                  | 34 +++++++++----------
> >  24 files changed, 98 insertions(+), 100 deletions(-)
> >
> > diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> > index 8a13640bed56..69a64279a61f 100644
> > --- a/Documentation/driver-api/media/mc-core.rst
> > +++ b/Documentation/driver-api/media/mc-core.rst
> > @@ -213,11 +213,11 @@ When starting streaming, drivers must notify all entities in the pipeline to
> >  prevent link states from being modified during streaming by calling
> >  :c:func:`media_pipeline_start()`.
> >
> > -The function will mark all entities connected to the given entity through
> > -enabled links, either directly or indirectly, as streaming.
> > +The function will mark all entities connected to the given pad through
> 
> As the stream_count counter is now moved to the pads, should this be
> 
> +The function will mark all the pads connected to the given pad through

Yes.

> 
> > +enabled routes and links, either directly or indirectly, as streaming.
> >
> >  The struct media_pipeline instance pointed to by
> > -the pipe argument will be stored in every entity in the pipeline.
> > +the pipe argument will be stored in every pad in the pipeline.
> >  Drivers should embed the struct media_pipeline
> 
> Does this still apply ?

Yes.

> 
> >  in higher-level pipeline structures and can then access the
> >  pipeline through the struct media_entity
> 
> This sentence should probably be changed to
> 
> pipeline through the struct media_pad pipe field.

Yes.

> 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index ea1cf7f63ae8..e6451903359c 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -404,12 +404,11 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
> >   * Pipeline management
> >   */
> >
> > -__must_check int __media_pipeline_start(struct media_entity *entity,
> > +__must_check int __media_pipeline_start(struct media_pad *pad,
> >  					struct media_pipeline *pipe)
> >  {
> > -	struct media_device *mdev = entity->graph_obj.mdev;
> > +	struct media_device *mdev = pad->graph_obj.mdev;
> >  	struct media_graph *graph = &pipe->graph;
> > -	struct media_pad *pad = entity->pads;
> >  	struct media_pad *pad_err = pad;
> >  	struct media_link *link;
> >  	int ret;
> > @@ -542,24 +541,23 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
> >  }
> >  EXPORT_SYMBOL_GPL(__media_pipeline_start);
> >
> > -__must_check int media_pipeline_start(struct media_entity *entity,
> > +__must_check int media_pipeline_start(struct media_pad *pad,
> >  				      struct media_pipeline *pipe)
> 
> As it seems that even with the full series applied
> media_pipeline_start() is always called with entity->pads as its first
> argument, I wonder if it wouldn't be more linear for a driver to keep
> using entity and have this function here pass the entity's pads to
> __media_pipeline_start().
> 
> Do we expect drivers to actually start the pipeline using a specific
> pad ?

The pipeline is moved to pads with this patch, and therefore it's logical
to do start from pads, too. Should there be more than one, figuring out
which one to use would not be possible.

-- 
Sakari Ailus
