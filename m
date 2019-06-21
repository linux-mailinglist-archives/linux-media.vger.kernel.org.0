Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9FC4E748
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 13:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfFULn3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 07:43:29 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42434 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfFULn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 07:43:29 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so5659636lje.9
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2019 04:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cYFnLjlSOX8ShLghaV6sW7jviTI6clZjrNSVqLlmfXU=;
        b=S1/GE2litbm9PnAwNvtgOczrBFIgzBhydOS4qY4FX604jatFkPGHIhUB3Zm01rCEJG
         L4qqTxeAUe4rvZONl4AzD2/GwrhCAmRXmiOGrsHvN1mGqrTtPFfc/fbXES787o04jCHA
         WWi+lkHHLO1iqn77pZoko6YRkt59iw/l6FCI7hiRFuf8ivORfRwPND42h3OkEln5vfr0
         GUro4tn8pv1st7cftcUoC1+CYeJ7EF4nTZgARl7Hgs1o0VNZ7MjwC5B7EM9lwNbpzua6
         CJVde5UC/3feaZaVMnGSJfdKx5yYMo7knTGSL+IrMtmmn1D9XOPpLbZ6FsPujGTXGjmz
         4iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cYFnLjlSOX8ShLghaV6sW7jviTI6clZjrNSVqLlmfXU=;
        b=tFKhEpeBIA5FQ5FIsjA2eSrVU6J7KfVcjnpJGsuU2S+F5MupdeLnLJPgVhad4IX7Qo
         rNlEnoQwARS6aWEkRmwcaubByZt/kdLsm4EiAsTIR90b2wg3yg53zleIAb7/4S/9gpt5
         EPLfdXXbe8YbMJMHb3vIgE3TbC/XAbu/QCHg713AQTEEmonUVG6wKZ0TDH3GviJJZ7jj
         U56pRPvNT0gMGJK+ttwhZ/50SM8mmBy5lKo3W/DdVfZTJsfpi84YVNqmVFGNOMx5SOQJ
         Q+bxe5kSKhse1gjSmYIT2Z5Z9CdpAssjxKC9n8swEtPVTBuGDwULcqFVRkIdW7aXA1fX
         DYyA==
X-Gm-Message-State: APjAAAWS63LkCnlJLaWYWekUKTO++rza9GBCpw9Cd64abqleftZ2+U1v
        tUbuXgvjRb6WYvQPV+oefqh46g==
X-Google-Smtp-Source: APXvYqzEpZZoUka+EHsPu1wDl5ibrN9dJLA+1UyhCb01pixaWKNVu41hqxZhuQ66QPGlTgkqvg4ZRw==
X-Received: by 2002:a2e:8681:: with SMTP id l1mr15560230lji.166.1561117405225;
        Fri, 21 Jun 2019 04:43:25 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id h23sm361509ljg.17.2019.06.21.04.43.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 04:43:24 -0700 (PDT)
Date:   Fri, 21 Jun 2019 13:43:23 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/9] v4l2-async: Use endpoint node, not device node,
 for fwnode match
Message-ID: <20190621114323.GB1425@bigcity.dyn.berto.se>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-3-sakari.ailus@linux.intel.com>
 <20190614212105.GA20468@bigcity.dyn.berto.se>
 <20190621091927.iwwpmhiyzs5dsell@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190621091927.iwwpmhiyzs5dsell@uno.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 2019-06-21 11:19:27 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Fri, Jun 14, 2019 at 11:21:05PM +0200, Niklas S�derlund wrote:
