Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749FB2F87D5
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 22:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbhAOVo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 16:44:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51476 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbhAOVo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 16:44:58 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D543558B;
        Fri, 15 Jan 2021 22:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610747055;
        bh=VhjMVlxVykYGIXJXGMNEqGJ+De4eGXGOmfA2Q/QDVdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bve00yf6wD8S+06EkfrL4nGPPpaWi6Fe6OIjQ79kfivvyorZ368Ka46BJdr32c8xB
         SYB39+z6g9PR3OVr/QfixQvHhUEzczdhSCGBi34m5tf+7oDS8gO7JE8M5wKHP3o4Qh
         FxPYJub4xRHa0GVLB+wPnoKtmF2DNWzrqqf5n8rM=
Date:   Fri, 15 Jan 2021 23:43:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] media: v4l2-async: Improve
 v4l2_async_notifier_add_*_subdev() API
Message-ID: <YAIMnbS293x/H9ZL@pendragon.ideasonboard.com>
References: <20210114030719.28172-1-laurent.pinchart+renesas@ideasonboard.com>
 <b7842e88b93247eec12fbc917ef448c68a98410e.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7842e88b93247eec12fbc917ef448c68a98410e.camel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, Jan 14, 2021 at 10:29:02AM -0300, Ezequiel Garcia wrote:
