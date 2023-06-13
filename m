Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3553C72E8A8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 18:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbjFMQk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 12:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjFMQkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 12:40:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEE51995
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686674401; x=1718210401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t1n+sod6Vbco3xMfTmHY7ZVmT+74LncsmxhLMvy0jP4=;
  b=l1VyIr5wlXas7TzX4H+sPko1iMIsYdpEMIpqNnQ3zaY2fbq/MYu4Uwar
   QBK00j14e7LyMFhhzVEYw8dD4ethgh4cV5wWOp+6qCqyAFoxPJNUNqIkk
   1g/fhPalDs2bEqDPM6J+B7XbtnAFGsMPbvX6ljh11i1htXhqP8oN2mh+T
   HmNI/QMGECPNnKUDydmfVi61o7zxl7YUsI/nbS49g7j3dkGW4hzcC9l0g
   vYVl4+Dg7Dw/134ARSiImMdEMCOynrR7/ydUZTCoaiQ34bb5DP4m+ztTl
   rcsBXTN0mG2SJmfyrIWau1cMEYB0buCTpao1uS5i22M1O2rDvZTw8aEZr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348047947"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="348047947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744748856"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="744748856"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:39:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A5679120C1C;
        Tue, 13 Jun 2023 19:39:48 +0300 (EEST)
Date:   Tue, 13 Jun 2023 16:39:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 14/32] media: v4l: async: Rename
 v4l2_async_subdev as v4l2_async_connection
Message-ID: <ZIib1Ej45pnLAX2u@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-15-sakari.ailus@linux.intel.com>
 <20230530055003.GS21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530055003.GS21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review, again.

On Tue, May 30, 2023 at 08:50:03AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:57PM +0300, Sakari Ailus wrote:
> > Rename v4l2_async_subdev as v4l2_async_connection, in order to
> > differentiate between the sub-devices and their connections: one
> > sub-device can have many connections but the V4L2 async framework has so
> > far allowed just a single one. Connections in this context will later
> > translate into either MC ancillary or data links.
> > 
> > This patch prepares changing that relation by changing existing users of
> > v4l2_async_subdev to switch to v4l2_async_connection. Async sub-devices
> > themselves will not be needed anymore
> > 
> > Additionally, __v4l2_async_nf_add_subdev() has been renamed as
> 
> s/renamed as/renamed to/
> 
> > __v4l2_async_nf_add_connection().

Actually I think there should be no preposition at all here.

> 
> I still don't like the name "connection" at all :-( It may seem fine as
> you've been working on this extensively, but for people less familiar
> with v4l2-async (myself included), I fear it will make the framework
> more difficult to understand.
> 
> At the very least I'd like a detailed and clear glossary, to explain
> what a connection *is*. The v4l2-async documentation is fairly bad (and
> what is currently documented in v4l2-subdev.rst should likely be moved
> to v4l2-async.rst).

That's a fair point. I'll add documentation on this.

