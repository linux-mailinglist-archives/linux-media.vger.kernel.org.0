Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9C03027A8
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 17:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbhAYQUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 11:20:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:64581 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730671AbhAYQS4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 11:18:56 -0500
IronPort-SDR: Pz/R1ZpLqtrdJ4zF/invcdpSZbyPL+Z3aglQaOO/kHS9qwHgNqm2DJ8xOa6ZXKl16bK06GhF68
 Ze9PCO7KHx2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198533548"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="198533548"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 08:16:57 -0800
IronPort-SDR: C18oh3JvN70RtQ3JyAqvXq/STgRlNKjOAWwFBk/XyHtMheG6ZYtPaG/uXnUijlGTERUG2fKeS9
 AYAgGdQ3krCQ==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="350348187"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 08:16:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 53D882080B; Mon, 25 Jan 2021 18:16:47 +0200 (EET)
Date:   Mon, 25 Jan 2021 18:16:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 01/14] media: v4l2-async: Clean
 v4l2_async_notifier_add_fwnode_remote_subdev
Message-ID: <20210125161647.GM27155@paasikivi.fi.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-16-sakari.ailus@linux.intel.com>
 <8cbce0b0-17cb-a1b3-14c8-11b8aa5fc16b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbce0b0-17cb-a1b3-14c8-11b8aa5fc16b@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for the review.