> On Thu, 2021-01-14 at 05:07 +0200, Laurent Pinchart wrote:
> > The functions that add an async subdev to an async subdev notifier take
> > as an argument the size of the container structure they need to
> > allocate. This is error prone, as passing an invalid size will not be
> > caught by the compiler. Wrap those functions in macros that take a
> > container type instead of a size, and cast the returned pointer to the
> > desired type. The compiler will catch mistakes if the incorrect type is
> > passed to the macro, as the assignment types won't match.
> 
> With a majority of drivers allocating a struct v4l2_async_subdev, it's
> tempting to have two versions of the APIs, one that just allocates
> struct v4l2_async_subdev, and one to embed it in a larger struct.
> 
> But that means duplicating the API, which sounds like an overkill.
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> > This patch is based on top of Ezequiel's "[PATCH 00/13] V4L2 Async
> > notifier API cleanup" series. It makes errors such as the one fixed by
> > "[PATCH] media: ti-vpe: cal: fix write to unallocated memory" impossible
> > to occur in the first place.
> > 
> >  drivers/media/i2c/max9286.c                   |  2 +-
> >  drivers/media/i2c/st-mipid02.c                |  2 +-
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 10 ++---
> >  drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
> >  drivers/media/platform/atmel/atmel-isi.c      |  2 +-
> >  .../media/platform/atmel/atmel-sama5d2-isc.c  |  2 +-
> >  drivers/media/platform/cadence/cdns-csi2rx.c  |  3 +-
> >  drivers/media/platform/davinci/vpif_capture.c |  2 +-
> >  drivers/media/platform/exynos4-is/media-dev.c |  3 +-
> >  .../media/platform/marvell-ccic/cafe-driver.c |  2 +-
> >  .../media/platform/marvell-ccic/mmp-driver.c  |  4 +-
> >  drivers/media/platform/omap3isp/isp.c         | 16 +++-----
> >  drivers/media/platform/pxa_camera.c           |  4 +-
> >  drivers/media/platform/qcom/camss/camss.c     | 11 ++----
> >  drivers/media/platform/rcar-vin/rcar-core.c   |  5 ++-
> >  drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
> >  drivers/media/platform/rcar_drif.c            |  2 +-
> >  drivers/media/platform/renesas-ceu.c          | 20 ++++------
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 10 ++---
> >  drivers/media/platform/stm32/stm32-dcmi.c     |  3 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +-
> >  drivers/media/platform/ti-vpe/cal.c           | 12 +++---
> >  drivers/media/platform/video-mux.c            |  2 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   | 10 ++---
> >  drivers/media/v4l2-core/v4l2-async.c          | 38 +++++++++----------
> >  drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
> >  drivers/staging/media/imx/imx-media-csi.c     |  2 +-
> >  drivers/staging/media/imx/imx-media-of.c      |  2 +-
> >  drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
> >  drivers/staging/media/imx/imx7-media-csi.c    |  2 +-
> >  drivers/staging/media/imx/imx7-mipi-csis.c    |  2 +-
> >  drivers/staging/media/tegra-video/vi.c        | 10 ++---
> >  include/media/v4l2-async.h                    | 36 ++++++++++++------
> >  33 files changed, 116 insertions(+), 117 deletions(-)
> > 
> [..]
> > diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> > index 18485812a21e..ae4ad255a46a 100644
> > --- a/drivers/media/platform/renesas-ceu.c
> > +++ b/drivers/media/platform/renesas-ceu.c
> > @@ -1473,7 +1473,6 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
> >                                    const struct ceu_platform_data *pdata)
> >  {
> >         const struct ceu_async_subdev *async_sd;
> > -       struct v4l2_async_subdev *asd;
> >         struct ceu_subdev *ceu_sd;
> >         unsigned int i;
> >         int ret;
> > @@ -1489,16 +1488,15 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
> >  
> >                 /* Setup the ceu subdevice and the async subdevice. */
> >                 async_sd = &pdata->subdevs[i];
> > -               asd = v4l2_async_notifier_add_i2c_subdev(&ceudev->notifier,
> > +               async_sd = v4l2_async_notifier_add_i2c_subdev(&ceudev->notifier,
> 
> Should be ceu_sd = v4l2_async_notifier_add_i2c_subdev(... here.

Oops. I haven't compile-tested the whole series, I had meant to send it
as an RFC to get feedback on the idea before performing tests, and I
then forgot to add the RFC :-S

> >                                 async_sd->i2c_adapter_id,
> >                                 async_sd->i2c_address,
> > -                               sizeof(*ceu_sd));
> > -               if (IS_ERR(asd)) {
> > -                       ret = PTR_ERR(asd);
> > +                               struct ceu_subdev);
> > +               if (IS_ERR(ceu_sd)) {
> > +                       ret = PTR_ERR(ceu_sd);
> >                         v4l2_async_notifier_cleanup(&ceudev->notifier);
> >                         return ret;
> >                 }
> > -               ceu_sd = to_ceu_subdev(asd);
> >                 ceu_sd->mbus_flags = async_sd->flags;
> >                 ceudev->subdevs[i] = ceu_sd;
> >         }
> > @@ -1513,7 +1511,6 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
> >  {
> >         struct device_node *of = ceudev->dev->of_node;
> >         struct device_node *ep;
> > -       struct v4l2_async_subdev *asd;
> >         struct ceu_subdev *ceu_sd;
> >         unsigned int i;
> >         int num_ep;
> > @@ -1555,14 +1552,13 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
> >                 }
> >  
> >                 /* Setup the ceu subdevice and the async subdevice. */
> > -               asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +               ceu_sd = v4l2_async_notifier_add_fwnode_remote_subdev(
> >                                 &ceudev->notifier, of_fwnode_handle(ep),
> > -                               sizeof(*ceu_sd));
> > -               if (IS_ERR(asd)) {
> > -                       ret = PTR_ERR(asd);
> > +                               struct ceu_subdev);
> > +               if (IS_ERR(ceu_sd)) {
> > +                       ret = PTR_ERR(ceu_sd);
> >                         goto error_cleanup;
> >                 }
> > -               ceu_sd = to_ceu_subdev(asd);
> >                 ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
> >                 ceudev->subdevs[i] = ceu_sd;
> >  
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 235dcf0c4122..447721e78d1e 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -251,8 +251,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >                 struct v4l2_fwnode_endpoint vep = {
> >                         .bus_type = V4L2_MBUS_CSI2_DPHY
> >                 };
> > -               struct rkisp1_sensor_async *rk_asd = NULL;
> > -               struct v4l2_async_subdev *asd;
> > +               struct rkisp1_sensor_async *rk_asd;
> >                 struct fwnode_handle *ep;
> >  
> >                 ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> > @@ -265,12 +264,11 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >                 if (ret)
> >                         goto err_parse;
> >  
> > -               asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > -                                                       sizeof(*rk_asd));
> > -               if (IS_ERR(asd))
> > +               rk_asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > +                                                       struct rkisp1_sensor_async);
> > +               if (IS_ERR(rk_asd))
> >                         goto err_parse;
> >  
> > -               rk_asd = container_of(asd, struct rkisp1_sensor_async, asd);
> >                 rk_asd->mbus_type = vep.bus_type;
> >                 rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> >                 rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> > diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> > index 142f63d07dcd..bbcc2254fa2e 100644
> > --- a/drivers/media/platform/stm32/stm32-dcmi.c
> > +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> > @@ -1820,7 +1820,8 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
> >         v4l2_async_notifier_init(&dcmi->notifier);
> >  
> >         asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > -               &dcmi->notifier, of_fwnode_handle(ep), sizeof(*asd));
> > +               &dcmi->notifier, of_fwnode_handle(ep),
> > +               struct v4l2_async_subdev);
> >  
> >         of_node_put(ep);
> >  
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index 3f94b8c966f3..8d40a7acba9c 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -135,8 +135,8 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
> >  
> >         csi->bus = vep.bus.parallel;
> >  
> > -       asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
> > -                                                          ep, sizeof(*asd));
> > +       asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier, ep,
> > +                                                          struct v4l2_async_subdev);
> >         if (IS_ERR(asd)) {
> >                 ret = PTR_ERR(asd);
> >                 goto out;
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 293cbac905b3..9169068a23a9 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -685,23 +685,21 @@ static int cal_async_notifier_register(struct cal_dev *cal)
> >         for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> >                 struct cal_camerarx *phy = cal->phy[i];
> >                 struct cal_v4l2_async_subdev *casd;
> > -               struct v4l2_async_subdev *asd;
> >                 struct fwnode_handle *fwnode;
> >  
> >                 if (!phy->sensor_node)
> >                         continue;
> >  
> >                 fwnode = of_fwnode_handle(phy->sensor_node);
> > -               asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
> > -                                                           fwnode,
> > -                                                           sizeof(*asd));
> > -               if (IS_ERR(asd)) {
> > +               casd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
> > +                                                            fwnode,
> > +                                                            struct v4l2_async_subdev);
> 
> Should be passing struct cal_v4l2_async_subdev instead of struct v4l2_async_subdev.

