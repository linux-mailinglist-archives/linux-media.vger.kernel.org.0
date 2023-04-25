Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0096ED973
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjDYA7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjDYA7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:59:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3087493E6
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:59:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E03A775B;
        Tue, 25 Apr 2023 02:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682384369;
        bh=LV2OFFB57agL4LFBMqJMnuKyVGTH0JdbFsF+Jdt+wGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oE1xkXdUvEPp4qW7me8Mx9JW+76En8sL3gZ6Ml27kCExIWgHGyLZw4te2zSkdzDBO
         lIOGpJIkA7azNub5+6zeFAb73tZgsVEHPnKK3mB/5qagRdMGRuqN3hiI9kXzPY9k8U
         B4cFvsD0mOKcG1ODwsYwHEa60tn5ubenIA7ydQHA=
Date:   Tue, 25 Apr 2023 03:59:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 08/18] media: v4l: async: Rename v4l2_async_subdev as
 v4l2_async_connection
Message-ID: <20230425005950.GF4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-9-sakari.ailus@linux.intel.com>
 <h3w7xv337qpplcosai4venkeqtjpbdvdeujbbhqfyzthe7ivyl@vdwlnaxppsuq>
 <ZDlEdALIMuekuIxj@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZDlEdALIMuekuIxj@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Fri, Apr 14, 2023 at 03:17:56PM +0300, Sakari Ailus wrote:
> On Fri, Apr 14, 2023 at 10:22:41AM +0200, Jacopo Mondi wrote:
> > On Thu, Mar 30, 2023 at 02:58:43PM +0300, Sakari Ailus wrote:
> > > This patch has been generated by:
> > >
> > > 	git grep -l v4l2_async_subdev | \
> > > 		while read i; do \
> > > 			spatch --sp-file async.spatch --in-place $i; done \
> > > 			perl -i -pe 's/v4l2_async_\Ksubdev/connection/g' $i \
> > > 		done
> > >
> > > While async.spatch looks like:
> > >
> > > @ name @
> > > @@
> > > - struct v4l2_async_subdev
> > > + struct v4l2_async_connection
> > >
> > > Additionally, __v4l2_async_nf_add_subdev() has been renamed as
> > > __v4l2_async_nf_add_connection(). Some manual editing has been performed
> > > as well.

The commit message fails to explain why.

> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../driver-api/media/v4l2-subdev.rst          |  10 +-
> > >  drivers/media/i2c/max9286.c                   |   9 +-
> > >  drivers/media/i2c/st-mipid02.c                |   8 +-
> > >  drivers/media/i2c/tc358746.c                  |   6 +-
> > >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  10 +-
> > >  drivers/media/platform/atmel/atmel-isi.c      |   8 +-
> > >  drivers/media/platform/atmel/atmel-isi.h      |   2 +-
> > >  drivers/media/platform/cadence/cdns-csi2rx.c  |   6 +-
> > >  drivers/media/platform/intel/pxa_camera.c     |  12 +-
> > >  drivers/media/platform/marvell/cafe-driver.c  |   5 +-
> > >  drivers/media/platform/marvell/mcam-core.c    |   4 +-
> > >  drivers/media/platform/marvell/mmp-driver.c   |   4 +-
> > >  .../platform/microchip/microchip-csi2dc.c     |   6 +-
> > >  .../platform/microchip/microchip-isc-base.c   |   4 +-
> > >  .../media/platform/microchip/microchip-isc.h  |   2 +-
> > >  .../microchip/microchip-sama5d2-isc.c         |   4 +-
> > >  .../microchip/microchip-sama7g5-isc.c         |   4 +-
> > >  drivers/media/platform/nxp/imx-mipi-csis.c    |   6 +-
> > >  drivers/media/platform/nxp/imx7-media-csi.c   |   6 +-
> > >  drivers/media/platform/qcom/camss/camss.c     |   2 +-
> > >  drivers/media/platform/qcom/camss/camss.h     |   2 +-
> > >  drivers/media/platform/renesas/rcar-isp.c     |   8 +-
> > >  .../platform/renesas/rcar-vin/rcar-core.c     |  18 +-
> > >  .../platform/renesas/rcar-vin/rcar-csi2.c     |   8 +-
> > >  .../platform/renesas/rcar-vin/rcar-vin.h      |   4 +-
> > >  drivers/media/platform/renesas/rcar_drif.c    |   8 +-
> > >  drivers/media/platform/renesas/renesas-ceu.c  |   6 +-
> > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  10 +-
> > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 +-
> > >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   8 +-
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
> > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |   4 +-
> > >  .../platform/samsung/exynos4-is/media-dev.c   |   6 +-
> > >  .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
> > >  drivers/media/platform/st/stm32/stm32-dcmi.c  |   8 +-
> > >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   6 +-
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   2 +-
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   6 +-
> > >  .../sun8i_a83t_mipi_csi2.c                    |   6 +-
> > >  .../media/platform/ti/am437x/am437x-vpfe.c    |   5 +-
> > >  .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
> > >  drivers/media/platform/ti/cal/cal.c           |   6 +-
> > >  .../media/platform/ti/davinci/vpif_capture.c  |   7 +-
> > >  drivers/media/platform/ti/omap3isp/isp.h      |   2 +-
> > >  drivers/media/platform/video-mux.c            |   6 +-
> > >  drivers/media/platform/xilinx/xilinx-vipp.c   |  24 +--
> > >  drivers/media/v4l2-core/v4l2-async.c          | 166 +++++++++---------
> > >  drivers/media/v4l2-core/v4l2-fwnode.c         |  14 +-
> > >  .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
> > >  .../media/deprecated/atmel/atmel-isc.h        |   2 +-
> > >  .../deprecated/atmel/atmel-sama5d2-isc.c      |   4 +-
> > >  .../deprecated/atmel/atmel-sama7g5-isc.c      |   4 +-
> > >  drivers/staging/media/imx/imx-media-csi.c     |   6 +-
> > >  .../staging/media/imx/imx-media-dev-common.c  |   4 +-
> > >  drivers/staging/media/imx/imx-media-dev.c     |   2 +-
> > >  drivers/staging/media/imx/imx-media-of.c      |   4 +-
> > >  drivers/staging/media/imx/imx6-mipi-csi2.c    |   8 +-
> > >  drivers/staging/media/imx/imx8mq-mipi-csi2.c  |   6 +-
> > >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   2 +-
> > >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   2 +-
> > >  drivers/staging/media/tegra-video/vi.c        |  14 +-
> > >  drivers/staging/media/tegra-video/vi.h        |   2 +-
> > >  include/media/davinci/vpif_types.h            |   2 +-
> > >  include/media/v4l2-async.h                    |  78 ++++----
> > >  include/media/v4l2-fwnode.h                   |  10 +-
> > >  include/media/v4l2-subdev.h                   |   4 +-
> > >  67 files changed, 313 insertions(+), 313 deletions(-)
> > >
> > > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > > index 260cfa8c3f3d..1c5cb1a637ab 100644
> > > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > > @@ -215,13 +215,13 @@ found in firmware. The notifier for the sub-device is unregistered with the
> > >  async sub-device.
> > >
> > >  These functions allocate an async sub-device descriptor which is of type struct
> > > -:c:type:`v4l2_async_subdev` embedded in a driver-specific struct. The &struct
> > > -:c:type:`v4l2_async_subdev` shall be the first member of this struct:
> > > +:c:type:`v4l2_async_connection` embedded in a driver-specific struct. The &struct
> > > +:c:type:`v4l2_async_connection` shall be the first member of this struct:
> > >
> > >  .. code-block:: c
> > >
> > >  	struct my_async_subdev {
> > > -		struct v4l2_async_subdev asd;
> > > +		struct v4l2_async_connection asd;

s/asd/asc/

> > >  		...
> > >  	};
> > >
> > > @@ -244,10 +244,10 @@ notifier callback is called. After all subdevices have been located the
> > >  system the .unbind() method is called. All three callbacks are optional.
> > >
> > >  Drivers can store any type of custom data in their driver-specific
> > > -:c:type:`v4l2_async_subdev` wrapper. If any of that data requires special
> > > +:c:type:`v4l2_async_connection` wrapper. If any of that data requires special
> > >  handling when the structure is freed, drivers must implement the ``.destroy()``
> > >  notifier callback. The framework will call it right before freeing the
> > > -:c:type:`v4l2_async_subdev`.
> > > +:c:type:`v4l2_async_connection`.
> > >
> > >  Calling subdev operations
> > >  ~~~~~~~~~~~~~~~~~~~~~~~~~
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index 2d0f43e3fb9f..13cb2537a06d 100644
> > 
> > [snip: I'll only comment framework changes as I presume if driver
> > changes compile, they're good]
> > 
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index 425280b4d387..9cf383e81a16 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -63,23 +63,23 @@ struct v4l2_async_match {
> > >  };
> > >
> > >  /**
> > > - * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> > > + * struct v4l2_async_connection - sub-device descriptor, as known to a bridge
> > >   *
> > >   * @match:	struct of match type and per-bus type matching data sets
> > > - * @asd_list:	used to add struct v4l2_async_subdev objects to the
> > > - *		master notifier @asd_list
> > > - * @waiting_list: used to link struct v4l2_async_subdev objects, waiting to be
> > > - *		probed, to a notifier->waiting list
> > > + * @asc_list:	used to add struct v4l2_async_connection objects to the
> > > + *		master notifier @asc_list
> > 
> > notifier asc_head
> 
> Thanks!
> 
> > > + * @waiting_list: used to link struct v4l2_async_connection objects, waiting to
> > > + *		be probed, to a notifier->waiting list
> > >   *
> > >   * When this struct is used as a member in a driver specific struct,
> > >   * the driver specific struct shall contain the &struct
> > > - * v4l2_async_subdev as its first member.
> > > + * v4l2_async_connection as its first member.
> > >   */
> > > -struct v4l2_async_subdev {
> > > +struct v4l2_async_connection {
> > >  	struct v4l2_async_match match;
> > >
> > >  	/* v4l2-async core private: not to be used by drivers */
> > > -	struct list_head asd_list;
> > > +	struct list_head asc_list;
> > >  	struct list_head waiting_list;
> > >  };
> > >
> > > @@ -89,17 +89,17 @@ struct v4l2_async_subdev {
> > 
> > For more context:
> > 
> >     * @bound:	        a subdevice driver has successfully probed one of the subdevices
> > >   * @complete:	All subdevices have been probed successfully. The complete
> > 
> > the usage of the term "subdevice" when referring to connection is
> > spread everywhere in documentation :/

I don't think I really like the name "connection" :-S Maybe that's
because it's not explained properly here, neither in the commit message
nor in the documentation. I may have better ideas when reviewing the
next patch, but I wonder if v4l2_async_nf_entry or v4l2_async_entry
would be a better name. It would also allow renaming the "asd" variables
to something more explicit.

> > But I mostly wonder, and I guess this is a comment on the next patch:
> > do we now get multiple 'bound' calls for the same subdevice when
> > matched on multiple connections ?
> 
> Correct. That isn't an issue for current drivers as the API before this set
> only allowed a single downstream link per async sub-device. Some more of
> the documentation probably needs to be reworked due to this.
> 
> > >   *		callback is only executed for the root notifier.
> > >   * @unbind:	a subdevice is leaving
> > > - * @destroy:	the asd is about to be freed
> > > + * @destroy:	the asc is about to be freed
> > >   */
> > >  struct v4l2_async_notifier_operations {
> > >  	int (*bound)(struct v4l2_async_notifier *notifier,
> > >  		     struct v4l2_subdev *subdev,
> > > -		     struct v4l2_async_subdev *asd);
> > > +		     struct v4l2_async_connection *asc);
> > >  	int (*complete)(struct v4l2_async_notifier *notifier);
> > >  	void (*unbind)(struct v4l2_async_notifier *notifier,
> > >  		       struct v4l2_subdev *subdev,
> > > -		       struct v4l2_async_subdev *asd);
> > > -	void (*destroy)(struct v4l2_async_subdev *asd);
> > > +		       struct v4l2_async_connection *asc);
> > > +	void (*destroy)(struct v4l2_async_connection *asc);
> > >  };
> > >
> > >  /**
> > > @@ -109,7 +109,7 @@ struct v4l2_async_notifier_operations {
> > >   * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
> > >   * @sd:		sub-device that registered the notifier, NULL otherwise
> > >   * @parent:	parent notifier
> > > - * @asd_head:	master list of struct v4l2_async_subdev
> > > + * @asc_head:	master list of struct v4l2_async_subdev
> > >   * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
> > >   * @done_head:	list of struct v4l2_subdev, already probed
> > >   * @notifier_list: member in a global list of notifiers
> > > @@ -119,7 +119,7 @@ struct v4l2_async_notifier {
> > >  	struct v4l2_device *v4l2_dev;
> > >  	struct v4l2_subdev *sd;
> > >  	struct v4l2_async_notifier *parent;
> > > -	struct list_head asd_head;
> > > +	struct list_head asc_head;
> > >  	struct list_head waiting_head;
> > >  	struct list_head done_head;
> > >  	struct list_head notifier_list;
> > > @@ -137,75 +137,75 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> > >   *
> > >   * @notifier: pointer to &struct v4l2_async_notifier
> > >   *
> > > - * This function initializes the notifier @asd_list. It must be called
> > > + * This function initializes the notifier @asc_list. It must be called
> > >   * before adding a subdevice to a notifier, using one of:
> > >   * v4l2_async_nf_add_fwnode_remote(),
> > >   * v4l2_async_nf_add_fwnode(),
> > >   * v4l2_async_nf_add_i2c(),
> > > - * __v4l2_async_nf_add_subdev() or
> > > + * __v4l2_async_nf_add_connection() or
> > >   * v4l2_async_nf_parse_fwnode_endpoints().
> > >   */
> > >  void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
> > >
> > >  /**
> > > - * __v4l2_async_nf_add_subdev - Add an async subdev to the
> > > - *				notifier's master asd list.
> > > + * __v4l2_async_nf_add_connection() - Add an async subdev to the notifier's
> > > + *				      master asc list.
> > >   *
> > >   * @notifier: pointer to &struct v4l2_async_notifier
> > > - * @asd: pointer to &struct v4l2_async_subdev
> > > + * @asc: pointer to &struct v4l2_async_connection
> > >   *
> > >   * \warning: Drivers should avoid using this function and instead use one of:
> > >   * v4l2_async_nf_add_fwnode(),
> > >   * v4l2_async_nf_add_fwnode_remote() or
> > >   * v4l2_async_nf_add_i2c().
> > >   *
> > > - * Call this function before registering a notifier to link the provided @asd to
> > > - * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
> > > + * Call this function before registering a notifier to link the provided @asc to
> > > + * the notifiers master @asc_list. The @asc must be allocated with k*alloc() as
> > >   * it will be freed by the framework when the notifier is destroyed.
> > >   */
> > > -int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
> > > -			       struct v4l2_async_subdev *asd);
> > > +int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
> > > +				   struct v4l2_async_connection *asc);
> > >
> > > -struct v4l2_async_subdev *
> > > +struct v4l2_async_connection *
> > >  __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> > >  			   struct fwnode_handle *fwnode,
> > > -			   unsigned int asd_struct_size);
> > > +			   unsigned int asc_struct_size);
> > >  /**
> > >   * v4l2_async_nf_add_fwnode - Allocate and add a fwnode async
> > > - *				subdev to the notifier's master asd_list.
> > > + *				subdev to the notifier's master asc_list.
> > >   *
> > >   * @notifier: pointer to &struct v4l2_async_notifier
> > >   * @fwnode: fwnode handle of the sub-device to be matched, pointer to
> > >   *	    &struct fwnode_handle
> > >   * @type: Type of the driver's async sub-device struct. The &struct
> > > - *	  v4l2_async_subdev shall be the first member of the driver's async
> > > + *	  v4l2_async_connection shall be the first member of the driver's async
> > >   *	  sub-device struct, i.e. both begin at the same memory address.
> > >   *
> > > - * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
> > > - * notifiers @asd_list. The function also gets a reference of the fwnode which
> > > + * Allocate a fwnode-matched asc of size asc_struct_size, and add it to the
> > > + * notifiers @asc_list. The function also gets a reference of the fwnode which
> > >   * is released later at notifier cleanup time.
> > >   */
> > >  #define v4l2_async_nf_add_fwnode(notifier, fwnode, type)		\
> > >  	((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
> > >
> > > -struct v4l2_async_subdev *
> > > +struct v4l2_async_connection *
> > >  __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> > >  				  struct fwnode_handle *endpoint,
> > > -				  unsigned int asd_struct_size);
> > > +				  unsigned int asc_struct_size);
> > >  /**
> > >   * v4l2_async_nf_add_fwnode_remote - Allocate and add a fwnode
> > >   *						  remote async subdev to the
> > > - *						  notifier's master asd_list.
> > > + *						  notifier's master asc_list.
> > >   *
> > >   * @notifier: pointer to &struct v4l2_async_notifier
> > >   * @ep: local endpoint pointing to the remote sub-device to be matched,
> > >   *	pointer to &struct fwnode_handle
> > >   * @type: Type of the driver's async sub-device struct. The &struct
> > > - *	  v4l2_async_subdev shall be the first member of the driver's async
> > > + *	  v4l2_async_connection shall be the first member of the driver's async
> > >   *	  sub-device struct, i.e. both begin at the same memory address.
> > >   *
> > >   * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> > > - * matching and adds the async sub-device to the notifier's @asd_list. The
> > > + * matching and adds the async sub-device to the notifier's @asc_list. The
> > >   * function also gets a reference of the fwnode which is released later at
> > >   * notifier cleanup time.
> > >   *
> > > @@ -215,19 +215,19 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
> > >  #define v4l2_async_nf_add_fwnode_remote(notifier, ep, type) \
> > >  	((type *)__v4l2_async_nf_add_fwnode_remote(notifier, ep, sizeof(type)))
> > >
> > > -struct v4l2_async_subdev *
> > > +struct v4l2_async_connection *
> > >  __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
> > >  			int adapter_id, unsigned short address,
> > > -			unsigned int asd_struct_size);
> > > +			unsigned int asc_struct_size);
> > >  /**
> > >   * v4l2_async_nf_add_i2c - Allocate and add an i2c async
> > > - *				subdev to the notifier's master asd_list.
> > > + *				subdev to the notifier's master asc_list.
> > >   *
> > >   * @notifier: pointer to &struct v4l2_async_notifier
> > >   * @adapter: I2C adapter ID to be matched
> > >   * @address: I2C address of sub-device to be matched
> > >   * @type: Type of the driver's async sub-device struct. The &struct
> > > - *	  v4l2_async_subdev shall be the first member of the driver's async
> > > + *	  v4l2_async_connection shall be the first member of the driver's async
> > >   *	  sub-device struct, i.e. both begin at the same memory address.
> > >   *
> > >   * Same as v4l2_async_nf_add_fwnode() but for I2C matched
> > > @@ -275,7 +275,7 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier);
> > >   * v4l2_async_nf_add_fwnode_remote(),
> > >   * v4l2_async_nf_add_fwnode(),
> > >   * v4l2_async_nf_add_i2c(),
> > > - * __v4l2_async_nf_add_subdev() or
> > > + * __v4l2_async_nf_add_connection() or
> > >   * v4l2_async_nf_parse_fwnode_endpoints().
> > >   *
> > >   * There is no harm from calling v4l2_async_nf_cleanup() in other
> > > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > > index 394d798f3dfa..ebb83154abd5 100644
> > > --- a/include/media/v4l2-fwnode.h
> > > +++ b/include/media/v4l2-fwnode.h
> > > @@ -23,7 +23,7 @@
> > >
> > >  struct fwnode_handle;
> > >  struct v4l2_async_notifier;
> > > -struct v4l2_async_subdev;
> > > +struct v4l2_async_connection;
> > >
> > >  /**
> > >   * struct v4l2_fwnode_endpoint - the endpoint data structure
> > > @@ -399,7 +399,7 @@ int v4l2_fwnode_device_parse(struct device *dev,
> > >   *
> > >   * @dev: pointer to &struct device
> > >   * @vep: pointer to &struct v4l2_fwnode_endpoint
> > > - * @asd: pointer to &struct v4l2_async_subdev
> > > + * @asd: pointer to &struct v4l2_async_connection

s/asd/asc/

> > >   *
> > >   * Return:
> > >   * * %0 on success
> > > @@ -409,7 +409,7 @@ int v4l2_fwnode_device_parse(struct device *dev,
> > >   */
> > >  typedef int (*parse_endpoint_func)(struct device *dev,
> > >  				  struct v4l2_fwnode_endpoint *vep,
> > > -				  struct v4l2_async_subdev *asd);
> > > +				  struct v4l2_async_connection *asd);