> > Hi Sakari,
> >
> > Thanks for your work and sorry that I missed this and replied to v1 the
> > other day. I have tested v2 now and unfortunately it still breaks
> > rcar-vin, see bellow :-(
> >
> > On 2019-06-06 16:02:18 +0300, Sakari Ailus wrote:
> > > V4L2 async framework can use both device's fwnode and endpoints's fwnode
> > > for matching the async sub-device with the sub-device. In order to proceed
> > > moving towards endpoint matching assign the endpoint to the async
> > > sub-device.
> > >
> > > As most async sub-device drivers (and the related hardware) only supports
> > > a single endpoint, use the first endpoint found. This works for all
> > > current drivers --- we only ever supported a single async sub-device per
> > > device to begin with.
> >
> > Unfortunately this breaks for rcar-vin and adv7604 on Koelsch :-(
> >
> > In DT we have the node:
> >
> > i2chdmi: i2c-13 {
> >     hdmi-in@4c {
> > 	    compatible = "adi,adv7612";
> >
> > 	    ports {
> > 		    #address-cells = <1>;
> > 		    #size-cells = <0>;
> >
> > 		    port@0 {
> > 			    reg = <0>;
> > 			    adv7612_in: endpoint {
> > 				    remote-endpoint = <&hdmi_con_in>;
> > 			    };
> > 		    };
> >
> > 		    port@2 {
> > 			    reg = <2>;
> > 			    adv7612_out: endpoint {
> > 				    remote-endpoint = <&vin0ep2>;
> > 			    };
> > 		    };
> > 	    };
> >     };
> > };
> >
> > - The rcar-vin in rvin_parallel_init() parses the DT using the
> >   v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper and
> >   registers '/i2c-13/hdmi-in@4c/ports/port@2/endpoint' with the async
> >   framework.
> >
> > - The adv7604 register itself with async using
> >   '/i2c-13/hdmi-in@4c/ports/port@0/endpoint'.
> >
> > The result is that matching breaks and the two devices never find each
> > other. I'm not sure how to solve this :-( Maybe the subdevices could
> > register itself multiple times with the async framework, once for each
> > port described?
> 
> Isn't this an issue on adv7604 side? With Sakari's patches the fwnode
> of the first available endpoint is used for matching, and in case of
> adv7604 is the one that connects to the HDMI connector.
> 
> Shouldn't the adv7604 driver register its async subdev by using the
> fwnode handle of its only source port instead?

It should ;-)

What I tried to express above was that I think one direction to this 
would be solved in a nice way would be to have all subdevices register 
themself using all endpoints described AND allow being bound multiple 
multiple times, once for each endpoint. This would however require some 
work, as the subdevices of today can only be bound once.

In the short term changing the adv7604 to register using the endpoint 
which 'represents' its source pad would solve this. But what about 
adv7482 which have more then one endpoint describing a source? Today 
this is hacked together with custom matching logic in rcar-csi2 which is 
not super nice.

> 
> That said, I wonder how many of these similar situation would go
> unoticed without someone doing the testing, as this is a run-time
> failure hard to detect at development time.

This is also a good point.

> 
> >
> > That would open up for the same subdev to be bound multiple times,
> > possibly to different consumers. I think that is a direction that would
> > be useful but I fear there might be some work involved in allowing that
> > from a subdev point of view.
> >
> > >
> > > For async devices that have no endpoints, continue to use the fwnode
> > > related to the device. This includes e.g. lens devices.
> > >
> > > Depends-on: ("pxa-camera: Match with device node, not the port node")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
> > >  drivers/media/platform/atmel/atmel-isc.c      |  2 +-
> > >  drivers/media/platform/atmel/atmel-isi.c      |  2 +-
> > >  drivers/media/platform/cadence/cdns-csi2rx.c  |  2 +-
> > >  drivers/media/platform/davinci/vpif_capture.c | 20 +++++++++++++++-----
> > >  drivers/media/platform/exynos4-is/media-dev.c | 14 ++++++++++----
> > >  drivers/media/platform/pxa_camera.c           |  2 +-
> > >  drivers/media/platform/qcom/camss/camss.c     | 10 +++++-----
> > >  drivers/media/platform/rcar_drif.c            |  2 +-
> > >  drivers/media/platform/renesas-ceu.c          |  2 +-
> > >  drivers/media/platform/stm32/stm32-dcmi.c     |  2 +-
> > >  drivers/media/platform/ti-vpe/cal.c           |  2 +-
> > >  drivers/media/platform/xilinx/xilinx-vipp.c   | 13 ++++++++++---
> > >  drivers/media/v4l2-core/v4l2-async.c          |  9 +++++++--
> > >  drivers/media/v4l2-core/v4l2-fwnode.c         |  8 +++-----
> > >  drivers/staging/media/soc_camera/soc_camera.c | 14 ++++++++------
> > >  16 files changed, 67 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > > index fe7b937eb5f2..db263c0ce48e 100644
> > > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > > @@ -2495,7 +2495,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
> > >  		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> > >  			sdinfo->vpfe_param.vdpol = 1;
> > >
> > > -		rem = of_graph_get_remote_port_parent(endpoint);
> > > +		rem = of_graph_get_remote_endpoint(endpoint);
> > >  		if (!rem) {
> > >  			dev_err(dev, "Remote device at %pOF not found\n",
> > >  				endpoint);
> > > diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platform/atmel/atmel-isc.c
> > > index da3b441e7961..fad10e6d5ecf 100644
> > > --- a/drivers/media/platform/atmel/atmel-isc.c
> > > +++ b/drivers/media/platform/atmel/atmel-isc.c
> > > @@ -2352,7 +2352,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
> > >  		if (!epn)
> > >  			return 0;
> > >
> > > -		rem = of_graph_get_remote_port_parent(epn);
> > > +		rem = of_graph_get_remote_endpoint(epn);
> > >  		if (!rem) {
> > >  			dev_notice(dev, "Remote device at %pOF not found\n",
> > >  				   epn);
> > > diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> > > index 08b8d5583080..e4e74454e016 100644
> > > --- a/drivers/media/platform/atmel/atmel-isi.c
> > > +++ b/drivers/media/platform/atmel/atmel-isi.c
> > > @@ -1110,7 +1110,7 @@ static int isi_graph_parse(struct atmel_isi *isi, struct device_node *node)
> > >  	if (!ep)
> > >  		return -EINVAL;
> > >
> > > -	remote = of_graph_get_remote_port_parent(ep);
> > > +	remote = of_graph_get_remote_endpoint(ep);
> > >  	of_node_put(ep);
> > >  	if (!remote)
> > >  		return -EINVAL;
> > > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> > > index 31ace114eda1..2da34b93e8f4 100644
> > > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > > @@ -395,7 +395,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
> > >  		return -EINVAL;
> > >  	}
> > >
> > > -	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
> > > +	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_endpoint(fwh);
> > >  	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> > >  	of_node_put(ep);
> > >
> > > diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> > > index 72bdb3c10962..8fdea45ae090 100644
> > > --- a/drivers/media/platform/davinci/vpif_capture.c
> > > +++ b/drivers/media/platform/davinci/vpif_capture.c
> > > @@ -1542,7 +1542,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> > >
> > >  	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
> > >  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> > > -		struct device_node *rem;
> > > +		struct device_node *rem, *rem_ep;
> > >  		unsigned int flags;
> > >  		int err;
> > >
> > > @@ -1551,13 +1551,22 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> > >  		if (!endpoint)
> > >  			break;
> > >
> > > -		rem = of_graph_get_remote_port_parent(endpoint);
> > > -		if (!rem) {
> > > -			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
> > > +		rem_ep = of_graph_get_remote_endpoint(endpoint);
> > > +		if (!rem_ep) {
> > > +			dev_dbg(&pdev->dev, "Remote for endpoint %pOF not found\n",
> > >  				endpoint);
> > >  			goto done;
> > >  		}
> > >
> > > +		rem = of_graph_get_port_parent(rem_ep);
> > > +		if (!rem) {
> > > +			dev_dbg(&pdev->dev, "Remote endpoint at %pOF not found\n",
> > > +				rem_ep);
> > > +			of_node_put(rem_ep);
> > > +			goto done;
> > > +		}
> > > +		of_node_put(rem_ep);
> > > +
> > >  		sdinfo = &pdata->subdev_info[i];
> > >  		chan = &pdata->chan_config[i];
> > >  		chan->inputs = devm_kcalloc(&pdev->dev,
> > > @@ -1597,12 +1606,13 @@ vpif_capture_get_pdata(struct platform_device *pdev)
> > >  		sdinfo->name = rem->full_name;
> > >
> > >  		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
> > > -			&vpif_obj.notifier, of_fwnode_handle(rem),
> > > +			&vpif_obj.notifier, of_fwnode_handle(rem_ep),
> > >  			sizeof(struct v4l2_async_subdev));
> > >  		if (IS_ERR(pdata->asd[i])) {
> > >  			of_node_put(rem);
> > >  			goto err_cleanup;
> > >  		}
> > > +
> > >  	}
> > >
> > >  done:
> > > diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> > > index d1d5041cdae5..0cbc2076b94d 100644
> > > --- a/drivers/media/platform/exynos4-is/media-dev.c
> > > +++ b/drivers/media/platform/exynos4-is/media-dev.c
> > > @@ -411,7 +411,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
> > >
> > >  	pd->mux_id = (endpoint.base.port - 1) & 0x1;
> > >
> > > -	rem = of_graph_get_remote_port_parent(ep);
> > > +	rem = of_graph_get_remote_endpoint(ep);
> > >  	of_node_put(ep);
> > >  	if (rem == NULL) {
> > >  		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
> > > @@ -1376,11 +1376,17 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> > >  	int i;
> > >
> > >  	/* Find platform data for this sensor subdev */
> > > -	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
> > > -		if (fmd->sensor[i].asd.match.fwnode ==
> > > -		    of_fwnode_handle(subdev->dev->of_node))
> > > +	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++) {
> > > +		struct fwnode_handle *fwnode =
> > > +			fwnode_graph_get_remote_port_parent(fmd->sensor[i].asd.
> > > +							    match.fwnode);
> > > +
> > > +		if (fwnode == of_fwnode_handle(subdev->dev->of_node))
> > >  			si = &fmd->sensor[i];
> > >
> > > +		fwnode_handle_put(fwnode);
> > > +	}
> > > +
> > >  	if (si == NULL)
> > >  		return -EINVAL;
> > >
> > > diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
> > > index a7b2b89d6155..0aeba52aee13 100644
> > > --- a/drivers/media/platform/pxa_camera.c
> > > +++ b/drivers/media/platform/pxa_camera.c
> > > @@ -2350,7 +2350,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
> > >  		pcdev->platform_flags |= PXA_CAMERA_PCLK_EN;
> > >
> > >  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > > -	remote = of_graph_get_remote_port_parent(np);
> > > +	remote = of_graph_get_remote_endpoint(np);
> > >  	if (remote)
> > >  		asd->match.fwnode = of_fwnode_handle(remote);
> > >  	else
> > > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > > index 63da18773d24..a979f210f441 100644
> > > --- a/drivers/media/platform/qcom/camss/camss.c
> > > +++ b/drivers/media/platform/qcom/camss/camss.c
> > > @@ -466,7 +466,7 @@ static int camss_of_parse_ports(struct camss *camss)
> > >  {
> > >  	struct device *dev = camss->dev;
> > >  	struct device_node *node = NULL;
> > > -	struct device_node *remote = NULL;
> > > +	struct fwnode_handle *remote = NULL;
> > >  	int ret, num_subdevs = 0;
> > >
> > >  	for_each_endpoint_of_node(dev->of_node, node) {
> > > @@ -476,7 +476,8 @@ static int camss_of_parse_ports(struct camss *camss)
> > >  		if (!of_device_is_available(node))
> > >  			continue;
> > >
> > > -		remote = of_graph_get_remote_port_parent(node);
> > > +		remote = fwnode_graph_get_remote_endpoint(
> > > +			of_fwnode_handle(node));
> > >  		if (!remote) {
> > >  			dev_err(dev, "Cannot get remote parent\n");
> > >  			ret = -EINVAL;
> > > @@ -484,11 +485,10 @@ static int camss_of_parse_ports(struct camss *camss)
> > >  		}
> > >
> > >  		asd = v4l2_async_notifier_add_fwnode_subdev(
> > > -			&camss->notifier, of_fwnode_handle(remote),
> > > -			sizeof(*csd));
> > > +			&camss->notifier, remote, sizeof(*csd));
> > >  		if (IS_ERR(asd)) {
> > >  			ret = PTR_ERR(asd);
> > > -			of_node_put(remote);
> > > +			fwnode_handle_put(remote);
> > >  			goto err_cleanup;
> > >  		}
> > >
> > > diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> > > index 608e5217ccd5..258e14c290e8 100644
> > > --- a/drivers/media/platform/rcar_drif.c
> > > +++ b/drivers/media/platform/rcar_drif.c
> > > @@ -1222,7 +1222,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
> > >  	if (!ep)
> > >  		return 0;
> > >
> > > -	fwnode = fwnode_graph_get_remote_port_parent(ep);
> > > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > >  	if (!fwnode) {
> > >  		dev_warn(sdr->dev, "bad remote port parent\n");
> > >  		fwnode_handle_put(ep);
> > > diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> > > index 57d0c0f9fa4b..1e625d560258 100644
> > > --- a/drivers/media/platform/renesas-ceu.c
> > > +++ b/drivers/media/platform/renesas-ceu.c
> > > @@ -1581,7 +1581,7 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
> > >  		ceu_sd = &ceudev->subdevs[i];
> > >  		INIT_LIST_HEAD(&ceu_sd->asd.list);
> > >
> > > -		remote = of_graph_get_remote_port_parent(ep);
> > > +		remote = of_graph_get_remote_endpoint(ep);
> > >  		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
> > >  		ceu_sd->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> > >  		ceu_sd->asd.match.fwnode = of_fwnode_handle(remote);
> > > diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> > > index d855e9c09c08..3c91fe84e0d5 100644
> > > --- a/drivers/media/platform/stm32/stm32-dcmi.c
> > > +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> > > @@ -1602,7 +1602,7 @@ static int dcmi_graph_parse(struct stm32_dcmi *dcmi, struct device_node *node)
> > >  	if (!ep)
> > >  		return -EINVAL;
> > >
> > > -	remote = of_graph_get_remote_port_parent(ep);
> > > +	remote = of_graph_get_remote_endpoint(ep);
> > >  	of_node_put(ep);
> > >  	if (!remote)
> > >  		return -EINVAL;
> > > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > > index 8d075683e448..d7995e2f4c54 100644
> > > --- a/drivers/media/platform/ti-vpe/cal.c
> > > +++ b/drivers/media/platform/ti-vpe/cal.c
> > > @@ -1693,7 +1693,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
> > >  		goto cleanup_exit;
> > >  	}
> > >
> > > -	sensor_node = of_graph_get_remote_port_parent(ep_node);
> > > +	sensor_node = of_graph_get_remote_endpoint(ep_node);
> > >  	if (!sensor_node) {
> > >  		ctx_dbg(3, ctx, "can't get remote parent\n");
> > >  		goto cleanup_exit;
> > > diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> > > index edce0402155d..41df417153bd 100644
> > > --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> > > +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/of_graph.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > >  #include <linux/slab.h>
> > >
> > >  #include <media/v4l2-async.h>
> > > @@ -81,6 +82,8 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
> > >  	dev_dbg(xdev->dev, "creating links for entity %s\n", local->name);
> > >
> > >  	while (1) {
> > > +		struct fwnode_handle *fwnode;
> > > +
> > >  		/* Get the next endpoint and parse its link. */
> > >  		ep = fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
> > >  						    ep);
> > > @@ -116,11 +119,13 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
> > >  			continue;
> > >  		}
> > >
> > > +		fwnode = fwnode_graph_get_port_parent(link.remote_node);
> > > +		fwnode_handle_put(fwnode);
> > > +
> > >  		/* Skip DMA engines, they will be processed separately. */
> > > -		if (link.remote_node == of_fwnode_handle(xdev->dev->of_node)) {
> > > +		if (fwnode == dev_fwnode(xdev->dev)) {
> > >  			dev_dbg(xdev->dev, "skipping DMA port %p:%u\n",
> > >  				link.local_node, link.local_port);
> > > -			v4l2_fwnode_put_link(&link);
> > >  			continue;
> > >  		}
> > >
> > > @@ -374,9 +379,11 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
> > >  		}
> > >
> > >  		fwnode_handle_put(ep);
> > > +		fwnode = fwnode_graph_get_port_parent(remote);
> > > +		fwnode_handle_put(fwnode);
> > >
> > >  		/* Skip entities that we have already processed. */
> > > -		if (remote == of_fwnode_handle(xdev->dev->of_node) ||
> > > +		if (fwnode == dev_fwnode(xdev->dev) ||
> > >  		    xvip_graph_find_entity(xdev, remote)) {
> > >  			fwnode_handle_put(remote);
> > >  			continue;
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 15b0c44a76e7..304969ff3191 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -670,8 +670,13 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> > >  	 * (struct v4l2_subdev.dev), and async sub-device does not
> > >  	 * exist independently of the device at any point of time.
> > >  	 */
> > > -	if (!sd->fwnode && sd->dev)
> > > -		sd->fwnode = dev_fwnode(sd->dev);
> > > +	if (!sd->fwnode && sd->dev) {
> > > +		sd->fwnode = fwnode_graph_get_next_endpoint(
> > > +			dev_fwnode(sd->dev), NULL);
> > > +		fwnode_handle_put(sd->fwnode);
> > > +		if (!sd->fwnode)
> > > +			sd->fwnode = dev_fwnode(sd->dev);
> > > +	}
> > >
> > >  	mutex_lock(&list_lock);
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index dea8917fd912..810b6584b522 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -617,7 +617,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> > >
> > >  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > >  	asd->match.fwnode =
> > > -		fwnode_graph_get_remote_port_parent(endpoint);
> > > +		fwnode_graph_get_remote_endpoint(endpoint);
> > >  	if (!asd->match.fwnode) {
> > >  		dev_dbg(dev, "no remote endpoint found\n");
> > >  		ret = -ENOTCONN;
> > > @@ -1051,7 +1051,6 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
> > >  {
> > >  	struct fwnode_handle *fwnode;
> > >  	unsigned int index;
> > > -	int ret;
> > >  	const char *prop = p->name;
> > >  	const char * const *props = p->props;
> > >  	unsigned int nprops = p->nprops;
> > > @@ -1087,9 +1086,8 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
> > >  		asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
> > >  							    sizeof(*asd));
> > >  		if (IS_ERR(asd)) {
> > > -			ret = PTR_ERR(asd);
> > >  			/* not an error if asd already exists */
> > > -			if (ret == -EEXIST) {
> > > +			if (PTR_ERR(asd) == -EEXIST) {
> > >  				fwnode_handle_put(fwnode);
> > >  				continue;
> > >  			}
> > > @@ -1102,7 +1100,7 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
> > >
> > >  error:
> > >  	fwnode_handle_put(fwnode);
> > > -	return ret;
> > > +	return PTR_ERR(fwnode);
> > >  }
> > >
> > >  int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
> > > diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
> > > index a6232dcd59bc..f0768b469fc2 100644
> > > --- a/drivers/staging/media/soc_camera/soc_camera.c
> > > +++ b/drivers/staging/media/soc_camera/soc_camera.c
> > > @@ -1514,6 +1514,7 @@ static int soc_of_bind(struct soc_camera_host *ici,
> > >  	struct soc_camera_async_client *sasc;
> > >  	struct soc_of_info *info;
> > >  	struct i2c_client *client;
> > > +	struct device_node *np;
> > >  	char clk_name[V4L2_CLK_NAME_SIZE];
> > >  	int ret;
> > >
> > > @@ -1548,23 +1549,23 @@ static int soc_of_bind(struct soc_camera_host *ici,
> > >  	v4l2_async_notifier_init(&sasc->notifier);
> > >
> > >  	ret = v4l2_async_notifier_add_subdev(&sasc->notifier, info->subdev);
> > > -	if (ret) {
> > > -		of_node_put(remote);
> > > +	if (ret)
> > >  		goto eaddasd;
> > > -	}
> > >
> > >  	sasc->notifier.ops = &soc_camera_async_ops;
> > >
> > >  	icd->sasc = sasc;
> > >  	icd->parent = ici->v4l2_dev.dev;
> > > +	np = of_graph_get_port_parent(remote);
> > > +	of_node_put(remote);
> > >
> > > -	client = of_find_i2c_device_by_node(remote);
> > > +	client = of_find_i2c_device_by_node(np);
> > >
> > >  	if (client)
> > >  		v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
> > >  				  client->adapter->nr, client->addr);
> > >  	else
> > > -		v4l2_clk_name_of(clk_name, sizeof(clk_name), remote);
> > > +		v4l2_clk_name_of(clk_name, sizeof(clk_name), np);
> > >
> > >  	icd->clk = v4l2_clk_register(&soc_camera_clk_ops, clk_name, icd);
> > >  	if (IS_ERR(icd->clk)) {
> > > @@ -1587,6 +1588,7 @@ static int soc_of_bind(struct soc_camera_host *ici,
> > >  eallocpdev:
> > >  	devm_kfree(ici->v4l2_dev.dev, info);
> > >  	dev_err(ici->v4l2_dev.dev, "group probe failed: %d\n", ret);
> > > +	of_node_put(np);
> > >
> > >  	return ret;
> > >  }
> > > @@ -1603,7 +1605,7 @@ static void scan_of_host(struct soc_camera_host *ici)
> > >  		if (!epn)
> > >  			break;
> > >
> > > -		rem = of_graph_get_remote_port_parent(epn);
> > > +		rem = of_graph_get_remote_endpoint(epn);
> > >  		if (!rem) {
> > >  			dev_notice(dev, "no remote for %pOF\n", epn);
> > >  			continue;
> > > --
> > > 2.11.0
> > >
> >
> > --
> > Regards,
> > Niklas S�derlund



-- 
Regards,
Niklas S�derlund