What I do like with this is that there's now a clear separation between the
placeholder registered with the notifier and the sub-device itself. That
used to be sometimes a bit confusing.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          |  12 +-
> >  drivers/media/i2c/max9286.c                   |   9 +-
> >  drivers/media/i2c/st-mipid02.c                |   8 +-
> >  drivers/media/i2c/tc358746.c                  |   6 +-
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  10 +-
> >  drivers/media/platform/atmel/atmel-isi.c      |   8 +-
> >  drivers/media/platform/atmel/atmel-isi.h      |   2 +-
> >  drivers/media/platform/cadence/cdns-csi2rx.c  |   6 +-
> >  drivers/media/platform/intel/pxa_camera.c     |  12 +-
> >  drivers/media/platform/marvell/cafe-driver.c  |   5 +-
> >  drivers/media/platform/marvell/mcam-core.c    |   4 +-
> >  drivers/media/platform/marvell/mmp-driver.c   |   4 +-
> >  .../platform/microchip/microchip-csi2dc.c     |   6 +-
> >  .../platform/microchip/microchip-isc-base.c   |   4 +-
> >  .../media/platform/microchip/microchip-isc.h  |   2 +-
> >  .../microchip/microchip-sama5d2-isc.c         |   4 +-
> >  .../microchip/microchip-sama7g5-isc.c         |   4 +-
> >  drivers/media/platform/nxp/imx-mipi-csis.c    |   6 +-
> >  drivers/media/platform/nxp/imx7-media-csi.c   |   6 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-core.c     |   8 +-
> >  drivers/media/platform/qcom/camss/camss.c     |   2 +-
> >  drivers/media/platform/qcom/camss/camss.h     |   2 +-
> >  drivers/media/platform/renesas/rcar-isp.c     |   8 +-
> >  .../platform/renesas/rcar-vin/rcar-core.c     |  44 ++---
> >  .../platform/renesas/rcar-vin/rcar-csi2.c     |  16 +-
> >  .../platform/renesas/rcar-vin/rcar-vin.h      |   8 +-
> >  drivers/media/platform/renesas/rcar_drif.c    |   8 +-
> >  drivers/media/platform/renesas/renesas-ceu.c  |   6 +-
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  10 +-
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 +-
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   8 +-
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |   8 +-
> >  .../platform/samsung/exynos4-is/media-dev.c   |   6 +-
> >  .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
> >  drivers/media/platform/st/stm32/stm32-dcmi.c  |   8 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   6 +-
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   2 +-
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   6 +-
> >  .../sun8i_a83t_mipi_csi2.c                    |   6 +-
> >  .../media/platform/ti/am437x/am437x-vpfe.c    |   5 +-
> >  .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
> >  drivers/media/platform/ti/cal/cal.c           |   6 +-
> >  .../media/platform/ti/davinci/vpif_capture.c  |   7 +-
> >  drivers/media/platform/ti/omap3isp/isp.h      |   2 +-
> >  drivers/media/platform/video-mux.c            |   6 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   |  22 +--
> >  drivers/media/v4l2-core/v4l2-async.c          | 159 +++++++++---------
> >  drivers/media/v4l2-core/v4l2-fwnode.c         |   8 +-
> >  .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
> >  .../media/deprecated/atmel/atmel-isc.h        |   2 +-
> >  .../deprecated/atmel/atmel-sama5d2-isc.c      |   4 +-
> >  .../deprecated/atmel/atmel-sama7g5-isc.c      |   4 +-
> >  drivers/staging/media/imx/imx-media-csi.c     |   6 +-
> >  .../staging/media/imx/imx-media-dev-common.c  |   2 +-
> >  drivers/staging/media/imx/imx-media-dev.c     |   2 +-
> >  drivers/staging/media/imx/imx-media-of.c      |   4 +-
> >  drivers/staging/media/imx/imx6-mipi-csi2.c    |   8 +-
> >  drivers/staging/media/imx/imx8mq-mipi-csi2.c  |   6 +-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   2 +-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   2 +-
> >  drivers/staging/media/tegra-video/vi.c        |  14 +-
> >  drivers/staging/media/tegra-video/vi.h        |   2 +-
> >  include/media/davinci/vpif_types.h            |   2 +-
> >  include/media/v4l2-async.h                    |  66 ++++----
> >  include/media/v4l2-fwnode.h                   |   2 +-
> >  include/media/v4l2-subdev.h                   |   5 +-
> >  68 files changed, 320 insertions(+), 322 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index ce8e9d0a332bc..83d3d29608136 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -214,14 +214,14 @@ notifier and further registers async sub-devices for lens and flash devices
> >  found in firmware. The notifier for the sub-device is unregistered with the
> >  async sub-device.
> >  
> > -These functions allocate an async sub-device descriptor which is of type struct
> > -:c:type:`v4l2_async_subdev` embedded in a driver-specific struct. The &struct
> > -:c:type:`v4l2_async_subdev` shall be the first member of this struct:
> > +These functions allocate an async connection descriptor which is of type struct
> > +:c:type:`v4l2_async_connection` embedded in a driver-specific struct. The &struct
> > +:c:type:`v4l2_async_connection` shall be the first member of this struct:
> >  
> >  .. code-block:: c
> >  
> >  	struct my_async_subdev {
> > -		struct v4l2_async_subdev asd;
> > +		struct v4l2_async_connection asd;
> 
> s/asd/asc/

Yes.

There are other minor issues in the example, I'll address them in a
separate patch.

> 
> >  		...
> >  	};
> >  
> > @@ -244,10 +244,10 @@ notifier callback is called. After all subdevices have been located the
> >  system the .unbind() method is called. All three callbacks are optional.
> >  
> >  Drivers can store any type of custom data in their driver-specific
> > -:c:type:`v4l2_async_subdev` wrapper. If any of that data requires special
> > +:c:type:`v4l2_async_connection` wrapper. If any of that data requires special
> >  handling when the structure is freed, drivers must implement the ``.destroy()``
> >  notifier callback. The framework will call it right before freeing the
> > -:c:type:`v4l2_async_subdev`.
> > +:c:type:`v4l2_async_connection`.
> >  
> >  Calling subdev operations
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 64f5c49cae776..44def5e3ba5d1 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -161,11 +161,12 @@ struct max9286_source {
> >  };
> >  
> >  struct max9286_asd {
> 
> This should be renamed to max9286_asc. I said in the review of a
> previous version that I was fine keeping the name as-is, as the
> v4l2_async_subdev structure was reintroduced later in the series, but
> that's not the case anymore.

This should be less confusing now than with v2 where the internal async
sub-device struct was not the same object that was used by drivers
previously.

> 
> > -	struct v4l2_async_subdev base;
> > +	struct v4l2_async_connection base;
> >  	struct max9286_source *source;
> >  };
> >  
> > -static inline struct max9286_asd *to_max9286_asd(struct v4l2_async_subdev *asd)
> > +static inline struct max9286_asd *
> > +to_max9286_asd(struct v4l2_async_connection *asd)
> 
> s/asd/asc/g
> 
> There's more below, in most drivers.