Indeed. The good thing is that the compiler now complains :-)

> > +               if (IS_ERR(casd)) {
> >                         phy_err(phy, "Failed to add subdev to notifier\n");
> > -                       ret = PTR_ERR(asd);
> > +                       ret = PTR_ERR(casd);
> >                         goto error;
> >                 }
> >  
> > -               casd = to_cal_asd(asd);
> >                 casd->phy = phy;
> >         }
> >  
> [..]
> 
> The rest of the conversions look good.
> 
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 121f7d9dcbe6..72c3f4fe1148 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -189,9 +189,12 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> >   * is released later at notifier cleanup time.
> >   */
> >  struct v4l2_async_subdev *
> > -v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> > -                                     struct fwnode_handle *fwnode,
> > -                                     unsigned int asd_struct_size);
> > +__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> > +                                       struct fwnode_handle *fwnode,
> > +                                       unsigned int asd_struct_size);
> > +#define v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode, __type)    \
> > +((__type *)__v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode,       \
> > +                                                  sizeof(__type)))
> >  
> >  /**
> >   * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
> > @@ -215,9 +218,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >   * exception that the fwnode refers to a local endpoint, not the remote one.
> >   */
> >  struct v4l2_async_subdev *
> > -v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> > -                                            struct fwnode_handle *endpoint,
> > -                                            unsigned int asd_struct_size);
> > +__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> > +                                              struct fwnode_handle *endpoint,
> > +                                              unsigned int asd_struct_size);
> > +#define v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep, __type) \
> > +((__type *)__v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep,    \
> > +                                                         sizeof(__type)))
> >  
> >  /**
> >   * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
> > @@ -235,9 +241,12 @@ v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> >   * Same as above but for I2C matched sub-devices.
> >   */
> >  struct v4l2_async_subdev *
> > -v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
> > -                                  int adapter_id, unsigned short address,
> > -                                  unsigned int asd_struct_size);
> > +__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
> > +                                    int adapter_id, unsigned short address,
> > +                                    unsigned int asd_struct_size);
> > +#define v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr, __type) \
> > +((__type *)__v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr,    \
> > +                                               sizeof(__type)))
> >  
> >  /**
> >   * v4l2_async_notifier_add_devname_subdev - Allocate and add a device-name
> > @@ -254,9 +263,12 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
> >   * Same as above but for device-name matched sub-devices.
> >   */
> >  struct v4l2_async_subdev *
> > -v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
> > -                                      const char *device_name,
> > -                                      unsigned int asd_struct_size);
> > +__v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
> > +                                        const char *device_name,
> > +                                        unsigned int asd_struct_size);
> > +#define v4l2_async_notifier_add_devname_subdev(__notifier, __name, __type)     \
> > +((__type *)__v4l2_async_notifier_add_devname_subdev(__notifier, __name,                \
> > +                                                   sizeof(__type)))
> 
> I'm not thrilled about having a API that returns a type like this,
> as it makes it a bit confusing. But of course, being able to catch
> the error at compile-times I think justifies it.
> 
> Would you like me to fold this patch in my v2 cleanup series?

Please do if you can.

-- 
Regards,

Laurent Pinchart