On Mon, Jan 25, 2021 at 12:27:27PM -0300, Helen Koike wrote:
> Hi Sakari,
> 
> On 1/25/21 10:22 AM, Sakari Ailus wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Change v4l2_async_notifier_add_fwnode_remote_subdev semantics
> > so it allocates the struct v4l2_async_subdev pointer.
> > 
> > This makes the API consistent: the v4l2-async subdevice addition
> > functions have now a unified usage model. This model is simpler,
> > as it makes v4l2-async responsible for the allocation and release
> > of the subdevice descriptor, and no longer something the driver
> > has to worry about.
> > 
> > On the user side, the change makes the API simpler for the drivers
> > to use and less error-prone.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 17 ++--
> >  drivers/media/platform/omap3isp/isp.c         | 79 ++++++++-----------
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 ++--
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  9 ++-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 -
> >  drivers/media/platform/video-mux.c            | 14 +---
> >  drivers/media/v4l2-core/v4l2-async.c          | 24 +++---
> >  drivers/staging/media/imx/imx-media-csi.c     | 14 +---
> >  drivers/staging/media/imx/imx6-mipi-csi2.c    | 19 ++---
> >  drivers/staging/media/imx/imx7-media-csi.c    | 16 ++--
> >  drivers/staging/media/imx/imx7-mipi-csis.c    | 15 +---
> >  11 files changed, 86 insertions(+), 137 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index d29554125ae6..6e121e7a5ecd 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -1464,7 +1464,8 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
> >  		struct v4l2_fwnode_endpoint vep = {
> >  			.bus_type = V4L2_MBUS_CSI2_DPHY
> >  		};
> > -		struct sensor_async_subdev *s_asd = NULL;
> > +		struct sensor_async_subdev *s_asd;
> > +		struct v4l2_async_subdev *asd;
> >  		struct fwnode_handle *ep;
> >  
> >  		ep = fwnode_graph_get_endpoint_by_id(
> > @@ -1478,27 +1479,23 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
> >  		if (ret)
> >  			goto err_parse;
> >  
> > -		s_asd = kzalloc(sizeof(*s_asd), GFP_KERNEL);
> > -		if (!s_asd) {
> > -			ret = -ENOMEM;
> > +		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +				&cio2->notifier, ep, sizeof(*s_asd));
> > +		if (IS_ERR(asd)) {
> > +			ret = PTR_ERR(asd);
> >  			goto err_parse;
> >  		}
> >  
> > +		s_asd = container_of(asd, struct sensor_async_subdev, asd);
> >  		s_asd->csi2.port = vep.base.port;
> >  		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
> >  
> > -		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
> > -			&cio2->notifier, ep, &s_asd->asd);
> > -		if (ret)
> > -			goto err_parse;
> > -
> >  		fwnode_handle_put(ep);
> >  
> >  		continue;
> >  
> >  err_parse:
> >  		fwnode_handle_put(ep);
> > -		kfree(s_asd);
> >  		return ret;
> >  	}
> >  
> > diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> > index b1fc4518e275..1311b4996ece 100644
> > --- a/drivers/media/platform/omap3isp/isp.c
> > +++ b/drivers/media/platform/omap3isp/isp.c
> > @@ -2126,21 +2126,6 @@ static void isp_parse_of_csi1_endpoint(struct device *dev,
> >  	buscfg->bus.ccp2.crc = 1;
> >  }
> >  
> > -static int isp_alloc_isd(struct isp_async_subdev **isd,
> > -			 struct isp_bus_cfg **buscfg)
> > -{
> > -	struct isp_async_subdev *__isd;
> > -
> > -	__isd = kzalloc(sizeof(*__isd), GFP_KERNEL);
> > -	if (!__isd)
> > -		return -ENOMEM;
> > -
> > -	*isd = __isd;
> > -	*buscfg = &__isd->bus;
> > -
> > -	return 0;
> > -}
> > -
> >  static struct {
> >  	u32 phy;
> >  	u32 csi2_if;
> > @@ -2156,7 +2141,7 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
> >  {
> >  	struct fwnode_handle *ep;
> >  	struct isp_async_subdev *isd = NULL;
> > -	struct isp_bus_cfg *buscfg;
> > +	struct v4l2_async_subdev *asd;
> >  	unsigned int i;
> >  
> >  	ep = fwnode_graph_get_endpoint_by_id(
> > @@ -2174,20 +2159,15 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  
> >  		if (!ret) {
> > -			ret = isp_alloc_isd(&isd, &buscfg);
> > -			if (ret)
> > -				return ret;
> > -		}
> > -
> > -		if (!ret) {
> > -			isp_parse_of_parallel_endpoint(isp->dev, &vep, buscfg);
> > -			ret = v4l2_async_notifier_add_fwnode_remote_subdev(
> > -				&isp->notifier, ep, &isd->asd);
> > +			asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +				&isp->notifier, ep, sizeof(*isd));
> > +			if (!IS_ERR(asd)) {
> > +				isd = container_of(asd, struct isp_async_subdev, asd);
> > +				isp_parse_of_parallel_endpoint(isp->dev, &vep, &isd->bus);
> > +			}
> >  		}
> >  
> >  		fwnode_handle_put(ep);
> > -		if (ret)
> > -			kfree(isd);
> >  	}
> >  
> >  	for (i = 0; i < ARRAY_SIZE(isp_bus_interfaces); i++) {
> > @@ -2206,15 +2186,8 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
> >  		dev_dbg(isp->dev, "parsing serial interface %u, node %pOF\n", i,
> >  			to_of_node(ep));
> >  
> > -		ret = isp_alloc_isd(&isd, &buscfg);
> > -		if (ret)
> > -			return ret;
> > -
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > -		if (!ret) {
> > -			buscfg->interface = isp_bus_interfaces[i].csi2_if;
> > -			isp_parse_of_csi2_endpoint(isp->dev, &vep, buscfg);
> > -		} else if (ret == -ENXIO) {
> > +		if (ret == -ENXIO) {
> >  			vep = (struct v4l2_fwnode_endpoint)
> >  				{ .bus_type = V4L2_MBUS_CSI1 };
> >  			ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > @@ -2224,21 +2197,35 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
> >  					{ .bus_type = V4L2_MBUS_CCP2 };
> >  				ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  			}
> > -			if (!ret) {
> > -				buscfg->interface =
> > -					isp_bus_interfaces[i].csi1_if;
> > -				isp_parse_of_csi1_endpoint(isp->dev, &vep,
> > -							   buscfg);
> > -			}
> >  		}
> >  
> > -		if (!ret)
> > -			ret = v4l2_async_notifier_add_fwnode_remote_subdev(
> > -				&isp->notifier, ep, &isd->asd);
> > +		if (!ret) {
> > +			asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +				&isp->notifier, ep, sizeof(*isd));
> > +
> > +			if (!IS_ERR(asd)) {
> > +				isd = container_of(asd, struct isp_async_subdev, asd);
> > +
> > +				switch (vep.bus_type) {
> > +				case V4L2_MBUS_CSI2_DPHY:
> > +					isd->bus.interface =
> > +						isp_bus_interfaces[i].csi2_if;
> > +					isp_parse_of_csi2_endpoint(isp->dev, &vep, &isd->bus);
> > +					break;
> > +				case V4L2_MBUS_CSI1:
> > +				case V4L2_MBUS_CCP2:
> > +					isd->bus.interface =
> > +						isp_bus_interfaces[i].csi1_if;
> > +					isp_parse_of_csi1_endpoint(isp->dev, &vep,
> > +								   &isd->bus);
> > +					break;
> > +				default:
> > +					break;
> > +				}
> > +			}
> > +		}
> >  
> >  		fwnode_handle_put(ep);
> > -		if (ret)
> > -			kfree(isd);
> >  	}
> >  
> >  	return 0;
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 68da1eed753d..235dcf0c4122 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -252,6 +252,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >  			.bus_type = V4L2_MBUS_CSI2_DPHY
> >  		};
> >  		struct rkisp1_sensor_async *rk_asd = NULL;
> > +		struct v4l2_async_subdev *asd;
> >  		struct fwnode_handle *ep;
> >  
> >  		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> > @@ -264,21 +265,16 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >  		if (ret)
> >  			goto err_parse;
> >  
> > -		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
> > -		if (!rk_asd) {
> > -			ret = -ENOMEM;
> > +		asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > +							sizeof(*rk_asd));
> > +		if (IS_ERR(asd))
> 
> Missing ret = PTR_ERR(asd); no?
> 