Yes, but is it worth renaming them? In all existing drivers there's no
functional change here. If you'd like them to be renamed, I think it should
be done after this set, that has already more than 32 patches and more than
2000 lines of changes.

> 
> >  {
> >  	return container_of(asd, struct max9286_asd, base);
> >  }
> > @@ -659,7 +660,7 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
> >  
> >  static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> >  				struct v4l2_subdev *subdev,
> > -				struct v4l2_async_subdev *asd)
> > +				struct v4l2_async_connection *asd)
> >  {
> >  	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
> >  	struct max9286_source *source = to_max9286_asd(asd)->source;
> > @@ -721,7 +722,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> >  
> >  static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
> >  				  struct v4l2_subdev *subdev,
> > -				  struct v4l2_async_subdev *asd)
> > +				  struct v4l2_async_connection *asd)
> >  {
> >  	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
> >  	struct max9286_source *source = to_max9286_asd(asd)->source;
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/atmel/atmel-isi.h b/drivers/media/platform/atmel/atmel-isi.h
> > index 7ad3895a2c87e..58ce900ca4c90 100644
> > --- a/drivers/media/platform/atmel/atmel-isi.h
> > +++ b/drivers/media/platform/atmel/atmel-isi.h
> > @@ -121,7 +121,7 @@
> >  #define ISI_DATAWIDTH_8				0x01
> >  #define ISI_DATAWIDTH_10			0x02
> >  
> > -struct v4l2_async_subdev;
> > +struct v4l2_async_connection;
> 
> You can actually drop this, it's not used in this file.

Ack. I think I'll add a new patch for this as these don't really belong
here.

> 
> >  
> >  struct isi_platform_data {
> >  	u8 has_emb_sync;
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > index cb206d3976ddf..c99d64e1cb01f 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > @@ -106,7 +106,7 @@ struct rvin_video_format {
> >  
> >  /**
> >   * struct rvin_parallel_entity - Parallel video input endpoint descriptor
> > - * @asd:	sub-device descriptor for async framework
> > + * @asc:	sub-device descriptor for async framework
> 
> The description of the field should also be updated.

I'll address that in v4.

> 
> >   * @subdev:	subdevice matched using async framework
> >   * @mbus_type:	media bus type
> >   * @bus:	media bus parallel configuration
> > @@ -115,7 +115,7 @@ struct rvin_video_format {
> >   *
> >   */
> >  struct rvin_parallel_entity {
> > -	struct v4l2_async_subdev *asd;
> > +	struct v4l2_async_connection *asc;
> >  	struct v4l2_subdev *subdev;
> >  
> >  	enum v4l2_mbus_type mbus_type;
> > @@ -275,7 +275,7 @@ struct rvin_dev {
> >   * @notifier:		group notifier for CSI-2 async subdevices
> >   * @vin:		VIN instances which are part of the group
> >   * @link_setup:		Callback to create all links for the media graph
> > - * @remotes:		array of pairs of fwnode and subdev pointers
> > + * @remotes:		array of pairs of async connection and subdev pointers
> >   *			to all remote subdevices.
> >   */
> >  struct rvin_group {
> > @@ -291,7 +291,7 @@ struct rvin_group {
> >  	int (*link_setup)(struct rvin_dev *vin);
> >  
> >  	struct {
> > -		struct v4l2_async_subdev *asd;
> > +		struct v4l2_async_connection *asc;
> >  		struct v4l2_subdev *subdev;
> >  	} remotes[RVIN_REMOTES_MAX];
> >  };
> 
> [snip]
> 
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 54f9f45ed3d8e..38d9d097fdb52 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -34,7 +34,7 @@ enum v4l2_async_match_type {
> >  };
> >  
> >  /**
> > - * struct v4l2_async_match_desc - async sub-device match information
> > + * struct v4l2_async_match_desc - async connection match information
> >   *
> >   * @type:	type of match that will be used
> >   * @fwnode:	pointer to &struct fwnode_handle to be matched.
> > @@ -62,21 +62,21 @@ struct v4l2_async_match_desc {
> >  };
> >  
> >  /**
> > - * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> > + * struct v4l2_async_connection - connection descriptor, as known to a bridge
> >   *
> >   * @match:	struct of match type and per-bus type matching data sets
> > - * @asd_entry:	used to add struct v4l2_async_subdev objects to the
> > - *		master notifier @asd_entry
> > - * @waiting_entry: used to link struct v4l2_async_subdev objects, waiting to be
> > - *		probed, to a notifier->waiting_list list
> > + * @asc_entry:	used to add struct v4l2_async_connection objects to the
> > + *		master notifier @asc_list
> > + * @waiting_entry: used to link struct v4l2_async_connection objects, waiting to
> > + *		be probed, to a notifier->waiting_list list
> >   *
> >   * When this struct is used as a member in a driver specific struct,
> >   * the driver specific struct shall contain the &struct
> > - * v4l2_async_subdev as its first member.
> > + * v4l2_async_connection as its first member.
> >   */
> > -struct v4l2_async_subdev {
> > +struct v4l2_async_connection {
> >  	struct v4l2_async_match_desc match;
> > -	struct list_head asd_entry;
> > +	struct list_head asc_entry;
> >  	struct list_head waiting_entry;
> >  };
> >  
> > @@ -86,17 +86,17 @@ struct v4l2_async_subdev {
> >   * @complete:	All subdevices have been probed successfully. The complete
> >   *		callback is only executed for the root notifier.
> >   * @unbind:	a subdevice is leaving
> > - * @destroy:	the asd is about to be freed
> > + * @destroy:	the asc is about to be freed
> >   */
> >  struct v4l2_async_notifier_operations {
> >  	int (*bound)(struct v4l2_async_notifier *notifier,
> >  		     struct v4l2_subdev *subdev,
> > -		     struct v4l2_async_subdev *asd);
> > +		     struct v4l2_async_connection *asc);
> >  	int (*complete)(struct v4l2_async_notifier *notifier);
> >  	void (*unbind)(struct v4l2_async_notifier *notifier,
> >  		       struct v4l2_subdev *subdev,
> > -		       struct v4l2_async_subdev *asd);
> > -	void (*destroy)(struct v4l2_async_subdev *asd);
> > +		       struct v4l2_async_connection *asc);
> > +	void (*destroy)(struct v4l2_async_connection *asc);
> >  };
> >  
> >  /**
> > @@ -106,7 +106,7 @@ struct v4l2_async_notifier_operations {
> >   * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
> >   * @sd:		sub-device that registered the notifier, NULL otherwise
> >   * @parent:	parent notifier
> > - * @asd_list:	master list of struct v4l2_async_subdev
> > + * @asc_list:	master list of struct v4l2_async_subdev
> 
> v4l2_async_subdev is no more.
> 
> >   * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
> 
> Same here.

I'll check these for v4.

> 
> >   * @done_list:	list of struct v4l2_subdev, already probed
> >   * @notifier_entry: member in a global list of notifiers
> > @@ -116,7 +116,7 @@ struct v4l2_async_notifier {
> >  	struct v4l2_device *v4l2_dev;
> >  	struct v4l2_subdev *sd;
> >  	struct v4l2_async_notifier *parent;
> > -	struct list_head asd_list;
> > +	struct list_head asc_list;
> >  	struct list_head waiting_list;
> >  	struct list_head done_list;
> >  	struct list_head notifier_entry;
> > @@ -134,53 +134,53 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   *
> > - * This function initializes the notifier @asd_entry. It must be called
> > + * This function initializes the notifier @asc_entry. It must be called
> 
> This sounds like it should be asc_list. The issues was likely introduced
> in an earlier patch in the series.

I believe so, yes. For v4.

> 
> >   * before adding a subdevice to a notifier, using one of:
> >   * v4l2_async_nf_add_fwnode_remote(), v4l2_async_nf_add_fwnode() or
> >   * v4l2_async_nf_add_i2c().
> >   */
> >  void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
> >  
> > -struct v4l2_async_subdev *
> > +struct v4l2_async_connection *
> >  __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> >  			   struct fwnode_handle *fwnode,
> > -			   unsigned int asd_struct_size);
> > +			   unsigned int asc_struct_size);
> >  /**
> >   * v4l2_async_nf_add_fwnode - Allocate and add a fwnode async
> > - *				subdev to the notifier's master asd_entry.
> > + *				subdev to the notifier's master asc_entry.
> 
> Same here.
> 
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @fwnode: fwnode handle of the sub-device to be matched, pointer to
> >   *	    &struct fwnode_handle
> > - * @type: Type of the driver's async sub-device struct. The &struct
> > - *	  v4l2_async_subdev shall be the first member of the driver's async
> > - *	  sub-device struct, i.e. both begin at the same memory address.
> > + * @type: Type of the driver's async sub-device or connection struct. The
> > + *	  &struct v4l2_async_connection shall be the first member of the
> > + *	  driver's async struct, i.e. both begin at the same memory address.
> >   *
> > - * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
> > - * notifiers @asd_entry. The function also gets a reference of the fwnode which
> > + * Allocate a fwnode-matched asc of size asc_struct_size, and add it to the
> > + * notifiers @asc_entry. The function also gets a reference of the fwnode which
> 
> Here too.
> 
> >   * is released later at notifier cleanup time.
> >   */
> >  #define v4l2_async_nf_add_fwnode(notifier, fwnode, type)		\
> >  	((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
> >  
> > -struct v4l2_async_subdev *
> > +struct v4l2_async_connection *
> >  __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >  				  struct fwnode_handle *endpoint,
> > -				  unsigned int asd_struct_size);
> > +				  unsigned int asc_struct_size);
> >  /**
> >   * v4l2_async_nf_add_fwnode_remote - Allocate and add a fwnode
> >   *						  remote async subdev to the
> > - *						  notifier's master asd_entry.
> > + *						  notifier's master asc_entry.
> 
> And here.
> 
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @ep: local endpoint pointing to the remote sub-device to be matched,
> >   *	pointer to &struct fwnode_handle
> >   * @type: Type of the driver's async sub-device struct. The &struct
> > - *	  v4l2_async_subdev shall be the first member of the driver's async
> > + *	  v4l2_async_connection shall be the first member of the driver's async
> >   *	  sub-device struct, i.e. both begin at the same memory address.
> >   *
> >   * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> > - * matching and adds the async sub-device to the notifier's @asd_entry. The
> > + * matching and adds the async connection to the notifier's @asc_entry. The
> 
> Here too again.
> 
> >   * function also gets a reference of the fwnode which is released later at
> >   * notifier cleanup time.
> >   *
> > @@ -190,19 +190,19 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> >  #define v4l2_async_nf_add_fwnode_remote(notifier, ep, type) \
> >  	((type *)__v4l2_async_nf_add_fwnode_remote(notifier, ep, sizeof(type)))
> >  
> > -struct v4l2_async_subdev *
> > +struct v4l2_async_connection *
> >  __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
> >  			int adapter_id, unsigned short address,
> > -			unsigned int asd_struct_size);
> > +			unsigned int asc_struct_size);
> >  /**
> >   * v4l2_async_nf_add_i2c - Allocate and add an i2c async
> > - *				subdev to the notifier's master asd_entry.
> > + *				subdev to the notifier's master asc_entry.
> 
> And finally here.
> 
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @adapter: I2C adapter ID to be matched
> >   * @address: I2C address of sub-device to be matched
> >   * @type: Type of the driver's async sub-device struct. The &struct
> > - *	  v4l2_async_subdev shall be the first member of the driver's async
> > + *	  v4l2_async_connection shall be the first member of the driver's async
> >   *	  sub-device struct, i.e. both begin at the same memory address.
> 
> s/sub-device/connection/ ? Please double-check if other instances of
> subdev(ice) have been forgotten.

Sure.

> 
> >   *
> >   * Same as v4l2_async_nf_add_fwnode() but for I2C matched
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index 855dae84b751d..4e4a6cf83097a 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -23,7 +23,7 @@
> >  
> >  struct fwnode_handle;
> >  struct v4l2_async_notifier;
> > -struct v4l2_async_subdev;
> > +struct v4l2_async_connection;
> 
> This is a sign the forward-declaration isn't needed.

Actually I think they all can be now removed, probably due to Jacopo's
patch. I'll address this for v4.

> 
> >  
> >  /**
> >   * struct v4l2_fwnode_endpoint - the endpoint data structure
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 82e4cf3dd2e05..215fc8af87614 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1022,8 +1022,7 @@ struct v4l2_subdev_platform_data {
> >   *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
> >   * @async_list: Links this subdev to a global subdev_entry or @notifier->done
> >   *	list.
> > - * @asd: Pointer to respective &struct v4l2_async_subdev.
> > - * @notifier: Pointer to the managing notifier.
> 
> Did you drop this field by mistake ?

Oops. This indeed belongs to a later patch, not here.

> 
> > + * @asd: Pointer to respective &struct v4l2_async_connection.
> >   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
> >   *		     device using v4l2_async_register_subdev_sensor().
> >   * @pdata: common part of subdevice platform data
> > @@ -1065,7 +1064,7 @@ struct v4l2_subdev {
> >  	struct device *dev;
> >  	struct fwnode_handle *fwnode;
> >  	struct list_head async_list;
> > -	struct v4l2_async_subdev *asd;
> > +	struct v4l2_async_connection *asd;
> >  	struct v4l2_async_notifier *notifier;
> >  	struct v4l2_async_notifier *subdev_notifier;
> >  	struct v4l2_subdev_platform_data *pdata;
> 

-- 
Kind regards,

Sakari Ailus
