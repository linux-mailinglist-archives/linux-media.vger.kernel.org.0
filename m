Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1762F4473C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389149AbfFMQ6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:58:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40843 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbfFMAwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 20:52:38 -0400
Received: by mail-lf1-f68.google.com with SMTP id a9so13631103lff.7
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 17:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lr+rbduwpLX2cx/nTtPo/LUTeBAAXgYd3rqeqac2hQs=;
        b=uuZJQgphF5Sj5iyF/hX42c2Do2uMfJCuHch+NikB2DxKWkUdyNncU4GSHsZLsR9PrS
         Xgz7VsBca4GOuID3Ap+OBJcK7uQ0YyzXr7yJAIaXc9OYW7Yh0XPPSHmVSo72FuyCzziF
         oRMza+EN1GDIEgfeB/lBPrkJxJn8mBXzZszFoEH40W/Tkn3Xs4vY3TwtKCE0qbCNvGdS
         jKA/ZPU6TjbktH2MldEjQQyVBJfzOMcMlK2oduhyeQ8l2KixIy5kc5358wmL8rtsQwtA
         RSRJmH6RtjI5mfwkxVhsXeVnAQRSiUIO2Bi/n0bZaN6jiktUaeCXvKSwBF3Z0pBLBfbb
         RfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lr+rbduwpLX2cx/nTtPo/LUTeBAAXgYd3rqeqac2hQs=;
        b=U4MMf0crc3uBZ83HnCo82YV1tiZ0rDo72yxDDET4B10ZrTL2DXAUk86XgH5xdPQXp8
         6bu6vJcgxrNeaP930l0CQsZWuHP+dnHtYVuiWQcydTpiyAL44cF/DRNgyQ+KjszFB9qS
         U+z3Do5wwGRtX+DaEEhjROPPyN/AnGBBI2H+Z5KArwuN3zfHiYkEz6eAO0IcRFQiviVE
         EHzm5QNqjPZTmctQn8dYNDJtbjtClZTBkJ5RJD45+KwjWBRATDvvSNFkw/ju3phrM7Hk
         yxvgY2px5dMb50N3H6wD9hzXZ3QDdsWfxTiWCYWS4ygCHzRRbEaPWK2uhsqx6o3pud8R
         n5bQ==
X-Gm-Message-State: APjAAAWL/+qCWbfIAgPuDYmMpWxjdMuhlJ4JtfW9wg78HQbPw8zprM0w
        biusmnnTmPAhGwOURhiuggFt1g==
X-Google-Smtp-Source: APXvYqyyvQpfrAKQ5ZtqNA8UjfSgV94LpDpUK02RWLU2onycbWdidxoGIXxjHZYQtB4svaHw22oDng==
X-Received: by 2002:a19:4f50:: with SMTP id a16mr42246342lfk.24.1560387155159;
        Wed, 12 Jun 2019 17:52:35 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id i5sm270744lfo.55.2019.06.12.17.52.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 17:52:34 -0700 (PDT)
Date:   Thu, 13 Jun 2019 02:52:33 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/9] v4l2-async: Use endpoint node, not device node, for
 fwnode match
Message-ID: <20190613005233.GA20196@bigcity.dyn.berto.se>
References: <20190405094127.18975-1-sakari.ailus@linux.intel.com>
 <20190405094127.18975-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190405094127.18975-4-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your work.

On 2019-04-05 12:41:20 +0300, Sakari Ailus wrote:
> V4L2 async framework can use both device's fwnode and endpoints's fwnode
> for matching the async sub-device with the sub-device. In order to proceed
> moving towards endpoint matching assign the endpoint to the async
> sub-device.
> 
> As most async sub-device drivers (and the related hardware) only supports
> a single endpoint, use the first endpoint found. This works for all
> current drivers --- we only ever supported a single async sub-device per
> device to begin with.