s/asd/asc/

> > >
> > >  /**
> > >   * v4l2_async_nf_parse_fwnode_endpoints - Parse V4L2 fwnode endpoints in a
> > 
> > Ah nice this function is DEPRECATED and not used anywhere anymore.
> > I'll send a patch on top of this series to drop it
> 
> Thanks! I'll toss it in.
> 
> > > @@ -417,8 +417,8 @@ typedef int (*parse_endpoint_func)(struct device *dev,
> > >   * @dev: the device the endpoints of which are to be parsed
> > >   * @notifier: notifier for @dev
> > >   * @asd_struct_size: size of the driver's async sub-device struct, including
> > > - *		     sizeof(struct v4l2_async_subdev). The &struct
> > > - *		     v4l2_async_subdev shall be the first member of
> > > + *		     sizeof(struct v4l2_async_connection). The &struct
> > > + *		     v4l2_async_connection shall be the first member of
> > >   *		     the driver's async sub-device struct, i.e. both
> > >   *		     begin at the same memory address.
> > >   * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index 17773be4a4ee..a2cce11dda5c 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -1021,7 +1021,7 @@ struct v4l2_subdev_platform_data {
> > >   *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
> > >   * @async_list: Links this subdev to a global subdev_list or @notifier->done
> > >   *	list.
> > > - * @asd: Pointer to respective &struct v4l2_async_subdev.
> > > + * @asc: Pointer to respective &struct v4l2_async_connection.
> > 
> > this is still named 'asd' in code
> 
> Fixed.

"asd" used to stand for "Async SubDev". "asc" could be argued to stand
for "ASync Connection", but that's a weird acronym. Would "connection"
or "conn" be a better variable name ?

I'm also sure you'll dislike this, but I'd like driver code to be
changed to rename the variables too.

> > >   * @notifier: Pointer to the managing notifier.
> > >   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
> > >   *		     device using v4l2_async_register_subdev_sensor().
> > > @@ -1063,7 +1063,7 @@ struct v4l2_subdev {
> > >  	struct device *dev;
> > >  	struct fwnode_handle *fwnode;
> > >  	struct list_head async_list;
> > > -	struct v4l2_async_subdev *asd;
> > > +	struct v4l2_async_connection *asd;
> > >  	struct v4l2_async_notifier *notifier;
> > >  	struct v4l2_async_notifier *subdev_notifier;
> > >  	struct v4l2_subdev_platform_data *pdata;

-- 
Regards,

Laurent Pinchart
