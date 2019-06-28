Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1B059995
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 13:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfF1L5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 07:57:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:64478 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbfF1L5q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 07:57:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jun 2019 04:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; 
   d="scan'208";a="246147293"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001.jf.intel.com with ESMTP; 28 Jun 2019 04:57:42 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DA4522071F; Fri, 28 Jun 2019 14:57:42 +0300 (EEST)
Date:   Fri, 28 Jun 2019 14:57:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 9/9] ipu3-cio2: Parse information from firmware
 without using callbacks
Message-ID: <20190628115742.iw3v2kh4crvquitf@paasikivi.fi.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-10-sakari.ailus@linux.intel.com>
 <20190614163142.uoj6bg27js5gks3w@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614163142.uoj6bg27js5gks3w@uno.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Jun 14, 2019 at 06:31:42PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Thu, Jun 06, 2019 at 04:02:25PM +0300, Sakari Ailus wrote:
> > Instead of using the convenience function
> > v4l2_async_notifier_parse_fwnode_endpoints(), parse the endpoints and set
> > up the async sub-devices without using callbacks. While this adds a little
> > bit of code, it makes parsing the endpoints quite a bit more simple and
> > gives more control to the driver over the process. The parsing assumes
> > D-PHY instead of letting the V4L2 fwnode framework guess it.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 92 +++++++++++++++++---------------
> >  1 file changed, 49 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index 690d3bd08ddd..40e8b8617f55 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -1475,36 +1475,51 @@ static const struct v4l2_async_notifier_operations cio2_async_ops = {
> >  	.complete = cio2_notifier_complete,
> >  };
> >
> > -static int cio2_fwnode_parse(struct device *dev,
> > -			     struct v4l2_fwnode_endpoint *vep,
> > -			     struct v4l2_async_subdev *asd)
> > +static int cio2_parse_firmware(struct cio2_device *cio2)
> >  {
> > -	struct sensor_async_subdev *s_asd =
> > -			container_of(asd, struct sensor_async_subdev, asd);
> > +	unsigned int i;
> > +	int ret;
> >
> > -	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
> > -		dev_err(dev, "Only CSI2 bus type is currently supported\n");
> > -		return -EINVAL;
> > -	}
> > +	for (i = 0; i < CIO2_NUM_PORTS; i++) {
> > +		struct v4l2_fwnode_endpoint vep = {
> > +			.bus_type = V4L2_MBUS_CSI2_DPHY
> > +		};
> > +		struct sensor_async_subdev *s_asd = NULL;
> > +		struct fwnode_handle *ep;
> >
> > -	s_asd->csi2.port = vep->base.port;
> > -	s_asd->csi2.lanes = vep->bus.mipi_csi2.num_data_lanes;
> > +		ep = fwnode_graph_get_endpoint_by_id(
> > +			dev_fwnode(&cio2->pci_dev->dev), i, 0,
> > +			FWNODE_GRAPH_ENDPOINT_NEXT);
> >
> > -	return 0;
> > -}
> > +		if (!ep)
> > +			continue;
> >
> > -static int cio2_notifier_init(struct cio2_device *cio2)
> > -{
> > -	int ret;
> > +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > +		if (ret)
> > +			goto err_parse;
> >
> > -	v4l2_async_notifier_init(&cio2->notifier);
> > +		s_asd = kzalloc(sizeof(*s_asd), GFP_KERNEL);
> > +		if (!s_asd) {
> > +			ret = -ENOMEM;
> > +			goto err_parse;
> > +		}
> >
> > -	ret = v4l2_async_notifier_parse_fwnode_endpoints(
> 
> How would you feel trying to remove this function completely? There
> are only 2 users mainline (rcar-vin and sunxi) and this is 'yet
> another way to parse an endpoint and add it to a notifier async list'.
> 
> I would say, stabilizing on the use of one of the three
> v4l2_async_notifier_add_ versions could be desirable...

I agree. The reason I didn't do it in this patchset is that I have no
hardware to test. I'd like to get in what I can test first.

> 
> > -		&cio2->pci_dev->dev, &cio2->notifier,
> > -		sizeof(struct sensor_async_subdev),
> > -		cio2_fwnode_parse);
> > -	if (ret < 0)
> > -		goto out;
> > +		s_asd->csi2.port = vep.base.port;
> > +		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
> > +
> > +		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +			&cio2->notifier, ep, &s_asd->asd);
> > +		fwnode_handle_put(ep);
> > +		if (ret)
> > +			goto err_parse;
> > +
> > +		continue;
> > +
> > +err_parse:
> > +		fwnode_handle_put(ep);
> 
> Won't the notifier cleanup put this device node for us?

