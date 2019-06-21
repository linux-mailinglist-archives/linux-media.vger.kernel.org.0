Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2F934E342
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 11:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfFUJSW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 05:18:22 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:60763 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfFUJSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 05:18:22 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2ADAB1BF20B;
        Fri, 21 Jun 2019 09:18:12 +0000 (UTC)
Date:   Fri, 21 Jun 2019 11:19:27 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/9] v4l2-async: Use endpoint node, not device node,
 for fwnode match
Message-ID: <20190621091927.iwwpmhiyzs5dsell@uno.localdomain>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-3-sakari.ailus@linux.intel.com>
 <20190614212105.GA20468@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6dprom3exczojuc7"
Content-Disposition: inline
In-Reply-To: <20190614212105.GA20468@bigcity.dyn.berto.se>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6dprom3exczojuc7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Jun 14, 2019 at 11:21:05PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Sakari,
>
> Thanks for your work and sorry that I missed this and replied to v1 the
> other day. I have tested v2 now and unfortunately it still breaks
> rcar-vin, see bellow :-(
>
> On 2019-06-06 16:02:18 +0300, Sakari Ailus wrote:
> > V4L2 async framework can use both device's fwnode and endpoints's fwnode
> > for matching the async sub-device with the sub-device. In order to proc=
eed
> > moving towards endpoint matching assign the endpoint to the async
> > sub-device.
> >
> > As most async sub-device drivers (and the related hardware) only suppor=
ts
> > a single endpoint, use the first endpoint found. This works for all
> > current drivers --- we only ever supported a single async sub-device per
> > device to begin with.
>
> Unfortunately this breaks for rcar-vin and adv7604 on Koelsch :-(
>
> In DT we have the node:
>
> i2chdmi: i2c-13 {
>     hdmi-in@4c {
> 	    compatible =3D "adi,adv7612";
>
> 	    ports {
> 		    #address-cells =3D <1>;
> 		    #size-cells =3D <0>;
>
> 		    port@0 {
> 			    reg =3D <0>;
> 			    adv7612_in: endpoint {
> 				    remote-endpoint =3D <&hdmi_con_in>;
> 			    };
> 		    };
>
> 		    port@2 {
> 			    reg =3D <2>;
> 			    adv7612_out: endpoint {
> 				    remote-endpoint =3D <&vin0ep2>;
> 			    };
> 		    };
> 	    };
>     };
> };
>
> - The rcar-vin in rvin_parallel_init() parses the DT using the
>   v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper and
>   registers '/i2c-13/hdmi-in@4c/ports/port@2/endpoint' with the async
>   framework.
>
> - The adv7604 register itself with async using
>   '/i2c-13/hdmi-in@4c/ports/port@0/endpoint'.
>
> The result is that matching breaks and the two devices never find each
> other. I'm not sure how to solve this :-( Maybe the subdevices could
> register itself multiple times with the async framework, once for each
> port described?

Isn't this an issue on adv7604 side? With Sakari's patches the fwnode
of the first available endpoint is used for matching, and in case of
adv7604 is the one that connects to the HDMI connector.

Shouldn't the adv7604 driver register its async subdev by using the
fwnode handle of its only source port instead?

That said, I wonder how many of these similar situation would go
unoticed without someone doing the testing, as this is a run-time
failure hard to detect at development time.

>
> That would open up for the same subdev to be bound multiple times,
> possibly to different consumers. I think that is a direction that would
> be useful but I fear there might be some work involved in allowing that
> from a subdev point of view.
>
> >
> > For async devices that have no endpoints, continue to use the fwnode
> > related to the device. This includes e.g. lens devices.
> >
> > Depends-on: ("pxa-camera: Match with device node, not the port node")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
> >  drivers/media/platform/atmel/atmel-isc.c      |  2 +-
> >  drivers/media/platform/atmel/atmel-isi.c      |  2 +-
> >  drivers/media/platform/cadence/cdns-csi2rx.c  |  2 +-
> >  drivers/media/platform/davinci/vpif_capture.c | 20 +++++++++++++++-----
> >  drivers/media/platform/exynos4-is/media-dev.c | 14 ++++++++++----
> >  drivers/media/platform/pxa_camera.c           |  2 +-
> >  drivers/media/platform/qcom/camss/camss.c     | 10 +++++-----
> >  drivers/media/platform/rcar_drif.c            |  2 +-
> >  drivers/media/platform/renesas-ceu.c          |  2 +-
> >  drivers/media/platform/stm32/stm32-dcmi.c     |  2 +-
> >  drivers/media/platform/ti-vpe/cal.c           |  2 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   | 13 ++++++++++---
> >  drivers/media/v4l2-core/v4l2-async.c          |  9 +++++++--
> >  drivers/media/v4l2-core/v4l2-fwnode.c         |  8 +++-----
> >  drivers/staging/media/soc_camera/soc_camera.c | 14 ++++++++------
> >  16 files changed, 67 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/medi=
a/platform/am437x/am437x-vpfe.c
> > index fe7b937eb5f2..db263c0ce48e 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -2495,7 +2495,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
> >  		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> >  			sdinfo->vpfe_param.vdpol =3D 1;
> >
> > -		rem =3D of_graph_get_remote_port_parent(endpoint);
> > +		rem =3D of_graph_get_remote_endpoint(endpoint);
> >  		if (!rem) {
> >  			dev_err(dev, "Remote device at %pOF not found\n",
> >  				endpoint);
> > diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/p=
latform/atmel/atmel-isc.c
> > index da3b441e7961..fad10e6d5ecf 100644
> > --- a/drivers/media/platform/atmel/atmel-isc.c
> > +++ b/drivers/media/platform/atmel/atmel-isc.c
> > @@ -2352,7 +2352,7 @@ static int isc_parse_dt(struct device *dev, struc=
t isc_device *isc)
> >  		if (!epn)
> >  			return 0;
> >
> > -		rem =3D of_graph_get_remote_port_parent(epn);
> > +		rem =3D of_graph_get_remote_endpoint(epn);
> >  		if (!rem) {
> >  			dev_notice(dev, "Remote device at %pOF not found\n",
> >  				   epn);
> > diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/p=
latform/atmel/atmel-isi.c
> > index 08b8d5583080..e4e74454e016 100644
> > --- a/drivers/media/platform/atmel/atmel-isi.c
> > +++ b/drivers/media/platform/atmel/atmel-isi.c
> > @@ -1110,7 +1110,7 @@ static int isi_graph_parse(struct atmel_isi *isi,=
 struct device_node *node)
> >  	if (!ep)
> >  		return -EINVAL;
> >
> > -	remote =3D of_graph_get_remote_port_parent(ep);
> > +	remote =3D of_graph_get_remote_endpoint(ep);
> >  	of_node_put(ep);
> >  	if (!remote)
> >  		return -EINVAL;
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/med=
ia/platform/cadence/cdns-csi2rx.c
> > index 31ace114eda1..2da34b93e8f4 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -395,7 +395,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2=
rx)
> >  		return -EINVAL;
> >  	}
> >
> > -	csi2rx->asd.match.fwnode =3D fwnode_graph_get_remote_port_parent(fwh);
> > +	csi2rx->asd.match.fwnode =3D fwnode_graph_get_remote_endpoint(fwh);
> >  	csi2rx->asd.match_type =3D V4L2_ASYNC_MATCH_FWNODE;
> >  	of_node_put(ep);
> >
> > diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/me=
dia/platform/davinci/vpif_capture.c
> > index 72bdb3c10962..8fdea45ae090 100644
> > --- a/drivers/media/platform/davinci/vpif_capture.c
> > +++ b/drivers/media/platform/davinci/vpif_capture.c
> > @@ -1542,7 +1542,7 @@ vpif_capture_get_pdata(struct platform_device *pd=
ev)
> >
> >  	for (i =3D 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
> >  		struct v4l2_fwnode_endpoint bus_cfg =3D { .bus_type =3D 0 };
> > -		struct device_node *rem;
> > +		struct device_node *rem, *rem_ep;
> >  		unsigned int flags;
> >  		int err;
> >
> > @@ -1551,13 +1551,22 @@ vpif_capture_get_pdata(struct platform_device *=
pdev)
> >  		if (!endpoint)
> >  			break;
> >
> > -		rem =3D of_graph_get_remote_port_parent(endpoint);
> > -		if (!rem) {
> > -			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
> > +		rem_ep =3D of_graph_get_remote_endpoint(endpoint);
> > +		if (!rem_ep) {
> > +			dev_dbg(&pdev->dev, "Remote for endpoint %pOF not found\n",
> >  				endpoint);
> >  			goto done;
> >  		}
> >
> > +		rem =3D of_graph_get_port_parent(rem_ep);
> > +		if (!rem) {
> > +			dev_dbg(&pdev->dev, "Remote endpoint at %pOF not found\n",
> > +				rem_ep);
> > +			of_node_put(rem_ep);
> > +			goto done;
> > +		}
> > +		of_node_put(rem_ep);
> > +
> >  		sdinfo =3D &pdata->subdev_info[i];
> >  		chan =3D &pdata->chan_config[i];
> >  		chan->inputs =3D devm_kcalloc(&pdev->dev,
> > @@ -1597,12 +1606,13 @@ vpif_capture_get_pdata(struct platform_device *=
pdev)
> >  		sdinfo->name =3D rem->full_name;
> >
> >  		pdata->asd[i] =3D v4l2_async_notifier_add_fwnode_subdev(
> > -			&vpif_obj.notifier, of_fwnode_handle(rem),
> > +			&vpif_obj.notifier, of_fwnode_handle(rem_ep),
> >  			sizeof(struct v4l2_async_subdev));
> >  		if (IS_ERR(pdata->asd[i])) {
> >  			of_node_put(rem);
> >  			goto err_cleanup;
> >  		}
> > +
> >  	}
> >
> >  done:
> > diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/me=
dia/platform/exynos4-is/media-dev.c
> > index d1d5041cdae5..0cbc2076b94d 100644
> > --- a/drivers/media/platform/exynos4-is/media-dev.c
> > +++ b/drivers/media/platform/exynos4-is/media-dev.c
> > @@ -411,7 +411,7 @@ static int fimc_md_parse_port_node(struct fimc_md *=
fmd,
> >
> >  	pd->mux_id =3D (endpoint.base.port - 1) & 0x1;
> >
> > -	rem =3D of_graph_get_remote_port_parent(ep);
> > +	rem =3D of_graph_get_remote_endpoint(ep);
> >  	of_node_put(ep);
> >  	if (rem =3D=3D NULL) {
> >  		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
> > @@ -1376,11 +1376,17 @@ static int subdev_notifier_bound(struct v4l2_as=
ync_notifier *notifier,
> >  	int i;
> >
> >  	/* Find platform data for this sensor subdev */
> > -	for (i =3D 0; i < ARRAY_SIZE(fmd->sensor); i++)
> > -		if (fmd->sensor[i].asd.match.fwnode =3D=3D
> > -		    of_fwnode_handle(subdev->dev->of_node))
> > +	for (i =3D 0; i < ARRAY_SIZE(fmd->sensor); i++) {
> > +		struct fwnode_handle *fwnode =3D
> > +			fwnode_graph_get_remote_port_parent(fmd->sensor[i].asd.
> > +							    match.fwnode);
> > +
> > +		if (fwnode =3D=3D of_fwnode_handle(subdev->dev->of_node))
> >  			si =3D &fmd->sensor[i];
> >
> > +		fwnode_handle_put(fwnode);
> > +	}
> > +
> >  	if (si =3D=3D NULL)
> >  		return -EINVAL;
> >
> > diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platfo=
rm/pxa_camera.c
> > index a7b2b89d6155..0aeba52aee13 100644
> > --- a/drivers/media/platform/pxa_camera.c
> > +++ b/drivers/media/platform/pxa_camera.c
> > @@ -2350,7 +2350,7 @@ static int pxa_camera_pdata_from_dt(struct device=
 *dev,
> >  		pcdev->platform_flags |=3D PXA_CAMERA_PCLK_EN;
> >
> >  	asd->match_type =3D V4L2_ASYNC_MATCH_FWNODE;
> > -	remote =3D of_graph_get_remote_port_parent(np);
> > +	remote =3D of_graph_get_remote_endpoint(np);
> >  	if (remote)
> >  		asd->match.fwnode =3D of_fwnode_handle(remote);
> >  	else
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 63da18773d24..a979f210f441 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -466,7 +466,7 @@ static int camss_of_parse_ports(struct camss *camss)
> >  {
> >  	struct device *dev =3D camss->dev;
> >  	struct device_node *node =3D NULL;
> > -	struct device_node *remote =3D NULL;
> > +	struct fwnode_handle *remote =3D NULL;
> >  	int ret, num_subdevs =3D 0;
> >
> >  	for_each_endpoint_of_node(dev->of_node, node) {
> > @@ -476,7 +476,8 @@ static int camss_of_parse_ports(struct camss *camss)
> >  		if (!of_device_is_available(node))
> >  			continue;
> >
> > -		remote =3D of_graph_get_remote_port_parent(node);
> > +		remote =3D fwnode_graph_get_remote_endpoint(
> > +			of_fwnode_handle(node));
> >  		if (!remote) {
> >  			dev_err(dev, "Cannot get remote parent\n");
> >  			ret =3D -EINVAL;
> > @@ -484,11 +485,10 @@ static int camss_of_parse_ports(struct camss *cam=
ss)
> >  		}
> >
> >  		asd =3D v4l2_async_notifier_add_fwnode_subdev(
> > -			&camss->notifier, of_fwnode_handle(remote),
> > -			sizeof(*csd));
> > +			&camss->notifier, remote, sizeof(*csd));
> >  		if (IS_ERR(asd)) {
> >  			ret =3D PTR_ERR(asd);
> > -			of_node_put(remote);
> > +			fwnode_handle_put(remote);
> >  			goto err_cleanup;
> >  		}
> >
> > diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platfor=
m/rcar_drif.c
> > index 608e5217ccd5..258e14c290e8 100644
> > --- a/drivers/media/platform/rcar_drif.c
> > +++ b/drivers/media/platform/rcar_drif.c
> > @@ -1222,7 +1222,7 @@ static int rcar_drif_parse_subdevs(struct rcar_dr=
if_sdr *sdr)
> >  	if (!ep)
> >  		return 0;
> >
> > -	fwnode =3D fwnode_graph_get_remote_port_parent(ep);
> > +	fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> >  	if (!fwnode) {
> >  		dev_warn(sdr->dev, "bad remote port parent\n");
> >  		fwnode_handle_put(ep);
> > diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platf=
orm/renesas-ceu.c
> > index 57d0c0f9fa4b..1e625d560258 100644
> > --- a/drivers/media/platform/renesas-ceu.c
> > +++ b/drivers/media/platform/renesas-ceu.c
> > @@ -1581,7 +1581,7 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
> >  		ceu_sd =3D &ceudev->subdevs[i];
> >  		INIT_LIST_HEAD(&ceu_sd->asd.list);
> >
> > -		remote =3D of_graph_get_remote_port_parent(ep);
> > +		remote =3D of_graph_get_remote_endpoint(ep);
> >  		ceu_sd->mbus_flags =3D fw_ep.bus.parallel.flags;
> >  		ceu_sd->asd.match_type =3D V4L2_ASYNC_MATCH_FWNODE;
> >  		ceu_sd->asd.match.fwnode =3D of_fwnode_handle(remote);
> > diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/=
platform/stm32/stm32-dcmi.c
> > index d855e9c09c08..3c91fe84e0d5 100644
> > --- a/drivers/media/platform/stm32/stm32-dcmi.c
> > +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> > @@ -1602,7 +1602,7 @@ static int dcmi_graph_parse(struct stm32_dcmi *dc=
mi, struct device_node *node)
> >  	if (!ep)
> >  		return -EINVAL;
> >
> > -	remote =3D of_graph_get_remote_port_parent(ep);
> > +	remote =3D of_graph_get_remote_endpoint(ep);
> >  	of_node_put(ep);
> >  	if (!remote)
> >  		return -EINVAL;
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platfo=
rm/ti-vpe/cal.c
> > index 8d075683e448..d7995e2f4c54 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -1693,7 +1693,7 @@ static int of_cal_create_instance(struct cal_ctx =
*ctx, int inst)
> >  		goto cleanup_exit;
> >  	}
> >
> > -	sensor_node =3D of_graph_get_remote_port_parent(ep_node);
> > +	sensor_node =3D of_graph_get_remote_endpoint(ep_node);
> >  	if (!sensor_node) {
> >  		ctx_dbg(3, ctx, "can't get remote parent\n");
> >  		goto cleanup_exit;
> > diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/medi=
a/platform/xilinx/xilinx-vipp.c
> > index edce0402155d..41df417153bd 100644
> > --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> > +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >
> >  #include <media/v4l2-async.h>
> > @@ -81,6 +82,8 @@ static int xvip_graph_build_one(struct xvip_composite=
_device *xdev,
> >  	dev_dbg(xdev->dev, "creating links for entity %s\n", local->name);
> >
> >  	while (1) {
> > +		struct fwnode_handle *fwnode;
> > +
> >  		/* Get the next endpoint and parse its link. */
> >  		ep =3D fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
> >  						    ep);
> > @@ -116,11 +119,13 @@ static int xvip_graph_build_one(struct xvip_compo=
site_device *xdev,
> >  			continue;
> >  		}
> >
> > +		fwnode =3D fwnode_graph_get_port_parent(link.remote_node);
> > +		fwnode_handle_put(fwnode);
> > +
> >  		/* Skip DMA engines, they will be processed separately. */
> > -		if (link.remote_node =3D=3D of_fwnode_handle(xdev->dev->of_node)) {
> > +		if (fwnode =3D=3D dev_fwnode(xdev->dev)) {
> >  			dev_dbg(xdev->dev, "skipping DMA port %p:%u\n",
> >  				link.local_node, link.local_port);
> > -			v4l2_fwnode_put_link(&link);
> >  			continue;
> >  		}
> >
> > @@ -374,9 +379,11 @@ static int xvip_graph_parse_one(struct xvip_compos=
ite_device *xdev,
> >  		}
> >
> >  		fwnode_handle_put(ep);
> > +		fwnode =3D fwnode_graph_get_port_parent(remote);
> > +		fwnode_handle_put(fwnode);
> >
> >  		/* Skip entities that we have already processed. */
> > -		if (remote =3D=3D of_fwnode_handle(xdev->dev->of_node) ||
> > +		if (fwnode =3D=3D dev_fwnode(xdev->dev) ||
> >  		    xvip_graph_find_entity(xdev, remote)) {
> >  			fwnode_handle_put(remote);
> >  			continue;
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-=
core/v4l2-async.c
> > index 15b0c44a76e7..304969ff3191 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -670,8 +670,13 @@ int v4l2_async_register_subdev(struct v4l2_subdev =
*sd)
> >  	 * (struct v4l2_subdev.dev), and async sub-device does not
> >  	 * exist independently of the device at any point of time.
> >  	 */
> > -	if (!sd->fwnode && sd->dev)
> > -		sd->fwnode =3D dev_fwnode(sd->dev);
> > +	if (!sd->fwnode && sd->dev) {
> > +		sd->fwnode =3D fwnode_graph_get_next_endpoint(
> > +			dev_fwnode(sd->dev), NULL);
> > +		fwnode_handle_put(sd->fwnode);
> > +		if (!sd->fwnode)
> > +			sd->fwnode =3D dev_fwnode(sd->dev);
> > +	}
> >
> >  	mutex_lock(&list_lock);
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2=
-core/v4l2-fwnode.c
> > index dea8917fd912..810b6584b522 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -617,7 +617,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct de=
vice *dev,
> >
> >  	asd->match_type =3D V4L2_ASYNC_MATCH_FWNODE;
> >  	asd->match.fwnode =3D
> > -		fwnode_graph_get_remote_port_parent(endpoint);
> > +		fwnode_graph_get_remote_endpoint(endpoint);
> >  	if (!asd->match.fwnode) {
> >  		dev_dbg(dev, "no remote endpoint found\n");
> >  		ret =3D -ENOTCONN;
> > @@ -1051,7 +1051,6 @@ v4l2_fwnode_reference_parse_int_props(struct devi=
ce *dev,
> >  {
> >  	struct fwnode_handle *fwnode;
> >  	unsigned int index;
> > -	int ret;
> >  	const char *prop =3D p->name;
> >  	const char * const *props =3D p->props;
> >  	unsigned int nprops =3D p->nprops;
> > @@ -1087,9 +1086,8 @@ v4l2_fwnode_reference_parse_int_props(struct devi=
ce *dev,
> >  		asd =3D v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
> >  							    sizeof(*asd));
> >  		if (IS_ERR(asd)) {
> > -			ret =3D PTR_ERR(asd);
> >  			/* not an error if asd already exists */
> > -			if (ret =3D=3D -EEXIST) {
> > +			if (PTR_ERR(asd) =3D=3D -EEXIST) {
> >  				fwnode_handle_put(fwnode);
> >  				continue;
> >  			}
> > @@ -1102,7 +1100,7 @@ v4l2_fwnode_reference_parse_int_props(struct devi=
ce *dev,
> >
> >  error:
> >  	fwnode_handle_put(fwnode);
> > -	return ret;
> > +	return PTR_ERR(fwnode);
> >  }
> >
> >  int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
> > diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/st=
aging/media/soc_camera/soc_camera.c
> > index a6232dcd59bc..f0768b469fc2 100644
> > --- a/drivers/staging/media/soc_camera/soc_camera.c
> > +++ b/drivers/staging/media/soc_camera/soc_camera.c
> > @@ -1514,6 +1514,7 @@ static int soc_of_bind(struct soc_camera_host *ic=
i,
> >  	struct soc_camera_async_client *sasc;
> >  	struct soc_of_info *info;
> >  	struct i2c_client *client;
> > +	struct device_node *np;
> >  	char clk_name[V4L2_CLK_NAME_SIZE];
> >  	int ret;
> >
> > @@ -1548,23 +1549,23 @@ static int soc_of_bind(struct soc_camera_host *=
ici,
> >  	v4l2_async_notifier_init(&sasc->notifier);
> >
> >  	ret =3D v4l2_async_notifier_add_subdev(&sasc->notifier, info->subdev);
> > -	if (ret) {
> > -		of_node_put(remote);
> > +	if (ret)
> >  		goto eaddasd;
> > -	}
> >
> >  	sasc->notifier.ops =3D &soc_camera_async_ops;
> >
> >  	icd->sasc =3D sasc;
> >  	icd->parent =3D ici->v4l2_dev.dev;
> > +	np =3D of_graph_get_port_parent(remote);
> > +	of_node_put(remote);
> >
> > -	client =3D of_find_i2c_device_by_node(remote);
> > +	client =3D of_find_i2c_device_by_node(np);
> >
> >  	if (client)
> >  		v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
> >  				  client->adapter->nr, client->addr);
> >  	else
> > -		v4l2_clk_name_of(clk_name, sizeof(clk_name), remote);
> > +		v4l2_clk_name_of(clk_name, sizeof(clk_name), np);
> >
> >  	icd->clk =3D v4l2_clk_register(&soc_camera_clk_ops, clk_name, icd);
> >  	if (IS_ERR(icd->clk)) {
> > @@ -1587,6 +1588,7 @@ static int soc_of_bind(struct soc_camera_host *ic=
i,
> >  eallocpdev:
> >  	devm_kfree(ici->v4l2_dev.dev, info);
> >  	dev_err(ici->v4l2_dev.dev, "group probe failed: %d\n", ret);
> > +	of_node_put(np);
> >
> >  	return ret;
> >  }
> > @@ -1603,7 +1605,7 @@ static void scan_of_host(struct soc_camera_host *=
ici)
> >  		if (!epn)
> >  			break;
> >
> > -		rem =3D of_graph_get_remote_port_parent(epn);
> > +		rem =3D of_graph_get_remote_endpoint(epn);
> >  		if (!rem) {
> >  			dev_notice(dev, "no remote for %pOF\n", epn);
> >  			continue;
> > --
> > 2.11.0
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--6dprom3exczojuc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0MoR4ACgkQcjQGjxah
VjzJlRAAxSm+j4yUrJ0K2Fkp5zQggkJ4oTtjf0Zp5mq2+i+dzmffdk+uf+3D3OYr
Of3B5GZ6F9hVNRx5wXtg6JuH0smrNX/7dktves9kk/svtUfkT0mKmSjEToopMCGy
IObcL4YvxmFb3LIQcTNJOzJceywvPHyIDS6ENxoRQ7LDMtTkPhjCHWXgxCCAAGkB
xf/niykyKsqVSCiwjHxnQW5pneeUz6l3hLrbAMP2kWVQUZ13ZLfCJMH3gkey6v5z
aDBYbANQCviAcTsbAxS4cBYERIxNoODMAH+B9vwziazYw1jh4fsrASrCnyunaZv2
EPSAJfpTba9VJR5pmohs6vulTQGufZiZltYHmg8a2pEPuBisCywAwud4QT7jlZGH
CuL4kyBNUcaN9EuqxTGHBmd7zSapxKp6c5nlfYRqHUmYcAspHvn5UIFShjKW39oq
Gw2AGIKNw4vEnCQdDSpsmYte7FoR8dKYrRqYF8h55waD114bNV/a20gN5uTH8ese
EWx2rrvtt0U4HtyIXFRrKXz1n8XCBLPLiSbXE/XKSfijXMWiC8YmLqGhfqZu1bZd
OaoT/1lv9iu73YKikhCIh8nQB6WQXBe9wt0ybaBoMXU0ipm7/zMu5TVmf5wpV4IL
BAp90K6MX48Sr1lZzYq8YX9gSfWGqzIYrkkk2KZSTw/eym1o4fI=
=B0Ok
-----END PGP SIGNATURE-----

--6dprom3exczojuc7--