Correct.

> 
> >  			goto err_parse;
> > -		}
> >  
> > +		rk_asd = container_of(asd, struct rkisp1_sensor_async, asd);
> >  		rk_asd->mbus_type = vep.bus_type;
> >  		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> >  		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> >  
> > -		ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > -								   &rk_asd->asd);
> > -		if (ret)
> > -			goto err_parse;
> > -
> >  		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
> >  			vep.base.id, rk_asd->lanes);
> >  
> > @@ -289,7 +285,6 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >  		continue;
> >  err_parse:
> >  		fwnode_handle_put(ep);
> > -		kfree(rk_asd);
> >  		v4l2_async_notifier_cleanup(ntf);
> >  		return ret;
> >  	}
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index ec46cff80fdb..3f94b8c966f3 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -118,6 +118,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
> >  	struct v4l2_fwnode_endpoint vep = {
> >  		.bus_type = V4L2_MBUS_PARALLEL,
> >  	};
> > +	struct v4l2_async_subdev *asd;
> >  	struct fwnode_handle *ep;
> >  	int ret;
> >  
> > @@ -134,10 +135,12 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
> >  
> >  	csi->bus = vep.bus.parallel;
> >  
> > -	ret = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
> > -							   ep, &csi->asd);
> > -	if (ret)
> > +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
> > +							   ep, sizeof(*asd));
> > +	if (IS_ERR(asd)) {
> > +		ret = PTR_ERR(asd);
> >  		goto out;
> > +	}
> >  
> >  	csi->notifier.ops = &sun4i_csi_notify_ops;
> >  
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> > index 0f67ff652c2e..a5f61ee0ec4d 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> > @@ -139,7 +139,6 @@ struct sun4i_csi {
> >  	struct v4l2_mbus_framefmt	subdev_fmt;
> >  
> >  	/* V4L2 Async variables */
> > -	struct v4l2_async_subdev	asd;
> >  	struct v4l2_async_notifier	notifier;
> >  	struct v4l2_subdev		*src_subdev;
> >  	int				src_pad;
> > diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> > index 53570250a25d..7b280dfca727 100644
> > --- a/drivers/media/platform/video-mux.c
> > +++ b/drivers/media/platform/video-mux.c
> > @@ -370,19 +370,13 @@ static int video_mux_async_register(struct video_mux *vmux,
> >  		if (!ep)
> >  			continue;
> >  
> > -		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
> > -		if (!asd) {
> > -			fwnode_handle_put(ep);
> > -			return -ENOMEM;
> > -		}
> > -
> > -		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
> > -			&vmux->notifier, ep, asd);
> > +		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +			&vmux->notifier, ep, sizeof(*asd));
> >  
> >  		fwnode_handle_put(ep);
> >  
> > -		if (ret) {
> > -			kfree(asd);
> > +		if (IS_ERR(asd)) {
> > +			ret = PTR_ERR(asd);
> >  			/* OK if asd already exists */
> >  			if (ret != -EEXIST)
> >  				return ret;
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 6f06daf4a689..1f2b7aa1fca6 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -648,26 +648,26 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_subdev);
> >  
> > -int
> > +struct v4l2_async_subdev *
> >  v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> >  					     struct fwnode_handle *endpoint,
> > -					     struct v4l2_async_subdev *asd)
> > +					     unsigned int asd_struct_size)
> >  {
> > +	struct v4l2_async_subdev *asd;
> >  	struct fwnode_handle *remote;
> > -	int ret;
> >  
> >  	remote = fwnode_graph_get_remote_port_parent(endpoint);
> >  	if (!remote)
> > -		return -ENOTCONN;
> > +		return ERR_PTR(ENOTCONN);
> 
> I guess this should be a negative number.

Agreed.

I'll address these... I wonder which version it will be.

vger.kernel.org ate most of the set. :-(

-- 
Sakari Ailus