Unfortunately this breaks for rcar-vin and adv7604 on Koelsch :-(

In DT we have the node:

i2chdmi: i2c-13 {
    hdmi-in@4c {
	    compatible = "adi,adv7612";

	    ports {
		    #address-cells = <1>;
		    #size-cells = <0>;

		    port@0 {
			    reg = <0>;
			    adv7612_in: endpoint {
				    remote-endpoint = <&hdmi_con_in>;
			    };
		    };

		    port@2 {
			    reg = <2>;
			    adv7612_out: endpoint {
				    remote-endpoint = <&vin0ep2>;
			    };
		    };
	    };
    };
};

- The rcar-vin in rvin_parallel_init() parses the DT using the 
  v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper and 
  registers '/i2c-13/hdmi-in@4c/ports/port@2/endpoint' with the async 
  framework.

- The adv7604 register itself with async using 
  '/i2c-13/hdmi-in@4c/ports/port@0/endpoint'.

The result is that matching breaks and the two devices never find each 
other. I'm not sure how to solve this :-( Maybe the subdevices could 
register itself multiple times with the async framework, once for each 
port described?

That would open up for the same subdev to be bound multiple times, 
possibly to different consumers. I think that is a direction that would 
be useful but I fear there might be some work involved in allowing that 
from a subdev point of view.

> 
> For async devices that have no endpoints, continue to use the fwnode
> related to the device. This includes e.g. lens devices.
> 
> Depends-on: ("pxa-camera: Match with device node, not the port node")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
>  drivers/media/platform/atmel/atmel-isc.c      |  2 +-
>  drivers/media/platform/atmel/atmel-isi.c      |  2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  2 +-
>  drivers/media/platform/davinci/vpif_capture.c | 20 +++++++++++++++-----
>  drivers/media/platform/exynos4-is/media-dev.c | 14 ++++++++++----
>  drivers/media/platform/pxa_camera.c           |  2 +-
>  drivers/media/platform/qcom/camss/camss.c     | 10 +++++-----
>  drivers/media/platform/rcar_drif.c            |  2 +-
>  drivers/media/platform/renesas-ceu.c          |  2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c     |  2 +-
>  drivers/media/platform/ti-vpe/cal.c           |  2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   | 13 ++++++++++---
>  drivers/media/v4l2-core/v4l2-async.c          |  9 +++++++--
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  2 +-
>  drivers/staging/media/soc_camera/soc_camera.c | 14 ++++++++------
>  16 files changed, 65 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index fe7b937eb5f2..db263c0ce48e 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -2495,7 +2495,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>  			sdinfo->vpfe_param.vdpol = 1;
>  
> -		rem = of_graph_get_remote_port_parent(endpoint);
> +		rem = of_graph_get_remote_endpoint(endpoint);
>  		if (!rem) {
>  			dev_err(dev, "Remote device at %pOF not found\n",
>  				endpoint);
> diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platform/atmel/atmel-isc.c
> index 9a399aa7ca92..d1f1085e334e 100644
> --- a/drivers/media/platform/atmel/atmel-isc.c
> +++ b/drivers/media/platform/atmel/atmel-isc.c
> @@ -2042,7 +2042,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  		if (!epn)
>  			return 0;
>  
> -		rem = of_graph_get_remote_port_parent(epn);
> +		rem = of_graph_get_remote_endpoint(epn);
>  		if (!rem) {
>  			dev_notice(dev, "Remote device at %pOF not found\n",
>  				   epn);
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 08b8d5583080..e4e74454e016 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -1110,7 +1110,7 @@ static int isi_graph_parse(struct atmel_isi *isi, struct device_node *node)
>  	if (!ep)
>  		return -EINVAL;
>  
> -	remote = of_graph_get_remote_port_parent(ep);
> +	remote = of_graph_get_remote_endpoint(ep);
>  	of_node_put(ep);
>  	if (!remote)
>  		return -EINVAL;
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 31ace114eda1..2da34b93e8f4 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -395,7 +395,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  		return -EINVAL;
>  	}
>  
> -	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
> +	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_endpoint(fwh);
>  	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	of_node_put(ep);
>  
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index 72bdb3c10962..8fdea45ae090 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1542,7 +1542,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  
>  	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> -		struct device_node *rem;
> +		struct device_node *rem, *rem_ep;
>  		unsigned int flags;
>  		int err;
>  
> @@ -1551,13 +1551,22 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  		if (!endpoint)
>  			break;
>  
> -		rem = of_graph_get_remote_port_parent(endpoint);
> -		if (!rem) {
> -			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
> +		rem_ep = of_graph_get_remote_endpoint(endpoint);
> +		if (!rem_ep) {
> +			dev_dbg(&pdev->dev, "Remote for endpoint %pOF not found\n",
>  				endpoint);
>  			goto done;
>  		}
>  
> +		rem = of_graph_get_port_parent(rem_ep);
> +		if (!rem) {
> +			dev_dbg(&pdev->dev, "Remote endpoint at %pOF not found\n",
> +				rem_ep);
> +			of_node_put(rem_ep);
> +			goto done;
> +		}
> +		of_node_put(rem_ep);
> +
>  		sdinfo = &pdata->subdev_info[i];
>  		chan = &pdata->chan_config[i];
>  		chan->inputs = devm_kcalloc(&pdev->dev,
> @@ -1597,12 +1606,13 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  		sdinfo->name = rem->full_name;
>  
>  		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
> -			&vpif_obj.notifier, of_fwnode_handle(rem),
> +			&vpif_obj.notifier, of_fwnode_handle(rem_ep),
>  			sizeof(struct v4l2_async_subdev));
>  		if (IS_ERR(pdata->asd[i])) {
>  			of_node_put(rem);
>  			goto err_cleanup;
>  		}
> +
>  	}
>  
>  done:
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 463f2d84553e..2090a627b553 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -411,7 +411,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  
>  	pd->mux_id = (endpoint.base.port - 1) & 0x1;
>  
> -	rem = of_graph_get_remote_port_parent(ep);
> +	rem = of_graph_get_remote_endpoint(ep);
>  	of_node_put(ep);
>  	if (rem == NULL) {
>  		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
> @@ -1372,11 +1372,17 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>  	int i;
>  
>  	/* Find platform data for this sensor subdev */
> -	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
> -		if (fmd->sensor[i].asd.match.fwnode ==
> -		    of_fwnode_handle(subdev->dev->of_node))
> +	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++) {
> +		struct fwnode_handle *fwnode =
> +			fwnode_graph_get_remote_port_parent(fmd->sensor[i].asd.
> +							    match.fwnode);
> +
> +		if (fwnode == of_fwnode_handle(subdev->dev->of_node))
>  			si = &fmd->sensor[i];
>  
> +		fwnode_handle_put(fwnode);
> +	}
> +
>  	if (si == NULL)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
> index a632f06d9fff..2a1395d4f74d 100644
> --- a/drivers/media/platform/pxa_camera.c
> +++ b/drivers/media/platform/pxa_camera.c
> @@ -2350,7 +2350,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
>  		pcdev->platform_flags |= PXA_CAMERA_PCLK_EN;
>  
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	remote = of_graph_get_remote_port_parent(np);
> +	remote = of_graph_get_remote_endpoint(np);
>  	if (remote)
>  		asd->match.fwnode = of_fwnode_handle(remote);
>  	else
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 63da18773d24..a979f210f441 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -466,7 +466,7 @@ static int camss_of_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
>  	struct device_node *node = NULL;
> -	struct device_node *remote = NULL;
> +	struct fwnode_handle *remote = NULL;
>  	int ret, num_subdevs = 0;
>  
>  	for_each_endpoint_of_node(dev->of_node, node) {
> @@ -476,7 +476,8 @@ static int camss_of_parse_ports(struct camss *camss)
>  		if (!of_device_is_available(node))
>  			continue;
>  
> -		remote = of_graph_get_remote_port_parent(node);
> +		remote = fwnode_graph_get_remote_endpoint(
> +			of_fwnode_handle(node));
>  		if (!remote) {
>  			dev_err(dev, "Cannot get remote parent\n");
>  			ret = -EINVAL;
> @@ -484,11 +485,10 @@ static int camss_of_parse_ports(struct camss *camss)
>  		}
>  
>  		asd = v4l2_async_notifier_add_fwnode_subdev(
> -			&camss->notifier, of_fwnode_handle(remote),
> -			sizeof(*csd));
> +			&camss->notifier, remote, sizeof(*csd));
>  		if (IS_ERR(asd)) {
>  			ret = PTR_ERR(asd);
> -			of_node_put(remote);
> +			fwnode_handle_put(remote);
>  			goto err_cleanup;
>  		}
>  
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index 608e5217ccd5..258e14c290e8 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -1222,7 +1222,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
>  	if (!ep)
>  		return 0;
>  
> -	fwnode = fwnode_graph_get_remote_port_parent(ep);
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
>  	if (!fwnode) {
>  		dev_warn(sdr->dev, "bad remote port parent\n");
>  		fwnode_handle_put(ep);
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index 150196f7cf96..a9553bc928fa 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1581,7 +1581,7 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
>  		ceu_sd = &ceudev->subdevs[i];
>  		INIT_LIST_HEAD(&ceu_sd->asd.list);
>  
> -		remote = of_graph_get_remote_port_parent(ep);
> +		remote = of_graph_get_remote_endpoint(ep);
>  		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
>  		ceu_sd->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>  		ceu_sd->asd.match.fwnode = of_fwnode_handle(remote);
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index 098431d927ac..c5fca5a482af 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1592,7 +1592,7 @@ static int dcmi_graph_parse(struct stm32_dcmi *dcmi, struct device_node *node)
>  	if (!ep)
>  		return -EINVAL;
>  
> -	remote = of_graph_get_remote_port_parent(ep);
> +	remote = of_graph_get_remote_endpoint(ep);
>  	of_node_put(ep);
>  	if (!remote)
>  		return -EINVAL;
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 8d075683e448..d7995e2f4c54 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -1693,7 +1693,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
>  		goto cleanup_exit;
>  	}
>  
> -	sensor_node = of_graph_get_remote_port_parent(ep_node);
> +	sensor_node = of_graph_get_remote_endpoint(ep_node);
>  	if (!sensor_node) {
>  		ctx_dbg(3, ctx, "can't get remote parent\n");
>  		goto cleanup_exit;
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index edce0402155d..41df417153bd 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  #include <media/v4l2-async.h>
> @@ -81,6 +82,8 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
>  	dev_dbg(xdev->dev, "creating links for entity %s\n", local->name);
>  
>  	while (1) {
> +		struct fwnode_handle *fwnode;
> +
>  		/* Get the next endpoint and parse its link. */
>  		ep = fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
>  						    ep);
> @@ -116,11 +119,13 @@ static int xvip_graph_build_one(struct xvip_composite_device *xdev,
>  			continue;
>  		}
>  
> +		fwnode = fwnode_graph_get_port_parent(link.remote_node);
> +		fwnode_handle_put(fwnode);
> +
>  		/* Skip DMA engines, they will be processed separately. */
> -		if (link.remote_node == of_fwnode_handle(xdev->dev->of_node)) {
> +		if (fwnode == dev_fwnode(xdev->dev)) {
>  			dev_dbg(xdev->dev, "skipping DMA port %p:%u\n",
>  				link.local_node, link.local_port);
> -			v4l2_fwnode_put_link(&link);
>  			continue;
>  		}
>  
> @@ -374,9 +379,11 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
>  		}
>  
>  		fwnode_handle_put(ep);
> +		fwnode = fwnode_graph_get_port_parent(remote);
> +		fwnode_handle_put(fwnode);
>  
>  		/* Skip entities that we have already processed. */
> -		if (remote == of_fwnode_handle(xdev->dev->of_node) ||
> +		if (fwnode == dev_fwnode(xdev->dev) ||
>  		    xvip_graph_find_entity(xdev, remote)) {
>  			fwnode_handle_put(remote);
>  			continue;
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 15b0c44a76e7..304969ff3191 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -670,8 +670,13 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  	 * (struct v4l2_subdev.dev), and async sub-device does not
>  	 * exist independently of the device at any point of time.
>  	 */
> -	if (!sd->fwnode && sd->dev)
> -		sd->fwnode = dev_fwnode(sd->dev);
> +	if (!sd->fwnode && sd->dev) {
> +		sd->fwnode = fwnode_graph_get_next_endpoint(
> +			dev_fwnode(sd->dev), NULL);
> +		fwnode_handle_put(sd->fwnode);
> +		if (!sd->fwnode)
> +			sd->fwnode = dev_fwnode(sd->dev);
> +	}
>  
>  	mutex_lock(&list_lock);
>  
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index ea1ed88f9dc8..014b3f11e1ba 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -617,7 +617,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode =
> -		fwnode_graph_get_remote_port_parent(endpoint);
> +		fwnode_graph_get_remote_endpoint(endpoint);
>  	if (!asd->match.fwnode) {
>  		dev_dbg(dev, "no remote endpoint found\n");
>  		ret = -ENOTCONN;
> diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
> index 1ab86a7499b9..1b8344a2ea41 100644
> --- a/drivers/staging/media/soc_camera/soc_camera.c
> +++ b/drivers/staging/media/soc_camera/soc_camera.c
> @@ -1518,6 +1518,7 @@ static int soc_of_bind(struct soc_camera_host *ici,
>  	struct soc_camera_async_client *sasc;
>  	struct soc_of_info *info;
>  	struct i2c_client *client;
> +	struct device_node *np;
>  	char clk_name[V4L2_CLK_NAME_SIZE];
>  	int ret;
>  
> @@ -1552,23 +1553,23 @@ static int soc_of_bind(struct soc_camera_host *ici,
>  	v4l2_async_notifier_init(&sasc->notifier);
>  
>  	ret = v4l2_async_notifier_add_subdev(&sasc->notifier, info->subdev);
> -	if (ret) {
> -		of_node_put(remote);
> +	if (ret)
>  		goto eaddasd;
> -	}
>  
>  	sasc->notifier.ops = &soc_camera_async_ops;
>  
>  	icd->sasc = sasc;
>  	icd->parent = ici->v4l2_dev.dev;
> +	np = of_graph_get_port_parent(remote);
> +	of_node_put(remote);
>  
> -	client = of_find_i2c_device_by_node(remote);
> +	client = of_find_i2c_device_by_node(np);
>  
>  	if (client)
>  		v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
>  				  client->adapter->nr, client->addr);
>  	else
> -		v4l2_clk_name_of(clk_name, sizeof(clk_name), remote);
> +		v4l2_clk_name_of(clk_name, sizeof(clk_name), np);
>  
>  	icd->clk = v4l2_clk_register(&soc_camera_clk_ops, clk_name, icd);
>  	if (IS_ERR(icd->clk)) {
> @@ -1591,6 +1592,7 @@ static int soc_of_bind(struct soc_camera_host *ici,
>  eallocpdev:
>  	devm_kfree(ici->v4l2_dev.dev, info);
>  	dev_err(ici->v4l2_dev.dev, "group probe failed: %d\n", ret);
> +	of_node_put(np);
>  
>  	return ret;
>  }
> @@ -1607,7 +1609,7 @@ static void scan_of_host(struct soc_camera_host *ici)
>  		if (!epn)
>  			break;
>  
> -		rem = of_graph_get_remote_port_parent(epn);
> +		rem = of_graph_get_remote_endpoint(epn);
>  		if (!rem) {
>  			dev_notice(dev, "no remote for %pOF\n", epn);
>  			continue;
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