There was an error so no. But we already did so before checking for the
error. Good catch! ;)

> 
> This apart, for the patch itself:
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks
>   j
> 
> > +		kfree(s_asd);
> > +		return ret;
> > +	}
> >
> >  	/*
> >  	 * Proceed even without sensors connected to allow the device to
> > @@ -1512,25 +1527,13 @@ static int cio2_notifier_init(struct cio2_device *cio2)
> >  	 */
> >  	cio2->notifier.ops = &cio2_async_ops;
> >  	ret = v4l2_async_notifier_register(&cio2->v4l2_dev, &cio2->notifier);
> > -	if (ret) {
> > +	if (ret)
> >  		dev_err(&cio2->pci_dev->dev,
> >  			"failed to register async notifier : %d\n", ret);
> > -		goto out;
> > -	}
> > -
> > -out:
> > -	if (ret)
> > -		v4l2_async_notifier_cleanup(&cio2->notifier);
> >
> >  	return ret;
> >  }
> >
> > -static void cio2_notifier_exit(struct cio2_device *cio2)
> > -{
> > -	v4l2_async_notifier_unregister(&cio2->notifier);
> > -	v4l2_async_notifier_cleanup(&cio2->notifier);
> > -}
> > -
> >  /**************** Queue initialization ****************/
> >  static const struct media_entity_operations cio2_media_ops = {
> >  	.link_validate = v4l2_subdev_link_validate,
> > @@ -1814,16 +1817,18 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >  	if (r)
> >  		goto fail_v4l2_device_unregister;
> >
> > +	v4l2_async_notifier_init(&cio2->notifier);
> > +
> >  	/* Register notifier for subdevices we care */
> > -	r = cio2_notifier_init(cio2);
> > +	r = cio2_parse_firmware(cio2);
> >  	if (r)
> > -		goto fail_cio2_queue_exit;
> > +		goto fail_clean_notifier;
> >
> >  	r = devm_request_irq(&pci_dev->dev, pci_dev->irq, cio2_irq,
> >  			     IRQF_SHARED, CIO2_NAME, cio2);
> >  	if (r) {
> >  		dev_err(&pci_dev->dev, "failed to request IRQ (%d)\n", r);
> > -		goto fail;
> > +		goto fail_clean_notifier;
> >  	}
> >
> >  	pm_runtime_put_noidle(&pci_dev->dev);
> > @@ -1831,9 +1836,9 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
> >
> >  	return 0;
> >
> > -fail:
> > -	cio2_notifier_exit(cio2);
> > -fail_cio2_queue_exit:
> > +fail_clean_notifier:
> > +	v4l2_async_notifier_unregister(&cio2->notifier);
> > +	v4l2_async_notifier_cleanup(&cio2->notifier);
> >  	cio2_queues_exit(cio2);
> >  fail_v4l2_device_unregister:
> >  	v4l2_device_unregister(&cio2->v4l2_dev);
> > @@ -1852,7 +1857,8 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
> >  	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
> >
> >  	media_device_unregister(&cio2->media_dev);
> > -	cio2_notifier_exit(cio2);
> > +	v4l2_async_notifier_unregister(&cio2->notifier);
> > +	v4l2_async_notifier_cleanup(&cio2->notifier);
> >  	cio2_queues_exit(cio2);
> >  	cio2_fbpt_exit_dummy(cio2);
> >  	v4l2_device_unregister(&cio2->v4l2_dev);
> > --
> > 2.11.0
> >



-- 
Sakari Ailus
sakari.ailus@linux.intel.com
